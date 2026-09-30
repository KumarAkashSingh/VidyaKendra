using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;

namespace Vidyakendraa
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadPdfText("en");
            }
        }
        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lang = ddlLanguage.SelectedValue;

            if (string.IsNullOrEmpty(lang))
            {
                lblMsg.Text = "Please select a language";
                return;
            }

            try
            {
                string inputPdf = Server.MapPath("~/PDF/sample.pdf");
                string outputPdf = Server.MapPath("~/PDF/translated.pdf");

                if (!File.Exists(inputPdf))
                {
                    lblMsg.Text = "PDF not found";
                    return;
                }

                // 1. Extract text
                string text = ExtractPdfText(inputPdf);

                if (string.IsNullOrWhiteSpace(text))
                {
                    lblMsg.Text = "No text found (PDF may be image)";
                    return;
                }

                // 2. Clean text
                //text = CleanText(text);

                // 3. Translate
                string translated = TranslateText(text, lang);

                if (string.IsNullOrWhiteSpace(translated))
                {
                    lblMsg.Text = "Translation failed";
                    return;
                }

                // 4. Create PDF
                CreatePdf(translated, outputPdf);

                lblMsg.Text = "Translation completed";

                // 5. Load PDF
                string url = ResolveUrl("~/PDF/translated.pdf?v=" + DateTime.Now.Ticks);

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "pdf",
                    "document.getElementById('iframeTranslated').src='" + url + "';",
                    true);
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }

        string ExtractPdfText(string path)
        {
            StringBuilder sb = new StringBuilder();

            using (PdfReader reader = new PdfReader(path))
            {
                for (int i = 1; i <= reader.NumberOfPages; i++)
                {
                    var strategy = new LocationTextExtractionStrategy();
                    string pageText = PdfTextExtractor.GetTextFromPage(reader, i, strategy);

                    sb.AppendLine(pageText);
                }
            }

            return sb.ToString();
        }
        public string TranslateText(string input, string lang)
        {
            StringBuilder finalText = new StringBuilder();

            int chunkSize = 250; // small = accurate

            for (int i = 0; i < input.Length; i += chunkSize)
            {
                string chunk = input.Substring(i, Math.Min(chunkSize, input.Length - i));

                string url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl="
                             + lang + "&dt=t&q=" + HttpUtility.UrlEncode(chunk);

                using (WebClient wc = new WebClient())
                {
                    wc.Encoding = Encoding.UTF8;

                    string result = wc.DownloadString(url);

                    JavaScriptSerializer js = new JavaScriptSerializer();
                    dynamic json = js.DeserializeObject(result);

                    if (json != null && json[0] != null)
                    {
                        foreach (var item in json[0])
                        {
                            if (item[0] != null)
                                finalText.Append(item[0].ToString());
                        }
                    }
                }

                System.Threading.Thread.Sleep(150); // prevent block
            }

            return finalText.ToString();
        }

        void CreatePdf(string text, string path)
        {
            using (FileStream fs = new FileStream(path, FileMode.Create))
            {
                Document doc = new Document();
                PdfWriter.GetInstance(doc, fs);

                doc.Open();

                // Universal font (supports all languages)
                string fontPath = Server.MapPath("~/Fonts/Noto_Sans_Noto_Sans_Devanagari/Noto_Sans_Devanagari/NotoSansDevanagari-VariableFont_wdth,wght.ttf");

                BaseFont bf = BaseFont.CreateFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                Font font = new Font(bf, 12);

                doc.Add(new Paragraph(text, font));

                doc.Close();
            }
        }

        //string CleanText(string input)
        //{
        //    return input
        //        .Replace("\r", " ")
        //        .Replace("\n", " ")
        //        .Replace("  ", " ");
        //}
    }
}