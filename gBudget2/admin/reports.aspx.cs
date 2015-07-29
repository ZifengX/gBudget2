using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//model references for EF
using gBudget2.Models;
using System.Web.ModelBinding;


namespace gBudget2
{
    public partial class reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate report grid
            if (!IsPostBack)
            {
                GetReports();
            }
        }

        protected void GetReports()
        {
            using (gBudget2Entities db = new gBudget2Entities())
            {
                //query the datainfo table using EF and LINQ
                var Categories = from c in db.Categories
                                 select c;

                //bind the result to the gridview
                ddlCategoryReport.DataSource = Categories.ToList();
                ddlCategoryReport.DataBind();

                int selectedCategory = Convert.ToInt32(ddlCategoryReport.SelectedValue);

                //query the bills table using EF and LINQ
                var Datainfoes = from d in db.DataInfoes
                                 where d.CategoryID == selectedCategory
                                 select new { d.Date, d.Amount, d.Account.Account1, d.Mechant.Mechant1, d.Note };

                grdCategoryReport.DataSource = Datainfoes.ToList();
                grdCategoryReport.DataBind();


                //var Accounts = from a in db.Accounts
                //               select a;

                //ddlAccount.DataSource = Accounts.ToList();
                //ddlAccount.DataBind();

                //var Mechants = from m in db.Mechants
                //               select m;
                //ddlMechant.DataSource = Mechants.ToList();
                //ddlMechant.DataBind();
            }
        }

        protected void grdCategoryReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the new page #
            grdCategoryReport.PageIndex = e.NewPageIndex;
            GetReports();
        }

        protected void ddlCategoryReport_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategoryReport.SelectedValue = ddlCategoryReport.SelectedValue;
            GetReports();
        }
    }
}