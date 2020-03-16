

//疫情地图获取数据
var mydata =[];
$.ajax({
	type:'POST', 
	async:false,
	data:{"name":"全国"},
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
		var tag=document.getElementById('datedata')
		var content=tag.innerText;
        var myChart = echarts.init(document.getElementById('Map'));
        myChart.on('click', function (params) {
       	window.location.href="provinceServlet?province="+params.name+"&date="+content;
        });
        //使用制定的配置项和数据显示图表
        myChart.setOption(optionMap);
        


