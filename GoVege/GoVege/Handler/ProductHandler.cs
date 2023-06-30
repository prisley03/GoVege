using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace GoVege.Handler
{
    public class ProductHandler
    {
        public static void deleteImageFile(string filePath)
        {
            try
            {
                File.Delete(filePath);
            }
            catch (IOException a)
            {
                Console.WriteLine("Error deleting : " + a.Message);
            }
        }

        public static void DeleteProductByProductID(int productID)
        {
            ProductRepository.DeleteProductByProductID(productID);
            TransactionHandler.CheckEmptyTransactions();
        }

        public static string UpdateProductByProductID(int productID, String name, String price, String foodType, String cal, HttpPostedFile image, String filePath)
        {
            String imageUrlNew = image.FileName;
            MsProduct product = ProductRepository.GetProductByID(productID);
            String imageUrl = product.productImage.ToString();

            return ProductRepository.UpdateProductByProductID(productID, name, price, foodType, cal, image, filePath);
        }

        public static string InsertProduct(String name, String price, String foodType, String cal, HttpPostedFile image, int vendorID)
        {
            return ProductRepository.InsertProduct(name, price, foodType, cal, image, vendorID);
        }
    }
}