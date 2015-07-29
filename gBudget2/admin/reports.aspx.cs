using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//model references for EF
using gBudget2.Models;
using System.Web.ModelBinding;
//auth references
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

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
            var currentUserID = User.Identity.GetUserId();

            using (gBudget2Entities db = new gBudget2Entities())
            {
                //query the datainfo table using EF and LINQ
                var Categories = from c in db.Categories
                                 where c.UserID == currentUserID
                                 select c;

                //bind the result to the gridview
                ddlCategoryReport.DataSource = Categories.ToList();
                ddlCategoryReport.DataBind();

                if (ddlCategoryReport.SelectedValue != "") { 
                    int selectedCategory = Convert.ToInt32(ddlCategoryReport.SelectedValue);
                
                //query the bills table using EF and LINQ
                var Datainfoes = from d in db.DataInfoes
                                 where d.CategoryID == selectedCategory && d.UserID == currentUserID
                                 select new { d.Date, d.Amount, d.Account.Account1, d.Mechant.Mechant1, d.Note, d.UserID };
                
                grdCategoryReport.DataSource = Datainfoes.ToList();
                grdCategoryReport.DataBind();
                }
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