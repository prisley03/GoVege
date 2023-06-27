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
    public partial class PromotionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<MsVoucher> promotions = PromotionController.getAllPromotion();
                PromotionRepeater.DataSource = promotions;
                PromotionRepeater.DataBind();
            }
        }

        protected void restoBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }
    }
}