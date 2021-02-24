//최근본 아이템 삭제 기간
var LATELY_VIEW_ITEM_EXPORATION_DATE=1;

//최근본 아이템 최대 저장 개수
var LATELY_VIEW_ITEM_MAX_SAVE_COUNT=10;

//최근본  아이템 페이징 사이즈
var LATELY_VIEW_ITEM_PAGEING_SIZE=5;


function isNull(obj) {
	if(obj==''|| obj == null || obj == undefined || obj == NanN){
		return true;
	}else{
		return false;
	}
}
//로컬스토리지 저장
function setLocalStorage(name, obj) {
	localStorage.setItem(name,obj);
}

//로컬 스토리지 삭제
function removeLocalStorage(name) {
	localStorage.removeItem(name);
}

//로컬스토리지에서 특정 객체 가져오기
function getItemLocalStorage(name) {
	return localStorage.getItem(name);
}

common.js.document.ready(function() {
	initLatelyViewItemList();
});

function initLatelyViewItemList() {
	//로컬스토리지에서 latelyViewItemList로 저장된 저보가 있는지 확인후
	if(isNull(getItemLocalStorage('latelyViewList'))){
		//없을 경우 공간 생성	
		setLocalStorage('latelyViewItemList', null);
		//상품을 표시할 ul에 없을 경우 화면 표시
		$("ul#latelyViewItemLit_ul").append('<li>찾아본<br>상품이<br>없습니다.</li>');
		//기존 정보가 있을 경우
	}else{
		//저장된 정보를 가져오고
		var latelyViewItemListJson = getItemLocalStorage('latelyViewItemList');
		//실제 저장된 데이터가 잇는 경우
		if(latelyViewItemListJson != "null" || isNull(latelyViewItemListJson)){
			
			var nowDate = new Date();
			//문자열을 객체로 변환
			var latelyViewItemList = JSON.parse(latelyViewItemListJson);
			
			//일정시간 경과된 아이템을 제외하고 다시넣기 위한 새로운 Array
			var latelyViewItemListNew = new Array();
			
			//상품 리스트를 돌면서 상품별 저장된 시간이 현재 시간보다 클 경우만 다시 latelyViewItemListNew에 추가
			for (var i in latelyViewItemList) {
				var viewTime = new Date(latelyViewItemList[i].viewTime);
				//시간이 경과된 경우를 제외하고 재 저장
				if(nowDate.getTime() < viewTime.getTime()){
					latelyViewItemListNew.push(latelyViewItemList[i]);
				}
			};
			//시간이 모두 경과된 경우 담긴 새로운 배열요소가 없으므로 로컬스토리지를 비워줌.
			if(latelyViewItemListNew.length == 0){
				setLocalStorage();
			}
			
		}
	}
	
}