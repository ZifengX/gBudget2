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

namespace gBudget2
{
    public partial class accounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate account grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "AccountID";
                Session["SortDirection"] = "ASC";
                GetAccounts();
            }
        }

        protected void GetAccounts()
        {
            //connect to EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                //query the accounts table using EF and LINQ
                var Accounts = from a in db.Accounts
                               select a;

                //bind the result to the gridview
                grdAccounts.DataSource = Accounts.AsQueryable().OrderBy(SortString).ToList();
                grdAccounts.DataBind();

            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set new pagesize
            grdAccounts.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetAccounts();
        }


        protected void grdAccounts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            Int32 selectedRow = e.RowIndex;

            //get the selected AccountID using the grid's Data Key collection
            Int32 AccountID = Convert.ToInt32(grdAccounts.DataKeys[selectedRow].Values["AccountID"]);

            //use EF to remove the selected account from the db
            using (gBudget2Entities db = new gBudget2Entities())
            {

                Account a = (from objA in db.Accounts
                             where objA.AccountID == AccountID
                             select objA).FirstOrDefault();

                //do the delete
                db.Accounts.Remove(a);
                db.SaveChanges();
            }

            //refresh the grid
            GetAccounts();
        }

        
        protected void grdAccounts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the new page #
            grdAccounts.PageIndex = e.NewPageIndex;
            GetAccounts();
        }

        protected void grdAccounts_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;
            //reload the grid
            GetAccounts();

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

        protected void grdAccounts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdAccounts.Columns.Count - 1; i++)
                    {
                        if (grdAccounts.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "images/asc.jpg";
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