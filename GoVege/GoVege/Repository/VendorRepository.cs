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
        public static List<MsVendor> loadVeganVendor(int count)
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals("Vegan") select i).Take(count).ToList();
        }
        public static List<MsVendorCategory> loadRecommendedCategories(int count)
        {
            return (from i in db.MsVendorCategories select i).Take(count).ToList();
        }
        public static MsVendor getVendorByID(int id)
        {
            return (from i in db.MsVendors where i.vendorID == id select i).FirstOrDefault();
        }
        public static List<MsVendor> loadVendorByName(string name, string preference)
        {
            return (from i in db.MsVendors where i.vendorTypePreference.Equals(preference) && i.vendorName.Contains(name) orderby i.vendorRating select i).Take(10).ToList(); 
        }
        public static List<MsVendor> loadVendorByCategory(int id, string preference)
        {
            return (from i in db.MsVendors where (i.vendorTypePreference.Equals(preference) && i.categoryID==id) select i).Take(10).ToList();
        }
    }
}