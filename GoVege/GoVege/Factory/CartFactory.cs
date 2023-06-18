using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class CartFactory
    {
        public static MsCart CreateCart(int qty, int custId, int prodId)
        {
            return new MsCart
            {
                userID = custId,
                productID = prodId,
                quantity = qty
            };
        }
    }
}