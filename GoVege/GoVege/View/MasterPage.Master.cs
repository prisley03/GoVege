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
                    cust = (from x in db.Customers where x.CustomerID == id select x).FirstOrDefault();
                    Session["user"] = cust;
                }
                else
                {
                    cust = (Customer)Session["user"];
                }

                // if role is admin
                if (cust.CustomerRole.Equals("ADM"))
                {
                    NavAdmin.Visible = true;
                }
                // if role is customer
                else
                {
                    NavCustomer.Visible = true;
                }
            }
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

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            
        }

    }
}