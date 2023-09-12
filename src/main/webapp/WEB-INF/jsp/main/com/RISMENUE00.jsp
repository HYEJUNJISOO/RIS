<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메뉴 그룹 정보</title>
    <link rel="stylesheet" type="text/css" href="/css/com/user.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 입력 :</p>
        <select class="filter__options">
          <option value="">option 1</option>
          <option value="">option 2</option>
        </select>
        <button class="all__btn img__btn search__btn">검색</button>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="leftGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>메뉴 목록</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              	<button class="all__btn img__btn img__btn update__btn">수정</button>
        		<button class="all__btn img__btn insert__btn">입력</button>
		    	<button class="all__btn img__btn delete__btn">삭제</button>
    			<button class="all__btn img__btn save__btn">저장</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="rightGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>해당 프로그램 목록</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
             	<button class="all__btn img__btn img__btn update__btn">수정</button>
        		<button class="all__btn img__btn insert__btn">입력</button>
        		<button class="all__btn img__btn insert2__btn">하위메뉴</button>
		    	<button class="all__btn img__btn delete__btn">삭제</button>
    			<button class="all__btn img__btn save__btn">저장</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list2" class="grid1"></table>
            </section>
          </div>
        </div>
      </div>
    </main>

    <script>
      	$(document).ready(function () {
    	  	var mydata = [
              	{
	                date: "2007-10-01",
	                name: "test",
	                id: "id",
	                product: "상품1",
	                amount: "10.00",
	                total: "210.00",
              	},
          	];
		$("#list1").jqGrid({
        	url: "/RISMENUE00.do",   // 서버주소 
            reordercolNames:true,
            postData : { type: 'A' }, // 보낼 파라미터
            mtype:'POST',   // 전송 타입
            datatype: "json",
          	colNames: ["메뉴ID", "메뉴그룹명", "순서", "사용"],
          	colModel: [
	            { name: "menuGroupId", index: "menuGroupId", width: 90, align: "center" },
	            { name: "menuGroupName", index: "menuGroupName", width: 200, align: "center" },
	            { name: "otptSqnc", index: "otptSqnc", width: 60, align: "center" },
	            { name: "useYn", index: "useYn", width: 50, align: "center" },
          	],
          	jsonReader: 
		  	{
			  	repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
			  	root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
			  	records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
		  	},
          	guiStyle: "bootstrap",
          	autowidth: true,
          	height: "93%",
          	rownumbers: true,
          	gridview: true, // 선표시 true/false
          	viewsortcols: [true, "vertical", true],
          	loadComplete: function (data) {
            	console.log(data);
          	}, // loadComplete END
          	onSelectRow: function (rowid) {
            	console.log(rowid);
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
        	url: "/RISUSERQ002.do",   // 서버주소 
            reordercolNames:true,
            postData : { type: 'A' }, // 보낼 파라미터
            mtype:'POST',   // 전송 타입
            datatype: "json",
            colNames: ["메뉴ID", "프로그램ID", "프로그램명", "메뉴명", "메뉴 서브 네임", "상위메뉴", "LEV", "순서", "사용"],
            colModel: [
	            { name: "menuId", index: "menuId", width: 50, align: "center" },
	            { name: "pgrmId", index: "pgrmId", width: 90, align: "center" },
	            { name: "menuName", index: "menuName", width: 150, align: "center" },
	            { name: "menuName", index: "menuName", width: 120, align: "center" },
	            { name: "menuNameSub", index: "menuNameSub", width: 120, align: "center" },
	            { name: "upperMenuId", index: "upperMenuId", width: 80, align: "center" },
	            { name: "menuLevel", index: "menuLevel", width: 60, align: "center" },
	            { name: "otptSqnc", index: "otptSqnc", width: 50, align: "center" },
	            { name: "useYn", index: "useYn", width: 50, align: "center" },
          	],
          	jsonReader: 
		  	{
			  	repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
			  	root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
			  	records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
		  	},
          	guiStyle: "bootstrap",
          	autowidth: true,
          	height: "93%",
          	rownumbers: true,
          	sortname: "id",
          	sortorder: "asc",
          	gridview: true, // 선표시 true/false
          	viewsortcols: [true, "vertical", true],
          	loadComplete: function (data) {
            	console.log(data);
          	}, // loadComplete END
          	onSelectRow: function (rowid) {
            	console.log(rowid);
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
    </script>
  </body>
</html>
