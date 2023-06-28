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
    public partial class VendorAdminPage : System.Web.UI.Page
    {
        private List<MsVendor> vendorList;
        public MsUser cust;
        protected void Page_Load(object sender, EventArgs e)
        {
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                cust = null;
            }
            else
            {
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
            }
            if (cust == null)
            {
                Response.Redirect("LoginPage.aspx");
            }

            vendorList = VendorController.loadVegetarianAllVendor();
            LVVendorVegetarian.DataSource = vendorList;
            LVVendorVegetarian.DataBind();

            vendorList = VendorController.loadVeganAllVendor();
            LVVendorVegan.DataSource = vendorList;
            LVVendorVegan.DataBind();
        }

        protected void ButtonSearchRestaurant_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            veganRestaurantID.Visible = false;
            vegetarianRestaurantID.Visible = false;
            searchedRestaurantID.Visible = true;

            string name = txtSearched.Text;
            vendorList = VendorController.loadVendorByName(name, "All");

            if (vendorList.Count == 0)
            {
                LblError.Text = "Sorry there is no restaurant with that name";
            }
            else
            {
                LblError.Text = "";
                LVVendorSearched.DataSource = vendorList;
                LVVendorSearched.DataBind();
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int vendorID = int.Parse(btn.CommandArgument);

            VendorRepository.deleteVendorByID(vendorID);

            Response.Redirect(ResolveUrl("AdminVendorPage.aspx"));
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminInsertvendorPage.aspx");
        }
    }
}