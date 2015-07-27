using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gBudget2
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////determine which nav to show
            //if (HttpContext.Current.User.Identity.IsAuthenticated)
            //{
            //    //HttpContext.Current.User.IsInRole("Admin");
            //    plhPublic.Visible = false;
            //    //plhPrivate.Visible = true;
            //    plhLogout.Visible = true;
            //}
            //else
            //{
            //    plhPublic.Visible = true;
            //    //plhPrivate.Visible = false;
            //    plhLogout.Visible = false;
            //}
        }
    }
}