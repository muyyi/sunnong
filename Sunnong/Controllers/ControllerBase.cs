using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunnong.Controllers
{
    public class ControllerBase : Controller
    {
        //
        // GET: /ControllerBase/

        public SunnongEntities Sunnong = new SunnongEntities(); //linq实体化数据库类

        /// <summary>
        /// 绑定相关数据
        /// </summary>
        public ActionResult Bandlist(int SelectedCategoryid, int SelectedSupplierid)
        {
            //构造dropdownlist的相关数据
            List<Category> categorys = (from c in Sunnong.Category
                                        orderby c.CategoryID descending
                                        select c).ToList();
            ViewData["Category"] = new SelectList(categorys, "CategoryID", "Name", SelectedCategoryid);

            List<Supplier> suppliers = (from s in Sunnong.Supplier where s.IsDel==false
                                        orderby s.SupplierID descending
                                        select s).ToList();
            ViewData["Supplier"] = new SelectList(suppliers, "SupplierID", "Name", SelectedSupplierid);

            return View();
        }

        /// <summary>
        /// 绑定新闻类别
        /// </summary>
        public ActionResult BandNewsType(int SelectedNewsTypeID)
        {
            List<NewsType> newstypes = (from n in Sunnong.NewsType 
                                        orderby n.NewsTypeID descending select n).ToList();
            ViewData["NewsType"] = new SelectList(newstypes, "NewsTypeID", "Name", SelectedNewsTypeID);
            return View();
        }


        /// <summary>
        /// textarea中回车换行和空格的正常显示 
        /// </summary>
        public string turn(String str)
        {

            //str 从数据库里取得的数据
            if (str != null)
            {
                while (str.IndexOf("\n") != -1)
                {
                    str = str.Substring(0, str.IndexOf("\n")) + "<br>" + str.Substring(str.IndexOf("\n") + 1);
                }
                while (str.IndexOf(" ") != -1)
                {
                    str = str.Substring(0, str.IndexOf(" ")) + "&nbsp;" + str.Substring(str.IndexOf(" ") + 1);
                }
            }
            return str;
        }

        //public ActionResult Search(string str_ProName)
        //{
        //    List<Product> products = (from p in Sunnong.Product
        //                              where p.IsDel == false
        //                              && (p.Name.Contains(str_ProName))
        //                              select p).ToList();
        //    return View();
        //}

        ///// <summary>
        ///// 商品查询
        ///// </summary>
        //public ActionResult Search()
        //{
        //    string str_ProName = Convert.ToString(Request.Form["pro_name"]);
        //    ViewData["str_ProName"] = str_ProName;
        //    List<Product> products = (from p in Sunnong.Product
        //                              where p.IsDel == false
        //                              && (p.Name.Contains(str_ProName))
        //                              select p).ToList();
        //    return View(products);
        //}

        public ActionResult HotList()
        {
            List<Product> products = (from p in Sunnong.Product where p.IsDel == false
                                      orderby p.Click descending select p).ToList();
            ViewData["products"] = products;
            return View();
        }

        public ActionResult Click_Count()
        {
            return View();
        }
    }
}
