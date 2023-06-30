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
    public partial class StorePage1 : System.Web.UI.Page
    {
        public MsVendor vendorTarget = null;
        public List<MsProduct> productList = null;
        public int vendorID;
        public double vendorRating;
        public int fullStarCount, halfStarCount, emptyStarCount;

        public int customerID = 0;
        public MsUser currUser = null;

        protected void ListViewProduct_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "save")
            {
                if (e.CommandArgument.ToString().Equals(""))
                {
                    Response.Write("<script language=javascript>alert('ERROR: Please input a valid quantity');</script>");
                }
                else if(customerID == 0)
                {
                    Response.Write("<script language=javascript>alert('ERROR: Please login first');</script>");
                }
                else
                {
                    int productId = int.Parse(e.CommandArgument.ToString());
                    String qty = (((TextBox)e.Item.FindControl("txtqty")).Text);

                    String msg = CartController.CreateCart(qty, customerID.ToString(), productId.ToString(), vendorID);
                    if (msg.Equals("Insert successful") ||
                        msg.Equals("Update successful"))
                    {
                        //if(cart != null)
                        //{
                        //    Label1.Text = "Cart First Item: " + productId.ToString() + " " + qty.ToString();
                        //}
                        
                        ((TextBox)(e.Item.FindControl("TxtQty"))).Text = "In Cart";
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('ERROR: " + msg + "');</script>");
                    }
                }
            }
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

            if (!IsPostBack)
            {
                ListViewProduct.DataSource = productList;
                ListViewProduct.DataBind();
            }
        }
    }
}