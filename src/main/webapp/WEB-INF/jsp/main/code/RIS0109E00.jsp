<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>기준정보 입력관리</title>
  <link rel="stylesheet" type="text/css" href="/css/risstyle.css" />
  <link rel="stylesheet" type="text/css" href="/css/code/RIS0101E00.css"/>
  <link rel="stylesheet" type="text/css" href="/css/code/RIS0101E01.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
</head>
<body>
<main class="main__container">
  <!-- 검색영역 설정 Start -->
  <div class="inquiry__page-flex mt5">
    <section class="inquiry__search-section">
      <!-- 검색조건 영역 Start -->
      <div class="search__container" style="justify-content:space-between;"> <!-- 1 Row -->
        <div class="box__flex">
          <label class="box__label">&nbsp;&nbsp;대분류 코드&nbsp;:&nbsp;</label>
          <select id="selectBox" name="selectBox" onchange="searchBox(this.value)">
            <!-- 					<option label="대분류 코드를 선택해주세요." selected="selected"/> -->
            <option label="대분류 코드를 선택해주세요." selected="selected">

            </option><option value="DOCTORLIST">의사정보관리</option><option value="GRADE">사용자 권한</option><option value="GWA_LIST">진료과 리스트</option><option value="IMGN_DVSN_CD">촬영구분</option><option value="IMGN_BDYP_CD">촬영부위</option><option value="IMGN_DRCT_CD">방향</option><option value="IMGN_EQPM_CD">촬영실 장비 코드</option><option value="IMGN_ROOM_CD">촬영실 코드</option><option value="INFO_FORM_CD">안내장 서식구분</option><option value="INTR_CD">인터페이스 코드</option><option value="LANG_GUBUN">다국어구분</option><option value="LANG_MAIN">다국어 주언어</option><option value="NTIL_CD">국가 코드</option><option value="STTS_BDYP_CD">통계부위</option><option value="VIST_DVSN_CD">내원구분 관리</option></select>
          <a href="javascript:reloadGrid('list');" class="ml-2">
            <button class="all__btn img__btn img__btn refresh__btn">
              <span class="box__label">새로고침</span>
            </button>
          </a>
        </div>
        <div class="box__flex">
          <a href="javascript:fn_update();" class="ml-2">
            <button class="all__btn img__btn img__btn update__btn">
              <span class="box__label">수정</span>
            </button>
          </a>
          <a href="javascript:fn_add();" class="ml-2">
            <button class="all__btn img__btn insert__btn">
              <span class="box__label">입력</span>
            </button>
          </a>
          <a href="javascript:fn_delete('D');" class="ml-2">
            <button class="all__btn img__btn delete__btn">
              <span class="box__label">삭제</span>
            </button>
          </a>
          <a href="javascript:fn_save()" class="ml-2">
            <button class="all__btn img__btn save__btn">
              <span class="box__label">저장</span>
            </button>
          </a>
        </div>
      </div>
      <!-- 검색조건 영역 End -->
    </section>
    <!-- 검색영역 설정 End -->

    <form commandname="VO" id="savefrm" name="savefrm" method="post">
      <input type="hidden" name="q_user_id" id="q_user_id" value="admin">
      <input type="hidden" name="iud" value="">
      <input type="hidden" name="lrgc_cd" value="">
      <input type="hidden" name="clmn_nm" value="">
      <input type="hidden" name="appl_kr_nm" value="">
      <input type="hidden" name="appl_engl_nm" value="">
      <input type="hidden" name="clmn_appl_dvsn" value="">
      <input type="hidden" name="iput_nm1" value="">
      <input type="hidden" name="iput_nm2" value="">
      <input type="hidden" name="iput_nm3" value="">
      <input type="hidden" name="iput_nm4" value="">
      <input type="hidden" name="iput_nm5" value="">
      <input type="hidden" name="iput_vlue1" value="">
      <input type="hidden" name="iput_vlue2" value="">
      <input type="hidden" name="iput_vlue3" value="">
      <input type="hidden" name="iput_vlue4" value="">
      <input type="hidden" name="iput_vlue5" value="">
      <input type="hidden" name="elct_lrgc_cd" value="">
      <input type="hidden" name="rqrd_yn" value="">
    </form>

    <!-- Data 영역설정 Start -->
    <!-- <div style="text-align: center;"><h1 id="q_title" style="color: black;">촬영 장비 관리</h1></div> -->
    <section class="inquiry__result-section mt5">
      <div class="fl-R grid1" align="center" style="width:100%"> <!-- width은 화면에 맞춰서 조절 -->
        <table id="list" style="" ></table>
      </div>


    </section>
    <!-- Data 영역설정 End -->
  </div>
