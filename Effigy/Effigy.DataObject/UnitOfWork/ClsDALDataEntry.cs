using Effigy.DataObject.DataBase;
using Effigy.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.DataObject.UnitOfWork
{
    public class ClsDALDataEntry : ClsBaseDAL
    {
        private SNPLCPDBEntities _context = null;

        public ClsDALDataEntry()
        {
            _context = new SNPLCPDBEntities();
        }
        public IList<UrlEntriesVarifiedData> ProcessRawUrls(int userId, string urls)
        {
            try
            {

                IEnumerable<UrlEntriesVarifiedData> UrlEntriesVarifiedDataList = _context.Database.SqlQuery<UrlEntriesVarifiedData>("USP_RawURLEntry @UserEntryId={0},@RawURLString={1}", userId, urls);

                return UrlEntriesVarifiedDataList.ToList();
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
    }
}
