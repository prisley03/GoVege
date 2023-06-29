using GoVege.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoVege.View
{
    public partial class AdminDriverPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            driverRepeater.DataSource = DriverController.getAllDriver();
            driverRepeater.DataBind();

        }
    }
}