</main>


<script type="text/javaScript" language="javascript">

  var lrgc_text = "";
  var lrgc_Cd_List = null;	// 대분류 전체 리스트(불용코드 제외)
  var clmn_text = "";
  var clmn_Appl_Dvsn = null;	// 컬럼적용구분 중분류 리스트
  var currdate = "";

  // 대분류 코드 전체
  function lrgc_cd_list(){
    $.ajax({
      type : "post",
      url : "/json/code/risCodeList.do?checkLMS=L&searchstatus=N",
      async : false,
      error : function(){
        alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
      },
      success : function(data) {
        lrgc_Cd_List = data.rows
        if(data.rows.length  < 1){
          $("#selectBox").find("option").remove().end().append("<option label = "+i18n.message_049+"/>"); // '대분류 코드를 선택해주세요.'
        }else{
          for(var i = 0; i <data.rows.length ; i++){
            $("#selectBox").append("<option value='"+data.rows[i].lrgc_cd+"'>"+data.rows[i].lrgc_kr_nm+"</option>");
            lrgc_text += data.rows[i].lrgc_cd+":"+data.rows[i].lrgc_kr_nm+";"
          }
        }
      }
    });
  }

  // 컬럼적용구분 중분류
  function clmn_appl_dvsn(){
    $.ajax({
      type : "post",
      url : "/json/code/risCodeList.do?checkLMS=M&lrgc_cd=CLMN_APPL_DVSN",
      async : false,
      error : function(){
        alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
      },
      success : function(data) {
        clmn_Appl_Dvsn = data.rows
        for(var i = 0; i <data.rows.length ; i++){
          clmn_text += data.rows[i].mddl_cd+":"+data.rows[i].mddl_kr_nm+";"
        }
      }
    });
  }

  /* 시작 시 */
  $(document).ready(function(){
    currdate = $("#currdate").val();
    lrgc_cd_list()
    clmn_appl_dvsn()

    var gwidth =$(".grid1").width();
    var gheight = $(".inquiry__result-section").height();
    gwidth = parseInt(gwidth);

    /* 그리드(중분류) */
    $('#list').jqGrid({
      url: "/json/code/ris0109.do",
      postData : {
        lrgc_cd  : $("#selectBox").val(),
      }, // URL에서 검색 조건으로 가져갈 파라미터
      reordercolNames:true,
      mtype:'POST', // 전송 타입
      datatype : "json", // 받는 데이터 형태
      //colNames:[ 'iud', '병원ID', '대분류코드', '컬럼 명', '적용 한글 명', ' 적용 영문명', '컬럼적용구분', '필수입력', '선택대분류코드', '입력명1', '입력값1', '입력명2', '입력값2', '입력명3', '입력값3', '입력명4', '입력값4', '입력명5', '입력값5'], //테이블의 제목

      colNames:[ 'iud', '병원ID', '대분류코드', i18n.text_248, i18n.text_249,i18n.text_250,
        i18n.text_095, i18n.text_251, i18n.text_094, i18n.text_092+1, i18n.text_093+1, i18n.text_092+2,
        i18n.text_093+2, i18n.text_092+3, i18n.text_093+3, i18n.text_092+4, i18n.text_093+4, i18n.text_092+5, i18n.text_093+5], //  '컬럼 명', '적용 한글 명', ' 적용 영문명', '컬럼적용구분', '필수입력', '선택대분류코드', '입력명1', '입력값1'

      colModel:[
        { name: 'iud'		  		, index: 'iud'				, width: 0  , hidden: true}																			,
        { name: 'hspt_id'	  		, index: 'hspt_id'			, width: 0  , hidden: true}																			,
        { name: 'lrgc_cd'	  		, index: 'lrgc_cd'			, width: 0  , hidden: true}																			,
        { name: 'clmn_nm'	  		, index: 'clmn_nm'			, width: '100px' , align:"left" }																	,
        { name: 'appl_kr_nm' 		, index: 'appl_kr_nm' 		, width: '100px' , align:"left" , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'appl_engl_nm' 	, index: 'appl_engl_nm' 	, width: '100px' , align:"left" , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'clmn_appl_dvsn'	, index: 'clmn_appl_dvsn' 	, width: '80px' , align:"left"  , editable: true ,
          formatter:"select",
          formatoptions :{value:clmn_text.slice(0, -1)},
          edittype:"select",
          editoptions: {dataUrl:'', buildSelect:function(){
              var s = "<select id='gridSelectBoxC'>";
              for(var i=0;i<clmn_Appl_Dvsn.length;i++){
                s += '<option value="' + clmn_Appl_Dvsn[i].mddl_cd + '">' + clmn_Appl_Dvsn[i].mddl_kr_nm+ '</option>';
              }
              return s + "</select>";
            }  }
        }		,
        { name: 'rqrd_yn' 			, index: 'rqrd_yn' 			, width: '50px' , align:"center"  , edittype:"checkbox",editable:true, editoptions: { value:"Y:N" }},
        { name: 'elct_lrgc_cd' 	, index: 'elct_lrgc_cd' 	, width: '100px' , align:"left" , editable: true ,
          formatter:"select",
          formatoptions :{value:lrgc_text.slice(0, -1)},
          edittype:"select",
          editoptions: {dataUrl:'', buildSelect:function(){
              var s = "<select id='gridSelectBoxC'>";
              s +="<option value=''>-"+i18n.text_051+"-</option>";
              for(var i=0;i<lrgc_Cd_List.length;i++){
                s += '<option value="' + lrgc_Cd_List[i].lrgc_cd + '">' + lrgc_Cd_List[i].lrgc_kr_nm+ '</option>';
              }
              return s + "</select>";
            }  }
        }		,
        { name: 'iput_nm1' 		, index: 'iput_nm1' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_vlue1' 		, index: 'iput_vlue1' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_nm2' 		, index: 'iput_nm2' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_vlue2' 		, index: 'iput_vlue2' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_nm3' 		, index: 'iput_nm3' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_vlue3' 		, index: 'iput_vlue3'		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_nm4' 		, index: 'iput_nm4' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_vlue4' 		, index: 'iput_vlue4' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_nm5' 		, index: 'iput_nm5' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
        { name: 'iput_vlue5' 		, index: 'iput_vlue5' 		, width: '50px' , align:"left"  , editable: true , editoptions:{maxlength : 100}}					,
      ], //서버에서 받은 데이터 설정
      jsonReader: {
        repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
        root:'ris0109List', //서버의 결과 내용에서 데이터를 읽어오는 기준점
        //page:'page', // 현재 페이지 currentPage
        //total:'total', // 총 페이지 수 totalPage
        records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord
      },
      width : gwidth-10,
      height : gheight*0.8, //테이블의 세로 크기, Grid의 높이
      loadtext : i18n.message_181, //"자료 조회중입니다. 잠시만 기다리세요..."
      emptyrecords: "Nothing to display",
      rowNum:-1,
      rownumbers: true,
      celledit:true,
      editurl: "clientArray",
      gridview : true,  // 선표시 true/false
      loadComplete: function(data){

        var ids = $("#list").getDataIDs();

        var totcnt  = jQuery("#list").jqGrid("getGridParam","records");
        if(totcnt < 1){
          $("#list > tbody").append("<tr><td align='center' colspan='17'>&nbsp;</td></tr><tr><td align='center' colspan='17'><b>"+i18n.message_083+"<br/></b></td></tr><tr><td align='center' colspan='17'>&nbsp;</td></tr>"); //등록된 정보가 존재하지않습니다.
        }
      },
      beforeSelectRow: function (rowid, e) {
        $("#list").jqGrid('setSelection', rowid, true);
      },
      onSelectRow: function(rowid) {
        var rowObject = $("#list").jqGrid('getRowData',rowid);
      }
    }); // 중분류 그리드 END
  }) // getReady END

  /* 화면 reize */
  $(window).bind('resize', function() {
    if ((screen.availHeight || screen.height - 30) <= window.innerHeight) {}
    else {
      var gridw = $(window).width()-10;
      fn_resize("list", gridw , '1.0');
    }
  }).trigger('resize');
  // selectbox
  function searchBox(lrgc_cd){
    jQuery('#list').jqGrid('setGridParam', {
      postData: {
        lrgc_cd : lrgc_cd,
      },
      datatype:"json"
    }).trigger("reloadGrid");
  }


  // 입력
  function fn_add(){
    if($("#selectBox").val() == null || $("#selectBox").val() == ""){
      alert(i18n.message_049); //"대분류 코드를 선택해주세요."
      return
    }
    var ids = $("#list").getDataIDs();

    var iudcnt = 0;
    for(var i in ids){
      var iud = $('#list').getCell(ids[i], "iud");
      if(iud == "I" || iud == "U"){
        iudcnt++
      }
    }
    if(iudcnt > 0){
      return
    }


    if(ids.length > 0){
      fn_update("I");
      return
    }

    var clmn_nm = ['mddl_cd','mddl_kr_nm','mddl_engl_nm','chrc1','chrc2','chrc3','chrc4','chrc5'
      , 'nmbr1', 'nmbr2', 'nmbr3', 'nmbr4', 'nmbr5']
    jQuery('#list').jqGrid('clearGridData');
    for(var i in clmn_nm){

      var rowData ={
        iud:"I"
        ,	lrgc_cd : $("#selectBox").val()
        ,	clmn_nm :clmn_nm[i]
      };	// 기본값 셋팅
      if(i < 1){
        // mddl_cd 는 한글명, 영문명만 입력 가능
        jQuery("#list").setColProp('clmn_appl_dvsn' , { editable: false });				// 수정불가
        jQuery("#list").setColProp('rqrd_yn'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('elct_lrgc_cd'	, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_vlue1'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_vlue2'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_vlue3'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_vlue4'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_vlue5'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_nm1'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_nm2'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_nm3'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_nm4'		, { editable: false });				// 수정불가
        jQuery("#list").setColProp('iput_nm5'		, { editable: false });				// 수정불가

        $("#list").jqGrid("addRowData",parseInt(i)+1,rowData,'first'); // 첫 행에 Row 추가
        jQuery('#list').jqGrid('editRow',parseInt(i)+1,false);

        $("#list").jqGrid("setCell",parseInt(i)+1,'clmn_appl_dvsn',"T"); 			// 값 설정
        $("#list").jqGrid("setCell",parseInt(i)+1,'rqrd_yn',"Y");

        jQuery("#list").setColProp('clmn_appl_dvsn' , { editable: true });		// 수정가능
        jQuery("#list").setColProp('rqrd_yn'		, { editable: true });				// 수정가능
        jQuery("#list").setColProp('elct_lrgc_cd'	, { editable: true });				// 수정가능
        jQuery("#list").setColProp('iput_vlue1'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_vlue2'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_vlue3'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_vlue4'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_vlue5'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_nm1'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_nm2'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_nm3'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_nm4'		, { editable: true });				// 수정불가
        jQuery("#list").setColProp('iput_nm5'		, { editable: true });				// 수정불가
      }else{
        $("#list").jqGrid("addRowData",parseInt(i)+1,rowData,'last'); //선택된 행 뒤에 Row추가
        jQuery('#list').jqGrid('editRow',parseInt(i)+1,false);

      }
    }

    $("#list").jqGrid('setSelection', 1, true);
  }

  // 수정
  function fn_update(iud){
    if($("#selectBox").val() == null || $("#selectBox").val() == ""){
      alert(i18n.message_049); //"대분류 코드를 선택해주세요."
      return
    }
    var ids = $("#list").getDataIDs();

    if(ids.length <1 ){
      alert(i18n.message_098); //"수정할 정보가 없습니다."
    }else{
      if(iud == null || iud == ""){
        if(!confirm(i18n.message_084)){ //"기존에 저장된 정보가 손상될 수 있습니다.\n정말 수정 하시겠습니까?"
          return
        }
      }
      for(var i in ids){
        if(i < 1){
          iud = $('#list').getCell(ids[i], "iud");
          jQuery("#list").setColProp('clmn_appl_dvsn' , { editable: false });				// 수정불가
          jQuery("#list").setColProp('rqrd_yn'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('elct_lrgc_cd'	, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_vlue1'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_vlue2'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_vlue3'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_vlue4'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_vlue5'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_nm1'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_nm2'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_nm3'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_nm4'		, { editable: false });				// 수정불가
          jQuery("#list").setColProp('iput_nm5'		, { editable: false });				// 수정불가

          if(iud == "I"){
            $("#list").jqGrid("setCell",parseInt(i)+1,'iud',"I");
          }else{
            $("#list").jqGrid("setCell",parseInt(i)+1,'iud',"U");
          }
          jQuery('#list').editRow(parseInt(i)+1);
          $("#list").jqGrid("setCell",1,'rqrd_yn',"Y");

          jQuery("#list").setColProp('clmn_appl_dvsn' , { editable: true });				// 수정가능
          jQuery("#list").setColProp('rqrd_yn'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('elct_lrgc_cd'	, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_vlue1'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_vlue2'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_vlue3'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_vlue4'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_vlue5'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_nm1'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_nm2'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_nm3'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_nm4'		, { editable: true });				// 수정가능
          jQuery("#list").setColProp('iput_nm5'		, { editable: true });				// 수정가능
        }else{
          if(iud == "I"){
            $("#list").jqGrid("setCell",parseInt(i)+1,'iud',"I");
          }else{
            $("#list").jqGrid("setCell",parseInt(i)+1,'iud',"U");
          }
          jQuery('#list').editRow(ids[i]);
        }
      }
    }
  }

  //삭제
  function fn_delete(){
    var ids = $("#list").getDataIDs();
    if($("#selectBox").val() == null || $("#selectBox").val() == ""){
      alert(i18n.message_049); //"대분류 코드를 선택해주세요."
      return
    }
    if(ids.length < 1){
      alert(i18n.message_017) //"삭제할 정보가 없습니다."
      return
    }

    var iud = "";
    for(var i in ids){
      iud = $('#list').getCell(ids[i], "iud");
    }

    if(confirm(i18n.message_066)){ //"정말 삭제하시겠습니까?"

      if(iud == "I"){
        for(var i in ids){
          $("#list").jqGrid("delRowData", ids[i]); // 행 삭제
        }
        //$("#selectBox option:eq(0)").prop("selected",true);
        jQuery('#list').jqGrid('setGridParam', {
          postData: {
            lrgc_cd : $("#selectBox").val(),
          },
          datatype:"json"
        }).trigger("reloadGrid");

        return
      }


      fn_reset();

      document.savefrm.iud.value       	   	   = "D";
      document.savefrm.lrgc_cd.value       	   = $("#selectBox").val();

      var authok = $("form[name='savefrm']").serialize();

      $.ajax( {
        type : "post",
        url : "/json/code/ris0109iud.do",
        data : authok,
        dataType : "json",
        async : false,
        error : function(){
          alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          if(data.error_code == "0"){
            //$("#selectBox option:eq(0)").prop("selected",true);

            jQuery('#list').jqGrid('setGridParam', {
              postData: {
                lrgc_cd : $("#selectBox").val(),
              },
              datatype:"json"
            }).trigger("reloadGrid");
          }
        }
      });
    }
  }

  // 저장
  function fn_save(){
    if($("#selectBox").val() == null || $("#selectBox").val() == ""){
      alert(i18n.message_049); //"대분류 코드를 선택해주세요."
      return
    }
    var ids = $("#list").getDataIDs();
    var iudcnt = 0;
    for(var i in ids){
      $("#list").jqGrid('saveRow',ids[i]);
      var iud = $('#list').getCell(ids[i], "iud");

      if(iud == "I" || iud == "U"){
        iudcnt++
      }

      if($('#list').getCell(ids[i], "clmn_appl_dvsn") != "H"){
        if($('#list').getCell(ids[i], "appl_kr_nm") == null || $('#list').getCell(ids[i], "appl_kr_nm") == ""){
// 				alert((parseInt(i)+1)+"행 [적용명]을 입력해주세요.")
          alert(i18n.message_085.replace("N", (parseInt(i)+1)));
          $("#list").jqGrid('setSelection', ids[i], true);
          fn_update(iud)
          return
        }
        if($('#list').getCell(ids[i], "clmn_appl_dvsn") == "S"){
          if($('#list').getCell(ids[i], "elct_lrgc_cd") == null || $('#list').getCell(ids[i], "elct_lrgc_cd") == ""){
// 					alert((parseInt(i)+1)+"행 [선택대분류코드]를 선택해주세요.")
            alert(i18n.message_086.replace("N", (parseInt(i)+1)));
            $("#list").jqGrid('setSelection', ids[i], true);
            fn_update(iud)
            return
          }
        }else if($('#list').getCell(ids[i], "clmn_appl_dvsn") == "C" || $('#list').getCell(ids[i], "clmn_appl_dvsn") == "R"){
          if(($('#list').getCell(ids[i], "iput_nm1") == null || $('#list').getCell(ids[i], "iput_nm1") == "")
            || ($('#list').getCell(ids[i], "iput_vlue1") == null || $('#list').getCell(ids[i], "iput_vlue1") == "")){
// 					alert((parseInt(i)+1)+"행 [입력명1], [입력값1]을 입력해주세요.")
            alert(i18n.message_087.replace("N", (parseInt(i)+1)));
            $("#list").jqGrid('setSelection', ids[i], true);
            fn_update(iud)
            return
          }
        }
      }
    }

    if(iudcnt < 1 ){
      alert(i18n.message_016) //"저장할 정보가 없습니다."
      return
    }


    for(var i in ids){
      var iud = $('#list').getCell(ids[i], "iud");
      var rqrd_yn = $('#list').getCell(ids[i], "rqrd_yn");
      if(i < 1){
        rqrd_yn = "Y"
      }
      fn_reset();

      document.savefrm.iud.value       	   	   = iud;
      document.savefrm.lrgc_cd.value       	   = $('#list').getCell(ids[i], "lrgc_cd");
      document.savefrm.clmn_nm.value       	   = $('#list').getCell(ids[i], "clmn_nm");
      document.savefrm.appl_kr_nm.value          = $('#list').getCell(ids[i], "appl_kr_nm");
      document.savefrm.appl_engl_nm.value        = $('#list').getCell(ids[i], "appl_engl_nm");
      document.savefrm.clmn_appl_dvsn.value      = $('#list').getCell(ids[i], "clmn_appl_dvsn");
      document.savefrm.iput_nm1.value       	   = $('#list').getCell(ids[i], "iput_nm1");
      document.savefrm.iput_nm2.value       	   = $('#list').getCell(ids[i], "iput_nm2");
      document.savefrm.iput_nm3.value       	   = $('#list').getCell(ids[i], "iput_nm3");
      document.savefrm.iput_nm4.value       	   = $('#list').getCell(ids[i], "iput_nm4");
      document.savefrm.iput_nm5.value       	   = $('#list').getCell(ids[i], "iput_nm5");
      document.savefrm.iput_vlue1.value          = $('#list').getCell(ids[i], "iput_vlue1");
      document.savefrm.iput_vlue2.value          = $('#list').getCell(ids[i], "iput_vlue2");
      document.savefrm.iput_vlue3.value          = $('#list').getCell(ids[i], "iput_vlue3");
      document.savefrm.iput_vlue4.value          = $('#list').getCell(ids[i], "iput_vlue4");
      document.savefrm.iput_vlue5.value          = $('#list').getCell(ids[i], "iput_vlue5");
      document.savefrm.elct_lrgc_cd.value        = $('#list').getCell(ids[i], "elct_lrgc_cd");
      document.savefrm.rqrd_yn.value       	   = rqrd_yn

      var authok = $("form[name='savefrm']").serialize();

      $.ajax( {
        type : "post",
        url : "/json/code/ris0109iud.do",
        data : authok,
        dataType : "json",
        async : false,
        error : function(){
          alert(i18n.message_045); // "[전산오류]처리시 오류가 발생하였습니다. 전산실에 문의하세요.!"
        },
        success : function(data) {
          if(data.error_code == "0"){
            //$("#list").jqGrid("setCell",ids[i],'iud',null); // 첫 행에 Row 추가
          }else{
            fn_update(iud)
          }
        }
      });
    }

    if(iudcnt > 1 ){
      jQuery('#list').jqGrid('setGridParam', {
        postData: {
          lrgc_cd : $("#selectBox").val(),
        },
        datatype:"json"
      }).trigger("reloadGrid");
    }
  }

  //초기화
  function fn_reset(){

    document.savefrm.iud.value       	 	   = "";
    document.savefrm.lrgc_cd.value       	   = "";
    document.savefrm.clmn_nm.value       	   = "";
    document.savefrm.appl_kr_nm.value          = "";
    document.savefrm.appl_engl_nm.value        = "";
    document.savefrm.clmn_appl_dvsn.value      = "";
    document.savefrm.iput_nm1.value       	   = "";
    document.savefrm.iput_nm2.value       	   = "";
    document.savefrm.iput_nm3.value       	   = "";
    document.savefrm.iput_nm4.value       	   = "";
    document.savefrm.iput_nm5.value       	   = "";
    document.savefrm.iput_vlue1.value          = "";
    document.savefrm.iput_vlue2.value          = "";
    document.savefrm.iput_vlue3.value          = "";
    document.savefrm.iput_vlue4.value          = "";
    document.savefrm.iput_vlue5.value          = "";
    document.savefrm.elct_lrgc_cd.value        = "";
    document.savefrm.rqrd_yn.value       	   = "";

  }

  /* 엔터키 검색  */
  function enter(){
    if(window.event.keyCode==13){
      fn_egov_selectGrid();	// 조회(검색)
    }
  }
</script>
</body>
</html>