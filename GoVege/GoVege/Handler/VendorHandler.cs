using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Handler
{
    public class VendorHandler
    {
        public static List<MsVendor> loadVegetarianVendor(int count)
        {
            return VendorRepository.loadVegetarianVendor(count);
        }
        public static List<MsVendor> loadVegetarianAllVendor()
        {
            return VendorRepository.loadVegetarianAllVendor();
        }
        public static List<MsVendor> loadVeganVendor(int count)
        {
            return VendorRepository.loadVeganVendor(count);
        }
        public static List<MsVendor> loadVeganAllVendor()
        {
            return VendorRepository.loadVeganAllVendor();
        }
        public static List<MsVendorCategory> loadRecommendedCategories(int count)
        {
            return VendorRepository.loadRecommendedCategories(count);
        }
        public static MsVendor getVendorByID(int id)
        {
            return VendorRepository.getVendorByID(id);
        }
        public static List<MsVendor> loadVendorByName(string name, string preference)
        {
            return VendorRepository.loadVendorByName(name, preference);
        }
        public static List<MsVendor> loadVendorByCategory(int id, string preference)
        {
            return VendorRepository.loadVendorByCategory(id, preference);
        }
    }
}