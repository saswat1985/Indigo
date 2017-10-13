using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity;
using Effigy.DataObject.UnitOfWork;

namespace Effigy.Service
{
    public class DataEntry : IDataEntry
    {
        private readonly clsDALUser objDal;

        public DataEntry()
        {
            objDal = new clsDALUser();
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
