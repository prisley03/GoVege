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
    public partial class UpdateProfilePage : System.Web.UI.Page
    {
        public MsUser user = null;
        public string storedEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/View/LoginPage.aspx");
            }
            else
            {
                if (Session["user"] == null)
                {
                    var cookieId = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    user = CustomerRepository.GetCustomerById(cookieId);
                    Session["user"] = user;
                }
                else
                {
                    user = (MsUser)Session["user"];
                }

                storedEmail = user.userEmail;
                if (!IsPostBack)
                {
                    txtFullName.Text = user.userName;
                    txtNumber.Text = user.userPhone;
                    txtEmail.Text = user.userEmail;
                    rblFoodPref.SelectedValue = user.userFoodPreference;
                    txtPassword.Attributes.Add("value", user.userPassword);
                    txtRePassword.Attributes.Add("value", user.userPassword);
                }
                if (IsPostBack)
                {
                    if (!(String.IsNullOrEmpty(txtPassword.Text.Trim())))
                    {
                        txtPassword.Attributes["value"] = txtPassword.Text;
                        txtRePassword.Attributes["value"] = txtRePassword.Text;
                    }
                }
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtFullName.Text;
            string phoneNum = txtNumber.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string rePass = txtRePassword.Text;
            string foodPref = rblFoodPref.SelectedValue;

            bool isSuccess = registerPageController.UpdateCustomer(name, phoneNum, email, password, rePass, foodPref, storedEmail, user.userID); ;

            if (isSuccess)
            {
                errMsg.ForeColor = System.Drawing.Color.Green;
                errMsg.Text = "Success";
            }
            else
            {
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Text = "Error";
            }

            Response.Redirect("~/View/UpdateProfilePage.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CustomerRepository.DeleteCustomerById(user.userID);
            string[] cookies = Request.Cookies.AllKeys;
            foreach(string c in cookies)
            {
                Response.Cookies[c].Expires = DateTime.Now.AddHours(-5);
            }
            Session.Remove("user");
            Response.Redirect("~/View/LoginPage.aspx");
        }
    }
}