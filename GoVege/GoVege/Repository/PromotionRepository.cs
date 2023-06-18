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

            public MsVoucher GetPromotionsById(int voucherId)
            {
                using (var context = new GoVegeDBEntities())
                {
                    return context.MsVouchers.FirstOrDefault(v => v.voucherID == voucherId);
                }
            }
    }
}