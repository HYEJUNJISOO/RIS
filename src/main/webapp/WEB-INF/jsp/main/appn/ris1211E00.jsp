<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>예약 관리</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js" defer></script>
    <link rel="stylesheet" href="/css/appn/appnCommon.css">
    <style>
      .color-1{
        background: #005d92;
      }

      .twoGrid__box .appointment-detail-container{
        padding: 10px;
        color: #fff;
      }

      .appointment-detail-container textarea{
        margin-top: 10px;
        margin-bottom: 10px;
        width: 100%;
        height: 70px;
        overflow: auto;
        resize: none;
      }
      .mb-10{
        margin-bottom: 10px;
      }

    </style>
  </head>
  <body>
    <main class="main__container">
      <!-- 검색 -->
      <section class="search__container">
        <p class="filter__keyword margin-10">조회일자 </p>
        <input type="date" class="margin-10">
        <p class="margin-10"> ~ </p>
        <input type="date" class="margin-10">
        <p class="filter__keyword margin-10">환자명 </p>
        <input type="text" class="margin-10">
        <button class="all__btn img__btn img__btn update__btn margin-10">찾기</button>
        <p class="filter__keyword margin-10">촬영구분환자명 </p>
        <select class="margin-10">
          <option>전체</option>
        </select>
        <p class="filter__keyword margin-10">촬영실 </p>
        <select class="margin-10">
          <option>전체</option>
        </select>
        <p class="filter__keyword margin-10">예약 여부 </p>
        <input type="radio" id="appointment-total" class="margin-10" name="appointment-gubun" checked>
        <label for="appointment-total" class="filter__keyword margin-10">전체 </label>
        <input type="radio" id="appointment-reserved" class="margin-10" name="appointment-gubun" checked>
        <label for="appointment-reserved" class="filter__keyword margin-10">예약 </label>
        <input type="radio" id="appointment-unreserved" class="margin-10" name="appointment-gubun" checked>
        <label for="appointment-unreserved" class="filter__keyword margin-10">미예약 </label>
 
      </section>
      <!-- 그리드 -->
      <div class="grid__container height-40">
        <section class="grid__box">
          <!-- 그리드 -->
          <table id="list1" class="grid1"></table>
        </section>
      </div>
    


      <div class="grid__container main__container-twoGrid height-45">
        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약 상세정보</p>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box color-1 appointment-detail-container">
               <div class="mb-10">
                    <label for="imaging">촬영실 : </label>
                    <select  id="imaging">
                      <option>처방을 선택하세요</option>
                    </select>
                </div>
                <div>처방참고내용</div>
                <div>
                  <textarea></textarea>
                </div>
                <div>예약참고내용</div>
                <div>  
                  <textarea></textarea>
                </div>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약일자</p>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <select  id="appointment-year">
                <option></option>
              </select>
              <label for="appointment-year">년  </label>
              <select  id="appointment-month">
                <option></option>
              </select>
              <label for="appointment-month">월  </label>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
               <!-- calendar 태그 -->
              <div id='calendar-container'>
                <div id='calendar'></div>
              </div>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          
            <div class="grid__title">
            <p></p>
         
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button class="all__btn img__btn save__btn">예약</button>
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

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p></p>
            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button class="all__btn img__btn save__btn">취소</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list3" class="grid3"></table>
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

        $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
        start: '', // 왼쪽 영역 숨기기
        center: '', // 중앙 영역 숨기기
        end: '' // 오른쪽 영역 숨기기
        },
        height: '97%', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        header: false, 
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        events: [
          {
            title: 'All Day Event',
            start: '2021-07-01',
          },
          {
            title: 'Long Event',
            start: '2021-07-07',
            end: '2021-07-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2021-07-11',
            end: '2021-07-13'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T10:30:00',
            end: '2021-07-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2021-07-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2021-07-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2021-07-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2021-07-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/', // 클릭시 해당 url로 이동
            start: '2021-07-28'
          }
        ]
      });
      // 캘린더 랜더링
      calendar.render();
    });

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

        $("#list3").jqGrid({
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
