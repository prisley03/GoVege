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
    public partial class CartPage : System.Web.UI.Page
    {
        public MsVendor vendorTarget = null;
        public int customerID;
        public MsUser currUser;
        public List<MsCart> cartList;
        public List<MsVoucher> promoList;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            //{
            //    Response.Redirect("~/View/HomePage.aspx");
            //}
            //else
            //{
            //    if (Session["user"] == null)
            //    {
            //        var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
            //        currUser = UserRepository.GetUserByID(id);
            //        Session["user"] = currUser;
            //    }
            //    else
            //    {
            //        currUser = (MsUser)Session["user"];
            //    }
            //}

            //if (currUser == null)
            //{
            //    Response.Redirect("~/View/HomePage.aspx");
            //}
            //else
            //{
            //    customerID = currUser.userID;
            //}

            customerID = 2;
            currUser = UserRepository.GetUserByID(customerID);
            
            cartList = CartRepository.GetCartByCustId(customerID);
            promoList = PromotionRepository.getAllPromotion();
            vendorTarget = cartList.FirstOrDefault().MsProduct.MsVendor;
            ImageVendor.ImageUrl = "~/Assets/Vendor/" +  vendorTarget.vendorImage;

            ListViewCart.DataSource = cartList;
            ListViewCart.DataBind();
            
        }
        protected void ListViewCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String prodId = e.CommandArgument.ToString();
            String error = null;

            if (e.CommandName == "add")
            {
                error = CartController.AddQty(customerID, prodId);
            }
            else if(e.CommandName == "remove")
            {
                error = CartController.RemoveQty(customerID, prodId);  
            }

            if (!error.Equals("Update successful") || e.CommandArgument.ToString().Equals(""))
            {
                Response.Write("<script language=javascript>alert('ERROR: " + error + "');</script>");
                ListViewCart.DataSource = cartList;
                ListViewCart.DataBind();
            }

            ListViewCart.DataSource = cartList;
            ListViewCart.DataBind();
        }
    }
}