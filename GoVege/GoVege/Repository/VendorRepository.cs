using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class VendorRepository
    {
        public static GoVegeDBEntities db = DatabaseSingleton.GetInstance();
        public static MsVendor GetVendorByID(int id)
        {
            return (from i in db.MsVendors where i.vendorID == id select i).FirstOrDefault();
        }
    }
}