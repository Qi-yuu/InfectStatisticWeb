package edu.fzu.InfectStatisticWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

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
 * Servlet implementation class provinceStatisticServlet
 */
@WebServlet("/provinceStatisticServlet")
public class provinceStatisticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:49.0) Gecko/20100101 Firefox/49.0";
	public static String HOST = "i.snssdk.com";
	public static String REFERER = "https://i.snssdk.com/feoffline/hot_list/template/hot_list/forum_tab.html?activeWidget=1";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public provinceStatisticServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//根URL
		HttpSession session=request.getSession();	
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println(type);
		String url = "https://i.snssdk.com/forum/home/v1/info/?activeWidget=1&forum_id=1656784762444839";
		String resultBody = Jsoup.connect(url).
				userAgent(USER_AGENT).header("Host", HOST).header("Referer", REFERER).execute().body();
		JSONObject jsonObject = JSON.parseObject(resultBody);
		String ncovStringList = jsonObject.getJSONObject("forum").getJSONObject("extra").getString("ncov_string_list");
		JSONObject ncovListObj = JSON.parseObject(ncovStringList);
		JSONArray provinces = ncovListObj.getJSONArray("provinces");
		Map<String,Object> rData = new TreeMap<String,Object>(
				new Comparator<String>() {
					public int compare(String obj1,String obj2) 
					{
						return obj1.compareTo(obj2);
						
					}
				});
		if (name.equals("全国")) 
		{
			for (int i = 0; i<provinces.size();i++) {
				JSONObject data = provinces.getJSONObject(i);
				rData.put(data.getString("name"), data.getIntValue("confirmedNum"));
			}//遍历得到每个省的累计确诊人数
			response.setHeader("content-type", "application/json;charset=UTF-8");//告诉浏览器他发送的什么类型
			PrintWriter out = response.getWriter();
			JSONObject json = new JSONObject(rData);
			out.print(json);
		}
		else
		{
			String province=name;
			if (type.equals("累计确诊"))
			{
				for (int i = 0; i<provinces.size();i++) {
					JSONObject data = provinces.getJSONObject(i);
					String provinceName=data.getString("name");
					if (provinceName.equals(province)) {
						JSONArray timeStatistic =data.getJSONArray("series");//省份里面每日数据
						for (int j = 0; j <timeStatistic.size(); j++) 
						{
							JSONObject dateData=timeStatistic.getJSONObject(j);
							rData.put(dateData.getString("date"), dateData.getString("confirmedNum"));	//存取折线图所需数据
						}
					}
				}
				response.setHeader("content-type", "application/json;charset=UTF-8");//告诉浏览器他发送的什么类型
				PrintWriter out = response.getWriter();
				JSONObject json = new JSONObject(rData);
				out.print(json);
				
			}
			else if (type.equals("累计治愈")) 
			{
				for (int i = 0; i<provinces.size();i++) {
					JSONObject data = provinces.getJSONObject(i);
					String provinceName=data.getString("name");
					if (provinceName.equals(province)) {
						JSONArray timeStatistic =data.getJSONArray("series");//省份里面每日数据
						for (int j = 0; j <timeStatistic.size(); j++) 
						{
							JSONObject dateData=timeStatistic.getJSONObject(j);
							rData.put(dateData.getString("date"), dateData.getString("curesNum"));	//存取折线图所需数据
						}
					}
				}
				response.setHeader("content-type", "application/json;charset=UTF-8");//告诉浏览器他发送的什么类型
				PrintWriter out = response.getWriter();
				JSONObject json = new JSONObject(rData);
				out.print(json);
			}
			else if (type.equals("累计死亡")) 
			{
				for (int i = 0; i<provinces.size();i++) {
					JSONObject data = provinces.getJSONObject(i);
					String provinceName=data.getString("name");
					if (provinceName.equals(province)) {
						JSONArray timeStatistic =data.getJSONArray("series");//省份里面每日数据
						for (int j = 0; j <timeStatistic.size(); j++) 
						{
							JSONObject dateData=timeStatistic.getJSONObject(j);
							rData.put(dateData.getString("date"), dateData.getString("deathsNum"));	//存取折线图所需数据
						}
					}
				}
				response.setHeader("content-type", "application/json;charset=UTF-8");//告诉浏览器他发送的什么类型
				PrintWriter out = response.getWriter();
				JSONObject json = new JSONObject(rData);
				out.print(json);
			}
		
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
