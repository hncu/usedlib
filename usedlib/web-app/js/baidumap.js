// �ٶȵ�ͼAPI����
var map = new BMap.Map("allmap");                        // ����Mapʵ��
map.centerAndZoom();     // ��ʼ����ͼ,�������ĵ�����͵�ͼ����
map.addControl(new BMap.NavigationControl());               // ���ƽ�����ſؼ�
map.addControl(new BMap.ScaleControl());                    // ��ӱ����߿ؼ�
map.addControl(new BMap.OverviewMapControl());              //������Ե�ͼ�ؼ�
map.enableScrollWheelZoom(true);                            //���ù��ַŴ���С
map.addControl(new BMap.MapTypeControl());          //��ӵ�ͼ���Ϳؼ�
//map.setCurrentCity("����");          // ���õ�ͼ��ʾ�ĳ��� �����Ǳ������õ�

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
    map.addOverlay(marker);              // ����ע��ӵ���ͼ��
    marker.enableDragging();    //����ק
    var label = new BMap.Label("��ק���㾭�������<br>����Ҳౣ��",{offset:new BMap.Size(20,-10)});
    marker.setLabel(label);
    marker.addEventListener("dragend", function set_lbs(e){
        $("#gpsLongitude").val(e.point.lng);
         $("#gpsLatitudet").val(e.point.lat);
    }); 
}
// �ٶȵ�ͼAPI����
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
    map.addOverlay(marker);              // ����ע��ӵ���ͼ��
    marker.enableDragging();    //����ק
    var label = new BMap.Label("��ק���㾭�������<br>����Ҳౣ��",{offset:new BMap.Size(20,-10)});
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