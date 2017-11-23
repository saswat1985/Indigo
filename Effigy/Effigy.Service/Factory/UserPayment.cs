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
        ClsDALUser objclsDALUser = new ClsDALUser();
        public int SavePaymentDetail(PaymentDetails objVALLoginDetail)
        {
            int result = 0;
            try
            {
                result = objclsDALUser.SavePaymentDetail(objVALLoginDetail);
            }
            catch (Exception)
            {
                throw;
            }
            return result;
        }
    }
}
