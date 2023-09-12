<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js" defer></script>
    <link rel="stylesheet" href="/css/appn/appnCommon.css">
    
    <title>예약 기준 관리</title>
    <style>
      .select {
          display: flex;
          padding: 15px 10px;
      }
      .select input[type=radio]{
          display: none;
      }
      .select input[type=radio]+label{
          display: inline-block;
          cursor: pointer;
          height: 24px;
          width: 60px;
          border: 1px solid #333;
          line-height: 24px;
          text-align: center;
          font-weight:bold;
          font-size:13px;
      }
      .select input[type=radio]+label{
          background-color: #fff;
          color: #333;
      }
      .select input[type=radio]:checked+label{
          background-color: #333;
          color: #fff;
      }

      .grid__title__custom {
        padding: 0 20px;
        height: 100px;
        font-size: 14px;
        font-weight: bold;
        background-color: #f1f1f1;
        border: 1px solid #dbdbdb;
        border-bottom: 0;
      }
      .grid__title__flex{
        display: flex;
        align-items: center;
        justify-content: space-between;
        
      }

      .center {
        display: flex;
        justify-content: center;
      }

      .bold-text{
        font-weight: 700;
        font-size: 1.2em;
      }
    
      
    </style>
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
        <button class="search__btn">검색</button>
      </section>

      <div class="grid__container main__container-twoGrid">
        <div class="twoGrid__container">
          <div class="form__container padding-5">
              <div class="flex height-fix-50">
                <div class="width-20">시간 설정</div>
                <div class="flex width-80 flex-end">
                  <div class="margin-10">* 생성구분 </div>
                  <label for="new-create" class="margin-10">새로 생성 </label>
                  <input type="radio" id="new-create" class="margin-10" name="create-gubun" checked>
                  <label for="addition-create" class="margin-10">추가 생성 </label>
                  <input class="margin-10"  type="radio" id="addition-create" name="create-gubun">
                  <button class="all__btn img__btn update__btn top-25 margin-10">기준 생성 </button>
                </div>
              </div>
              <div class="height-fix-50 flex space-between">
                  <label for="start-time">시작시간</label>
                  <input type="text" id="start-time" class="input-box input-box-custom ">
                  <label for="end-time">종료시간</label>
                  <input type="text" id="end-time" class="input-box input-box-custom  ">
                  <label for="interval">간격</label>
                  <input type="text" id="interval" class="input-box input-box-custom  ">
                  <p>분</p>
                  <p>휴게시간 </p>
                  <input type="text" id="rest-start-time" class="input-box input-box-custom  ">
                  <p> ~ </p>
                  <input type="text" id="rest-end-time" class="input-box input-box-custom ">
              </div>
              <div class="height-fix-50 flex space-between">
                <label for="out-patient">외래</label>
                <input type="text" id="out-patient" class="input-box  input-box-custom ">
                <label for="in-patient">입원</label>
                <input type="text" id="in-patient" class="input-box  input-box-custom ">
                <label for="health-examination">건진</label>
                <input type="text" id="health-examination" class="input-box  input-box-custom ">
                <input type="checkbox" id="week-batch" class="height-md input-box-custom">
                <label for="week-batch">월 ~ 금 일괄적용</label>
              </div>
            </div>
          
          <!-- 그리드 타이틀 -->
          <div class="grid__title__custom">
            <div class="select">
              <input type="radio" id="monday" name="week"><label for="monday">월</label>
              <input type="radio" id="tuesday" name="week"><label for="tuesday">화</label>
              <input type="radio" id="wednesday" name="week"><label for="wednesday">수</label>
              <input type="radio" id="thursday" name="week"><label for="thursday">목</label>
              <input type="radio" id="friday" name="week"><label for="friday">금</label>
              <input type="radio" id="saturday" name="week"><label for="saturday">토</label>
              <input type="radio" id="sunday" name="week"><label for="sunday">일</label>
            </div>
            <div class="grid__title__flex">
              <div class="flex">
                <p class="line-height-50 margin-10">요일설정</p>
                <button class="all__btn img__btn update__btn top-25">갱신</button>
              </div>
              
              <!-- 버튼 컨테이너 -->
              <div class="btn__container">
                <button class="all__btn img__btn update__btn">수정</button>
                <button class="all__btn img__btn insert__btn">입력</button>
                <button class="all__btn img__btn delete__btn">삭제</button>
                <button class="all__btn img__btn save__btn">저장</button>
              </div>
           </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box height-65">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list1" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          
           <!-- calendar 태그 -->
          <div id='calendar-container '>
            <div class="btn__container center bold-text">
              <select  id="appointment-year">
                <option></option>
              </select>
              <label for="appointment-year">년  </label>
              <select  id="appointment-month">
                <option></option>
              </select>
              <label for="appointment-month">월  </label>
            </div>
            <div id='calendar'></div>
          </div>
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <p>예약 변동 내역</p>

        
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box__custom">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list2" class="grid1"></table>
            </section>
          </div>
        </div>

        <div class="twoGrid__container">
          <!-- 그리드 타이틀 -->
          <div class="grid__title">
            <button class="all__btn img__btn update__btn">갱신</button>

            <!-- 버튼 컨테이너 -->
            <div class="btn__container">
              <button class="all__btn img__btn update__btn">수정</button>
              <button class="all__btn img__btn insert__btn">입력</button>
              <button class="all__btn img__btn delete__btn">삭제</button>
              <button class="all__btn img__btn save__btn">저장</button>
            </div>
          </div>
          <!-- 그리드 박스 -->
          <div class="twoGrid__box">
            <section class="grid__box">
              <!-- 그리드 -->
              <table id="list3" class="grid1"></table>
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
        height: '70%', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
              start: '', // 왼쪽 영역 숨기기
              center: '', // 중앙 영역 숨기기
              end: '' // 오른쪽 영역 숨기기
          },
        header : false,
        
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
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
          height: "80%",
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
