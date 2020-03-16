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
 * Servlet implementation class provinceServlet
 */
@WebServlet("/provinceServlet")
public class provinceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:49.0) Gecko/20100101 Firefox/49.0";
	public static String HOST = "i.snssdk.com";
	public static String REFERER = "https://i.snssdk.com/feoffline/hot_list/template/hot_list/forum_tab.html?activeWidget=1";  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public provinceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String province=request.getParameter("province");
		String date=request.getParameter("date");
		HttpSession session=request.getSession();	
		String url = "https://i.snssdk.com/forum/home/v1/info/?activeWidget=1&forum_id=1656784762444839";
		String resultBody = Jsoup.connect(url).
				userAgent(USER_AGENT).header("Host", HOST).header("Referer", REFERER).execute().body();
		JSONObject jsonObject = JSON.parseObject(resultBody);
		String ncovStringList = jsonObject.getJSONObject("forum").getJSONObject("extra").getString("ncov_string_list");
		JSONObject ncovListObj = JSON.parseObject(ncovStringList);
		JSONArray provinces = ncovListObj.getJSONArray("provinces");
		
		for (int i = 0; i<provinces.size();i++) {
			JSONObject data = provinces.getJSONObject(i);
			String name=data.getString("name");
			if (name.equals(province)) //找到所选省份
			{
				JSONArray timeStatistic =data.getJSONArray("series");//省份里面每日数据
				for (int j = 0; j <timeStatistic.size()-1; j++) 
				{
					
					JSONObject currentDateData=timeStatistic.getJSONObject(j);
					JSONObject lastDayData = timeStatistic.getJSONObject(j+1);
					if (currentDateData.getString("date").equals(date)) 
					{
						session.setAttribute("省现有确诊",currentDateData.getIntValue("treatingNum"));
						session.setAttribute("省累计确诊",currentDateData.getIntValue("confirmedNum"));
						session.setAttribute("省累计治愈",currentDateData.getIntValue("curesNum"));
						session.setAttribute("省累计死亡",currentDateData.getIntValue("deathsNum"));
						session.setAttribute("省累计确诊增加",currentDateData.getIntValue("confirmedNum") - lastDayData.getIntValue("confirmedNum"));
						session.setAttribute("省累计死亡增加",currentDateData.getIntValue("deathsNum") - lastDayData.getIntValue("deathsNum"));
						session.setAttribute("省累计治愈增加",currentDateData.getIntValue("curesNum") - lastDayData.getIntValue("curesNum"));
						session.setAttribute("省现有确诊增加",currentDateData.getIntValue("treatingNum") - lastDayData.getIntValue("treatingNum"));
					}
				
				}
				
			}
		}
		request.setAttribute("province", province);
		request.getRequestDispatcher("ProvinceChart.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
