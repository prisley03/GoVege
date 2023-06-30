using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Factory
{
    public class DriverFactory
    {

        public static MsDriver createDriver(String name, String LP, String vehicleName, String image)
        {
            MsDriver Driver = new MsDriver();
            Driver.driverName = name;
            Driver.driverLicensePlate = LP;
            Driver.driverVehicleName = vehicleName;
            Driver.driverImage = image;
            Driver.driverRating = 0;

            return Driver;
        }

    }
}