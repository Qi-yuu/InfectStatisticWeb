<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--全民热搜-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="CSS/Head.css">
    <link rel="stylesheet" href="CSS/HotTopic.css">
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

        <!--全民热搜 面板-->
        <div id="Lab3" class="Lab">
            </br>
            <div><h3 style="text-align:center";>全民热搜</h3></div>
            </br></br>

<!--
以下链接需要修改数据
-->
            <ul>
                <li ><a href="https://home.firefoxchina.cn/">新型肺炎实时动态</a></li>
                </br>
                <li ><a href="https://home.firefoxchina.cn/">2020年世界体育大会取消</a></li>
                </br>
                <li ><a href="https://home.firefoxchina.cn/">罗马上空响起义勇军进行曲</a></li>
                </br>
                <li ><a href="https://home.firefoxchina.cn/">央视播出重症病例救治纪实</a></li>
                </br>
                <li ><a href="https://home.firefoxchina.cn/">伊朗女副总统康复</a></li>
                </br>
                <li ><a href="https://home.firefoxchina.cn/">意大利阳台演唱会</a></li>
            </ul>
                
        </div>
        
    </div>
</div>
</body>
</html>