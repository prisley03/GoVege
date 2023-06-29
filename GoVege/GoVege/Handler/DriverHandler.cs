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

    }
}