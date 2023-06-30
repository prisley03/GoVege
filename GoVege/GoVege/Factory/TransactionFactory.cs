using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class TransactionFactory
    {
        public static MsTransaction CreateTransactionHeader(String date, String time, String address, String notes, String payment, int voucherID, int userID, int driverID)
        {
            return new MsTransaction
            {
                deliveryDate = DateTime.Parse(date),
                deliveryTime = TimeSpan.Parse(time),
                deliveryAddress = address,
                deliveryNotes = notes,
                paymentMethod = payment,
                voucherID = voucherID,
                userID = userID,
                driverID = driverID
            };
        }

        public static MsTransaction CreateTransactionHeader(String date, String time, String address, String notes, String payment, int userID, int driverID)
        {
            return new MsTransaction
            {
                deliveryDate = DateTime.Parse(date),
                deliveryTime = TimeSpan.Parse(time),
                deliveryAddress = address,
                deliveryNotes = notes,
                paymentMethod = payment,
                voucherID = null,
                userID = userID,
                driverID = driverID
            };
        }

        public static MsTransactionDetail CreateTransactionDetail(int transactionID, int productID, int quantity)
        {
            return new MsTransactionDetail
            {
                transactionID = transactionID,
                productID  = productID,
                quantity = quantity
            };
        }
    }
}