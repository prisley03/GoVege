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
    public partial class InsertProductPage : System.Web.UI.Page
    {
        public int customerID, vendorID;
        public MsUser currUser;

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

            if (Request.QueryString["VendorID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            vendorID = int.Parse(Request.QueryString["VendorID"]);
        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            String name = TxtName.Text;
            String price = TxtPrice.Text;
            String foodType = RBLType.SelectedValue;
            String cal = TxtCal.Text;
            HttpPostedFile image = FileUploadImage.PostedFile;

            String error = ProductController.InsertProduct(name, price, foodType, cal, image, vendorID);

            if (error.Equals("Insert successful!"))
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
    }
}