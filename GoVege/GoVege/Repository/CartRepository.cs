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

        public static bool AddCart()
        {
            return true;
        }
    }
}