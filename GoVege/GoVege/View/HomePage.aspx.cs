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
    public partial class HomePage : System.Web.UI.Page
    {
        private List<MsVendor> vendorList;
        private List<MsVendorCategory> categoryList;
        public MsUser cust;
        protected void Page_Load(object sender, EventArgs e)
        {

            GoVegeDBEntities db = DatabaseSingleton.GetInstance();

            if (Request.QueryString["categoryID"] != null)
            {
                recommended();
            }


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

            }
            else if (cust.userFoodPreference.Equals("Admin"))
            {
                Response.Redirect("AdminVendorPage.aspx");
            }
            else if (cust.userFoodPreference.Equals("Vegan"))
            {
                vegetarianRestaurantID.Visible = false;
            }
            else if (cust.userFoodPreference.Equals("Vegetarian"))
            {
                veganRestaurantID.Visible = false;
            }

            vendorList = VendorController.loadVegetarianVendor(5);
            LVVendorVegetarian.DataSource = vendorList;
            LVVendorVegetarian.DataBind();

            vendorList = VendorController.loadVeganVendor(5);
            LVVendorVegan.DataSource = vendorList;
            LVVendorVegan.DataBind();

            categoryList = VendorController.loadRecommendedCategories(5);
            LVVendorRecommended.DataSource = categoryList;
            LVVendorRecommended.DataBind();

            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            vendorList = VendorController.loadVegetarianVendor(10);
            LVVendorVegetarian.DataSource = vendorList;
            LVVendorVegetarian.DataBind();

            Button1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            vendorList = VendorController.loadVeganVendor(10);
            LVVendorVegan.DataSource = vendorList;
            LVVendorVegan.DataBind();

            Button2.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            categoryList = VendorController.loadRecommendedCategories(10);
            LVVendorRecommended.DataSource = categoryList;
            LVVendorRecommended.DataBind();

            Button3.Visible = false;
        }
        protected void ButtonSearchRestaurant_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            veganRestaurantID.Visible = false;
            vegetarianRestaurantID.Visible = false;
            searchedRestaurantID.Visible = true;

            string name = txtSearched.Text;
            if (cust == null)
            {
                vendorList = VendorController.loadVendorByName(name, "All");
            }
            else if (cust.userFoodPreference.Equals("Vegan"))
            {
                vendorList = VendorController.loadVendorByName(name, "Vegan");
            }
            else if (cust.userFoodPreference.Equals("Vegetarian"))
            {
                vendorList = VendorController.loadVendorByName(name, "Vegetarian");
            }
            
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
        protected void recommended()
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            veganRestaurantID.Visible = false;
            vegetarianRestaurantID.Visible = false;
            searchedRestaurantID.Visible = true;

            int id = int.Parse(Request.QueryString["categoryID"]);
            LblError.Text = id.ToString();
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                cust = null;
            }
            else
            {
                if (Session["user"] == null)
                {
                    var id2 = Int32.Parse(Request.Cookies["user_cookie"].Value);
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
                vendorList = VendorController.loadVendorByCategory(id, "Vegetarian");
            }
            else if (cust.userFoodPreference.Equals("Vegan"))
            {
                vendorList = VendorController.loadVendorByCategory(id, "Vegan");
            }
            else if (cust.userFoodPreference.Equals("Vegetarian"))
            {
                vendorList = VendorController.loadVendorByCategory(id, "Vegetarian");
            }

            if (vendorList.Count == 0)
            {
                LblError.Text = "Sorry there is no restaurant with that category";
            }
            else
            {
                LblError.Text = "";
                LVVendorSearched.DataSource = vendorList;
                LVVendorSearched.DataBind();
            }
        }
    }
}