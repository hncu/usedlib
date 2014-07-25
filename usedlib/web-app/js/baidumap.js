// 百度地图API功能
var map = new BMap.Map("allmap");                        // 创建Map实例
map.centerAndZoom();     // 初始化地图,设置中心点坐标和地图级别
map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
map.enableScrollWheelZoom(true);                            //启用滚轮放大缩小
map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
//map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的

//map.addEventListener("click", showInfo);
var point = new BMap.Point(112.355145,28.559382);
make_overlay(point);
map.addEventListener("dragend", function showInfo(){
    var pointer = map.getCenter();
    marker.setPosition(pointer);
    $("#gpsLongitude").val(pointer.lng);
    $("#gpsLatitude").val(pointer.lat);
});
function mycitySet(result){
    point = new BMap.Point(result.center.lng,result.center.lat);
    make_overlay(point);
}
function make_overlay(point) {
    map.centerAndZoom(point, 12);
    marker = new BMap.Marker(point);
    map.addOverlay(marker);              // 将标注添加到地图中
    marker.enableDragging();    //可拖拽
    var label = new BMap.Label("拖拽到你经常活动地区<br>点击右侧保存",{offset:new BMap.Size(20,-10)});
    marker.setLabel(label);
    marker.addEventListener("dragend", function set_lbs(e){
        $("#gpsLongitude").val(e.point.lng);
         $("#gpsLatitudet").val(e.point.lat);
    }); 
}
// 百度地图API功能
	/*map = new BMap.Map("l-map");
var point = new BMap.Point(112.355145,28.559382);
make_overlay(point);
map.addEventListener("dragend", function showInfo(){
    var pointer = map.getCenter();
    marker.setPosition(pointer);
    $("#lng").val(pointer.lng);
    $("#lat").val(pointer.lat);
});
function mycitySet(result){
    point = new BMap.Point(result.center.lng,result.center.lat);
    make_overlay(point);
}
function make_overlay(point) {
    map.centerAndZoom(point, 12);
    marker = new BMap.Marker(point);
    map.addOverlay(marker);              // 将标注添加到地图中
    marker.enableDragging();    //可拖拽
    var label = new BMap.Label("拖拽到你经常活动地区<br>点击右侧保存",{offset:new BMap.Size(20,-10)});
    marker.setLabel(label);
    marker.addEventListener("dragend", function set_lbs(e){
        $("#lng").val(e.point.lng);
         $("#lat").val(e.point.lat);
    }); 
}
function save_lbs() {
    var lng = $("#lng").val();
    var lat = $("#lat").val();
    $.ajax({
        type: "get",
        url: "http://www.ycpai.com/home/map_set/"+lng+'/'+lat,
        dataType:"json",
        success: function(msg){
             if (msg ==1) {
                 window.location.href='http://www.ycpai.com/home/edit_profile/3';
             }
        }
     });
}
*/