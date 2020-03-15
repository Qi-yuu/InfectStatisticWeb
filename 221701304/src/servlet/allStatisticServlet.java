package edu.fzu.InfectStatisticWeb.servlet;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class allStatisticServlet
 */
@WebServlet("/allStatisticServlet")
public class allStatisticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:49.0) Gecko/20100101 Firefox/49.0";
	public static String HOST = "i.snssdk.com";
	public static String REFERER = "https://i.snssdk.com/feoffline/hot_list/template/hot_list/forum_tab.html?activeWidget=1";   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public allStatisticServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//根URL
		String url = "https://i.snssdk.com/forum/home/v1/info/?activeWidget=1&forum_id=1656784762444839";
		String resultBody = Jsoup.connect(url).
				userAgent(USER_AGENT).header("Host", HOST).header("Referer", REFERER).execute().body();
		JSONObject jsonObject = JSON.parseObject(resultBody);//将json字符串转化为相应的对象
		String ncovStringList = jsonObject.getJSONObject("forum").getJSONObject("extra").getString("ncov_string_list");
		JSONObject ncovListObj = JSON.parseObject(ncovStringList);
		JSONArray nationwides = ncovListObj.getJSONArray("nationwide");
		//取出当日数据
		JSONObject currentDateData = nationwides.getJSONObject(0);
		//取出昨日数据
		JSONObject lastDayData = nationwides.getJSONObject(1);
		request.setAttribute("现有疑似",currentDateData.getIntValue("suspectedNum"));
		request.setAttribute("累计确诊",currentDateData.getIntValue("confirmedNum"));
		request.setAttribute("累计治愈",currentDateData.getIntValue("curesNum"));
		request.setAttribute("累计死亡",currentDateData.getIntValue("deathsNum"));
		request.setAttribute("累计确诊增加",currentDateData.getIntValue("confirmedNum") - lastDayData.getIntValue("confirmedNum"));
		request.setAttribute("累计死亡增加",currentDateData.getIntValue("deathsNum") - lastDayData.getIntValue("deathsNum"));
		request.setAttribute("累计治愈增加",currentDateData.getIntValue("curesNum") - lastDayData.getIntValue("curesNum"));
		request.setAttribute("现有疑似增加",currentDateData.getIntValue("suspectedIncr") );
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
