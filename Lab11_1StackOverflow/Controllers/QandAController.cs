using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Lab11_1StackOverflow.Models;

namespace Lab11_1StackOverflow.Controllers
{
    public class QandAController : Controller
    {
        public IActionResult Index()
        {
            List<Question> questions = DAL.GetAllQuestions();
            return View(questions);
        }
    }
}
