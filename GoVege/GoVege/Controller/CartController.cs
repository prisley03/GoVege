using GoVege.Handler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class CartController
    {
        public static String CreateCart(string qty, string custId, string prodId, int vendorID)
        {
            if (qty.Trim().Equals(""))
            {
                return "Quantity should not be empty";
            }
            else if(!qty.Trim().All(Char.IsDigit)){
                return "Quantity should be numeric";
            }
            else
            {
                return CartHandler.CreateCart(qty, custId, prodId, vendorID);
            }
        }

        public static String UpdateCart(string qty, string custId, string prodId)
        {
            return CartHandler.UpdateCart(qty, custId, prodId);
        }

        public static String AddQty(int custId, string prodId)
        {
            return CartHandler.AddQty(custId, prodId);
        }

        public static String RemoveQty(int custId, string prodId)
        {
            return CartHandler.RemoveQty(custId, prodId);
        }
    }
}