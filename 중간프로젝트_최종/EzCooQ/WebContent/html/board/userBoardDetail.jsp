z<%@page import="kr.or.ddit.comment_board.vo.CommentBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardVO boardVO = (BoardVO)request.getAttribute("bv");
%>
<% List<CommentBoardVO> comList = (List<CommentBoardVO>)request.getAttribute("comList"); %>
<%	HttpSession httpSession = request.getSession(true);%>
<%	String memId = (String) httpSession.getAttribute("memId");%>
<%	String memPass = (String) httpSession.getAttribute("memPass");%>
<% 	CommentBoardVO comVO = (CommentBoardVO)request.getAttribute("comVO"); %>
<%	String ct = boardVO.getBoardContent();
	ct = ct.replaceAll("\r\n", "<br><br>");%>
<% String getPath = request.getContextPath(); %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>EzCooQ - 유저 레시피 상세</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<!-- JS & CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Slide.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/mainPage.js?v=1"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.rating-star {
	color: lightgrey;
	cursor: pointer
}

.rating-star.fa-star {
	color: #FDD05B
}

.rating-star-hover {
	opacity: .6
}

.rating-star-fractional {
 	position: absolute; 
	overflow: hidden;
	z-index: 2
}
.comment-view{
	margin-left:600px;
}

.table tr td{
	text-align: left;
}

td:nth-child(3){
	width:80px;
}
td:nth-child(4){
	width:320px;
}
td:nth-child(5){
	width:120px;
}
td:nth-child(6){
	width:120px;
}
td:nth-child(7){
	width:80px;
}
td:nth-child(8){
	width:80px;
}


.input-group{
 	left : 25%;
	
}

.awesomeRating{
	left: 34%;
}

img.ribbon {
      position: fixed;
      z-index: 1;
      top: 0;
      right: 0;
      border: 0;
      cursor: pointer; }

    
  #insCmtFrm1 {
  	padding-bottom: 200px;
  }  
  
    .modal-content {  
     margin-top:400px;  
  }  
 
  .modal-body{ 
  	height : 230px; 
  	text-align: center;
  } 
  
  .reply_write{
  	height: 120px;
  }
  
</style>

<script type="text/javascript">
function report(){
	var a = $("#reportHid").val()
	alert(a +"번 글을 신고 하였습니다.");	
	 $("#reportForm").submit(); 
}
function report2(){
	$("#repotDiv").css("display","block");
	$("#chkBtn").css("display","none");
}

