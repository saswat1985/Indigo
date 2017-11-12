using Effigy.DataObject.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Service
{
    public class BaseFactory : IBaseContract
    {
        private readonly clsDALUser objDal;
        public ClsDALMaster objMaster = null;

        public BaseFactory()
        {
            objDal = new clsDALUser();
            objMaster = new ClsDALMaster();
        }
        public virtual T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objDal.GetSingleRecord<T>(predicate);
        }
        public IList<T> GetList<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objMaster.GetList<T>(predicate);
        }
    }
}
