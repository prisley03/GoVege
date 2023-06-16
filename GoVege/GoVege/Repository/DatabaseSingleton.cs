using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class DatabaseSingleton
    {
        private static GoVegeDBEntities db = null;
        
        public static GoVegeDBEntities GetInstance()
        {
            return (db == null) ? new GoVegeDBEntities() : db;
        }
    }
}