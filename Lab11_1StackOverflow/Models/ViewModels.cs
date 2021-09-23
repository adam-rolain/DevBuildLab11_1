using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Lab11_1StackOverflow.Models
{
    public class QuestionWithAnswers
    {
        public Question Question { get; set; }
        public List<Answer> Answers { get; set; }
        public Dictionary<int, string> UsernamesById { get; set; }
    }
}
