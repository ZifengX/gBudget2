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
    public partial class bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate course grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "DatainfoID";
                Session["SortDirection"] = "ASC";
                GetBills();
            }
        }

        protected void GetBills()
        {
            var currentUserID = User.Identity.GetUserId();
            //connect to EF
            using (gBudget2Entities db = new gBudget2Entities())
            {

                //query the bills table using EF and LINQ
                var Datainfoes = from d in db.DataInfoes 
                                 where d.UserID == currentUserID
                              select new { d.DatainfoID, d.Date, d.Amount, d.Category.Category1, d.Account.Account1, d.Mechant.Mechant1, d.Note, d.UserID };
                
                //bind the result to the gridview, pass session
                String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
              
                grdBills.DataSource = Datainfoes.AsQueryable().OrderBy(SortString).ToList();
                grdBills.DataBind();

            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set new page size
            grdBills.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetBills();
        }

        protected void grdBills_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            Int32 selectedRow = e.RowIndex;

            //get the selected datainfoid using the grid's Data Key collection
            Int32 DatainfoID = Convert.ToInt32(grdBills.DataKeys[selectedRow].Values["DatainfoID"]);

            //use EF to remove the selected bill from the db
            using (gBudget2Entities db = new gBudget2Entities())
            {

                DataInfo d = (from objD in db.DataInfoes
                            where objD.DatainfoID == DatainfoID
                            select objD).FirstOrDefault();

                //do the delete
                db.DataInfoes.Remove(d);
                db.SaveChanges();
            }

            //refresh the grid
            GetBills();
        }

        protected void grdBills_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the new page #
            grdBills.PageIndex = e.NewPageIndex;
            GetBills();
        }

        protected void grdBills_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;
            //reload the grid
            GetBills();

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

        protected void grdBills_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdBills.Columns.Count - 1; i++)
                    {
                        if (grdBills.Columns[i].SortExpression == Session["SortColumn"].ToString())
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