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

        public BaseFactory()
        {
            objDal = new clsDALUser();
        }
        public virtual T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objDal.GetSingleRecord<T>(predicate);
        }
    }
}
