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
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a StudentID in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetAccount();
            }
        }

        protected void GetAccount()
        {
           
            //populate form with existing account record
            Int32 AccountID = Convert.ToInt32(Request.QueryString["AccountID"]);

            //connect to db via EF
            using (gBudget2Entities db = new gBudget2Entities())
            {
                //populate a account instance with the AccountID from the URL parameter
                Account a = (from objA in db.Accounts
                             where objA.AccountID == AccountID
                             select objA).FirstOrDefault();

                //map the account properties to the form controls if we found a match
                if (a != null)
                {
                    txtAccount.Text = a.Account1;
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var currentUserID = User.Identity.GetUserId();
            //use EF to connect to SQL Server
            using (gBudget2Entities db = new gBudget2Entities())
            {

                //use the Account model to save the new record
                Account a = new Account();
                Int32 AccountID = 0;

                //check the querystring for an id so we can determine add / update
                if (Request.QueryString["AccountID"] != null)
                {
                    //get the id from the url
                    AccountID = Convert.ToInt32(Request.QueryString["AccountID"]);

                    //get the current account from EF
                    a = (from objA in db.Accounts
                         where objA.AccountID == AccountID
                         select objA).FirstOrDefault();
                }

                a.Account1 = txtAccount.Text;
                a.UserID = currentUserID;

                //call add only if we have no account ID
                if (AccountID == 0)
                {
                    db.Accounts.Add(a);
                }

                //run the update or insert
                db.SaveChanges();

                //redirect to the updated accounts page
                Response.Redirect("accounts.aspx");
            }
        }
    }
}