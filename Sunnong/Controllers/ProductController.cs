using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunnong.Controllers
{
    public class ProductController : ControllerBase
    {
        //
        // GET: /Product/

        /// <summary>
        /// 显示商品
        /// </summary>
        public ActionResult Index()
        {
            List<Product> products = (from p in Sunnong.Product where p.IsDel == false orderby p.ProductID descending select p).ToList();
            ViewData["products"] = products;

            List<Product> products_1 = (from p in Sunnong.Product
                                        where p.CategoryID == 1 && p.IsDel == false
                              orderby p.ProductID descending select p).ToList();
            ViewData["products_1"] = products_1;

            List<Product> products_2 = (from p in Sunnong.Product
                                        where p.CategoryID == 2 && p.IsDel == false
                              orderby p.ProductID descending select p).ToList();
            ViewData["products_2"] = products_2;

            List<Product> products_3 = (from p in Sunnong.Product
                                        where p.CategoryID == 3 && p.IsDel == false
                              orderby p.ProductID descending select p).ToList();
            ViewData["products_3"] = products_3;

            return View(ViewData);
        }

        /// <summary>
        /// 商品详细信息
        /// </summary>
        public ActionResult Item(int id)
        {
            Product products = (from p in Sunnong.Product where p.ProductID == id select p).First();
            int Click_Count =Convert.ToInt32(products.Click);
            ++Click_Count;
            ViewData["Click"] = Click_Count;
            products.Click = Click_Count;
            Sunnong.SaveChanges();
            //点开商品详细信息后令该商品点击率自增1，并保存


            ViewData["Name"] = products.Name;
            ViewData["Category"] = products.Category.Name;
            ViewData["Supplier"] = products.Supplier.Name;
            ViewData["ChangDi"] = products.ChangDi;
            ViewData["Description"] = products.Description;
            ViewData["SupplierID"] = products.SupplierID;
            ViewData["ProductID"] = products.ProductID;
            return View(ViewData);
        }

        /// <summary>
        /// 按类显示商品
        /// </summary>
        /// <param name="id">类别ID</param>
        public ActionResult Category(int id)
        {
            var products = (from p in Sunnong.Product
                            where p.Category.CategoryID == id && p.IsDel == false
                            select p).ToList();
            Category categorys = (from c in Sunnong.Category 
                                  where c.CategoryID == id select c).First();
            ViewData["Category"] = categorys.Name;
            return View(products);
        }


        /// <summary>
        /// 商品首页类别显示栏
        /// </summary>
        public ActionResult CategoryBar()
        {
            var categories = (from c in Sunnong.Category orderby c.CategoryID descending
                              select c).ToList();
            return View(categories);
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
            string str_ProName = Convert.ToString(Request.Form["pro_name"]);
            ViewData["str_ProName"] = str_ProName;
            List<Product> products = (from p in Sunnong.Product
                                      where p.IsDel == false
                                      && (p.Name.Contains(str_ProName))
                                      select p).ToList();
            return View(products);
        }
    }
}