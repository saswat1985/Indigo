using Effigy.Entity.DBContext;
using Effigy.Entity.Entity;
namespace Effigy.Service.Contract
{
    public interface IUserPaymentService : IBaseContract
    {
        int SavePaymentDetail(PaymentDetails _objVal);
    }

    
}
