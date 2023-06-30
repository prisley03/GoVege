using GoVege.Handler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class ProductController
    {
        public static string InsertProduct(String name, String price, String foodType, String cal, HttpPostedFile image, int vendorID)
        {
            if (name.Trim().Equals(""))
            {
                return "Product name must be filled";
            }
            else if (name.Length > 250)
            {
                return "Product name must not be longer than 250 characters";
            }
            else if (price.Trim().Equals(""))
            {
                return "Product price must be filled";
            }
            else if (foodType.Trim().Equals(""))
            {
                return "Food type must be selected";
            }
            else if (cal.Trim().Equals(""))
            {
                return "Calories must be filled";
            }
            else if (image.Equals(""))
            {
                return "Product image must not be empty";
            }
            else if (image.FileName.Equals(""))
            {
                return "Product image file name must not be empty";
            }
            else if (
                    !(image.ContentType.Equals("image/png") ||
                    image.ContentType.Equals("image/jpg") ||
                    image.ContentType.Equals("image/jpeg") ||
                    image.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else if (image.ContentLength >= 2000000)
            {
                return "File size must be lower than 2MB.";
            }
            else
            {
                return ProductHandler.InsertProduct(name, price, foodType, cal, image, vendorID);
            }
        }

        public static string UpdateProductByProductID(int productID, String name, String price, String foodType, String cal, HttpPostedFile image, String filePath)
        {
            if (name.Trim().Equals(""))
            {
                return "Product name must be filled";
            }
            else if (name.Length > 250)
            {
                return "Product name must not be longer than 250 characters";
            }
            else if (price.Trim().Equals(""))
            {
                return "Product price must be filled";
            }
            else if (foodType.Trim().Equals(""))
            {
                return "Food type must be selected";
            }
            else if (cal.Trim().Equals(""))
            {
                return "Calories must be filled";
            }
            else if (image.Equals(""))
            {
                return "Product image must not be empty";
            }
            else if (image.FileName.Equals(""))
            {
                return "Product image file name must not be empty";
            }
            else if (
                    !(image.ContentType.Equals("image/png") ||
                    image.ContentType.Equals("image/jpg") ||
                    image.ContentType.Equals("image/jpeg") ||
                    image.ContentType.Equals("image/jfif"))
                    )
            {
                return "File extension must be .png, .jpg, .jpeg, or .jfif, ";
            }
            else if (image.ContentLength >= 2000000)
            {
                return "File size must be lower than 2MB.";
            }
            else
            {
                return ProductHandler.UpdateProductByProductID(productID, name, price, foodType, cal, image, filePath);
            }
        }
    }
}