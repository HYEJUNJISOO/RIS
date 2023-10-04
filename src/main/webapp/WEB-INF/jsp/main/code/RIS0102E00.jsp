<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>쵤영실 코드 관리</title>
  <!-- css -->
  <link rel="stylesheet" type="text/css" href="/css/code/RIS0101E01.css"/>
</head>
<body>
  <!-- Main 화면 영역  Start -->
  <!-- 검색영역 설정 Start -->
  <div class="inquiry__page-flex mt5">
    <section class="search__container">
        <div class="box__flex">
          <label class="box__label" style="margin-right:2rem;">쵤영실 코드 관리</label>
          <label class="box__label">사용여부</label>

          <input style="margin-left:2rem;" type="radio" name="use_yn" id="use_yn1" value="Y" onchange="fn_egov_selectGrid();"/>
          <label style="margin-right:2rem;" for="use_yn1" >사용</label>
          <input type="radio" name="use_yn" id="use_yn2" value="N" onchange="fn_egov_selectGrid();" />
          <label style="margin-right:2rem;" for="use_yn2">불용</label>
          <label class="filter__keyword ml-2">통합검색 : </label>
          <input type="text" id="searchKeyword" value="" onkeydown="enter()"/>
          <div class="inquiry__btn-right ml-2">
            <a href="javascript:fn_egov_selectGrid();" class="ml-2">
              <button class="all__btn img__btn fontawesome__btn search__icon">검색</button>
            </a>
          </div>
        </div>
    </section>

    <!-- Data 영역설정 Start -->
    <section class="inquiry__result-section mt5">
      <div class="fl-R grid1" align="center" style="width:30%">
        <table id="list" ></table>
      </div>
      <div class="fl-L grid2" align="center" style="width:calc(70% - 10px);">
        <div class="srcArea">
          <div class="box__flex">
            <span style="font-weight:bold;">상세정보</span>
            <a href="javascript:fn_reset();" class="ml-2">
              <button class="all__btn img__btn img__btn refresh__btn">새로고침</button>
            </a>
          </div>
          <div class="box__flex">
            <a href="javascript:fn_update();" class="ml-2">
              <button class="all__btn img__btn img__btn update__btn">수정</button>
            </a>
            <a href="javascript:fn_add();" class="ml-2">
              <button class="all__btn img__btn insert__btn">입력</button>
            </a>
            <a href="javascript:fn_expr();" class="ml-2">
              <button class="all__btn img__btn bullyong__btn">불용</button>
            </a>
            <a href="javascript:fn_delete('D');" class="ml-2">
              <button class="all__btn img__btn delete__btn">삭제</button>
            </a>
            <a href="javascript:fn_save()" class="ml-2">
              <button class="all__btn img__btn save__btn">저장</button>
            </a>
          </div>
        </div>
        <form commandname="VO" id="regfrm" name="regfrm" method="post" style="height:93%;">
          <input type="hidden" name="currdate" id="currdate" value="2023-10-04">
          <input type="hidden" name="q_user_id" id="q_user_id" value="admin">
          <input type="hidden" name="lrgc_cd" id="lrgc_cd" value="IMGN_ROOM_CD">
          <input type="hidden" name="iud" id="iud" value="">
          <table class="table table-hover table-dark mt5" id="table" style="width:100%;height:100%;table-layout: fixed;">
            <colgroup>
              <col width="5%">
              <col width="15%">
              <col width="5%">
              <col width="15%">
            </colgroup>
            <tbody>
            <tr>
              <th><span id="col_mddl_cd">*촬영실 코드</span></th>
              <td>
                <input type="text" id="mddl_cd" name="mddl_cd" value="" readonly="readonly" disabled="disabled">
                <button type="button" class="process__btn2 ml-2" onclick="overlapCheck('M')" style="display: inline-block;">중복확인</button>
              </td>
              <th><span id="col_otpt_sqnc">*출력순</span></th>
              <td><input type="text" id="otpt_sqnc" name="otpt_sqnc" onkeydown="javascript:fnOnlyNumber();" maxlength="8" readonly="readonly" disabled="disabled"></td>
            </tr>
            <tr>
              <th><span id="col_appl_date">*적용일자</span></th>
              <td><input type="date" id="appl_date" name="appl_date" value="2023-10-04" readonly="readonly" disabled="disabled"></td>
              <th><span id="col_expr_date">*불용일자</span></th>
              <td><input type="date" id="expr_date" name="expr_date" value="3000-01-01" readonly="readonly" disabled="disabled"></td>
            </tr>
            <tr>
              <!-- 		                   		<th><span id="col_mddl_kr_nm">한글 명</span></th> -->
              <th><span id="col_mddl_kr_nm">*촬영실 한글 명</span></th>
              <td>
                <input type="text" id="mddl_kr_nm" name="mddl_kr_nm" value="" readonly="readonly" disabled="disabled">
              </td>
              <th><span id="col_mddl_engl_nm">촬영실 영문 명</span></th>
              <td><div><input type="text" id="mddl_engl_nm" name="mddl_engl_nm" value="" readonly="readonly" disabled="disabled"></div></td>
            </tr>
            <tr>
              <!-- 		                       	<th><span id="col_chrc1">문자값1</span></th> -->
              <th><span id="col_chrc1">*촬영실 촬영구분</span></th>
              <td>
                <select id="chrc1" name="chrc1" disabled="disabled">
                  <option value="G">일반영상</option><option value="B">BMD(골밀도)</option>
                  <option value="C">CT(전산화단층촬영)</option>
                  <option value="M">MRI(자기공명영상)</option>
                  <option value="A">ANGIOGRAPHY(혈관조영)</option>
                  <option value="I">중재적방사선시술</option>
                  <option value="U">USG(초음파)</option>
                  <option value="F">투시조영</option>
                  <option value="N">핵의학(감마카메라) &amp; PET-CT</option>
                  <option value="P">조직생검</option>
                  <option value="D">DUCT(내시경)외 PACS전송</option>
                  <option value="Z">CD COPY</option>
                  <option value="O">공공의료 (이동버스) X-RAY</option>
                  <option value="V">공공의료 SONO</option>
                  <option value="H">외부영상저장/ 판독의뢰</option>
                  <option value="W">Mammograpy Bilateral</option>
                  <option value="Q">영상재료</option>
                </select>
              </td>
              <!-- 		                       	<th><span id="col_nmbr1">숫자값1</span></th> -->
              <th><span id="col_nmbr1">촬영실 정보</span></th>
              <td><input type="text" id="nmbr1" name="nmbr1" value="" readonly="readonly" disabled="disabled"></td>
            </tr>
            <tr>
              <!-- 		                       	<th><span id="col_chrc2">문자값2</span></th> -->
              <th><span id="col_chrc2">*촬영실 장비</span></th>
              <td>
                <select id="chrc2" name="chrc2" disabled="disabled">
                  <option value="CT1">전산화단층촬영장치</option>
                  <option value="DR1">Digital Radiography</option>
                  <option value="DRF1">투시조영촬영장치</option>
                  <option value="DRG2">일반촬영장치1</option>
                  <option value="DRM1">유방촬영용장치</option>
                  <option value="DRP1">이동촬영용장치1</option>
                  <option value="DUS1">초음파진단기</option>
                  <option value="DUS4">초음파진단기(중재시술용)</option>
                  <option value="MRI1">자기공명영상장치</option>
                  <option value="PDR1">치아파노라마촬영장치</option>
                  <option value="BMD1">골밀도측정촬영장치</option>
                </select>
              </td>
              <!-- 		                       	<th><span id="col_nmbr2">숫자값2</span></th> -->
              <th><span id="col_nmbr2" style="display: none;">촬영실 숫자값02</span></th>
              <td><input type="hidden" id="nmbr2" name="nmbr2" value=""></td>
            </tr>
            <tr>
              <!-- 		                       	<th><span id="col_chrc3">문자값3</span></th> -->
              <th><span id="col_chrc3" style="display: none;">촬영실 문자값03</span></th>
              <td><input type="hidden" id="chrc3" name="chrc3" value=""></td>
              <!-- 		                       	<th><span id="col_nmbr3">숫자값3</span></th> -->
              <th><span id="col_nmbr3" style="display: none;">촬영실 숫자값03</span></th>
              <td><input type="hidden" id="nmbr3" name="nmbr3" value=""></td>
            </tr>
            <tr>
              <!-- 		                       	<th><span id="col_chrc4">문자값4</span></th> -->
              <th><span id="col_chrc4" style="display: none;">촬영실 문자값04</span></th>
              <td><input type="hidden" id="chrc4" name="chrc4" value="%"></td>
              <!-- 		                       	<th><span id="col_nmbr4">숫자값4</span></th> -->
              <th><span id="col_nmbr4" style="display: none;">촬영실 숫자값04</span></th>
              <td><input type="hidden" id="nmbr4" name="nmbr4" value=""></td>
            </tr>
            <tr>
              <!-- 		                       	<th><span id="col_chrc5">문자값5</span></th> -->
              <th><span id="col_chrc5" style="display: none;">촬영실 문자값05</span></th>
              <td><input type="hidden" id="chrc5" name="chrc5" value="TEST_1"></td>
              <!-- 		                       	<th><span id="col_nmbr5">숫자값5</span></th> -->
              <th><span id="col_nmbr5" style="display: none;">촬영실 숫자값05</span></th>
              <td><input type="hidden" id="nmbr5" name="nmbr5" value=""></td>
            </tr>
            </tbody>
          </table>
        </form>
      </div>
    </section>
    <!-- Data 영역설정 End -->
  </div>
  </div>
  <div id="bottom" >
  </div>
