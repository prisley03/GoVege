using GoVege.Factory;
using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Handler
{
    public class TransactionHandler
    {
        public static String CheckOut(String date, String time, String address, String notes, List<MsCart> cartList, String payment, int voucherID, int userID)
        {
            Random rnd = new Random();
            List<MsDriver> driverList = DriverRepository.getAllDriver();
            int driverID = rnd.Next(1, driverList.Count());
            int transactionID;

            if (voucherID == 0)
            {
                transactionID = TransactionRepository.InsertTransaction(date, time, address, notes, payment, userID, driverID);
            }
            else 
            { 
                transactionID = TransactionRepository.InsertTransaction(date, time, address, notes, payment, voucherID, userID, driverID);
            }
            
            foreach(var item in cartList)
            {
                TransactionRepository.InsertTransactionDetails(transactionID, item.productID, item.quantity);
            }

            CartRepository.DeleteCartList(cartList);

            return transactionID.ToString();
        }

        public static void CheckEmptyTransactions()
        {
            List<MsTransaction> transList = TransactionRepository.GetAllTransactions();
            foreach (var trans in transList)
            {
                if (TransactionRepository.GetTransactionDetailsByTransactionID(trans.transactionID).Count() == 0)
                {
                    TransactionRepository.DeleteTransactionHeader(trans);
                }
            }
        }

    }
}