</script>
</head>
<body>
<header class="site-header">
		<div class="top-header">
			<div class="container">
				<div class="row align-right">
				<%if(memId != null){%>
					<span class="idSpan right-padding"><a href="#" onclick="payStart('<%=memId%>', 10000)">포인트 충전</a></span>
					<span class="idSpan right-padding"><a href="#" onclick="chatPopup()">관리자 1:1 문의</a></span>
					<span class="idSpan"><%=memId%> 회원님 안녕하세요!</span>
				<%}else{%>
					<span class="idSpan">로그인을 해주세요.</span>
				<%}%>
				</div>
				<!-- /.row -->
			</div>
			
			<!-- /.container -->
		</div>
		<!-- /.top-header -->
		<div class="main-header">
			<div class="container">
				<div class="row">
						<h1 style="float: left; padding-left:170px;">
							<a class="inline-block" href="/EzCooQ/html/mainPage.jsp" style="color: orange; font-weight: bold; margin-right: 50px;">EzCooQ</a>
						</h1>
					<form id ="searchForm" class="form-inline"  action="<%=getPath%>/search" method="post">
						<input type="text" id="searchText"  name="searchText">
						<input type="button" value="검색 " id="searchBtn" onclick="search()" class="btn btn-warning">
					</form>	
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-header -->
		<div class="main-nav">
			<div class="container">
				<div class="row">
					<div class="list-menu leftFloat">
						<ul>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"> Recipe <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li>
										<a href="<%=getPath%>/officalBoardServlet">공식 레시피</a>
									</li>
									<li>
										<a href="<%=getPath%>/ViewBoardAll">유저 레시피</a>
								 	</li>
									<li>
										<a href="<%=getPath%>/SelectPayBoardServlet">유료 레시피</a>
								 	</li>
							<%if(memId!=null){ %>
									<li>
										<a href="#" onclick="BuyPage()">구매 레시피</a>
								 	</li>
							<%} %>	 	
								</ul>
							<li><a href="<%=getPath%>/html/product-detail.jsp">미니게임</a></li>
							<li><a href="<%=getPath%>/noticeMain">공지사항</a></li>
							<li><a href="<%=getPath%>/qnaMain">Q&A</a></li>
						</ul>
					</div>
					<div class="list-menu rightFloat">
						<ul>
						<%if (memId == null) {%>
							<li><a href="#" onclick="createMember()">회원가입</a>
							<li><a href="#" onclick="login()">로그인</a> 
						<%}else if("admin".equals(memId)){%>
							<li><a href="/EzCooQ/html/manage/salesManage.jsp">관리자 페이지</a>
							<li><a href="#" onclick="logout()">로그아웃</a> 						
						<%}else { %>
							<li><a href="#" onClick="cart()">장바구니</a>
							<li><a href="/EzCooQ/html/myPage/myInfoPage.jsp">마이페이지</a>
							<li><a href="#" onclick="logout()">로그아웃</a> 
						<%}%>
						</ul>
					</div>

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-nav -->
	<form id="cartForm1" action="<%=getPath%>/SearchCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId>
	</form>
	<form id="cartForm2" action="<%=getPath%>/SearchBuyCartServlet" method="post">
		<input type="hidden" value="<%=memId%>" name=memId2>
	</form>
	</header>
	<!-- /.site-header -->
	

	<form action="/EzCooQ/InsertRecipe" method="post">
		<div class="content-section" style="height: 600px;">

			<div class="container">
				<div class="row" style="margin-left:350px;">
					<div class="col-md-6">
							<div>
								<input type="hidden" id="boardNo" name="boardNo" value="<%=boardVO.getBoardNo()%>" >
								<input type="hidden" id="comNo" name="comNo">
							</div>
							<br>
							<div>
								<p style="display: inline; font-size: 30px; color:orange;" ><%=boardVO.getBoardTitle() %></p>
							</div>
							<div>
								<p>
								<img alt="" src="<%=boardVO.getBoardImg() %>" style="width: 300px; height: 300px;">
								</p>
							</div>
							<br>
							<div>
								<label>내용</label>
								<p style="display: inline;"><%=ct%></p>
							</div>
							<br>
							<div>
								<label>작성 날짜 :</label>
								<p style="display: inline;"><%=boardVO.getBoardDate() %></p>
							</div>
							<br>
							
							<%if(httpSession.getAttribute("memId") == null){ %>
<!-- 								<script> -->
<!-- // 									alert("로그인을 해주세요"); -->
<!--  								</script> -->
							<%} else if(memId.equals(boardVO.getMemId()) || memId.equals("admin")){%>
								<button type="button" class="btn btn-default btn-sm"
								onclick="location.href='<%=getPath %>/UpdateBoard?boardNo=<%=boardVO.getBoardNo() %>'">
									<span class="glyphicon glyphicon-pencil"></span>수정</button>
								<button type="button" class="btn btn-default btn-sm"
								onclick="location.href='<%=getPath %>/DeleteBoard?boardNo=<%=boardVO.getBoardNo() %>'">
									<span class="glyphicon glyphicon-pencil"></span>삭제</button>
							<%} %>
									
					</div><!-- col-md-12 -->
				</div><!-- /.row -->
			</div><!-- /.container -->
		</div><!-- /.content-section -->
	</form>
	
	
	
