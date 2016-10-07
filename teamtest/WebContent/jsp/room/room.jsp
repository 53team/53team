<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-1.7.1.js"></script>
<script src="https://cdn.socket.io/socket.io-1.4.5.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=services"></script>
<style>
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:700px;height:350px;}
	#menu_wrap {position:absolute; top:0px; left:-150px; bottom:0; width:250px; margin:0; padding:5px; overflow-y:auto; background:rgba(255, 255, 255, 0.7); z-index: 1; font-size:12px; border-radius:10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<br>
<div id="box">
<br>
	<div align="center">
		<font size="5"><b>StudyRoom - ${ title }</b></font>
		<hr>
	</div><!-- center div끝 -->
	<div style=" position: relative;">
		<div class="col-md-6" align="left" style="width:435px;">
			<table width="500px">
				<tr>
					<td align="right"><b>번　호 : </b>&nbsp;&nbsp;</td>
					<td>${ num }</td>    
				</tr>
				<tr>
					<td align="right"><b>인　원 : </b>&nbsp;&nbsp;</td>
					<td>${ count } / ${ limit }</td>
				</tr>
				<tr>
					<td align="right"><b>개설자 : </b>&nbsp;&nbsp;</td>
					<td>${ id }</td>
				</tr>
				<tr>
					<td align="right"><b>개설일 : </b>&nbsp;&nbsp;</td>
					<td>${ reg_date }</td>
				</tr>
				<tr>
					<td align="right"><b>지　역 : </b>&nbsp;&nbsp;</td>
					<td>${ location }</td>
				</tr>
				<tr>
					<td align="right"><b>내　용 : </b>&nbsp;&nbsp;</td>
					<td>${ content }</td>
				</tr>
			</table>
		</div><!-- col-md-6 div끝 -->
		<div class="col-md-6" style="width:300px; position:absolute; bottom:0; right: 20px;">
			<div id="chat" align="left">
				<div style="width: 288px; height:451px; border:solid 2px; overflow:auto" id="txtarea">
					<dl id="txtappend"></dl>
				</div>
				<div class="input-group custom-search-form" style="margin-top:10px;">
					<input type="text" class="form-control" style="width:234px;" id="txt" onkeydown="enterClick();">
					<span class="input-group-btn">
						<input class="btn btn-default" type="button" name="btn" id="btn" value="send">
					</span>
				</div>
			</div>
		</div><!-- col-md-6 div끝 -->
<!-- 인원 출력 -->
		<div style="width: 170px; height:121px; border:solid 1px; overflow:auto; margin-right: 500px;" id="ids" >
			<dl>
				<p>가입자 목록<br>
				<c:forTokens var="ids" items="${ ids }" delims=",">
					<c:out value="${ids }" />
					<br>
				</c:forTokens>
			</dl>
		</div>
		<br>
<!-- 맵 영역 -->
		<div class="map_wrap" align="center">
		    <div id="map" style="width:100%; height:100%; position:relative; overflow:hidden; margin-left:-300px;"></div>
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                    <input type="hidden" value="${location} 북카페" id="keyword" size="15"> 
		                    <!-- <button type="submit">검색하기</button> --> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
	</div>
	<br>
	<c:if test="${sid == id || sid == 'admin'}">
		<input type="button" value="방삭제" class="btn btn-default btn-sm" onclick="document.location.href='roomdelete.do?num=${num}'">
	</c:if>
	<c:if test="${count < limit && sid != id}">
		<input type = "button" value="가입" class="btn btn-default btn-sm" onclick="document.location.href='room.do?sid2=${sid}&num=${num}'">
	</c:if>
		<input type = "button" value="목록" class="btn btn-default btn-sm" onclick="document.location.href='roomList.do'"> 
<br><br>
</div>
<br>
<script>
    //엔터키에 메세지전송 자바스크립트
   function enterClick(){
      if(event.keyCode==13&&$('#txt').val()!=''){
         btn.click();
         $('#txt').val('');
      }
   }

    $(document).ready(function(){
       var socket = io.connect('http://192.168.0.29:52273/');
       
          var userid = '${ sid }';
          var roomname = '${ num }';
          socket.emit('join', {'userid': userid , 'roomname': roomname});
       
       //접속자 알림
       socket.on('join', function(data){
          //alert(data + '로 접속하셨습니다');
          /* $('#txtappend').append('<dd style="margin:0px;">' + data + '님이 접속 하셨습니다.</dd>'); */
       });
       
       //메시지 전송
       $('#btn').click(function(){
          var message = userid + ' : ' + $('#txt').val();
          socket.emit('message', message);
       });
       
       socket.on('message', function(data){
          $('#txtappend').append('<dd style="margin:0px">'+ data + '</dd>');
          $("#txtarea").scrollTop($("#txtarea")[0].scrollHeight);
       });
    });
</script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</body>
</html>