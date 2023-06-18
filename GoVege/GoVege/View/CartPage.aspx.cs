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
            currUser = UserRepository.GetUserByID(2);
            cartList = CartRepository.GetCartByCustId(customerID);
        }
    }
}