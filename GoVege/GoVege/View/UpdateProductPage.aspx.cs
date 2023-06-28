using GoVege.Controller;
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
    public partial class UpdateProductPage : System.Web.UI.Page
    {
        public int customerID, productID, vendorID;
        public MsUser currUser;

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            String name = TxtName.Text;
            String price = TxtPrice.Text;
            String foodType = RBLType.SelectedValue;
            String cal = TxtCal.Text;
            HttpPostedFile image = FileUploadImage.PostedFile;
            MsProduct product = ProductRepository.GetProductByID(productID);
            String imageUrl = product.productImage.ToString();
            String filePath = Server.MapPath("~/Assets/Product/" + imageUrl);

            String error = ProductController.UpdateProductByProductID(productID, name, price, foodType, cal, image, filePath);

            if (error.Equals("Update successful!"))
            {
                LblError.ForeColor = System.Drawing.Color.FromArgb(48, 211, 21);
                image.SaveAs(Server.MapPath("~/Assets/Product/" + image.FileName));
            }
            else
            {
                LblError.ForeColor = System.Drawing.Color.Crimson;
            }

            LblError.Text = error;
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

            if (Request.QueryString["ProductID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            productID = int.Parse(Request.QueryString["ProductID"]);
            MsProduct product = ProductRepository.GetProductByID(productID);

            if (product == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }
            vendorID = product.vendorID;

            LblValueID.Text = product.productID.ToString();

            if (!IsPostBack)
            {
                
                TxtName.Text = product.productName.ToString();
                TxtPrice.Text = product.productPrice.ToString();
                RBLType.SelectedValue = product.productFoodType.ToString();
                TxtCal.Text = product.productCalories.ToString();
            }
        }
    }
}