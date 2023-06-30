using GoVege.Factory;
using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Handler
{
    public class DriverHandler
    {
        public static List<MsDriver> getAllDriver()
        {
            return DriverRepository.getAllDriver();
        }

        public static MsDriver getDriver(String id)
        {
            return DriverRepository.getDriver(id);
        }

        public static void deleteDriver(String id)
        {
            MsDriver Driver = DriverRepository.getDriver(id);
            DriverRepository.deleteDriver(Driver);
        }

        public static Boolean isNameUnique(String name)
        {
            return DriverRepository.isNameUnique(name);
        }

        public static void updateDriver(String name, String LP, String vehicleName, String image, String id)
        {
            MsDriver Driver = DriverRepository.getDriver(id);
            DriverRepository.updateDriver(name, LP, vehicleName, image, Driver);
        }

        public static void createDriver(String name, String LP, String vehicleName, String image)
        {
            MsDriver Driver = DriverFactory.createDriver(name, LP, vehicleName, image);
            DriverRepository.createDriver(Driver);
        }

    }
}