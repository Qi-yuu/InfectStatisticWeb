package getdata;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map; 
public class test {
	public static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:49.0) Gecko/20100101 Firefox/49.0";
	public static String HOST = "i.snssdk.com";
	public static String REFERER = "https://i.snssdk.com/feoffline/hot_list/template/hot_list/forum_tab.html?activeWidget=1";

	public static void main(String[] args) throws IOException {
		//根URL
		String url = "https://i.snssdk.com/forum/home/v1/info/?activeWidget=1&forum_id=1656784762444839";
		String resultBody = Jsoup.connect(url).
				userAgent(USER_AGENT).header("Host", HOST).header("Referer", REFERER).execute().body();
		JSONObject jsonObject = JSON.parseObject(resultBody);//将json字符串转化为相应的对象
		String ncovStringList = jsonObject.getJSONObject("forum").getJSONObject("extra").getString("ncov_string_list");
		JSONObject ncovListObj = JSON.parseObject(ncovStringList);
		//取出每日的相关汇总数据,可以把这个数据存储到数据库中
		//[{confirmedNum: 9809, curesNum: 183, date: "2020-01-31", deathsNum: 213, suspectedNum: 15238}]
		JSONArray nationwides = ncovListObj.getJSONArray("nationwide");//在连续41天下面那里
		//取出当日数据
		JSONObject currentDateData = nationwides.getJSONObject(0);//nationwides是个数组 数组每个元素是个json对象 每个对象是一天的疫情情况
		//取出昨日数据
		JSONObject lastDayData = nationwides.getJSONObject(1);
		System.out.println(currentDateData);
		System.out.println(lastDayData);
		Map<String,Object> rData = new HashMap<String,Object>();
		//获取确诊人数
		rData.put("累计确诊",currentDateData.getIntValue("confirmedNum"));
		//获取疑似病例
		rData.put("现有疑似",currentDateData.getIntValue("suspectedNum"));
		//获取治愈人数
		rData.put("累计治愈",currentDateData.getIntValue("curesNum"));
		//获取死亡人数
		rData.put("累计死亡",currentDateData.getIntValue("deathsNum"));
		//获取确诊人数比上日
		rData.put("累计确诊增加",currentDateData.getIntValue("confirmedNum") - lastDayData.getIntValue("confirmedNum"));
		//获取疑似病例比上日
		rData.put("现有疑似增加",currentDateData.getIntValue("suspectedIncr") );
		//获取治愈人数比上日
		rData.put("累计治愈增加",currentDateData.getIntValue("curesNum") - lastDayData.getIntValue("curesNum") );
		//获取死亡人数比上日
		rData.put("累计死亡增加",currentDateData.getIntValue("deathsNum") - lastDayData.getIntValue("deathsNum"));
		System.out.println(JSON.toJSONString(rData));
	}
}
