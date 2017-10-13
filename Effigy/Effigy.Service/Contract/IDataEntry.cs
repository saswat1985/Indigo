using Effigy.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Service
{
    public interface IDataEntry
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="urls"></param>
        /// <returns></returns>
        IList<UrlEntriesVarifiedData> ProcessRawUrls(int userId, List<string> urls);
    }
}
