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
    public partial class OrderTrackingPage : System.Web.UI.Page
    {
        public int transactionID;

        protected void Page_Load(object sender, EventArgs e)
        {
            transactionID = 1;
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
            BindRepeater(transactionID);


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


        private void BindRepeater(int transactionID)
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

            RepeaterOrderSummary.DataSource = query.ToList();
            RepeaterOrderSummary.DataBind();
        }
    }
}
