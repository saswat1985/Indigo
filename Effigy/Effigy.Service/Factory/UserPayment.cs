using Effigy.DataObject.UnitOfWork;
using Effigy.Entity.DBContext;
using Effigy.Entity.Entity;
using Effigy.Service.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Effigy.Service.Factory
{
    public class UserPayment : BaseFactory, IUserPaymentService
    {
        public int SavePaymentDetail(PaymentDetails objVALLoginDetail)
        {
            int result = 0;
            try
            {
                result = objPayment.SavePaymentDetail(objVALLoginDetail);

                if (result != 0)
                {
                    objPayment.UpdateUserAfterPayment(objVALLoginDetail.UserID, objVALLoginDetail.PaymentDateTime);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return result;
        }
    }
}
