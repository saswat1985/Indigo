﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Net;
using System.Xml;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;


namespace Effigy.Utility
{
    public class UtilityMethods
    {
        private static byte[] saltByte = Encoding.ASCII.GetBytes("o8101982dAtApAtH");

        public static string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public static string CoupneCodeGenerator(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, length)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            return result;
        }

        private static string APICall(string url)
        {
            try
            {
                HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
                HttpWebResponse httpResponse = (HttpWebResponse)httpreq.GetResponse();
                StreamReader objStreamReader = new StreamReader(httpResponse.GetResponseStream());
                string result = objStreamReader.ReadToEnd();
                objStreamReader.Close();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool SendSingleSMS(string smsElement, string mobileNo)
        {
            string result = string.Empty;
            bool issmssent = false;
            try
            {
                result = APICall("http://" + AppKeyCollection.SmsDomain + "/sendsms.php?username=" + AppKeyCollection.SmsUserName + "&password=" + AppKeyCollection.SmsPwd + "&sender=" + AppKeyCollection.SmsSenderId + "&mobile=" + mobileNo + "&message=" + smsElement + "&route=T");
                //result = APICall("http://" + AppKeyCollection.SmsDomain + "/SendMsg.aspx?uname=" + AppKeyCollection.SmsUserName + "&pass=" + AppKeyCollection.SmsPwd + "&send=" + AppKeyCollection.SmsSenderId + "&dest=" + mobileNo + "&msg=" + smsElement + "");
                if (UtilityMethods.IsNumber(result))
                    issmssent = true;
            }
            catch (Exception)
            {
                throw;
            }
            return issmssent;
        }

        public static bool IsNumber(string number)
        {
            int result;
            int.TryParse(number, out result);
            return result == 0 ? false : true;

        }



        #region Encryption Decryption

        public static string EncryptText(string plainText)
        {
            string encryptedText = plainText;
            if (!string.IsNullOrEmpty(plainText))
            {
                RijndaelManaged encryptionAlgo = null;
                

                try
                {
                   // string secretValue = AppKeyCollection.EncryptionValue;
                    string secretValue = ConfigurationManager.AppSettings["EncryptionValue"];
                    Rfc2898DeriveBytes key = new Rfc2898DeriveBytes(secretValue, saltByte);
                    encryptionAlgo = new RijndaelManaged();
                    encryptionAlgo.Key = key.GetBytes(encryptionAlgo.KeySize / 8);
                    ICryptoTransform encryptor = encryptionAlgo.CreateEncryptor(encryptionAlgo.Key, encryptionAlgo.IV);
                    using (MemoryStream stream = new MemoryStream())
                    {
                        // prepend the IV
                        stream.Write(BitConverter.GetBytes(encryptionAlgo.IV.Length), 0, sizeof(int));
                        stream.Write(encryptionAlgo.IV, 0, encryptionAlgo.IV.Length);
                        using (CryptoStream csEncrypt = new CryptoStream(stream, encryptor, CryptoStreamMode.Write))
                        {
                            using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                            {
                                //Write all data to the stream.
                                swEncrypt.Write(plainText);
                            }

                            encryptedText = Convert.ToBase64String(stream.ToArray());
                        }
                    }
                }
                finally
                {
                    // Clear the RijndaelManaged object.
                    if (encryptionAlgo != null)
                        encryptionAlgo.Clear();
                }
            }

            return encryptedText;
        }

        /// <summary>
        /// Method to encrypt plain text using Triple DES algorithm
        /// Key file to encrpyt the text is derived from app configuration file
        /// </summary>
        /// <param name="encryptedText">encrypted text</param>
        /// <returns>returns decrypted text</returns>
        public static string DecryptText(string encryptedText)
        {
            string plainText = encryptedText;

            if (!string.IsNullOrEmpty(encryptedText))
            {
                RijndaelManaged encryptionAlgo = null;

                try
                {
                    //generate the key from the shared secret and the salt
                    //string secretValue = AppKeyCollection.EncryptionValue;
                    string secretValue = ConfigurationManager.AppSettings["EncryptionValue"];
                    Rfc2898DeriveBytes key = new Rfc2898DeriveBytes(secretValue, saltByte);

                    // Create the streams used for decryption.                
                    byte[] bytes = Convert.FromBase64String(encryptedText);
                    using (MemoryStream msDecrypt = new MemoryStream(bytes))
                    {
                        // Create a RijndaelManaged object
                        // with the specified key and IV.
                        encryptionAlgo = new RijndaelManaged();
                        encryptionAlgo.Key = key.GetBytes(encryptionAlgo.KeySize / 8);
                        // Get the initialization vector from the encrypted stream
                        encryptionAlgo.IV = ReadByteArray(msDecrypt);

                        // Create a decrytor to perform the stream transform.
                        ICryptoTransform decryptor = encryptionAlgo.CreateDecryptor(encryptionAlgo.Key, encryptionAlgo.IV);
                        using (CryptoStream stream = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                        {
                            using (StreamReader reader = new StreamReader(stream))

                                // Read the decrypted bytes from the decrypting stream
                                // and place them in a string.
                                plainText = reader.ReadToEnd();
                        }

                    }
                }
                finally
                {
                    // Clear the RijndaelManaged object.
                    if (encryptionAlgo != null)
                        encryptionAlgo.Clear();
                }
            }

            return plainText;
        }

        /// <summary>
        /// Method to readet byte array text
        /// </summary>
        /// <param name="stream">stream</param>
        /// <returns>returns byte array</returns>
        private static byte[] ReadByteArray(Stream stream)
        {
            byte[] rawLength = new byte[sizeof(int)];
            if (stream.Read(rawLength, 0, rawLength.Length) != rawLength.Length)
            {
                throw new SystemException("Stream did not contain properly formatted byte array");
            }

            byte[] buffer = new byte[BitConverter.ToInt32(rawLength, 0)];
            if (stream.Read(buffer, 0, buffer.Length) != buffer.Length)
            {
                throw new SystemException("Did not read byte array properly");
            }

            return buffer;
        }

        #endregion

    }
}