<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>아이디 찾기</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
    <link rel='stylesheet' href='../res/font.css'/>
</head>
<script type="text/javascript">
function findid() {
	$('#confirmBtn').click(() => {
		let errCnt = 0;
		errCnt = sizeCheck('#userName','#errMsg', 15, errCnt);
		errCnt = sizeCheck('#phoneNum', '#errMsg2', 12, errCnt);
		if(errCnt == 0) {
			$.ajax({
				type:'post',
				url:'/user/findId',
				data:{
					userName: $('#userName').val(),
					phoneNum: $('#phoneNum').val()
				}
			}).done(result => {	
				if(!result) {
					$('#checkModal').modal();
				}
				else {
					location.href="/user/findIdResult";
				}
			})
		};
		
	})
}
function sizeCheck(name1, name2, size, errCnt) {
	if(($(name1).val()) && ($(name1).val().length <= size)) {
		$(name2).css('visibility','hidden');
		console.log(name1, name2, errCnt);
		return errCnt;
	}
	else {
		$(name2).css('visibility', 'visible');
		console.log(false);
		return ++errCnt;
	}
}
$(findid);
</script>
<style>
    #errmsg {
        color:red;
        visibility: hidden;
    }
    #errmsg2 {
        color:red;
        visibility: hidden;
    }
    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
</style>
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
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    추천
                  </a>
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
                    <a class="nav-link" href="../user/01.html">로그인</a>
                  </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-warning my-2 my-sm-0" type="submit"><i class='fas fa-search'></i></button>
              </form>
            </div>
          </nav>
    </header>

    <div class='container'>
        <div class='row text-center mt-5'>
            <div class='col m-5'>
                <h2><u>아이디 찾기</u></h2>
            </div>
        </div>
        <hr style='border: solid 1px black;'>
        <div class='row mt-10'>
            <div class='col'>
                <form method='post' action='#'>
                    <input type='text' id='userName' style='width: 100%;' class='textbox'placeholder='이름'/><br>
                    <span id='errmsg'>5자이하의 이름을 입력해 주세요</span>
                    <input type='number' id='phoneNum' style='width: 100%;' placeholder='휴대전화(-없이)'/>
                    <span id='errmsg2'>-없이 11자의 숫자를 입력해 주세요</span><br>                    
                </form>
            </div>
        </div>
        <div class='row'>
          <div class='col-3'>

          </div>
          <div class='col-3'>
            <button id='confirmBtn' type='button' class='btn btn-secondary'>확인</button>
          </div>
          <div class='col-3'>
            <button type='button' class='btn btn-secondary' onclick="location.href='01.html' ">취소</button>
          </div>
        </div>
    </div>
</body>
<div id='checkModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p id='modalMsg'>가입된 아이디가 없습니다.</p>
			</div>
			<div class='modal-footer'>
				<button id='registOkBtn' type='button' class='btn btn-secondary' data-dismiss='modal'>확인</button>
			</div>
		</div>
	</div>
</div>
<footer>
  <div class='row mt-5' style='float: none; margin:100 auto; text-align: center;'>
      <div class='col-md-10'>
          <p class=''>문의 : <a href="https://https://is.ezenac.co.kr/" data-toggle='tooltip'>https://is.ezenac.co.kr/</a> </p>
          <p class='text'>
              사업장주소 : 경기도 고양시 일산동구 장항동 890-4 마두법조빌딩 9F 10414 호스팅서비스사업자 : 이젠컴퓨터학원(주) 대표번호 : 031-994-8881 개발 문의 : 1577-0000 영화 문의 : 1588-1111</p>

              본 사이트에서 사용되는 이미지 중에는 등록된 개별 저작권 이미지가 포함되어 있습니다.

              개별 저작권 이미지의 경우 씨네마 네트워크(주)는 중개업자로서 저작권 소유자가 아니므로, 거래정보 및 거래 등에 사용하지 않습니다.

              본 사이트의 컨텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
          </p>
      </div>
  </div>
</footer>