using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace Lab11_1StackOverflow.Models
{
    [Table("question")]
    public class Question
    {
        [Key]
        public int Id { get; set; }
        public string Username { get; set; }
        public string Title { get; set; }
        public string Detail { get; set; }
        public DateTime Posted { get; set; }
        public string Category { get; set; }
        public string Tags { get; set; }
    }
}
