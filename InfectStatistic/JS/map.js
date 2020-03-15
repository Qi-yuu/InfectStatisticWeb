/*
 Map用于获取全国地图及各省份感染人数
 */

var mydata = [  
    {name: '北京',value: '157' },{name: '天津',value: '36'},  
    {name: '上海',value: '58' },{name: '重庆',value: '186'},  
    {name: '河北',value: '37' },{name: '河南',value: '185' },  
    {name: '云南',value: '22' },{name: '辽宁',value: '23' },  
    {name: '黑龙江',value:'197'  },{name: '湖南',value: '209' },  
    {name: '安徽',value:'197'  },{name: '山东',value: '363'},  
    {name: '新疆',value: '31'},{name: '江苏',value: '133' },  
    {name: '浙江',value: '273' },{name: '江西',value: '179'},  
    {name: '湖北',value: '39599' },{name: '广西',value: '88' },  
    {name: '甘肃',value: '8' },{name: '山西',value: '27'},  
    {name: '内蒙古',value: '33' },{name: '陕西',value: '49' },  
    {name: '吉林',value: '25' },{name: '福建',value: '67' },  
    {name: '贵州',value: '32' },{name: '广东',value: '444' },  
    {name: '青海',value: '0' },{name: '西藏',value: '0' },  
    {name: '四川',value: '210' },{name: '宁夏',value: '4' },  
    {name: '海南',value: '32' },{name: '台湾',value: '26' },  
    {name: '香港',value: '64' },{name: '澳门',value: '10' }  
]; 
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

//使用制定的配置项和数据显示图表
myChart.setOption(optionMap);