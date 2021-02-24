<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%
		BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
	%>
<%
	HttpSession httpSession = request.getSession(true);
%>
<%
	String memId = (String) httpSession.getAttribute("memId");
%>
<%
	String memPass = (String) httpSession.getAttribute("memPass");
%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<!-- 
Kool Store Template
http://www.templatemo.com/preview/templatemo_428_kool_store
-->
<meta charset="utf-8">
<title>EzCooQ</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"
	rel="stylesheet">
<!-- JavaScript JS -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-misc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/templatemo-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/Slide.css">


<script src="${pageContext.request.contextPath }/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath }/js/Slide.js"></script>

<script src="${pageContext.request.contextPath }/js/mainPage.js"></script>
<!-- <script scr="../js/board.js"></script> -->
<script type="text/javascript">
	
</script>
<style type="text/css">
div.awesomeRating {
	font-size: 4em;
	padding: 1em 0em;
	text-align: center;
}

div.awesomeRatingValue {
	font-size: 2em;
	padding: 1em 0em;
	text-align: center;
}

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

table {
	width: 100%;
}

#inputTd {
	width: 100%;
}

input {
	width: 100%;
}
.site-footer{
	position: relative;
}
</style>


</head>
<body>
		<header class="site-header">
	<script type="text/javascript">
function cart() {
	$("#cartForm1").submit();
}
function BuyPage() {
	$("#cartForm2").submit();
}

</script>
      <div class="top-header">
         <div class="container">
            <div class="row align-right">
            <button type="button" class="btn btn-warning" onclick="chating()">1:1채팅</button>
            <%if(memId != null){%>
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
               <div class="col-xs-4 col-sm-6 col-xs-8">
                  <div class="logo">
                     <h1>
                        <a href="/EzCooQ/html/mainPage.jsp">EzCooQ</a>
                     </h1>
                  </div>
                  <!-- /.logo -->
               </div>
               <!-- /.col-xs-4 -->
               <div class="col-xs-8 col-sm-6 col-xs-4"></div>
               <!-- /.col-xs-8 -->
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
                              <a href="<%=request.getContextPath()%>/officalBoardServlet">공식 레시피</a>
                           </li>
                           <li>
                              <a href="<%=request.getContextPath()%>/ViewBoardAll">유저 레시피</a>
                            </li>
                           <li>
                              <a href="<%=request.getContextPath()%>/SelectPayBoardServlet">유료 레시피</a>
                            </li>
                     <%if(memId!=null){ %>
                           <li>
                              <a href="#" onclick="BuyPage()">구매 레시피</a>
                            </li>
                     <%} %>       
                        </ul>
                     <li><a href="<%=request.getContextPath()%>/html/product-detail.jsp">미니게임</a></li>
                     <li><a href="<%=request.getContextPath()%>/noticeMain">공지사항</a></li>
                     <li><a href="<%=request.getContextPath()%>/qnaMain">Q&A</a></li>
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
   </header>

	<form action="${pageContext.request.contextPath}/UpdateBoard" method="post">
		<div class="content-section">
			<div class="container">
				<!-- /.row -->
				<div class="row">
					<table>
						<caption>
							<div class="col-md-12 section-title">
								<h2>
									<strong> 레시피 수정</strong>
								</h2>
							</div>
						</caption>
						<tr>
							<td>
								<input type="hidden" name="boardNo" value="<%=boardVO.getBoardNo()%>">
							</td>
						</tr>
						<tr>
							<td>제목 :</td>
							<td><input type="text" class="form-control" id="inputTd"
								name="boardTitle" value="<%=boardVO.getBoardTitle()%>"></td>
								</td>
							<td><input type="button" class="form-control"
								onclick="location.href='<%=request.getContextPath()%>/ViewBoardAll'"
								value="돌아가기"></td>
						</tr>
						<tr>
							<td>작성자 :</td>
							<td colspan="2">
							<input type="text" value="<%=memId%>"
								class="form-control" id="inputTd" name="memId"
								readonly="readonly">
								</td>

						</tr>
						<tr>
							<td>분류 :</td>
							<td colspan="2"><select class="form-control" id="inputTd"
								name="foodId" value="<%=boardVO.getFoodId()%>">
									<option>선택</option>
									<option>한식</option>
									<option>중식</option>
									<option>일식</option>
									<option>양식</option>
									<option>분식</option>
									<option>후식</option>
							</select></td>

						</tr>
						<tr>
						<td>
							첨부파일
						</td>
							<td colspan="2">
        						<input type="hidden" id="hiddenA1" name ="imgSrc"> 
								<input type="file" name="uploadFile" id="uploadFile" multiple>
       							 <div id="preview">
       							 </div>
							</td>
						</tr>
						<tr>
							<td>카테고리 :</td>
							<td colspan="2"><input type="text" name="recipeId"
								id="inputTd" value="유저 레시피" readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>내용 :</td>
							<td colspan="2"><textarea rows="50" cols="12"
									class="form-control" id="inputTd" name="boardContent" value="<%=boardVO.getBoardContent()%>"></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" class="form-control" value="등록">
<!-- 								<input type="hidden" name="action" value="userRecipe"> -->
								</td>
							<td></td>
						</tr>
					</table>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<br>
	</form>




	<footer class="bite-footer">
		<div class="our-partner">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="customNavigation">
							<a class="btn prev"><i class="fa fa-angle-left"></i></a> <a
								class="btn next"><i class="fa fa-angle-right"></i></a>
						</div>
						<div id="owl-demo" class="owl-carousel">
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
							</div>
							<div class="item">
								<a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
							</div>
						</div>
						<!-- /#owl-demo -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.our-partner -->

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
			</div>
			<!-- /.container -->
		</div>
		<!-- /.bottom-footer -->
	</footer>
	<!-- /.site-footer -->


	<script src="js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script src="js/jquery.easing-1.3.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>


</body>
<script type="text/javascript">
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=300 height=300 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
            
            var srcRead = e.target.result;
            
        	$("#hiddenA1").val(srcRead);
        	
          
           
            
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=300 height=300 />';
          $(str).appendTo('#preview');
        }
        
        
      });//arr.forEach
    }
    
  });
  
  function a() {
	  alert($("#hiddenA1").val());	
} 
</script>
</html>