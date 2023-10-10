<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt_rt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <title>촬영코드 관리</title>
  <link rel="stylesheet" type="text/css" href="/css/risstyle.css" />
  <link rel="stylesheet" type="text/css" href="/css/code/RIS0101E01.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
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
        <div class="search__container"> <!-- 1 Row -->
          <div class="box__flex" style="width:20%;">
            <input type="radio" name="tree_radio" id="tree_radio1" value="imgn_bdyp_cd" onChange="fn_egov_treeGrid()" checked/>
            <label style="margin-right:2rem;" for="tree_radio1" >촬영부위별</label>
            <input type="radio" name="tree_radio" id="tree_radio2" value="imgn_room_cd" onChange="fn_egov_treeGrid()" />
            <label style="margin-right:2rem;" for="tree_radio2">촬영실별</label>
          </div>
          <div class="box__flex" style="width:80%;">
            <label style="margin-right:2rem;">사용여부</label>
            <input type="radio" name="expr_radio" id="expr_radio1" onChange="fn_egov_selectGrid()" value="valid" checked/>
            <label style="margin-right:1rem;" for="expr_radio1">사용</label>
            <input type="radio" name="expr_radio" id="expr_radio2" onChange="fn_egov_selectGrid()" value="expired" />
            <label style="margin-right:1rem;" for="expr_radio2">불용</label>
            <input type="radio" name="expr_radio" id="expr_radio3" onChange="fn_egov_selectGrid()" value="all" />
            <label style="margin-right:2rem;" for="expr_radio3">전체</label>
            <label style="margin-right:1rem;">검색어 ( 촬영코드,  촬영명 )</label>
            <input type="text" id="searchKeyword" name="searchKeyword" size="30"onkeydown="keydownEnter()" onsubmit="false"/>
            <a href="javascript:fn_egov_selectGrid();">
              <button class="all__btn img__btn search__btn ma_left_1">
                조회
              </button>
            </a>
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
              <span style="font-weight:bold;">촬영코드 목록</span>
              <a href="javascript:excelUpload();" class="ml-2">
                <button class="all__btn img__btn mokrok__btn">
                  <span>엑셀 업로드</span>
                </button>
              </a>
              <form class="ml-2" action="http://192.168.0.77:8081/code/imgnCdExcelDown.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF" method="post">
                <button type="submit" id="measureExcel" class="all__btn img__btn save__btn">
                  <span>엑셀 다운로드</span>
                </button>
              </form>
            </div>
            <div class="box__flex">
              <a href="javascript:fn_copy();" class="ml-2">
                <button class="all__btn img__btn save__btn">
                  <span>복사</span>
                </button>
              </a>
              <a href="javascript:fn_update();" class="ml-2">
                <button class="all__btn img__btn img__btn update__btn">
                  <span>수정</span>
                </button>
              </a>
              <a href="javascript:fn_insert();" class="ml-2">
                <button class="all__btn img__btn insert__btn">
                  <span>입력</span>
                </button>
              </a>
              <a href="javascript:fn_delete();" class="ml-2">
                <button class="all__btn img__btn bullyong__btn">
                  <span>불용</span>
                </button>
              </a>
              <a href="javascript:fn_save();" class="ml-2">
                <button class="all__btn img__btn save__btn">
                  <span>저장</span>
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
                  &nbsp;*&nbsp;<label for="appl_date">적용일자	</label>
                </td>
                <td>
                  <input type="date" name="appl_date" id="appl_date" value="" style="width:38%;" min="1899-01-01" max="3001-12-31" required="required"/>
                  &nbsp;*<label for="expr_date">불용일자</label>
                  <input type="date" name="expr_date" id="expr_date" value="" style="width:39%;" min="1899-01-01" max="3001-12-31" required="required"/>
                </td>
                <td>
                  &nbsp;*&nbsp;<label for="imgn_cd">촬영코드</label>
                </td>
                <td>
                  <input type="text" name="imgn_cd" id="imgn_cd" value="" style="width:37%; text-transform: uppercase;" readonly="readonly" required="required"/>
                  &nbsp;* &nbsp;<label for="imgn_cnt" style="margin-right: 3%;">촬영횟수</label>
                  <input type="text" name="imgn_cnt" id="imgn_cnt" value="" style="width:36%;" onkeydown="javascript:fnOnlyNumber();" required="required"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  &nbsp;*&nbsp;<label for="imgn_kr_nm">촬영한글명</label>
                </td>
                <td>
                  <input type="text" name="imgn_kr_nm"  id="imgn_kr_nm" value="" style="width:88%;" required="required"/>
                </td>
                <td>
                  &nbsp;*&nbsp;<label for="imgn_engl_nm">촬영영어명</label>
                </td>
                <td>
                  <input type="text" name="imgn_engl_nm" id="imgn_engl_nm" value="" style="width:88%;" required="required"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  &nbsp;*&nbsp;<label for="imgn_abbr_nm">촬영약어명</label>
                </td>
                <td>
                  <input type="text" name="imgn_abbr_nm" id="imgn_abbr_nm" value="" style="width:88%;" required="required"/>
                </td>
                <td>
                  &nbsp;*&nbsp;<label for="imgn_dvsn_cd">촬영구분</label>
                </td>
                <td>
                  <input type="text" name="imgn_dvsn_cd" id="imgn_dvsn_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_dvsn_cd','imgn_dvsn_cd','imgn_dvsn_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png" /></a>
                  <input type="text" name="imgn_dvsn_cd_nm" id="imgn_dvsn_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly"/>
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  &nbsp;*&nbsp;<label for="imgn_bdyp_cd">촬영부위</label>
                </td>
                <td>
                  <input type="text" name="imgn_bdyp_cd" id="imgn_bdyp_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_bdyp_cd','imgn_bdyp_cd','imgn_bdyp_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png"/></a>
                  <input type="text" name="imgn_bdyp_cd_nm" id="imgn_bdyp_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
                <td>
                  &nbsp;*&nbsp;<label for="imgn_room_cd">촬영실</label>
                </td>
                <td>
                  <input type="text" name="imgn_room_cd" id="imgn_room_cd" value="" style="width:20%;" readonly="readonly" required="required"/>
                  <a href="javascript:findCodeName('imgn_room_cd','imgn_room_cd','imgn_room_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png"/></a>
                  <input type="text" name="imgn_room_cd_nm" id="imgn_room_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <label for="stts_bdyp_cd">통계부위</label>
                </td>
                <td>
                  <input type="text" name="stts_bdyp_cd" id="stts_bdyp_cd" value="" style="width:20%;" readonly="readonly"/>
                  <a href="javascript:findCodeName('stts_bdyp_cd','stts_bdyp_cd','stts_bdyp_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png"/></a>
                  <input type="text" name="stts_bdyp_cd_nm" id="stts_bdyp_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly"/>
                </td>
                <td>
                  <label for="inpt_imgn_room_cd">입원촬영실</label>
                </td>
                <td>
                  <input type="text" name="inpt_imgn_room_cd" id="inpt_imgn_room_cd" value="" style="width:20%;" readonly="readonly"/>
                  <a href="javascript:findCodeName('imgn_room_cd','inpt_imgn_room_cd','inpt_imgn_room_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png"/></a>
                  <input type="text" name="inpt_imgn_room_cd_nm" id="inpt_imgn_room_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
              </tr>
              <tr>
                <td style="padding-left: 0.5rem;">
                  <label for="imgn_drct_cd">촬영방향</label>
                </td>
                <td>
                  <input type="text" name="imgn_drct_cd" id="imgn_drct_cd" value="" style="width:20%;" readonly="readonly" />
                  <a href="javascript:findCodeName('imgn_drct_cd','imgn_drct_cd','imgn_drct_cd_nm');" class="btn"><img src="/images/jqgrid/btn_search2.png"/></a>
                  <input type="text" name="imgn_drct_cd_nm" id="imgn_drct_cd_nm" value="" style="width:calc(68% - 38px);" readonly="readonly" />
                </td>
                <td>
                  <label for="info_form_cd">안내장서식</label>
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
                  <label for="ordr_cd">처방코드</label>&nbsp;&nbsp;
                </td>
                <td>
                  <input type="text" name="ordr_cd" id="ordr_cd" value="" style="width:88%;text-transform: uppercase;"/>
                </td>
                <td>
                </td>
                <td>
                  <label for="prtb_imgn_yn">이동촬영가능</label>
                  <input type="checkbox" name="prtb_imgn_yn" id="prtb_imgn_yn" style="margin-right: 20px;" />
                  <label for="inpt_appn_yn">입원예약가능</label>
                  <input type="checkbox" name="inpt_appn_yn" id="inpt_appn_yn" style="margin-right: 20px;"/>
                  <label for="outp_appn_yn">외래예약가능</label>
                  <input type="checkbox" name="outp_appn_yn" id="outp_appn_yn" style="margin-right: 20px;"/>
                  <label for="elct_trtm_yn">선택진료여부</label>
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




