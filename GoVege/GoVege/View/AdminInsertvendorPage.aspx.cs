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
    public partial class AdminInsertvendorPage : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();
            LblError.Text = "";
            MsUser curr = (MsUser)(Session["User"]);
            if (curr == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {

                if (Session["user"] == null)
                {
                    var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    curr = (from x in db.MsUsers where x.userID == id select x).FirstOrDefault();
                    Session["user"] = curr;
                }
                else
                {
                    curr = (MsUser)Session["user"];
                }
            }
            if (!curr.userFoodPreference.Equals("Admin"))
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            string vendorName = TxtVendorName.Text;
            string vendorAddress = TxtVendorAddress.Text;
            string vendorRating = TxtRating.Text;
            string vendorPreference = TxtPreference.Text;
            string vendorCategory = TxtCategory.Text;
            HttpPostedFile vendorImage = AlbumImageFileUpload.PostedFile;
            string errorMsg = VendorController.insertVendor(vendorName, vendorAddress, vendorRating, vendorPreference, vendorCategory,vendorImage);
            if (errorMsg.Equals("Insert Successful"))
            {
                LblError.Text = errorMsg;
                vendorImage.SaveAs(Server.MapPath("~/Assets/Vendor/" + vendorImage.FileName));
                LblError.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                LblError.Text = errorMsg;
            }
        }
    }
}