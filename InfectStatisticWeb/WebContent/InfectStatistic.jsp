<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/Head.css">
<link rel="stylesheet" href="CSS/InfectStatistic.css">
<title>疫情统计地图</title>
<script type="text/javascript" src="JS/echarts.min.js" ></script>
<script type="text/javascript" src="JS/china.js" ></script>
<script  src="JS/jquery-3.4.1.js"></script>
<script type="text/javascript" src="JS/Map.js"></script> 
</head>
<body>
	<div id="Title1" >
		<p>疫情实时大数据报告</p>
 	</div>
 	<div id="Title2">
    	<p>新型冠状病毒肺炎</p> 
 	</div> 
 	<div id="Label">
 		<!--导航栏-->
 		<div id="Navigation">
 			<div id="Nav1" class="Nav"><a href="InfectStatistic.jsp">疫情动态</a></div>
 			<div id="Nav2" class="Nav"><a href="Migration.jsp">迁徙地图</a></div>
 			<div id="Nav3" class="Nav"><a href="HotTopic.jsp">全民热搜</a></div>
 			<div id="Nav4" class="Nav"><a href="RealTimeNews.jsp">实时播报</a></div>
    	</div>
    	<!--疫情动态 面板-->
    	<div id="Lab1" class="Lab">
    		<!--中国疫情数据显示 面板 -->
    		<form action="dateServlet" method="get">
    			<p>&nbsp;&nbsp;输入查询日期：
    	 		<input type="text" name="Find" maxlength="18" />
    	 		<input type="submit" value="查找"/> 
    			</p>
    			<span >&nbsp;&nbsp;数据截止至:<span id='datedata'><%=session.getAttribute("date")%></span></span>
			</form>
			<div id="DateLab">
 				<div>
            		<div class="Type">
            		</br>
                        <p>现有疑似</p>
                        <p style="color:#f7c325;">
                        <%=session.getAttribute("现有疑似")%>
                        </p>
                        <span>昨日:</span><span style="color:#f7c325;"><%=session.getAttribute("现有疑似增加")%></span>
        			</div>
            		<div class="Type">
                        <p>累计确诊</p>
                        <p style="color: #df2d25">
                        <%=session.getAttribute("累计确诊")%>
                        </p>
                        <span>昨日:</span><span style="color: #df2d25"><%=session.getAttribute("累计确诊增加")%></span>
              	 	</div>
          		</div>
          		<div>
              		<div class="Type">
               		</br>
                        <p>累计治愈</p>
                        <p style="color:#00bfbf">
                        <%=session.getAttribute("累计治愈")%>
                        </p>
                        <span>昨日:</span><span style="color:#00bfbf"><%=session.getAttribute("累计治愈增加")%></span>
                	</div>
                	<div class="Type">
                        <p>累计死亡</p>
                        <p style="color:#333333">
                        <%=session.getAttribute("累计死亡")%>
                        </p>
                        <span>昨日:</span><span style="color:#333333"><%=session.getAttribute("累计死亡增加")%></span>
                	</div>
         		</div>
     		</div>
     		<!--中国疫情地图显示 面板 -->
        	<div id="MapLab">
          		<h3 style="padding-top:5px;">全国累计确诊人数</h3>
           		<div id="Map"></div>
           	<script type="text/javascript" src="JS/Map.js"></script> 	
       		</div>  
  		</div>  
 	</div>
</body>
</html>
