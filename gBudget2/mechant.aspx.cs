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
    public partial class mechant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a mechantid in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetMechant();
            }
        }

        protected void GetMechant()
        {
            //populate form with existing mechant record
            Int32 MechantID = Convert.ToInt32(Request.QueryString["MechantID"]);

            //connect to db via EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                //populate a account instance with the AccountID from the URL parameter
                Mechant m = (from objM in db.Mechants
                             where objM.MechantID == MechantID
                             select objM).FirstOrDefault();

                //map the account properties to the form controls if we found a match
                if (m != null)
                {
                    txtMechant.Text = m.Mechant1;
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

                //use the mechant model to save the new record
                Mechant m = new Mechant();
                Int32 MechantID = 0;

                //check the querystring for an id so we can determine add / update
                if (Request.QueryString["MechantID"] != null)
                {
                    //get the id from the url
                    MechantID = Convert.ToInt32(Request.QueryString["MechantID"]);

                    //get the current mechant from EF
                    m = (from objM in db.Mechants
                         where objM.MechantID == MechantID
                         select objM).FirstOrDefault();
                }

                m.Mechant1 = txtMechant.Text;

                //call add only if we have no mechant ID
                if (MechantID == 0)
                {
                    db.Mechants.Add(m);
                }

                //run the update or insert
                db.SaveChanges();

                //redirect to the updated accounts page
                Response.Redirect("mechants.aspx");
                }
            }
        }
    }
