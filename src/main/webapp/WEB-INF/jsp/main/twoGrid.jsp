<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword">검색어 :</p>
        <select class="filter__options">
          <option value="">option 1</option>
          <option value="">option 2</option>
        </select>
        <button class="all__btn img__btn search__btn">검색</button>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>그리드 타이틀</p>

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

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>그리드 타이틀</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
             	<button class="all__btn img__btn img__btn update__btn">수정</button>
        		<button class="all__btn img__btn insert__btn">입력</button>
		    	<button class="all__btn img__btn delete__btn">삭제</button>
    			<button class="all__btn img__btn save__btn">저장</button>
		    	<button class="all__btn text__btn">글자만</button>
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
