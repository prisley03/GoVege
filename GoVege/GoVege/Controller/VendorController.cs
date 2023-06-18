using GoVege.Handler;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class VendorController
    {
        public static List<MsVendor> loadVegetarianVendor(int count)
        {
            return VendorHandler.loadVegetarianVendor(count);
        }
        public static List<MsVendor> loadVeganVendor(int count)
        {
            return VendorHandler.loadVeganVendor(count);
        }
        public static List<MsVendorCategory> loadRecommendedCategories(int count)
        {
            return VendorHandler.loadRecommendedCategories(count);
        }
        public static MsVendor getVendorByID(int id)
        {
            return VendorHandler.getVendorByID(id);
        }
        public static List<MsVendor> loadVendorByName(string name, string preference)
        {
            return VendorHandler.loadVendorByName(name, preference);
        }
        public static List<MsVendor> loadVendorByCategory(int id, string preference)
        {
            return VendorHandler.loadVendorByCategory(id, preference);
        }
    }
}