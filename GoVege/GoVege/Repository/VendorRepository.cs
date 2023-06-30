using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class VendorRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();
        public static List<MsVendor> loadVegetarianVendor(int count)
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals("Vegetarian") select i).Take(count).ToList();
        }
        public static List<MsVendor> loadVegetarianAllVendor()
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals("Vegetarian") select i).ToList();
        }
        public static List<MsVendor> loadVeganVendor(int count)
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals("Vegan") select i).Take(count).ToList();
        }
        public static List<MsVendor> loadVeganAllVendor()
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals("Vegan") select i).ToList();
        }
        public static List<MsVendorCategory> loadRecommendedCategories(int count)
        {
            return (from i in db.MsVendorCategories select i).Take(count).ToList();
        }

        public static void deleteVendorByID(int id)
        {
            MsVendor deletedVendor = (from i in db.MsVendors where i.vendorID == id select i).FirstOrDefault();
            db.MsVendors.Remove(deletedVendor);
            db.SaveChanges();
        }
        public static MsVendor getVendorByID(int id)
        {
            return (from i in db.MsVendors where i.vendorID == id select i).FirstOrDefault();
        }
        public static List<MsVendor> loadVendorByName(string name, string preference)
        {
            if (preference.Equals("All"))
            {
                return (from i in db.MsVendors where i.vendorName.Contains(name) orderby i.vendorRating select i).ToList();
            }
            else
            {
                return (from i in db.MsVendors where i.vendorTypePreference.Equals(preference) && i.vendorName.Contains(name) orderby i.vendorRating select i).ToList();
            }
        }
        public static List<MsVendor> loadVendorByCategory(int id, string preference)
        {
            return (from i in db.MsVendors where (i.vendorTypePreference.Equals(preference) && i.categoryID==id) select i).Take(10).ToList();
        }
        public static string insertVendor(string vendorName, string vendorAddress, string vendorRating, string vendorPreference, string vendorCategory, HttpPostedFile vendorImage)
        {
            MsVendor vendor = VendorFactory.newVendor(vendorName, vendorAddress, vendorRating, vendorPreference, vendorCategory, vendorImage);
            db.MsVendors.Add(vendor);
            db.SaveChanges();

            return "Insert Successful";
        }

        public static string updateVendor(int vendorID, string vendorName, string vendorAddress, string vendorRating, string vendorPreference, string vendorCategory, HttpPostedFile vendorImage)
        {
            MsVendor vendor = getVendorByID(vendorID);
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
            db.SaveChanges();

            return "Update Successful";
        }
    }
}