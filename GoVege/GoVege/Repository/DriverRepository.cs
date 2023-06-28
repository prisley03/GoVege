using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class DriverRepository
    {
        private static GoVegeDBEntities db = new GoVegeDBEntities();

        public static List<MsDriver> GetAllDrivers()
        {
            return db.MsDrivers.ToList();
        }
    }
}