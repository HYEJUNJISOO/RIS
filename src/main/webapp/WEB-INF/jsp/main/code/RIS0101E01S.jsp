<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt_rt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소분류 코드상세</title>
<link rel="stylesheet" type="text/css" href="/css/code/RIS0101E01.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
</head>
	<body>
	<form commandName="VO" id="savefrm" name="savefrm" method="post">
		<input type="hidden" name="iud"      	  value=""/>
		<input type="hidden" name="checkLMS"      value=""/>
		<input type="hidden" name="hspt_id"       value=""/>
		<input type="hidden" name="lrgc_cd"       value=""/>
		<input type="hidden" name="mddl_cd"       value=""/>
		<input type="hidden" name="smll_cd"       value=""/>
		<input type="hidden" name="mddl_kr_nm"    value=""/>
		<input type="hidden" name="mddl_acph"     value=""/>
		<input type="hidden" name="smll_kr_nm"    value=""/>
		<input type="hidden" name="otpt_sqnc"     value=""/>
		<input type="hidden" name="appl_date"     value=""/>
		<input type="hidden" name="expr_date"     value=""/>
		<input type="hidden" name="currdate" value=""/>
		<input type="hidden" name="q_user_id" id="q_user_id" value="admin"/>
	</form>

	<!-- Main 화면 영역  Start -->

	<!-- 검색영역 설정 Start -->
	<div class="inquiry__page-flex mt5">
		<section class="inquiry__search-section">
			<div class="inquiry__search-flex" style="justify-content:space-between;"> <!-- 1 Row -->
				<div class="box__flex">
					<a href="javascript:fn_query()" class="ml-2">
						<button class="all__btn img__btn mokrok__btn">목록</button>
					</a>

					<a href="javascript:fn_goto('L');" class="ml-2">
						<button class="all__btn img__btn detail__btn">대분류코드</button>
					</a>
					<a href="javascript:fn_goto('M');" class="ml-2">
						<button class="all__btn img__btn detail__btn">중분류코드</button>
					</a>
				</div>
				<div class="box__flex">
					<a href="javascript:fn_update('S');" class="ml-2">
						<button class="all__btn img__btn img__btn update__btn">수정</button>
					</a>
					<a href="javascript:fn_expr('D');" class="ml-2">
						<button class="all__btn img__btn bullyong__btn">불용</button>
					</a>
					<a href="javascript:fn_delete('D');" class="ml-2">
			    		<button class="all__btn img__btn delete__btn">삭제</button>
					</a>
				</div>
			</div>
		</section>
		<!-- 검색영역 설정 End -->

		<!-- Data 영역설정 Start -->
		<section class="inquiry__result-section mt5">

		<div class="fl-L grid1 mx-1" style="width:100%;"> <!-- width은 화면에 맞춰서 조절 -->
		<form commandName="VO" id="regfrm" name="regfrm" method="post">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<input type="hidden" name="currdate" id="currdate" value=""/>
			<input type="hidden" name="q_user_id" id="q_user_id" value="admin"/>
			<input type="hidden" name="checkLMS" id="checkLMS" value="S"/>
			<input type="hidden" name="hspt_id" id="hspt_id" value="<c:out value="${result.hsptId}"/>"/>
			<input type="hidden" name="lrgc_cd" id="lrgc_cd" value="<c:out value="${result.lrgcCd}"/>"/>
			<input type="hidden" name="mddl_cd" id="mddl_cd" value="<c:out value="${result.mddlCd}"/>"/>
			<input type="hidden" name="smll_cd" id="smll_cd" value="<c:out value="${result.smllCd}"/>"/>
			<input type="hidden" name="expr_date" id="expr_date" value="<c:out value="${result.exprDate}"/>"/>
			<input type="hidden" name="q_smll_cd" id="q_smll_cd" value="<c:out value="${result.smllCd}"/>"/>
			<input type="hidden" name="q_mddl_cd" id="q_mddl_cd" value="<c:out value="${result.mddlCd}"/>"/>
			<input type="hidden" name="q_lrgc_cd" id="q_lrgc_cd" value="<c:out value="${result.lrgcCd}"/>"/>
			<table class="table table-hover table-dark" style="width:100%;table-layout: fixed;">
					<colgroup>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
				    	<col width="10%"/>
					</colgroup>
					<tbody>
							<tr>
									<th colspan="2">대분류 코드</th>
									<td colspan="4"><c:out value="${result.hsptId}"/></td>
									<th colspan="2">대분류 한글 명</th>
									<td colspan="2"><c:out value="${result.smllKrNm}"/></td>
							</tr>
							<tr>
								<th colspan="2">대분류 영어 명</th>
								<td colspan="4"><c:out value="${result.smllEnglNm}"/></td>
								<th colspan="2">대분류 약어 명</th>
								<td colspan="2"><c:out value="${result.smllAbbrNm}"/></td>
							</tr>
							<tr>
								<th colspan="2">출력순</th>
								<td colspan="2"><c:out value="${result.otptSqnc}"/></td>
							</tr>
							<tr>
								<th colspan="2">적용일자</th>
								<td colspan="4"><c:out value="${result.applDate}"/></td>
								<th colspan="2">불용일자</th>
								<td colspan="2"><c:out value="${result.exprDate}"/></td>
							</tr>
							<tr>
									<th colspan="2" style="vertical-align: middle;">문자값1</th>
										<td colspan="4">
											<textarea rows="3" cols="1000" style="width: 100%;"><c:out value="${result.chrc1}"/></textarea>
										</td>
									<th colspan="2" style="vertical-align: middle;">숫자값1</th>
									<td colspan="2" style="vertical-align: middle;"><c:out value="${result.nmbr1}"/></td>
							</tr>
							<tr>
								<th colspan="2" style="vertical-align: middle;">문자값2</th>
									<td colspan="4">
										<textarea rows="3" cols="" style="width: 100%;"><c:out value="${result.chrc2}"/></textarea>
									</td>
									<th colspan="2" style="vertical-align: middle;">숫자값2</th>
									<td colspan="2" style="vertical-align: middle;"><c:out value="${result.nmbr2}"/></td>
							</tr>
							<tr>
								<th colspan="2" style="vertical-align: middle;">문자값3</th>
									<td colspan="4" style="vertical-align: middle;">
										<textarea rows="3" cols="0" style="width: 100%;"><c:out value="${result.chrc3}"/></textarea>
									</td>
									<th colspan="2" style="vertical-align: middle;">숫자값3</th>
									<td colspan="2" style="vertical-align: middle;"><c:out value="${result.nmbr3}"/></td>
								</tr>
								<tr>
									<th colspan="2" style="vertical-align: middle;">문자값4</th>
										<td colspan="4">
											<textarea rows="3" cols="" style="width: 100%;"><c:out value="${result.chrc4}"/></textarea>
										</td>
										<th colspan="2" style="vertical-align: middle;">숫자값4</th>
										<td colspan="2" style="vertical-align: middle;"><c:out value="${result.nmbr4}"/></td>
								</tr>
								<tr>
									<th colspan="2" style="vertical-align: middle;">문자값5</th>
										<td colspan="4">
											<textarea rows="3" cols="" style="width: 100%;"><c:out value="${result.chrc5}"/></textarea>
										</td>
										<th colspan="2" style="vertical-align: middle;">숫자값5</th>
										<td colspan="2" style="vertical-align: middle;"><c:out value="${result.nmbr5}"/></td>
								</tr>
					</tbody>
			</table>
			</c:forEach>
		</form>
		    <!-- 두개 Grid 처리(좌측,우측) -->
		    </div>

		</section>
	</div>

		<script type="text/javaScript" language="javascript">
			var jsonData = ${data};
			console.log(jsonData);

      var i18n = JSON.parse('{"text_371":"","text_370":"","text_131":"건진","text_373":"","text_130":"입원","text_372":"","text_133":"예외구분","text_375":"","text_132":"예약 변동내역","text_374":"","text_124":"촬영실별","text_366":"","text_123":"촬영부위별","text_365":"","text_126":"예약기준 적용","text_368":"","text_125":"예약일자","text_367":"","text_128":"요일설정","text_127":"예약기준 삭제","text_369":"","text_129":"외래","text_360":"","text_120":"입원예약가능 ","text_362":"","text_361":"","text_122":"선택진료여부 ","text_364":"","text_121":"외래예약가능 ","text_363":"","text_113":"촬영부위","text_355":"","text_112":"촬영구분","text_354":"","text_115":"촬영방향","text_357":"","text_114":"통계부위","text_356":"","text_117":"입원촬영실","text_359":"","text_116":"처방코드  ","text_358":"","text_119":"이동촬영가능","text_118":"안내장서식","text_391":"","text_390":"","text_151":"희망시간","text_393":"","text_150":"희망일","text_392":"","text_153":"예약시간","text_395":"","text_152":"예약일","text_394":"","text_155":"처방참고내용","text_397":"","text_154":"처방을 선택하세요","text_396":"","text_146":"처방일","text_388":"","text_145":"환자명","text_387":"","text_148":"진료과","text_147":"처방명","text_389":"","text_149":"처방의사","text_380":"","text_140":"휴일 일자","text_382":"","text_381":"","text_142":"환자정보검색","text_384":"","text_141":"휴일 내용","text_383":"","text_144":"수납","text_386":"","text_143":"예약","text_385":"","text_135":"시작","text_377":"","text_134":"변동사유","text_376":"","text_137":"예외일자","text_379":"","text_136":"종료","text_378":"","text_139":"휴일 목록","text_138":"예외사유","text_171":"처방일","text_170":"처방상태","text_173":"접수시간","text_172":"접수일자","text_175":"수납","text_174":"응급","text_177":"검사예약현황","text_176":"DC","text_168":"참고내용","text_167":"국가","text_169":"영문명","text_160":"가예약여부","text_162":"미예약","text_161":"전체","text_164":"성별","text_163":"등록번호","text_166":"생년월일","text_165":"나이","text_157":"총 인원","text_399":"","text_156":"예약참고내용","text_398":"","text_159":"환자ID","text_158":"내원구분","text_191":"촬영구분","text_190":"정형문 코드","text_193":"공용코드","text_192":"판독약어명","text_195":"환자정보 ","text_194":"촬영일자 ","text_197":"판독시간","text_196":"판독일자","text_199":"음성판독여부","text_198":"판독의사","text_189":"의사ID","text_180":"방사선사","text_182":"병동","text_181":"영상 CD접수 관리","text_184":"재촬영","text_183":"병실","text_186":"처방 목록","text_185":"이동촬영","text_188":"처방 정보 상세","text_187":"환자 기본정보","text_179":"이동촬영접수 관리","text_178":"환자목록","message_199":"불용 처리할 정보를 선택해주세요.","message_198":"수정할 코드를 선택해주세요","message_191":"등록/수정중인 정보가 있습니다.저장 완료 후 다시 시도해주세요.","message_190":"프로그램 유형을 선택해주세요!","message_193":"대분류 코드를 입력해주세요.","message_192":"소분류 코드를 선택해주세요.","message_195":"대분류 코드 중복확인을 해주세요.","message_194":"불용일자는 적용일자보다 낮을 수 없습니다.","message_197":"중분류 자릿수를 입력해주세요","message_196":"중분류 한글 명을 입력해주세요","message_188":"해당 메뉴그룹 ID 정보가 등록되어 있습니다.","message_187":"숫자가 아닙니다.","message_189":"다른 정보를 먼저 저장해주세요.","message_180":"[구 분] 항목에서 판독을 선택 후다시 시도해주세요.","message_182":"저장 안 된정보가 있습니다. 저장하시겠습니까?","message_181":"자료 조회중입니다. 잠시만 기다리세요...","message_184":"메뉴 그룹ID 정보를 먼저 선택하세요!","message_183":"메뉴정보를 먼저 저장해주세요!","message_186":"이미 등록된 정보는 삭제가 불가합니다.","message_185":"이미 등록된 정보입니다.","message_177":"판독중인 내용이 아닙니다.","message_176":"입력하신 정보가 저장되지 않았습니다.다시 시도해주세요.","message_179":"이미 판독이 완료 되었습니다.","message_178":"판독 취소가 완료되었습니다.","message_171":"[구분] 항목에서 미판독/판독을 선택 후 다시 시도해주세요.","message_170":"의사ID를 선택해주세요","message_173":"판독이 완료된 내용은 판독의사만 수정이 가능합니다.","message_172":"이미 판독이 완료된 환자입니다.","message_175":"음성파일 또는 판독내용을 입력해주세요.","message_174":"수정버튼을 눌러주세요.","message_166":"사용자 등급이 낮아 수정할 수 없습니다.","message_165":"정형문 코드가 존재하지않습니다.","message_168":"사용자 등급이 낮아 수정할 수 없습니다.","message_167":"수정할 정보가 존재하지 않습니다.","message_169":"X번 행에 Y코드는 중복되는 코드입니다. 다른 코드를 사용해주세요.","message_160":"의사정보를 입력하세요!","message_162":"정상 저장되었습니다.","message_161":"같은날짜에 중복된 환자의 처방 정보가 있습니다. 확인해주세요.","message_164":"처방일자가 현재일자보다 과거날짜입니다.","message_163":"환자정보가 없습니다. 먼저 환자를 등록하세요.","message_155":"처방일자이 현재일자보다 과거날짜입니다.","message_154":"수정할 처방 정보를 선택해주세요.","message_157":"내원정보를 입력하세요!","message_156":"환자정보를 입력하세요!","message_159":"진료과정보를 입력하세요!","message_158":"처방일자를 입력하세요!","message_151":"처방 등록된 환자 정보가 존재하지않습니다.","message_150":"의사정보","message_153":"입력중엔 수정할 수 없습니다.","message_152":"환자정보를 먼저 입력하세요!","message_144":"처방 취소는 하지 못합니다.","message_143":"처리할 접수내역이 없습니다.","message_146":"예약할 검사정보가 존재하지 않습니다.","message_145":"처리할 취소내역이 없습니다.","message_148":"접수 처리 하시겠습니까?","message_147":"검색구분이 전체 접수/취소 할 수 없습니다.","message_149":"자료가 존재하지 않습니다.","message_140":"조회일자를 확인하세요.","message_142":"접수 처리 하시겠습니까?","message_141":"처방상태가 처방인 경우에만 접수처리할 수 있습니다.","message_133":"환자 등록 번호를 입력하세요","message_132":"환자 명을 입력하세요","message_135":"사용가능한 환자 등록 번호 입니다.","message_134":"중복된 환자 등록 번호 입니다.","message_137":"이미 등록된 환자입니다.","message_136":"생년월일을 입력하세요","message_139":"DC처리된 검사입니다!","message_138":"미수납된 검사입니다!","message_131":"성별을 선택해주세요","message_130":"중복확인을 다시 해주세요.","message_129":"중복된 번호 입니다.","message_122":"취소할 예약을 선택해주세요","message_121":"예약을 변경했습니다.","message_124":"예약을 정말 취소하시겠습니까?","message_123":"예약이 안된 처방입니다.","message_126":"예약 가능 수를 초과하여 예약 할 수 없습니다.","message_125":"예약이 취소되었습니다.","message_128":"사용 가능한 번호 입니다.","message_127":"등록된 환자 정보가 존재하지않습니다.","message_120":"예약되었습니다","message_119":"예약일이 처방일보다 먼저입니다. 다른 날짜를 선택해주세요","message_118":"이미 예약이 생성된 처방입니다. 예약을 변경하시겠습니까?","message_111":"저장 완료 후 삭제해주세요.","message_110":"조회 종료일은 조회 시작일 보다 높을 수 없습니다. 다시 선택해주세요.","message_113":"총 X 건중 Y 건이 처리되었습니다.","message_112":"X 행의 중복된 정보가 있습니다.","message_115":"환자 정보 조회","message_114":"환자 ID 또는 성명을 입력 후 검색하세요.","message_117":"예약할 시간을 선택해주세요","message_116":"예약할 처방을 선택해주세요","message_108":"해당 기간의 예약시간을 삭제하시겠습니까?","message_107":"해당 기간의 예약시간을 적용하시겠습니까?","message_109":"예외 정보가 존재하지않습니다.","message_100":"X 행의 시작시간이 Y 행의 스케쥴과 겹칩니다.","message_102":"기존의 예약기준과 겹쳐 생성할 수 없습니다.","message_101":"X 행의 정보 저장시 오류가 발생하였습니다.","message_104":"시간 입력이 잘못되었습니다.","message_103":"이미 적용된 예약기준이 있습니다. 필요시 삭제후 적용하시기 바랍니다.","message_106":"오류발생!","message_105":"유효하지 않은 간격입니다.","button_022":"다운로드","button_021":"음성듣기","button_020":"복사","button_026":"임시저장","button_025":"비우기","button_024":"판독취소","button_023":"판독완료","button_029":"일시정지","button_028":"녹음","button_027":"음성파일 업로드","button_011":"상세","button_010":"하위메뉴","message_310":"","button_015":"중복확인","button_014":"새로고침","button_013":"불용","button_012":"목록","button_019":"붙여넣기","button_018":"처방추가","button_017":"예약","button_016":"접수","message_306":"","message_305":"","message_308":"","message_307":"","message_309":"","message_300":"","message_302":"","button_004":"취소","message_301":"","button_003":"변경","message_304":"","button_002":"비밀번호 변경","message_303":"","button_001":"로그인","button_008":"저장","button_007":"입력","button_006":"삭제","button_005":"수정","button_009":"초기화","colname_005":"시작일","colname_004":"권한","colname_007":"오류횟수","colname_006":"종료일","text_401":"","text_400":"","text_403":"","text_402":"","text_405":"","text_404":"","text_407":"","text_406":"","text_409":"","text_408":"","text_430":"","text_421":"","text_420":"","text_423":"","text_422":"","text_425":"","text_424":"","text_427":"","text_426":"","text_429":"","text_428":"","text_410":"","text_412":"","text_411":"","text_414":"","text_413":"","text_416":"","text_415":"","text_418":"","text_417":"","text_419":"","text_210":"종료시간","text_201":"판독내용","text_200":"방사선사","text_203":"보류","text_202":"판독이력","text_205":"판독임시저장","text_204":"취소","text_207":"내용","text_206":"판독완료","text_209":"시작시간","text_208":"미판독","text_432":"","text_431":"","text_433":"","text_230":"로그아웃","text_232":"환자검색","text_231":"사용자","text_223":"소분류 코드 명","text_222":"중분류 코드 명","text_225":"소분류 영어 명","text_224":"중분류 영어 명","text_227":"소분류 약어 명","text_226":"중분류 약어 명","text_229":"메뉴재생성","text_228":"업무메뉴","text_221":"메뉴권한","text_220":"메뉴그룹ID","text_212":"예약 예외 목록","text_211":"조회일자","text_214":"수정","text_213":"입력","text_216":"메뉴ID","text_215":"삭제","text_218":"메뉴명","text_217":"순서","text_219":"입력된 값","text_250":"적용 영문명","text_010":"기준정보입력관리","text_252":"요일","text_251":"필수입력","text_012":"촬영실장비관리","text_254":"월","text_011":"촬영실관리","text_253":"년","text_003":"변경 비밀번호","text_245":"엑셀 다운로드","text_002":"현재 비밀번호","text_244":"엑셀 업로드","text_005":"업무메뉴","text_247":"촬영실","text_004":"변경 비밀번호 확인","text_246":"복사","text_007":"로그아웃","text_249":"적용명","text_006":"메뉴 재생성","text_248":"컬럼 명","text_009":"공통코드관리","text_008":"기준정보관리","text_241":"영문 명","text_240":"관리","text_001":"비밀번호 변경","text_243":"불용","text_242":"촬영코드","text_234":"워크리스트","text_233":"영상 실시 관리","text_236":"메뉴정보 관리","text_235":"촬영실별 통계","text_238":"코드","text_237":"코드등록","text_239":"코드 명","text_270":"일","text_030":"영상 판독문구 관리","text_272":"예약 상세정보","text_271":"예약 여부","text_032":"각종통계현황","text_274":"노트","text_031":"영상 판독관리","text_273":"예약 취소","text_034":"판독의별 통계","text_276":"처방","text_033":"장비별 통계","text_275":"사용자 ID","text_025":"영상 접수 관리","text_267":"목","text_024":"환자 정보 관리","text_266":"수","text_027":"이동촬영 접수","text_269":"토","text_026":"CD 접수 관리","text_268":"금","text_029":"판독관리","text_028":"처방 정보 관리","text_261":"휴게시간","text_260":"간격","text_021":"휴일 기준 관리","text_263":"월 ~ 금 일괄적용","text_020":"예외 기준 관리","text_262":"분","text_023":"환자 관리","text_265":"화","text_022":"예약 관리","text_264":"월","text_014":"관리자메뉴","text_256":"생성구분","text_013":"촬영코드관리","text_255":"시간 설정","text_016":"프로그램 정보 관리","text_258":"추가 생성","text_015":"사용자관리","text_257":"새로 생성","text_018":"예약 스케쥴 관리","text_017":"사용자별 메뉴 관리","text_259":"기준 생성","text_019":"예약 기준 관리","text_290":"전년","text_050":"진단검사","text_292":"총 합계","text_291":"소 계","text_052":"메뉴","text_294":"조회년도","text_051":"선택","text_293":"월별 합계","text_054":"조회","text_296":"프로그램 정보","text_053":"등록","text_295":"장비 명","text_056":"배치","text_298":"닫기","text_055":"출력","text_297":"검색어 입력","text_047":"사용","text_289":"합계","text_046":"호출방식","text_288":"접수일자 조회","text_049":"영상의학","text_048":"완료","text_281":"검색구분","text_280":"접수자","text_041":"시스템ID","text_283":"촬영자","text_040":"검색조건 입력","text_282":"촬영시간","text_043":"프로그램명","text_285":"예약 및 접수","text_042":"프로그램ID","text_284":"인쇄","text_045":"화면유형","text_287":"예약일자 조회","text_044":"프로그램 URL","text_286":"처방일자 조회","text_036":"사용자 현황","text_278":"실시","text_035":"사용자 명","text_277":"접수","text_038":"비밀번호 초기화","text_037":"비밀번호 초기화","text_279":"판독","text_039":"프로그램 등록 현황","text_070":"슈퍼관리자","text_072":"의사","text_071":"관리자","text_074":"메뉴그룹 현황","text_073":"방사선사","text_076":"구분","text_075":"메뉴 그룹 정보","text_078":"즐겨찾기 목록","text_077":"프로그램 등록현황","text_069":"먼저 사용자 정보를 선택하세요!","text_068":"정렬순서","message_099":"X 행의 값이 잘못 입력되었습니다.","message_092":"적용날자 입력이 잘못되었습니다","text_061":"메뉴 목록","message_091":"불용일자 입력이 잘못되었습니다","text_060":"검색어 입력","message_094":"입력 또는 수정 버튼을 눌러주세요!","text_063":"메뉴그룹명","message_093":"정상적으로 입력되었습니다.","text_062":"해당 프로그램 목록","message_096":"조회된 정보가 없습니다.","text_065":"사용자 정보 목록","message_095":"중복된 촬영코드입니다","text_064":"상위메뉴","message_098":"수정할 정보가 존재하지 않습니다.","text_067":"유효여부","message_097":"삭제할 행이 없습니다.","text_066":"메뉴 정보 목록","text_058":"팝업화면","text_057":"메인화면","text_299":"코드 명 검색","text_059":"메뉴헤더","message_090":"일자 입력이 잘못되었습니다","message_089":"촬영코드를 선택해 주세요.","message_088":"코드를 입력해주세요.","text_090":"문자값","text_092":"입력명","text_091":"숫자값","message_081":"소분류 한글 명을 입력하세요!","text_094":"선택대분류코드","message_080":"대분류 코드 추가 입력하시겠습니까?","text_093":"입력값","message_083":"등록된 정보가 존재하지않습니다.","text_096":"촬영실 코드 관리","message_082":"수정한 정보를 저장하시겠습니까?","text_095":"컬럼적용구분","message_085":"N행 [적용명]을 입력해주세요.","text_098":"상세정보","message_084":"기존에 저장된 정보가 손상될 수 있습니다. 정말 수정 하시겠습니까?","text_097":"촬영실 한글 명","message_087":"N행 [입력명1], [입력값1]을 입력해주세요.","message_086":"N행 [선택대분류코드]를 선택해주세요.","text_099":"촬영실 영문 명","colname_001":"사용자ID","colname_003":"비밀번호","colname_002":"사용자명","message_078":"불용일자를 입력하세요!","message_077":"적용일자를 입력하세요!","message_079":"아이디가 변경되었습니다.중복확인을 다시해주세요.","text_081":"중분류 코드","text_080":"소분류 코드","message_070":"사용 가능한 코드 입니다","text_083":"자릿수","text_082":"대분류 한글 명","message_072":"날짜는 yyyy-mm-dd 형식으로 입력해주세요","text_085":"적용일자","message_071":"이미 사용중인 코드 입니다.다른 코드를 사용해주세요.","text_084":"출력순","message_074":"대분류 한글 명을 입력하세요!","text_087":"대분류 한글 명","message_073":"대분류 코드를 입력하세요!","text_086":"불용일자","message_076":"출력 순서를 입력하세요!","text_089":"대분류 약어 명","message_075":"대분류 자릿수를 입력하세요!","text_088":"대분류 영어 명","text_079":"대분류 코드","message_067":"삭제가 완료 되었습니다.","message_066":"정말 삭제하시겠습니까?","message_069":"등록/수정중인 정보가 있습니다. 무시하고 이동하시겠습니까?","message_068":"하위코드가 존재합니다. 하위코드 삭제 후 다시 시도해주세요.","message_061":"불용 처리가 완료 되었습니다.","message_060":"정말 불용 처리 하시겠습니까?","message_063":"X 번 행에 미 입력/오류 사항이 있습니다 다시 입력해주세요.","message_062":"X 번 행에 Y 코드는 중복되는 코드입니다. 다른 코드를 사용해주세요.","message_065":"변경할 정보가 없습니다.","message_064":"X 번 행에 불용일자는 적용일자보다 낮을 수 없습니다.","message_056":"검색","message_298":"","message_055":"소분류 코드 항목을 선택해주세요.","message_297":"","button_032":"임시저장","message_058":"중분류 코드 등록/수정중인 정보가 있습니다. 저장 후 다시 시도해주세요.","button_031":"완료","message_057":"소분류 코드 등록/수정중인 정보가 있습니다. 저장 후 다시 시도해주세요.","message_299":"","button_030":"일시정지 해제","message_059":"이 코드의 추가적인 하위코드를 입력할 수 없습니다.","message_290":"","message_050":"중분류 코드를 선택해주세요.","message_292":"","message_291":"","message_052":"소분류 코드가 존재하지않습니다.","message_294":"","message_051":"중분류 코드가 존재하지않습니다.","message_293":"","message_054":"중분류 코드 항목을 선택해주세요.","message_296":"","message_053":"대분류 코드 항목을 선택해주세요.","message_295":"","message_045":"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요!","message_287":"","message_044":"메뉴 권한정보을 입력하세요!","message_286":"","message_047":"이미 즐겨찾기 정보에 등록되었습니다!","message_289":"","message_046":"N 행의 순서를 입력해주세요!","message_288":"","message_049":"대분류 코드를 선택해주세요.","message_048":"대분류 코드가 존재하지않습니다.","message_281":"","message_280":"","message_041":"메뉴 그룹ID을 입력하세요!","message_283":"","message_040":"행의 메뉴그룹ID 를 선택해 주세요!","message_282":"","message_043":"메뉴 ID명을 입력하세요!","message_285":"","message_042":"메뉴 ID을 입력하세요!","message_284":"","message_034":"메뉴ID을 입력하세요!","message_276":"","message_033":"자료가 존재하지않습니다.","message_275":"","message_036":"X행의 정보 저장시 오류가 발생하였습니다.","message_278":"","message_035":"메뉴명을 입력하세요!","message_277":"","message_038":"선택한 정보가 존재하지 않습니다.","message_037":"프로그램ID을 입력하세요!","message_279":"","message_039":"행의 메뉴그룹ID가 중복되었습니다!","message_270":"","message_030":"저장할 정보가 존재하지 않습니다.","message_272":"","message_271":"","message_032":"메뉴 그룹명을 입력하세요!","message_274":"","message_031":"메뉴 그룹ID을 입력하세요!","message_273":"","message_023":"삭제시 메뉴도 같이 삭제됩니다. 해당 프로그램 정보를 삭제하시겠습니까?","message_265":"","message_022":"비밀번호가 초기화되었습니다.","message_264":"","message_025":"총 X 건이 처리되었습니다.","message_267":"","message_024":"해당 프로그램 ID 정보가 등록되어 있습니다!","message_266":"","message_027":"프로그램ID를 입력하세요!","message_269":"","message_026":"시스템정보를 선택하세요!","message_268":"","message_029":"프로그램 URL을 입력하세요!","message_028":"프로그램명을 입력하세요!","message_261":"","message_260":"","message_021":"사용자 정보를 확인하세요!","message_263":"","message_020":"비밀번호를 초기화하시겠습니까?","message_262":"","message_019":"수정할 정보가 존재하지 않습니다.","message_012":"로그인 후 이용해 주세요!","message_254":"","message_011":"변경할 비밀번호가 상이합니다. 확인 후 다시 입력하세요!","message_253":"","message_014":"삭제할 수 없는 정보입니다.","message_256":"","message_013":"X행 미입력 사항이 있습니다.","message_255":"","message_016":"저장할 정보가 없습니다.","message_258":"","message_015":"자료조회중입니다. 잠시만 기다려주세요","message_257":"","message_018":"처리구분을 확인하세요!","message_017":"삭제할 정보가 존재하지 않습니다.","message_259":"","message_250":"","message_010":"이전 비밀번호를 입력하세요!","message_252":"","message_251":"","message_009":"사용자 번호를 확인해주세요!","message_008":"비밀번호를 변경하시겠습니까?","message_001":"사용자 ID를 입력하세요!","message_243":"","message_242":"","message_003":"입력한 사용자 비밀번호가 다릅니다! 비밀번호 확인 후 다시 입력하세요.","message_245":"","message_002":"비밀번호를 입력하세요!","message_244":"","message_005":"사용 종료된 ID 입니다.","message_247":"","message_004":"비밀번호 5회 이상 잘못 입력하였습니다. 관리자에게 문의하시길 바랍니다!","message_246":"","message_007":"정상 처리되었습니다. 다시 로그인하세요!","message_249":"","message_006":"사용자 ID 정보가 존재하지 않습니다.","message_248":"","message_241":"프로그램을 먼저 선택해주세요.","message_240":"하위 프로그램을 먼저 삭제해주세요","message_239":"이미 메뉴그룹 정보에 등록되었습니다.","message_232":"엑셀 파일만 업로드 가능합니다.","message_231":"엑셀 파일을 선택해 주세요.","message_234":"엑셀 업로드 후 저장 해 주세요.","message_233":"업로드 하시겠습니까?","message_236":"적용기간 내 동일한 촬영코드가  중복됩니다. 적용기간을 수정해주세요","message_235":"정보 변경은 촬영 코드 관리화면에서만 가능합니다.","message_238":"오류가 발생했습니다. 다시 시도해 주세요.","message_237":"엑셀 파일 양식이 올바르지 않습니다.","message_230":"엑셀 파일을 업로드 해 주세요","message_229":"검색어를 입력해주세요.","message_228":"처방 정보를 선택해주세요.","message_221":"통계 자료가 존재하지않습니다.","message_220":"접수 취소는 하지 못합니다.","message_223":"수정할 정보를 선택해주세요.","message_222":"\u0027-\u0027를 제외하고 입력해주세요.","message_225":"삭제할 행을 선택해주세요","message_224":"환자ID를 입력해주세요","message_227":"[구 분] 항목에서 미판독을 선택 후 다시 시도해주세요.","message_226":"정말 취소하시겠습니까?","message_218":"실시 처리 하시겠습니까?","message_217":"처방상태가 접수인 경우에만 실시처리할 수 있습니다.","message_219":"처리할 실시내역이 없습니다.","message_210":"유효하지 않은 날자입니다.","message_212":"해당 작업의 실행권한이 없습니다!","message_211":"환자정보가 없습니다!","message_214":"검색구분을 접수, 취소 중 하나를 선택해주세요.","message_213":"취소 처리 하시겠습니까?","message_216":"이미 실시된 처방입니다.","message_215":"췰영명을 입력해주세요.","message_207":"불용일자가 적용일보다 더 커서 불용처리 할 수 없습니다.","message_206":"이미 불용처리된 촬영코드입니다","message_209":"삭제되었습니다.","message_208":"X 입력이 필요합니다.","message_201":"삭제할 코드를 선택해주세요","message_200":"코드를 불용 처리 하시겠습니까?","message_203":"X 을(를) 선택해주세요.","message_202":"코드를 삭제 처리 하시겠습니까?","message_205":"중복확인을 해주세요!","message_204":"X 을(를) 입력하세요!","text_300":"음성녹음","text_302":"환자정보 목록","text_301":"업로드","text_304":"전화번호","text_303":"환자 상세정보","text_306":"여","text_305":"남","text_308":"판독임시저장","text_307":"음성판독","text_309":"보류","text_331":"사용자 목록","text_330":"초기화 후 저장","text_322":"선택진료","text_321":"입원 예약","text_324":"비고","text_323":"이동촬영","text_326":"중복","text_325":"신규","text_328":"양식 다운로드","text_327":"엑셀 파일 선택","text_329":"신규 코드 추가","text_320":"외래 예약","text_311":"구분","text_310":"취소","text_313":"판독정형문","text_312":"PACS 뷰어 조회","text_315":"부위코드","text_314":"촬영코드 검색","text_317":"통계 코드","text_316":"촬영실 코드","text_319":"서식 코드","text_318":"방향 코드","text_351":"","text_350":"","text_111":"촬영약어명","text_353":"","text_110":"촬영명","text_352":"","text_102":"촬영실 장비","text_344":"","text_101":"촬영실 정보","text_343":"","text_104":"촬영실","text_346":"","text_103":"촬영실 장비 코드 관리","text_345":"","text_106":"장비영문명","text_348":"","text_105":"장비한글명","text_347":"","text_108":"촬영횟수 ","text_107":"사용여부","text_349":"","text_109":"촬영영어명","text_340":"기준정보 입력관리","text_100":"촬영실 촬영구분","text_342":"","text_341":"","text_333":"기간","text_332":"출력일","text_335":"출력 건수","text_334":"출력자","text_337":"예외","text_336":"휴일","text_339":"기능 명","text_338":"프로그램 기능 권한 관리"}');
      if(i18n == null){
        //alert(i18n.message_012); //"로그인 후 이용해주세요"
        document.chkfrm.action = "/index.do";
        document.chkfrm.submit();
      }
			function applpicker(element) {
				$(element).datepicker({
					id: 'endDate_datePicker',
					dateFormat: 'yy-mm-dd',
					maxDate: new Date(3000, 1, 1),
					yearRange: 'c-30:c+30',
					changeYear: true,
					changeMonth: true,
					showOn: 'focus',
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				});
			}

			function exprpicker(element) {
				$(element).datepicker({
					id: 'endDate_datePicker',
					dateFormat: 'yy-mm-dd',
					maxDate: new Date(3000, 1, 1),
					yearRange: 'c-30:c+30',
					changeYear: true,
					changeMonth: true,
					showOn: 'focus',
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				});
			}

			function onlyint(element) {		// 입력시 숫자만 받기
				$(element).keyup(function(){
					var val1 = element.value;
					var num = new Number(val1);
					if(isNaN(num)){
						element.value = '';
					}
					if(num > 20){
						element.value = 20;
					}
				})
			}// onlyInt END


			var mddl_rowid = 0;
			var q_lrgc_cd = "";
			var q_mddl_cd = "";
			var q_smll_cd = "";
			var currdate = "";
			/* 시작 시 */
			$(document).ready(function(){

				currdate = $("#currdate").val();

				q_lrgc_cd = $("#q_lrgc_cd").val();
				q_mddl_cd = $("#q_mddl_cd").val();
				q_smll_cd = $("#q_smll_cd").val();

				var gwidth = $(".grid1").width();
				var gheight = $(".inquiry__result-section").height();
				gwidth = parseInt(gwidth);
				$(".srcArea").attr("style","display:flex;justify-content: space-between;width:calc(100% - 10px);");

				var caption1 = "";//"프로그램 등록 현황";
				var caption2 = "";//"프로그램 등록 현황";

				var text = '"M"';
				var grid_id = '"list"'
				var text2 = '"S"';
				var grid_id2 = '"list2"'

				caption1 += "<div style='text-align:right;'>"+
					"<a href=\'javascript:fn_save("+text+")'\><button class='process__btn2 btn_right  mt3 mr-4 ml-2'>"+
					"<img src='/images/jqgrid/btn_save.png' alt='저장' width='16px' />"+
					"<span>&nbsp;저 장&nbsp;</span></button></a>"+	// 저장
					"<a href=\'javascript:fn_delete("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_delete.png' alt='삭제' width='16px' />"+
					"<span>&nbsp;삭 제&nbsp;</span></button></a>"+ // 행삭제
					"<a href=\'javascript:fn_expr("+text+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/delete.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='삭제' class='icon__img' width='16px'/>"+
					"<span>&nbsp;불 용&nbsp;</span></button></a>"+ // 행불용
					"<a href=\'javascript:fn_edit("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_update.png' alt='수정' width='16px'/>"+
					"<span>&nbsp;수 정&nbsp;</span></button></a>"+ // 행수정
					"<a href=\'javascript:fn_add("+text+")'\><button class='process__btn2 btn_right  mt3 mx-2'>"+
					"<img src='/images/jqgrid/btn_add.png' alt='추가' width='16px' />"+
					"<span>&nbsp;입 력&nbsp;</span></button></a>"+ // 행추가
					"<a href=\'javascript:fn_viewer("+text+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;상 세&nbsp;</span></button></a>"+ // 상세보기
					"<a href=\'javascript:reloadGrid("+grid_id+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;새로고침&nbsp;</span></button></a>"+ // 새로고침
					"</div>";



				caption2 += "<div style='text-align:right;'>"+
					"<a href=\'javascript:fn_save("+text2+")'\><button class='process__btn2 btn_right mt5 mr-4 ml-2'>"+
					"<img src='/images/jqgrid/btn_save.png' alt='저장' width='16px' />"+
					"<span>&nbsp;저 장&nbsp;</span></button></a>"+ // 저장
					"<a href=\'javascript:fn_delete("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_delete.png' alt='삭제' width='16px' />"+
					"<span>&nbsp;삭 제&nbsp;</span></button></a>"+ // 행삭제
					"<a href=\'javascript:fn_expr("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/delete.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='삭제' class='icon__img' width='16px'/>"+
					"<span>&nbsp;불 용&nbsp;</span></button></a>"+ // 행불용
					"<a href=\'javascript:fn_edit("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_update.png' alt='수정' width='16px'/>"+
					"<span>&nbsp;수 정&nbsp;</span></button></a>"+ // 행수정
					"<a href=\'javascript:fn_add("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='/images/jqgrid/btn_add.png' alt='추가' width='16px' />"+
					"<span>&nbsp;입 력&nbsp;</span></button></a>"+ // 행추가
					"<a href=\'javascript:fn_viewer("+text2+")'\><button class='process__btn2 btn_right mt5 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;상 세&nbsp;</span></button></a>"+ // 상세보기
					"<a href=\'javascript:reloadGrid("+grid_id2+")'\><button class='process__btn2 btn_right mt3 mx-2'>"+
					"<img src='../images/icons/white/look.png;jsessionid=DA61F99C2BAA62E5BE260CFBF18EFE96' alt='조회 아이콘' class='icon__img' width='16px'/>"+
					"<span>&nbsp;새로고침&nbsp;</span></button></a>"+ // 새로고침
					"</div>";

				var checkLMS = $("#checkLMS").val();
				var hspt_id = $("#hspt_id").val();
				var lrgc_cd = $("#lrgc_cd").val();
				var mddl_cd = $("#mddl_cd").val();

				/* 상세보기 : 대 */
				if(checkLMS == "L"){
					/* 그리드(중분류) */
					$('#list').jqGrid({
						url: "/risCodeList2.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd,
						reordercolNames:true,
						mtype:'POST', // 전송 타입
						datatype : "json", // 받는 데이터 형태
						colNames:[ i18n.text_076, '병원코드', '대분류 코드',i18n.text_081, i18n.text_222, i18n.text_083, i18n.text_084, i18n.text_085, i18n.text_086], //'구분','중분류 코드', '중분류 한글 명', '자릿수', '출력순', '적용일자', '불용일자'
						colModel:[
							{ name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
								formatter:"select",
								formatoptions : {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
								edittype:"select",
								editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}   //"I:입력;U:수정;D:불용;N:--"
							},
							{ name: 'hsptId'	  , index: 'hsptId'	, width: 0  , hidden: true},
							{ name: 'lrgcCd'	  , index: 'lrgcCd'	, width: 0  , hidden: true},
							{ name: 'mddlCd'	  , index: 'mddlCd'	, width: 70 , align:"left" , editable: true , editoptions:{maxlength : $("#lrgc_acph").val()}},
							{ name: 'mddlKrNm' , index: 'mddlKrNm' , width: 70 , align:"left" , editable: true , editoptions:{maxlength : 100}},
							{ name: 'mddlAcph'  , index: 'mddlAcph'	, width: 50 , align:"center" , editable: true , editoptions:{maxlength : 2, dataInit:onlyint}},
							{ name: 'otptSqnc'  , index: 'otptSqnc'	, width: 50 , align:"center" , editable: true , editoptions:{maxlength : 15, dataInit:onlyint}},
							{ name: 'applDate'  , index: 'applDate'	, width: 80 , align:"center" , editable: true , editoptions: {type: "date"}},
							{ name: 'exprDate'  , index: 'exprDate'	, width: 80 , align:"center" , editable: true , editoptions: {type: "date"}}
						], //서버에서 받은 데이터 설정
						jsonReader: {
							repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
							root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
							//page:'page', // 현재 페이지 currentPage
							//total:'total', // 총 페이지 수 totalPage
							records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
						},
						width : gwidth-10,
						height: gheight*0.34, //테이블의 세로 크기, Grid의 높이
						loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."
						emptyrecords: "Nothing to display",
						rowNum:-1,
						rownumbers: true,
						celledit:true,
						editurl: "clientArray",
						gridview : true,  // 선표시 true/false
						loadComplete: function(data){
							var ids = $("#list").getDataIDs();
							for(var i in ids){
								var expr_date = $('#list').getCell(ids[i], "exprDate");
								if(expr_date <= currdate){
									$("#list").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
								}

							}
							jQuery('#list2').jqGrid('clearGridData');
							var totcnt  = jQuery("#list").jqGrid("getGridParam","records");
							if(totcnt < 1){
								$("#list > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_051+"<br/></b></td></tr>"); //중분류 코드가 존재하지않습니다.
								$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
							}else{
								$("#list2 > tbody").append("<tr><td align='center' colspan='11'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_050+"<br/></b></td></tr>");//중분류 코드를 선택해주세요.
							}
							/* 클릭 유지 */
							if(q_mddl_cd != null || q_mddl_cd != ""){
								for(var i in ids){
									var mddl_cd = $('#list').getCell(ids[i], "mddlCd");
									if(mddl_cd == q_mddl_cd){
										$("#list").jqGrid('setSelection', ids[i], true);
									}
								}
							}
						},
						beforeSelectRow: function (rowid, e) {
							var ids2 = $("#list2").getDataIDs();
							var iudcheck = 0;
							/* 소분류 행수정시 클릭X */
							for(var i in ids2){
								var iud = $("#list2").getCell(ids2[i], "iud");
								if(iud == "I" || iud == "U" || iud == "D"){
									iudcheck++;
								}
							}
							if(iudcheck > 0){
								return
							}else{
								$("#list").jqGrid('setSelection', rowid, true);
							}
						},
						onSelectRow: function(rowid) {
							var rowObject = $("#list").jqGrid('getRowData',rowid);
							q_mddl_cd = rowObject.mddlCd;

							var ids2 = $("#list2").getDataIDs();
							var iudcheck = 0;
							/* 소분류 행수정시 클릭X */
							for(var i in ids2){
								var iud = $("#list2").getCell(ids2[i], "iud");
								if(iud == "I" || iud == "U"  || iud == "D"){
									iudcheck++;
								}
							}
							if(iudcheck == 0){
								jQuery('#list2').jqGrid('clearGridData');

								jQuery('#list2').jqGrid('setGridParam', {
									url: "/risCodeList3.do",
									postData: {
										checkLMS : "S",
										lrgc_cd : rowObject.lrgcCd,
										mddl_cd : rowObject.mddlCd,
									},
									datatype:"json"
								}).trigger("reloadGrid");

								/* jQuery("#list2").jqGrid('setGridParam',{url:"/json/code/risCodeList.do?checkLMS=S&lrgc_cd="+rowObject.lrgc_cd+"&hspt_id="+rowObject.hspt_id+"&mddl_cd="+rowObject.mddl_cd});
                jQuery("#list2").trigger('reloadGrid'); */
								// 소분류 코드 maxlength 중분류 자릿수로 적용
								jQuery("#list2").jqGrid('setColProp', 'smllCd', { editoptions: { maxlength: rowObject.mddlAcph} });
								checkid = rowid;
							}
						}
					}); // 중분류 그리드 END

					/* 서브그리드(소분류) */
					$('#list2').jqGrid({
						url:"/risCodeList3.do",
						postData : {
							checkLMS : "S",
							hspt_id  : hspt_id,
							lrgc_cd  : q_lrgc_cd,
							mddl_cd  : q_mddl_cd
						}, // URL에서 검색 조건으로 가져갈 파라미터
						reordercolNames:true,
						mtype:'POST', // 전송 타입
						datatype : "json", // 받는 데이터 형태
						colNames:[ i18n.text_076, '병원코드', '대분류 코드', '중분류 코드',i18n.text_080, i18n.text_223, i18n.text_084, i18n.text_085, i18n.text_086], // '구분','소분류 코드','소분류 코드 명','출력순', '적용일자', '불용일자'
						colModel:[
							{ name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
								formatter:"select",
								formatoptions :{value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
								edittype:"select",
								editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
							},
							{ name: 'hsptId'	  , index: 'hsptId'	, width: 0  , hidden: true}																		  		,
							{ name: 'lrgcCd'	  , index: 'lrgcCd'	, width: 0  , hidden: true}																		  		,
							{ name: 'mddlCd'	  , index: 'mddlCd'	, width: 0  , hidden: true}																		  		,
							{ name: 'smllCd'	  , index: 'smllCd'	, width: 84 , align: "left" , editable: true}										    				,
							{ name: 'smllKrNm' , index: 'smllKrNm' , width: 84 , align: "left" , editable: true, editoptions: { maxlength : 100}}				  		,
							{ name: 'otptSqnc'  , index: 'otptSqnc'  , width: 84 , align: "center" , editable: true, editoptions: { maxlength :15 , dataInit:onlyInt}}   	,
							{ name: 'applDate'  , index: 'applDate'  , width: 84 , align: "center" , editable: true, editoptions: {type: "date"}}							,
							{ name: 'exprDate'  , index: 'exprDate'	, width: 80 , align:"center"  , editable: true, editoptions: {type: "date"}}
						], //서버에서 받은 데이터 설정
						jsonReader: {
							repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
							root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
							//page:'page', // 현재 페이지 currentPage
							//total:'total', // 총 페이지 수 totalPage
							records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
						},
						width : gwidth-10,
						height : gheight*0.34, //테이블의 세로 크기, Grid의 높이
						loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."
						emptyrecords: "Nothing to display",
						rowNum:-1,
						rownumbers: true,
						celledit:true,
						editurl: "clientArray",
						gridview : true,  // 선표시 true/false
						loadComplete: function(data){

							var ids = $("#list2").getDataIDs();

							for(var i in ids){
								var expr_date = $('#list2').getCell(ids[i], "exprDate");
								if(expr_date <= currdate){
									$("#list2").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
								}

							}
							var totcnt  = jQuery("#list2").jqGrid("getGridParam","records");
							if(totcnt < 1){
								$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
							}

							/* 클릭유지 */
							if(q_smll_cd != null || q_smll_cd != ""){
								for(var i in ids){
									var smll_cd = $('#list2').getCell(ids[i], "smllCd");
									if(smll_cd == q_smll_cd){
										$("#list2").jqGrid('setSelection', ids[i], true);
									}
								}
							}

						},
						beforeSelectRow: function (rowid, e) {
							$("#list2").jqGrid('setSelection', rowid, true);
						},
						onSelectRow: function(rowid) {
							var rowObject = $("#list2").jqGrid('getRowData',rowid);

							q_smll_cd = rowObject.smllCd;
						}
					}) // 소분류 그리드 END

					/* 상세보기 : 중 */
				}else if(checkLMS == "M"){

					/* 그리드(소분류) */
					$('#list2').jqGrid({
						url: "/risCodeList3.do",
						reordercolNames:true,
						postData : {
							checkLMS : "S",
							lrgc_cd : lrgc_cd,
							mddl_cd : mddl_cd,
						},
						mtype:'POST', // 전송 타입
						datatype : "json", // 받는 데이터 형태
						colNames:[ i18n.text_076, '병원코드', '대분류 코드', '중분류 코드',i18n.text_080, i18n.text_223, i18n.text_084, i18n.text_085, i18n.text_086], // '구분','소분류 코드','소분류 코드 명','출력순', '적용일자', '불용일자'
						colModel:[
							{ name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
								formatter:"select",
								formatoptions :{value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
								edittype:"select",
								editoptions: {value:"I:"+i18n.text_213+";U:"+i18n.text_214+";D:"+i18n.text_215+";N:--"}, //"I:입력;U:수정;D:불용;N:--"
							},
							{ name: 'hsptId'	  , index: 'hsptId'	, width: 0  , hidden: true}				  														  	,
							{ name: 'lrgcCd'	  , index: 'lrgcCd'	, width: 0  , hidden: true}																		  	,
							{ name: 'mddlCd'	  , index: 'mddlCd'	, width: 0  , hidden: true}				  														  	,
							{ name: 'smllCd'	  , index: 'smllCd'	, width: 70 , align: "left" , editable: true, editoptions: {maxlength : $("#mddl_acph").val()}}	,
							{ name: 'smllKrNm' , index: 'smllKrNm' , width: 70 , align: "left" , editable: true, editoptions: {maxlength : 100}}				  		,
							{ name: 'otptSqnc'  , index: 'otptSqnc'  , width: 70 , align: "center" , editable: true, editoptions: {maxlength : 15 , dataInit:onlyInt}}	,
							{ name: 'applDate'  , index: 'applDate'  , width: 70 , align: "center" , editable: true, editoptions: {type: "date"}}						,
							{ name: 'exprDate'  , index: 'exprDate'  , width: 70 , align: "center" , editable: true, editoptions: {type: "date"}}
						], //서버에서 받은 데이터 설정
						jsonReader: {
							repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
							root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
							//page:'page', // 현재 페이지 currentPage
							//total:'total', // 총 페이지 수 totalPage
							records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
						},
						width : gwidth-10,
						height: gheight*0.82, //테이블의 세로 크기, Grid의 높이
						loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."
						emptyrecords: "Nothing to display",
						rowNum:-1,
						rownumbers: true,
						celledit:true,
						editurl: "clientArray",
						gridview : true,  // 선표시 true/false
						loadComplete: function(data){

							var ids = $("#list2").getDataIDs();

							for(var i in ids){
								var expr_date = $('#list2').getCell(ids[i], "exprDate");
								if(expr_date <= currdate){
									$("#list2").jqGrid("setCell",ids[i],'iud',"N"); // 첫 행에 Row 추가
								}
							}

							if((q_smll_cd != null || q_smll_cd != "")){
								$("#list2").jqGrid('setSelection', q_smll_cd, true);
							}
							/* 데이터가 없을 시 */
							var totcnt  = jQuery("#list2").jqGrid("getGridParam","records");
							if(totcnt < 1){
								$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
							}

							/* 클릭유지 */
							if(q_smll_cd != null || q_smll_cd != ""){
								for(var i in ids){
									var smll_cd = $('#list2').getCell(ids[i], "smllCd");
									if(smll_cd == q_smll_cd){
										$("#list2").jqGrid('setSelection', ids[i], true);
									}
								}
							}

						},
						beforeSelectRow: function (rowid, e) {
							$("#list2").jqGrid('setSelection', rowid, true);
						},
						onSelectRow: function(rowid) {
							var rowObject = $("#list2").jqGrid('getRowData',rowid);
							q_smll_cd = rowObject.smllCd;
						}
					})
				} // if(checkLMS END
			}) // getReady END

			var BrowserChk = "";
			if(BrowserChk == "EXPLORE"){
				$(function(){
					jQuery("#list").setColProp('applDate', { editoptions:{maxlength : 10, dataInit : applpicker} });
					jQuery("#list").setColProp('exprDate', { editoptions:{maxlength : 10, dataInit : exprpicker} });
					jQuery("#list2").setColProp('applDate', { editoptions:{maxlength : 10, dataInit : applpicker} });
					jQuery("#list2").setColProp('exprDate', { editoptions:{maxlength : 10, dataInit : exprpicker} });
				});
			}else{
				jQuery("#list").setColProp('applDate', { editoptions:{type: "date"} });
				jQuery("#list").setColProp('exprDate', { editoptions:{type: "date"} });
				jQuery("#list2").setColProp('applDate', { editoptions:{type: "date"} });
				jQuery("#list2").setColProp('exprDate', { editoptions:{type: "date"} });
			}

			/* 화면 reize */
			$(window).bind('resize', function() {
				if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
				else {
					var gridw = $(window).width()-20;
					fn_resize("list", gridw , '0.7');
					fn_resize("list2", gridw , '0.7');
				}
			}).trigger('resize');


			//행추가
			function fn_add(LMS){
				var checkLMS = $("#checkLMS").val(); // 대분류 상세보기 : L, 중분류 상세보기 : M

				// 중분류
				var lrgc_cd = $("#lrgc_cd").val();
				var lrgc_acph = $("#lrgc_acph").val();
				var ids = $("#list").getDataIDs();
				var rowid = Math.max.apply(null,ids)+1 // 페이징 처리 시 현 페이지의 Max RowId 값
				var rowData ={iud:"I", lrgcCd:lrgc_cd, mddlAcph:20,otptSqnc:0, applDate:currdate, exprDate:"3000-01-01"};	// 기본값 셋팅
				if(lrgc_acph == 0 && checkLMS == "L"){	// 자릿수가 0이면 행추가 X
					alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
					return;
				}

				// 소분류
				var mddl_cd = $("#mddl_cd").val();
				var mddl_acph = $("#mddl_acph").val();
				var ids2 = $("#list2").getDataIDs();
				var rowid2 = Math.max.apply(null,ids2)+1 // 페이징 처리 시 현 페이지의 Max RowId 값
				var mddlid = "";
				var rowObject = "";
				var mddl_expr_date = "";
				if(checkLMS == "L" && LMS == "S"){
					mddlid = $("#list").getGridParam("selrow");		// 중분류 선택된 rowid
					rowObject = $("#list").jqGrid('getRowData',mddlid);	// 선택된 중분류의 값을 받아오기 위함
					mddl_cd = rowObject.mddlCd;
					mddl_acph = rowObject.mddlAcph;
					mddl_expr_date = rowObject.exprDate;

				}
				/* 상세보기 코드가 불용이면 하위코드에는 행 추가 불가*/
				if(currdate >= $("#expr_date").val()){
					alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
					return
				}
				/* 대분류 상세보기 -> 중분류 코드가 불용이면 하위코드에는 행 추가 불가*/
				if(currdate >= mddl_expr_date && checkLMS == "L" && LMS == "S"){
					alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
					return
				}

				var rowData2 ={iud:"I", lrgcCd:lrgc_cd,otptSqnc:0, mddlCd:mddl_cd, applDate:currdate, exprDate:"3000-01-01"};
				// 중분류
				if(LMS == "M"){
					for(var i in ids2){
						var iud = $("#list2").getCell(ids2[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}

					if(ids.length < 1){
						jQuery('#list').jqGrid('clearGridData');
						rowid = 1;
					}

					if($("#list").getGridParam( "selrow" ) == null){
						$("#list").jqGrid("addRowData",rowid,rowData); // 첫 행에 Row 추가
						jQuery('#list').jqGrid('editRow',rowid,false);
					}else{
						$("#list").jqGrid("addRowData",rowid,rowData,'after',$("#list").getGridParam( "selrow" )); //선택된 행 뒤에 Row추가
						jQuery('#list').jqGrid('editRow',rowid,false);
					}
					$("#list").jqGrid('setSelection', rowid, true);
				}

				// 소분류
				if(LMS == "S"){
					for(var i in ids){
						var iud = $("#list").getCell(ids[i], "iud");
						if(iud == "I" || iud == "U"  || iud == "D"){
							alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}
					if(mddlid == null && checkLMS == "L"){
						alert(i18n.message_050); //"중분류 코드를 선택해주세요."
						return
					}

					if(mddl_acph == 0){
						alert(i18n.message_059);  //"이 코드의 추가적인 하위코드를 입력할 수 없습니다."
						return;
					}

					if(ids2.length < 1){
						jQuery('#list2').jqGrid('clearGridData');
						rowid2 = 1;
					}

					if($("#list2").getGridParam( "selrow" ) == null){
						$("#list2").jqGrid("addRowData",rowid2,rowData2); // 첫 행에 Row 추가
						jQuery('#list2').jqGrid('editRow',rowid2,false);

					}else{
						$("#list2").jqGrid("addRowData",rowid2,rowData2,'after',$("#list2").getGridParam( "selrow" )); //선택된 행 뒤에 Row추가
						jQuery('#list2').jqGrid('editRow',rowid2,false);
					}
					$("#list2").jqGrid('setSelection', rowid2, true);

				}

			}

			//행 수정
			function fn_edit(LMS){
				var checkLMS = $("#checkLMS").val();
				// 중분류
				var rowid = $("#list").getGridParam("selrow");
				var ids = $("#list").getDataIDs();
				var mddl_expr_date = $("#list").getCell(rowid, "exprDate");
				// 소분류
				var rowid2 = $("#list2").getGridParam("selrow");
				var ids2 = $("#list2").getDataIDs();

				// 중분류
				if(LMS == "M"){

					for(var i in ids2){
						var iud = $("#list2").getCell(ids2[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}

					if(ids.length < 1){
						alert(i18n.message_019); // "수정할 정보가 존재하지 않습니다."
						return
					}

					if(rowid == null || rowid == ""){
						alert(i18n.message_050); // "중분류 코드를 선택해주세요."
						return
					}

					var iud = $('#list').getCell(rowid, "iud");
					if(iud != "I" && iud != "D"){
						jQuery("#list").setColProp('mddlCd', { editable: false });		// 수정불가
						$("#list").jqGrid("setCell",rowid,'iud',"U"); // 첫 행에 Row 추가
						jQuery('#list').editRow(rowid);
						jQuery("#list").setColProp('mddlCd', { editable: true });		// 다시 수정가능
					}

				}

				// 소분류
				if(LMS == "S"){

					for(var i in ids){
						var iud = $("#list").getCell(ids[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}

					if(ids2.length < 1){
						alert(i18n.message_019); // "수정할 정보가 존재하지 않습니다."
						return
					}

					if(rowid2 == null || rowid2 == ""){
						alert(i18n.message_196); //"소분류 코드를 선택해주세요."
						return
					}

					var iud = $('#list2').getCell(rowid2, "iud");

					if(iud != "I" && iud != "D"){
						jQuery("#list2").setColProp('smllCd', { editable: false });  // 중분류 수정 불가
						$("#list2").jqGrid("setCell",rowid2,'iud',"U"); // 첫 행에 Row 추가
						jQuery('#list2').editRow(rowid2);
						jQuery("#list2").setColProp('smllCd', { editable: true });	 // 중분류 수정 가능
					}
				}

			}


			// 행 불용
			function fn_expr(LMS){
				var rowid = "";
				// 중분류
				if(LMS == "M"){
					var ids2 = $("#list2").getDataIDs();
					for(var i in ids2){
						var iud = $("#list2").getCell(ids2[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}
					rowid = $("#list").getGridParam("selrow");
					var iud = $('#list').getCell(rowid, "iud");
					if(iud == "I" || iud == "U"){
						return
					}
					$("#list").jqGrid("setCell",rowid,'iud',"D"); // 첫 행에 Row 추가
					// 소분류
				}else if(LMS == "S"){
					var ids = $("#list").getDataIDs();
					for(var i in ids){
						var iud = $("#list").getCell(ids[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}
					rowid = $("#list2").getGridParam("selrow");
					var iud = $('#list2').getCell(rowid, "iud");
					if(iud == "I" || iud == "U"){
						return
					}
					$("#list2").jqGrid("setCell",rowid,'iud',"D"); // 첫 행에 Row 추가
					// 상세 데이터
				}else if(LMS == "D"){
					var checkLMS = $("#checkLMS").val();
					var hspt_id = $("#hspt_id").val();
					var lrgc_cd = $("#lrgc_cd").val();
					var mddl_cd = $("#mddl_cd").val();
					var smll_cd = $("#smll_cd").val();
					var expr_date = $("#expr_date").val();

					var param = '';
					param = {"checkLMS":checkLMS,"hspt_id":hspt_id,"lrgc_cd":lrgc_cd,"mddl_cd":mddl_cd,"smll_cd":smll_cd};
					param = JSON.stringify(param);

					if(confirm(i18n.message_060)){ //"정말 불용 처리 하시겠습니까?"
						$.ajax({
							type : "post",
							url : "/risCodeUpdateData.do?checkLMS="+checkLMS,
							data : param,
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							async : false,
							error : function(){
								alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
							},
							success : function(data) {
								if(data.error_code == "0"){
									alert(i18n.message_061); //"불용 처리가 완료 되었습니다."
									location.reload();
									return
								}
							}
						});
					}
				}
			}

			// 행 저장
			function fn_save(LMS){
				var iudCntS = 0; // 등록/수정 성공갯수
				var codeCheck = "";
				var nscdCheck = new Array(); // 저장전에 중복되는 코드 골라내기
				// 중분류
				var ids = $("#list").getDataIDs();

				// 소분류
				var ids2 = $("#list2").getDataIDs();

				// 중분류
				if(LMS == "M"){
					for(var i in ids2){
						var iud = $('#list2').getCell(ids2[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}
					for(var i in ids){

						$("#list").jqGrid('saveRow',ids[i]);
						var iud = $('#list').getCell(ids[i], "iud");
						var lrgc_cd = $('#list').getCell(ids[i], "lrgcCd");
						var mddl_cd = $('#list').getCell(ids[i], "mddlCd");
						var mddl_kr_nm = $('#list').getCell(ids[i], "mddlKrNm");
						var mddl_acph = $('#list').getCell(ids[i], "mddlAcph");
						var otpt_sqnc = $('#list').getCell(ids[i], "otptSqnc");
						var appl_date = $('#list').getCell(ids[i], "applDate");
						var expr_date = $('#list').getCell(ids[i], "exprDate");

						if(nscdCheck.length > 0 && iud == "I"){
							for(var z = 0; z < nscdCheck.length;z++){
								if(mddl_cd == nscdCheck[z]){
									jQuery('#list').jqGrid('editRow',ids[i] ,false);
									alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
									$("#list").jqGrid('setSelection', ids[i], true);
									return
								}
							}
						}

						if((mddl_cd == null || mddl_cd == '') || (mddl_kr_nm == null  || mddl_kr_nm == '') || (mddl_acph == null  || mddl_acph == '')
							|| (otpt_sqnc == null  || otpt_sqnc == '') || (appl_date == null  || appl_date == '') || (expr_date == null  || expr_date == '')){
							if(iud == "I"){
								jQuery('#list').jqGrid('editRow',ids[i],false);
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list").setColProp('mddlCd', { editable: false });
								$("#list").jqGrid("setCell",ids[i],'iud',"U"); // 첫 행에 Row 추가
								jQuery('#list').editRow(ids[i]);
								jQuery("#list").setColProp('mddlCd', { editable: true });
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}

							/* 적용일자 > 불용일자 일 경우 */
						}else if(expr_date < appl_date){
							if(iud == "I"){
								$("#list").jqGrid("setCell",ids[i],'exprDate',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list').jqGrid('editRow',ids[i],false);
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list").setColProp('mddl_cd', { editable: false });
								$("#list").jqGrid("setCell",ids[i],'iud',"U");
								$("#list").jqGrid("setCell",ids[i],'exprDate',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list').editRow(ids[i]);
								jQuery("#list").setColProp('mddlCd', { editable: true });
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list").jqGrid('setSelection', ids[i], true);
								return
							}
						}

						if(iud == "I"){
							jQuery('#list').jqGrid('editRow',ids[i],false);
							fn_reset();

							document.savefrm.hspt_id.value =jsonData.hsptId;
							document.savefrm.lrgc_cd.value =lrgc_cd;
							document.savefrm.mddl_cd.value =mddl_cd;
							document.savefrm.mddl_kr_nm.value =mddl_kr_nm;
							document.savefrm.mddl_acph.value =mddl_acph;
							document.savefrm.otpt_sqnc.value =otpt_sqnc;
							document.savefrm.appl_date.value =appl_date;
							document.savefrm.expr_date.value =expr_date;

							var authok = $("form[name='savefrm']").serializeObject();
							authok = JSON.stringify(authok);
							$.ajax({
								type : "post",
								url : "/risCodeInsertData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "8"){
										jQuery('#list').jqGrid('editRow',ids[i] ,false);
										alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
										codeCheck = "N"
										$("#list").jqGrid('setSelection', ids[i], true);
									}
								}
							});
							if(codeCheck == "N"){
								return;
							}else{
								nscdCheck.push(mddl_cd)
							}
						}else if(iud == "U"){
							jQuery("#list").setColProp('mddlCd', { editable: false });
							jQuery('#list').editRow(ids[i]);
							jQuery("#list").setColProp('mddlCd', { editable: true });
						}
					}// for end

					for(var i in ids){
						$("#list").jqGrid('saveRow',ids[i]);
						var iud = $('#list').getCell(ids[i], "iud");
						var lrgc_cd = $('#list').getCell(ids[i], "lrgcCd");
						var mddl_cd = $('#list').getCell(ids[i], "mddlCd");
						var mddl_kr_nm = $('#list').getCell(ids[i], "mddlKrNm");
						var mddl_acph = $('#list').getCell(ids[i], "mddlAcph");
						var otpt_sqnc = $('#list').getCell(ids[i], "otptSqnc");
						var appl_date = $('#list').getCell(ids[i], "applDate");
						var expr_date = $('#list').getCell(ids[i], "exprDate");

						fn_reset();

						document.savefrm.iud.value=iud;
						document.savefrm.hspt_id.value=jsonData.hsptId;
						document.savefrm.lrgc_cd.value=lrgc_cd;
						document.savefrm.mddl_cd.value=mddl_cd;
						document.savefrm.mddl_kr_nm.value=mddl_kr_nm;
						document.savefrm.mddl_acph.value=mddl_acph;
						document.savefrm.otpt_sqnc.value=otpt_sqnc;
						document.savefrm.appl_date.value=appl_date;
						document.savefrm.expr_date.value=expr_date;

						var authok = $("form[name='savefrm']").serializeObject();
						authok = JSON.stringify(authok);
						if(iud == "I"){
							$.ajax({
								type : "post",
								url : "/risCodeInsertData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										$("#list").jqGrid("setCell",ids[i],'iud'," ");
										iudCntS++;
									}else{
										jQuery('#list').jqGrid('editRow',ids[i] ,false);
										alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddlCd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
										$("#list").jqGrid('setSelection', ids[i], true);
									}
								}
							});

						}else if(iud == "U" || iud == "D"){
							$.ajax({
								type : "post",
								url : "/risCodeUpdateData.do?searchstatus=V&checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										$("#list").jqGrid("setCell",ids[i],'iud'," ");
										iudCntS++;
									}
								}
							});
						}else{
							// 중분류 삭제
						}
					}// For END
					if(iudCntS < 1){
						alert(i18n.message_065); //"변경할 정보가 없습니다."
					}else{
						alert(i18n.message_025.replace("X",iudCntS)); //"총 " + iudCntS +"건이 처리되었습니다."
						jQuery("#list").trigger("reloadGrid");
					}
				}

				// 소분류
				if(LMS == "S"){

					for(var i in ids){
						var iud = $('#list').getCell(ids[i], "iud");
						if(iud == "I" || iud == "U" || iud == "D"){
							alert(i18n.message_058); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}

					}

					for(var i in ids2){
						$("#list2").jqGrid('saveRow',ids2[i]);
						var iud = $('#list2').getCell(ids2[i], "iud");
						var lrgc_cd = $('#list2').getCell(ids2[i], "lrgcCd");
						var mddl_cd = $('#list2').getCell(ids2[i], "mddlCd");
						var smll_cd = $('#list2').getCell(ids2[i], "smllCd");
						var smll_kr_nm = $('#list2').getCell(ids2[i], "smllKrNm");
						var otpt_sqnc = $('#list2').getCell(ids2[i], "otptSqnc");
						var appl_date = $('#list2').getCell(ids2[i], "applDate");
						var expr_date = $('#list2').getCell(ids2[i], "exprDate");
						if(nscdCheck.length > 0 && iud == "I"){
							for(var z = 0; z < nscdCheck.length;z++){
								if(smll_cd == nscdCheck[z]){
									jQuery('#list2').jqGrid('editRow',ids2[i] ,false);
									alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddl_cd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
									$("#list2").jqGrid('setSelection', ids2[i], true);
									return
								}
							}
						}

						if((smll_cd == null || smll_cd == '') || (smll_kr_nm == null  || smll_kr_nm == '')
							||(otpt_sqnc == null  || otpt_sqnc == '') || (appl_date == null  || appl_date == '') || (expr_date == null  || expr_date == '')){
							if(iud == "I"){
								jQuery('#list2').jqGrid('editRow',ids2[i],false);
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return;
							}else if(iud =="U"){
								jQuery("#list2").setColProp('smllCd', { editable: false });
								jQuery('#list2').editRow(ids2[i]);
								jQuery("#list2").setColProp('smllCd', { editable: true });
								alert(i18n.message_063.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"미 입력/오류 사항이 있습니다 다시 입력해주세요.\n"
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return;
							}

						}else if(expr_date < appl_date){
							if(iud == "I"){
								$("#list2").jqGrid("setCell",ids2[i],'exprDate',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list2').jqGrid('editRow',ids2[i],false);
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return
							}else if(iud =="U"){
								jQuery("#list2").setColProp('smllCd', { editable: false });
								$("#list2").jqGrid("setCell",ids2[i],'iud',"U");
								$("#list2").jqGrid("setCell",ids2[i],'exprDate',"3000-01-01"); // 불용일자 재 셋팅
								jQuery('#list2').editRow(ids2[i]);
								jQuery("#list2").setColProp('smllCd', { editable: true });
								alert(i18n.message_064.replace("X",(parseInt(i)+1))); //(parseInt(i)+1) + "번 행에\n" +"불용일자는 적용일자보다 낮을 수 없습니다."
								$("#list2").jqGrid('setSelection', ids2[i], true);
								return
							}
						}
						if(iud == "I"){
							jQuery('#list2').jqGrid('editRow',ids2[i],false);
							fn_reset();

							document.savefrm.hspt_id.value=jsonData.hsptId;
							document.savefrm.lrgc_cd.value =lrgc_cd;
							document.savefrm.mddl_cd.value =mddl_cd;
							document.savefrm.smll_cd.value =smll_cd;
							document.savefrm.smll_kr_nm.value =smll_kr_nm;
							document.savefrm.otpt_sqnc.value =otpt_sqnc;
							document.savefrm.appl_date.value =appl_date;
							document.savefrm.expr_date.value =expr_date;

							var authok = $("form[name='savefrm']").serializeObject();
							authok = JSON.stringify(authok);

							$.ajax({
								type : "post",
								url : "/risCodeInsertData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "8"){
										jQuery('#list').jqGrid('editRow',ids2[i] ,false);
										alert(i18n.message_062.replace("X",(parseInt(i)+1)).replace("Y",mddlCd)); //(parseInt(i)+1) + "번 행에\n[ " +mddl_cd + " ] : 코드는 중복되는 코드입니다.\n다른 코드를 사용해주세요."
										codeCheck = "N"
										$("#list").jqGrid('setSelection', ids2[i], true);
									}
								}
							});
							if(codeCheck == "N"){
								return;
							}else{
								nscdCheck.push(smll_cd)
							}
						}else if(iud == "U"){
							jQuery("#list2").setColProp('smllCd', { editable: false });
							jQuery('#list2').editRow(ids2[i]);
							jQuery("#list2").setColProp('smllCd', { editable: true });
						}
					}// for end

					for(var i in ids2){
						$("#list2").jqGrid('saveRow',ids2[i]);
						var iud = $('#list2').getCell(ids2[i], "iud");
						var lrgc_cd = $('#list2').getCell(ids2[i], "lrgcCd");
						var mddl_cd = $('#list2').getCell(ids2[i], "mddlCd");
						var smll_cd = $('#list2').getCell(ids2[i], "smllCd");
						var smll_kr_nm = $('#list2').getCell(ids2[i], "smllKrNm");
						var otpt_sqnc = $('#list2').getCell(ids2[i], "otptSqnc");
						var appl_date = $('#list2').getCell(ids2[i], "applDate");
						var expr_date = $('#list2').getCell(ids2[i], "exprDate");

						fn_reset();

						document.savefrm.iud.value 			=	iud;
						document.savefrm.hspt_id.value    = jsonData.hsptId;
						document.savefrm.lrgc_cd.value 		=	$('#list').getCell(ids2[i], "lrgcCd");
						document.savefrm.mddl_cd.value 		=	mddl_cd;
						document.savefrm.smll_cd.value 		=	smll_cd;
						document.savefrm.smll_kr_nm.value 	=	smll_kr_nm;
						document.savefrm.otpt_sqnc.value 	=	otpt_sqnc;
						document.savefrm.appl_date.value 	=	appl_date;
						document.savefrm.expr_date.value 	=	expr_date;

						var authok = $("form[name='savefrm']").serializeObject();
						authok = JSON.stringify(authok);
						if(iud == "I"){
							$.ajax({
								type : "post",
								url : "/risCodeInsertData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										$("#list2").jqGrid("setCell",ids2[i],'iud'," ");
										iudCntS++;
									}
								}
							});
						}else if(iud == "U" || iud == "D"){
							$.ajax({
								type : "post",
								url : "/risCodeUpdateData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								async : false,
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										$("#list2").jqGrid("setCell",ids2[i],'iud'," ");
										iudCntS++;
									}
								}
							});
						}
					}// For END
					if(iudCntS < 1){
						alert(i18n.message_065); //"변경할 정보가 없습니다."
					}else{
						alert(i18n.message_025.replace("X",iudCntS)); //"총 " + iudCntS +"건이 처리되었습니다."
						jQuery("#list2").trigger("reloadGrid");
					}
				}
			}

			//초기화
			function fn_reset(){
				document.savefrm.iud.value						="";
				document.savefrm.lrgc_cd.value					="";
				document.savefrm.mddl_cd.value					="";
				document.savefrm.mddl_kr_nm.value				="";
				document.savefrm.mddl_acph.value				="";
				document.savefrm.smll_cd.value					="";
				document.savefrm.smll_kr_nm.value				="";
				document.savefrm.otpt_sqnc.value				="";
				document.savefrm.appl_date.value				="";
				document.savefrm.appl_date.value				="";
				document.savefrm.expr_date.value				="";
			}

			//행 삭제
			function fn_delete(LMS){
				var iudcnt = 0;	// 등록,수정중인 행 갯수
				var q_user_id = $("#q_user_id").val();
				// 중분류
				var rowid = $("#list").getGridParam( "selrow" );
				var ids = $("#list").getDataIDs();
				var iud = $("#list").getCell(rowid, "iud");
				if(LMS == "M" || LMS == "D"){
					for(var i in ids){
						var iudIU = $("#list").getCell(ids[i], "iud");
						if(iudIU == "I" || iudIU == "U"){
							iudcnt++;
						}
					}
				}

				// 소분류
				var rowid2 = $("#list2").getGridParam( "selrow" );
				var ids2 = $("#list2").getDataIDs();
				var iud2 = $("#list2").getCell(rowid2, "iud");

				if(LMS == "S" || LMS == "D"){
					for(var i in ids2){
						var iudIU = $("#list2").getCell(ids2[i], "iud");
						if(iudIU == "I" || iudIU == "U"){
							iudcnt++;
						}
					}
				}

				// 상세보기 삭제
				if(LMS == "D"){
					if(iudcnt > 0 ){
						alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
						return
					}
					if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"

						var checkLMS = $("#checkLMS").val();
						var hspt_id = $("#hspt_id").val();
						var lrgc_cd = $("#lrgc_cd").val();
						var mddl_cd = $("#mddl_cd").val();
						var smll_cd = $("#smll_cd").val();
						var expr_date = $("#expr_date").val();

						var param = '';
						param = {"checkLMS":checkLMS,"hspt_id":hspt_id,"lrgc_cd":lrgc_cd,"mddl_cd":mddl_cd,"smll_cd":smll_cd};
						param = JSON.stringify(param);
						$.ajax({
							type : "post",
							url : "/risCodeDeleteData.do?checkLMS="+checkLMS,
							data : param,
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							error : function(){
								alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
							},
							success : function(data) {
								if(data.error_code == "0"){
									alert(i18n.message_067); //"삭제가 완료 되었습니다."
									fn_query();
									//location.reload();
									return
								}else{
									alert(i18n.message_068); //"하위코드가 존재합니다.\n하위코드 삭제 후 다시 시도해주세요."
									return
								}
							}
						});
					}else{
						return
					}
				}

				// 중분류
				if(LMS == "M"){

					for(var i in ids2){
						var iudIU = $("#list2").getCell(ids2[i], "iud");
						if(iudIU == "I" || iudIU == "U"){
							alert(i18n.message_057); //"소분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}

					if(rowid == null || rowid == ""){
						alert(i18n.message_050); //"중분류 코드를 선택해주세요."
						return
					}

					if(iudcnt < 1){

						var expr_date = $('#list').getCell(rowid, "exprDate");


						if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"
							fn_reset();

							document.savefrm.hspt_id.value  = $('#list').getCell(rowid, "hsptId");
							document.savefrm.lrgc_cd.value  = $('#list').getCell(rowid, "lrgcCd");
							document.savefrm.mddl_cd.value  = $('#list').getCell(rowid, "mddlCd");
							document.savefrm.checkLMS.value = LMS;

							var authok = $("form[name='savefrm']").serializeObject();
							authok = JSON.stringify(authok);
							$.ajax({
								type : "post",
								url : "/risCodeDeleteData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										alert(i18n.message_067); //"삭제가 완료 되었습니다."
										jQuery("#list").trigger("reloadGrid");
									}else{
										alert(i18n.message_068); //"하위코드가 존재합니다.\n하위코드 삭제 후 다시 시도해주세요."
									}
								}
							});
						}else{
							return
						}
					}else{
						if(iud == "I"){
							$("#list").jqGrid("delRowData", rowid); // 행 삭제
							jQuery('#list').jqGrid('editRow',rowid,false);

							for(var i in ids){
								if(rowid == ids[i]){
									if(i == 0){
										i = 2;
									}
									if(ids.length != 1){
										$("#list").jqGrid('setSelection', ids[(parseInt(i)-1)], true);
									}
								}
							}

							if(ids.length == 1){
								$("#list > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_051+"<br/></b></td></tr>"); //중분류 코드가 존재하지않습니다.
							}
						}else{
							alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
						}

					}
				}

				// 소분류
				if(LMS == "S"){

					for(var i in ids){
						var iudIU = $("#list").getCell(ids[i], "iud");
						if(iudIU == "I" || iudIU == "U"){
							alert(i18n.message_058); //"중분류 코드 등록/수정중인 정보가 있습니다.\n저장 후 다시 시도해주세요."
							return
						}
					}

					if(rowid2 == null || rowid2 == ""){
						alert(i18n.message_196); //"소분류 코드를 선택해주세요."
						return
					}

					if(iudcnt < 1){
						var expr_date = $('#list2').getCell(rowid2, "exprDate");
						if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"
							fn_reset();
							document.savefrm.hspt_id.value  = $('#list').getCell(rowid, "hsptId");
							document.savefrm.lrgc_cd.value  = $('#list').getCell(rowid, "lrgcCd");
							document.savefrm.mddl_cd.value  = $('#list2').getCell(rowid2, "mddlCd");
							document.savefrm.smll_cd.value  = $('#list2').getCell(rowid2, "smllCd");
							document.savefrm.checkLMS.value = LMS;

							var authok = $("form[name='savefrm']").serializeObject();
							authok = JSON.stringify(authok);
							$.ajax({
								type : "post",
								url : "/risCodeDeleteData.do?checkLMS="+LMS,
								data : authok,
								dataType : "json",
								contentType : "application/json; charset=UTF-8",
								error : function(){
									alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
								},
								success : function(data) {
									if(data.error_code == "0"){
										alert(i18n.message_067); //"삭제가 완료 되었습니다."
										jQuery("#list2").trigger("reloadGrid");
									}
								}
							});
						}else{
							return
						}

					}else{

						if(iud2 == "I"){
							$("#list2").jqGrid("delRowData", rowid2); // 행 삭제
							jQuery('#list2').jqGrid('editRow',rowid2,false);

							for(var i in ids2){
								if(rowid2 == ids2[i]){
									if(i == 0){
										i = 2;
									}
									if(ids2.length != 1){
										$("#list2").jqGrid('setSelection', ids2[(parseInt(i)-1)], true);
									}
								}
							}

							if(ids2.length == 1){
								$("#list2 > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_052+"<br/></b></td></tr>"); //소분류 코드가 존재하지않습니다.
							}
						}else{
							alert(i18n.message_195); // "등록/수정중인 정보가 있습니다.\n저장 완료 후 다시 시도해주세요."
						}

					}
				}


			}


			/* 수정페이지 이동 */
			function fn_update(LMS){
				var iudcnt = 0;	// 등록,수정 행 갯수

				var ids = $("#list").getDataIDs();
				var ids2 = $("#list2").getDataIDs();

				for(var i in ids){
					var iud = $("#list").getCell(ids[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}
				for(var i in ids2){
					var iud = $("#list2").getCell(ids2[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}
				if(iudcnt > 0 ){
					if(confirm(i18n.message_069)){ //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
						if(LMS == "L"){
							document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&submitLMS="+LMS;
							document.regfrm.submit();
						}
						if(LMS == "M"){
							document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+jsonData.mddlCd+"&submitLMS="+LMS;
							document.regfrm.submit();
						}
						if(LMS == "S"){
							document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+jsonData.mddlCd+"&smllCd="+jsonData.smllCd+"&submitLMS="+LMS;
							document.regfrm.submit();
						}
					}else{
						return;
					}

				}else{
					if(LMS == "L"){
						document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&submitLMS="+LMS;
						document.regfrm.submit();
					}
					if(LMS == "M"){
						document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+jsonData.mddlCd+"&submitLMS="+LMS;
						document.regfrm.submit();
					}
					if(LMS == "S"){
						document.regfrm.action = "/RIS0101E03.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+jsonData.mddlCd+"&smllCd="+jsonData.smllCd+"&submitLMS="+LMS;
						document.regfrm.submit();
					}
				}
			}


			/* 상세보기 */
			function fn_viewer(LMS,view){
				var iudcnt = 0;
				// 중분류
				var ids = $("#list").getDataIDs();
				var rowid = $("#list").getGridParam( "selrow" );
				var mddl_cd_iud = $("#list").getCell(rowid, "iud");

				if(mddl_cd_iud == "I"){
					return
				}

				for(var i in ids){
					var iud = $("#list").getCell(ids[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}

				if(rowid == null && LMS == "M" && view != "V"){
					alert(i18n.message_050); //"중분류 코드를 선택해주세요."
					return
				}
				// 소분류
				var ids2 = $("#list2").getDataIDs();
				var rowid2 = $("#list2").getGridParam( "selrow" );

				var smll_cd_iud = $("#list2").getCell(rowid2, "iud");

				if(smll_cd_iud == "I" || smll_cd_iud == "U" || iud == "D"){
					return
				}

				for(var i in ids2){
					var iud = $("#list2").getCell(ids2[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}

				if(rowid2 == null && LMS == "S"){
					alert(i18n.message_196); //"소분류 코드를 선택해주세요."
					return
				}
				if(iudcnt > 0 ){
					if(confirm(i18n.message_069)){ //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
						iudcnt = 0;
					}
				}
				if(iudcnt < 1){
					// 대분류
					if(LMS == "L"){
						document.regfrm.checkLMS.value =LMS;
						document.regfrm.action = "/RIS0101E01.do";
						document.regfrm.submit();
					}
					// 중분류
					if(LMS == "M"){
						var lrgc_cd = $('#list').getCell(rowid, "lrgcCd");
						var mddl_cd = $('#list').getCell(rowid, "mddlCd");

						fn_reset();
						document.savefrm.checkLMS.value =LMS;
						document.regfrm.action = "/RIS0101E01M.do?hsptId="+jsonData.hsptId+"&lrgcCd="+lrgc_cd+"&mddlCd="+mddl_cd+"&submitLMS="+LMS;
						document.regfrm.submit();
					}
					// 소분류
					if(LMS == "S"){
						var mddl_cd = $('#list2').getCell(rowid2, "mddlCd");
						var smll_cd = $('#list2').getCell(rowid2, "smllCd");

						fn_reset();

						document.savefrm.checkLMS.value =LMS;
						document.savefrm.lrgc_cd.value =lrgc_cd;
						document.savefrm.mddl_cd.value =mddl_cd;
						document.savefrm.smll_cd.value =smll_cd;

						document.savefrm.action = "/RIS0101E01S.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+mddl_cd+"&smllCd="+smll_cd+"&submitLMS="+LMS;
						document.savefrm.submit();
					}
				}
			}

			/* 목록(돌아가기) */
			function fn_query(){
				var iudcnt = 0;

				var ids = $("#list").getDataIDs();
				var ids2 = $("#list2").getDataIDs();

				for(var i in ids){
					var iud = $("#list").getCell(ids[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}
				for(var i in ids2){
					var iud = $("#list2").getCell(ids2[i], "iud");
					if(iud == "I" || iud == "U" || iud == "D"){
						iudcnt++;
					}
				}
				if(iudcnt > 0 ){
					if(confirm(i18n.message_069)){  //"등록/수정중인 정보가 있습니다.\n무시하고 이동하시겠습니까?"
						document.regfrm.action = "/RIS0101E00.do";
						document.regfrm.submit();
					}else{
						return;
					}

				}else{
					document.regfrm.action = "/RIS0101E00.do";
					document.regfrm.submit();
				}
			}

			//대분류코드 돌아가기
			function fn_goto(LMS){
				if(LMS == 'L'){
					document.regfrm.action = "/RIS0101E01.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd;
					document.regfrm.submit();
				}else if(LMS == 'M'){
					document.regfrm.action = "/RIS0101E01M.do?hsptId="+jsonData.hsptId+"&lrgcCd="+jsonData.lrgcCd+"&mddlCd="+jsonData.mddlCd+"&submitLMS="+LMS;
					document.regfrm.submit();
				}
			}
		</script>
	</body>
</html> 