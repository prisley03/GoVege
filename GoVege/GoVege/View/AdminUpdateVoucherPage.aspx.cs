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
    public partial class AdminUpdateVoucherPage : System.Web.UI.Page
    {
        int voucherID;
        protected void Page_Load(object sender, EventArgs e)
        {
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();
            LblError.Text = "";
            MsUser curr = (MsUser)(Session["User"]);
            if (curr == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {

                if (Session["user"] == null)
                {
                    var id = Int32.Parse(Request.Cookies["user_cookie"].Value);
                    curr = (from x in db.MsUsers where x.userID == id select x).FirstOrDefault();
                    Session["user"] = curr;
                }
                else
                {
                    curr = (MsUser)Session["user"];
                }
            }
            if (!curr.userFoodPreference.Equals("Admin"))
            {
                Response.Redirect("HomePage.aspx");
            }
            if (Request.QueryString["voucherID"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            voucherID = int.Parse(Request.QueryString["voucherID"]);

            MsVoucher voucherBefore = VoucherRepository.getVoucherByID(voucherID);
            TxtNameBefore.Text = voucherBefore.voucherName;
            TxtVoucherDescBefore.Text = voucherBefore.description;
            TxtDateStartBefore.Text = voucherBefore.startDate.ToString();
            TxtDateEndBefore.Text = voucherBefore.endDate.ToString();
            TxtDiscountBefore.Text = voucherBefore.discountAmount.ToString();
           
            string imageUrl = voucherBefore.photo;
            ImageBefore.ImageUrl = "~/Assets/Voucher/" + imageUrl;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            LblError.ForeColor = System.Drawing.Color.Red;
            string name = TxtNameBefore.Text;
            string desc = TxtVoucherDescBefore.Text;
            string dateS = TxtDateStartBefore.Text;
            string dateE = TxtDateEndBefore.Text;
            string disc = TxtDiscountBefore.Text;

            HttpPostedFile voucherImage = VoucherImageFileUpload.PostedFile;
            voucherID = int.Parse(Request.QueryString["VoucherID"]);
            string errorMsg = VoucherController.updateVoucher(voucherID, name, desc, dateS, dateE, disc, voucherImage);
            if (errorMsg.Equals("Update Successful"))
            {
                LblError.Text = errorMsg;
                voucherImage.SaveAs(Server.MapPath("~/Assets/Voucher/" + voucherImage.FileName));
                LblError.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                LblError.Text = errorMsg;
            }
        }
    }
}