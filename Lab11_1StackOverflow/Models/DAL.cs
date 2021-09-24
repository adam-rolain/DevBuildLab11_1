using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using MySql.Data.MySqlClient;
using Dapper;

namespace Lab11_1StackOverflow.Models
{
    public class DAL
    {
        // Database Connection
        public static MySqlConnection DB = new MySqlConnection("Server=localhost;Database=stackoverflow;Uid=root;Password=abc123");

        // Current UserId
        public static User CurrentUser;


        // Question Model CRUD Methods:

        // CREATE
        public static void Insert(Question quest)
        {
            quest.Posted = DateTime.Now;
            quest.UserId = DAL.CurrentUser.Id;
            quest.Status = 1;
            DB.Insert(quest);
        }

        // READ
        public static List<Question> GetAllQuestions()
        {
            return DB.GetAll<Question>().ToList();
        }

        public static Question GetQuestion(int id)
        {
            return DB.Get<Question>(id);
        }

        public static int GetUserId(int questionId)
        {
            List<int> userId = DB.Query<int>("SELECT userId FROM question WHERE id = @id", new { id = questionId }).ToList();

            if (userId.Count > 0)
            {
                return userId[0];
            }
            else
            {
                return -1;
            }
        }

        public static List<Question> Search(string searchString)
        {
            return DB.Query<Question>("SELECT * FROM question WHERE title LIKE @search OR detail LIKE @search;", new { search = $"%{searchString}%" }).ToList();
        }

        // UPDATE
        public static void Update(Question quest)
        {
            DB.Update(quest);
        }

        // DELETE
        public static void DeleteQuestion(int id)
        {
            Question quest = new Question();
            quest.Id = id;
            DB.Delete(quest);
        }


        // Answer Model CRUD Methods:

        // CREATE
        public static void Insert(Answer ans)
        {
            ans.UserId = DAL.CurrentUser.Id;
            ans.Posted = DateTime.Now;
            ans.UpVotes = 0;
            DB.Insert(ans);
        }

        // READ
        public static List<Answer> GetAllAnswers()
        {
            return DB.GetAll<Answer>().ToList();
        }

        public static Answer GetAnswer(int id)
        {
            return DB.Get<Answer>(id);
        }

        public static List<Answer> GetAnswersByQuestionId(int questionId)
        {
            return DB.Query<Answer>("SELECT * FROM answer WHERE questionId = @questionId", new { questionId = questionId }).ToList();
        }

        public static List<int> GetUserIdsByQuestionId(int questionId)
        {
            return DB.Query<int>("SELECT userId FROM answer WHERE questionId = @questionId", new { questionId = questionId }).ToList();
        }

        // UPDATE
        public static void Update(Answer ans)
        {
            DB.Update(ans);
        }

        // DELETE
        public static void DeleteAnswer(int id)
        {
            Answer ans = new Answer();
            ans.Id = id;
            DB.Delete(ans);
        }

        // User Model CRUD Methods:

        // CREATE
        // READ
        public static User GetUser(int id)
        {
            return DB.Get<User>(id);
        }
        
        public static int VerifyUser(string emailOrUsername, string password)
        {
            User foundUser = GetUserByEmail(emailOrUsername);

            if (foundUser == null)
            {
                foundUser = GetUserByUsername(emailOrUsername);
            }

            if (foundUser == null)
            {
                return -1;
            }
            else
            {
                return foundUser.Id;
            }
        }

        public static User GetUserByEmail(string email)
        {
            List<User> found = DB.Query<User>("SELECT * FROM user WHERE email = @email", new  { email = email }).ToList();

            if (found.Count > 0)
            {
                return found[0];
            }
            else
            {
                return null;
            }
        }

        public static User GetUserByUsername(string username)
        {
            List<User> found = DB.Query<User>("SELECT * FROM user WHERE username = @username", new { username = username }).ToList();

            if (found.Count > 0)
            {
                return found[0];
            }
            else
            {
                return null;
            }
        }

        public static string GetUsername(int id)
        {
            List<string> found = DB.Query<string>("SELECT username FROM user WHERE id = @id", new { id = id }).ToList();

            if (found.Count > 0)
            {
                return found[0];
            }
            else
            {
                return null;
            }
        }

        public static Dictionary<int, string> GetUsernamesById(int questionUser, List<int> answerUsers)
        {
            answerUsers.Add(questionUser);
            Dictionary<int, string> usernamesById = new Dictionary<int, string>();

            foreach (int id in answerUsers)
            {
                if (!usernamesById.ContainsKey(id))
                {
                    usernamesById[id] = DAL.GetUsername(id);
                }
            }

            return usernamesById;
        }
    }
}
