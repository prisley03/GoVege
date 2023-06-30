using GoVege.Handler;
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
    public partial class DeleteProductPage : System.Web.UI.Page
    {
        public int customerID, productID, vendorID;
        public MsUser currUser;
        public MsProduct product;

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string imageUrl = product.productImage.ToString();
            string filePath = Server.MapPath("~/Assets/Product/" + imageUrl);
            ProductHandler.deleteImageFile(filePath);

            ProductHandler.DeleteProductByProductID(productID);
            Response.Redirect("~/View/VendorDetailsPage.aspx" + "?VendorID=" + vendorID);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
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
            }

            if (currUser == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }
            else
            {
                if (!currUser.userFoodPreference.Equals("Admin"))
                {
                    Response.Redirect("~/View/HomePage.aspx");
                }
                else 
                {
                    customerID = currUser.userID;
                }
            }

            if(Request.QueryString["ProductID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            productID = int.Parse(Request.QueryString["ProductID"]);
            product = ProductRepository.GetProductByID(productID);
            

            if(product == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }
            vendorID = product.vendorID;
            LblValueID.Text = product.productID.ToString();
            LblValueName.Text = product.productName.ToString();
            LblValuePrice.Text = product.productPrice.ToString();
            LblValueType.Text = product.productFoodType.ToString();
            LblValueCal.Text = product.productCalories.ToString();
            LblValueImage.ImageUrl = "~/Assets/Product/" + product.productImage.ToString();
        }
    }
}