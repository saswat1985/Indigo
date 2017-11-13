using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity;
using Effigy.DataObject.UnitOfWork;
using System.Linq.Expressions;
using Effigy.Entity.DBContext;

namespace Effigy.Service
{
    public class UserDataEntry : BaseFactory, IDataEntry
    {
        private readonly ClsDALDataEntry objDal;

        public UserDataEntry()
        {
            objDal = new ClsDALDataEntry();
        }

        public IList<BusinessTypeMapper> GetMstBusinessType()
        {
            try
            {
                return objDal.GetMstBusinessType().Select(k => new BusinessTypeMapper
                {
                    Id = k.id,
                    BusinessType = k.BusinessType
                }).ToList();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<UniqueURLMapper> GetUniqueURLRandom(int recordSize, int urlCount)
        {
            var lstURL = objDal.RandomUniqueURLs(recordSize);
            List<UniqueURLMapper> result = new List<UniqueURLMapper>();
            if (lstURL != null && lstURL.Count > 0)
            {
                result = Utility.UtilityMethods.GetRandomSampleURL(lstURL, urlCount).Select(p => new UniqueURLMapper
                {
                    Id = p.Id,
                    MasterId = p.MasterId.Value,
                    UniqueURL = p.UniqueURL

                }).ToList();
            }
            return result;
        }

        public IList<WebSiteStatusMapper> GetWebSiteStatus()
        {
            try
            {
                return objDal.GetWebSiteStatus().Select(k => new WebSiteStatusMapper
                {
                    Id = k.id,
                    WebSiteStatus = k.WebSiteStatus

                }).ToList();

            }
            catch (Exception)
            {
                throw;
            }
        }

        #region DataEntry

        public IList<UrlEntriesVarifiedData> ProcessRawUrls(int userId, List<string> urls)
        {
            try
            {
                string commaSapratedURLs = string.Empty;
                foreach (var item in urls)
                {
                    commaSapratedURLs += item + ",";
                }
                commaSapratedURLs = commaSapratedURLs.Substring(0, commaSapratedURLs.Length - 1);
                return objDal.ProcessRawUrls(userId, commaSapratedURLs);
            }
            catch (Exception)
            {
                throw;
            }

        }



        #endregion
    }
}
