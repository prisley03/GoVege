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
    public partial class InsertDriverPage : System.Web.UI.Page
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
                    var userID = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    cust = (from x in db.MsUsers where x.userID == userID select x).FirstOrDefault();
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
            if (!cust.userFoodPreference.Equals("Admin"))
            {
                Response.Redirect("Homepage.aspx");
            }



        }

        protected void insertButton_Click(object sender, EventArgs e)
        {
            String name = driverNameBox.Text;
            String LP = driverLP.Text;
            String vehicleN = vehicleName.Text;
            HttpPostedFile postedFile = imageUpload.PostedFile;

            String warningText = DriverController.insertDriver(name, LP, vehicleN, postedFile);
            warningLabel.Text = warningText;

            if (warningLabel.Text.Equals("Insert Successfull!"))
            {
                postedFile.SaveAs(Server.MapPath("~/Assets/Driver/" + imageUpload.FileName));
                Response.Redirect("AdminDriverPage.aspx");
            }
            
        }
    }
}