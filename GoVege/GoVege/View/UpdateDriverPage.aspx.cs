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
    public partial class UpdateDriverPage : System.Web.UI.Page
    {
        private static MsDriver driverBefore;
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

            String id = Request["DriverId"];
            driverBefore = DriverController.getDriver(id);

            driverImage.ImageUrl = "../Assets/Driver/" + driverBefore.driverImage;
            driverName.Text = driverBefore.driverName;
            driverNameBox.Text = driverBefore.driverName;
            driverLP.Text = driverBefore.driverLicensePlate;
            vehicleName.Text = driverBefore.driverVehicleName;
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            String name = driverNameBox.Text;
            String LP = driverLP.Text;
            String vehicleN = vehicleName.Text;
            HttpPostedFile postedFile = imageUpload.PostedFile;
            String id = Request["DriverId"];

            String warningText = DriverController.updateDriver(name, LP, vehicleN, postedFile, id);
            warningLabel.Text = warningText;

            if (warningLabel.Text.Equals("Update Successfull!"))
            {
                postedFile.SaveAs(Server.MapPath("~/Assets/Driver/" + imageUpload.FileName));
                Response.Redirect("AdminDriverPage.aspx");
            }
        }
    }
}