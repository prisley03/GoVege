using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Handler
{
    public class CartHandler
    {
        public static String CreateCart(string qty, string custId, string prodId)
        {
            MsCart cartTarget = CartRepository.GetCartByCustIdAndProdId(int.Parse(custId), int.Parse(prodId));
            MsProduct productTarget = ProductRepository.GetProductByID(int.Parse(prodId));

            if (cartTarget == null)
            {
                return CartRepository.CreateCart(int.Parse(qty), int.Parse(custId), int.Parse(prodId));
            }
            else
            {
                return CartRepository.UpdateCart(cartTarget.quantity + int.Parse(qty), int.Parse(custId), int.Parse(prodId));
            }
        }
    }
}