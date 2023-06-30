using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class ProductFactory
    {
        public static MsProduct CreateProduct(String name, String price, String foodType, String cal, HttpPostedFile image, int vendorID)
        {
            return new MsProduct
            {
                productName = name,
                productPrice = int.Parse(price),
                productCalories = int.Parse(cal),
                productFoodType = foodType,
                productImage = image.FileName,
                vendorID = vendorID
            };
        }
    }
}