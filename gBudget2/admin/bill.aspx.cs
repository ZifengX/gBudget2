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
    public partial class bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if save wasn't clicked AND we have a datainfoid in the url
            if (!IsPostBack)
            {
                GetBill();
            }

        }

        protected void GetBill()
        {
            var currentUserID = User.Identity.GetUserId();
            //populate form with existing bill record
            Int32 DatainfoID = Convert.ToInt32(Request.QueryString["DatainfoID"]);

            //connect to db via EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                //query the datainfo table using EF and LINQ
                var Categories = from c in db.Categories
                                 where c.UserID == currentUserID
                                 select c;

                //bind the result to the gridview
                ddlCategory.DataSource = Categories.ToList();
                ddlCategory.DataBind();

                var Accounts = from a in db.Accounts
                               where a.UserID == currentUserID
                               select a;

                ddlAccount.DataSource = Accounts.ToList();
                ddlAccount.DataBind();

                var Mechants = from m in db.Mechants
                               where m.UserID == currentUserID
                               select m;
                ddlMechant.DataSource = Mechants.ToList();
                ddlMechant.DataBind();

                //populate a datainfo instance with the datainfoID from the URL parameter
                DataInfo d = (from objD in db.DataInfoes
                            where objD.DatainfoID == DatainfoID
                            select objD).FirstOrDefault();

                //map the datainfo properties to the form controls if we found a match
                if (d != null)
                {
                    txtAmount.Text = Convert.ToString(d.Amount);
                    ddlCategory.SelectedValue = Convert.ToString(d.CategoryID);
                    ddlAccount.SelectedValue = Convert.ToString(d.AccountID);
                    ddlMechant.SelectedValue = Convert.ToString(d.MechantID);
                    txtNote.Text = d.Note;
                    txtDate.Text = d.Date.ToString("yyyy-MM-dd");
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var currentUserID = User.Identity.GetUserId();
            //use EF to connect to SQL Server
            using (gBudget2Entities db = new gBudget2Entities())
            {

                //use the datainfo model to save the new record
                DataInfo d = new DataInfo();
                Int32 DatainfoID = 0;

                //check the querystring for an id so we can determine add / update
                if (Request.QueryString["DatainfoID"] != null)
                {
                    //get the id from the url
                    DatainfoID = Convert.ToInt32(Request.QueryString["DatainfoID"]);

                    //get the current datainfo from EF
                    d = (from objD in db.DataInfoes
                         where objD.DatainfoID == DatainfoID
                         select objD).FirstOrDefault();
                }

                d.Amount = Convert.ToInt32(txtAmount.Text);
                d.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
                d.AccountID = Convert.ToInt32(ddlAccount.SelectedValue);
                d.MechantID = Convert.ToInt32(ddlMechant.SelectedValue);
                d.Note = txtNote.Text;
                d.Date = Convert.ToDateTime(txtDate.Text);
                d.UserID = currentUserID;

                //call add only if we have no datainfo ID
                if (DatainfoID == 0)
                {
                    db.DataInfoes.Add(d);
                }

                //run the update or insert
                db.SaveChanges();

                //redirect to the updated students page
                Response.Redirect("bills.aspx");
            }
        }
    }
}