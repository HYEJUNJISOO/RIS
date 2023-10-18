<%@ page language="java" contentType="text/html; charset=UTF-8"
				 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>환자 정보 관리</title>

	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/css/pat/RIS1101E00.css" />
</head>
<body>
<main class="main__container">
	<!-- 검색 -->
	<section class="search__container">
		<p class="filter__keyword">환자명 :</p>
		<input id="inputKeyword" class="ptntInputClass" />
		<button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
	</section>

	<div class="grid__container main__container-twoGrid">
		<div class="twoGrid__container">
			<!-- 그리드 타이틀 -->
			<div class="grid__title">
				<p>환자정보 목록</p>
			</div>

			<!-- 그리드 -->
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
				<p>환자 상세정보</p>
				<div class="btn__container">
					<button id="inputUpdate" class="all__btn img__btn fontawesome__btn update__icon">수정</button>
					<button id="inputInsert" class="all__btn img__btn fontawesome__btn insert__icon">입력</button>
					<button id="ris1101DataSave" class="all__btn img__btn fontawesome__btn save__icon">저장</button>
				</div>
			</div>

			<!-- 그리드 -->
			<div class="twoGrid__box">
				<table class="tableClass">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<th class="thNeed">환자ID</th>
						<td><input type="text" id="ptntIdInput" class="tdInputClass" placeholder="test" maxlength="20" style="width: 85%; height: 34%;" disabled /></td>
						<td colspan="2">
							<button id="ptntIdCheck" class="all__btn text__btn" disabled>중복확인</button>
						</td>
					</tr>
					<tr>
						<th class="thNeed">환자명</th>
						<td><input type="text" id="ptntKrNmInput"
											 class="tdInputClass" placeholder="test" maxlength="100"
											 style="width: 85%; height: 50%;"
											 disabled /></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>영문 명</th>
						<td><input type="text" id="ptntEnglNmFInput" value="HONG"
											 maxlength="20" style="width: 85%;"
											 disabled /></td>
						<td><input type="text" id="ptntEnglNmMInput" value="GIL"
											 maxlength="20" style="width: 85%;"
											 disabled /></td>
						<td><input type="text" id="ptntEnglNmLInput" value="DONG"
											 maxlength="20" style="width: 85%;"
											 disabled /></td>
					</tr>
					<tr>
						<th class="thNeed">생년월일</th>
						<td colspan="3"><input type="date" id="brthInput"
																	 class="dateClass" value="2023-09-07"
																	 style="width: 28%; height: 50%;"
																	 disabled /></td>
					</tr>
					<tr>
						<th class="thNeed">성별</th>
						<td colspan="3">
							<label><input type="radio" id="gndrDvsnA" name="MF_btn" value="M" onclick="return false" checked>남</label>
							<label><input type="radio" id="gndrDvsnB" name="MF_btn" value="F" onclick="return false">여</label>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="3"><input id="moblInput" class="tdInputClass"
																	 type="text" placeholder="'-'를 제외하고 입력해주세요."
																	 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
																	 maxlength="11" style="width: 28%; height: 50%;"
																	 disabled="disabled" /></td>
					</tr>
					<tr>
						<th class="thNeed">국가</th>
						<td colspan="3"><select style="width: 28%;" id="ntilCdInput" disabled="disabled">
							<option value="KOR">대한한국</option>
							<option value="USA">미국</option>
							<option value="JPN">일본</option>
							<option value="CHN">중국</option>
							<option value="VNM">베트남</option>
							<option value="PHL">필리핀</option>
							<option value="PER">페루</option>
							<option value="PAK">파키스탄</option>

						</select></td>
					</tr>
					<tr>
						<th>참고내용</th>
						<td colspan="3"><textarea rows="4" id="ptntNoteTextInput"
																			style="width: 95%; resize: none;" maxlength="999"
																			disabled="disabled"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</main>

