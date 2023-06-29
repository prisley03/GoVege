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

    }
}