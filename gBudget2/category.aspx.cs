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
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a StudentID in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetCategory();
            }
        }

        protected void GetCategory()
        {
            //populate form with existing category record
            Int32 CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);

            //connect to db via EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                //populate a category instance with the CategoryID from the URL parameter
                Category c = (from objC in db.Categories
                             where objC.CategoryID == CategoryID
                             select objC).FirstOrDefault();

                //map the account properties to the form controls if we found a match
                if (c != null)
                {
                    txtCategory.Text = c.Category1;
                }

                ////enrollments - this code goes in the same method that populates the student form but below the existing code that's already in GetStudent()               
                //var objE = (from en in db.Enrollments
                //            join c in db.Courses on en.CourseID equals c.CourseID
                //            join d in db.Departments on c.DepartmentID equals d.DepartmentID
                //            where en.StudentID == StudentID
                //            select new { en.EnrollmentID, en.Grade, c.Title, d.Name });

                //grdCourses.DataSource = objE.ToList();
                //grdCourses.DataBind();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //use EF to connect to SQL Server
            using (gBudget2Entities db = new gBudget2Entities())
            {

                //use the category model to save the new record
                Category c = new Category();
                Int32 CategoryID = 0;

                //check the querystring for an id so we can determine add / update
                if (Request.QueryString["CategoryID"] != null)
                {
                    //get the id from the url
                    CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);

                    //get the current category from EF
                    c = (from objC in db.Categories
                         where objC.CategoryID == CategoryID
                         select objC).FirstOrDefault();
                }

                c.Category1 = txtCategory.Text;


                //call add only if we have no category ID
                if (CategoryID == 0)
                {
                    db.Categories.Add(c);
                }

                //run the update or insert
                db.SaveChanges();

                //redirect to the updated accounts page
                Response.Redirect("categories.aspx");
            }
        }
    }
}