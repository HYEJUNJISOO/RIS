<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이동 촬영 접수</title>

<!-- css -->
<link rel="stylesheet" href="/css/jubsu/RIS1201E02.css" />
</head>
<body>
	<main class="main__container">
		<!-- 검색 -->
		<section class="search__container">
			<div class="searchDaily__div">
				<p class="filter__keyword ">조회일자</p>
				<input type="date" class="inputDateStart " />
				<p>~</p>
				<input type="date" class="inputDateEnd " />
				<p class="ptntNmClass">환자명</p>
				<input type="text" class="ptntNmInputClass" />
				<button class="all__btn img__btn search__btn search"></button>
			</div>
			
			<div class="searchKubun__div">
				<p class="searchKubun">검색구분</p>
				<label><input type="radio" value="ALL" name="kubunRadio" /><h class="labelInputClass">전체</h></label>
				<label><input type="radio" value="PRE" name="kubunRadio" /><h class="labelInputClass">처방</h></label>
				<label><input type="radio" value="REC" name="kubunRadio" /><h class="labelInputClass">접수</h></label>
			</div>
			
			<div class="pacsUser__div">
				<p>방사선사 :</p>
				<select class="selectClass">
					<option>pacsUser1</option>
					<option>pacsUser2</option>
					<option>pacsUser3</option>
					<option>pacsUser4</option>
				</select>
				
				<button class="all__btn img__btn search__btn pacsUserSearch"></button>
				<button class="all__btn img__btn fontawesome__btn receipt__icon">접수</button>
			</div>
		</section>

		
		<!-- 그리드 -->
		<div class="grid__container">
			<section class="grid__box">
				<!-- 그리드 -->
				<table id="list1" class="grid1"></table>
			</section>
		</div>
	</main>

	<script>
        $("#list1").jqGrid({
          datatype: "local",
          
          colNames: ["환자ID", "환자명", "성별", "나이", "생년월일", "내원구분", "처방일", "처방코드", "처방명", "촬영실", "응급", "수납", "DC", "접수일자", "접수시간", "접수자"],
          colModel: [
            { name: "PTNT_ID", index: "PTNT_ID", width: 90, align: "center" },
            { name: "PTNT_NM", index: "PTNT_NM", width: 100, align: "center" },
            { name: "??", index: "??", width: 150, align: "center" }, 
            { name: "??", index: "??", width: 150, align: "center" },
            { name: "??", index: "??", width: 150, align: "center" },
            { name: "VIST_DVSN", index: "VIST_DVSN", width: 80, align: "center" },
            { name: "ORDR_DATE", index: "ORDR_DATE", width: 80, align: "center" },
            { name: "ORDR_CD", index: "ORDR_CD", width: 80, align: "center" },
            { name: "ORDR_NM", index: "ORDR_NM", width: 80, align: "center" },
            { name: "??", index: "??", width: 80, align: "center" },
            { name: "EMRG_YN", index: "EMRG_YN", width: 80, align: "center" },
            { name: "PMNT_YN", index: "PMNT_YN", width: 80, align: "center" },
            { name: "DC_YN", index: "DC_YN", width: 80, align: "center" },
            { name: "RCPT_DATE", index: "RCPT_DATE", width: 80, align: "center" },
            { name: "RCPT_DTTM", index: "RCPT_DTTM", width: 80, align: "center" },
            { name: "RCPT_PRSN_ID", index: "RCPT_PRSN_ID", width: 80, align: "center" },
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
    </script>
</body>
</html>