<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--具体省份折线图-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="CSS/Head.css">
    <link rel="stylesheet" href="CSS/ProvinceChart.css">
    <title>InfectStatisticWeb</title>
    <script type="text/javascript" src="JS/echarts.min.js" ></script>
    <script type="text/javascript" src="JS/china.js" ></script>
    <script  src="JS/jquery-3.4.1.js"></script>
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

        <!--省份图表 面板-->
        <div id="Lab5" class="Lab">

            <!--省份疫情数据显示 面板 -->

<!--
省份名称 数据截至日期需要修改
-->
            <!--获得省份名称-->
            <h3 id='key1'><%=request.getAttribute("province") %></h3>
            <span >&nbsp;&nbsp;数据截止至:<%=session.getAttribute("date")%></span>
            <input type="button" id="ReturnButton" value="全国数据" onClick="location.href='InfectStatistic.jsp'"/>
            <!--获得该省份具体数据-->
<!--
疑似等人数需要修改
-->
            <div id="DateLab">
                <div class="Type">
                    </br>
                    <p>现有确诊</p>
                    <p style="color:#f7c325;"><%=session.getAttribute("省现有确诊")%></p>
                    <span>昨日:</span><span style="color:#f7c325;"><%=session.getAttribute("省现有确诊增加")%></span>
                </div>
                <div class="Type">
                    </br>
                    <p>累计确诊</p>
                    <p style="color: #df2d25"><%=session.getAttribute("省累计确诊")%></p>
                    <span>昨日:</span><span style="color: #df2d25"><%=session.getAttribute("省累计确诊增加")%></span>
                </div>
                <div class="Type">
                    </br>
                    <p>累计治愈</p>
                    <p style="color:#00bfbf"><%=session.getAttribute("省累计治愈")%></p>
                    <span>昨日:</span><span style="color:#00bfbf"><%=session.getAttribute("省累计治愈增加")%></span>
                </div>
                <div class="Type">
                    </br>
                    <p>累计死亡</p>
                    <p style="color:#333333"><%=session.getAttribute("省累计死亡")%></p>
                    <span>昨日:</span><span style="color:#333333"><%=session.getAttribute("省累计死亡增加")%></span>
                </div>                
            </div>
        </br></br></br>
            <!--省份图表 面板 -->
            <div id="ProLab">
                <div id="Pro"></div>
                <script type="text/javascript" src="JS/ProChart.js"></script>  
                <div>
                    <input type="button" id="ipButton" class="Button" value="累计确诊" onClick="changeColor1()"/>
                    <input type="button" id="cureButton" class="Button" value=" 累计治愈" onClick="changeColor2()"/>
                    <input type="button" id="deadButton" class="Button" value="累计死亡" onClick="changeColor3()"/>
                </div>   
            </div>
        </div>    
    
    </div>

</body>
</html>