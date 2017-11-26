using Effigy.Entity.DBContext;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Effigy.DataObject.UnitOfWork
{
    public class CLSDALPayment : ClsBaseDAL
    {
        private GenericRepository<tblMstUserDetail> _userDetail = null;

        public CLSDALPayment()
        {
            _userDetail = new GenericRepository<tblMstUserDetail>(_context);
        }
        public int SavePaymentDetail(PaymentDetails _objVal)
        {
            int Result = 0;
            try
            {
                SqlParameter[] sqlParam =
                {

                    new SqlParameter("@TransitionID",_objVal.TransitionID),
                    new SqlParameter("@UserID",_objVal.UserID),
                    new SqlParameter("@PaidAmount",_objVal.PaidAmount),
                    new SqlParameter("@IsGstInvoice",_objVal.IsGstInvoice),
                    new SqlParameter("@GstNumber",_objVal.GstNumber),
                    new SqlParameter("@GstHolderName",_objVal.GstHolderName),
                    new SqlParameter("@GstHolderAddress",_objVal.GstHolderAddress),
                };
                Result = _objSql.ExecuteNonQuery(CommandType.StoredProcedure, "InsertUserPaymentDetails", sqlParam);

                return Result;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Dispose();
            }
        }

        public void UpdateUserAfterPayment(int userId, DateTime? paymentDate)
        {
            try
            {
                var userDetail = _userDetail.GetSingle(o => o.UserId == userId);
                if (userDetail != null)
                {
                    userDetail.IsMemberShipExpired = false;
                    userDetail.IsMemberShipTaken = true;
                    userDetail.LastPaymentDate = paymentDate;
                    _context.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
