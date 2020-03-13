 /*
 ChinaChart用于获取全国 新增、感染、治愈、死亡人数统计表
 */
 
 // 基于准备好的dom，初始化echarts实例
 var myChart = echarts.init(document.getElementById('China'));
 // 指定图表的配置项和数据
 myChart.setOption({
          title: {
text: '全国 疫情趋势图'
},
tooltip: {
trigger: 'axis'
},
legend: {
data:['新增确诊']
},
xAxis: {
type: 'category',
boundaryGap: false,
data : ["xx月xx日","xx月xx日","xx月xx日","xx月xx日","xx月xx日"] //可以采用动态时间
},
yAxis: {
type: 'value'
},
color:[
      '#DF0101'
      ],
series: [

{
name:'新增确诊',
type:'line',
stack: '总量',
data:["1","2","3","4","5"]
}
]
 });
 // 异步加载数据
/*  $.get('data.json').done(function (data) {
      // 填入数据
      myChart.setOption({ xAxis: { data: data.categories }, series: [{
           // 根据名字对应到相应的系列
           name: '销量',
           data: data.data
      }]
      });});*/