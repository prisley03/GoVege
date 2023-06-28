using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace GoVege.View
{
    public partial class OrderTrackingPage : System.Web.UI.Page
    {
        public int transactionID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TransactionID"] == null)
            {
                Response.Redirect("~/View/HomePage.aspx");
            }

            transactionID = Convert.ToInt32(Request.QueryString["TransactionID"]);
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();
            var order = db.MsTransactions.FirstOrDefault(t => t.transactionID == transactionID);
            if (order != null)
            {
                var vendor = GetVendor(order.transactionID);

                string driverImage = order.MsDriver.driverImage;
                imgDriverPhoto.Attributes["src"] = "../Assets/Driver/" + driverImage;
                lblDriverName.Text = order.MsDriver.driverName;
                lblDriverRating.Text = order.MsDriver.driverRating.ToString();
                lblVehicleName.Text = order.MsDriver.driverVehicleName;
                lblLicensePlate.Text = order.MsDriver.driverLicensePlate;

                DeliveryDetailTable.Rows[0].Cells[1].Text = vendor.vendorName;
                DeliveryDetailTable.Rows[1].Cells[1].Text = vendor.vendorAddress;
                DeliveryDetailTable.Rows[2].Cells[1].Text = order.deliveryAddress;
                DeliveryDetailTable.Rows[3].Cells[1].Text = order.deliveryNotes;
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
            OrderSummaryRepeater(transactionID);
        }

        private MsVendor GetVendor(int transactionID)
        {
            using (GoVegeDBEntities db = DatabaseSingleton.GetInstance())
            {
                var query = from td in db.MsTransactionDetails
                            join p in db.MsProducts on td.productID equals p.productID
                            join v in db.MsVendors on p.vendorID equals v.vendorID
                            where td.transactionID == transactionID
                            select v;

                return query.FirstOrDefault();
            }
        }

        private void OrderSummaryRepeater(int transactionID)
        {
            GoVegeDBEntities db = DatabaseSingleton.GetInstance();
            var query = from td in db.MsTransactionDetails
                        where td.transactionID == transactionID
                        select new
                        {
                            Quantity = td.quantity,
                            FoodName = td.MsProduct.productName,
                            Price = td.MsProduct.productPrice,
                            Subtotal = td.quantity * td.MsProduct.productPrice
                        };

            var queryResults = query.ToList();

            double subtotal = queryResults.Sum(item => item.Subtotal);
            double deliveryFee = 10000;
            double discountVoucher = 0;
            double total = subtotal + deliveryFee;
            int voucherID;
            string voucherName = string.Empty;

            var voucher = (from td in db.MsTransactionDetails
                           join t in db.MsTransactions on td.transactionID equals t.transactionID
                           join v in db.MsVouchers on t.voucherID equals v.voucherID
                           where td.transactionID == transactionID
                           select v).FirstOrDefault();

            if (voucher != null)
            {
                voucherID = voucher.voucherID;
                voucherName = voucher.voucherName;
                double discountAmount = voucher.discountAmount;
                discountVoucher = subtotal * discountAmount;
                total -= discountVoucher;
            }

            var subtotalItem = new
            {
                Quantity = "",
                FoodName = "Sub Total:",
                Price = "",
                Subtotal = "Rp" + subtotal.ToString("#,#")
            };

            var deliveryFeeItem = new
            {
                Quantity = "",
                FoodName = "Delivery Fee:",
                Price = "",
                Subtotal = "Rp" + deliveryFee.ToString("#,#")
            };

            var discountItem = new
            {
                Quantity = "",
                FoodName = "" + voucherName,
                Price = "",
                Subtotal = "Rp" + discountVoucher.ToString("#,#")
            };

            var totalItem = new
            {
                Quantity = "",
                FoodName = "Total:",
                Price = "",
                Subtotal = "Rp" + total.ToString("#,#")
            };

            var ordersummaryItems = new List<object>(queryResults);
            ordersummaryItems.Add(subtotalItem);
            ordersummaryItems.Add(deliveryFeeItem);
            if (voucher != null)
            {
                ordersummaryItems.Add(discountItem);
            }
            ordersummaryItems.Add(totalItem);

            RepeaterOrderSummary.DataSource = ordersummaryItems;
            RepeaterOrderSummary.DataBind();
        }
    }
}
