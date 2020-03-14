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
 			<div id="Nav1" class="Nav"><a href="InfectStatistic.html">疫情动态</a></div>
 			<div id="Nav2" class="Nav"><a href="Migration.html">迁徙地图</a></div>
 			<div id="Nav3" class="Nav"><a href="HotTopic.html">全民热搜</a></div>
 			<div id="Nav4" class="Nav"><a href="RealTimeNews.html">实时播报</a></div>
    	</div>
    	<!--疫情动态 面板-->
    	<div id="Lab1" class="Lab">
    		<!--中国疫情数据显示 面板 -->
    		<form action="dateServlet" method="get">
    			<p>&nbsp;&nbsp;输入查询日期：
    	 		<input type="text" name="Find" maxlength="18" />
    	 		<input type="submit" value="查找"/> 
    			</p>
    			<%
    			if(request.getAttribute("date")==null)
    			{
    			
    				request.getRequestDispatcher("dateServlet").forward(request, response);
 
    			}
    			%>
    			<span >&nbsp;&nbsp;数据截止至:<%=request.getAttribute("date")%></span>
			</form>
			<div id="DateLab">
 				<div>
            		<div class="Type">
            		</br>
                        <p>现有疑似</p>
                        <p style="color:#f7c325;">
                        <%
                        if(request.getAttribute("现有疑似")==null)
                        {
                        	request.getRequestDispatcher("allStatisticServlet").forward(request, response);
                        }
                        %>
                        <%=request.getAttribute("现有疑似")%>
                        </p>
                        <span>昨日:</span><span style="color:#f7c325;"><%=request.getAttribute("现有疑似增加")%></span>
        			</div>
            		<div class="Type">
                        <p>累计确诊</p>
                        <p style="color: #df2d25">
                         <%
                        if(request.getAttribute("累计确诊")==null)
                        {
                        	request.getRequestDispatcher("allStatisticServlet").forward(request, response);
                        }
                        %>
                        <%=request.getAttribute("累计确诊")%>
                        </p>
                        <span>昨日:</span><span style="color: #df2d25"><%=request.getAttribute("累计确诊增加")%></span>
              	 	</div>
          		</div>
          		<div>
              		<div class="Type">
               		</br>
                        <p>累计治愈</p>
                        <p style="color:#00bfbf">
                         <%
                        if(request.getAttribute("累计治愈")==null)
                        {
                        	request.getRequestDispatcher("allStatisticServlet").forward(request, response);
                        }
                        %>
                        <%=request.getAttribute("累计治愈")%>
                        </p>
                        <span>昨日:</span><span style="color:#00bfbf"><%=request.getAttribute("累计治愈增加")%></span>
                	</div>
                	<div class="Type">
                        <p>累计死亡</p>
                        <p style="color:#333333">
                         <%
                        if(request.getAttribute("累计死亡")==null)
                        {
                        	request.getRequestDispatcher("allStatisticServlet").forward(request, response);
                        }
                        %>
                        <%=request.getAttribute("累计死亡")%>
                        </p>
                        <span>昨日:</span><span style="color:#333333"><%=request.getAttribute("累计死亡增加")%></span>
                	</div>
         		</div>
     		</div>
     		<!--中国疫情地图显示 面板 -->
        	<div id="MapLab">
          		<h3 style="padding-top:5px;">全国累计确诊人数</h3>
           		<div id="Map"></div>
       		</div>  
  		</div>  
 	</div>
</body>
</html>

<script type="text/javascript">



/*
//获取日期截止事件
$.ajax({
	type:'GET', 
	async:false,
	url:'dateServlet', // 请求的url地址
	dataType:'text', //预期的服务器响应的数据类型 
	success: function(result){ // 当请求成功时运行的函数
		document.getElementById("date").innerHTML = "<p>&nbsp;&nbsp;数据截止至"+result+"</p>";
	},
	error:function(result){ //失败的函数
		alert("请求数据失败");
	},
});

*/

//疫情人数获取数据


//疫情地图获取数据
var mydata =[];
$.ajax({
	type:'GET', 
	async:false,
	url:'provinceStatisticServlet', // 请求的url地址
	dataType:'json', //预期的服务器响应的数据类型 
	success: function(result){ // 当请求成功时运行的函数
	var jsonStr=JSON.stringify(result);
	var jsonObj = JSON.parse(jsonStr);
	for(var p in jsonObj){//遍历json对象
		var data={};
		data.name=p;
		data.value=jsonObj[p];
		mydata.push(data);
}
	},
	error:function(result){ //失败的函数
		alert("请求数据失败");
	},
});

var optionMap = {  
                backgroundColor: '#FFFFFF',   
                tooltip : {  
                    trigger: 'item'
                },  
                //左侧小导航图标
                visualMap: {  
                    show : true,  
                    x: 'left',  
                    y: 'bottom',  
                    splitList: [   
                        {start: 10000},{start: 1000, end: 9999},  
                        {start: 100, end: 999},{start: 10, end: 99},  
                        {start: 1, end: 9},{start: 0, end: 0},  
                    ],  
                    color: ['#3B0B0B', '#B43104', '#DF0101','#FE642E', '#F79F81', '#FFFFFF']  
                }, 
                geo:
                {
                    roam:false,
                },
                
                //配置属性
                series: [{  
                    name: '数据',  
                    type: 'map',  
                    mapType: 'china',   
                    roam: false,  
                    label: {  
                        normal: {  
                            show: true  //省份名称  
                        },  
                        emphasis: {  
                            show: false  
                        }  
                    },  
                    data:mydata  //数据
                }]  
            };  
        //初始化echarts实例
        var myChart = echarts.init(document.getElementById('Map'));
        myChart.on('click', function (params) {
        	
            alert(params.name+':'+params.value);
        });

        //使用制定的配置项和数据显示图表
        myChart.setOption(optionMap);
</script>


