using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class VoucherRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();
        public static List<MsVoucher> loadAllVoucher()
        {
            return (from i in db.MsVouchers select i).ToList();
        }
        public static List<MsVoucher> loadVoucherByName(string name)
        {
            return (from i in db.MsVouchers where i.voucherName.Contains(name) select i).ToList();
        }
        public static MsVoucher getVoucherByID(int id)
        {
            return (from i in db.MsVouchers where i.voucherID == id select i).FirstOrDefault();
        }

        public static void deleteVoucherByID(int id)
        {
            MsVoucher deletedVoucher = (from i in db.MsVouchers where i.voucherID == id select i).FirstOrDefault();
            db.MsVouchers.Remove(deletedVoucher);
            db.SaveChanges();
        }
        public static string insertVoucher(string voucherName, string voucherDesc, string voucherDateS, string voucherDateE, string voucherDiscount, HttpPostedFile voucherImage)
        {
            MsVoucher voucher = VoucherFactory.newVendor(voucherName, voucherDesc, voucherDateS, voucherDateE, voucherDiscount, voucherImage);
            db.MsVouchers.Add(voucher);
            db.SaveChanges();

            return "Insert Successful";
        }

        public static string updateVoucher(int voucherID, string voucherName, string voucherDesc, string dateS, string dateE, string discount, HttpPostedFile voucherImage)
        {
            MsVoucher voucher = getVoucherByID(voucherID);
            voucher.voucherName = voucherName;
            voucher.description = voucherDesc;
            voucher.startDate = DateTime.Parse(dateS);
            voucher.endDate = DateTime.Parse(dateE);
            voucher.discountAmount = float.Parse(discount);
            voucher.photo = voucherImage.FileName;
            db.SaveChanges();

            return "Update Successful";
        }
    }
}