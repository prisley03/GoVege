using GoVege.Handler;
using GoVege.Model;
using GoVege.Repository;
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
        public static List<MsVendor> loadVegetarianAllVendor()
        {
            return VendorHandler.loadVegetarianAllVendor();
        }
        public static List<MsVendor> loadVeganVendor(int count)
        {
            return VendorHandler.loadVeganVendor(count);
        }
        public static List<MsVendor> loadVeganAllVendor()
        {
            return VendorHandler.loadVeganAllVendor();
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

        public static string insertVendor(string vendorName, string vendorAddress, string vendorRating, string vendorPreference, string vendorCategory , HttpPostedFile vendorImage)
        {
            if (vendorName.Trim().Equals(""))
            {
                return "Vendor name must be filled";
            }
            else if (vendorName.Length > 50)
            {
                return "Vendor name must not be longer than 50 characters";
            }
            else if (vendorCategory != "Indonesian" && vendorCategory != "Chinese" && vendorCategory != "Salad" && vendorCategory != "Rice" &&
                vendorCategory != "International" && vendorCategory != "Coffee" && vendorCategory != "Dessert" && vendorCategory != "Breakfast")
            {
                return "Vendor category must not be \"Indonesian\"or \"Chinese\" or \"Salad\" or \"Rice\" or \"International\" or \"Coffee\" or \"Dessert\" or \"Breakfast\" ";
            }
            else if (vendorPreference.Trim().Equals(""))
            {
                return "Vendor name must be filled";
            }
            else if (vendorPreference.Length > 50)
            {
                return "Vendor preference must not be longer than 50 characters";
            }
            else if (!vendorPreference.Equals("Vegetarian") && !vendorPreference.Equals("Vegan") && !vendorPreference.Equals("Admin"))
            {
                return "Vendor preference must be Vegetarian, Vegan, or Admin";
            }
            else if (vendorAddress.Trim().Equals(""))
            {
                return "Vendor Address must be filled";
            }
            else if (vendorAddress.Length > 255)
            {
                return "Vendor Address must not be longer than 255 characters";
            }
            else if (vendorRating.Trim().Equals(""))
            {
                return "Vendor rating must be filled";
            }
            else if (float.Parse(vendorRating) < 0 || float.Parse(vendorRating) > 5)
            {
                return "vendor rating must be between 0 and 5";
            }
            else if (vendorImage.Equals(""))
            {
                return "vendor Image must not be empty";
            }
            else if (vendorImage.FileName.Equals(""))
            {
                return "vendor Image file name must not be empty";
            }
            else if (
                    !(vendorImage.ContentType.Equals("image/png") ||
                    vendorImage.ContentType.Equals("image/jpg") ||
                    vendorImage.ContentType.Equals("image/jpeg") ||
                    vendorImage.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else
            {
                return VendorRepository.insertVendor(vendorName, vendorAddress, vendorRating, vendorPreference, vendorCategory, vendorImage);
            }
        }

        public static string updateVendor(int vendorID, string vendorName, string vendorAddress, string vendorRating, string vendorPreference, string vendorCategory, HttpPostedFile vendorImage)
        {
            if (vendorName.Trim().Equals(""))
            {
                return "Vendor name must be filled";
            }
            else if (vendorName.Length > 50)
            {
                return "Vendor name must not be longer than 50 characters";
            }
            else if (vendorCategory != "Indonesian" && vendorCategory != "Chinese" && vendorCategory != "Salad" && vendorCategory != "Rice" &&
                vendorCategory != "International" && vendorCategory != "Coffee" && vendorCategory != "Dessert" && vendorCategory != "Breakfast")
            {
                return "Vendor category must not be \"Indonesian\"or \"Chinese\" or \"Salad\" or \"Rice\" or \"International\" or \"Coffee\" or \"Dessert\" or \"Breakfast\" ";
            }
            else if (vendorPreference.Trim().Equals(""))
            {
                return "Vendor name must be filled";
            }
            else if (vendorPreference.Length > 50)
            {
                return "Vendor preference must not be longer than 50 characters";
            }
            else if (!vendorPreference.Equals("Vegetarian") && !vendorPreference.Equals("Vegan") && !vendorPreference.Equals("Admin"))
            {
                return "Vendor preference must be Vegetarian, Vegan, or Admin";
            }
            else if (vendorAddress.Trim().Equals(""))
            {
                return "Vendor Address must be filled";
            }
            else if (vendorAddress.Length > 255)
            {
                return "Vendor Address must not be longer than 255 characters";
            }
            else if (vendorRating.Trim().Equals(""))
            {
                return "Vendor rating must be filled";
            }
            else if (float.Parse(vendorRating) < 0 || float.Parse(vendorRating) > 5)
            {
                return "vendor rating must be between 0 and 5";
            }
            else if (vendorImage.Equals(""))
            {
                return "vendor Image must not be empty";
            }
            else if (vendorImage.FileName.Equals(""))
            {
                return "vendor Image file name must not be empty";
            }
            else if (
                    !(vendorImage.ContentType.Equals("image/png") ||
                    vendorImage.ContentType.Equals("image/jpg") ||
                    vendorImage.ContentType.Equals("image/jpeg") ||
                    vendorImage.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else
            {
                return VendorRepository.updateVendor(vendorID,vendorName, vendorAddress, vendorRating, vendorPreference, vendorCategory, vendorImage);
            }
        }

    }
}