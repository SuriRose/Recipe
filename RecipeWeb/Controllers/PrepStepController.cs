using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RecipeBizObjects;

namespace RecipeWeb.Controllers
{
    public class PrepStepController : Controller
    {
        // GET: PrepStepController
        public ActionResult Index()
        {
            List<bizPrepStep> lst = bizPrepStep.GetAll();
            return View(lst);
        }

        // GET: PrepStepController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: PrepStepController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PrepStepController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: PrepStepController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PrepStepController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: PrepStepController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PrepStepController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