<script type="text/javaScript" language="javascript">

  var imgn_cd =  "";

  var currdate = "";

  var BrowserChk = "";
  if(BrowserChk == "EXPLORE"){
    $("#appl_date").prop("type","text");
    $("#expr_date").prop("type","text");
  }else{
    $("#appl_date").prop("type","date");
    $("#expr_date").prop("type","date");
  }

  if(BrowserChk == "EXPLORE"){
    $(function(){
      $('#appl_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
      $('#expr_date').datepicker({ dateFormat: 'yy-mm-dd' }).val();

    });
  }



  $(document).ready(function(){
    fn_disable();
    //최초 Grid width(넓이) - 수정된 내용
    var gwidth =$(".inquiry__result-section").width();
    var gheight = $(".inquiry__result-section").height();
    gwidth = parseInt(gwidth) -20 ;

    $(".srcArea").attr("style","display:flex;justify-content: space-between;width:calc(100% - 20px);");

// grid가 2개인 경우 width 정의
    var gwidth1 = $(".grid1").width();
    var gwidth2 = $(".grid2").width();

// grid가 3개인 경우 width 정의(아직 코딩이 안되어 있음.)
// 	var gwidth1 = $(".grid1").width();
// 	var gwidth2 = $(".grid2").width();
// 	var gwidth3 = $(".grid3").width();

    /*  Tree Grid  */
    $("#treegrid").jqGrid({
      treeGrid: true,
      postData: {
        checked:$('input:radio[name="tree_radio"]:checked').val()
      },
      treeGridModel: 'adjacency',
      ExpandColumn : 'node_nm',
      url: "/code/selectRis0201tree.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF",
      datatype: "json",
      sortable: false,
      jsonReader : {
        repeatitems : false,
        root:'rows'
      },
      treeReader : {
        level_field: "level",
        parent_id_field: "parent_id",
        leaf_field: "isLeaf"
      },
      mtype: "POST",
      colNames:["node_id","parent_node","node_cd",""],
      colModel:[
        {name:'node_id',index:'node_id', width:1, hidden:true, key:true},
        {name:'parent_node',index:'parent_node', width:0, hidden:true},
        {name:'node_cd',index:'node_cd', width:0, hidden:true},
        {name:'node_nm',index:'node_nm', width:180, sortable: false, hidden:false}
      ],
      width:gwidth1-20,
      height:gheight*0.87,
      onSelectRow: function(rowid) {
        var rowObject = $("#treegrid").jqGrid('getRowData',rowid);
        $("#searchKeyword").val('');
        $('#level').attr("value",rowObject.level);
        $('#parent_node').attr("value",rowObject.parent_node);
        $('#node_cd').attr("value",rowObject.node_cd);
        fn_egov_selectGrid();
        $('#imgn_form')[0].reset();
      }
    })

    /*  Main grid  */
    $('#list').jqGrid({
      reordercolNames:true,
      url: "/code/selectRis0201List.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF",
      postData: {
        lrgc_cd:'%',
        checked:$('input:radio[name="expr_radio"]:checked').val()
      },
      mtype:'POST', // 전송 타입
      datatype : "json", // 받는 데이터 형태
      colNames:[ '병원코드',i18n.text_242, i18n.text_110, '촬영영어명', '촬영약어명', '촬영부위코드',i18n.text_113, '촬영실코드', '촬영실', '적용일자', '불용일자'
        ,'촬영구분코드',i18n.text_112 ,'입원촬영실', '입원촬영실', '통계부위코드','통계부위','촬영방향코드','촬영방향','촬영횟수','안내장서식코드'
        ,'외래예약여부','입원예약여부','선택진료여부','이동촬영여부' ,'처방코드'],//'촬영코드', '촬영명', '촬영부위','촬영구분'
      colModel:[
        { name: 'hspt_id'             , index: 'hspt_id'             , width: 0   , hidden:true},
        { name: 'imgn_cd'             , index: 'imgn_cd'             , width: 80  , align:"left"},
        { name: 'imgn_kr_nm'          , index: 'imgn_kr_nm'          , width: 350 , align:"left"},
        { name: 'imgn_engl_nm'        , index: 'imgn_engl_nm'        , width: 0   , hidden:true},
        { name: 'imgn_abbr_nm'        , index: 'imgn_abbr_nm'        , width: 0   , hidden:true},
        { name: 'imgn_bdyp_cd'        , index: 'imgn_bdyp_cd'        , width: 0   , hidden:true},
        { name: 'imgn_bdyp_cd_nm'     , index: 'imgn_bdyp_cd_nm'     , width: 120 , align:"left"},
        { name: 'imgn_room_cd'        , index: 'imgn_room_cd'        , width: 0   , hidden:true},
        { name: 'imgn_room_cd_nm'     , index: 'imgn_room_cd_nm'     , width: 80  , align:"left"},
        { name: 'appl_date'           , index: 'appl_date'           , width: 0   , hidden:true},
        { name: 'expr_date'           , index: 'expr_date'           , width: 0   , hidden:true},
        { name: 'imgn_dvsn_cd'        , index: 'imgn_dvsn_cd'        , width: 0   , hidden:true},
        { name: 'imgn_dvsn_cd_nm'     , index: 'imgn_dvsn_cd_nm'     , width: 120 , align:"left"},
        { name: 'inpt_imgn_room_cd'   , index: 'inpt_imgn_room_cd'   , width: 0   , hidden:true},
        { name: 'inpt_imgn_room_cd_nm', index: 'inpt_imgn_room_cd_nm', width: 0   , hidden:true},
        { name: 'stts_bdyp_cd'        , index: 'stts_bdyp_cd'        , width: 0   , hidden:true},
        { name: 'stts_bdyp_cd_nm'     , index: 'stts_bdyp_cd_nm'     , width: 0   , hidden:true},
        { name: 'imgn_drct_cd'        , index: 'imgn_drct_cd'        , width: 0   , hidden:true},
        { name: 'imgn_drct_cd_nm'     , index: 'imgn_drct_cd_nm'     , width: 0   , hidden:true},
        { name: 'imgn_cnt'            , index: 'imgn_cnt'            , width: 0   , hidden:true},
        { name: 'info_form_cd'        , index: 'info_form_cd'        , width: 0   , hidden:true},
        { name: 'outp_appn_yn'        , index: 'outp_appn_yn'        , width: 0   , hidden:true},
        { name: 'inpt_appn_yn'        , index: 'inpt_appn_yn'        , width: 0   , hidden:true},
        { name: 'elct_trtm_yn'        , index: 'elct_trtm_yn'        , width: 0   , hidden:true},
        { name: 'prtb_imgn_yn'        , index: 'prtb_imgn_yn'        , width: 0   , hidden:true},
        { name: 'ordr_cd'             , index:'ordr_cd'              , width: 0   , hidden:true}
      ], //서버에서 받은 데이터 설정
      jsonReader: {
        repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
        root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
        records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
      },
      width : gwidth2-20,
      height: gheight*0.42, //테이블의 세로 크기, Grid의 높이
      loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."
      emptyrecords: "Nothing to display",
      rowNum:-1,
      shrinkToFit:true,
      rownumbers: true,
      gridview : true,  // 선표시 true/false
      beforeSelectRow: function(rowid, e) {
        if(document.imgn_form.iud.value == 'I'||document.imgn_form.iud.value=='U') {
          if(confirm(i18n.message_069)){  //"등록/수정중인 정보가 있습니다.\n무시하고 이동 하시겠습니까?"
            return true;
          } else{
            return false;
          }
        } else{
          return true;
        };
      },
      onSelectRow: function(rowid) {
        var rowObject = $("#list").jqGrid('getRowData',rowid);
        $('#imgn_cd').attr('readonly',true);
        document.imgn_form.iud.value = "";
        fn_disable();
        imgn_cd =   rowObject.imgn_cd  ;
        document.imgn_form.hspt_id.value                =   rowObject.hspt_id                    ;
        document.imgn_form.appl_date.value              =   rowObject.appl_date                  ;
        document.imgn_form.expr_date.value              =   rowObject.expr_date                  ;
        document.imgn_form.imgn_cd.value                =   rowObject.imgn_cd                    ;
        document.imgn_form.imgn_abbr_nm.value           =   rowObject.imgn_abbr_nm               ;
        document.imgn_form.imgn_kr_nm.value             =   rowObject.imgn_kr_nm                 ;
        document.imgn_form.imgn_engl_nm.value           =   rowObject.imgn_engl_nm               ;
        document.imgn_form.imgn_dvsn_cd.value           =   rowObject.imgn_dvsn_cd               ;
        document.imgn_form.imgn_dvsn_cd_nm.value        =   rowObject.imgn_dvsn_cd_nm            ;
        document.imgn_form.imgn_drct_cd.value           =   rowObject.imgn_drct_cd               ;
        document.imgn_form.imgn_drct_cd_nm.value        =   rowObject.imgn_drct_cd_nm            ;
        document.imgn_form.imgn_bdyp_cd.value           =   rowObject.imgn_bdyp_cd               ;
        document.imgn_form.imgn_bdyp_cd_nm.value        =   rowObject.imgn_bdyp_cd_nm            ;
        document.imgn_form.stts_bdyp_cd.value           =   rowObject.stts_bdyp_cd               ;
        document.imgn_form.stts_bdyp_cd_nm.value        =   rowObject.stts_bdyp_cd_nm            ;
        document.imgn_form.imgn_room_cd.value           =   rowObject.imgn_room_cd               ;
        document.imgn_form.imgn_room_cd_nm.value        =   rowObject.imgn_room_cd_nm            ;
        document.imgn_form.inpt_imgn_room_cd.value      =   rowObject.inpt_imgn_room_cd          ;
        document.imgn_form.inpt_imgn_room_cd_nm.value   =   rowObject.inpt_imgn_room_cd_nm       ;
        document.imgn_form.ordr_cd.value                =   rowObject.ordr_cd                    ;
        document.imgn_form.imgn_cnt.value               =   rowObject.imgn_cnt                   ;
        document.imgn_form.info_form_cd.value           =   rowObject.info_form_cd               ;
        if(rowObject.prtb_imgn_yn == 'Y'){
          document.imgn_form.prtb_imgn_yn.checked = true;
        } else {
          document.imgn_form.prtb_imgn_yn.checked = false;
        };
        if(rowObject.elct_trtm_yn == 'Y'){
          document.imgn_form.elct_trtm_yn.checked = true;
        } else {
          document.imgn_form.elct_trtm_yn.checked = false;
        };
        if(rowObject.outp_appn_yn == 'Y'){
          document.imgn_form.outp_appn_yn.checked = true;
        } else {
          document.imgn_form.outp_appn_yn.checked = false;
        };
        if(rowObject.inpt_appn_yn == 'Y'){
          document.imgn_form.inpt_appn_yn.checked = true;
        } else {
          document.imgn_form.inpt_appn_yn.checked = false;
        };
      } ,
      loadComplete: function(data) {
// 				imgn_cd = imgn_cd.toUpperCase();
// 				if(imgn_cd !=""){
// 					jQuery('#list').jqGrid('setSelection',imgn_cd);
// 				}
      }
    })

    // 다국어 버전 사이즈 변경
// 		var expr_date_width = $("#expr_date").width();
// 		$("#expr_date").width(expr_date_width - 16);
// 		var imgn_cnt_width = $("#imgn_cnt").width();
// 		$("#imgn_cnt").width(imgn_cnt_width - 55);
  })

  /* 화면 reize */
  $(window).bind('resize', function() {
    if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
    else {
      var gridw = $(window).width()-20;
      fn_resize("treegrid", gridw , '0.19');
      fn_resize("list", gridw , '0.79');
    }
  }).trigger('resize');



  // main grid reload
  function fn_egov_selectGrid() {    // ※ 검색 버튼을 눌렀을 때 처리방법
    $("#list").clearGridData();    // 이전 데이터 삭제
    jQuery('#list').jqGrid('setGridParam', {
      url: "/code/selectRis0201List.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF",
      postData: {
        searchKeyword:$("#searchKeyword").val(),
        lrgc_cd:$('input:radio[name="tree_radio"]:checked').val(),
        level:$("#level").val(),
        parent_node:$("#parent_node").val(),
        node_cd:$("#node_cd").val(),
        checked:$('input:radio[name="expr_radio"]:checked').val()
      } ,
      datatype:"json"
    }).trigger("reloadGrid");
  }



  // tree grid reload
  function fn_egov_treeGrid() {    //
    $("#treegrid").clearGridData();    // 이전 데이터 삭제
    imgn_cd ="";
    jQuery('#treegrid').jqGrid('setGridParam', {
      url: "/code/selectRis0201tree.do;jsessionid=4C1A3F723256BF8A09B5D8720B33C3BF",
      postData: {
        checked:$('input:radio[name="tree_radio"]:checked').val()
      }
    }).trigger("reloadGrid");
  }

  //엑셀 파일 타입 확인
  function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xls") > -1|| fileFormat.indexOf("xlsx") > -1) {
      return true;
    } else {
      return false;
    }
  }

  //입력 처리
  function fn_insert(){
    document.imgn_form.iud.value = 'I';
    $("#list").jqGrid("resetSelection");
    $('#imgn_cd').attr('readonly',false);
    $('#imgn_form')[0].reset();
    $('#appl_date').val(new Date().yyyymmdd());
    $('#expr_date').val('3000-01-01');
    fn_enable();
  }

  function fn_update(){
    if($('#imgn_cd').val()==''||document.imgn_form.iud.value == 'I') {
      alert(i18n.message_089); //'촬영코드를 선택해 주세요'
      return ;
    };
    fn_enable();
    $('#imgn_cd').attr("disabled",true);
    document.imgn_form.iud.value = 'U';
    $('#imgn_cd').attr('readonly',true);
    $('#appl_date').attr("disabled",true);
    $('#appl_date').attr('readonly',true);
  }

  function fn_copy(){
    if($('#imgn_cd').val()==''||document.imgn_form.iud.value == 'I') {
      alert(i18n.message_089); //'촬영코드를 선택해 주세요'
      return ;
    };
    fn_enable();
    document.imgn_form.iud.value = 'I';
    $('#imgn_cd').attr('readonly',false);
    $('#appl_date').attr('readonly',false);
  }

  //불용처리
  function fn_delete(){
    if($('#imgn_cd').val()==''||document.imgn_form.iud.value == 'I') {
      alert(i18n.message_089); //'촬영코드를 선택해 주세요'
      return ;
    };
    if($('input:radio[name="expr_radio"]:checked').val() == "expired"){
      alert(i18n.message_206); //"이미 불용처리된 촬영코드입니다."
      return;
    }

    var today = new Date().yyyymmdd();
    var oldApplDate = $("#appl_date").val();
    if(today < oldApplDate){
      alert(i18n.message_207); //"불용일자가 적용일보다 더 커서 불용처리 할 수 없습니다."
      return;
    }

    document.imgn_form.iud.value = 'D';
    fn_save();
  }

  // table input 저장 function
  function fn_save(){
    if(document.imgn_form.iud.value == '') {
      alert(i18n.message_016); //'저장할 정보가 없습니다.'
      return ;
    };
    // required value 빈 값 확인
    for (i = 0; i <$('#imgn_form input[required=required]').size(); i++){
      if ($('#imgn_form input[required=required]')[i].value== ""){
        var name = $('#imgn_form input[required=required]')[i].name;
// 				alert( $("label[for='"+name+"']").text() + " 입력이 필요합니다. ");
        alert(i18n.message_208.replace("X", $("label[for='"+name+"']").text()));

        $('#imgn_form input[required=required]')[i].focus();
        return;
      }
    }

    //대문자 변환
    $("#imgn_cd").val().toUpperCase();
    $("#ordr_cd").val().toUpperCase();
    //날짜 validation
    var appl_date = new Date (document.getElementById('appl_date').value);
    var expr_date = new Date (document.getElementById('expr_date').value);
    imgn_cd =  document.getElementById('imgn_cd').value ;
    if (appl_date >= expr_date){
      alert(i18n.message_090); //'일자 입력이 잘못되었습니다.'
      $('#appl_date').focus();
      return;
    } else if (expr_date > new Date("3001-12-31")) {
      alert(i18n.message_091) //'불용일자 입력이 잘못되었습니다.'
      $('#expr_date').focus();
      return;
    } else if (appl_date < new Date("1899-01-01")) {
      alert(i18n.message_092) //'적용날자 입력이 잘못되었습니다.'
      $('#appl_date').focus();
      return;
    }


    // checkbox value YN
    var check = $('#imgn_form input[type=checkbox]');
    for (i = 0; i < check.size(); i++){
      if ($(check[i]).is(':checked')==true) {
        $(check[i]).attr('value','Y');
      } else if ($(check[i]).is(':checked')==false) {
        $(check[i]).attr('value','N');
      }
    }

    // form 처리, checkbox 나머지 값 attr
    var values = jQuery("#imgn_form").serializeArray();
    values = values.concat(
      $('#imgn_form input[type=checkbox]:not(:checked)').map(
        function() {
          return {"name": this.name, "value": this.value}
        }).get()
    );
    values = values.concat(
      $('#listForm input').map(
        function() {
          return {"name": this.name, "value": this.value}
        }).get()
    );

    if (document.getElementById('imgn_cd').disabled){
      values = values.concat(
        $('#imgn_cd').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get()
      );
    }
    if (document.getElementById('appl_date').disabled){
      values = values.concat(
        $('#appl_date').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get()
      );
    }


    if (document.getElementById('iud').value =='D'){
      values = values.concat(
        $('#iud').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get(),
        $('#imgn_dvsn_cd').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get(),
        $('#imgn_bdyp_cd').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get(),
        $('#expr_date').map(
          function() {
            return {"name": this.name, "value": this.value}
          }).get()
      );
    }
    $.ajax( {
      type : "post",
      url : "/json/code/Ris0201Save.do",
      data : values,
      dataType : "json",
      error : function(){
        alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
      },
      success : function(data) {
        if (data.error_code == '0'){
          alert(i18n.message_093); //'정상적으로 입력되었습니다.'
          fn_disable();
          fn_egov_selectGrid();
          $("#iud").val("");
          $('#imgn_form')[0].reset();
        } else{
          alert(data.error_msg);
        }
      }
    });
  }



  //popup
  function findCodeName(code,mddl_cd,mddl_kr_nm){
    if(document.imgn_form.iud.value == ''){
      alert(i18n.message_094); //"입력 또는 수정 버튼을 눌러주세요!"
      return;
    }
    var popupwidth = '800';
    var popupheight = '400';
    var url = "";
    var Left=(screen.width-popupwidth)/2;
    var Top=(screen.height-popupheight)/3;

    url = "/code/Ris0201Popup.do?lrgc_cd="+code+"&name1="+mddl_cd+"&name2="+mddl_kr_nm;
    var oPopup = window.open(url,"코드 선택","width="+popupwidth+",height="+popupheight+",top="+Top+",left="+Left+", scrollbars=no");
    if(oPopup){oPopup.focus();}
  }

  //popup 값을 attribute
  function ReturnValue(mddl_cd,mddl_kr_nm,name1,name2){
    document.getElementsByName(name1)[0].value = mddl_cd;
    document.getElementsByName(name2)[0].value = mddl_kr_nm;
  }

  //popup
  function excelUpload(){
    var popupwidth = '1800';
    var popupheight = '800';
    var url = "";
    var Left=(screen.width-popupwidth)/2;
    var Top=(screen.height-popupheight)/3;
    url = "/code/Ris0201ExcelPopup.do";
    var oPopup = window.open(url,"엑셀 업로드","width="+popupwidth+",height="+popupheight+",top="+Top+",left="+Left+", scrollbars=no");
    if(oPopup){oPopup.focus();}
  }


  //엔터시 refresh 방지
  function keydownEnter(){
    if(event.keyCode == 13){
      fn_egov_selectGrid();
    }}

  function fn_disable(){
    $("#imgn_form input").attr("disabled",true);
    $("#imgn_form select").attr("disabled",true);
  }

  function fn_enable(){
    $("#imgn_form input").attr("disabled",false);
    $("#imgn_form select").attr("disabled",false);
  }

  Date.prototype.yyyymmdd = function() {
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString();
    var dd = this.getDate().toString();
    return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
  }

</script>
</body>
</html> 