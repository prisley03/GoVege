using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoVege.Handler;
using GoVege.Model;

namespace GoVege.Controller
{
    public class registerPageController
    {
        public static bool RegisterCustomer(string fullname, string phoneNum, string email, string password, string rePass, string foodPref, bool agreed)
        {
            if (fullname.Equals(""))
            {
                return false;
            }

            if (!CheckPhoneNum(phoneNum))
            {
                return false;
            }

            if (!IsEmail(email))
            {
                return false;
            }

            if (!IsSamePassword(password, rePass))
            {
                return false;
            }

            if (!agreed) return false;

            if (CustomerHandler.RegisterCustomer(fullname, phoneNum, email, password, foodPref)) return true;
            return false;
        }

        public static bool UpdateCustomer(string fullname, string phoneNum, string email, string password, string rePass, string foodPref, string storedEmail, int id)
        {
            bool emailChanged = false;

            if (fullname.Equals(""))
            {
                return false;
            }

            if (!CheckPhoneNum(phoneNum))
            {
                return false;
            }

            if (!IsEmail(email))
            {
                return false;
            }

            if (!IsSamePassword(password, rePass))
            {
                return false;
            }

            if(email.CompareTo(storedEmail) != 0)
            {
                emailChanged = true;
            }

            if (CustomerHandler.UpdateCustomer(fullname, phoneNum, email, password, foodPref, emailChanged, id)) return true;
            return false;
        }

        private static bool CheckPhoneNum(string phoneNum)
        {
            if (phoneNum.Trim().Equals("")) return false;
            else if (!IsNumFormat(phoneNum))return false;
            return true;
        }

        private static bool IsNumFormat(string phoneNum)
        {
            if (phoneNum.Any(Char.IsDigit) || phoneNum.Trim().Contains("+")){
                return true;
            }
            return false;
        }

        private static bool IsEmail(string email)
        {
            if (email.Equals("")) return false;
            else if (email.Contains("@") && email.EndsWith(".com") || email.EndsWith(".org")) return true;
            return true;
        }

        private static bool IsSamePassword(string password, string rePass)
        {
            if (password.Equals("") || rePass.Equals("")) return false;
            else if (password != rePass) return false;
            return true;
        }

        public static MsUser LoginCustomer(string email, string password)
        {
            bool isEmpty = email.Equals("");
            bool isContain = email.Contains("@") && email.Contains(".");
            bool isAtFirst = email.StartsWith("@");
            bool isAtLast = email.EndsWith("@");
            bool isDotFirst = email.StartsWith(".");
            bool isDotLast = email.EndsWith(".");
            bool isDotNextToAt = email.Contains("@.") || email.Contains(".@");

            bool isEmailValid = !isEmpty && isContain && !isAtFirst && !isAtLast && !isDotFirst && !isDotLast && !isDotNextToAt;

            if (email.Equals(""))
            {
                return null;
            }

            if (!isEmailValid)
            {
                return null;
            }

            if (password.Equals(""))
            {
                return null;
            }

            if (!(password.Any(Char.IsDigit) && password.Any(Char.IsLetter)))
            {
                return null;
            }

            return CustomerHandler.LoginCustomer(email, password);
        }
    }
}