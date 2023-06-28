using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class VoucherFactory
    {
        public static MsVoucher newVendor(string voucherName, string voucherDesc, string voucherDateS, string voucherDateE, string voucherDiscount, HttpPostedFile voucherImage)
        {
            MsVoucher voucher = new MsVoucher();
            voucher.voucherName = voucherName;
            voucher.description = voucherDesc;
            voucher.startDate = DateTime.Parse(voucherDateS);
            voucher.endDate = DateTime.Parse(voucherDateE);
            voucher.discountAmount = float.Parse(voucherDiscount);
            voucher.photo = voucherImage.FileName;
            return voucher;
        }
    }
}