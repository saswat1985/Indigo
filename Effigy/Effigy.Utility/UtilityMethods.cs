using System;
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
    public static class UtilityMethods
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

       

        public static bool IsNumber(string number)
        {
            int result;
            int.TryParse(number, out result);
            return result == 0 ? false : true;

        }

        public static bool UrlIsValid(string url)
        {
            try
            {
                if (Uri.IsWellFormedUriString(url, UriKind.RelativeOrAbsolute))
                {
                    HttpWebRequest request = HttpWebRequest.Create(url) as HttpWebRequest;
                    request.Timeout = 5000; //set the timeout to 5 seconds to keep the user from waiting too long for the page to load
                    request.Method = "HEAD"; //Get only the header information -- no need to download any content

                    HttpWebResponse response = request.GetResponse() as HttpWebResponse;

                    int statusCode = (int)response.StatusCode;
                    if (statusCode >= 100 && statusCode < 400) //Good requests
                    {
                        return true;
                    }
                    else if (statusCode >= 500 && statusCode <= 510) //Server Errors
                    {
                        // log.Warn(String.Format("The remote server has thrown an internal error. Url is not valid: {0}", url));
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError) //400 errors
                {
                    return false;
                }

            }
            catch (Exception)
            {
                // log.Error(String.Format("Could not test url {0}.", url), ex);
                // return false;
            }
            return false;
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
