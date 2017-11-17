﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Effigy.DataObject
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    using Effigy.Entity.DBContext;

    public partial class SNPLCPDBEntities : DbContext
    {
        public SNPLCPDBEntities()
            : base("name=SNPLCPDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public DbSet<aspnet_UsersInRoles> aspnet_UsersInRoles { get; set; }
        public DbSet<MstBankMaster> MstBankMasters { get; set; }
        public DbSet<MstBusinessType> MstBusinessTypes { get; set; }
        public DbSet<MstCity> MstCities { get; set; }
        public DbSet<MstCountry> MstCountries { get; set; }
        public DbSet<MstLanguage> MstLanguages { get; set; }
        public DbSet<MstMenuMaster> MstMenuMasters { get; set; }
        public DbSet<MstMenuRoleMaster> MstMenuRoleMasters { get; set; }
        public DbSet<MstState> MstStates { get; set; }
        public DbSet<MstUserType> MstUserTypes { get; set; }
        public DbSet<MstUserWorkCategory> MstUserWorkCategories { get; set; }
        public DbSet<MstWebSiteStatu> MstWebSiteStatus { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<tblMstUserBankDetail> tblMstUserBankDetails { get; set; }
        public DbSet<tblMstUserCategoryMapping> tblMstUserCategoryMappings { get; set; }
        public DbSet<tblMstUserDetail> tblMstUserDetails { get; set; }
        public DbSet<tblMstUserLoginDetail> tblMstUserLoginDetails { get; set; }
        public DbSet<tblMstUserMaster> tblMstUserMasters { get; set; }
        public DbSet<tblMstUserPaymentDetail> tblMstUserPaymentDetails { get; set; }
        public DbSet<tblMstUserTreeStructure> tblMstUserTreeStructures { get; set; }
        public DbSet<tblRawUniqueURL> tblRawUniqueURLs { get; set; }
        public DbSet<tblRawURL> tblRawURLs { get; set; }
        public DbSet<tblRawURLDetail> tblRawURLDetails { get; set; }
        public DbSet<tblUniqueURLAudit> tblUniqueURLAudits { get; set; }
    
        public virtual ObjectResult<Nullable<int>> chkLogin(string type, string userName, string password, string transactionPwd, Nullable<int> userLoginId, ObjectParameter outRes, ObjectParameter userID, ObjectParameter roleID, ObjectParameter cultureID, ObjectParameter userEntryDateTime)
        {
            var typeParameter = type != null ?
                new ObjectParameter("Type", type) :
                new ObjectParameter("Type", typeof(string));
    
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            var transactionPwdParameter = transactionPwd != null ?
                new ObjectParameter("TransactionPwd", transactionPwd) :
                new ObjectParameter("TransactionPwd", typeof(string));
    
            var userLoginIdParameter = userLoginId.HasValue ?
                new ObjectParameter("UserLoginId", userLoginId) :
                new ObjectParameter("UserLoginId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("chkLogin", typeParameter, userNameParameter, passwordParameter, transactionPwdParameter, userLoginIdParameter, outRes, userID, roleID, cultureID, userEntryDateTime);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        [EdmFunction("SNPLCPDBEntities", "Split")]
        public virtual IQueryable<string> Split(string @string, string delimiter)
        {
            var stringParameter = @string != null ?
                new ObjectParameter("String", @string) :
                new ObjectParameter("String", typeof(string));
    
            var delimiterParameter = delimiter != null ?
                new ObjectParameter("Delimiter", delimiter) :
                new ObjectParameter("Delimiter", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<string>("[SNPLCPDBEntities].[Split](@String, @Delimiter)", stringParameter, delimiterParameter);
        }
    
        public virtual ObjectResult<uspMenuMaster_Result> uspMenuMaster(Nullable<int> menuId, Nullable<int> applicationID, string menuText, string menuDesc, Nullable<int> menuOrder, string navigateURL, Nullable<int> createdBy, Nullable<int> parentId, Nullable<int> activeFlag, string type, string roleId, string isApply, ObjectParameter messageOut, string column_name, string searchCriteria)
        {
            var menuIdParameter = menuId.HasValue ?
                new ObjectParameter("MenuId", menuId) :
                new ObjectParameter("MenuId", typeof(int));
    
            var applicationIDParameter = applicationID.HasValue ?
                new ObjectParameter("ApplicationID", applicationID) :
                new ObjectParameter("ApplicationID", typeof(int));
    
            var menuTextParameter = menuText != null ?
                new ObjectParameter("MenuText", menuText) :
                new ObjectParameter("MenuText", typeof(string));
    
            var menuDescParameter = menuDesc != null ?
                new ObjectParameter("MenuDesc", menuDesc) :
                new ObjectParameter("MenuDesc", typeof(string));
    
            var menuOrderParameter = menuOrder.HasValue ?
                new ObjectParameter("MenuOrder", menuOrder) :
                new ObjectParameter("MenuOrder", typeof(int));
    
            var navigateURLParameter = navigateURL != null ?
                new ObjectParameter("NavigateURL", navigateURL) :
                new ObjectParameter("NavigateURL", typeof(string));
    
            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));
    
            var parentIdParameter = parentId.HasValue ?
                new ObjectParameter("ParentId", parentId) :
                new ObjectParameter("ParentId", typeof(int));
    
            var activeFlagParameter = activeFlag.HasValue ?
                new ObjectParameter("ActiveFlag", activeFlag) :
                new ObjectParameter("ActiveFlag", typeof(int));
    
            var typeParameter = type != null ?
                new ObjectParameter("Type", type) :
                new ObjectParameter("Type", typeof(string));
    
            var roleIdParameter = roleId != null ?
                new ObjectParameter("RoleId", roleId) :
                new ObjectParameter("RoleId", typeof(string));
    
            var isApplyParameter = isApply != null ?
                new ObjectParameter("IsApply", isApply) :
                new ObjectParameter("IsApply", typeof(string));
    
            var column_nameParameter = column_name != null ?
                new ObjectParameter("Column_name", column_name) :
                new ObjectParameter("Column_name", typeof(string));
    
            var searchCriteriaParameter = searchCriteria != null ?
                new ObjectParameter("SearchCriteria", searchCriteria) :
                new ObjectParameter("SearchCriteria", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<uspMenuMaster_Result>("uspMenuMaster", menuIdParameter, applicationIDParameter, menuTextParameter, menuDescParameter, menuOrderParameter, navigateURLParameter, createdByParameter, parentIdParameter, activeFlagParameter, typeParameter, roleIdParameter, isApplyParameter, messageOut, column_nameParameter, searchCriteriaParameter);
        }
    
        public virtual int uspMenuRoleMapper(Nullable<int> roleId, string selectedMenus, Nullable<int> createdBy, Nullable<System.DateTime> createdDate)
        {
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("RoleId", roleId) :
                new ObjectParameter("RoleId", typeof(int));
    
            var selectedMenusParameter = selectedMenus != null ?
                new ObjectParameter("SelectedMenus", selectedMenus) :
                new ObjectParameter("SelectedMenus", typeof(string));
    
            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));
    
            var createdDateParameter = createdDate.HasValue ?
                new ObjectParameter("CreatedDate", createdDate) :
                new ObjectParameter("CreatedDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("uspMenuRoleMapper", roleIdParameter, selectedMenusParameter, createdByParameter, createdDateParameter);
        }
    
        public virtual int uspUserRoleMapper(Nullable<int> userId, string selectedItems, Nullable<int> createdBy)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            var selectedItemsParameter = selectedItems != null ?
                new ObjectParameter("SelectedItems", selectedItems) :
                new ObjectParameter("SelectedItems", typeof(string));
    
            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("uspUserRoleMapper", userIdParameter, selectedItemsParameter, createdByParameter);
        }
    
        public virtual int InsertUserPaymentDetails(string transitionID, Nullable<int> userID, Nullable<decimal> paidAmount)
        {
            var transitionIDParameter = transitionID != null ?
                new ObjectParameter("TransitionID", transitionID) :
                new ObjectParameter("TransitionID", typeof(string));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var paidAmountParameter = paidAmount.HasValue ?
                new ObjectParameter("PaidAmount", paidAmount) :
                new ObjectParameter("PaidAmount", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InsertUserPaymentDetails", transitionIDParameter, userIDParameter, paidAmountParameter);
        }
    
        public virtual int USP_RawURLEntry(Nullable<int> userEntryId, string rawURLString)
        {
            var userEntryIdParameter = userEntryId.HasValue ?
                new ObjectParameter("UserEntryId", userEntryId) :
                new ObjectParameter("UserEntryId", typeof(int));
    
            var rawURLStringParameter = rawURLString != null ?
                new ObjectParameter("RawURLString", rawURLString) :
                new ObjectParameter("RawURLString", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_RawURLEntry", userEntryIdParameter, rawURLStringParameter);
        }
    }
}
