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
    public partial class categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate category grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "CategoryID";
                Session["SortDirection"] = "ASC";
                GetCategories();
            }
        }

        protected void GetCategories()
        {
            //connect to EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                //query the categories table using EF and LINQ
                var Categories = from c in db.Categories
                               select c;

                //bind the result to the gridview
                grdCategories.DataSource = Categories.AsQueryable().OrderBy(SortString).ToList();
                grdCategories.DataBind();

            }
        }

        protected void grdCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            Int32 selectedRow = e.RowIndex;

            //get the selected categoryid using the grid's Data Key collection
            Int32 CategoryID = Convert.ToInt32(grdCategories.DataKeys[selectedRow].Values["CategoryID"]);

            //use EF to remove the selected account from the db
            using (gBudget2Entities db = new gBudget2Entities())
            {

                Category c = (from objC in db.Categories
                             where objC.CategoryID == CategoryID
                             select objC).FirstOrDefault();

                //do the delete
                db.Categories.Remove(c);
                db.SaveChanges();
            }

            //refresh the grid
            GetCategories();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set new pagesize
            grdCategories.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetCategories();
        }

        protected void grdCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the new page #
            grdCategories.PageIndex = e.NewPageIndex;
            GetCategories();
        }

        protected void grdCategories_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;
            //reload the grid
            GetCategories();

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

        protected void grdCategories_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdCategories.Columns.Count - 1; i++)
                    {
                        if (grdCategories.Columns[i].SortExpression == Session["SortColumn"].ToString())
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