<script>
	document.getElementById("moblInput").value = "01012345678";
	var hsptId = null;
	console.log("first_hsptId :", hsptId);

	function calculateAge(brth) {
		// 현재 날짜를 생성
		var currentDate = new Date();

		// 연, 월, 일 차이 계산
		var ageInMillis = currentDate - new Date(brth);

		// 밀리초를 연으로 변환하고 나이 계산
		var ageInYears = ageInMillis / (365 * 24 * 60 * 60 * 1000);

		// 소수점 이하 자리를 버리고 정수로 변환
		var age = Math.floor(ageInYears);

		age += 1;

		return age;
	}

	$(document).ready(function() {
		$("#list1").jqGrid({
			url: "/pat/RIS1101E00.do",
			reordercolNames:true,
			postData : { type: 'A' },
			mtype:'POST',
			datatype : "json",
			colNames : [ "환자ID", "환자명", "성별", "나이", "생년월일" ],
			colModel : [
				{ name : "ptntId", index : "ptntId", width : 90, align : "center" },
				{ name : "ptntKrNm",index : "ptntKrNm", width : 100, align : "center" },
				{ name : "gndrDvsn", index : "gndrDvsn", width : 150, align : "center",},
				{ name : "brth", index : "brth", width : 80, align : "center",
					formatter: function (cellvalue, options, rowObject) {
						// 나이를 계산하여 표시
						var age = calculateAge(cellvalue);
						return age;
					}
				},
				{ name : "brth", index : "brth", width : 80, align : "center" },
			],
			jsonReader: {
				repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
				root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
				records:'records'  // 보여지는 데이터 개수(레코드) totalRecord
			},

			autowidth : true,
			height : "93%",
			rownumbers : true,
			multiselect : false,
			sortname : "id",
			sortorder : "asc",
			gridview : true, // 선표시 true/false
			viewsortcols : [ true,
				"vertical", true ],
			loadComplete : function(data) {
				console.log(data);
			}, // loadComplete END

			onSelectRow : function(rowid) {

				console.log("rowId :", rowid);

				// 선택한 rowId의 데이터 가져오기
				var selectRowData = jQuery("#list1").getRowData(rowid);
				console.log("selectRowData :", selectRowData)

				/*
        var allData = jQuery("#list1").getRowData();
        console.log("allData :" ,allData)
        */

				jQuery.ajax({
					type: 'POST',
					url : "/pat/RIS1101E00Detail.do",
					data : JSON.stringify(selectRowData),
					contentType: "application/json; charset=utf-8",
					dataType: 'json',

					success : function (result) {
						const { ptntId, ptntKrNm, ptntEnglNmF, ptntEnglNmM, ptntEnglNmL, brth, gndrDvsn, mobl, ntilCd, ptntNoteText } = result.rows

						document.getElementById("ptntIdInput").value = ptntId;
						document.getElementById("ptntKrNmInput").value = ptntKrNm;
						document.getElementById("ptntEnglNmFInput").value = ptntEnglNmF;
						document.getElementById("ptntEnglNmMInput").value = ptntEnglNmM;
						document.getElementById("ptntEnglNmLInput").value = ptntEnglNmL;
						document.getElementById("brthInput").value = brth;

						if(gndrDvsn==='M'){
							document.getElementById("gndrDvsnA").checked  = true;
							document.getElementById("gndrDvsnB").checked  = false;
						} else if(gndrDvsn==='F'){
							document.getElementById("gndrDvsnB").checked  = true;
							document.getElementById("gndrDvsnA").checked  = false;
						}

						document.getElementById("moblInput").value = mobl;
						document.getElementById("ntilCdInput").value = ntilCd;
						document.getElementById("ptntNoteTextInput").value = ptntNoteText;

						hsptId = result.rows.hsptId;
						console.log("result :" , result);
						console.log("hsptId :" , hsptId);
					},
					error : function (error) {
						console.log(error);
					}
				});
			},

			onSortCol : function(index,
													 idxcol, sortorder) {
				// 그리드 Frozen Column에 정렬 화살표 표시 안되는 버그 수정
				// (화살표 css 변경하기 전 Frozen을 풀어주고)
				$("#list1").jqGrid("destroyFrozenColumns");
				var $icons = $(this.grid.headers[idxcol].el).find(">div.ui-jqgrid-sortable>span.s-ico");
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


	// 검색 기능
	const searchGrid = function(value, grid) {
		// searchGrid 함수는 검색어(value)와 데이터 그리드(grid)의 ID를 인수로 받고,
		// 데이터 그리드를 검색어로 필터링하고 새로 고침하는 역할을 한다.
		$("#" + grid).jqGrid("setGridParam", {
			datatype: "json",
			page: 1
		}).trigger("reloadGrid");
		// 파라미터를 설정하고, 새로고침하여 페이지를 1로 설정하고, 데이터 타입을 JSON으로 변경한다.

		$("#" + grid).jqGrid("setGridParam", {
			// beforeProcessing 은 데이터를 처리하기 전에 호출되며, 데이터 그리드를 필터링한다.
			beforeProcessing: function(data) {
				if (value === "") {
					return;
				}

				var filteredData = [];

				for (var i = 0; i < data.rows.length; i++) {
					var rowData = data.rows[i];
					var matched = false;

					for (var key in rowData) {
						var cellValue = rowData[key];

						if (cellValue && cellValue.toString().replace(/\s+/g, "").toLowerCase().includes(value)) {
							matched = true;
							break;
						}
					}

					if (matched) {
						filteredData.push(rowData);
					}
				}
				data.rows = filteredData;
			}
		});
	};

	// list1 검색
	$("#inputKeyword").on("input", function() {
		var inputValue = $(this).val().replace(/\s+/g, "").toLowerCase();

		searchGrid(inputValue, "list1");
	});



	// flag를 선언
	var flag;


	// 수정버튼 이벤트
	document.getElementById("inputUpdate").addEventListener("click", function () {

		flag = 'U';

		// 환자명 - disabled 해제
		var ptntKrNmInputElement = document.getElementById("ptntKrNmInput");
		ptntKrNmInputElement.disabled = false;

		// 영문명 - disabled 해제
		var ptntEnglNmFInputElement = document.getElementById("ptntEnglNmFInput");
		var ptntEnglNmMInputElement = document.getElementById("ptntEnglNmMInput");
		var ptntEnglNmLInputElement = document.getElementById("ptntEnglNmLInput");
		ptntEnglNmFInputElement.disabled = false;
		ptntEnglNmMInputElement.disabled = false;
		ptntEnglNmLInputElement.disabled = false;

		// 생년월일 - disabled 해제
		var brthInputElement = document.getElementById("brthInput");
		brthInputElement.disabled = false;

		// 성별
		document.getElementById("gndrDvsnA").removeAttribute("onclick");
		document.getElementById("gndrDvsnB").removeAttribute("onclick");

		// 전화번호 - disabled 해제
		var moblInputElement = document.getElementById("moblInput");
		moblInputElement.disabled = false;

		// 국가 - disabled 해제
		var ntilCdInputElement = document.getElementById("ntilCdInput");
		ntilCdInputElement.disabled = false;


		// 참고내용 - disabled 해제
		var ptntNoteTextInputElement = document.getElementById("ptntNoteTextInput");
		ptntNoteTextInputElement.disabled = false;
	});


	// 입력버튼 이벤트
	document.getElementById("inputInsert").addEventListener("click", function () {

		flag = 'I';

		var ptntIdCheckElement = document.getElementById("ptntIdCheck");
		ptntIdCheckElement.disabled = false;

		// 환자 ID - disabled 해제
		var ptntIdInputElement = document.getElementById("ptntIdInput");
		ptntIdInputElement.disabled = false;

		// 환자명 - disabled 해제
		var ptntKrNmInputElement = document.getElementById("ptntKrNmInput");
		ptntKrNmInputElement.disabled = false;

		// 영문명 - disabled 해제
		var ptntEnglNmFInputElement = document.getElementById("ptntEnglNmFInput");
		var ptntEnglNmMInputElement = document.getElementById("ptntEnglNmMInput");
		var ptntEnglNmLInputElement = document.getElementById("ptntEnglNmLInput");
		ptntEnglNmFInputElement.disabled = false;
		ptntEnglNmMInputElement.disabled = false;
		ptntEnglNmLInputElement.disabled = false;

		// 생년월일 - disabled 해제
		var brthInputElement = document.getElementById("brthInput");
		brthInputElement.disabled = false;

		// 성별
		document.getElementById("gndrDvsnA").removeAttribute("onclick");
		document.getElementById("gndrDvsnB").removeAttribute("onclick");

		// 전화번호 - disabled 해제
		var moblInputElement = document.getElementById("moblInput");
		moblInputElement.disabled = false;

		// 국가 - disabled 해제
		var ntilCdInputElement = document.getElementById("ntilCdInput");
		ntilCdInputElement.disabled = false;


		// 참고내용 - disabled 해제
		var ptntNoteTextInputElement = document.getElementById("ptntNoteTextInput");
		ptntNoteTextInputElement.disabled = false;
	});


	// 저장버튼 이벤트
	document.getElementById("ris1101DataSave").addEventListener("click", function () {
		console.log("실제값", hsptId);
		// 데이터 가져오기
		var ptntId = document.getElementById("ptntIdInput").value;
		var ptntKrNm = document.getElementById("ptntKrNmInput").value;
		var ptntEnglNmF = document.getElementById("ptntEnglNmFInput").value;
		var ptntEnglNmM = document.getElementById("ptntEnglNmMInput").value;
		var ptntEnglNmL = document.getElementById("ptntEnglNmLInput").value;
		var brth = document.getElementById("brthInput").value;
		var gndrDvsn = document.querySelector('input[name="MF_btn"]:checked').value;
		var mobl = document.getElementById("moblInput").value;
		var ntilCd = document.getElementById("ntilCdInput").value;
		var ptntNoteText = document.getElementById("ptntNoteTextInput").value;

		if (ptntId === "") {
			alert("환자 ID를 입력하세요.")
		} else if (ptntKrNm === "") {
			alert("환자명을 입력하세요.")
		} else if (brth === "") {
			alert("생년월일을 입력하세요.")
		} else if (gndrDvsn === "") {
			alert("성별을 선택하세요.")
		} else if (ntilCd === "") {
			alert("국가를 선택하세요.")
		} else {
			var sendData = {
				flag: flag,
				hsptId: hsptId,
				ptntId: ptntId,
				ptntKrNm: ptntKrNm,
				ptntEnglNmF: ptntEnglNmF,
				ptntEnglNmM: ptntEnglNmM,
				ptntEnglNmL: ptntEnglNmL,
				brth: brth,
				gndrDvsn: gndrDvsn,
				mobl: mobl,
				ntilCd: ntilCd,
				ptntNoteText: ptntNoteText
			};

			$.ajax({
				type: 'POST',
				url: "/pat/RIS1101E00UpdateInsert.do",
				data: JSON.stringify(sendData),
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				success: function (result) {
					console.log("데이터 전송 성공: ", result);
				},
				error: function (error) {
					console.log("데이터 전송 실패: ", error);
				}
			});
		}
	});


	// 중복확인
	document.getElementById("ptntIdCheck").addEventListener("click", function () {

		var ptntId = document.getElementById("ptntIdInput").value;

		if (ptntId === "") {
			// 입력된 환자 ID 가 없을 때 경고 메시지 출력
			alert("ID 값을 입력하세요.")
		} else {
			var sendPtntId = {ptntId};
			console.log(sendPtntId)

			$.ajax({
				type: 'POST',
				url: "/pat/RIS1101E00PtntIdCheck.do",
				data: JSON.stringify(sendPtntId),
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				success: function (result) {
					console.log("result :", result)

					if (result.result === "impossible") {
						return alert("중복된 ID 입니다.");
					} else if (result.result === "possible") {
						alert("사용 가능한 ID 입니다.");
					}
				},
				error: function (error) {
					console.log("error :", error)
				}
			});
		}
	});

</script>
</body>
</html>
