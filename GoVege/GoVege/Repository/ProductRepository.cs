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
    }
}