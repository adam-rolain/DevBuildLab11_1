using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace Lab11_1StackOverflow.Models
{
    [Table("answer")]
    public class Answer
    {
        [Key]
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Detail { get; set; }
        public string QuestionId { get; set; }
        public DateTime Posted { get; set; }
        public int UpVotes { get; set; }
    }
}
