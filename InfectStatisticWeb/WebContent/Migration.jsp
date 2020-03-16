<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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



<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/InfectStatistic?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root123"/>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from cities;
</sql:query>
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
            <table border="0" width="100%">
			<tr>
   			<td>排名</td>
   			<td>城市名称</td>
   			<td>迁入率</td>
			</tr>
			<c:forEach var="row" items="${result.rows}">
			<tr>
   			<td><font color="#FE2E2E"><c:out value="${row.id}"/></font></td>
   			<td><c:out value="${row.name}"/></td>
   			<td><c:out value="${row.number}"/></td>
			</tr>
			</c:forEach>
			</table>
            </div>
            </br></br>
            <h3 style="padding-top:5px;text-align:center">热门迁出地</h3>
            <div id="Out">
            <table border="0" width="100%">
			<tr>
   			<td>排名</td>
   			<td>城市名称</td>
   			<td>迁入率</td>
			</tr>
			<c:forEach var="row" items="${result.rows}">
			<tr>
   			<td><font color="#FE2E2E"><c:out value="${row.id}"/></font></td>
   			<td><c:out value="${row.name}"/></td>
   			<td><c:out value="${row.number}"/></td>
			</tr>
			</c:forEach>
			</table>
          
             </div>
        </div>
     
    </div>
</div>
</body>
</html>