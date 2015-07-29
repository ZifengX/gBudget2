using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gBudget2.Logic;

namespace gBudget2
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create safe error messages.
            string generalErrorMsg = "A problem has occurred on this web site. Please try again. " +
                "If this error continues, please contact support.";

            // Display safe error message.
            FriendlyErrorMsg.Text = generalErrorMsg;   
        }
    }
}