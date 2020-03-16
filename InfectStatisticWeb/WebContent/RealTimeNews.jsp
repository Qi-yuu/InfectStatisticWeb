<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--实时播报-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="CSS/Head.css">
    <link rel="stylesheet" href="CSS/RealTimeNews.css">
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
    
         <!--导航栏-->
        <div id="Navigation">
            <div id="Nav1" class="Nav"><p><a href="InfectStatistic.jsp">疫情动态</a></p></div>
            <div id="Nav2" class="Nav"><p><a href="Migration.jsp">迁徙地图</a></p></div>
            <div id="Nav3" class="Nav"><p><a href="HotTopic.jsp">全民热搜</a></p></div>
            <div id="Nav4" class="Nav"><p><a href="RealTimeNews.jsp">实时播报</a></p></div>
        </div>

        <!--实时播报 面板-->
        <div id="Lab4" class="Lab">
            </br>
            <div><h3 style="text-align:center";>实时播报</h3></div>
            </br></br>
            <ul>
                <li ><a href="http://baijiahao.baidu.com/s?id=1661151176622036990">沙特宣布停飞所有国际航班，已推迟两场区域领导人峰会</a></li>
                </br>
                <li ><a href="http://baijiahao.baidu.com/s?id=1661148414683026007">快讯！印尼媒体：印尼运输部长新冠病毒检测呈阳性</a></li>
                </br>
                <li ><a href="http://baijiahao.baidu.com/s?id=1661147187981007423">意卫生部副部长和教育部副部长新冠病毒检测均呈阳性</a></li>
                </br>
                <li ><a href="http://baijiahao.baidu.com/s?id=1661141511730546688">参考快讯：据路透社统计，全球新冠肺炎死亡病例超5400例</a></li>
                </br>
                <li ><a href="http://baijiahao.baidu.com/s?id=1661128416118688719">湖北：低风险街道乡镇的社区村组全部解除封闭管理</a></li>
                </br>
            </ul>
        </div>
     
    </div>
</div>
</body>
</html>