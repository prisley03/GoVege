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
    public partial class VendorDetailsPage : System.Web.UI.Page
    {
        public MsVendor vendorTarget = null;
        public List<MsProduct> productList = null;
        public int vendorID;
        public double vendorRating;
        public int fullStarCount, halfStarCount, emptyStarCount;

        public int customerID = 0;
        public MsUser currUser = null;

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/InsertProductPage.aspx?VendorID=" + vendorID);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {

            }
            else
            {
                if (Session["user"] == null)
                {
                    var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    currUser = UserRepository.GetUserByID(id);
                    Session["user"] = currUser;
                }
                else
                {
                    currUser = (MsUser)Session["user"];
                }

                customerID = currUser.userID;
            }

            if (Request.QueryString["VendorID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            vendorID = Convert.ToInt32(Request.QueryString["VendorID"]);

            vendorTarget = VendorRepository.getVendorByID(vendorID);
            Page.Title = "GoVege - " + vendorTarget.vendorName;
            vendorRating = vendorTarget.vendorRating;


            fullStarCount = (int)(vendorRating / 1);
            halfStarCount = (int)((vendorRating - fullStarCount) / 0.5);
            emptyStarCount = (int)(5 - (fullStarCount + halfStarCount));

            if (vendorTarget == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            String vendorImage = vendorTarget.vendorImage;
            ImageVendor.ImageUrl = "~/Assets/Vendor/" + vendorImage;

            productList = ProductRepository.GetProductsByVendorID(vendorID);
        }

        public void SetImageUrl(String imgPath)
        {
            ImageProduct.ImageUrl = "~/Assets/Product/" + imgPath;
            Console.WriteLine(imgPath);
        }
    }
}