using Effigy.DataObject.DataBase;
using Effigy.Entity;
using Effigy.Entity.DBContext;
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

        public IList<MstBusinessType> GetMstBusinessType()
        {
            try
            {
                IEnumerable<MstBusinessType> lstBusinessType = _context.MstBusinessTypes.Where(k => k.IsActive == true);
                return lstBusinessType.ToList();
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

        public IList<MstWebSiteStatu> GetWebSiteStatus()
        {
            try
            {
                IEnumerable<MstWebSiteStatu> lstWebSiteStatus = _context.MstWebSiteStatus.Where(k => k.IsActive == true);
                return lstWebSiteStatus.ToList();
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

        public IList<tblRawUniqueURL> RandomUniqueURLs(int recordSize)
        {
            try
            {
                var list = (from t in _context.tblRawUniqueURLs
                            where t.IsValidate == false
                            orderby t.MasterId
                            select t).Take(recordSize);

                return list.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void InsertUniqueURLAudit(tblUniqueURLAudit objUniqueURLAudit)
        {
            if (objUniqueURLAudit != null)
            {
                tblRawUniqueURL obj = _context.tblRawUniqueURLs.Where(P => P.UniqueURL == objUniqueURLAudit.UniqueURL).FirstOrDefault();
                if (obj != null)
                {
                    obj.IsValidate = true;
                    objUniqueURLAudit.UniqueURLId = obj.Id;
                    _context.Entry(obj).State = System.Data.EntityState.Modified;
                    _context.tblUniqueURLAudits.Add(objUniqueURLAudit);
                    _context.SaveChanges();
                }
            }
        }
    }
}
