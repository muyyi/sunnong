using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sunnong.Models;


namespace Sunnong.Controllers
{
    public class TestController : ControllerBase
    {
        //
        // GET: /Test/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MenuBar()
        {
            return View();
        }

        public ActionResult ProductTest()
        {
            return View();
        }
        //新建一个mene视图

        public ActionResult Viewtest()
        {
            List<Product> products = (from p in Sunnong.Product where p.IsDel == false select p).ToList();
            ViewData["products"] = products;

            List<News> news = (from p in Sunnong.News where p.IsDel == false select p).ToList();
            ViewData["news"] = news;

            List<Supplier> suppliers = (from p in Sunnong.Supplier where p.IsDel == false select p).ToList();
            ViewData["suppliers"] = suppliers;

            return View(ViewData);
        }

        public ActionResult Modeltest()
        {
            List<Product> products = (from p in Sunnong.Product where p.IsDel == false select p).ToList();
            ViewData["products"] = products;

            List<News> news = (from p in Sunnong.News where p.IsDel == false select p).ToList();
            ViewData["news"] = news;

            List<Supplier> suppliers = (from p in Sunnong.Supplier where p.IsDel == false select p).ToList();
            ViewData["suppliers"] = suppliers;

            return View(ViewData);
        }

        public ActionResult top()
        {
            return PartialView();
        }

        public ActionResult footer()
        {
            return PartialView();
        }

        public ActionResult Search()
        {
            string str_ProName =Convert.ToString(Request.Form["pro_name"]);
            ViewData["str_ProName"] = str_ProName;
            List<Product> products = (from p in Sunnong.Product
                                      where p.IsDel == false
                                      && (p.Name.Contains(str_ProName))
                                      select p).ToList();
            return View(products);
        }
    }
}