<!-- 	댓글 등록 모달 -->
	<div class="container">
		<div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">
     			 <!-- Modal content-->
      			<div class="modal-content">
       				 <div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
         				 <h4 class="modal-title">평점도 남겨주세요!</h4>
        			</div>
        			<div class="modal-body">
          				<div class='starrr' id='star1'></div>
					<div>
					&nbsp; <span class='your-choice-was' style='display: none;'><br><br><br>
						당신의 평점은 <span class='choice' id="comStar" name="comStar"></span>점입니다.</span><br><br>
						
<!-- 						<input type="button" id="btn" class="form-control" -->
<!-- 						onclick="StarCheck()" -->
<!-- 						value="등록" style="width: 100px; margin: 0 auto; margin-top: 50px;"> -->
<%-- 						<input type="hidden" id="memId" name="memId" value="<%=memId%>"> --%>
						
						<input type="button" id="btn" class="form-control"
						onclick="StarCheck()"
						value="등록" style="width: 100px; margin: 0 auto; margin-top: 50px;">
						<input type="hidden" id="memId" name="memId" value="<%=memId%>">
						
<!-- 						<button type="button" class="btn btn-default btn-sm" -->
<%-- 						onclick="location.href ='/EzCooQ/UpdateCommentBoard?boardNo=<%=boardVO.getBoardNo()%>&comNo=<%=comList.get(i).getComNo()%>'"> --%>
<!-- 							<span class="glyphicon glyphicon-pencil"></span> 수정 -->
<!-- 						</button> -->
						
						
					</div>
      			 	 </div>
       				 <div class="modal-footer">
         			 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
      			</div>
      
    		</div>
  		</div>
	</div>
	
	<br><br>

 	


<!-- 	댓글 등록 -->
	<div class="reply_write">
         	<div class="input-group" style="width:800px;">
         	
          		<textarea id="comContent" 
          		   name="comContent" class="form-control" placeholder="댓글을 남겨주세요." 
          		style="height:100px; margin-left:120px; width:650px; resize:none; border-color:gray;"
          		></textarea>
          		

          		<span class="input-group-btn"></span>
          		
          		<% if(memId != null) {%>
	          		<button type="button" id="update" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" 
	          		style="margin-bottom:94px; margin-right:45px;  height:100px; width:150px; background-color: white; border-color: gray; color: black;"
	          		>댓글 등록</button>
          		<% }else{%>
          			<button type="button" onclick="alert('로그인을 해주세요.')" class="btn btn-info btn-lg" 
	          		style="margin-bottom:94px; margin-right:45px;  height:100px; width:150px; background-color: white; border-color: gray; color: black;"
	          		>등록</button>
          		<%} %>
        	</div>
	</div>
	
	
<!-- 	댓글 수정 모달 -->
	<div class="container">
		<div class="modal fade" id="updateModal" role="dialog">
    		<div class="modal-dialog">
     			 <!-- Modal content-->
      			<div class="modal-content">
       				 <div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
         				 <h4 class="modal-title">평점도 남겨주세요!</h4>
        			</div>
        			<div class="modal-body">
          				<div class='starrr' id='star2'></div>
					<div>
					&nbsp; <span class='your-choice-was1' style='display: none;'><br><br><br>
						당신의 평점은 <span class='choice1' id="comStar1" name="comStar"></span>점입니다.</span><br><br>
						
						<input type="button" id="btn" class="form-control"
						 onclick="UpdateCheck()" 
						value="등록" style="width: 100px; margin: 0 auto; margin-top: 50px;">
						<input type="hidden" id="memId1" name="memId" value="<%=memId%>">
						
						
					</div>
      			 	 </div>
       				 <div class="modal-footer">
         			 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
      			</div>
      
    		</div>
  		</div>
	</div>
	
