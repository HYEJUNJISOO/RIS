<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>영상 판독문구 관리</title>
    <link rel="stylesheet" href="/css/pandok/RIS0601E00.css" />
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <!-- 의사 리스트 -->
      	<div class="search__box docId__search">
          <p class="filter__keyword">의사 :</p>
          <select id="selectDocId" class="filter__options">
          	<option value="">의사 ID를 선택해주세요.</option>
            <c:forEach items="${risUserData}" var="data">
           	  <option value="${data.loginId}">${data.loginNm}(${data.loginId})</option>
           	</c:forEach>
          </select>
        </div>
        
        <!-- 검색어 입력 -->
        <div class="search__box keyword__search">
          <p class="filter__keyword">검색어 입력 :</p>
          <input class="filter__options" type="text" />
          <button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
        </div>
        
        <!-- 촬영구분 -->
      	<div class="search__box docId__search">
          <p class="filter__keyword">촬영구분 :</p>
          <select class="filter__options">
            <c:forEach items="${ris0102Data}" var="data">
           	  <option value="${data.mddlCd}">${data.mddlKrNm}</option>
           	</c:forEach>
          </select>
        </div>
        
        <!-- 공용코드 -->
        <div class="search__box">
          <p class="filter__keyword">공용코드 : </p>
          <input id="commonCheck" type="checkbox" />
        </div>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>판독정형문</p>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <div class="btn__container">
        	  <button id="copyBtn" class="all__btn img__btn fontawesome__btn copy__icon">복사</button>
              <button id="pasteBtn" class="all__btn img__btn fontawesome__btn paste__icon">붙여넣기</button>
            </div>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
        	  <button id="refreshBtn" class="all__btn fontawesome__btn rotate__icon"></button>
        	  <button id="insertBtn" class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
              <button id="updateBtn" class="all__btn img__btn fontawesome__btn update__icon">수정</button>
		      <button class="all__btn img__btn fontawesome__btn delete__icon">삭제</button>
    		  <button class="all__btn img__btn fontawesome__btn save__icon">저장</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box textarea__box">
              <label for="viewText">판독 내용</label>
              <textarea id="viewText" disabled>판독정형문을 선택해주세요.</textarea>
            </section>
          </div>
        </div>
      </div>
    </main>

    <script>
      // 정형문 리스트 출력
      function setRis0601List() {
    	  // 촬영 구분 select 태그로 변환
    	  var ris0102ListForJs = JSON.parse('${ris0102List}');
    	  var selectOption = {};
    	  
    	  for (data of ris0102ListForJs) {
    		  selectOption[data.mddlCd] = data.mddlKrNm;
    	  }
    	  
    	  $("#list1").jqGrid({
              url: "/pandok/getRis0601List.do",
              reordercolNames:true,
              datatype: "json",
              colNames: ["구분", "의사ID", "정형문 코드", "촬영구분", "판독약어명", "판독내용"],
              colModel: [
                { name: "flag",       index: "flag",       width: 40,    align: "center" },
                { name: "docId",      index: "docId",      width: 100,   align: "left" },
                { name: "tmplCd",     index: "tmplCd",     width: 100,   align: "left" },
                { name: "mddlKrNm",   index: "mddlKrNm",   width: 100,   align: "left", editable: true, edittype: 'select', editoptions: { value:selectOption } },
                { name: "viewAbbrNm", index: "viewAbbrNm", width: 100,   align: "left", editable: true },
                { name: "viewText",   index: "viewText",   hidden: true },
              ],
              jsonReader: {
     		    repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
     		    root:'ris0601Data', //서버의 결과 내용에서 데이터를 읽어오는 기준점
     		    records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
     	      },
              autowidth: true,
              height: "93%",
              autoScroll: true,
              loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
      		  emptyrecords: "데이터가 존재하지 않습니다.",  // 데이터 없을때
      		  rowNum: 999999,
              rownumbers: true,
              sortname: "docId",
              sortorder: "asc",
              loadonce: true,
              viewsortcols: [true, "vertical", true], // 정렬 조건 [모든 열 여부, vertical || horizontal, Header 아무곳 클릭 여부]
              loadComplete: function (data) {
                console.log(data);
              }, // loadComplete END
              onSelectRow: function (rowid) {
                var rowData = $("#list1").getRowData(rowid);
                
            	// 판독 내용 disabled
            	$("#viewText").attr("disabled", true);
            	
            	// 판독 내용에 데이터 삽입
                $("#viewText").val(rowData.viewText);
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
      }
    
      $(document).ready(function () {
    	  setRis0601List();
      });
      
      // 복사 버튼
      $("#copyBtn").click(function() {
		  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
    	  
    	  if (rowId) { // 선택된 행이 있는 경우에만 실행
	    	  var data = $("#viewText").val();
	    	  var t = document.createElement("textarea");
	    	  
	    	  document.body.appendChild(t);
	    	  t.value = data;
	    	  t.select();
	    	  document.execCommand("copy");
	    	  document.body.removeChild(t);
	    	  
	    	  alert("판독 내용이 복사되었습니다.");
    	  } else {
	    	  // 선택된 행이 없는 경우 처리할 내용을 추가할 수 있습니다.
	    	  alert("행을 먼저 선택하세요.");
	  	  }
      });
      
      // 붙여넣기 버튼
      $("#pasteBtn").click(function() {
    	  if ($("#viewText").attr("disabled")) {
    		  alert("수정 버튼을 먼저 눌러주세요.");
    	  } else {    		  
	    	  // 클립보드에서 텍스트 가져오기
	    	  navigator.clipboard.readText()
	    	  .then(function(clipboardData) {
	    	  	  // 가져온 데이터를 viewText에 설정
	    	      $("#viewText").val(clipboardData);
	    	  })
	    	  .catch(function(err) {
	    	      alert('클립보드에서 텍스트를 읽어오지 못했습니다.');
	    	  });
    	  }
      });
      
      // 새로고침 버튼
      $("#refreshBtn").click(function() {
    	  // 판독 내용 disabled
    	  $("#viewText").attr("disabled", true);
    	  
    	  // 그리드 새로고침
    	  $("#list1").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
    	  setRis0601List();
      })
      
      // 수정 버튼
      $("#updateBtn").click(function() {
    	  var rowId = $("#list1").jqGrid('getGridParam', 'selrow');
    	  
    	  if (rowId) { // 선택된 행이 있는 경우에만 실행
    		  var rowData = $("#list1").jqGrid('getRowData', rowId);
    	  
	    	  // 판독 내용 수정 가능
	    	  $("#viewText").attr("disabled", false);
    	      
    	  	  // 수정 조건 추가해야 함!!!!!!!
    	  	  rowData.flag = '수정';
    	  	  $("#list1").jqGrid('setRowData', rowId, rowData);
    	  	  
    	      // 그리드에서 선택된 행 데이터 수정
    	      $("#list1").jqGrid('editRow', rowId, true);
          } else {
    	      // 선택된 행이 없는 경우 처리할 내용을 추가할 수 있습니다.
    	      alert("행을 먼저 선택하세요.");
    	  }
      });
      
      // 입력 버튼
      $("#insertBtn").click(function() {
		  var grid = $("#list1");
		  var newDocId = "";
		  
		  // 공용 코드일 경우 & 의사 아이디가 선택된 경우 & 그 외
		  if ($("#commonCheck").is(":checked")) {
			  newDocId = "COMMON";
		  } else if ($("#selectDocId").val()) {
			  newDocId = $("#selectDocId").val();
		  } else {
			  return alert("의사 ID를 먼저 선택해주세요.");
		  }
		  var newRowId = (grid.jqGrid('getDataIDs').length + 1).toString(); // 현재 행 개수 + 1로 아이디 생성
		  var newRowData = { id: newRowId, flag: '입력', docId: newDocId, tmplCd: '', imgnDvsnCd: '', viewAbbrNm: '', viewText: '' }; // 빈 행 데이터 생성
		  
		  grid.jqGrid('addRowData', newRowId, newRowData, 'last'); // 행 추가
		  grid.jqGrid('editRow', newRowId, true); // 편집 모드로 변경
		  
		  // 그리드 스크롤을 맨 밑으로
		  var gridContainer = grid.closest(".ui-jqgrid-bdiv");
		  gridContainer.scrollTop(gridContainer[0].scrollHeight);
      });
    </script>
  </body>
</html>
