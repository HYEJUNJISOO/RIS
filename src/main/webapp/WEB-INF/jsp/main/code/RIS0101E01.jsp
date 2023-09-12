<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드상세</title>
<link rel="stylesheet" type="text/css" href="/css/code/RIS0101E01.css"/>
</head>
	<body>
		<form commandName="VO" id="savefrm" name="savefrm" method="post">
		<input type="hidden" name="iud"      	  value=""/>  
		<input type="hidden" name="checkLMS"      value=""/>  
		<input type="hidden" name="lrgc_cd"       value=""/>  
		<input type="hidden" name="mddl_cd"       value=""/>  
		<input type="hidden" name="smll_cd"       value=""/>  
		<input type="hidden" name="mddl_kr_nm"    value=""/>  
		<input type="hidden" name="mddl_acph"     value=""/>  
		<input type="hidden" name="smll_kr_nm"    value=""/>  
		<input type="hidden" name="otpt_sqnc"     value=""/>  
		<input type="hidden" name="appl_date"     value=""/>  
		<input type="hidden" name="expr_date"     value=""/>
		<input type="hidden" name="currdate" value="2023-09-07"/>
		<input type="hidden" name="q_user_id" id="q_user_id" value="admin"/>  
	</form>

	<!-- Main 화면 영역  Start -->
	
	<!-- 검색영역 설정 Start --> 
	<div class="inquiry__page-flex mt5">
		<section class="inquiry__search-section">
        <!-- 검색조건 영역 Start -->
			<div class="inquiry__search-flex" style="justify-content:space-between;"> <!-- 1 Row -->
				<div class="box__flex">
					<button class="all__btn img__btn mokrok__btn">목록</button>							   					
				</div>
				<div class="box__flex">
					<a href="javascript:fn_update();" class="ml-2">
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
        <!-- 검색조건 영역 End -->
    	</section>  
		<!-- 검색영역 설정 End -->
		
		<!-- Data 영역설정 Start -->		   	
    	<section class="inquiry__result-section mt5">
		    
		    <div class="fl-L grid1 mx-1" style="width:50%;"> <!-- width은 화면에 맞춰서 조절 -->
		    <form commandName="VO" id="regfrm" name="regfrm" method="post">
			<input type="hidden" name="currdate" id="currdate" value="2023-09-07"/>
			<input type="hidden" name="q_user_id" id="q_user_id" value="admin"/>
			<input type="hidden" name="checkLMS" id="checkLMS" value="L"/>
			<input type="hidden" name="hspt_id" id="hspt_id" value="A001"/>
			<input type="hidden" name="lrgc_cd" id="lrgc_cd" value="IMGN_DVSN_CD"/>
			<input type="hidden" name="lrgc_acph" id="lrgc_acph" value="1"/>
			<input type="hidden" name="expr_date" id="expr_date" value="3000-01-01"/>
			<input type="hidden" name="q_smll_cd" id="q_smll_cd" value=""/>
			<input type="hidden" name="q_mddl_cd" id="q_mddl_cd" value=""/>
			<input type="hidden" name="q_lrgc_cd" id="q_lrgc_cd" value="IMGN_DVSN_CD"/>
			
			
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
<!-- 		                       	<th colspan="2">대분류코드</th> -->
		                       	<th colspan="2">대분류 코드</th>
		                       	<td colspan="4">IMGN_DVSN_CD</td>
<!-- 		                       	<th colspan="2">대분류 한글 명</th> -->
		                       	<th colspan="2">대분류 한글 명</th>
		                       	<td colspan="2">
		                       		촬영구분
		                       	</td>
							</tr>
						
	 	          		
	               		
	                   	<tr>
	                       	<th colspan="2">

	                       		대분류 영어 명

	                       		

	                       		
	                       	</th>
	                       	<td colspan="4">
	                       		
	                       		
	                       		
	                       	</td>
	                   		<th colspan="2">

	                   			대분류 약어 명
	                   			

	                       		
	                       		

	                       		
							</th>
	                       	<td colspan="2">
	                       		
	                       		
	                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2">자릿수</th> -->
	                   		<th colspan="2">자릿수</th>
	                       	<td colspan="4">
	                       		1
	                       		
	                       		
	                       	</td>
<!-- 	                       	<th colspan="2">출력순</th> -->
	                       	<th colspan="2">출력순</th>
	                       	<td colspan="2">
								1                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2">적용일자</th> -->
	                   		<th colspan="2">적용일자</th>
	                       	<td colspan="4">
	                       		2021-03-09
	                       	</td>
<!-- 	                       	<th colspan="2">불용일자</th> -->
	                       	<th colspan="2">불용일자</th>
	                       	<td colspan="2">
								3000-01-01                       		
	                       	</td>
						</tr>
						
	                   
						
	                   	<tr>
<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값1</th> -->
	                   		<th colspan="2" style="vertical-align: middle;">문자값1</th>
	                       	<td colspan="4">
	                       		<textarea rows="3" cols="1000" readonly="readonly" style="width: 100%;">IMGN_DVSN_CD(촬영구분 코드)</textarea>
	                       	</td>
<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값1</th> -->
	                       	<th colspan="2" style="vertical-align: middle;">숫자값1</th>
	                       	<td colspan="2" style="vertical-align: middle;">
								                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값2</th> -->
	                   		<th colspan="2" style="vertical-align: middle;">문자값2</th>
	                       	<td colspan="4">
	                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
	                       	</td>
