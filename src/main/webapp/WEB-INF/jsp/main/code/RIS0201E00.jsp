<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <meta http-equiv="Cache-Control" content="no-Cache" />
  <meta http-equiv="Pragma" content="no-Cache" />
  <meta http-equiv="imagetoolbar" content="no" />

  <style>
      .header__menu h1{
          font-size:25px;
      }
      .header__menu h1 sapn{
          font-size:12px;
      }
  </style>

  <script>
    var i18n = JSON.parse('null');
    if(i18n == null){
      //alert(i18n.message_012); //"로그인 후 이용해주세요"
      //document.chkfrm.action = "/index.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF";
      //document.chkfrm.submit();
    }
  </script>
  <script type="text/javascript">
    function fnPwdChange(){
      var popupwidth = '510';
      var popupheight = '170';
      var url = "";

      url = "/popup/pwdchange.do";

      var LeftPosition = (screen.width-popupwidth)/2;
      var TopPosition  = (screen.height-popupheight)/2;

      var oPopup = window.open(url,"비밀번호변경","width="+popupwidth+",height="+popupheight+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
      if(oPopup){oPopup.focus();}

    }

    function setLangGubun(gubun){
      document.loginfrm.lang_gubun.value = gubun;
      document.loginfrm.submit();
    }

  </script>
</head>
  <div id="contents">

    <form id="listForm" name="listForm" action="http://192.168.0.77:8081/code/ris0201.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF" method="post">
      <input type="hidden" name="session_hspt_id" id="session_hspt_id" value=""/>
      <input type="hidden" name="q_user_id" id="q_user_id" value=""/>
      <input type="hidden" name="BrowserChk" id="BrowserChk" value=""/>
      <input type="hidden" name="currdate" id="currdate" value=""/>
    </form>


    <!-- Main 화면 영역  Start -->

    <!-- 검색영역 설정 Start -->
    <div class="inquiry__page-flex mt5">
      <section class="inquiry__search-section">
        <!-- 검색조건 영역 Start -->
        <div class="inquiry__search-flex"> <!-- 1 Row -->
          <div class="box__flex" style="width:20%;">
            <input type="radio" name="tree_radio" id="tree_radio1" value="imgn_bdyp_cd" onChange="fn_egov_treeGrid()" checked/>
            <!-- 					<label style="margin-right:2rem;" for="tree_radio1" >촬영부위별</label> -->
            <label style="margin-right:2rem;" for="tree_radio1" >By examed body part</label>
            <input type="radio" name="tree_radio" id="tree_radio2" value="imgn_room_cd" onChange="fn_egov_treeGrid()" />
            <!-- 					<label style="margin-right:2rem;" for="tree_radio2">촬영실별</label> -->
            <label style="margin-right:2rem;" for="tree_radio2">By examed body part</label>
          </div>
          <div class="box__flex" style="width:80%;">
            <!-- 					<label style="margin-right:2rem;">사용여부</label> -->
            <label style="margin-right:2rem;">Use or not use</label>
            <input type="radio" name="expr_radio" id="expr_radio1" onChange="fn_egov_selectGrid()" value="valid" checked/>
            <!-- 					<label style="margin-right:1rem;" for="expr_radio1">사용</label> -->
            <label style="margin-right:1rem;" for="expr_radio1">Use</label>
            <input type="radio" name="expr_radio" id="expr_radio2" onChange="fn_egov_selectGrid()" value="expired" />
            <!-- 					<label style="margin-right:1rem;" for="expr_radio2">불용</label> -->
            <label style="margin-right:1rem;" for="expr_radio2">Disused</label>
            <input type="radio" name="expr_radio" id="expr_radio3" onChange="fn_egov_selectGrid()" value="all" />
            <!-- 					<label style="margin-right:2rem;" for="expr_radio3">전체</label> -->
            <label style="margin-right:2rem;" for="expr_radio3">All</label>
            <!-- 					<label style="margin-right:1rem;">검색어 ( 촬영코드,  촬영명 )</label> -->
            <label style="margin-right:1rem;">Search (Exam code,  Exam name)</label>
            <input class="mr-2" id="searchKeyword" name="searchKeyword" size="30"onkeydown="keydownEnter()" onsubmit="false"/>
            <input type="text" style="display:none;"/>
            <label>
              <a href="javascript:fn_egov_selectGrid();">
                <button class="process__btn">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_search2.png" alt="조회" />
                </button>
              </a>
            </label>
          </div>
        </div>
        <!-- 검색조건 영역 End -->
      </section>
      <!-- 검색영역 설정 End -->

      <!-- Data 영역설정 Start -->
      <section class="inquiry__result-section mt5">
        <!-- GRID 또는 일반 TABLE LAYOUT 영역 Start-->
        <!-- 두개 Grid 처리(좌측,우측) -->
        <div class="fl-L grid1" align="center" style="width:20%;"> <!-- width은 화면에 맞춰서 조절 -->
          <table id="treegrid"></table>
        </div>
        <div class="fl-R grid2" align="center" style="width:80%;"> <!-- width은 화면에 맞춰서 조절 -->
          <input type="hidden" name="level" id="level" value=""/>
          <input type="hidden" name="parent_node" id="parent_node" value=""/>
          <input type="hidden" name="node_cd" id="node_cd" value=""/>
          <div class="srcArea">
            <div class="box__flex">
              <!-- 						<span style="font-weight:bold;">촬영코드 목록</span> -->
              <span style="font-weight:bold;">Exam codeList</span>
              <a href="javascript:excelUpload();" class="ml-2">
                <button class="process__btn2">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_copy_w.png" alt="복사" />
                  <!-- 	                			<span>엑셀 업로드</span> -->
                  <span>Excel upload</span>
                </button>
              </a>
              <form class="ml-2" action="http://192.168.0.77:8081/code/imgnCdExcelDown.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF" method="post">
                <!-- 							<button type="submit" id="measureExcel" class="process__btn2"><span>엑셀 다운로드</span></button> -->
                <button type="submit" id="measureExcel" class="process__btn2"><span>Excel download</span></button>

              </form>
            </div>
            <div class="box__flex">
              <a href="javascript:fn_copy();" class="ml-2">
                <button class="process__btn2">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_copy_w.png" alt="복사" />
                  <!-- 	                			<span>복사</span> -->
                  <span>Copy</span>
                </button>
              </a>
              <a href="javascript:fn_update();" class="ml-2">
                <button class="process__btn2">
                  <img src='http://192.168.0.77:8081/images/jqgrid/btn_modify.png' alt='수정' />
                  <!-- 								<span>수정</span> -->
                  <span>correction</span>
                </button>
              </a>
              <a href="javascript:fn_insert();" class="ml-2">
                <button class="process__btn2">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_add_w.png" alt="입력"  />
                  <!-- 								<span>입력</span> -->
                  <span>input</span>
                </button>
              </a>
              <a href="javascript:fn_delete();" class="ml-2">
                <button class="process__btn2">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_x_w.png" alt="불용" />
                  <!-- 								<span>불용</span> -->
                  <span>Disused</span>
                </button>
              </a>
              <a href="javascript:fn_save();" class="ml-2">
                <button class="process__btn2">
                  <img src="http://192.168.0.77:8081/images/jqgrid/btn_save_w.png" alt="저장"  />
                  <!-- 								<span>저장</span> -->
                  <span>save</span>
                </button>
              </a>
            </div>
          </div>
          <div id="table">
            <table id="list"></table>
          </div>

          <br>
          <!--  상세내용 form   -->
          <form id="imgn_form" class="" name="imgn_form" method="post" style="height:45%;">
            <input type="hidden" name="iud" id="iud" value=""/>
            <input type="hidden" name="hspt_id" id="hspt_id" value=""/>
            <!--  상세내용 첫번째 테이블  -->
            <table class="table table-dark table-sm mt5" style="width:calc(100% - 20px);">
              <colgroup>
                <col width="10%"/>
                <col width="40%"/>
                <col width="10%"/>
                <col width="40%"/>
              </colgroup>
              <tbody>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									&nbsp;*&nbsp;<label for="appl_date">적용일자	</label> -->
                  &nbsp;*&nbsp;<label for="appl_date">Effective date</label>
                </td>
                <td>
                  <input type="date" name="appl_date" id="appl_date" value="" style="width:38%;" min="1899-01-01" max="3001-12-31" required="required"/>
                  <!-- 									&nbsp;*<label for="expr_date">불용일자</label> -->
                  &nbsp;*<label for="expr_date">Disused date</label>
                  <input type="date" name="expr_date" id="expr_date" value="" style="width:39%;" min="1899-01-01" max="3001-12-31" required="required"/>
                </td>
                <td>
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_cd">촬영코드</label> -->
                  &nbsp;*&nbsp;<label for="imgn_cd">Exam code</label>
                </td>
                <td>
                  <input type="text" name="imgn_cd" id="imgn_cd" value="" style="width:37%; text-transform: uppercase;" readonly="readonly" required="required"/>
                  <!-- 									&nbsp;* &nbsp;<label for="imgn_cnt" style="margin-right: 3%;">촬영횟수</label> -->
                  &nbsp;* &nbsp;<label for="imgn_cnt" style="margin-right: 3%;">image count</label>
                  <input type="text" name="imgn_cnt" id="imgn_cnt" value="" style="width:36%;" onkeydown="javascript:fnOnlyNumber();" required="required"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_kr_nm">촬영한글명</label> -->
                  &nbsp;*&nbsp;<label for="imgn_kr_nm">Exam name</label>
                </td>
                <td>
                  <input type="text" name="imgn_kr_nm"  id="imgn_kr_nm" value="" style="width:88%;" required="required"/>
                </td>
                <td>
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_engl_nm">촬영영어명</label> -->
                  &nbsp;*&nbsp;<label for="imgn_engl_nm">English exam name</label>
                </td>
                <td>
                  <input type="text" name="imgn_engl_nm" id="imgn_engl_nm" value="" style="width:88%;" required="required"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_abbr_nm">촬영약어명</label> -->
                  &nbsp;*&nbsp;<label for="imgn_abbr_nm">Exam abbreviation</label>
                </td>
                <td>
                  <input type="text" name="imgn_abbr_nm" id="imgn_abbr_nm" value="" style="width:88%;" required="required"/>
                </td>
                <td>
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_dvsn_cd">촬영구분</label> -->
                  &nbsp;*&nbsp;<label for="imgn_dvsn_cd">Exam category</label>
                </td>
                <td>
                  <input type="text" name="imgn_dvsn_cd" id="imgn_dvsn_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_dvsn_cd','imgn_dvsn_cd','imgn_dvsn_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="imgn_dvsn_cd_nm" id="imgn_dvsn_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_bdyp_cd">촬영부위</label> -->
                  &nbsp;*&nbsp;<label for="imgn_bdyp_cd">Examed body part</label>
                </td>
                <td>
                  <input type="text" name="imgn_bdyp_cd" id="imgn_bdyp_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_bdyp_cd','imgn_bdyp_cd','imgn_bdyp_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="imgn_bdyp_cd_nm" id="imgn_bdyp_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
                <td>
                  <!-- 									&nbsp;*&nbsp;<label for="imgn_room_cd">촬영실</label> -->
                  &nbsp;*&nbsp;<label for="imgn_room_cd">Exam room</label>
                </td>
                <td>
                  <input type="text" name="imgn_room_cd" id="imgn_room_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_room_cd','imgn_room_cd','imgn_room_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="imgn_room_cd_nm" id="imgn_room_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									<label for="stts_bdyp_cd">통계부위</label> -->
                  <label for="stts_bdyp_cd">Statistics body part </label>
                </td>
                <td>
                  <input type="text" name="stts_bdyp_cd" id="stts_bdyp_cd" value="" style="width:20%;" readonly="readonly"/>
                  <a href="javascript:findCodeName('stts_bdyp_cd','stts_bdyp_cd','stts_bdyp_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="stts_bdyp_cd_nm" id="stts_bdyp_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly"/>
                </td>
                <td>
                  <!-- 									<label for="inpt_imgn_room_cd">입원촬영실</label> -->
                  <label for="inpt_imgn_room_cd">Exam room for inpatients</label>
                </td>
                <td>
                  <input type="text" name="inpt_imgn_room_cd" id="inpt_imgn_room_cd" value="" style="width:20%;" readonly="readonly"/>
                  <a href="javascript:findCodeName('imgn_room_cd','inpt_imgn_room_cd','inpt_imgn_room_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="inpt_imgn_room_cd_nm" id="inpt_imgn_room_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									<label for="imgn_drct_cd">촬영방향</label> -->
                  <label for="imgn_drct_cd">Exam direction</label>
                </td>
                <td>
                  <input type="text" name="imgn_drct_cd" id="imgn_drct_cd" value="" style="width:20%;" readonly="readonly" />
                  <a href="javascript:findCodeName('imgn_drct_cd','imgn_drct_cd','imgn_drct_cd_nm');" class="btn"><img src="http://192.168.0.77:8081/images/jqgrid/btn_search.png"/></a>
                  <input type="text" name="imgn_drct_cd_nm" id="imgn_drct_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
                <td>
                  <!-- 									<label for="info_form_cd">안내장서식</label> -->
                  <label for="info_form_cd">Information form</label>
                </td>
                <td>
                  <select id="info_form_cd" name="info_form_cd" class="align-M" style="width:88%;">
                    <option value=""></option>

                    By examed body part


                  </select>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <!-- 									<label for="ordr_cd">처방코드</label>&nbsp;&nbsp; -->
                  <label for="ordr_cd">Order code</label>&nbsp;&nbsp;
                </td>
                <td>
                  <input type="text" name="ordr_cd" id="ordr_cd" value="" style="width:88%;text-transform: uppercase;"/>
                </td>
                <td>
                </td>
                <td>
                  <!-- 									<label for="prtb_imgn_yn">이동촬영가능</label> -->
                  <label for="prtb_imgn_yn">Available for portable exam</label>
                  <input type="checkbox" name="prtb_imgn_yn" id="prtb_imgn_yn" style="margin-right: 20px;" />
                  <!-- 									<label for="inpt_appn_yn">입원예약가능</label> -->
                  <label for="inpt_appn_yn">Inpatient reservation is available </label>
                  <input type="checkbox" name="inpt_appn_yn" id="inpt_appn_yn" style="margin-right: 20px;"/>
                  <!-- 									<label for="outp_appn_yn">외래예약가능</label> -->
                  <label for="outp_appn_yn">Outpatient reservation is available </label>
                  <input type="checkbox" name="outp_appn_yn" id="outp_appn_yn" style="margin-right: 20px;"/>
                  <!-- 									<label for="elct_trtm_yn">선택진료여부</label> -->
                  <label for="elct_trtm_yn">Selective treatment status </label>
                  <input type="checkbox" name="elct_trtm_yn" id="elct_trtm_yn"/>
                </td>
              </tr>
              </tbody>
            </table>
          </form>

        </div>
        <!-- GRID 또는 일반 TABLE LAYOUT 영역 End -->
      </section>
      <!-- Data 영역설정 End -->
    </div>
    <!-- Main 화면 영역  Start -->

  </div>
  <div id="bottom" >

  </div>
</div>


</body>
</html> 