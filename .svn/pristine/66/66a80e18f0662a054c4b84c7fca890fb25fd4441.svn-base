/**
 * User: Naeyoung Kim
 * Date: 2018-11-11
 */
var Gnb = (function () {
	var _gnbTemplate = 	'<div class="con_center">' +
							'<div class="top_quick">' +
								/*'<p><img src="/images/monitor.png" alt="상황판"> <span class="monitor">상황판</span></p>' +
					    		'<a class="btn btn_navy2 btn_top" href="http://221.142.6.134:11104/visualbox/dash/html/layout_01.html" target="_blank">1페이지</a>' +
					    		'<a class="btn btn_navy2 btn_top" href="http://221.142.6.134:11104/visualbox/dash/html/layout_02.html" target="_blank">2페이지</a>' +
					    		'<a class="btn btn_navy2 btn_top" href="http://221.142.6.134:11104/visualbox/dash/html/layout_03.html" target="_blank">3페이지</a>' +
								'<p class="partition"></p>' +*/
								'<p><span class="name">{=userName}</span> 회원님 환영합니다.<img src="/images/clock_wh.png" alt="세션만료시간" class="clock" /><span class="time">60:00</span></p>' +
								'<a class="btn btn_navy2 btn_top" href="javascript:linkURL(\'/logout\')">로그아웃</a>' +
								'<a class="btn btn_navy2 btn_top" href="javascript:linkURL(\'/login/myNotice\')">내 정보 관리</a>' +
							'</div>' +
						'</div>' +
						'<div class="con_center">' +
							'<div class="logo">' +
								'<a href="javascript:linkURL(\'/\')"><img src="/images/logo.png" alt="자동차 운행제한 시스템"></a>' +
							'</div>' + 
							'<ul id="navi">{=menuList}</ul>' +
						'</div>';
	var _menuList = [
		{
			key : 'realTimeVehicle',
			name : '실시간 차량정보',
			url : '/realTimeVehicle/search'
		},
		{
			key : 'disclosure',
			name : '운행제한차량',
			url : /*'/disclosure/target'*/ '/disclosure/lezTarget'
		},
		{
			key : 'execution',
			name : '행정처리',
			url : '/execution/administList'
		},
		{
			key : 'statistics',
			name : '현황 및 통계',
			url : '/statistics/siteMonth'
		},
		{
			key : 'regulatemanage',
			name : '단속정보관리',
			url : '/regulateManage/infoManage'
		},
		{
			key : 'cameramanage',
			name : '카메라관리',
			url : '/cameraManage/status'
		},
		{
			key : 'system',
			name : '시스템관리',
			url : '/system/interfaceList'
		}
	];

	function _makeMenu(key) {
		var menu = '';
		for (var index in _menuList) {
			if(_menuList[index].key == key) {
				menu += '<a href="javascript:linkURL(\'' + _menuList[index].url + '\')"><li class="on">' + _menuList[index].name + '</li></a>';
			} else {
				menu += '<li><a href="javascript:linkURL(\'' + _menuList[index].url + '\')">' + _menuList[index].name + '</a></li>';
			}
		}
		return menu;
	}

	function _drawGnb(selector, key) {
		selector.html(Util.processTpl(_gnbTemplate, {
			menuList : _makeMenu(key),
			userName : decodeURIComponent(Util.getUserName()),
			loginTime : decodeURIComponent(Util.getLoginTime()).replace(/\+/g, ' ')
		}));
		
		_countDownTimer();
	}
	
	var _countDownTimer = function() {
		var _vDate = new Date(Date.parse(new Date()) + 1000 * 60 * 60);
//		var _vDate = new Date();
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _timer;
		
		function showTimer() {
			var now = new Date();
			var distDt = _vDate - now;
			
			if(distDt <= 0) {
				clearInterval(_timer);
				$(".time").html('00:00');
				$(".time").css('color', 'red');
				return;
			}
			
			var minutes = Math.floor((distDt % _hour) / _minute);
			var seconds = Math.floor((distDt % _minute) / _second);
			
			if(minutes < 10) minutes = '0' + minutes;
			if(seconds < 10) seconds = '0' + seconds;
			
			$(".time").html(minutes + ':' + seconds);
		}
		
		_timer = setInterval(showTimer, 1000);
	};

	return {
		draw: _drawGnb
	};
})();