using GoVege.Model;
using GoVege.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Controller
{
    public class PromotionController
    {
        public static List<MsVoucher> getAllPromotion()
        {
            return PromotionRepository.getAllPromotion();
        }
    }
}