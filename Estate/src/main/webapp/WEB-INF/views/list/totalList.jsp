<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/list/totalList.js"></script>	
<form id="totalList" name="totalList" action="post">

<div id="objtList" name="objtList" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_ob_list.jpg">
	</div>
	<div class="list_div${viewMode}">	
		<table width="1500px" height="520px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="20px"></td>
				<td width="1460px">
					<table style="width:1460;height:465px;" cellpadding="0" cellspacing="0" border="0">
						<tr><!-- main category -->
							<td height="45px">
								<table widht="1460px" height="44px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="223px" height="44px"><a href="./totalList?mainc=1&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[1]}.jpg" border="0"></a></td>
										<td width="239px"><a href="./totalList?mainc=2&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[2]}.jpg" border="0"></a></td>
										<td width="255px"><a href="./totalList?mainc=3&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[3]}.jpg" border="0"></a></td>
										<td width="235px"><a href="./totalList?mainc=4&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[4]}.jpg" border="0"></a></td>
										<td width="262px"><a href="./totalList?mainc=5&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[5]}.jpg" border="0"></a></td>
										<td width="246px"><a href="./totalList?mainc=6&vm=${viewMode}"><img src="./resources/images/ob_list_mc_${main_category_state[6]}.jpg" border="0"></a></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><!-- sub category -->
							<td height="60px" background="./resources/images/category_bg${mainc}.jpg" valign="center" style="padding-left:20px;padding-top:5px;background-repeat:repeat-x;">
								<c:choose>
									<c:when test="${mainc == 1}">
										아파트 카테고리					
									</c:when>
									<c:when test="${mainc == 2}">
										상가 카테고리					
									</c:when>
									<c:when test="${mainc == 3}">
										사무실/빌딩 카테고리					
									</c:when>
									<c:when test="${mainc == 4}">
										오피스텔 카테고리					
									</c:when>
									<c:when test="${mainc == 5}">
										주상복합 카테고리					
									</c:when>
									<c:when test="${mainc == 6}">
										분양권 카테고리					
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr><!-- tab -->
							<td height="55px">
								<table widht="1460px" height="55px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<c:forEach items="${tab_category_state}" var="tab" varStatus="i">
										<td width="248px" height="55px">
											<a href="./totalList?mainc=${mainc}&tab=${i.index+1}&vm=${viewMode}"><img src="./resources/images/ob_list_ap_tab${tab}.jpg" border="0"></a>
										</td>
										</c:forEach>
										<td width="100%" align="right" valign="bottom">
											<input type="checkbox">활성 <input type="checkbox">보류 <input type="checkbox">내가등록한물건만보기
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><!-- list -->
							<td height="306" valign="top">
								<table class="ob_list">
								<c:choose>
									<c:when test="${mainc == 6}"><tr class="title${tab+4}"></c:when>
									<c:otherwise><tr class="title${tab}"></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainc == 1}">
											<td>등록일</td>
											<td>단지명</td>
											<td>평형</td>
											<td>동</td>
											<td>층</td>
											<td>향</td>
											<td>매매가</td>
											<td>온돌</td>
											<td>상태</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
										
									</c:when>
									<c:when test="${mainc == 2}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>보증금 / 월세</td>
											<td>권리금</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
														
									</c:when>
									<c:when test="${mainc == 3}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>매매가</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
									</c:when>
									<c:when test="${mainc == 4}">
											<td>등록일</td>
											<td>건물명</td>
											<td>평형</td>
											<td>동</td>
											<td>층</td>
											<td>향</td>
											<td>보증금/월세</td>
											<td>부가세</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
														
									</c:when>
									<c:when test="${mainc == 5}">
											<td>등록일</td>
											<td>건물명</td>
											<td>평형</td>
											<td>동</td>
											<td>층</td>
											<td>향</td>
											<td>보증금</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
													
									</c:when>
									<c:when test="${mainc == 6}">
											<td>등록일</td>
											<td>건물명</td>
											<td>면적</td>
											<td>동</td>
											<td>층</td>
											<td>향</td>
											<td>분양가</td>
											<td>프리미엄</td>
											<td>입주일</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>		
									</c:when>
								</c:choose>	
								<tbody id="objtTbody">
								</tbody>																		
								</table>
							</td>
						</tr>
						
						<tr><td height="20px">&nbsp;</td></tr>
						<tr><!-- paging -->
							<td align="center">
								<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="488px" height="41px">&nbsp;</td>
										<td width="486px" align="center">
											<div id="objtPagingDiv" class="pagination"></div>
										</td>
										<td width="486px" align="right">
											<c:if test="${viewMode==2}">
											<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
												<c:forEach items="${viewMode_btn_state}" var="mode" varStatus="i">
													<a href="./totalList?mainc=${mainc}&tab=${tab}&vm=${i.index+1}"><img src="./resources/images/btn_viewmode_${mode}.jpg"></a>
												</c:forEach>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="./resources/images/btn_search.jpg">
											</div>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="20px">&nbsp;</td>
			</tr>
		</table>		
	</div>
