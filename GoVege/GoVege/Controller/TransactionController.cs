using GoVege.Handler;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class TransactionController
    {
        public static String CheckOut(String date, String time, String address, String notes, List<MsCart> cartList, String payment, int voucherID, int userID)
        {
            if (date.Equals(""))
            {
                return "Please fill out delivery date";
            }
            else if (time.Equals(""))
            {
                return "Please fill out delivery time";
            }
            else if ((DateTime.Now.AddHours(1.5) > DateTime.Parse(date + " " + time)))
            {
                return "Please fill out a valid delivery date and time (at least 1.5 hours after your filled date-time)";
            }
            else if (address.Equals(""))
            {
                return "Please fill out delivery address";
            }
            else if (payment.Equals(""))
            {
                return "Please select a payment method";
            }
            else
            {
                return TransactionHandler.CheckOut(date, time, address, notes, cartList, payment, voucherID, userID);
            }
        }
    }
}