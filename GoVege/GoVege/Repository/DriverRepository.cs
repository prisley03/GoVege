using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class DriverRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();
        public static List<MsDriver> getAllDriver()
        {
            return db.MsDrivers.ToList();
        }

        public static MsDriver getDriver(String id)
        {
            int realId = int.Parse(id);
            return db.MsDrivers.Find(realId);
        }

        public static void deleteDriver(MsDriver Driver)
        {
            db.MsDrivers.Remove(Driver);
            db.SaveChanges();
        }

        public static Boolean isNameUnique(String name)
        {
            return db.MsDrivers.Any(x => x.driverName.Equals(name));
        }

        public static void updateDriver(String name, String LP, String vehicleName, String image, MsDriver Driver)
        {
            Driver.driverName = name;
            Driver.driverLicensePlate = LP;
            Driver.driverVehicleName = vehicleName;
            Driver.driverImage = image;
            db.SaveChanges();
        }

        public static void createDriver(MsDriver Driver)
        {
            db.MsDrivers.Add(Driver);
            db.SaveChanges();
        }
    }
}