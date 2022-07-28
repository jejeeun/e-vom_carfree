Util = {
	/**
	 * @description 간단한 템플릿 치환 함수
	 * @param {String} sTemplate 템플릿 문자열
	 * @param {Hash Table} htData 데이터
	 * @example processTpl("My name is {=name}", {name: 'John Doe'}); // My name is John Doe processTpl("1st item of Array is '{=0}'", ['a','b','c']); // 1st item of Array is 'a'
	 */
	processTpl: function (sTemplate, htData) {
		this._rxTemplate = this._rxTemplate || /{=([^{}]*)}/g;
		return sTemplate.replace(this._rxTemplate, function (a, b) {
			// 지정한 데이터에 없는 항목은 그냥 빈 문자열로 대체 "{="+b+"}"
			return (typeof htData[b] == "undefined") ? "" : htData[b];
		});
	},

	/**
	 * yyyy.MM.dd 형태 반환
	 * @param dDate
	 */
	dateFormat: function (dDate) {
		return dDate.getFullYear() + '.' + this.pad(dDate.getMonth() + 1, 2) + '.' + this.pad(dDate.getDate(), 2);
	},

	/**
	 * yyyy.MM.dd HH:mm 형태 반환
	 * @param dDate
	 */
	dateTimeFormat: function (dDate) {
		return dDate.getFullYear() + '.' + this.pad(dDate.getMonth() + 1, 2) + '.' + this.pad(dDate.getDate(), 2) + ' ' + this.pad(dDate.getHours(), 2) + ':' + this.pad(Math.ceil(dDate.getMinutes() / 10) * 10, 2);
	},

	pad: function (n, nWidth) {
		n = n + '';
		return n.length >= nWidth ? n : new Array(nWidth - n.length + 1).join('0') + n;
	},

	numberWithCommas: function (n) {
		var regular = /(^[+-]?\d+)(\d{3})/;
		n += '';                          // 숫자를 문자열로 변환
		while (regular.test(n)) {
			n = n.replace(regular, '$1' + ',' + '$2');
		}
		return n;
	},

	subStringDate: function (dateString) {
		return dateString.substring(0, 4) + '.' + dateString.substring(4, 6) + '.' + dateString.substring(6, 8);
	},

	getCookie: function(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value? value[2] : null;
	},

	getUserName: function() {
		return this.getCookie('CIMS_MEMBER_NAME');
	},

	getLoginTime: function() {
		return this.getCookie('CIMS_LOGIN_TIME');
	}
};

$.ajaxSetup ({
	// Disable caching of AJAX responses */
	cache: false
});