<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값2</th> -->
	                       	<th colspan="2" style="vertical-align: middle;">숫자값2</th>
	                       	<td colspan="2" style="vertical-align: middle;">
								                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값3</th> -->
	                   		<th colspan="2" style="vertical-align: middle;">문자값3</th>
	                       	<td colspan="4" style="vertical-align: middle;">
	                       		<textarea rows="3" cols="0" readonly="readonly" style="width: 100%;"></textarea>
	                       	</td>
<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값3</th> -->
	                       	<th colspan="2" style="vertical-align: middle;">숫자값3</th>
	                       	<td colspan="2" style="vertical-align: middle;">
								                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값4</th> -->
	                   		<th colspan="2" style="vertical-align: middle;">문자값4</th>
	                       	<td colspan="4">
	                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
	                       	</td>
<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값4</th> -->
	                       	<th colspan="2" style="vertical-align: middle;">숫자값4</th>
	                       	<td colspan="2" style="vertical-align: middle;">
								                       		
	                       	</td>
						</tr>
	                   	<tr>
<!-- 	                   		<th colspan="2" style="vertical-align: middle;">문자값5</th> -->
	                   		<th colspan="2" style="vertical-align: middle;">문자값5</th>
	                       	<td colspan="4">
	                       		<textarea rows="3" cols="" readonly="readonly" style="width: 100%;"></textarea>
	                       	</td>
<!-- 	                       	<th colspan="2" style="vertical-align: middle;">숫자값5</th> -->
	                       	<th colspan="2" style="vertical-align: middle;">숫자값5</th>
	                       	<td colspan="2" style="vertical-align: middle;">
								                       		
	                       	</td>
						</tr>
					</tbody>
				</table>
				<br/>
		</form>
		    
		    <!-- 두개 Grid 처리(좌측,우측) -->
		    
		       	      
		    </div>   	
		    <div class="fl-R grid2" align="center" style="width:50%"> <!-- width은 화면에 맞춰서 조절 -->
		    	
			    	<div class="srcArea">
						<div class="box__flex">
<!-- 							<span style="font-weight:bold;">중분류 코드</span> -->
							<span style="font-weight:bold;">중분류 코드</span>
							<a href='javascript:reloadGrid("list")' class="ml-2">
								<button class="all__btn img__btn img__btn refresh__btn">새로고침</button> 
							</a>
							<a href='javascript:fn_viewer("M")' class="ml-2">
							<button class="all__btn img__btn img__btn detail__btn">상세</button> 
							</a>
						</div>
						<div class="box__flex">
							<a href='javascript:fn_edit("M")' class="ml-2">
									<button class="all__btn img__btn img__btn update__btn">수정</button>
							</a>
							<a href='javascript:fn_add("M")' class="ml-2">
								<button class="all__btn img__btn insert__btn">입력</button>
							</a>
							<a href='javascript:fn_expr("M")' class="ml-2">
								<button class="all__btn img__btn bullyong__btn">불용</button>	
							</a>
							<a href='javascript:fn_delete("M")' class="ml-2">
								<button class="all__btn img__btn delete__btn">삭제</button>
							</a>
							<a href='javascript:fn_save("M")' class="ml-2">
								<button class="all__btn img__btn save__btn">저장</button>
							</a>
						</div>
					</div>
				
				<table id="list"></table>
				
					<div class="srcArea mt5">
						<div class="box__flex">
<!-- 							<span style="font-weight:bold;">소분류 코드</span> -->
							<span style="font-weight:bold;">소분류 코드</span>
							<a href='javascript:reloadGrid("list2)' class="ml-2">
								<button class="all__btn img__btn img__btn refresh__btn">새로고침</button> 
							</a> 
							<a href='javascript:fn_viewer("S")' class="ml-2">
								<button class="all__btn img__btn img__btn detail__btn">상세</button> 
							</a>
							</div>
							<div class="box__flex">
							<a href='javascript:fn_edit("S")' class="ml-2">
								<button class="all__btn img__btn img__btn update__btn">수정</button>
							</a>
							<a href='javascript:fn_add("S")' class="ml-2">
								<button class="all__btn img__btn insert__btn">입력</button>
							</a>
							<a href='javascript:fn_expr("S")' class="ml-2">
								<button class="all__btn img__btn bullyong__btn">불용</button>	
							</a>
							<a href='javascript:fn_delete("S")' class="ml-2">
								<button class="all__btn img__btn delete__btn">삭제</button>
							</a>
							<a href='javascript:fn_save("S")' class="ml-2">
								<button class="all__btn img__btn save__btn">저장</button>
							</a>
						</div>
					</div>
				
		       	<table id="list2"></table>
		   	</div>    
		    
		    
		</section>
        <!-- Data 영역설정 End --> 
        
	    <!-- 버튼 영역 Start(하단) --> 
		<!-- <section class="inquiry__btn-section mt5">
	        <div class="inquiry__btn-left">
	          <a href=""><button class="process__btn"><img src="/images/icons/white/download.png" alt="" width="18px" /><span>엑셀다운</span></button></a>
	        </div>
	        <div class="inquiry__btn-right">
	          <a href=""><button class="process__btn"><img src="/images/icons/white/inquiry.png" alt="" width="18px" /><span>&nbsp;조 회&nbsp;</span></button></a>
	          <a href=""><button class="process__btn"><img src="/images/icons/white/close.png" alt="" width="18px" /><span>&nbsp;닫 기&nbsp;</span></button></a>
	        </div>
	    </section>  -->
	    <!-- 버튼 영역 End -->
	</div>
	</body>
</html> 