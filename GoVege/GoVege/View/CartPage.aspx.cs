﻿using GoVege.Controller;
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
            foreach(var cart in cartList)
            {
                subTotal += (cart.quantity * cart.MsProduct.productPrice);
            }
            promoList = PromotionRepository.getAllPromotion();

            vendorTarget = cartList.FirstOrDefault().MsProduct.MsVendor;
            ImageVendor.ImageUrl = "~/Assets/Vendor/" +  vendorTarget.vendorImage;

            ListViewCart.DataSource = cartList;
            ListViewCart.DataBind();

            LblSum.Text = "Rp " + subTotal.ToString();

            int voucher = 0;
            int total;

            if (DropDownPromo.SelectedIndex != 0)
            {
                MsVoucher promo = PromotionRepository.GetPromotionsById(int.Parse(DropDownPromo.SelectedValue));
                if(!(promo.startDate <= DateTime.Today && DateTime.Today <= promo.endDate))
                {
                    LblPromo.Text = "Voucher out of date";
                }
                else
                {
                    LblPromo.Text = "Discount: " + promo.voucherName;
                    voucher = (int)(promo.discountAmount * subTotal);
                    LblPromoValue.Text = "- Rp " + voucher.ToString();
                }

                LblPromo.ForeColor = LblPromoValue.ForeColor = System.Drawing.Color.FromArgb(48, 211, 21);
                
                PromoContainer.Visible = true;
            }
            else
            {
                PromoContainer.Visible = false;
            }

            total = subTotal - voucher;
            LblTotal.Text = "Rp " + total.ToString();
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

            if (e.CommandArgument.ToString().Equals(""))
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