</div>

<script type="text/javaScript" language="javascript">
    /*var jsonData = ${data};
    console.log(jsonData);*/
    var i18n = JSON.parse('{"text_371":"","text_370":"","text_131":"건진","text_373":"","text_130":"입원","text_372":"","text_133":"예외구분","text_375":"","text_132":"예약 변동내역","text_374":"","text_124":"촬영실별","text_366":"","text_123":"촬영부위별","text_365":"","text_126":"예약기준 적용","text_368":"","text_125":"예약일자","text_367":"","text_128":"요일설정","text_127":"예약기준 삭제","text_369":"","text_129":"외래","text_360":"","text_120":"입원예약가능 ","text_362":"","text_361":"","text_122":"선택진료여부 ","text_364":"","text_121":"외래예약가능 ","text_363":"","text_113":"촬영부위","text_355":"","text_112":"촬영구분","text_354":"","text_115":"촬영방향","text_357":"","text_114":"통계부위","text_356":"","text_117":"입원촬영실","text_359":"","text_116":"처방코드  ","text_358":"","text_119":"이동촬영가능","text_118":"안내장서식","text_391":"","text_390":"","text_151":"희망시간","text_393":"","text_150":"희망일","text_392":"","text_153":"예약시간","text_395":"","text_152":"예약일","text_394":"","text_155":"처방참고내용","text_397":"","text_154":"처방을 선택하세요","text_396":"","text_146":"처방일","text_388":"","text_145":"환자명","text_387":"","text_148":"진료과","text_147":"처방명","text_389":"","text_149":"처방의사","text_380":"","text_140":"휴일 일자","text_382":"","text_381":"","text_142":"환자정보검색","text_384":"","text_141":"휴일 내용","text_383":"","text_144":"수납","text_386":"","text_143":"예약","text_385":"","text_135":"시작","text_377":"","text_134":"변동사유","text_376":"","text_137":"예외일자","text_379":"","text_136":"종료","text_378":"","text_139":"휴일 목록","text_138":"예외사유","text_171":"처방일","text_170":"처방상태","text_173":"접수시간","text_172":"접수일자","text_175":"수납","text_174":"응급","text_177":"검사예약현황","text_176":"DC","text_168":"참고내용","text_167":"국가","text_169":"영문명","text_160":"가예약여부","text_162":"미예약","text_161":"전체","text_164":"성별","text_163":"등록번호","text_166":"생년월일","text_165":"나이","text_157":"총 인원","text_399":"","text_156":"예약참고내용","text_398":"","text_159":"환자ID","text_158":"내원구분","text_191":"촬영구분","text_190":"정형문 코드","text_193":"공용코드","text_192":"판독약어명","text_195":"환자정보 ","text_194":"촬영일자 ","text_197":"판독시간","text_196":"판독일자","text_199":"음성판독여부","text_198":"판독의사","text_189":"의사ID","text_180":"방사선사","text_182":"병동","text_181":"영상 CD접수 관리","text_184":"재촬영","text_183":"병실","text_186":"처방 목록","text_185":"이동촬영","text_188":"처방 정보 상세","text_187":"환자 기본정보","text_179":"이동촬영접수 관리","text_178":"환자목록","message_199":"불용 처리할 정보를 선택해주세요.","message_198":"수정할 코드를 선택해주세요","message_191":"등록/수정중인 정보가 있습니다.저장 완료 후 다시 시도해주세요.","message_190":"프로그램 유형을 선택해주세요!","message_193":"대분류 코드를 입력해주세요.","message_192":"소분류 코드를 선택해주세요.","message_195":"대분류 코드 중복확인을 해주세요.","message_194":"불용일자는 적용일자보다 낮을 수 없습니다.","message_197":"중분류 자릿수를 입력해주세요","message_196":"중분류 한글 명을 입력해주세요","message_188":"해당 메뉴그룹 ID 정보가 등록되어 있습니다.","message_187":"숫자가 아닙니다.","message_189":"다른 정보를 먼저 저장해주세요.","message_180":"[구 분] 항목에서 판독을 선택 후다시 시도해주세요.","message_182":"저장 안 된정보가 있습니다. 저장하시겠습니까?","message_181":"자료 조회중입니다. 잠시만 기다리세요...","message_184":"메뉴 그룹ID 정보를 먼저 선택하세요!","message_183":"메뉴정보를 먼저 저장해주세요!","message_186":"이미 등록된 정보는 삭제가 불가합니다.","message_185":"이미 등록된 정보입니다.","message_177":"판독중인 내용이 아닙니다.","message_176":"입력하신 정보가 저장되지 않았습니다.다시 시도해주세요.","message_179":"이미 판독이 완료 되었습니다.","message_178":"판독 취소가 완료되었습니다.","message_171":"[구분] 항목에서 미판독/판독을 선택 후 다시 시도해주세요.","message_170":"의사ID를 선택해주세요","message_173":"판독이 완료된 내용은 판독의사만 수정이 가능합니다.","message_172":"이미 판독이 완료된 환자입니다.","message_175":"음성파일 또는 판독내용을 입력해주세요.","message_174":"수정버튼을 눌러주세요.","message_166":"사용자 등급이 낮아 수정할 수 없습니다.","message_165":"정형문 코드가 존재하지않습니다.","message_168":"사용자 등급이 낮아 수정할 수 없습니다.","message_167":"수정할 정보가 존재하지 않습니다.","message_169":"X번 행에 Y코드는 중복되는 코드입니다. 다른 코드를 사용해주세요.","message_160":"의사정보를 입력하세요!","message_162":"정상 저장되었습니다.","message_161":"같은날짜에 중복된 환자의 처방 정보가 있습니다. 확인해주세요.","message_164":"처방일자가 현재일자보다 과거날짜입니다.","message_163":"환자정보가 없습니다. 먼저 환자를 등록하세요.","message_155":"처방일자이 현재일자보다 과거날짜입니다.","message_154":"수정할 처방 정보를 선택해주세요.","message_157":"내원정보를 입력하세요!","message_156":"환자정보를 입력하세요!","message_159":"진료과정보를 입력하세요!","message_158":"처방일자를 입력하세요!","message_151":"처방 등록된 환자 정보가 존재하지않습니다.","message_150":"의사정보","message_153":"입력중엔 수정할 수 없습니다.","message_152":"환자정보를 먼저 입력하세요!","message_144":"처방 취소는 하지 못합니다.","message_143":"처리할 접수내역이 없습니다.","message_146":"예약할 검사정보가 존재하지 않습니다.","message_145":"처리할 취소내역이 없습니다.","message_148":"접수 처리 하시겠습니까?","message_147":"검색구분이 전체 접수/취소 할 수 없습니다.","message_149":"자료가 존재하지 않습니다.","message_140":"조회일자를 확인하세요.","message_142":"접수 처리 하시겠습니까?","message_141":"처방상태가 처방인 경우에만 접수처리할 수 있습니다.","message_133":"환자 등록 번호를 입력하세요","message_132":"환자 명을 입력하세요","message_135":"사용가능한 환자 등록 번호 입니다.","message_134":"중복된 환자 등록 번호 입니다.","message_137":"이미 등록된 환자입니다.","message_136":"생년월일을 입력하세요","message_139":"DC처리된 검사입니다!","message_138":"미수납된 검사입니다!","message_131":"성별을 선택해주세요","message_130":"중복확인을 다시 해주세요.","message_129":"중복된 번호 입니다.","message_122":"취소할 예약을 선택해주세요","message_121":"예약을 변경했습니다.","message_124":"예약을 정말 취소하시겠습니까?","message_123":"예약이 안된 처방입니다.","message_126":"예약 가능 수를 초과하여 예약 할 수 없습니다.","message_125":"예약이 취소되었습니다.","message_128":"사용 가능한 번호 입니다.","message_127":"등록된 환자 정보가 존재하지않습니다.","message_120":"예약되었습니다","message_119":"예약일이 처방일보다 먼저입니다. 다른 날짜를 선택해주세요","message_118":"이미 예약이 생성된 처방입니다. 예약을 변경하시겠습니까?","message_111":"저장 완료 후 삭제해주세요.","message_110":"조회 종료일은 조회 시작일 보다 높을 수 없습니다. 다시 선택해주세요.","message_113":"총 X 건중 Y 건이 처리되었습니다.","message_112":"X 행의 중복된 정보가 있습니다.","message_115":"환자 정보 조회","message_114":"환자 ID 또는 성명을 입력 후 검색하세요.","message_117":"예약할 시간을 선택해주세요","message_116":"예약할 처방을 선택해주세요","message_108":"해당 기간의 예약시간을 삭제하시겠습니까?","message_107":"해당 기간의 예약시간을 적용하시겠습니까?","message_109":"예외 정보가 존재하지않습니다.","message_100":"X 행의 시작시간이 Y 행의 스케쥴과 겹칩니다.","message_102":"기존의 예약기준과 겹쳐 생성할 수 없습니다.","message_101":"X 행의 정보 저장시 오류가 발생하였습니다.","message_104":"시간 입력이 잘못되었습니다.","message_103":"이미 적용된 예약기준이 있습니다. 필요시 삭제후 적용하시기 바랍니다.","message_106":"오류발생!","message_105":"유효하지 않은 간격입니다.","button_022":"다운로드","button_021":"음성듣기","button_020":"복사","button_026":"임시저장","button_025":"비우기","button_024":"판독취소","button_023":"판독완료","button_029":"일시정지","button_028":"녹음","button_027":"음성파일 업로드","button_011":"상세","button_010":"하위메뉴","message_310":"","button_015":"중복확인","button_014":"새로고침","button_013":"불용","button_012":"목록","button_019":"붙여넣기","button_018":"처방추가","button_017":"예약","button_016":"접수","message_306":"","message_305":"","message_308":"","message_307":"","message_309":"","message_300":"","message_302":"","button_004":"취소","message_301":"","button_003":"변경","message_304":"","button_002":"비밀번호 변경","message_303":"","button_001":"로그인","button_008":"저장","button_007":"입력","button_006":"삭제","button_005":"수정","button_009":"초기화","colname_005":"시작일","colname_004":"권한","colname_007":"오류횟수","colname_006":"종료일","text_401":"","text_400":"","text_403":"","text_402":"","text_405":"","text_404":"","text_407":"","text_406":"","text_409":"","text_408":"","text_430":"","text_421":"","text_420":"","text_423":"","text_422":"","text_425":"","text_424":"","text_427":"","text_426":"","text_429":"","text_428":"","text_410":"","text_412":"","text_411":"","text_414":"","text_413":"","text_416":"","text_415":"","text_418":"","text_417":"","text_419":"","text_210":"종료시간","text_201":"판독내용","text_200":"방사선사","text_203":"보류","text_202":"판독이력","text_205":"판독임시저장","text_204":"취소","text_207":"내용","text_206":"판독완료","text_209":"시작시간","text_208":"미판독","text_432":"","text_431":"","text_433":"","text_230":"로그아웃","text_232":"환자검색","text_231":"사용자","text_223":"소분류 코드 명","text_222":"중분류 코드 명","text_225":"소분류 영어 명","text_224":"중분류 영어 명","text_227":"소분류 약어 명","text_226":"중분류 약어 명","text_229":"메뉴재생성","text_228":"업무메뉴","text_221":"메뉴권한","text_220":"메뉴그룹ID","text_212":"예약 예외 목록","text_211":"조회일자","text_214":"수정","text_213":"입력","text_216":"메뉴ID","text_215":"삭제","text_218":"메뉴명","text_217":"순서","text_219":"입력된 값","text_250":"적용 영문명","text_010":"기준정보입력관리","text_252":"요일","text_251":"필수입력","text_012":"촬영실장비관리","text_254":"월","text_011":"촬영실관리","text_253":"년","text_003":"변경 비밀번호","text_245":"엑셀 다운로드","text_002":"현재 비밀번호","text_244":"엑셀 업로드","text_005":"업무메뉴","text_247":"촬영실","text_004":"변경 비밀번호 확인","text_246":"복사","text_007":"로그아웃","text_249":"적용명","text_006":"메뉴 재생성","text_248":"컬럼 명","text_009":"공통코드관리","text_008":"기준정보관리","text_241":"영문 명","text_240":"관리","text_001":"비밀번호 변경","text_243":"불용","text_242":"촬영코드","text_234":"워크리스트","text_233":"영상 실시 관리","text_236":"메뉴정보 관리","text_235":"촬영실별 통계","text_238":"코드","text_237":"코드등록","text_239":"코드 명","text_270":"일","text_030":"영상 판독문구 관리","text_272":"예약 상세정보","text_271":"예약 여부","text_032":"각종통계현황","text_274":"노트","text_031":"영상 판독관리","text_273":"예약 취소","text_034":"판독의별 통계","text_276":"처방","text_033":"장비별 통계","text_275":"사용자 ID","text_025":"영상 접수 관리","text_267":"목","text_024":"환자 정보 관리","text_266":"수","text_027":"이동촬영 접수","text_269":"토","text_026":"CD 접수 관리","text_268":"금","text_029":"판독관리","text_028":"처방 정보 관리","text_261":"휴게시간","text_260":"간격","text_021":"휴일 기준 관리","text_263":"월 ~ 금 일괄적용","text_020":"예외 기준 관리","text_262":"분","text_023":"환자 관리","text_265":"화","text_022":"예약 관리","text_264":"월","text_014":"관리자메뉴","text_256":"생성구분","text_013":"촬영코드관리","text_255":"시간 설정","text_016":"프로그램 정보 관리","text_258":"추가 생성","text_015":"사용자관리","text_257":"새로 생성","text_018":"예약 스케쥴 관리","text_017":"사용자별 메뉴 관리","text_259":"기준 생성","text_019":"예약 기준 관리","text_290":"전년","text_050":"진단검사","text_292":"총 합계","text_291":"소 계","text_052":"메뉴","text_294":"조회년도","text_051":"선택","text_293":"월별 합계","text_054":"조회","text_296":"프로그램 정보","text_053":"등록","text_295":"장비 명","text_056":"배치","text_298":"닫기","text_055":"출력","text_297":"검색어 입력","text_047":"사용","text_289":"합계","text_046":"호출방식","text_288":"접수일자 조회","text_049":"영상의학","text_048":"완료","text_281":"검색구분","text_280":"접수자","text_041":"시스템ID","text_283":"촬영자","text_040":"검색조건 입력","text_282":"촬영시간","text_043":"프로그램명","text_285":"예약 및 접수","text_042":"프로그램ID","text_284":"인쇄","text_045":"화면유형","text_287":"예약일자 조회","text_044":"프로그램 URL","text_286":"처방일자 조회","text_036":"사용자 현황","text_278":"실시","text_035":"사용자 명","text_277":"접수","text_038":"비밀번호 초기화","text_037":"비밀번호 초기화","text_279":"판독","text_039":"프로그램 등록 현황","text_070":"슈퍼관리자","text_072":"의사","text_071":"관리자","text_074":"메뉴그룹 현황","text_073":"방사선사","text_076":"구분","text_075":"메뉴 그룹 정보","text_078":"즐겨찾기 목록","text_077":"프로그램 등록현황","text_069":"먼저 사용자 정보를 선택하세요!","text_068":"정렬순서","message_099":"X 행의 값이 잘못 입력되었습니다.","message_092":"적용날자 입력이 잘못되었습니다","text_061":"메뉴 목록","message_091":"불용일자 입력이 잘못되었습니다","text_060":"검색어 입력","message_094":"입력 또는 수정 버튼을 눌러주세요!","text_063":"메뉴그룹명","message_093":"정상적으로 입력되었습니다.","text_062":"해당 프로그램 목록","message_096":"조회된 정보가 없습니다.","text_065":"사용자 정보 목록","message_095":"중복된 촬영코드입니다","text_064":"상위메뉴","message_098":"수정할 정보가 존재하지 않습니다.","text_067":"유효여부","message_097":"삭제할 행이 없습니다.","text_066":"메뉴 정보 목록","text_058":"팝업화면","text_057":"메인화면","text_299":"코드 명 검색","text_059":"메뉴헤더","message_090":"일자 입력이 잘못되었습니다","message_089":"촬영코드를 선택해 주세요.","message_088":"코드를 입력해주세요.","text_090":"문자값","text_092":"입력명","text_091":"숫자값","message_081":"소분류 한글 명을 입력하세요!","text_094":"선택대분류코드","message_080":"대분류 코드 추가 입력하시겠습니까?","text_093":"입력값","message_083":"등록된 정보가 존재하지않습니다.","text_096":"촬영실 코드 관리","message_082":"수정한 정보를 저장하시겠습니까?","text_095":"컬럼적용구분","message_085":"N행 [적용명]을 입력해주세요.","text_098":"상세정보","message_084":"기존에 저장된 정보가 손상될 수 있습니다. 정말 수정 하시겠습니까?","text_097":"촬영실 한글 명","message_087":"N행 [입력명1], [입력값1]을 입력해주세요.","message_086":"N행 [선택대분류코드]를 선택해주세요.","text_099":"촬영실 영문 명","colname_001":"사용자ID","colname_003":"비밀번호","colname_002":"사용자명","message_078":"불용일자를 입력하세요!","message_077":"적용일자를 입력하세요!","message_079":"아이디가 변경되었습니다.중복확인을 다시해주세요.","text_081":"중분류 코드","text_080":"소분류 코드","message_070":"사용 가능한 코드 입니다","text_083":"자릿수","text_082":"대분류 한글 명","message_072":"날짜는 yyyy-mm-dd 형식으로 입력해주세요","text_085":"적용일자","message_071":"이미 사용중인 코드 입니다.다른 코드를 사용해주세요.","text_084":"출력순","message_074":"대분류 한글 명을 입력하세요!","text_087":"대분류 한글 명","message_073":"대분류 코드를 입력하세요!","text_086":"불용일자","message_076":"출력 순서를 입력하세요!","text_089":"대분류 약어 명","message_075":"대분류 자릿수를 입력하세요!","text_088":"대분류 영어 명","text_079":"대분류 코드","message_067":"삭제가 완료 되었습니다.","message_066":"정말 삭제하시겠습니까?","message_069":"등록/수정중인 정보가 있습니다. 무시하고 이동하시겠습니까?","message_068":"하위코드가 존재합니다. 하위코드 삭제 후 다시 시도해주세요.","message_061":"불용 처리가 완료 되었습니다.","message_060":"정말 불용 처리 하시겠습니까?","message_063":"X 번 행에 미 입력/오류 사항이 있습니다 다시 입력해주세요.","message_062":"X 번 행에 Y 코드는 중복되는 코드입니다. 다른 코드를 사용해주세요.","message_065":"변경할 정보가 없습니다.","message_064":"X 번 행에 불용일자는 적용일자보다 낮을 수 없습니다.","message_056":"검색","message_298":"","message_055":"소분류 코드 항목을 선택해주세요.","message_297":"","button_032":"임시저장","message_058":"중분류 코드 등록/수정중인 정보가 있습니다. 저장 후 다시 시도해주세요.","button_031":"완료","message_057":"소분류 코드 등록/수정중인 정보가 있습니다. 저장 후 다시 시도해주세요.","message_299":"","button_030":"일시정지 해제","message_059":"이 코드의 추가적인 하위코드를 입력할 수 없습니다.","message_290":"","message_050":"중분류 코드를 선택해주세요.","message_292":"","message_291":"","message_052":"소분류 코드가 존재하지않습니다.","message_294":"","message_051":"중분류 코드가 존재하지않습니다.","message_293":"","message_054":"중분류 코드 항목을 선택해주세요.","message_296":"","message_053":"대분류 코드 항목을 선택해주세요.","message_295":"","message_045":"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요!","message_287":"","message_044":"메뉴 권한정보을 입력하세요!","message_286":"","message_047":"이미 즐겨찾기 정보에 등록되었습니다!","message_289":"","message_046":"N 행의 순서를 입력해주세요!","message_288":"","message_049":"대분류 코드를 선택해주세요.","message_048":"대분류 코드가 존재하지않습니다.","message_281":"","message_280":"","message_041":"메뉴 그룹ID을 입력하세요!","message_283":"","message_040":"행의 메뉴그룹ID 를 선택해 주세요!","message_282":"","message_043":"메뉴 ID명을 입력하세요!","message_285":"","message_042":"메뉴 ID을 입력하세요!","message_284":"","message_034":"메뉴ID을 입력하세요!","message_276":"","message_033":"자료가 존재하지않습니다.","message_275":"","message_036":"X행의 정보 저장시 오류가 발생하였습니다.","message_278":"","message_035":"메뉴명을 입력하세요!","message_277":"","message_038":"선택한 정보가 존재하지 않습니다.","message_037":"프로그램ID을 입력하세요!","message_279":"","message_039":"행의 메뉴그룹ID가 중복되었습니다!","message_270":"","message_030":"저장할 정보가 존재하지 않습니다.","message_272":"","message_271":"","message_032":"메뉴 그룹명을 입력하세요!","message_274":"","message_031":"메뉴 그룹ID을 입력하세요!","message_273":"","message_023":"삭제시 메뉴도 같이 삭제됩니다. 해당 프로그램 정보를 삭제하시겠습니까?","message_265":"","message_022":"비밀번호가 초기화되었습니다.","message_264":"","message_025":"총 X 건이 처리되었습니다.","message_267":"","message_024":"해당 프로그램 ID 정보가 등록되어 있습니다!","message_266":"","message_027":"프로그램ID를 입력하세요!","message_269":"","message_026":"시스템정보를 선택하세요!","message_268":"","message_029":"프로그램 URL을 입력하세요!","message_028":"프로그램명을 입력하세요!","message_261":"","message_260":"","message_021":"사용자 정보를 확인하세요!","message_263":"","message_020":"비밀번호를 초기화하시겠습니까?","message_262":"","message_019":"수정할 정보가 존재하지 않습니다.","message_012":"로그인 후 이용해 주세요!","message_254":"","message_011":"변경할 비밀번호가 상이합니다. 확인 후 다시 입력하세요!","message_253":"","message_014":"삭제할 수 없는 정보입니다.","message_256":"","message_013":"X행 미입력 사항이 있습니다.","message_255":"","message_016":"저장할 정보가 없습니다.","message_258":"","message_015":"자료조회중입니다. 잠시만 기다려주세요","message_257":"","message_018":"처리구분을 확인하세요!","message_017":"삭제할 정보가 존재하지 않습니다.","message_259":"","message_250":"","message_010":"이전 비밀번호를 입력하세요!","message_252":"","message_251":"","message_009":"사용자 번호를 확인해주세요!","message_008":"비밀번호를 변경하시겠습니까?","message_001":"사용자 ID를 입력하세요!","message_243":"","message_242":"","message_003":"입력한 사용자 비밀번호가 다릅니다! 비밀번호 확인 후 다시 입력하세요.","message_245":"","message_002":"비밀번호를 입력하세요!","message_244":"","message_005":"사용 종료된 ID 입니다.","message_247":"","message_004":"비밀번호 5회 이상 잘못 입력하였습니다. 관리자에게 문의하시길 바랍니다!","message_246":"","message_007":"정상 처리되었습니다. 다시 로그인하세요!","message_249":"","message_006":"사용자 ID 정보가 존재하지 않습니다.","message_248":"","message_241":"프로그램을 먼저 선택해주세요.","message_240":"하위 프로그램을 먼저 삭제해주세요","message_239":"이미 메뉴그룹 정보에 등록되었습니다.","message_232":"엑셀 파일만 업로드 가능합니다.","message_231":"엑셀 파일을 선택해 주세요.","message_234":"엑셀 업로드 후 저장 해 주세요.","message_233":"업로드 하시겠습니까?","message_236":"적용기간 내 동일한 촬영코드가  중복됩니다. 적용기간을 수정해주세요","message_235":"정보 변경은 촬영 코드 관리화면에서만 가능합니다.","message_238":"오류가 발생했습니다. 다시 시도해 주세요.","message_237":"엑셀 파일 양식이 올바르지 않습니다.","message_230":"엑셀 파일을 업로드 해 주세요","message_229":"검색어를 입력해주세요.","message_228":"처방 정보를 선택해주세요.","message_221":"통계 자료가 존재하지않습니다.","message_220":"접수 취소는 하지 못합니다.","message_223":"수정할 정보를 선택해주세요.","message_222":"\u0027-\u0027를 제외하고 입력해주세요.","message_225":"삭제할 행을 선택해주세요","message_224":"환자ID를 입력해주세요","message_227":"[구 분] 항목에서 미판독을 선택 후 다시 시도해주세요.","message_226":"정말 취소하시겠습니까?","message_218":"실시 처리 하시겠습니까?","message_217":"처방상태가 접수인 경우에만 실시처리할 수 있습니다.","message_219":"처리할 실시내역이 없습니다.","message_210":"유효하지 않은 날자입니다.","message_212":"해당 작업의 실행권한이 없습니다!","message_211":"환자정보가 없습니다!","message_214":"검색구분을 접수, 취소 중 하나를 선택해주세요.","message_213":"취소 처리 하시겠습니까?","message_216":"이미 실시된 처방입니다.","message_215":"췰영명을 입력해주세요.","message_207":"불용일자가 적용일보다 더 커서 불용처리 할 수 없습니다.","message_206":"이미 불용처리된 촬영코드입니다","message_209":"삭제되었습니다.","message_208":"X 입력이 필요합니다.","message_201":"삭제할 코드를 선택해주세요","message_200":"코드를 불용 처리 하시겠습니까?","message_203":"X 을(를) 선택해주세요.","message_202":"코드를 삭제 처리 하시겠습니까?","message_205":"중복확인을 해주세요!","message_204":"X 을(를) 입력하세요!","text_300":"음성녹음","text_302":"환자정보 목록","text_301":"업로드","text_304":"전화번호","text_303":"환자 상세정보","text_306":"여","text_305":"남","text_308":"판독임시저장","text_307":"음성판독","text_309":"보류","text_331":"사용자 목록","text_330":"초기화 후 저장","text_322":"선택진료","text_321":"입원 예약","text_324":"비고","text_323":"이동촬영","text_326":"중복","text_325":"신규","text_328":"양식 다운로드","text_327":"엑셀 파일 선택","text_329":"신규 코드 추가","text_320":"외래 예약","text_311":"구분","text_310":"취소","text_313":"판독정형문","text_312":"PACS 뷰어 조회","text_315":"부위코드","text_314":"촬영코드 검색","text_317":"통계 코드","text_316":"촬영실 코드","text_319":"서식 코드","text_318":"방향 코드","text_351":"","text_350":"","text_111":"촬영약어명","text_353":"","text_110":"촬영명","text_352":"","text_102":"촬영실 장비","text_344":"","text_101":"촬영실 정보","text_343":"","text_104":"촬영실","text_346":"","text_103":"촬영실 장비 코드 관리","text_345":"","text_106":"장비영문명","text_348":"","text_105":"장비한글명","text_347":"","text_108":"촬영횟수 ","text_107":"사용여부","text_349":"","text_109":"촬영영어명","text_340":"기준정보 입력관리","text_100":"촬영실 촬영구분","text_342":"","text_341":"","text_333":"기간","text_332":"출력일","text_335":"출력 건수","text_334":"출력자","text_337":"예외","text_336":"휴일","text_339":"기능 명","text_338":"프로그램 기능 권한 관리"}');
    if(i18n == null){
      //alert(i18n.message_012); //"로그인 후 이용해주세요"
      document.chkfrm.action = "/index.do";
      document.chkfrm.submit();
    }

    var iud = "";
    var q_mddl_cd = "";
    var currdate = "";
    var lrgc_cd = "";
    var q_user_id = "";
    var BrowserChk = "";
    if(BrowserChk == "EXPLORE"){
      $("#searchstart_date").prop("type","text");
      $("#searchend_date").prop("type","text");
      $("#appl_date").prop("type","text");
      $("#expr_date").prop("type","text");
    }else{
      $("#searchstart_date").prop("type","date");
      $("#searchend_date").prop("type","date");
      $("#appl_date").prop("type","date");
      $("#expr_date").prop("type","date");
    }

    if(BrowserChk == "EXPLORE"){
      $(function(){
        $('#searchstart_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        $('#searchend_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        $('#appl_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        $('#expr_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
      });
    }

    // 필수 입력컬럼 저장
    var null_clmn_nm = new Array();
    var null_appl_kr_nm = new Array();
    var null_appl_dvsn = new Array();
    var clmn_dvsn_selc = new Array();
    /* 시작 시 */
    $(document).ready(function(){
      currdate = $("#currdate").val();
      q_user_id = $("#q_user_id").val();
      lrgc_cd = $("#lrgc_cd").val();
      //checkBox()
      var gwidth =$(".grid1").width();
      var gheight = $(".inquiry__result-section").height();
      gwidth = parseInt(gwidth);
      $(".srcArea").attr("style","display:flex;justify-content: space-between;");

      var checkLMS = $("#checkLMS").val();
      var hspt_id = $("#hspt_id").val();
      var mddl_cd = $("#mddl_cd").val();

      /* 그리드(중분류) */
      $('#list').jqGrid({
        url: "/RIS0102E00List.do?hsptId=A001&lrgcCd=IMGN_EQPM_CD",
        postData : {
          checkLMS : "M",
          lrgc_cd  : lrgc_cd,
          use_yn : $('input:radio[name="use_yn"]:checked').val(),
          search_mddl_cd:$("#searchKeyword").val(),
          search_cd: "D",
          searchstatus	: "M"
        }, // URL에서 검색 조건으로 가져갈 파라미터
        reordercolNames:true,
        mtype:'POST', // 전송 타입
        datatype : "json", // 받는 데이터 형태
        colNames:[ i18n.text_076, '병원ID', '대분류 코드', i18n.text_238,i18n.text_239,'불용일자'], //테이블의 제목 //'구분' '코드 명'  '코드 한글 명'
        colModel:[
          { name: 'iud'		  , index: 'iud'		, width: 20 , align:"center",
            formatter:"select",
            formatoptions :{value:"N:--"},
            edittype:"select",
            editoptions: {value:"N:--"}
          },
          { name: 'hsptId'	  , index: 'hsptId'	, width: 0  , hidden: true}																			,
          { name: 'lrgcCd'	  , index: 'lrgcCd'	, width: 0  , hidden: true}																			,
          { name: 'mddlCd'	  , index: 'mddlCd'	, width: '60px' , align:"left" , editable: true , editoptions:{maxlength : 20}, key: true}		,
          { name: 'mddlKrNm' , index: 'mddlKrNm' , width: '80px' , align:"left" , editable: true , editoptions:{maxlength : 100}}					,
          { name: 'exprDate'  , index: 'exprDate'	, width: 0  , hidden: true}																			,
          ,
        ], //서버에서 받은 데이터 설정
        jsonReader: {
          repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
          root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
          //page:'page', // 현재 페이지 currentPage
          //total:'total', // 총 페이지 수 totalPage
          records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
        },
        width : gwidth-20,
        height : gheight*0.8, //테이블의 세로 크기, Grid의 높이
        loadtext :i18n.message_015, //"자료 조회중입니다. 잠시만 기다리세요..."
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
          /* for(var i in ids){
              var expr_date = $('#list').getCell(ids[i], "expr_date");
              if(expr_date <= currdate){
                $("#list").setRowData(ids[i], false,{background:"#FF0000"});
              }

            }
           */
          var totcnt  = jQuery("#list").jqGrid("getGridParam","records");
          $("#table input[type=text]").attr("readonly", true);
          $("#table input[type=text]").val("");

          $("#table input[type=date]").attr("readonly", true);
          $("#table input[type=date]").val(currdate);

          $("#table input[type=radio]").attr("checked", false);
          $("#table input[type=radio]").attr("onclick", "return false");

          $("#table input[type=checkbox]").attr("checked", false);
          $("#table input[type=checkbox]").attr("onclick", "return false");

          $("#table select").attr("disabled",true);
          if(totcnt < 1){
            $("#list > tbody").append("<tr><td align='center' colspan='9'>&nbsp;</td></tr><tr><td align='center' colspan='11'><b>"+i18n.message_083+"<br/></b></td></tr><tr><td align='center' colspan='11'>&nbsp;</td></tr>"); //등록된 정보가 존재하지않습니다.
          }else{
            if(q_mddl_cd.length > 1){
              q_mddl_cd = q_mddl_cd.toUpperCase();
              $("#list").jqGrid('setSelection', q_mddl_cd, true);
            }else{
              $("#list").jqGrid('setSelection', ids[0], true);
            }
          }
        },
        beforeSelectRow: function (rowid, e) {
          $("#list").jqGrid('setSelection', rowid, true);
        },
        onSelectRow: function(rowid) {
          var rowObject = $("#list").jqGrid('getRowData',rowid);

          $("#table input[type=text]").attr("readonly", true);
          $("#table input[type=text]").val("");

          $("#table input[type=date]").attr("readonly", true);
          $("#table input[type=date]").val(currdate);

          $("#table input[type=radio]").attr("checked", false);
          $("#table input[type=radio]").attr("onclick", "return false");

          $("#table input[type=checkbox]").attr("checked", false);
          $("#table input[type=checkbox]").attr("onclick", "return false");

          $("#table select").attr("disabled",true);
          $("#table select option:eq(0)").prop("selected",true);

          if(rowObject.mddlCd == "%"){
            return
          }
          $.ajax({
            type : "post",
            url : "/RIS0102E00View.do?checkLMS=M&hsptId="+rowObject.hsptId+"&lrgcCd="+rowObject.lrgcCd+"&mddlCd="+rowObject.mddlCd,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            error : function(){
              alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
            },
            success : function(data) {
              $("#mddl_cd").val(data.rows.mddlCd);
              $("#appl_date").val(data.rows.applDate);
              $("#otpt_sqnc").val(data.rows.otptSqnc);
              $("#expr_date").val(data.rows.exprDate);
              $("#mddl_kr_nm").val(data.rows.mddlKrNm);
              $("#mddl_engl_nm").val(data.rows.mddlEnglNm);
              var nmbr = [data.rows.nmbr1,data.rows.nmbr2,data.rows.nmbr3,data.rows.nmbr4,data.rows.nmbr5];
              var chrc = [data.rows.chrc1,data.rows.chrc2,data.rows.chrc3,data.rows.chrc4,data.rows.chrc5];

              for(var i=1;i<=5;i++){
                if($("#nmbr"+i).prop("tagName") == "SELECT"){
                  $("#nmbr"+i).val(nmbr[(i-1)]).prop("selected", true);

                }else if($("#nmbr"+i).prop("tagName") == "SPAN"){
                  $("input:radio[name='nmbr"+i+"']:input[value='"+nmbr[(i-1)]+"']").prop('checked', true); // 선택하기

                }else if($("#nmbr"+i).prop("tagName") == "DIV"){
                  var checkbox_data = nmbr[(i-1)].split(',');
                  for(x in checkbox_data){
                    $("input:checkbox[name='nmbr"+i+"']:checkbox[value='"+checkbox_data[x]+"']").prop('checked', true); // 선택하기
                  }
                }else{
                  $("#nmbr"+i).val(nmbr[(i-1)]);
                }

                if($("#chrc"+i).prop("tagName") == "SELECT"){
                  $("#chrc"+i).val(chrc[(i-1)]).prop("selected", true);

                }else if($("#chrc"+i).prop("tagName") == "SPAN"){
                  $("input:radio[name='chrc"+i+"']:input[value='"+chrc[(i-1)]+"']").prop('checked', true); // 선택하기

                }else if($("#chrc"+i).prop("tagName") == "DIV"){
                  var checkbox_data = chrc[(i-1)].split(',');
                  for(x in checkbox_data){
                    $("input:checkbox[name='chrc"+i+"']:checkbox[value='"+checkbox_data[x]+"']").prop('checked', true); // 선택하기
                  }
                }else{
                  $("#chrc"+i).val(chrc[(i-1)]);
                }
              }
              iud = "";
            }
          });
        }
      }); // 중분류 그리드 END
    }) // getReady END

    $(window).bind('resize', function() {
      if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
      else {
        var gridw = $('.grid1').width()-10;
        fn_resize("list", gridw , '');
      }
    }).trigger('resize');

    // 촬영실 or 촬영장비 checkBox 선택
    function checkBox(){
      iud = "";
      null_clmn_nm.length=0;
      null_appl_kr_nm.length=0;
      null_appl_dvsn.length=0;
      clmn_dvsn_selc.length=0;
      $.ajax( {
        type : "post",
        url : "/RIS0102E00List.do?hsptId=A001&lrgcCd="+lrgc_cd,
        dataType : "json",
        async : false,
        error : function(){
          alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          console.log(data.rows.length);
          for(var i=0; i< data.rows.length;i++){
            var clmn_nm = data.rows[i].clmn_nm	// 컬럼 명
            var appl_kr_nm = data.rows[i].appl_kr_nm
            // 라디오 및 체크박스 제작
            var iput_vlue = [data.rows[i].iput_vlue1, data.rows[i].iput_vlue2, data.rows[i].iput_vlue3, data.rows[i].iput_vlue4, data.rows[i].iput_vlue5]
            var iput_nm = [data.rows[i].iput_nm1, data.rows[i].iput_nm2, data.rows[i].iput_nm3, data.rows[i].iput_nm4, data.rows[i].iput_nm5]

            // 필수 사항 저장
            if(data.rows[i].rqrd_yn == "Y" && data.rows[i].clmn_appl_dvsn != "H"){
              appl_kr_nm = "*"+appl_kr_nm
              null_clmn_nm.push(clmn_nm)
              null_appl_kr_nm.push(data.rows[i].appl_kr_nm)

              if(data.rows[i].clmn_appl_dvsn == "R"){
                null_appl_dvsn.push("R")
              }else if(data.rows[i].clmn_appl_dvsn == "C"){
                null_appl_dvsn.push("C")
              }else if(data.rows[i].clmn_appl_dvsn == "S"){
                null_appl_dvsn.push("S")
              }else{
                null_appl_dvsn.push("T")
              }
            }

            var text ="";
            $("#col_"+clmn_nm).show()					// hide 된 태그를 보이게 함

            $("#col_"+clmn_nm).text(appl_kr_nm)		// span 태그에 이름 부여

            // radio
            if(data.rows[i].clmn_appl_dvsn == "R"){
              text = '<span id="'+clmn_nm+'">'
              for(var x=0;x<iput_vlue.length;x++){
                if(iput_vlue[x] != null){
                  text += '   <label>'
                  text += '<input type="radio" name="'+clmn_nm+'" value="'+iput_vlue[x]+'" onclick="return false"/>';
                  text += iput_nm[x]+'</label>';
                }
              }
              text += '</span>';
              $("#"+clmn_nm).replaceWith($(text))

              // checkBox
            }else if(data.rows[i].clmn_appl_dvsn == "C"){

              /* text = "<span id='"+clmn_nm+"'><input type='checkbox' name='"+clmn_nm+"' value='"+data.ris0109List[i].iput_vlue1+"' />"+data.ris0109List[i].iput_nm1+"</span>";
              $("#"+clmn_nm).replaceWith($(text)) */

              text = '<div id="'+clmn_nm+'">'
              for(var x=0;x<=iput_vlue.length;x++){
                if(iput_vlue[x] != null){
                  text += '   <label>'
                  text += '<input type="checkbox" name="'+clmn_nm+'" value="'+iput_vlue[x]+'" onclick="return false"/>';
                  text += iput_nm[x]+'</label>';
                }
              }
              text += '</div>';
              $("#"+clmn_nm).replaceWith($(text))

              // Date
            }else if(data.rows[i].clmn_appl_dvsn == "D"){
              if(BrowserChk == "EXPLORE"){
                text = "<input type='text' id='"+clmn_nm+"' name='"+clmn_nm+"' value='"+currdate+"' />";
                datepicketSet(clmn_nm);
                $("#"+clmn_nm).replaceWith($(text))
              }else{
                text = "<input type='date' id='"+clmn_nm+"' name='"+clmn_nm+"' value='"+currdate+"' />";
                $("#"+clmn_nm).replaceWith($(text))
              }


              // selectBox
            }else if(data.rows[i].clmn_appl_dvsn == "S"){
              clmn_dvsn_selc.push(clmn_nm)
              text = "<select id='"+clmn_nm+"' name='"+clmn_nm+"' disabled='disabled'><select>";
              $("#"+clmn_nm).replaceWith($(text))
              var LMS = "M";

              $.ajax({
                type : "post",
                url : "/json/code/risCodeList.do?checkLMS="+LMS+"&lrgc_cd="+data.rows[i].elct_lrgc_cd,
                async : false,
                error : function(){
                  alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
                },
                success : function(data) {
                  if(data.rows.length  < 1){
                    $("#"+clmn_nm).find("option").remove().end().append("<option label = 'ㅡㅡㅡㅡㅡ'/>");
                  }else{
                    for(var i = 0; i <data.rows.length ; i++){
                      if(data.rows[i].mddl_cd != "%"){
                        $("#"+clmn_nm).append("<option value='"+data.rows[i].mddl_cd+"'>"+data.rows[i].mddl_kr_nm+"</option>");
                      }
                    }
                  }
                }
              });

              // hide
            }else if(data.rows[i].clmn_appl_dvsn == "H"){
              text = "<input type='hidden' id='"+clmn_nm+"' name='"+clmn_nm+"' value='' />";
              $("#"+clmn_nm).replaceWith($(text))
              $("#col_"+clmn_nm).hide()

              // text
            }else{
              text = "<input type='text' id='"+clmn_nm+"' name='"+clmn_nm+"' value='' />";
              $("#"+clmn_nm).replaceWith($(text))
            }
          }

        }
      });

      jQuery('#list').jqGrid('setGridParam', {
        postData: {
          lrgcCd : lrgcCd,
        },
        datatype:"json"
      }).trigger("reloadGrid");
    }

    function datepicketSet(clmn_nm){
      $(function(){
        $("#"+clmn_nm).datepicker({ dateFormat: 'yy-mm-dd' }).val(currdate);
      })
    }

    // 날짜 선택
    function fn_egov_selectGrid(){
      jQuery('#list').jqGrid('setGridParam', {
        postData: {
          use_yn : $('input:radio[name="use_yn"]:checked').val(),
          search_mddl_cd:$("#searchKeyword").val(),
          search_cd: "D",
        },
        datatype:"json"
      }).trigger("reloadGrid");
    }

    // 입력
    function fn_add(){
      if(iud != "U" && iud != "I"){
        $("#table input").attr("readonly", false);

        $("#table input[type=radio]").attr("checked", false);
        $("#table input[type=radio]").attr("onclick", "");

        $("#table input[type=checkbox]").attr("checked", false);
        $("#table input[type=checkbox]").attr("onclick", "");

        $("#table select").attr("disabled",false);
        if(clmn_dvsn_selc != null){
          for(var i in clmn_dvsn_selc){
            $("#" + clmn_dvsn_selc[i] + " option:eq(0)").prop("selected",true);
          }
        }
        $("#table input[type=text]").val("");
        $("#table input[type=date]").val(currdate);
        $("#expr_date").val("3000-01-01");
        iud = "I";
      }
    }

    // 수정
    function fn_update(){
      var rowid = $("#list" ).getGridParam( "selrow" );
      if(iud == "I"){
        return
      }
      if(rowid == "" || rowid == null){
        alert(i18n.message_198); //"수정할 정보를 선택해주세요."
        return
      }
      if(iud != "I"){
        iud = "U";
        $("#table input[type=text]").attr("readonly", false);
        $("#table input[type=date]").attr("readonly", false);
        $("#table input[type=text]").attr("disabled", false);
        $("#table input[type=date]").attr("disabled", false);
        $("#table select").attr("disabled",false);
        $("#table input[type=radio]").attr("onclick", "");
        $("#table input[type=checkbox]").attr("onclick", "");
        $("#mddl_cd").attr("readonly", true);
        $("#mddl_cd").attr("disabled", true);
        $("#mddl_kr_nm").focus();
      }
    }

    /* 아이디 중복확인 */
    var checkId = ""; // 중복체크 한 아이디를 저장, 등록시에 변경여부 확인
    function overlapCheck(LMS){
      var mddl_cd = $("#mddl_cd").val();

      if(mddl_cd == null || mddl_cd == ""){
        alert(i18n.message_088); //"코드를 입력해주세요."
        return
      }

      if(iud != "I"){
        return
      }

      $.ajax( {
        type : "post",
        url : "/json/code/risCodeCheck.do?checkLMS=M&lrgc_cd="+lrgc_cd+"&mddl_cd="+mddl_cd,
        dataType : "json",
        error : function(){
          alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          if(data.error_code == "0"){
            checkId = mddl_cd;			// 등록 시ID와 중복확인ID 를 비교하기 위함
            alert(i18n.message_070); //"사용 가능한 코드 입니다."
          }else{
            alert(i18n.message_071); //"이미 사용중인 코드 입니다.\n다른 코드를 사용해주세요."
            $("#mddl_cd").focus();
          }
        }
      });
    }

    // 불용
    function fn_expr(){
      if(iud == "I"){
        return
      }
      var rowid = $("#list" ).getGridParam( "selrow" );
      if(rowid == "" || rowid == null){
        alert(i18n.message_199); //"불용 처리할 정보를 선택해주세요."
        return
      }
      if(!confirm(i18n.message_200)){ //"코드를 불용 처리 하시겠습니까?"
        return
      }
      document.regfrm.iud.value = "D";

      var authok = $("form[name='regfrm']").serialize();
      $.ajax({
        type : "post",
        url : "/RIS0102E00UpdateData.do?checkLMS=M",
        data : authok,
        error : function(){
          alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          if(data.error_code == "0"){
            q_mddl_cd = $("#mddl_cd").val()
            jQuery('#list').jqGrid('setGridParam', {
              postData: {
                q_mddl_cd : q_mddl_cd,
              },
              datatype:"json"
            }).trigger("reloadGrid");
            document.regfrm.iud.value = "";
          }
        }
      });
    }

    //삭제
    function fn_delete(){
      if(iud == "I"){
        return
      }
      var rowid = $("#list" ).getGridParam( "selrow" );
      if(rowid == "" || rowid == null){
        alert(i18n.message_201); //"삭제할 정보를 선택해주세요."
        return
      }
      if(!confirm(i18n.message_202)){ //"코드를 삭제 처리 하시겠습니까?"
        return
      }
      var rowid     = $("#list" ).getGridParam( "selrow" );
      var lrgc_cd   = $('#list').getCell(rowid, "lrgcCd");
      var mddl_cd   = $('#list').getCell(rowid, "mddlCd");

      $.ajax({
        type : "post",
        url : "/RIS0102E00DeleteData.do?checkLMS=M&lrgcCd="+lrgc_cd+"&mddlCd="+mddl_cd
          +"&q_user_id="+q_user_id+"&currdate="+currdate,
        error : function(){
          alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          jQuery("#list").trigger("reloadGrid");
        }
      });
    }

    // 저장
    function fn_save(){
      var rowid = $("#list" ).getGridParam( "selrow" );
      if(iud == null || iud == ""){
        alert(i18n.message_016); //"저장할 정보가 없습니다."
      }else{
        if(null_clmn_nm != null){
          for(var i in null_clmn_nm){
            if(null_appl_dvsn[i] == "C"){
              if($('input[name="'+null_clmn_nm[i]+'"]:checked').val() == null){
                alert(i18n.message_203.replace("X",null_appl_kr_nm[i]));
                return;
              }
            }else if(null_appl_dvsn[i] == "R"){
              if($('input[name="'+null_clmn_nm[i]+'"]:checked').val() == null){
                alert(i18n.message_203.replace("X",null_appl_kr_nm[i]));
                return;
              }
            }else if(null_appl_dvsn[i] == "S"){
              if($('#'+null_clmn_nm[i]).val() == "%"){
                alert(i18n.message_203.replace("X",null_appl_kr_nm[i]));
                return;
              }
            }else{
              if(!fnRequired(null_clmn_nm[i], i18n.message_204.replace("X",null_appl_kr_nm[i]))) return;
            }
          }
        }

        if(!fnRequired('appl_date',i18n.message_077)) return; //'적용일자를'
        if(!fnRequired('otpt_sqnc',i18n.message_076)) return; //'출력 순서를'

        if(iud == "I"){
          if(checkId == null || checkId =="" || checkId != $("#mddl_cd").val()){
            alert(i18n.message_205); //"중복확인을 해주세요!"
            checkId = "";
            return
          }
        }

        document.regfrm.iud.value = iud;

        console.log(iud);
        var authok = $("form[name='regfrm']").serializeObject();
        authok = JSON.stringify(authok);
        console.log(authok);
        if(iud == "I"){
          $.ajax({
            type : "post",
            url : "/RIS0102E00InsertData.do?checkLMS=M",
            data : authok,
            dataType : "json",
            contentType : "application/json; charset=UTF-8",
            async : false,
            error : function(){
              alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
            },
            success : function(data) {
              if(data.error_code == "0"){
                q_mddl_cd = $("#mddl_cd").val()
                jQuery('#list').jqGrid('setGridParam', {
                  postData: {
                    q_mddl_cd : q_mddl_cd,
                  },
                  datatype:"json"
                }).trigger("reloadGrid");
                document.regfrm.iud.value = "";
              }
            }
          });
        }else if(iud =="U"){
          $.ajax({
            type : "post",
            url : "/RIS0102E00UpdateData.do?searchstatus=M&checkLMS=M",
            data : authok,
            dataType : "json",
            contentType : "application/json; charset=UTF-8",
            async : false,
            error : function(){
              alert(i18n.message_045); //"[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
            },
            success : function(data) {
              if(data.error_code == "0"){
                q_mddl_cd = $("#mddl_cd").val()
                jQuery('#list').jqGrid('setGridParam', {
                  postData: {
                    q_mddl_cd : q_mddl_cd,
                  },
                  datatype:"json"
                }).trigger("reloadGrid");
                document.regfrm.iud.value = "";
              }
            }
          });
        }

      }
    }

    /* 엔터키 검색  */
    function enter(){
      if(window.event.keyCode==13){
        fn_egov_selectGrid();	// 조회(검색)
      }
    }

    function fn_reset(){
      if(iud == "I"){
        $('#regfrm')[0].reset()
      }else if(iud == "U"){
        var rowid = $("#list" ).getGridParam( "selrow" );
        $("#list").jqGrid('setSelection', rowid, true);
        fn_update()
      }
    }
  </script>
</body>
</html>
