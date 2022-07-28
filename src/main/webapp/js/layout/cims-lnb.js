/**
 * User: Naeyoung Kim
 * Date: 2018-11-11
 */
var Lnb = (function () {
	var _lnbTemplate = '<div class="left_top">\
							<img src="{=imageUrl}">\
							<p>{=menuName}</p>\
						</div>\
						<ul>{=menuList}</ul>';
	var _subMenuList = {
		'realTimeVehicle' : {
			imageUrl : '/images/icon_car.png',
			name : '실시간 차량정보',
			subMenuList : [
				{
					key : 'realTimeVehicle.search',
					subMenuName : '실시간 차량정보',
					url : '/realTimeVehicle/search'
				}
			]
		},
		'disclosure' : {
			imageUrl : '/images/icon_car.png',
			name : '운행제한차량',
			subMenuList : [/*
				{
					key : 'disclosure.target',
					subMenuName : '적발대상차량 검색',
					url : '/disclosure/target'
				},
				{
					key : 'disclosure.search',
					subMenuName : '적발차량 검색',
					url : '/disclosure/search'
				},*/
				{
					key : 'disclosure.lezTarget',
					subMenuName : '상시 적발대상차량',
					url : '/disclosure/lezTarget'
				},
				{
					key : 'disclosure.lezDisclosure',
					subMenuName : '상시 적발차량',
					url : '/disclosure/lezDisclosure'
				},
				{
					key : 'disclosure.highDensityTarget',
					subMenuName : '비상시 적발대상차량',
					url : '/disclosure/highDensityTarget'
				},
				{
					key : 'disclosure.highDensityDisclosure',
					subMenuName : '비상시 적발차량',
					url : '/disclosure/highDensityDisclosure'
				},
				{
					key : 'disclosure.seasonTarget',
					subMenuName : '계절제 적발대상차량',
					url : '/disclosure/seasonTarget'
				},
				{
					key : 'disclosure.seasonDisclosure',
					subMenuName : '계절제 적발차량',
					url : '/disclosure/seasonDisclosure'
				}
			]
		},
		'execution' : {
			imageUrl : '/images/icon_car.png',
			name : '행정처리',
			subMenuList : [
				{
					key : 'execution.administList',
					subMenuName : '행정처분 처리',
					url : '/execution/administList'
				},
				{
					key : 'execution.delayApplyList',
					subMenuName : '유예신청 관리',
					url : '/execution/delayApplyList'
				},
				{
					key : 'execution.AI',
					subMenuName : 'AI번호인식',
					url : '/execution/AI'
				}
			]
		},
		'regulatemanage' : {
			imageUrl : '/images/icon_car.png',
			name : '단속정보관리',
			subMenuList : [
				{
					key : 'regulatemanage.local',
					subMenuName : '지자체 정보 관리',
					url : '/regulateManage/infoManage'
				},
				{
					key : 'regulatemanage.site',
					subMenuName : '지점 조회',
					url : '/regulateManage/siteManage'
				},
				{
					key : 'regulatemanage.lane',
					subMenuName : '차선 조회',
					url : '/regulateManage/laneManage'
				},
				{
					key : 'regulatemanage.seasonNo',
					subMenuName : '단속기간 조회',
					url : '/regulateManage/seasonNoManage'
				},
				{
					key : 'regulatemanage.targetSite',
					subMenuName : '단속지점 조회',
					url : '/regulateManage/targetSiteManage'
				}
			]
		},
		'cameramanage' : {
			imageUrl : '/images/icon_car.png',
			name : '카메라관리',
			subMenuList : [
				{
					key : 'cameramanage.status',
					subMenuName : '카메라 상태 확인',
					url : '/cameraManage/status'
				},
				{
					key : 'cameramanage.camera',
					subMenuName : '카메라 관리',
					url : '/cameraManage/cameraManage'
				},
				{
					key : 'cameramanage.cameraMappingList',
					subMenuName : '차선 카메라 매핑',
					url : '/cameraManage/cameraMappingList'
				},
				{
					key : 'cameramanage.cameraControl',
					subMenuName : '카메라 제어',
					url : '/cameraManage/cameraControl'
				}
			]
		},
		'statistics' : {
			imageUrl : '/images/icon_car.png',
			name : '현황 및 통계',
			subMenuList : [
				{
					key : 'statistics.siteMonth',
					subMenuName : '지점별/월별 적발현황',
					url : '/statistics/siteMonth'
				},
				{
					key : 'statistics.day',
					subMenuName : '일자별 현황',
					url : '/statistics/day'
				},
				{
					key : 'statistics.month',
					subMenuName : '월별 현황',
					url : '/statistics/month'
				},
				{
					key : 'statistics.site',
					subMenuName : '지점별 적발현황',
					url : '/statistics/site'
				}
			]
		},
		'system' : {
			imageUrl : '/images/icon_car.png',
			name : '시스템관리',
			subMenuList : [
				{
					key : 'system.interface',
					subMenuName : 'CSV 연계 이력 조회',
					url : '/system/interfaceList'
				},
				{
					key : 'system.configuration',
					subMenuName : '환경 설정 조회',
					url : '/system/configurationList'
				},
				/*,
				{
					key : 'system.batch.program',
					subMenuName : '배치 프로그램 관리',
					url : '/system/batch/program'
				},
				{
					key : 'system.batch.log',
					subMenuName : '배치 로그 조회',
					url : '/system/batch/log'
				},
				{
					key : 'system.batch.connect',
					subMenuName : '배치 수작업 연계',
					url : '/system/batch/connect'
				}*/
				{
					key : 'system.notice',
					subMenuName : '공지사항 관리',
					url : '/system/notice'
				},
				{
					key : 'system.member',
					subMenuName : '회원정보 관리',
					url : '/system/member'
				}
				/*,
				{
					key : 'system.code',
					subMenuName : '공통 코드 관리',
					url : '/system/code'
				}
				*/
			]
		},
		'mypage' : {
			imageUrl : '/images/icon_car.png',
			name : 'My Page',
			subMenuList : [
				{
					key : 'mypage.notice',
					subMenuName : '공지사항 조회',
					url : '/login/myNotice'
				},
				{
					key : 'mypage.certification',
					subMenuName : '내 정보 관리',
					url : '/certificationForm'
				}
			]
		}
	};

	function _makeMenu(subMenuList, key) {
		var cookies = document.cookie.split('; ');
		var area = '';
		for(var index in cookies) {
			var cookie = cookies[index];
			var cookieKey = cookie.split('=')[0];
			var cookieValue = cookie.split('=')[1];
			
			if(cookieKey == 'CIMS_MEMBER_AREA') {
				area = cookieValue;
			}
		}
		
		var menu = '';
		for (var index in subMenuList) {
			if(subMenuList[index].key == key) {
				menu += '<a href="javascript:linkURL(\'' + subMenuList[index].url + '\')"><li class="on">'+ subMenuList[index].subMenuName + '</li></a>';
			} else {
				menu += '<a href="javascript:linkURL(\'' + subMenuList[index].url + '\')"><li>' + subMenuList[index].subMenuName + '</li></a>';
			}
		}
		return menu;
	}

	function _drawGnb(selector, key, subMenuKey) {
		var selectedMenu = _subMenuList[key];
		selector.html(Util.processTpl(_lnbTemplate, {
			imageUrl : selectedMenu.imageUrl,
			menuName : selectedMenu.name,
			menuList : _makeMenu(selectedMenu.subMenuList, subMenuKey)
		}));
	}

	return {
		draw: _drawGnb
	};
})();