<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통코드관리</title>
</head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 입력 :</p>
       	<input type="text" name="searchWord" maxlength="30" />
        &nbsp; &nbsp;<button class="all__btn img__btn search__btn" onclick="jsSearch();">검색</button>
          <!--
        <select class="filter__options">
          <option value="">option 1</option>
          <option value="">option 2</option>
        </select>
        -->
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>
            	대분류 코드&nbsp;
            	<button id="lrgcDetail">상세</button>
            </p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button id="lrgcReg">입력</button>
            </div>
          </div>
          <!-- 그리드 -->
          <div class="twoGrid__box">
          <section class="grid__box">
            <!-- 그리드 -->
            <table id="list1" class="grid1"></table>
          </section>
          </div>
        </div>
		
		<div class="threeGrid__container">
	        <div class="twoGrid__container threeGrid__container-subcontainer">
	          <!-- 그리드 타이틀 -->
	          <div class="grid__title">
	            <p>중분류 코드</p>
	
	            <!-- 버튼 컨테이너 -->
	            <!--
	            <div class="btn__container">
	              <button>수정</button>
	              <button>삭제</button>
	              <button>입력</button>
	              <button>저장</button>
	            </div>
	            -->
	          </div>
	          <!-- 그리드 -->
	          <div class="twoGrid__box threeGrid__box">
	          <section class="grid__box">
	            <!-- 그리드 -->
	            <table id="list2" class="grid1"></table>
	          </section>
	          </div>
	        </div>
	        
	        <div class="twoGrid__container threeGrid__container-subcontainer">
	          <!-- 그리드 타이틀 -->
	          <div class="grid__title">
	            <p>소분류 코드</p>
	
	            <!-- 버튼 컨테이너 -->
	            <!--
	            <div class="btn__container">
	              <button>수정</button>
	              <button>삭제</button>
	              <button>입력</button>
	              <button>저장</button>
	            </div>
	            -->
	          </div>
	          <!-- 그리드 -->
	          <div class="twoGrid__box threeGrid__box">
	          <section class="grid__box">
	            <!-- 그리드 -->
	            <table id="list3" class="grid1"></table>
	          </section>
	          </div>
	        </div>
        </div>
      </div>
    </main>

    <script>
      $(document).ready(function () {
    	var jsonData = ${data};
    	  
        var mydata = [
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "1",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "2",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "3",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "4",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "5",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "6",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "7",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "8",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "9",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "10",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "11",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "12",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "13",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "14",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "15",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "16",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "17",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "18",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "19",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "20",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "21",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "22",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "23",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "24",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "25",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "26",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "27",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "28",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "29",applDate: "2023-09-05",exprDate: "9999-12-12",},
        	{lrgcCd: "대분류코드CD",lrgcKrNm: "대분류 한글명",smllAcph: "자릿수 중",mddlCd: "중분류코드CD",mddlKrNm: "중분류 한글명",mddlAcph: "자릿수 대",smllCd: "소분류코드CD",smllKrNm: "소분류 한글명",otptSqnc: "30",applDate: "2023-09-05",exprDate: "9999-12-12",}
        ];
        
        $("#list1").jqGrid({
          datatype: "local",
          url : "/risCodeList1Search.do", // 대분류 리스트 조회
          data: jsonData,
          colNames: ["HSPT_ID", "대분류코드", "대분류 한글명", "자릿수", "출력순", "적용일자", "불용일자"],
          colModel: [
            { name: "hsptId", index: "hsptId", width: 50, align: "center" },
            { name: "lrgcCd", index: "lrgcCd", width: 150, align: "center" },
            { name: "lrgcKrNm", index: "lrgcKrNm", width: 100, align: "center" },
            { name: "lrgcAcph", index: "lrgcAcph", width: 60,align: "center"},
            { name: "otptSqnc", index: "otptSqnc", width: 60, align: "center" },
            { name: "applDate", index: "applDate", width: 80, align: "center" },
            { name: "exprDate", index: "exprDate", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
//           multiselect: true,
          sortname: "id",
          sortorder: "asc",
          rownumbers: true,
          gridview: true, // 선표시 true/false
          viewsortcols: [true, "vertical", true],
          loadComplete: function (data) {
          }, // loadComplete END
          onSelectRow: function (rowid) {
            var params = {};
            var rowObject = $("#list1").jqGrid('getRowData',rowid);
            jQuery('#list2').jqGrid('clearGridData'); // 그리드2 데이터 삭제
            jQuery('#list3').jqGrid('clearGridData'); // 그리드3 데이터 삭제
            params.hsptId = rowObject.hsptId;
            params.lrgcCd = rowObject.lrgcCd;

            $("#list2").setGridParam({
				datatype : "json",
				postData : params ,
				url : "/risCodeList2.do", // 중분류 리스트 조회
				mtype    : 'POST', // 전송 타입 */
				loadComplete:  //그리드2 데이터 로딩 완료후 실행되는 함수(빈 상태)
				function(postData){
				} 
			}).trigger("reloadGrid");
          },
          onSortCol: function (index, idxcol, sortorder) {
            // 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
            // (화살표 css 변경하기 전 Frozen을 풀어주고)
            $("#list1").jqGrid("destroyFrozenColumns");
            var $icons = $(this.grid.headers[idxcol].el).find(
              ">div.ui-jqgrid-sortable>span.s-ico"
            );
            if (this.p.sortorder === "asc") {
              //$icons.find('>span.ui-icon-asc').show();
              $icons.find(">span.ui-icon-asc")[0].style.display = "";
              $icons.find(">span.ui-icon-asc")[0].style.marginTop = "1px";
              $icons.find(">span.ui-icon-desc").hide();
            } else {
              //$icons.find('>span.ui-icon-desc').show();
              $icons.find(">span.ui-icon-desc")[0].style.display = "";
              $icons.find(">span.ui-icon-asc").hide();
            }
            // (화살표 css 변경 후 Frozen을 다시 설정)
            $("#list1").jqGrid("setFrozenColumns");
            //alert(index+'/'+idxcol+'/'+sortorder);
          },
        });

        $("#list2").jqGrid({
            datatype: "local",
            url : "/risCodeList2.do", // 중분류 리스트 조회
            reordercolNames: true, //컬럼명을 드래그하여 재정렬할 수 있는 기능을 활성화
            postData: {
              type     : "DCList2", //그리드 데이터를 요청할때 함께 보낼 파라미터 설정
              isSearch : "false", // 화면 처음 로딩 시 검색여부 boolean 값(=false)
            }, // 보낼 파라미터
            mtype    : 'POST', // 전송 타입
            colNames: ["HSPT_ID", "대분류코드", "중분류코드", "중분류 한글명", "자릿수", "출력순", "적용일자", "불용일자"],
            colModel: [
            	{ name: "hsptId", index: "hsptId", width: 90, align: "center" },
            	{ name: "lrgcCd", index: "lrgcCd", width: 150, align: "center" },
            	{ name: "mddlCd", index: "mddlCd", width: 90, align: "center" },
                { name: "mddlKrNm", index: "mddlKrNm", width: 100, align: "center" },
                { name: "mddlAcph", index: "mddlAcph", width: 150,align: "center"},
                { name: "otptSqnc", index: "otptSqnc", width: 80, align: "center" },
                { name: "applDate", index: "applDate", width: 80, align: "center" },
                { name: "exprDate", index: "exprDate", width: 80, align: "center" },
            ],
            guiStyle: "bootstrap",
            autowidth: true,
            height: "85%",
            rownumbers: true,
//             multiselect: true,
            sortname: "id",
            sortorder: "asc",
            rownumbers: true,
            gridview: true, // 선표시 true/false
            viewsortcols: [true, "vertical", true],
            loadComplete: function (data) {
            }, // loadComplete END
            onSelectRow: function (rowid) {
            	var params = {};
                var rowObject = $("#list2").jqGrid('getRowData',rowid);
                jQuery('#list3').jqGrid('clearGridData'); // 그리드2 데이터 삭제
                params.hsptId = rowObject.hsptId;
                params.lrgcCd = rowObject.lrgcCd;
                params.mddlCd = rowObject.mddlCd;

                $("#list3").setGridParam({
    				datatype : "json",
    				postData : params ,
    				url : "/risCodeList3.do", // 중분류 리스트 조회
    				mtype    : 'POST', // 전송 타입 */
    				loadComplete:  //그리드2 데이터 로딩 완료후 실행되는 함수(빈 상태)
    				function(postData){
    				} 
    			}).trigger("reloadGrid");
            },
            onSortCol: function (index, idxcol, sortorder) {
              // 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
              // (화살표 css 변경하기 전 Frozen을 풀어주고)
              $("#list1").jqGrid("destroyFrozenColumns");
              var $icons = $(this.grid.headers[idxcol].el).find(
                ">div.ui-jqgrid-sortable>span.s-ico"
              );
              if (this.p.sortorder === "asc") {
                //$icons.find('>span.ui-icon-asc').show();
                $icons.find(">span.ui-icon-asc")[0].style.display = "";
                $icons.find(">span.ui-icon-asc")[0].style.marginTop = "1px";
                $icons.find(">span.ui-icon-desc").hide();
              } else {
                //$icons.find('>span.ui-icon-desc').show();
                $icons.find(">span.ui-icon-desc")[0].style.display = "";
                $icons.find(">span.ui-icon-asc").hide();
              }
              // (화살표 css 변경 후 Frozen을 다시 설정)
              $("#list1").jqGrid("setFrozenColumns");
              //alert(index+'/'+idxcol+'/'+sortorder);
            },
          });
        $("#list3").jqGrid({
        	datatype: "local",
			url : "/risCodeList3.do", // 중분류 리스트 조회
			reordercolNames: true, //컬럼명을 드래그하여 재정렬할 수 있는 기능을 활성화
			postData: { 
				type     : "DCList2", //그리드 데이터를 요청할때 함께 보낼 파라미터 설정
				isSearch : "false", // 화면 처음 로딩 시 검색여부 boolean 값(=false)
			}, // 보낼 파라미터
			mtype    : 'POST', // 전송 타입
            colNames: ["소분류 코드", "소분류 한글명", "출력순", "적용일자", "불용일자"],
            colModel: [
            	{ name: "smllCd", index: "smllCd", width: 90, align: "center" },
                { name: "smllKrNm", index: "smllKrNm", width: 100, align: "center" },
                { name: "otptSqnc", index: "otptSqnc", width: 80, align: "center" },
                { name: "applDate", index: "applDate", width: 80, align: "center" },
                { name: "exprDate", index: "exprDate", width: 80, align: "center" },
            ],
            guiStyle: "bootstrap",
            autowidth: true,
            height: "85%",
            rownumbers: true,
//             multiselect: true,
            sortname: "id",
            sortorder: "asc",
            rownumbers: true,
            gridview: true, // 선표시 true/false
            viewsortcols: [true, "vertical", true],
            loadComplete: function (data) {
            }, // loadComplete END
            onSelectRow: function (rowid) {
            },
            onSortCol: function (index, idxcol, sortorder) {
              // 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
              // (화살표 css 변경하기 전 Frozen을 풀어주고)
              $("#list1").jqGrid("destroyFrozenColumns");
              var $icons = $(this.grid.headers[idxcol].el).find(
                ">div.ui-jqgrid-sortable>span.s-ico"
              );
              if (this.p.sortorder === "asc") {
                //$icons.find('>span.ui-icon-asc').show();
                $icons.find(">span.ui-icon-asc")[0].style.display = "";
                $icons.find(">span.ui-icon-asc")[0].style.marginTop = "1px";
                $icons.find(">span.ui-icon-desc").hide();
              } else {
                //$icons.find('>span.ui-icon-desc').show();
                $icons.find(">span.ui-icon-desc")[0].style.display = "";
                $icons.find(">span.ui-icon-asc").hide();
              }
              // (화살표 css 변경 후 Frozen을 다시 설정)
              $("#list1").jqGrid("setFrozenColumns");
              //alert(index+'/'+idxcol+'/'+sortorder);
            },
          });
      });
      
      // 대분류 상세 버튼 클릭 시
      $('#lrgcDetail').click(function(){
    	  location.href = "/RIS0101E01.do";
      });

   	  // 대분류 입력 버튼 클릭 시
      $('#lrgcReg').click(function(){
    	  location.href = "/RIS0101E02.do";
      });
   	  
   	  
      function jsSearch(){
    	  jQuery('#list1').jqGrid('clearGridData'); // 그리드1 데이터 삭제
    	  jQuery('#list2').jqGrid('clearGridData'); // 그리드2 데이터 삭제
          jQuery('#list3').jqGrid('clearGridData'); // 그리드3 데이터 삭제
    	  $("#list1").setGridParam({
				datatype : "json",
				postData : {"searchWord" : $("[name='searchWord']").val()} ,
				url : "/risCodeList1Search.do", // 중분류 리스트 조회
				mtype    : 'POST', // 전송 타입 */
				loadComplete:  //그리드2 데이터 로딩 완료후 실행되는 함수(빈 상태)
				function(postData){
				} 
			}).trigger("reloadGrid");
      }
    </script>
  </body>
</html>