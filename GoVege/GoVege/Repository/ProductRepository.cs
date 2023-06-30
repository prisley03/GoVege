using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class ProductRepository
    {
        public static GoVegeDBEntities db = DatabaseSingleton.GetInstance();
        public static List<MsProduct> GetProductsByVendorID(int id)
        {
            return (from i in db.MsProducts where i.vendorID == id select i).ToList();
        }

        public static MsProduct GetProductByID(int id)
        {
            return (from i in db.MsProducts where i.productID == id select i).FirstOrDefault();
        }

        public static void DeleteProductByProductID(int productID)
        {
            MsProduct product = GetProductByID(productID);
            db.MsProducts.Remove(product);
            db.SaveChanges();
        }

        public static string UpdateProductByProductID(int productID, String name, String price, String foodType, String cal, HttpPostedFile image, String filePath)
        {
            MsProduct product = ProductRepository.GetProductByID(productID);
            product.productName = name;
            product.productPrice = int.Parse(price);
            product.productFoodType = foodType;
            product.productCalories = int.Parse(cal);
            product.productImage = image.FileName;

            db.SaveChanges();
            return "Update successful!";
        }

        public static string InsertProduct(String name, String price, String foodType, String cal, HttpPostedFile image, int vendorID)
        {
            MsProduct newProduct = ProductFactory.CreateProduct(name, price, foodType, cal, image, vendorID);
            db.MsProducts.Add(newProduct);
            db.SaveChanges();
            return "Insert successful!";
        }
    }
}