using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.FileProviders;

namespace jtperkins.info.Pages
{
    public class ResumeModel : PageModel
    {
        public void OnGet()
        {
        }

        public ActionResult OnPostDownloadFile()
        {
            return File("/files/resume.docx", "application/octet-stream", "PerkinsResume.docx");
        }
    }
}