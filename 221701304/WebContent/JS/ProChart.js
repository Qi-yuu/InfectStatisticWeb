
 var tag=document.getElementById('key1')
 var content=tag.innerText;
 var option={
       	title: {
       		text: content+'省 累计确诊趋势'
       	},
       	tooltip: {
       	},
       	legend: {
       		data:['累计确诊']
       	},
       	xAxis: {
       		data : [] //可以采用动态时间
       	},
       	yAxis: {
       		type: 'value'
       	},
       	color:[
       		'#df2d25'
       		],
       		series: [

       			{
       				name:'新增确诊',
       				type:'line',
       				data:[]
       			}
       			]
		};

	 var myChart = echarts.init(document.getElementById('Pro'));
	 myChart.setOption(option);
var date=[];    //类别数组（实际用来盛放X轴坐标值）
var nums=[];    //销量数组（实际用来盛放Y坐标值）

$.ajax({
		type:'POST', 
		async:false,
		data:{"name":content,"type":"累计确诊"},
		url:'provinceStatisticServlet', // 请求的url地址
		dataType:'json', //预期的服务器响应的数据类型 
		success: function(result){ // 当请求成功时运行的函数
		var jsonStr=JSON.stringify(result);
		var jsonObj = JSON.parse(jsonStr);
		for(var p in jsonObj)
		{//遍历json对象
			date.push(p);
			nums.push(jsonObj[p]);
		}
		myChart.setOption({        //加载数据图表
         xAxis: {
             data: date
         },
         series: [{
             // 根据名字对应到相应的系列
             name: '日期',
             data: nums
         }]
     });
		},
		error:function(result){ //失败的函数
			alert("请求数据失败");
		},
	});
 //累计确诊按钮实现
 function changeColor1(){
	 var option={
	          	title: {
	          		text: content+'省 累计确诊趋势'
	          	},
	          	tooltip: {
	          	},
	          	legend: {
	          		data:['新增确诊']
	          	},
	          	xAxis: {
	          		data : [] //可以采用动态时间
	          	},
	          	yAxis: {
	          		type: 'value'
	          	},
	          	color:[
	          		'#df2d25'
	          		],
	          		series: [

	          			{
	          				name:'累计确诊',
	          				type:'line',
	          				data:[]
	          			}
	          			]
	 		};
	 
	 	 var myChart = echarts.init(document.getElementById('Pro'));
	 	 myChart.setOption(option);
	 var date=[];    //类别数组（实际用来盛放X轴坐标值）
	 var nums=[];    //销量数组（实际用来盛放Y坐标值）

	 $.ajax({
			type:'POST', 
			async:false,
			data:{"name":content,"type":"累计确诊"},
			url:'provinceStatisticServlet', // 请求的url地址
			dataType:'json', //预期的服务器响应的数据类型 
			success: function(result){ // 当请求成功时运行的函数
			var jsonStr=JSON.stringify(result);
			var jsonObj = JSON.parse(jsonStr);
			for(var p in jsonObj)
			{//遍历json对象
				date.push(p);
				nums.push(jsonObj[p]);
			}
			myChart.setOption({        //加载数据图表
	            xAxis: {
	                data: date
	            },
	            series: [{
	                // 根据名字对应到相应的系列
	                name: '日期',
	                data: nums
	            }]
	        });
			},
			error:function(result){ //失败的函数
				alert("请求数据失败");
			},
		});
     
 }
 
//累计治愈按钮实现
 function changeColor2(){
	 var option={
	          	title: {
	          		text: content+'省 累计治愈趋势'
	          	},
	          	tooltip: {
	          	},
	          	legend: {
	          		data:['新增治愈']
	          	},
	          	xAxis: {
	          		data : [] //可以采用动态时间
	          	},
	          	yAxis: {
	          		type: 'value'
	          	},
	          	color:[
	          		'#00bfbf'
	          		],
	          		series: [

	          			{
	          				name:'累计治愈',
	          				type:'line',
	          				data:[]
	          			}
	          			]
	 		};
	 
	 	 var myChart = echarts.init(document.getElementById('Pro'));
	 	 myChart.setOption(option);
	 var date=[];    //类别数组（实际用来盛放X轴坐标值）
	 var nums=[];    //销量数组（实际用来盛放Y坐标值）

	 $.ajax({
			type:'POST', 
			async:false,
			data:{"name":content,"type":"累计治愈"},
			url:'provinceStatisticServlet', // 请求的url地址
			dataType:'json', //预期的服务器响应的数据类型 
			success: function(result){ // 当请求成功时运行的函数
			var jsonStr=JSON.stringify(result);
			var jsonObj = JSON.parse(jsonStr);
			for(var p in jsonObj)
			{//遍历json对象
				date.push(p);
				nums.push(jsonObj[p]);
			}
			myChart.setOption({        //加载数据图表
	            xAxis: {
	                data: date
	            },
	            series: [{
	                // 根据名字对应到相应的系列
	                name: '日期',
	                data: nums
	            }]
	        });
			},
			error:function(result){ //失败的函数
				alert("请求数据失败");
			},
		});
     
 }
//累计死亡按钮实现
 function changeColor3(){
	 var option={
	          	title: {
	          		text: content+'省 累计死亡趋势'
	          	},
	          	tooltip: {
	          	},
	          	legend: {
	          		data:['新增死亡']
	          	},
	          	xAxis: {
	          		data : [] //可以采用动态时间
	          	},
	          	yAxis: {
	          		type: 'value'
	          	},
	          	color:[
	          		'#333333'
	          		],
	          		series: [

	          			{
	          				name:'累计死亡',
	          				type:'line',
	          				data:[]
	          			}
	          			]
	 		};
	 
	 	 var myChart = echarts.init(document.getElementById('Pro'));
	 	 myChart.setOption(option);
	 var date=[];    //类别数组（实际用来盛放X轴坐标值）
	 var nums=[];    //销量数组（实际用来盛放Y坐标值）

	 $.ajax({
			type:'POST', 
			async:false,
			data:{"name":content,"type":"累计死亡"},
			url:'provinceStatisticServlet', // 请求的url地址
			dataType:'json', //预期的服务器响应的数据类型 
			success: function(result){ // 当请求成功时运行的函数
			var jsonStr=JSON.stringify(result);
			var jsonObj = JSON.parse(jsonStr);
			for(var p in jsonObj)
			{//遍历json对象
				date.push(p);
				nums.push(jsonObj[p]);
			}
			myChart.setOption({        //加载数据图表
	            xAxis: {
	                data: date
	            },
	            series: [{
	                // 根据名字对应到相应的系列
	                name: '日期',
	                data: nums
	            }]
	        });
			},
			error:function(result){ //失败的函数
				alert("请求数据失败");
			},
		});
     
 }
 
 
 
 	
 
 
 



 
 
 