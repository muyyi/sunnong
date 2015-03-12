using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Sunnong.Controllers
{
    public class AdminController : ControllerBase
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 商品列表
        /// </summary>
        //public ActionResult ProductList()
        //{
        //    List<Product> products = (from p in Sunnong.Product where p.IsDel==false orderby p.ProductID descending select p).ToList();
        //    return View(products);
        //}

        public ActionResult ProductList()
        {
            List<Product> products = (from p in Sunnong.Product where p.IsDel == false orderby p.ProductID descending select p).ToList();
            ViewData["products"] = products;
            return View(ViewData);
        }

        public ActionResult Item(int id)
        {
            Product products = (from p in Sunnong.Product where p.ProductID == id select p).First();
            ViewData["Name"] = products.Name;
            ViewData["Category"] = products.Category.Name;
            ViewData["Supplier"] = products.Supplier.Name;
            ViewData["ChangDi"] = products.ChangDi;
            ViewData["Description"] =turn(Convert.ToString(products.Description));
            ViewData["SupplierID"] = products.SupplierID;
            ViewData["ProductID"] = products.ProductID;
            return View(ViewData);
        }


        /// <summary>
        /// 删除商品
        /// </summary>
        public ActionResult DeleteProduct(int id)
        {
            Product products = (from p in Sunnong.Product where p.ProductID == id select p).First();
            products.IsDel = true;
            Sunnong.SaveChanges();
            return RedirectToAction("ProductList");
        }

        /// <summary>
        /// 新增商品
        /// </summary>
        public ActionResult AddProduct()
        {
            Category categorys = (from c in Sunnong.Category
                                  orderby c.CategoryID descending
                                  select c).First();
            int firstCategoryID = categorys.CategoryID;
            Supplier suppliers = (from s in Sunnong.Supplier
                                  orderby s.SupplierID descending
                                  select s).First();
            int firstSupplierID = suppliers.SupplierID;

            Bandlist(firstCategoryID,firstSupplierID); //以相关表第一个ID作为默认ID
            //RenderView("AddProduct");  //为什么不用return?
            //return Redirect("AddProduct"); //尝试的替代方法1
            return View();
        }


        /// <summary>
        /// 保存修改
        /// </summary>
        public ActionResult SaveProduct()
        {       
            Product product = new Product();
            product.Name = Request.Form["Name"];
            product.Description = Request.Form["Description"];
            product.ChangDi = Request.Form["ChangDi"];
            product.CategoryID = Convert.ToInt32(Request.Form["Category"]);
            product.SupplierID = Convert.ToInt32(Request.Form["Supplier"]);
            product.IsDel = false;   //新增数据时该数据不作废
            Sunnong.AddToProduct(product);
            Sunnong.SaveChanges();
            return RedirectToAction("ProductList");
        }
        //需要完善增加商品图片的功能

        /// <summary>
        /// 修改商品信息
        /// </summary>
        public ActionResult EditProduct(int id)
        {
            Product product = (from p in Sunnong.Product where p.ProductID == id select p).First();
            int selectedCategoryID = Convert.ToInt32(product.CategoryID); 
            int selectedSupplierID = Convert.ToInt32(product.SupplierID);
            Bandlist(selectedCategoryID, selectedSupplierID);
            //让dropdownlist选中商品对应的ID

            ViewData["Name"] = product.Name;
            ViewData["ChangDi"] = product.ChangDi;
            ViewData["BeiZhu"] = turn(Convert.ToString(product.Description));
            ViewData["ProductID"] = product.ProductID;
            ////传递已有的信息至修改界面

            //if (Request.RequestType == "post")
            //{
            //    product.Name = Request.Form["Name"];
            //    product.Description = Request.Form["Description"];
            //    product.ChangDi = Request.Form["ChangDi"];
            //    product.CategoryID = Convert.ToInt32(Request.Form["Category"]);
            //    product.SupplierID = Convert.ToInt32(Request.Form["Supplier"]);
            //    //product.ImageUrl = Request.Form["ImageUrl"];
            //    Sunnong.SaveChanges();
            //    return RedirectToAction("ProductList");
            //}
            //点击修改后将值传回服务器

            return View();
        }

        ///// <summary>
        ///// 保存修改
        ///// </summary>
        //public ActionResult SaveEdit()
        //{
        //    int id = Convert.ToInt32(Request.Form["id"]);
        //    Product product = (from p in Sunnong.Product where p.ProductID == id select p).First();
        //    //ViewData["ProductID"] = product.ProductID;
        //    product.Name = Request.Form["Name"];
        //    product.Description = Request.Form["Description"];
        //    product.ChangDi = Request.Form["ChangDi"];
        //    product.CategoryID = Convert.ToInt32(Request.Form["Category"]);
        //    product.SupplierID = Convert.ToInt32(Request.Form["Supplier"]);
        //    //product.ImageUrl = Request.Form["ImageUrl"];
        //    Sunnong.SaveChanges();
        //    return RedirectToAction("ProductList");
        //    //点击修改后将值传回服务器
        //}

        /// <summary>
        /// 保存商品修改
        /// </summary>
        public ActionResult SaveEdit_Product(int id)
        {
            Product product = (from p in Sunnong.Product where p.ProductID == id select p).First();
            //ViewData["ProductID"] = product.ProductID;
            product.Name = Request.Form["Name"];
            product.Description = Request.Form["Description"];
            product.ChangDi = Request.Form["ChangDi"];
            product.CategoryID = Convert.ToInt32(Request.Form["Category"]);
            product.SupplierID = Convert.ToInt32(Request.Form["Supplier"]);
            //product.ImageUrl = Request.Form["ImageUrl"];
            Sunnong.SaveChanges();
            return RedirectToAction("ProductList");
            //点击修改后将值传回服务器
        }

        /// <summary>
        /// 新闻列表
        /// </summary>
        public ActionResult NewsList()
        {
            var news = (from n in Sunnong.News where n.IsDel == false 
                        orderby n.NewsID select n).ToList();
            ViewData["news"] = news;
            return View(ViewData);
        }

        /// <summary>
        /// 新增新闻
        /// </summary>
        public ActionResult AddNews()
        {
            NewsType newstypes = (from n in Sunnong.NewsType 
                                  orderby n.NewsTypeID descending select n).First();
            //设置新闻类别的第一个结果为相应下拉框的结果，当新闻类别表内无数据时，会跳错（填充数据后则不会）。
            //是否有更好的办法以避免该情况的发生？（该方法添加数据前数据库对应表至少需要有一个数据）
            int selectedid = newstypes.NewsTypeID;
            BandNewsType(selectedid);
            return View();
        }


        /// <summary>
        /// 保存新闻
        /// </summary>
        public ActionResult SaveNews()
        {
            News news = new News();
            news.Title = Request.Form["Title"];
            news.NewsTypeID = Convert.ToInt32(Request.Form["NewsType"]);
            news.Author = 1;  
            //默认只有管理员有权限新增新闻
            news.NewsContent = Request.Form["NewsContent"];
            news.CreateDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
            news.IsDel = false;
            //新增数据时该数据不作废
            Sunnong.AddToNews(news);
            Sunnong.SaveChanges();
            return RedirectToAction("NewsList");
        }

        /// <summary>
        /// 修改商品信息
        /// </summary>
        public ActionResult EditNews(int id)
        {
            News news = (from n in Sunnong.News where n.NewsID == id select n).First();
            int selectedid = Convert.ToInt32(news.NewsTypeID);
            BandNewsType(selectedid);
            //让dropdownlist选中新闻对应的ID
            ViewData["Title"] = news.Title;
            ViewData["NewsContent"] =turn(Convert.ToString(news.NewsContent));
            ViewData["NewsID"] = news.NewsID;
            ////传递已有的信息至修改界面

            //if (Request.RequestType == "POST")
            //{
            //    news.Title = Request.Form["Title"];
            //    news.Author = 1;
            //    //默认只有管理员有权限新增新闻
            //    news.NewsContent = Request.Form["NewsContent"];
            //    news.CreateDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
            //    news.IsDel = false;
            //    //新增数据时该数据不作废
            //    Sunnong.SaveChanges();
            //    return RedirectToAction("NewsList");                
            //}
            ////点击修改后将值传回服务器
          return View();
        }

        /// <summary>
        /// 保存新闻修改
        /// </summary>
        public ActionResult SaveEdit_News(int id)
        {
            News news = (from n in Sunnong.News where n.NewsID == id select n).First();
            news.Title = Request.Form["Title"];
            news.NewsContent = Request.Form["NewsContent"];
            Sunnong.SaveChanges();
            return RedirectToAction("NewsList");  
        }

        /// <summary>
        /// 删除资讯
        /// </summary>
        public ActionResult DeleteNews(int id)
        {
            News news = (from n in Sunnong.News where n.NewsID == id select n).First();
            news.IsDel = true;
            Sunnong.SaveChanges();
            return RedirectToAction("NewsList");
        }

        /// <summary>
        /// 供应商列表
        /// </summary>
        public ActionResult SupplierList()
        {
            var suppliers = (from p in Sunnong.Supplier where p.IsDel == false orderby p.SupplierID descending select p).ToList();
            ViewData["suppliers"] = suppliers;
            return View(suppliers);
        }

        /// <summary>
        /// 新增供应商
        /// </summary>
        public ActionResult AddSupplier()
        {
            return View();
        }


        /// <summary>
        /// 保存供应商
        /// </summary>
        public ActionResult SaveSupplier()
        {
            Supplier suppliers = new Supplier();
            suppliers.Name = Request.Form["Name"];
            suppliers.LianXiRen = Request.Form["LianXiRen"];
            suppliers.Telephone = Request.Form["Telephone"];
            suppliers.DiZhi = Request.Form["DiZhi"];
            suppliers.BeiZhu = Request.Form["BeiZhu"];

            suppliers.IsDel = false;   //新增数据时该数据不作废
            Sunnong.AddToSupplier(suppliers); ;
            Sunnong.SaveChanges();
            return RedirectToAction("SupplierList");
        }

        /// <summary>
        /// 修改供应商信息
        /// </summary>
        public ActionResult EditSupplier(int id)
        {
            Supplier suppliers = (from s in Sunnong.Supplier where s.SupplierID == id select s).First();
            ViewData["Name"] = suppliers.Name;
            ViewData["LianXiRen"] = suppliers.LianXiRen;
            ViewData["Telephone"] = suppliers.Telephone;
            ViewData["DiZhi"] = suppliers.DiZhi;
            ViewData["BeiZhu"] = turn(Convert.ToString(suppliers.BeiZhu));
            ViewData["SupplierID"] = suppliers.SupplierID;
            ////传递已有的信息至修改界面

            if (Request.RequestType == "POST")
            {
                suppliers.Name = Request.Form["Name"];
                suppliers.LianXiRen = Request.Form["LianXiRen"];
                suppliers.Telephone = Request.Form["Telephone"];
                suppliers.DiZhi = Request.Form["DiZhi"];
                suppliers.BeiZhu = Request.Form["BeiZhu"];
                suppliers.IsDel = false;
                //新增数据时该数据不作废
                Sunnong.SaveChanges();
                return RedirectToAction("SupplierList");
            }
            ////点击修改后将值传回服务器
            return View();
        }

        public ActionResult SaveEdit_Supplier(int id)
        {
            Supplier suppliers = (from s in Sunnong.Supplier where s.SupplierID == id select s).First();
            suppliers.Name = Request.Form["Name"];
            suppliers.LianXiRen = Request.Form["LianXiRen"];
            suppliers.Telephone = Request.Form["Telephone"];
            suppliers.DiZhi = Request.Form["DiZhi"];
            suppliers.BeiZhu = Request.Form["BeiZhu"];
            Sunnong.SaveChanges();
            return RedirectToAction("SupplierList");
            //点击修改后将值传回服务器
        }

        /// <summary>
        /// 删除供应商
        /// </summary>
        public ActionResult DeleteSupplier(int id)
        {
            Supplier suppliers = (from n in Sunnong.Supplier where n.SupplierID == id select n).First();
            ViewData["SupplierID"] = suppliers.SupplierID;
            suppliers.IsDel = true;
            Sunnong.SaveChanges();
            return RedirectToAction("SupplierList");
        }
    }
}
