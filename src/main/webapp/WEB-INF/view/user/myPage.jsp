<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>마이 페이지</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
    <link rel='stylesheet' href='../res/font.css'/>
</head>
<script>
	var ssuserNum = "<%=(Number)session.getAttribute("userNum")%>"
	function init () {
		$.ajax({
			url:'/user/loadUser',
			data:{ userNum: ssuserNum
			}
		}).done(user => {
			console.log(user);
			$('#userId').val(user.userId);
			$('#userName').val(user.userName);
			$('#email').val(user.email);
			$('#phoneNum').val(user.phoneNumber);
			$('#birthDate').val(user.birthDate);
		})
	$('#registBtn').click(() => {
			$.ajax({
				url: '/user/myPage',
				method:'post',
				data: {
					userNum: ssuserNum,
					userId: $('#userId').val(),
					pw: $('#pw').val(),
					userName: $('#userName').val(),
					birthDate: $('#birthDate').val(),
					email: $('#email').val(),
					phoneNum: $('#phoneNum').val(),
				}
			}).done((result) => {
			})
	})
	$('#modalOkBtn').click(() => {
		location.href='/cinemanetwork';
	})
	}
$(init);
</script>
<style>
    @font-face {
    font-family: 'S-CoreDream-6Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    .max {
        width: 100%;
    }
    .middle {
        width: 90%;
    }
    #submit {
        width: 40%;
        margin: auto;
        display:block;
    }
    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
</style>

<body>
    <div class='container'>
        <div class='row mt-4'>
            <div class='col text-center' style="background: rgb(92, 89, 89);">
                <a href='../main.html' class="border"><a href='../main.html'>로고 이미지</a></a>
                <h1 class="mt-4"><u>마이 페이지</u></h1>
            </div>
        </div>
        <div class="row mt-4" >
            <div class="col m-3">
                <form method='post' action='#'>
                    <table class='table table-sm mt-4' id='user.02.table'>
                        <tbody>
                            <tr><th style='background-color:rgb(184, 179, 179);'>아이디</th><td><input class='textbox max' id='userId' type='text'/></td></tr>
                            <tr><th style='background-color:rgb(184, 179, 179);'>비밀번호</th><td><input class='textbox max' id='pw' type='password'/></td></tr>
                            <tr><th style='background-color:rgb(184, 179, 179);'>이름</th><td><input class='textbox max' id='userName'type='text'/></td></tr>
                            <tr><th style='background-color:rgb(184, 179, 179);'>전화번호</th><td><input class='textbox max' id='phoneNum' type='number'/></td></tr>
                            <tr><th style='background-color:rgb(184, 179, 179);'>이메일</th><td><input class='textbox max' id='email' type='text'/></td></tr>
                            <tr><th style='background-color:rgb(184, 179, 179);'>생년월일</th><td><input class='date max' id='birthDate' type='date'/></td></tr>
                        </tbody>
                    </table>
                    <button id='registBtn' type='button' class='btn-secondary' data-toggle='modal' data-target='#registModal'>저장하기</button>
                    <!--버튼에 type을지정하지 않으면 submit으로서 사용된다.-->
                </form>
            </div>
        </div>
    </div>
</body>

<div id='registModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p>회원정보 수정이 완료되었습니다.</p>
			</div>
			<div class='modal-footer'>
				<button  id='modalOkBtn'type='button' class='btn btn-secondary' data-dismiss='modal' >확인</button>
			</div>
		</div>
	</div>
</div>
<footer>
    <div class='row text-center'>
        <div class='col-md-10'>
            <p class=''>문의 : <a href="https://https://is.ezenac.co.kr/" data-toggle='tooltip'>https://is.ezenac.co.kr/</a> </p>
            <p class=''>
                사업장주소 : 경기도 고양시 일산동구 장항동 890-4 마두법조빌딩 9F 10414 호스팅서비스사업자 : 이젠컴퓨터학원(주) 대표번호 : 031-994-8881 개발 문의 : 1577-0000 영화 문의 : 1588-1111</p>

                본 사이트에서 사용되는 이미지 중에는 등록된 개별 저작권 이미지가 포함되어 있습니다.

                개별 저작권 이미지의 경우 씨네마 네트워크(주)는 중개업자로서 저작권 소유자가 아니므로, 거래정보 및 거래 등에 사용하지 않습니다.

                본 사이트의 컨텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
            </p>
        </div>
    </div>
</footer>