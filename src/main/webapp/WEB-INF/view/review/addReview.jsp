<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
    <title>REVIEW</title>
    <meta charset='utf-8'>
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
<script>
function checkLogin() {
	var ssuserId = "<%=(String)session.getAttribute("userId")%>"
	var ssuserNum = "<%=(Number)session.getAttribute("userNum")%>"

	if(( ssuserId == "admin") && (ssuserId.length > 0)) {
        $('.admin').prepend('<li class="nav-item"><a href="admin">관리자 페이지</a></li>')
        $('.admin').toggle()
		$('.mypage').toggle()
	} 
	console.log(ssuserId)
	console.log(ssuserNum)
    if(( ssuserId != "null") && (ssuserId.length > 0)) {
	 	$('.login').toggle()
	 	$('.logout').prepend('<li class="nav-item"><a href="cinemanetwork" >로그아웃</a></li>')
        $('.mypage').prepend('<li class="nav-item"><a href="user/07.html" >마이페이지</a></li>')
	 	$('.logout').toggle()
        $('.mypage').toggle()
	 }
	$('.logout').click(() => {
		$.ajax({
			url: 'user/logout'
		})
	})
}

$(() => {
	checkLogin()
})

function count(type) {
  const resultElement = document.getElementById('grade');
  let number = resultElement.innerText;
  if(type === 'plus') {
    number = parseInt(number) + 1;
  } else if(type === 'minus') {
    number = parseInt(number) - 1;
  }
  resultElement.innerText = number;
}

function init() {
	let title = $('#title').val();
	let content = $('#content').val();
	let grade = $('#grade').val();
	let movieNum = $('#movieNum').val();
	
	$('#addBtn').click(() => {
		if($('#title').val()) {
			$.ajax({
				url: '${pageContext.request.contextPath}/review/addReview',
				type: 'post',
				data: {
					title: $('#title').val(),
					content: $('#content').val(),
					grade: $('#grade').val(),
					movieNum: $('#movieNum').val()
				}
			}).done(reviews => {
				$('#modalMsg').text('글이 등록되었습니다.');
				$('#cofirmModal').modal();
				$('#noBtn').hide();
				$('#yesBtn').hide();
				$('#okBtn').show();
				$('#okBtn').click(() => {
					location.href='./listReview'
				})	
			})
		} else {
			$('#modalMsg').text('리뷰를 입력해 주세요.');
			$('#cofirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		}
	})
	

	
	$('#cancelBtn').click(() => {
		$('#modalMsg').text('취소 하시겠습니까?');
		$('#cofirmModal').modal();
		$('#completeOkBtn').hide();
		$('#noBtn').show();
		$('#yesBtn').show();
		$('#okBtn').hide();
		$('#yesBtn').click(() => {
			location.href='./listReview'
		})	
	})
}  

$(init)
</script>
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
    #slideShow {
        width: 500px; 
        height: 300px; 
        position: relative; 
        margin: 50px auto; 
        overflow: hidden; 
    } 
    .slides {
        position: absolute; 
        left: 0; 
        top: 0; 
        width: 2500px; 
        transition: 0.5s ease-out; 
    } 
    .slides li:first-child {
         margin-left: 100px; 
        } 
    .slides li:not(:last-child) { 
        float: left; margin-right: 100px; 
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
    .controller span:hover { 
        background-color: rgba(128, 128, 128, 0.11); 
    } 
    #img_slide_prev { 
        left: 10px; 
    } 
    #img_slide_prev:hover { 
        transform: translateX(-10px); 
    } 
    #img_slide_next { 
        right: 10px; 
    } 
    #img_slide_next:hover { 
        transform: translateX(10px); 
    }
    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
    h6{
        color : rgb(255, 193, 7);
    }
</style>
<body>
    <header id='header'>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class='p-4 border'><a href='main.html'>로고 이미지</a></div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="movie/01.html">영화</a>
                </li>
                <li class="nav-item dropdown active">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    추천
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="recommendation/01.html">장르별</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="recommendation/01.html">평점별</a>                    
                  </div>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="community/01.html">커뮤니티</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="inquiry/01.html">고객센터</a>
                  </li>
                  
                <li class="nav-item active">
                    <a class="nav-link" href="../review/listReview">리뷰보기</a>
                </li>
                
                <li class="nav-item active">
                    <a class="nav-link login" href="../user/loginView">로그인</a>
                  </li>
                
                <li class="nav-item active">
                    <a class="nav-link admin" href="admin/main.html" style='display:none'></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link logout" href="main.html" style='display:none'></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link mypage" href="user/07.html" style='display:none'></a>
                </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-warning my-2 my-sm-0" type="submit"><i class='fas fa-search'></i></button>
              </form>
            </div>
          </nav>
    </header>

    	<!-- 리뷰글 작성 폼 시작 -->
		<div class="container">
			<div class="row mt-5">
        		<form method="post" style="width: 100%">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #dddddd; text-align: center;">리뷰 작성</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="title" id="title" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="content" id="content" maxlength="1024" style="width: 100%; height: 300px;"></textarea></td>
							</tr>

						</tbody>
					</table>
					<div class="row">
						<input class='invisible' style='width: 3%'/>
						<span class="h5">평점 : </span>
						<div class="col-0" id="grade">0</div>
						<div class="col-0" id="movieNum">4</div>
						<div class="col">
							<button type='button' onclick='count("plus")' value='+' style='width: 5%; border-style: none;'><i class="fa-solid fa-circle-plus"></i></i></button>
							<input class='invisible' style='width: 1%'/>
              				<button type='button' onclick='count("minus")' value='-' style='width: 5%; border-style: none;'><i class="fa-solid fa-circle-minus"></i></i></button>
						</div>
            			<input class='invisible' style='width: 20%'/>
  						<button id='addBtn' style='width: 15%; background: rgb(250, 227, 1);'>
							<span class='d-md-inline'>확인</span>
						</button>
						<input class='invisible' style='width: 1%'/>
						<button id='cancelBtn' style="width: 15%; background: rgb(250, 227, 1);">
							<span class='d-md-inline'>취소</span>
						</button>
						<input class='invisible' style='width: 3%'/>
					</div>
        		</form>
			</div>
		</div>
</body>

<div id='cofirmModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h5 id='modalTitle'>리뷰모달</h5>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p id='modalMsg'></p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-outline-secondary' data-dismiss='modal' id='yesBtn'>예</button>
				<button type='button' class='btn btn-secondary' data-dismiss='modal' id='noBtn'>아니오</button>
				<button type='button' class='btn btn-outline-secondary' data-dismiss='modal' id='okBtn'>확인</button>
			</div>
		</div>
	</div>
</div> 

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