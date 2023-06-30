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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NavCustomer.Visible = false;
            NavGuest.Visible = false;
            NavAdmin.Visible = false;

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                NavGuest.Visible = true;
            }
            else
            {
                GoVegeDBEntities db = DatabaseSingleton.GetInstance();
                MsUser cust;
                if (Session["user"] == null)
                {
                    var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    cust = (from x in db.MsUsers where x.userID == id select x).FirstOrDefault();
                    Session["user"] = cust;
                }
                else
                {
                    cust = (MsUser)Session["user"];
                }
                if (cust.userFoodPreference.Equals("Admin"))
                {
                    NavAdmin.Visible = true;
                }
                else
                {
                    NavCustomer.Visible = true;
                }
                BtnProfile.Text = "Welcome, " + cust.userName;
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }

        protected void BtnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartPage.aspx");
        }

        protected void BtnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateProfilePage.aspx");
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            string[] cookies = Request.Cookies.AllKeys;

            foreach (string c in cookies)
            {
                Response.Cookies[c].Expires = DateTime.Now.AddDays(-2);
            }

            Session.Remove("user");
            Response.Redirect("LoginPage.aspx");
        }
        protected void BtnLogout_Click2(object sender, EventArgs e)
        {
            string[] cookies = Request.Cookies.AllKeys;

            foreach (string c in cookies)
            {
                Response.Cookies[c].Expires = DateTime.Now.AddDays(-2);
            }

            Session.Remove("user");
            Response.Redirect("LoginPage.aspx");
        }

        protected void BtnAdminVendor_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminVendorPage.aspx");
        }

        protected void BtnAdminDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDriverPage.aspx");
        }

        protected void BtnAdminVoucher_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminVoucherPage.aspx");
        }
    }
}