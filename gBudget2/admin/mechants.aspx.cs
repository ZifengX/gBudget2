using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//model references for EF
using gBudget2.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;
//auth references
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace gBudget2
{
    public partial class mechants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate account grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "MechantID";
                Session["SortDirection"] = "ASC";
                GetMechants();
            }
        }

        protected void GetMechants()
        {
            var currentUserID = User.Identity.GetUserId();
            //connect to EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                //query the mechants table using EF and LINQ
                var Mechants = from m in db.Mechants
                               where m.UserID == currentUserID
                               select m;

                //bind the result to the gridview
                grdMechants.DataSource = Mechants.AsQueryable().OrderBy(SortString).ToList();
                grdMechants.DataBind();

            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set new pagesize
            grdMechants.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetMechants();
        }

        protected void grdMechants_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            Int32 selectedRow = e.RowIndex;

            //get the selected mechantID using the grid's Data Key collection
            Int32 MechantID = Convert.ToInt32(grdMechants.DataKeys[selectedRow].Values["MechantID"]);

            //use EF to remove the selected mechant from the db
            using (gBudget2Entities db = new gBudget2Entities())
            {

                Mechant m = (from objM in db.Mechants
                             where objM.MechantID == MechantID
                             select objM).FirstOrDefault();

                //do the delete
                db.Mechants.Remove(m);
                db.SaveChanges();
            }

            //refresh the grid
            GetMechants();
        }

        protected void grdMechants_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the new page #
            grdMechants.PageIndex = e.NewPageIndex;
            GetMechants();
        }

        protected void grdMechants_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;
            //reload the grid
            GetMechants();

            //toggle the direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void grdMechants_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdMechants.Columns.Count - 1; i++)
                    {
                        if (grdMechants.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "/images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "/images/asc.jpg";
                                SortImage.AlternateText = "Sort Ascending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }
            }
        }
    }
}