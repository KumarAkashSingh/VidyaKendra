using iTextSharp.text.pdf;
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
using iTextSharp.text.pdf.parser;
using iTextSharp.text;

namespace Vidyakendraa
{
    public partial class TransPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPDFs();
            }
        }
        // 📄 Load all PDFs from folder
        void LoadPDFs()
        {
            string folderPath = Server.MapPath("~/PDF/");

            // ✅ Check folder exists
            if (!Directory.Exists(folderPath))
            {
                lblMsg.Text = "PDF folder not found";
                return;
            }

            // ✅ Get only original PDFs (exclude translated)
            var files = Directory.GetFiles(folderPath, "*.pdf").Where(f => !System.IO.Path.GetFileName(f).StartsWith("translated_")).ToList();

            var list = files.Select(f => new
            {
                FileName = System.IO.Path.GetFileName(f),

                // ✅ Correct URL path
                OriginalPath = ResolveUrl("~/PDF/" + System.IO.Path.GetFileName(f)),

                // Initially empty
                TranslatedPath = ""
            }).ToList();

            rptPDF.DataSource = list;
            rptPDF.DataBind();
        }
        protected void btnTranslateAll_Click(object sender, EventArgs e)
        {
            string lang = ddlLanguage.SelectedValue;

            if (string.IsNullOrEmpty(lang))
            {
                lblMsg.Text = "Please select language";
                return;
            }

            string folder = Server.MapPath("~/PDF/");
            var files = Directory.GetFiles(folder, "*.pdf");

            List<object> list = new List<object>();

            foreach (string file in files)
            {
                string fileName = System.IO.Path.GetFileName(file);

                // Skip already translated files
                if (fileName.StartsWith("translated_"))
                    continue;

                string text = ExtractPdfText(file);
                //text = CleanText(text);

                string translated = TranslateText(text, lang);

                string newFile = "translated_" + fileName;
                string outputPath = System.IO.Path.Combine(folder, newFile);

                CreatePdf(translated, outputPath);

                list.Add(new
                {
                    FileName = fileName,
                    OriginalPath = ResolveUrl("~/PDF/" + fileName),
                    TranslatedPath = ResolveUrl("~/PDF/" + newFile + "?v=" + DateTime.Now.Ticks)
                });
            }

            rptPDF.DataSource = list;
            rptPDF.DataBind();

            lblMsg.Text = "All PDFs translated successfully";
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
    }
}