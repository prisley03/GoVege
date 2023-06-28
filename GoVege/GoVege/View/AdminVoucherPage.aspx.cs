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
    public partial class AdminVoucherPage : System.Web.UI.Page
    {

        private List<MsVoucher> voucherList;
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

            voucherList = VoucherRepository.loadAllVoucher();
            LVVoucher.DataSource = voucherList;
            LVVoucher.DataBind();
        }
        protected void ButtonSearchRestaurant_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            voucherID.Visible = false;
            searchedVoucherID.Visible = true;

            string name = txtSearched.Text;
            voucherList = VoucherRepository.loadVoucherByName(name);

            if (voucherList.Count == 0)
            {
                LblError.Text = "Sorry there is no voucher with that name";
            }
            else
            {
                LblError.Text = "";
                LVVoucherSearched.DataSource = voucherList;
                LVVoucherSearched.DataBind();
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int voucherID = int.Parse(btn.CommandArgument);

            VoucherRepository.deleteVoucherByID(voucherID);

            Response.Redirect(ResolveUrl("AdminVoucherPage.aspx"));
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminInsertvoucherPage.aspx");
        }
    }
}