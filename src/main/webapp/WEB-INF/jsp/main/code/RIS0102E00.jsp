<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>촬영실 관리</title>
    <link rel="stylesheet" type="text/css" href="/css/code/RIS0102E00.css"/>
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">쵤영실 코드 관리</p>
				<label class="box__label">사용여부</label>
					<input style="margin-left:2rem;" type="radio" name="use_yn" id="use_yn1" value="Y" onchange="fn_egov_selectGrid();" checked/>
					<label style="margin-right:2rem;" for="use_yn1" >사용</label>
					<input type="radio" name="use_yn" id="use_yn2" value="N" onchange="fn_egov_selectGrid();" />
					<label style="margin-right:2rem;" for="use_yn2">불용</label>					
				<label class="box__label ml-2">검색 : </label>
	            <input type="text" id="searchKeyword" value="" onkeydown="enter()"/> 
          		<div class="inquiry__btn-right ml-2">
		        	<a href="javascript:fn_egov_selectGrid();" class="ml-2">
        <button class="all__btn img__btn search__btn">검색</button>
      </section>

      <div class="grid__container main__container-twoGrid" style="display: flex; width: 30%;">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title" style="display: flex; width: 200%;">
            <p>그리드 타이틀</p>

          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box" style="display: flex; width: 200%;">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>                      
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
          {
            date: "2007-10-02",
            name: "test2",
            id: "id2",
            product: "상품1",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id3",
            product: "상품1",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id4",
            product: "상품1",
            amount: "10.00",
            total: "210.00",
          },
          {
            date: "2007-10-05",
            name: "test2",
            id: "id5",
            product: "상품1",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-06",
            name: "test3",
            id: "id6",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id7",
            product: "상품2",
            amount: "10.00",
            total: "210.00",
          },
          {
            date: "2007-10-03",
            name: "test2",
            id: "id8",
            product: "상품2",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id9",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-10-01",
            name: "test",
            id: "id10",
            product: "상품2",
            amount: "10.00",
            total: "210.00",
          },
          {
            date: "2007-10-02",
            name: "test2",
            id: "id11",
            product: "상품2",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id12",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id13",
            product: "상품2",
            amount: "10.00",
            total: "210.00",
          },
          {
            date: "2007-10-05",
            name: "test2",
            id: "id14",
            product: "상품2",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-06",
            name: "test3",
            id: "id15",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-10-04",
            name: "test",
            id: "id16",
            product: "상품2",
            amount: "10.00",
            total: "210.00",
          },
          {
            date: "2007-10-03",
            name: "test2",
            id: "id17",
            product: "상품2",
            amount: "20.00",
            total: "320.00",
          },
          {
            date: "2007-09-01",
            name: "test3",
            id: "id18",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
          {
            date: "2007-09-01",
            name: "test4",
            id: "id19",
            product: "상품2",
            amount: "30.00",
            total: "430.00",
          },
        ];

        $("#list1").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["구분", "코드", "코드명"],
          colModel: [
            { name: "division", index: "division", width: 25, align: "center" },
            { name: "code", index: "code", width: 60, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: true,
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

        $("#list2").jqGrid({
          datatype: "local",
          data: mydata,
          colNames: ["날짜", "아이디", "이름", "상품", "가격", "합계"],
          colModel: [
            { name: "date", index: "date", width: 90, align: "center" },
            { name: "name", index: "name", width: 100, align: "center" },
            {
              name: "id",
              index: "id",
              width: 150,
              align: "center",
            },
            { name: "product", index: "product", width: 80, align: "center" },
            { name: "amount", index: "amount", width: 80, align: "center" },
            { name: "total", index: "total", width: 80, align: "center" },
          ],
          guiStyle: "bootstrap",
          autowidth: true,
          height: "94%",
          rownumbers: true,
          multiselect: true,
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
