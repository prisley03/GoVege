using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class CartRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();

        public static MsCart GetCartByCustIdAndProdId(int custId, int prodId)
        {
            return (from i in db.MsCarts where i.productID == prodId && i.userID == custId select i).FirstOrDefault();
        }

        public static List<MsCart> GetCartByCustId(int custId)
        {
            return (from i in db.MsCarts where i.userID == custId select i).ToList();
        }

        public static String CreateCart(int qty, int custId, int prodId)
        {
            MsCart newCart = CartFactory.CreateCart(qty, custId, prodId);
            db.MsCarts.Add(newCart);
            db.SaveChanges();
            return "Insert successful";
        }

        public static String UpdateCart(int qty, int custId, int prodId)
        {
            MsCart cartTarget = CartRepository.GetCartByCustIdAndProdId(custId, prodId);
            cartTarget.quantity = qty;
            db.SaveChanges();
            return "Update successful";
        }
    }
}