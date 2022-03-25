<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <title>REVIEW</title>
    <meta name='viewport' charset='utf-8'>
    <link rel="shortcut icon" href="icon.png">
    <link rel="apple-touch-icon" href="icon.ico">
    <link rel="icon" type="image/png" sizes="128x128" href="/android-icon-192x192.png">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v6.0.0/css/all.css'/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
</head>
<style>
    @font-face {
    font-family: 'S-CoreDream-6Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    body {
        font-family: 'S-CoreDream-6Bold';
    }
    li { 
        list-style-type: none; 
	  }
    .controller span { 
        position: absolute; 
        background-color: transparent; 
        color: black; text-align: center; 
        border-radius: 50%; 
        padding: 10px 20px; 
        top: 50%; font-size: 1.3em; 
        cursor: pointer; 
    } 
    .navbar {
        display : flex;
        flex-flow : row nowrap;
        justify-content : space-around;
        background-color: rgba(26, 26, 26, 0.8);
    }
    .dropdown-menu {
        background-color: rgba(26, 26, 26, 0.8);
    }
    .navbar li a:hover{
        color: rgb(255, 193, 7);
    }
    .navbar li a, .navbar .navbar-brand{
    color: #fff;
    }
    footer {
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
</style>

<script>

function listReviews() {
	$('#reviews').empty();
	
	$.ajax({
		type:'post',
		url:"<%=request.getContextPath() %>/review/listReview"
	}).done(reviews => {
		if(reviews.length) {
			const reviewArr = []
			//			console.log(reviews)
			$.each(reviews, (i, review) => {
				reviewArr.unshift(
					`<tr>
						<td>\${review.reviewNum}</td>
						<td><a href='/review/selectReview?title=\${review.title}'> \${review.title}</td>
						<td>\${review.userName}</td>
						<td>\${review.writedDate}</td>
					</tr>`
				);
			})
			$('#reviews').append(reviewArr.join(''))
		} else {
			$('#reviews').append('<tr><td colspan=5 class=text-center>리뷰가 없습니다.</td></tr>')
		}
	}) 
}
$(listReviews)

function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="selectReview?nowPage=${paging.nowPage}&cntPerPage="+sel;
}
</script>

<body>
    <header id='header'>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class='p-4 border'><a href='../main.html'>로고 이미지</a></div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="../movie/01.html">영화 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">추천</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../recommendation/01.html">장르별</a>
                        <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="../recommendation/02.html">평점별</a>
                        </div>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="../community/01.html">커뮤니티</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="../inquiry/01.html">고객센터</a>
                   </li>
                   <li class="nav-item">
                      <a class="nav-link" href="../main.html">로그아웃</a>
                   </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit"><i class='fas fa-search'></i></button>
                </form>
            </div>
        </nav>
    </header>
    
	<!-- 리뷰 메인 페이지 -->
	<div class="container">
		<div class="row mt-5">
			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"  <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div> 
			<!-- 옵션선택 끝 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #dddddd; text-align: center;">번호</th>
						<th style="background-color: #dddddd; text-align: center;">제목</th>
						<th style="background-color: #dddddd; text-align: center;">작성자</th>
						<th style="background-color: #dddddd; text-align: center;">작성일</th>
					</tr>
				</thead>
		
				<tbody class='text-center' id='reviews'>
      		    </tbody>
			</table>

			<form class='form-inline' style="width: 100%">
				<button type='button' class='' id='reviewBoardMove' style="width: 15%; background: rgb(250, 227, 1);" onclick="location.href='../' ">
					<i class="fa-solid fa-arrow-rotate-left"></i>
					<span class='d-none d-md-inline'>돌아가기</span>
				</button>
				<button type='button' class='' id='' style="border:none; width: 10%">
					<i class="fa-solid fa-angles-left"></i>
				</button>
				<button type='button' class='' id='reviewOn' style="border:none; width: 50%">
					<span class=''> 1 </span>
				</button>
				<button type='button' class='' id=''  style="border:none; width: 10%">
					<i class="fa-solid fa-angles-right"></i>
				</button> 
				<button type='button' id='' class='' style='width: 15%; background: rgb(250, 227, 1);' onclick="location.href='../review/addReview' ">
					<i class='fas fa-plus'></i>
					<span class='d-none d-md-inline'>작성</span>
				</button>
			</form>
		</div>
	</div>
</body>

<footer>
    <div class='container text-center'>
        <div class='row-md-10 mt-5'>
            <p class=''>문의 : <a href="https://https://is.ezenac.co.kr/" data-toggle='tooltip'>https://is.ezenac.co.kr/</a> </p>
            <div class='col text-center'>
                <span>사업장주소 : 경기도 고양시 일산동구 장항동 890-4 마두법조빌딩 9F 10414</span><br>
                <span>호스팅서비스사업자 : 이젠컴퓨터학원(주) 대표번호 : 031-994-8881 개발 문의 : 1577-0000 영화 문의 : 1588-1111</span><br>
                <span>본 사이트에서 사용되는 이미지 중에는 등록된 개별 저작권 이미지가 포함되어 있습니다.</span><br>
                <span>개별 저작권 이미지의 경우 씨네마 네트워크(주)는 중개업자로서 저작권 소유자가 아니므로, 거래정보 및 거래 등에 사용하지 않습니다.</span><br>
                <span>본 사이트의 컨텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.</span>
            </div>
        </div>
    </div>
  </footer>