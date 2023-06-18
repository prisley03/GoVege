using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class UserRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();

        public static MsUser GetUserByID(int id)
        {
            return (from i in db.MsUsers where i.userID == id select i).FirstOrDefault();
        }

    }
}