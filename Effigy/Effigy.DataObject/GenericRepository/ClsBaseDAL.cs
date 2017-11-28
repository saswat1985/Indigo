using Effigy.DataObject.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.DataObject
{
    public class ClsBaseDAL : IDisposable
    {
        public SqlDataAccessLayer _objSql = null;
        public SNPLCPDBEntities _context = null;

        public ClsBaseDAL()
        {
            _objSql = new SqlDataAccessLayer();
            _context = new SNPLCPDBEntities();
        }
        public void Dispose()
        {
            try { GC.SuppressFinalize(this); }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return _context.Set<T>().FirstOrDefault(predicate);
        }

        public IList<T> GetList<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return _context.Set<T>().Where(predicate).ToList();
        }

    }
}
