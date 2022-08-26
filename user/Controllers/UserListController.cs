using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using user.Models;

namespace userApplication.Controllers
{
    public class UserList : Controller
    {
        public IActionResult ListOfUser()
        {
            UserProcess userProcess = new UserProcess();
            return View(userProcess.readDatabaseToList());
        }

        public IActionResult DeleteUser(string email)
        {
            UserProcess userProcess = new UserProcess();
            userProcess.deleteUser(email);

            List<User> model = userProcess.readDatabaseToList();
            return View("ListOfUser", model);
        }
        public IActionResult Deneme()
        {

            return View();
        }
    }
}
