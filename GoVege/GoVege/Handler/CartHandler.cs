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
        public static String CreateCart(string qty, string custId, string prodId, int vendorID)
        {
            MsCart cartTarget = CartRepository.GetCartByCustIdAndProdId(int.Parse(custId), int.Parse(prodId));
            MsCart cartFirstItem = CartRepository.GetFirstCartByCustId(int.Parse(custId));
            int cartFirstVendor;

            if(cartTarget != null)
            {
                cartFirstVendor = cartTarget.productID;
            }
            MsProduct productTarget = ProductRepository.GetProductByID(int.Parse(prodId));

            if (cartTarget == null)
            {
                if (cartFirstItem == null)
                {
                    return CartRepository.CreateCart(int.Parse(qty), int.Parse(custId), int.Parse(prodId));
                }
                else
                {
                    MsProduct product = ProductRepository.GetProductByID(cartFirstItem.productID);
                    if (productTarget.vendorID == product.vendorID)
                    {
                        return CartRepository.CreateCart(int.Parse(qty), int.Parse(custId), int.Parse(prodId));
                    }
                    else
                    {
                        return "You must remove all items from cart before adding one from a different vendor.";
                    }
                }

                // testing
                //return CartRepository.CreateCart(int.Parse(qty), int.Parse(custId), int.Parse(prodId));
            }
            else
            {
                return CartRepository.UpdateCart(cartTarget.quantity + int.Parse(qty), int.Parse(custId), int.Parse(prodId));
            }
        }

        public static String UpdateCart(string qty, string custId, string prodId)
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

        public static String AddQty(int custId, string prodId)
        {
            MsCart cartTarget = CartRepository.GetCartByCustIdAndProdId(custId, int.Parse(prodId));
            int qty = cartTarget.quantity;
            return CartRepository.UpdateCart(qty + 1, custId, int.Parse(prodId));
        }

        public static String RemoveQty(int custId, string prodId)
        {
            MsCart cartTarget = CartRepository.GetCartByCustIdAndProdId(custId, int.Parse(prodId));
            int qty = cartTarget.quantity;

            if (qty - 1 == 0)
            {
                return CartRepository.DeleteCart(cartTarget);
            }
            else
            {
                return CartRepository.UpdateCart(qty - 1, custId, int.Parse(prodId));
            }
        }
    }
}