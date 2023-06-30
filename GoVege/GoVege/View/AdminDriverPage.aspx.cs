using GoVege.Controller;
using GoVege.Model;
using GoVege.Repository;
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
        public MsUser cust;

        protected void Page_Load(object sender, EventArgs e)
        {

            GoVegeDBEntities db = DatabaseSingleton.GetInstance();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                cust = null;
            }
            else
            {
                if (Session["user"] == null)
                {
                    var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    cust = (from x in db.MsUsers where x.userID == id select x).FirstOrDefault();
                    Session["user"] = cust;
                }
                else
                {
                    cust = (MsUser)Session["user"];
                }
            }
            if (cust == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!cust.userFoodPreference.Equals("Admin")){
                Response.Redirect("Homepage.aspx");
            }

            driverRepeater.DataSource = DriverController.getAllDriver();
            driverRepeater.DataBind();

        }

        protected void insertButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertDriverPage.aspx");
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int driverId = int.Parse(btn.CommandArgument);
            Response.Redirect("UpdateDriverPage.aspx?DriverId=" + btn.CommandArgument);
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DriverController.deleteDriver(btn.CommandArgument);
            Response.Redirect("AdminDriverPage.aspx");
        }
    }
}