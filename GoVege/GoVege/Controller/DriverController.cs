using GoVege.Handler;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class DriverController
    {

        public static List<MsDriver> getAllDriver()
        {
            return DriverHandler.getAllDriver();
        }

        public static MsDriver getDriver(String id)
        {
            return DriverHandler.getDriver(id);
        }
        public static void deleteDriver(String id)
        {
            DriverHandler.deleteDriver(id);
        }

        public static String updateDriver(String name, String LP, String vehicleName, HttpPostedFile image, String id)
        {
            if (!(image.FileName.EndsWith(".jpg") || image.FileName.EndsWith(".jpeg") || image.FileName.EndsWith(".png") || image.FileName.EndsWith(".jfif")))
            {
                return "Extentions must be .jpg or .jpeg or .png or .jfif";
            }

            if (image.ContentLength > 5000000)
            {
                return "File must be lower than 5MB";
            }

            String fileName = image.FileName;
            DriverHandler.updateDriver(name, LP, vehicleName, fileName, id);
            return "Update Successfull!";

        }

        public static String insertDriver(String name, String LP, String vehicleName, HttpPostedFile image)
        {
            if (!(image.FileName.EndsWith(".jpg") || image.FileName.EndsWith(".jpeg") || image.FileName.EndsWith(".png") || image.FileName.EndsWith(".jfif")))
            {
                return "Extentions must be .jpg or .jpeg or .png or .jfif";
            }

            if (image.ContentLength > 5000000)
            {
                return "File must be lower than 5MB";
            }

            if (DriverHandler.isNameUnique(name).Equals(true))
            {
                return "Name must be unique!";
            }

            String fileName = image.FileName;
            DriverHandler.createDriver(name, LP, vehicleName, fileName);
            return "Insert Successfull!";

        }

    }
}