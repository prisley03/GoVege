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
        public int subTotal = 0;
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
                customerID = currUser.userID;
            }

            cartList = CartRepository.GetCartByCustId(customerID);
            promoList = PromotionRepository.getAllPromotion();

            CartNoItems.Visible = false;
            CartHasItems.Visible = true;

            if(cartList.Count() == 0)
            {
                CartNoItems.Visible = true;
                CartHasItems.Visible = false;
            }
            else
            {
                foreach (var cart in cartList)
                {
                    subTotal += (cart.quantity * cart.MsProduct.productPrice);
                }

                vendorTarget = cartList.FirstOrDefault().MsProduct.MsVendor;
                ImageVendor.ImageUrl = "~/Assets/Vendor/" + vendorTarget.vendorImage;
            }

            ListViewCart.DataSource = cartList;
            ListViewCart.DataBind();

            LblSum.Text = "Rp " + subTotal.ToString();

            int voucher = 0;
            int total;

            PromoContainer.Visible = false;
            LblPromo.Text = "";
            LblPromoValue.Text = "";

            if (DropDownPromo.SelectedIndex != 0)
            {
                MsVoucher promo = PromotionRepository.GetPromotionsById(int.Parse(DropDownPromo.SelectedValue));
                if(!(promo.startDate <= DateTime.Today && DateTime.Today <= promo.endDate))
                {
                    LblPromo.Text = "Voucher out of date";
                    LblPromo.ForeColor = LblPromoValue.ForeColor = System.Drawing.Color.Crimson;
                }
                else
                {
                    LblPromo.Text = "Discount: " + promo.voucherName;
                    voucher = (int)(promo.discountAmount * subTotal);
                    LblPromoValue.Text = "- Rp " + voucher.ToString();
                    LblPromo.ForeColor = LblPromoValue.ForeColor = System.Drawing.Color.FromArgb(48, 211, 21);
                }

                PromoContainer.Visible = true;
            }
            else
            {
                
            }

            total = subTotal - voucher;
            LblTotal.Text = "Rp " + total.ToString();
        }

        protected void BtnRemoveItem_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String prodId = btn.CommandArgument.ToString();
            String error = CartController.RemoveQty(customerID, prodId);

            if (prodId.Equals(""))
            {
                Response.Write("<script language=javascript>alert('ERROR: " + error + "');</script>");
            }

            Response.Redirect("~/View/CartPage.aspx");
        }

        protected void BtnAddItem_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String prodId = btn.CommandArgument.ToString();
            String error = CartController.AddQty(customerID, prodId);

            if (prodId.Equals(""))
            {
                Response.Write("<script language=javascript>alert('ERROR: " + error + "');</script>");
            }

            Response.Redirect("~/View/CartPage.aspx");
        }
    }
}