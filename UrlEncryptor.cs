using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace Vidyakendraa
{
    public class UrlEncryptor
    {
        private static string key = "mySecretKey123";

        public static string Encrypt(string text)
        {
            byte[] textBytes = Encoding.UTF8.GetBytes(text);

            using (Aes aes = Aes.Create())
            {
                var keyBytes = Encoding.UTF8.GetBytes(key.PadRight(32));
                aes.Key = keyBytes;
                aes.IV = keyBytes.Take(16).ToArray();

                using (var enc = aes.CreateEncryptor())
                {
                    byte[] encrypted = enc.TransformFinalBlock(textBytes, 0, textBytes.Length);
                    return Convert.ToBase64String(encrypted)
                        .Replace("+", "-")
                        .Replace("/", "_");
                }
            }
        }

        public static string Decrypt(string cipher)
        {
            cipher = cipher.Replace("-", "+").Replace("_", "/");

            byte[] cipherBytes = Convert.FromBase64String(cipher);

            using (Aes aes = Aes.Create())
            {
                var keyBytes = Encoding.UTF8.GetBytes(key.PadRight(32));
                aes.Key = keyBytes;
                aes.IV = keyBytes.Take(16).ToArray();

                using (var dec = aes.CreateDecryptor())
                {
                    byte[] decrypted = dec.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
                    return Encoding.UTF8.GetString(decrypted);
                }
            }
        }
    }
}