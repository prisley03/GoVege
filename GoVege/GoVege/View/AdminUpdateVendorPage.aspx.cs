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
    public partial class AdminUpdateVendorPage : System.Web.UI.Page
    {
        int vendorID;
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
            if (Request.QueryString["VendorID"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }

            vendorID = int.Parse(Request.QueryString["VendorID"]);

            MsVendor vendorBefore = VendorRepository.getVendorByID(vendorID);
            TxtVendorNameBefore.Text = vendorBefore.vendorName;
            TxtVendorAddressBefore.Text = vendorBefore.vendorAddress;
            TxtRatingBefore.Text = vendorBefore.vendorRating.ToString();
            TxtPreferenceBefore.Text = vendorBefore.vendorTypePreference;
            
           switch (vendorBefore.categoryID)
            {
                case 1:
                    TxtCategoryBefore.Text = "Indonesian";
                    break;
                case 2:
                    TxtCategoryBefore.Text = "Chinese";
                    break;
                case 3:
                    TxtCategoryBefore.Text = "Salad";
                    break;
                case 4:
                    TxtCategoryBefore.Text = "Rice";
                    break;
                case 5:
                    TxtCategoryBefore.Text = "International";
                    break;
                case 6:
                    TxtCategoryBefore.Text = "Coffee";
                    break;
                case 7:
                    TxtCategoryBefore.Text = "Dessert";
                    break;
                case 8:
                    TxtCategoryBefore.Text = "Breakfast";
                    break;
            }

            string imageUrl = vendorBefore.vendorImage;
            ImageBefore.ImageUrl = "~/Assets/Vendor/" + imageUrl;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            string vendorName = TxtVendorNameBefore.Text;
            string vendorAddress = TxtVendorAddressBefore.Text;
            string rating = TxtRatingBefore.Text;
            string preference = TxtPreferenceBefore.Text;
            string category = TxtCategoryBefore.Text;
            HttpPostedFile vendorImage = VendorImageFileUpload.PostedFile;
            vendorID = int.Parse(Request.QueryString["VendorID"]);
            string errorMsg = VendorController.updateVendor(vendorID, vendorName, vendorAddress, rating, preference, category, vendorImage);
            if (errorMsg.Equals("Update Successful"))
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