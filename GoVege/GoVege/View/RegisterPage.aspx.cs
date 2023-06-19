using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoVege.Controller;

namespace GoVege.View
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHaveAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/LoginPage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string phoneNum = txtRegionNumber.Text + txtNumber.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string rePassword = txtRePassword.Text;
            string foodPref = rblFoodPref.SelectedValue;
            bool agreedToTerms = checkTerms.Checked;

            if (registerPageController.RegisterCustomer(fullName, phoneNum, email, password, rePassword, foodPref, agreedToTerms))
            {
                Response.Redirect("~/View/LoginPage.aspx");
            }
        }
    }
}