using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoVege.Model;

namespace GoVege.Factory
{
    public class CustomerFactory
    {
        public static MsUser CreateCustomer(string fullName, string phoneNum, string email, string password, string foodPref)
        {
            return new MsUser()
            {
                userName = fullName,
                userPhone = phoneNum,
                userPassword = password,
                userEmail = email,
                userFoodPreference = foodPref,
                userImage = "kanye.jpg"
            };
        }
    }
}