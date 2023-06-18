using GoVege.Controller;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoVege.View
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
            {
                Response.Redirect("/Home");
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            String email = txtEmail.Text;
            String password = txtPassword.Text;
            bool isRemember = checkRememberMe.Checked;

            MsUser user = registerPageController.LoginCustomer(email, password);

            if (user != null)
            {
                Session["user"] = user;

                if (isRemember)
                {
                    HttpCookie cookie = new HttpCookie("user_cookie");
                    cookie.Value = user.userID.ToString();
                    cookie.Expires = DateTime.Now.AddHours(4);
                    Response.Cookies.Add(cookie);
                }

                Response.Redirect("HomePage.aspx");
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "failed";
            }
        }

        protected void btnDontHaveAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}