using GoVege.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoVege.Repository
{
    public class PromotionRepository
    {
            static GoVegeDBEntities db = new GoVegeDBEntities();
            public static List<MsVoucher> getAllPromotion()
            {
                return db.MsVouchers.ToList();
            }

            public static MsVoucher GetPromotionsById(int voucherId)
            {
                return (from i in db.MsVouchers where voucherId == i.voucherID select i).FirstOrDefault();
            }
    }
}