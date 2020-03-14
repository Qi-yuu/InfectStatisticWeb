package edu.fzu.InfectStatisticWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class dateServlet
 */
@WebServlet("/dateServlet")
public class dateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:49.0) Gecko/20100101 Firefox/49.0";
	public static String HOST = "i.snssdk.com";
	public static String REFERER = "https://i.snssdk.com/feoffline/hot_list/template/hot_list/forum_tab.html?activeWidget=1";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String url = "https://i.snssdk.com/forum/home/v1/info/?activeWidget=1&forum_id=1656784762444839";
		String resultBody = Jsoup.connect(url).
				userAgent(USER_AGENT).header("Host", HOST).header("Referer", REFERER).execute().body();
		response.setContentType("text/html;setcharset=UTF-8");//通知浏览器以UTF-8格式打开
        response.setCharacterEncoding("UTF-8");//设置response的编码为UTF-8
		JSONObject jsonObject = JSON.parseObject(resultBody);
		String ncovStringList = jsonObject.getJSONObject("forum").getJSONObject("extra").getString("ncov_string_list");
		JSONObject ncovListObj = JSON.parseObject(ncovStringList);
		JSONArray nationwides = ncovListObj.getJSONArray("nationwide");
		String param=(String)(request.getParameter("Find"));//是否手动设置日期
		if (param!=null&&(!param.equals(""))) 
		{
			session.setAttribute("date", param);
			for (int i = 0; i<nationwides.size();i++) 
			{
				JSONObject currentDateData = nationwides.getJSONObject(i);
				String str=currentDateData.getString("date");
				if (str.equals(param)) 
				{
					JSONObject lastDayData = nationwides.getJSONObject(i+1);
					session.setAttribute("现有疑似",currentDateData.getIntValue("suspectedNum"));
					session.setAttribute("累计确诊",currentDateData.getIntValue("confirmedNum"));
					session.setAttribute("累计治愈",currentDateData.getIntValue("curesNum"));
					session.setAttribute("累计死亡",currentDateData.getIntValue("deathsNum"));
					session.setAttribute("累计确诊增加",currentDateData.getIntValue("confirmedNum") - lastDayData.getIntValue("confirmedNum"));
					session.setAttribute("累计死亡增加",currentDateData.getIntValue("deathsNum") - lastDayData.getIntValue("deathsNum"));
					session.setAttribute("累计治愈增加",currentDateData.getIntValue("curesNum") - lastDayData.getIntValue("curesNum"));
					session.setAttribute("现有疑似增加",currentDateData.getIntValue("suspectedIncr") );
					
				}
			}
		}
		else 
		{
			JSONObject currentDateData = nationwides.getJSONObject(0);
			JSONObject lastDayData = nationwides.getJSONObject(1);
			session.setAttribute("现有疑似",currentDateData.getIntValue("suspectedNum"));
			session.setAttribute("累计确诊",currentDateData.getIntValue("confirmedNum"));
			session.setAttribute("累计治愈",currentDateData.getIntValue("curesNum"));
			session.setAttribute("累计死亡",currentDateData.getIntValue("deathsNum"));
			session.setAttribute("累计确诊增加",currentDateData.getIntValue("confirmedNum") - lastDayData.getIntValue("confirmedNum"));
			session.setAttribute("累计死亡增加",currentDateData.getIntValue("deathsNum") - lastDayData.getIntValue("deathsNum"));
			session.setAttribute("累计治愈增加",currentDateData.getIntValue("curesNum") - lastDayData.getIntValue("curesNum"));
			session.setAttribute("现有疑似增加",currentDateData.getIntValue("suspectedIncr") );
			String date=currentDateData.getString("date");
			session.setAttribute("date", date);
		}
					
				
    	request.getRequestDispatcher("InfectStatistic.jsp").forward(request, response);
      
 		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
