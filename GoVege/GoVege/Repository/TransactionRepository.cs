using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class TransactionRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();

        public static List<MsTransaction> GetAllTransactions()
        {
            return db.MsTransactions.ToList();
        }

        public static void DeleteTransactionHeader(MsTransaction trans)
        {
            db.MsTransactions.Remove(trans);
            db.SaveChanges();
            return;
        }

        public static void InsertTransactionDetails(int transactionID, int productID, int qty)
        {
            MsTransactionDetail newTransactionDetail = TransactionFactory.CreateTransactionDetail(transactionID, productID, qty);
            db.MsTransactionDetails.Add(newTransactionDetail);
            db.SaveChanges();
        }

        public static List<MsTransactionDetail> GetTransactionDetailsByTransactionID(int transactionID)
        {
            return (from i in db.MsTransactionDetails where i.transactionID == transactionID select i).ToList();
        }

        public static int InsertTransaction(String date, String time, String address, String notes, String payment, int voucherID, int userID, int driverID)
        {
            MsTransaction newTransaction = TransactionFactory.CreateTransactionHeader(date, time, address, notes, payment, voucherID, userID, driverID);
            db.MsTransactions.Add(newTransaction);
            db.SaveChanges();
            return newTransaction.transactionID;
        }

        public static int InsertTransaction(String date, String time, String address, String notes, String payment, int userID, int driverID)
        {
            MsTransaction newTransaction = TransactionFactory.CreateTransactionHeader(date, time, address, notes, payment, userID, driverID);
            db.MsTransactions.Add(newTransaction);
            db.SaveChanges();
            return newTransaction.transactionID;
        }
    }
}