<!-- 	댓글 수정 -->
	<div class="reply_write">
         	<div class="input-group" style="width:650px;">
	
          		<textarea id="updatecomContent" 
          		   name="comContent" class="form-control" placeholder="수정할 댓글을 남겨주세요." 
          		style="height:100px; width:650px; margin-left:120px; resize:none; border-color:gray; display: none;"></textarea>

          		<span class="input-group-btn"></span>
          		<button type="button" id="update2" class="btn btn-info btn-lg" data-toggle="modal" data-target="#updateModal" 
          		style="margin-bottom:94px; margin-right:45px;   height:100px; width:150px; display:none; background-color: white; border-color: gray; color: black;"
          		>댓글 수정</button>
          	</div>
	</div>
	
	<div class="comment-view">
	<% 
			if(comList != null){
				int commentSize = comList.size();
				if(commentSize > 0){
					for(int i = 0; i<commentSize; i++){
	%>
		<div class="table-responsive" style="width: 800px;">          
			<table class="table">
			<tbody>
				<tr class="tr">
					<td></td>
					<td></td>
					<td>ID</td>
					<td>댓글 내용</td>
					<td>작성 날짜</td>
					<td>평점</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		   	 <tbody>
		     	<tr>
		        	<td><input type="hidden" class="comNo" id="comNo<%=i%>" value="<%=comList.get(i).getComNo()%>"></td>
		        	<td><input type="hidden" id="comDate<%=i%>" value="<%=comList.get(i).getComDate()%>"></td>
		        	<td><%=comList.get(i).getMemId() %></td>
		        	<td><%=comList.get(i).getComContent() %></td>
		        	<td><%=comList.get(i).getComDate() %></td>
		        	<td> 
       		<%	String star = comList.get(i).getComStar(); %>
       		<%	if("1".equals(star)){ %>
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
        	<%	}else if("2".equals(star)) {%>
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
        	<%	}else if("3".equals(star)) {%>
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
        	<%	}else if("4".equals(star)) {%>
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star-o fa" style="color:orange;"></span>				  			
        	<%	}else if("5".equals(star)) {%>
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
					<span class="fa-star fa" style="color:orange;"></span>				  			
        	<% }%>	
		        	</td>
		        	<td>
		        	
		        	<%
		        	if(memId != null){
		        		if(memId.equals(comList.get(i).getMemId()) || memId.equals("admin")){ %>
						<button type="button" class="btn btn-default btn-sm" id="updateBtn<%=i %>"
						onclick="updateComment(<%=i%>)" value="<%=comList.get(i).getComNo()%>">
							<span class="glyphicon glyphicon-pencil"></span> 수정
						</button>
					<%} %>
					</td>
		        	<td>
		        	<%if(memId.equals(comList.get(i).getMemId()) || memId.equals("admin")){ %>
						<button type="button" class="btn btn-default btn-sm"
						onclick="location.href ='/EzCooQ/DeleteCommentBoard?boardNo=<%=boardVO.getBoardNo()%>&comNo=<%=comList.get(i).getComNo()%>'">
							<span class="glyphicon glyphicon-remove"></span> 삭제
						</button>
					<%} 
						
		        	}%>
					</td>
		      	</tr>
		     </tbody>	
		    </table> <!-- table -->
				
		   </div><!-- table-responsive -->
				<% }%>
					
			<% }%>
		<% }%>
		
	<%if(memId !=null){ %>
	<div>
		<form action ="${pageContext.request.contextPath }/Report" method="post" id="reportForm">
			<input type="button" id="chkBtn" class="btn" value="글 신고" onclick ="report2()" style="width: 100px;">
			<div id="repotDiv" style="display: none;">
			<input type="text" id="reportContent" name="reportContent"placeholder="신고 사유를 작성하세요">
			<input type="button" value="신고하기" id=	"reportBtn" onclick="report()" style="width: 100px;" >
			</div>
			<input type ="hidden" id="reportHid" name="reportHid" value="<%=boardVO.getBoardNo() %>">
			<input type ="hidden" id="rportMemId" name="rportMemId" value="<%=boardVO.getMemId() %>">
		</form>
	</div>
	<%} %>
	 </div><!-- comment-view -->



