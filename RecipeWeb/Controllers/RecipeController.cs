using CPUFramework;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using RecipeBizObjects;


namespace RecipeWeb.Controllers
{
    public class RecipeController : Controller
    {
        public IActionResult Index()
        {
            List<bizRecipe> lst = bizRecipe.GetAll();
            return View(lst);
        }
        [EnableCors("Policy1")]
        public ActionResult APIRecipeListJS()
        {
            List<bizRecipe> lst = bizRecipe.GetAll();
            return Json(lst);
        }
        public IActionResult Recipe(string id)
        {
            //bizRecipe recipe = bizRecipe.Get(id);
            bizRecipe recipe = bizRecipe.Get("Code", id);
            return View(recipe);
        }
        // GET: PartiesController/Edit/5
        public ActionResult Edit(string id)
        {
            //bizRecipe r;
            //if (string.IsNullOrEmpty(id))
            //{
            //    r = new();
            //}
            //else
            //{
            //    r = bizRecipe.Get("RecipeId", id);
            //}
            //return View(r);
            bizRecipe r = bizRecipe.Get("Code", id);
            return View(r);
        }

        // POST: PartiesController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(bizRecipe recipe)
        {
            try
            {
                recipe.Save();
                return RedirectToAction(nameof(Index));
            }
            catch (CPUException ex)
            {
                recipe = bizRecipe.Get(recipe.RecipeId);
                ViewBag.ErrorMessage = ex.FriendlyMessage;
                return View(recipe);
            }
        }
        // GET: PartiesController/Delete/5
        public ActionResult Delete(string id)
        {
            bizRecipe r = bizRecipe.Get("Code", id);
            return View(r);
        }

        // POST: PartiesController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(bizRecipe recipe)
        {
            try
            {
                recipe.Delete();
                return RedirectToAction(nameof(Index));
            }
            catch (CPUException ex)
            {
                recipe = bizRecipe.Get(recipe.RecipeId);
                ViewBag.ErrorMessage = ex.FriendlyMessage;
                return View(recipe);
            }
        }
    }
}


