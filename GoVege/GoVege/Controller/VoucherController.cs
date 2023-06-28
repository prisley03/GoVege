using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class VoucherController
    {
        public static string insertVoucher(string voucherName, string voucherDesc, string voucherDateS, string voucherDateE,string voucherDiscount, HttpPostedFile voucherImage)
        {
            if (voucherName.Trim().Equals(""))
            {
                return "Voucher name must be filled";
            }
            else if (voucherName.Length > 50)
            {
                return "Voucher name must not be longer than 50 characters";
            }
            else if (voucherDesc.Trim().Equals(""))
            {
                return "Voucher description must be filled";
            }
            else if (voucherDesc.Length > 255)
            {
                return "Voucher description must not be longer than 255 characters";
            }
            else if (voucherDateS.Trim().Equals(""))
            {
                return "Voucher start date must be filled";
            }
            else if (voucherDateE.Trim().Equals(""))
            {
                return "Voucher End date must be filled";
            }
            else if (voucherImage.Equals(""))
            {
                return "Voucher Image must not be empty";
            }
            else if (voucherImage.FileName.Equals(""))
            {
                return "Voucher Image file name must not be empty";
            }
            else if (
                    !(voucherImage.ContentType.Equals("image/png") ||
                    voucherImage.ContentType.Equals("image/jpg") ||
                    voucherImage.ContentType.Equals("image/jpeg") ||
                    voucherImage.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else
            {
                return VoucherRepository.insertVoucher(voucherName, voucherDesc, voucherDateS, voucherDateE, voucherDiscount, voucherImage);
            }
        }

        public static string updateVoucher(int voucherID, string voucherName, string voucherDesc, string voucherDateS, string voucherDateE, string voucherDiscount, HttpPostedFile voucherImage)
        {
            if (voucherName.Trim().Equals(""))
            {
                return "Voucher name must be filled";
            }
            else if (voucherName.Length > 50)
            {
                return "Voucher name must not be longer than 50 characters";
            }
            else if (voucherDesc.Trim().Equals(""))
            {
                return "Voucher description must be filled";
            }
            else if (voucherDesc.Length > 255)
            {
                return "Voucher description must not be longer than 255 characters";
            }
            else if (voucherDateS.Trim().Equals(""))
            {
                return "Voucher start date must be filled";
            }
            else if (voucherDateE.Trim().Equals(""))
            {
                return "Voucher End date must be filled";
            }
            else if (voucherImage.Equals(""))
            {
                return "Voucher Image must not be empty";
            }
            else if (voucherImage.FileName.Equals(""))
            {
                return "Voucher Image file name must not be empty";
            }
            else if (
                    !(voucherImage.ContentType.Equals("image/png") ||
                    voucherImage.ContentType.Equals("image/jpg") ||
                    voucherImage.ContentType.Equals("image/jpeg") ||
                    voucherImage.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else
            {
                return VoucherRepository.updateVoucher(voucherID, voucherName, voucherDesc, voucherDateS, voucherDateE, voucherDiscount, voucherImage);
            }
        }
    }
}