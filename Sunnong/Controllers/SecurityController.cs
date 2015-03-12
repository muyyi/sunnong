using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Sunnong.Controllers
{
    public class SecurityController : ControllerBase
    {
        //
        // GET: /Security/

        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 用户注册
        /// </summary>

        public ActionResult Register()
        {
            if (Request.RequestType == "POST")
            {
                if (Request.Form["username"] != "" && Request.Form["password"] != "")
                {
                    User user = new User();
                    user.Username = Request.Form["username"];
                    user.Password = Request.Form["password"];
                    user.UserTypeID = 2;
                    user.IsDel = false;
                    //默认该用户为普通用户，且账号有效
                    Sunnong.AddToUser(user);
                    Sunnong.SaveChanges();
                    return RedirectToAction("login", "Security");
                }
                else
                {
                    TempData["message"] = "用户名和密码不能为空！";
                }
            }
            return View();
        }

        /// <summary>
        /// 用户登录
        /// </summary>

        public ActionResult Login()
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            if (Request.RequestType == "POST")
            {
                if (username != "" && password != "")
                {
                    var currentUser = (from u in Sunnong.User where u.Username == username && u.Password == password select u).ToList();
                    if (currentUser.Count > 0)
                    {
                        HttpContext.Session["UserID"] = currentUser.First().UserID;
                        HttpContext.Session["Username"] = currentUser.First().Username;
                        HttpContext.Session["User"] = currentUser.First();
                        FormsAuthentication.SetAuthCookie(currentUser.First().Username, false);
                        if (currentUser.First().UserID == 1)
                        {
                            return RedirectToAction("index", "admin"); 
                        }
                        else
                        {
                            return RedirectToAction("index", "home");
                        }
                    }
                    else
                    {
                        TempData["message"] = "用户名或密码错误，请重新输入";
                    }
                }
                else
                {
                    TempData["message"] = "账号名和密码不能为空！";
                }
            }
            return View();
        }

        /// <summary>
        /// 用户退出
        /// </summary>
        
        public ActionResult Logout()
        {
            HttpContext.Session["UserID"] = null;
            HttpContext.Session["Username"] = null;
            HttpContext.Session["User"] = null;
            HttpContext.Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
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
