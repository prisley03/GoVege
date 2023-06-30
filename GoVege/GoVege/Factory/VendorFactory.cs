using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class VendorFactory
    {
        public static MsVendor newVendor(string vendorName, string vendorAddress, string vendorRating, string vendorPreference, string vendorCategory, HttpPostedFile vendorImage)
        {
            MsVendor vendor = new MsVendor();
            vendor.vendorName = vendorName;
            vendor.vendorAddress = vendorAddress;
            vendor.vendorRating = float.Parse(vendorRating);
            vendor.vendorTypePreference = vendorPreference;
            if (vendorCategory.Equals("Indonesian"))
            {
                vendor.categoryID = 1;
            }
            else if (vendorCategory.Equals("Chinese"))
            {
                vendor.categoryID = 2;
            }
            else if (vendorCategory.Equals("Salad"))
            {
                vendor.categoryID = 3;
            }
            else if (vendorCategory.Equals("Rice"))
            {
                vendor.categoryID = 4;
            }
            else if (vendorCategory.Equals("International"))
            {
                vendor.categoryID = 5;
            }
            else if (vendorCategory.Equals("Coffee"))
            {
                vendor.categoryID = 6;
            }
            else if (vendorCategory.Equals("Dessert"))
            {
                vendor.categoryID = 7;
            }
            else if (vendorCategory.Equals("Breakfast"))
            {
                vendor.categoryID = 8;
            }
            vendor.vendorImage = vendorImage.FileName;
            return vendor;
        }
    }
}