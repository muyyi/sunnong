using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunnong.Controllers
{
    public class SupplierController : ControllerBase
    {
        //
        // GET: /Supplier/

        /// <summary>
        /// 显示供应商
        /// </summary>
        public ActionResult Index()
        {
            //var suppliers=(from p in Sunnong.Supplier where p.IsDel==false
            //               orderby p.SupplierID descending select p).ToList();
            //return View(suppliers);

            List<Supplier> suppliers_1 = (from p in Sunnong.Supplier
                                         where p.IsDel == false && p.MainCategory == 1
                                        select p).ToList();
            ViewData["suppliers_1"] = suppliers_1;

            List<Supplier> suppliers_2 = (from p in Sunnong.Supplier
                                          where p.IsDel == false && p.MainCategory == 2
                                          select p).ToList();
            ViewData["suppliers_2"] = suppliers_2;

            List<Supplier> suppliers_3 = (from p in Sunnong.Supplier
                                          where p.IsDel == false && p.MainCategory == 3
                                          select p).ToList();
            ViewData["suppliers_3"] = suppliers_3;

            List<Supplier> suppliers_4 = (from p in Sunnong.Supplier
                                          where p.IsDel == false && p.MainCategory == 4
                                          select p).ToList();
            ViewData["suppliers_4"] = suppliers_4;
            return View(ViewData);
        }

        /// <summary>
        /// 供应商详细信息
        /// </summary>
        public ActionResult SupplierDetail(int id)
        {
            Supplier suppliers = (from p in Sunnong.Supplier where p.SupplierID == id && p.IsDel == false select p).First();
            ViewData["Name"] = suppliers.Name;
            ViewData["LianXiRen"] = suppliers.LianXiRen;
            ViewData["Telephone"] = suppliers.Telephone;
            ViewData["DiZhi"] = suppliers.DiZhi;
            ViewData["BeiZhu"] = suppliers.BeiZhu;
            ViewData["ImageUrl"] = suppliers.ImageUrl;
            List<Product> products=(from p in Sunnong.Product where p.SupplierID == id 
                                        && p.IsDel==false select p).ToList();
            ViewData["products"] = products;
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

    }
}
