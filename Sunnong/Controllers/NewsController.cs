using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sunnong.Controllers
{
    public class NewsController : ControllerBase
    {
        //
        // GET: /News/

        /// <summary>
        /// 显示新闻
        /// </summary>
        public ActionResult Index()
        {
            var news = (from p in Sunnong.News where p.IsDel == false orderby p.NewsID descending select p).ToList();
            ViewData["news"] = news;

            List<News> news_1 = (from p in Sunnong.News
                                        where p.NewsTypeID == 1 && p.IsDel == false
                                        orderby p.NewsTypeID descending
                                        select p).ToList();
            ViewData["news_1"] = news_1;

            List<News> news_2 = (from p in Sunnong.News
                                 where p.NewsTypeID == 2 && p.IsDel == false
                                 orderby p.NewsTypeID descending
                                 select p).ToList();
            ViewData["news_2"] = news_2;

            List<News> news_3 = (from p in Sunnong.News
                                 where p.NewsTypeID == 3 && p.IsDel == false
                                 orderby p.NewsTypeID descending
                                 select p).ToList();
            ViewData["news_3"] = news_3;

            List<News> news_4 = (from p in Sunnong.News
                                 where p.NewsTypeID == 4 && p.IsDel == false
                                 orderby p.NewsTypeID descending
                                 select p).ToList();
            ViewData["news_4"] = news_4;
            return View(ViewData);
        }

        /// <summary>
        /// 新闻详细信息
        /// </summary>
        public ActionResult NewsDetail(int id)
        {
            News news = (from p in Sunnong.News where p.NewsID == id select p).First();
            ViewData["Title"] = news.Title;
            ViewData["NewsType"] = news.NewsType.Name;
            //ViewData["NewsContent"] = news.NewsContent;
            string str_content = Convert.ToString(news.NewsContent);
            ViewData["NewsContent"] = turn(str_content);
            //ViewData["Author"] = "admin";
            ViewData["CreateDate"] = news.CreateDate;
            return View(ViewData);
        }

        /// <summary>
        /// 按类显示新闻
        /// </summary>
        /// <param name="id">类别ID</param>
        public ActionResult NewsType(int id)
        {
            var news = (from p in Sunnong.News
                        where p.NewsTypeID == id && p.IsDel == false
                            select p).ToList();
            NewsType newstypes = (from c in Sunnong.NewsType
                                  where c.NewsTypeID == id
                                  select c).First();
            ViewData["NewsType"] = newstypes.Name;
            return View(news);
        }


        /// <summary>
        /// 新闻首页类别显示栏
        /// </summary>
        public ActionResult NewsTypeBar()
        {
            var news = (from p in Sunnong.NewsType
                        orderby p.NewsTypeID descending
                        select p).ToList();
            return View(news);
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
