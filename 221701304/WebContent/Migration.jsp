<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--迁入迁出-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="CSS/Head.css">
    <link rel="stylesheet" href="CSS/Migration.css">
    <title>InfectStatisticWeb</title>

</head>
<body>
<div>
    <div id="Title1" >
        <p><span>疫情实时大数据报告</span></p>
    </div>
    <div id="Title2">
        <p><span>新型冠状病毒肺炎</span></p>
    </div>    
    
    <!--动态面板，包含疫情动态、迁徙地图、全民热搜、实时播报-->
    <div id="Label">
    
         <!--导航栏 -->
         <div id="Navigation">
            <div id="Nav1" class="Nav"><p><a href="InfectStatistic.jsp">疫情动态</a></p></div>
            <div id="Nav2" class="Nav"><p><a href="Migration.jsp">迁徙地图</a></p></div>
            <div id="Nav3" class="Nav"><p><a href="HotTopic.jsp">全民热搜</a></p></div>
            <div id="Nav4" class="Nav"><p><a href="RealTimeNews.jsp">实时播报</a></p></div>
        </div>

        <div id="Lab2" class="Lab">
            </br>
            <h3 style="padding-top:5px;text-align:center">热门迁入地</h3>
            <div id="In">
            <p>广东</p>
            <p>陕西</p> 
            </div>
            </br></br>
            <h3 style="padding-top:5px;text-align:center">热门迁出地</h3>
            <div id="Out">
            <p>广东</p>
            <p>陕西</p> 
          
             </div>
        </div>
     
    </div>
</div>
</body>
</html>