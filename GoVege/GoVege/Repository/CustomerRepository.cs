using GoVege.Factory;
using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class CustomerRepository
    {
        private static GoVegeDBEntities db = DatabaseSingleton.GetInstance();

        public static void AddCustomer(string fullName, string phoneNum, string email, string password, string foodPref)
        {
            MsUser newUser = CustomerFactory.CreateCustomer(fullName, phoneNum, email, password, foodPref);
            db.MsUsers.Add(newUser);
            db.SaveChanges();
        }

        public static MsUser GetCustomerByEmail(string email)
        {
            return (from i in db.MsUsers where i.userEmail.Equals(email) select i).FirstOrDefault();
        }

        public static MsUser GetCustomerByEmailAndPassword(string email, string password)
        {
            return (from cust in db.MsUsers where cust.userEmail.Equals(email) && cust.userPassword.Equals(password) select cust).FirstOrDefault();
        }
        public static MsUser GetCustomerById(int id)
        {
            return (from i in db.MsUsers where i.userID.Equals(id) select i).FirstOrDefault();
        }

        public static void DeleteCustomerById(int id)
        {
            MsUser nUser = GetCustomerById(id);
            db.MsUsers.Remove(null);
            db.SaveChanges();
        }

        public static void UpdateCustomer(string fullName, string phoneNum, string email, string password, string foodPref, int id)
        {
            MsUser nUser = GetCustomerById(id);
            nUser.userName = fullName;
            nUser.userPhone = phoneNum;
            nUser.userEmail = email;
            nUser.userPassword = password;
            nUser.userFoodPreference = foodPref;
            db.SaveChanges();
        }
    }
}