<footer class="bite-footer">
	<!-- /.main-footer -->
		<div class="bottom-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span>Copyright &copy; 2020 <a href="#">EzCooQ</a>
						</span>
						<p>김선준 전진원 길영주 김성준 이선엽</p>
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.bottom-footer -->
	</footer>
	<!-- /.site-footer -->


	<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script src="${pageContext.request.contextPath }/js/jquery.easing-1.3.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath }/js/main.js"></script>


</body>
	<script>
		function updateComment(i){
			$('#comContent').hide();
			$('#update').hide();
			$('#updatecomContent').show();
			$('#update2').show();
			var a = $('#updateBtn'+i).val();
    		var comNo = $('.comNo').val(a);
		}		
		
	</script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
  	<script src="dist/starrr.js"></script>
  	<script>
  	
  	var comStar;
  	
  	
    	$('#star1').starrr({
     	 change: function(e, value){
      	  if (value) {
       	  	  $('.your-choice-was').show();
        	  $('.choice').text(value);
         	  $('.choice').val(value);
         	 comStar = $("span[class='choice']").val();
        } else {
          $('.your-choice-was').hide();
        }
      }
    });
    	
    	$('#star2').starrr({
     	 change: function(e, value){
      	  if (value) {
       	  	  $('.your-choice-was1').show();
        	  $('.choice1').text(value);
         	  $('.choice1').val(value);
         	 comStar = $("span[class='choice1']").val();
        } else {
          $('.your-choice-was1').hide();
        }
      }
    });

    	
    	
    	function StarCheck(){
    		 comStar = $('#comStar').val();
    		 comContent = $('#comContent').val();
    		 boardNo = $('#boardNo').val();
    		 memId= $('#memId').val();
					 location.reload();
    		
			 if(comContent == null){
    			 alert("댓글을 작성해주세요");
    			 return;
    		 }
    		if(comStar == null ) {
	    		alert("평점을 입력해주세요");
	    		return;
	    	} 
    		$.ajax({
				url : '/EzCooQ/InsertCommentBoard'	    		
	    		, type : 'POST'
	    		, data : 
	    		{
	    			"comStar" : comStar
	    			,"comContent" : comContent
	    			, "boardNo" : boardNo
	    			, "memId" : memId
	    		}
	    		, dataType : "json"
	    		, success : function(data) {
				}
	    		, error : function(xhr){
	    			console.log(xhr+"실패");
	    		}
	    		
	    	});
    	}
    	
    	
    	function UpdateCheck(){
    		 comStar = $('#comStar1').val();
    		 comContent = $('#updatecomContent').val();
    		 comNo = $('.comNo').val();
	    			 location.reload();
    		 if(comContent == null){
    			 alert("댓글을 작성해주세요");
    			 return;
    		 }
			
    		if(comStar == null ) {
	    		alert("평점을 입력해주세요");
	    		return;
	    	} 
    		$.ajax({
				url : '/EzCooQ/UpdateCommentBoard'	    		
	    		, type : 'POST'
	    		, data : 
	    		{
	    			 "comStar" : comStar
	    			, "comContent" : comContent
	    			, "comNo" : comNo
	    		
	    		}
	    		, dataType : "json"
	    		, success : function(data) {
				}
	    		, error : function(xhr){
	    			console.log(xhr+"실패");
	    		}
	    		
	    	});
    	}
    	
    	
//     var $s2input = $('#star2_input');
//     $('#star2').starrr({
//       max: 10,
//       rating: $s2input.val(),
//       change: function(e, value){
//         $s2input.val(value).trigger('input');
//       }
//     });
    
  </script>
  
  <script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-39205841-5', 'dobtco.github.io');
    ga('send', 'pageview');
  </script>

	

</html>