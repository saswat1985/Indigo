using Effigy.DataObject.DataBase;
using Effigy.Entity.DBContext;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Effigy.DataObject
{
    public class UnityOfWork : IDisposable
    {
        #region Private member variables...
        private SNPLCPDBEntities _context = null;
        private GenericRepository<tblMstUserMaster> _tblMstUserMaster;
        private GenericRepository<tblMstUserDetail> _tblMstUserDetail;

        #endregion

        public UnityOfWork()
        {
            _context = new SNPLCPDBEntities();
        }

        #region Public Repository Creation properties...

        /// <summary>
        /// Get/Set Property for MstUserMaster repository.
        /// </summary>
        public GenericRepository<tblMstUserMaster> MstUserMasterRepository
        {
            get
            {
                if (this._tblMstUserMaster == null)
                    this._tblMstUserMaster = new GenericRepository<tblMstUserMaster>(_context);
                return _tblMstUserMaster;
            }
        }

        public GenericRepository<tblMstUserDetail> MstUserDetailRepository
        {
            get
            {
                if (this._tblMstUserDetail == null)
                    this._tblMstUserDetail = new GenericRepository<tblMstUserDetail>(_context);
                return _tblMstUserDetail;
            }
        }

        /// <summary>
        /// Get/Set Property for user repository.
        /// </summary>
        //public GenericRepository<User> UserRepository
        //{
        //    get
        //    {
        //        if (this._userRepository == null)
        //            this._userRepository = new GenericRepository<User>(_context);
        //        return _userRepository;
        //    }
        //}

        ///// <summary>
        ///// Get/Set Property for token repository.
        ///// </summary>
        //public GenericRepository<Token> TokenRepository
        //{
        //    get
        //    {
        //        if (this._tokenRepository == null)
        //            this._tokenRepository = new GenericRepository<Token>(_context);
        //        return _tokenRepository;
        //    }
        //}
        #endregion

        #region Public member methods...
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format("{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now, eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }

        }

        #endregion

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being disposed");
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
