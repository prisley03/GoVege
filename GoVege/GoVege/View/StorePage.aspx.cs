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
    public partial class StorePage : System.Web.UI.Page
    {
        public MsVendor vendorTarget = null;
        public List<MsProduct> productList = null;
        public int vendorID;
        public double vendorRating;
        public int fullStarCount, halfStarCount, emptyStarCount;

        protected void BtnAddCart_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandArgument == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }
            else
            {
                
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["VendorID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }
            vendorID = Convert.ToInt32(Request.QueryString["VendorID"]);

            vendorTarget = VendorRepository.GetVendorByID(vendorID);
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
            ListViewProduct.DataSource = productList;
            ListViewProduct.DataBind();
        }
    }
}