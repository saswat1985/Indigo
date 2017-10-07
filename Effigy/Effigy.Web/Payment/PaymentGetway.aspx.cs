﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity;
using Effigy.Service;

namespace Effigy.Web.Payment
{
    public partial class PaymentGetway : System.Web.UI.Page
    {
        public string action1 = string.Empty;
        public string hash1 = string.Empty;
        public string txnid1 = string.Empty;
        public static string Amount = string.Empty;
        public static string Product = string.Empty;
        public static string MarchantEmail = string.Empty;
        public static string MarchantMobile = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                key.Value = ConfigurationManager.AppSettings["MERCHANT_KEY"];               
                if (!IsPostBack)
                {
                    frmError.Visible = false; // error form
                }
                else
                {
                    //frmError.Visible = true;
                }
                txtProductInfo.Text = "CP2";
                txtAmount.Text = "10.00";
                
            }
            catch (Exception ex)
            {
                Response.Write("<span style='color:red'>" + ex.Message + "</span>");
            }
        }
        [WebMethod]
        public static void GetUserDetail()
        {
            //if (HttpContext.Current.Request.QueryString.HasKeys())
            //{
            //    if (HttpContext.Current.Request.QueryString["UserID"] != null)
            //    {
                    IUserService objBal = new UserService();
                    UserData user = objBal.GetUserDataById(10);
                    Amount = Convert.ToString(user.CategoryAmount);
                    Product = user.ProductCategory;
                    MarchantEmail = "nitinjain.mca@hotmail.com";
                    MarchantMobile = "9810489652";                   
               // }
            //}
        }
        public string Generatehash512(string text)
        {
            byte[] message = Encoding.UTF8.GetBytes(text);
            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            return hex;
        }
        protected void btnPayment_Click(object sender, EventArgs e)
        {
            try
            {
                string[] hashVarsSeq;
                string hash_string = string.Empty;
                if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating txnid
                {
                    Random rnd = new Random();
                    string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                    txnid1 = strHash.ToString().Substring(0, 20);
                }
                else
                {
                    txnid1 = Request.Form["txnid"];
                }
                if (string.IsNullOrEmpty(Request.Form["hash"])) // generating hash value
                {
                    if (
                        string.IsNullOrEmpty(ConfigurationManager.AppSettings["MERCHANT_KEY"]) ||
                        string.IsNullOrEmpty(txnid1) ||
                        string.IsNullOrEmpty(Request.Form["txtfirstName"])
                        || string.IsNullOrEmpty(Request.Form["txtMobile"]) ||
                        string.IsNullOrEmpty(Request.Form["txtEmail"])
                       )
                    {
                        //error
                        frmError.Visible = true;
                        return;
                    }

                    else
                    {
                        frmError.Visible = false;
                        hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
                        hash_string = "";
                        foreach (string hash_var in hashVarsSeq)
                        {
                            if (hash_var == "key")
                            {
                                hash_string = hash_string + ConfigurationManager.AppSettings["MERCHANT_KEY"];
                                hash_string = hash_string + '|';
                            }
                            else if (hash_var == "txnid")
                            {
                                ViewState["txnid"] = txnid1;
                                hash_string = hash_string + txnid1;
                                hash_string = hash_string + '|';
                            }
                            else if (hash_var == "txtAmount")
                            {
                                hash_string = hash_string + Amount;
                                hash_string = hash_string + '|';
                            }
                            else if (hash_var == "txtProductInfo")
                            {
                                hash_string = hash_string + txtProductInfo.Text;
                                hash_string = hash_string + '|';
                            }
                            else if (hash_var == "txtEmail")
                            {
                                hash_string = hash_string + MarchantEmail;
                                hash_string = hash_string + '|';
                            }
                            else
                            {

                                hash_string = hash_string + (Request.Form[hash_var] != null ? Request.Form[hash_var] : "");// isset if else
                                hash_string = hash_string + '|';
                            }
                        }

                        hash_string += ConfigurationManager.AppSettings["SALT"];// appending SALT
                        hash1 = Generatehash512(hash_string).ToLower();         //generating hash
                        action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";// setting URL

                    }


                }

                else if (!string.IsNullOrEmpty(Request.Form["hash"]))
                {
                    hash1 = Request.Form["hash"];
                    action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";

                }

                if (!string.IsNullOrEmpty(hash1))
                {
                    hash.Value = hash1;
                    txnid.Value = txnid1;
                    string Sucessurl = String.Format("http://traderzplanet.in/PaymentSuccess.aspx?Tv={0}&EI={1}&MN={2}&FN={3}&LN={4}", ViewState["txnid"].ToString(), txtEmail.Text.Trim(), txtMobile.Text.Trim(), txtfirstName.Text.Trim(), txtLastName.Text.Trim());
                    string Failureurl = String.Format("http://traderzplanet.in/PaymentFailure.aspx?Tv={0}&EI={1}&MN={2}&FN={3}&LN={4}", ViewState["txnid"].ToString(), txtEmail.Text.Trim(), txtMobile.Text.Trim(), txtfirstName.Text.Trim(), txtLastName.Text.Trim());
                    System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                    data.Add("hash", hash.Value);
                    //data.Add("abc", hash_string);
                    data.Add("txnid", txnid.Value);
                    data.Add("key", key.Value);
                    string AmountForm = Convert.ToDecimal("10").ToString("g29");// eliminating trailing zeros
                    txtAmount.Text = AmountForm;
                    data.Add("amount", AmountForm);
                    data.Add("firstname", txtfirstName.Text.Trim());
                    data.Add("email", MarchantEmail);
                    data.Add("phone", MarchantMobile);
                    data.Add("productinfo", txtProductInfo.Text);
                    data.Add("surl", Sucessurl);
                    data.Add("furl", Failureurl);
                    data.Add("lastname", txtLastName.Text.Trim());
                    data.Add("curl", "http://traderzplanet.in/PaymentCancel.aspx");
                    data.Add("address1", txtAddress1.Text.Trim());
                    data.Add("address2", txtAddress2.Text.Trim());
                    data.Add("city", txtCity.Text.Trim());
                    data.Add("state", txtState.Text.Trim());
                    data.Add("country", txtCountry.Text.Trim());
                    data.Add("zipcode", txtZipCode.Text.Trim());
                    data.Add("udf1", txtUDF1.Text.Trim());
                    data.Add("udf2", txtUDF2.Text.Trim());
                    data.Add("udf3", txtUDF3.Text.Trim());
                    data.Add("udf4", txtUDF4.Text.Trim());
                    data.Add("udf5", txtUDF5.Text.Trim());
                    data.Add("pg", txtPg.Text.Trim());
                    data.Add("service_provider", "payu_paisa");
                    string strForm = PreparePOSTForm(action1, data);
                    Page.Controls.Add(new LiteralControl(strForm));

                }

                else
                {
                    //no hash
                }

            }

            catch (Exception ex)
            {
                Response.Write("<span style='color:red'>" + ex.Message + "</span>");
            }
        }

        private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
        {
            //Set a name for the form
            string formID = "PostForm";
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" +
                           formID + "\" action=\"" + url +
                           "\" method=\"POST\">");

            foreach (System.Collections.DictionaryEntry key in data)
            {

                strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                               "\" value=\"" + key.Value + "\">");
            }


            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." +
                             formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated.
            //(The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPlan");
        }

        //private void insertPaymentDetails(string TransationID, string Mobile, string email, string FirstName, string lastName, bool isPaymentSuccess, string Planname, Double Amount)
        //{
        //    DAL objDal = new DAL();
        //    bool istrue = objDal.PaymentDetail(TransationID, Mobile, email, FirstName, lastName, isPaymentSuccess, Planname, Amount);
        //    if (istrue)
        //    {
        //        Response.Redirect(String.Format("PaymentSuc?TN={0}&MN={1}&EI={2}&FN={3}&LN={4}&PN={5}&AM={6}", TransationID, Mobile, email, FirstName, lastName, Planname, Amount));
        //    }
        //}

        //protected void btnTemppayment_Click(object sender, EventArgs e)
        //{
        //    string hash_string = string.Empty;
        //    string TransId = string.Empty;
        //    if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating txnid
        //    {
        //        Random rnd = new Random();
        //        string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
        //        TransId = strHash.ToString().Substring(0, 20);
        //    }
        //    insertPaymentDetails(TransId, txtUDF1.Text.Trim(), txtUDF2.Text.Trim(), txtfirstName.Text.Trim(), txtLastName.Text.Trim(), true, productInfo, Convert.ToDouble(Amount));

        //}
    }
}