using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoVege.Model;
using GoVege.Repository;

namespace GoVege.Handler
{
    public class CustomerHandler
    {
        public static bool RegisterCustomer(string fullName, string phoneNum, string email, string password, string foodPref)
        {
            if (CustomerRepository.GetCustomerByEmail(email) != null) return false;
            CustomerRepository.AddCustomer(fullName, phoneNum, email, password, foodPref);
            return true;
        }

        public static bool UpdateCustomer(string fullName, string phoneNum, string email, string password, string foodPref, bool emailChanged, int id)
        {
            if (CustomerRepository.GetCustomerByEmail(email) != null && emailChanged == true) return false;
            CustomerRepository.UpdateCustomer(fullName, phoneNum, email, password, foodPref, id);
            return true;
        }

        public static MsUser LoginCustomer(string email, string password)
        {
            MsUser cust = CustomerRepository.GetCustomerByEmailAndPassword(email, password);
            if (cust != null){
                return cust;
            }
            return null;
        }
    }
}