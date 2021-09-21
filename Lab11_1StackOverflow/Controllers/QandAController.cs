﻿using Microsoft.AspNetCore.Mvc;
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

        public IActionResult Question(int QuestionId)
        {
            QuestionWithAnswers qa = new QuestionWithAnswers();
            qa.Question = DAL.GetQuestion(QuestionId);
            qa.Answers = DAL.GetAnswersByQuestionId(QuestionId);
            return View(qa);
        }

        public IActionResult EditQuestionForm(int QuestionId)
        {
            Question quest = DAL.GetQuestion(QuestionId);
            return View(quest);
        }

        public IActionResult EditQuestion(Question quest)
        {
            DAL.Update(quest);
            return Redirect($"/QandA/Question?QuestionId={quest.Id}");
        }

        public IActionResult EditAnswerForm(int AnswerId)
        {
            Answer ans = DAL.GetAnswer(AnswerId);
            return View(ans);
        }

        public IActionResult EditAnswer(Answer ans)
        {
            DAL.Update(ans);
            return Redirect($"/QandA/Question?QuestionId={ans.QuestionId}");
        }
    }
}
