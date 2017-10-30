using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity;
using Effigy.DataObject.UnitOfWork;
using System.Linq.Expressions;

namespace Effigy.Service
{
    public class DataEntry : BaseFactory, IDataEntry
    {
        private readonly ClsDALDataEntry objDal;

        public DataEntry()
        {
            objDal = new ClsDALDataEntry();
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
