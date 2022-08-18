using Microsoft.AspNetCore.Mvc;

namespace user.Controllers
{
    public class MainPageController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
