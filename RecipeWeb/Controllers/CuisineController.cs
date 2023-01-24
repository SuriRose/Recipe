using Microsoft.AspNetCore.Mvc;
using RecipeBizObjects;
using CPUFramework;
using Microsoft.AspNetCore.Cors;

namespace RecipeWeb.Controllers
{
    public class CuisineController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [EnableCors("Policy1")]
        public IActionResult APICuisineList()
        {
            List<bizCuisineType> lst = bizCuisineType.GetAll();
            return Json(lst);
        }
    }
}