</div>

<div style="height:20px;">&nbsp;</div>
<div id="custList" name="custList" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_cl_list.jpg">
	</div>
	<div class="list_div${viewMode*3}">	
		<table width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="20px"></td>
				<td width="1460px" valign="top">
					<table width="1460px" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="100%" align="right" valign="bottom">
								<input type="checkbox">활성 <input type="checkbox">보류 <input type="checkbox">내가등록한고객만보기
							</td>
						</tr>
						<tr>
							<td>
								<table class="cl_list">
									<tr class="title">
										<td>등록일자</td>
										<td>고객명</td>
										<td>연락처</td>
										<td>의뢰내역</td>
										<td>등록자</td>
										<td>상태</td>
									</tr>
									<tbody id="custTbody">
									</tbody>
								</table>
							</td>
						</tr>
						<tr><td height="20px">&nbsp;</td></tr>
						<tr><!-- paging -->
							<td align="center">
								<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="488px" height="41px">&nbsp;</td>
										<td width="486px" align="center">
											<div id="custPagingDiv" class="pagination"></div>
										</td>
										<td width="486px" align="right">
											<c:if test="${viewMode==1 || viewMode==3}">
											<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
												<c:forEach items="${viewMode_btn_state}" var="mode" varStatus="i">
													<a href="./totalList?mainc=${mainc}&tab=${tab}&vm=${i.index+1}"><img src="./resources/images/btn_viewmode_${mode}.jpg"></a>
												</c:forEach>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="./resources/images/btn_search.jpg">
											</div>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="20px"></td>
			</tr>
		</table>		
	</div>
</div>

<input type="hidden" name="viewMode" id="viewMode" value="${viewMode}"/>
<input type="hidden" name="objtTp" id="objtTp" value="${objtTp}"/>
<input type="hidden" name="saleTp" id="saleTp" value="${saleTp}"/>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 	

<script id="objtListTemplte1" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>											
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte2" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.rightAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte3" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte4" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.surtaxYn}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>


<script id="objtListTemplte5" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>

	
<script id="objtListTemplte6" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $value.viewUrl}}','{{html $value.objtNo}}','{{html $value.objtTp}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.parcelAmt}}</td>
		<td>{{html $value.premiumAmt}}</td>
		<td>{{html $value.availableDt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>

<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan = {{html col}}>해당하는 물건이 존재하지 않습니다.</td>
	</tr>
</script>


<script id="custListTemplte" type="text/x-jquery-tmpl">	
{{each custList}}					
	<tr>
		<td><a href="./viewClient.do?custId={{html $value.custId}}">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.custNm}}</td>
		<td>{{html $value.custTel1}}-{{html $value.custTel2}}-{{html $value.custTel3}}</td>
		<td>{{html $value.reqContent}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="custListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="6">고객이 존재하지 않습니다.</td>
	</tr>
</script>

