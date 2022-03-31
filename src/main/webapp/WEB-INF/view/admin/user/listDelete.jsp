<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>admin.user</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
    <link rel='stylesheet' href='../../res/font.css'/>
</head>
<script>
function init() {
	$('#listUserBtn').click(() => {
		$(listUsers);
	})
	$('#delMemberBtn').click(() => {
		if(isVal($('#userNum:checked'))) {
			$('#modalMsg').text('이 유저를 삭제하시겠습니까?')
			$('#modalBtn').show()
			$('#delUserModal').modal()
		}
	})
	$('#delMemberOkBtn').click(() =>{
		$('#delUserModal').modal('hide')
		$.ajax({
			url: 'user/del/' + $('#userNum:checked').val(),
			method: 'delete'
		}).done(listUsers)
	})
}

function isVal(field) {  //parameter를 field로 넘기기
	let isGood = false
	let errMsg

	if(!field.length) errMsg = '회원을 선택하세요.' //radio에 체크가 되있는지 확인
	else {
		if(!field.val()) errMsg = field.attr('placeholder') + '를 입력하세요.'  //빈칸이 없는지 확인
		else isGood = true
	}

	if(!isGood) { //입력을 하지 않았다면 모달창에 에러 메시지 띄우기
		$('#modalMsg').text(errMsg).css('color', 'red')
		$('#modalBtn').hide()
		$('#delMemberModal').modal()
	}
	
	return isGood
}

function listUsers() {
	$('input').not(':radio').val('') //radio를 제외한 input값을 청소한다.
	$('#users').empty()

	$.ajax({
		url: '/admin/user/list'		
	}).done(users => {
		if(users.length) {
			const userArr = []
			$.each(users, (i, user) => {
				userArr.unshift(
					`<tr>
						<td><input type='radio' value='\${user.userNum}' name='userNum' id='userNum'/>
						<td>\${user.userNum}</td>
						<td>\${user.userId}</td>
						<td>\${user.userName}</td>
						<td>\${user.birthDate}</td>
						<td>\${user.regDate}</td>
						<td>\${user.email}</td>
						<td>\${user.phoneNumber}</td>
					</tr>
					`
				)
			})

			$('#users').append(userArr.join(''))
		} else $('#users').append('<tr><td colspan=4 class= text-center>회원이 없습니다.</td></tr>')
	})
}
$(init);
</script>
<style>
    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }

    #addMemberBtn,#delMemberBtn{
        background-color: rgb(255, 202, 44);
    }

    #addMemberBtn:hover,#delMemberBtn:hover{
        background-color: rgb(255, 193, 7);
    }

    .btn:hover{
        background-color: rgb(255, 193, 7);
    }
</style>
<body>
    <header id='header'>
        <div class='row-5'>
            <div class='col-3'>
                <div class='m-5 border text-center' style='height: 5rem;'><a href='../../main.html'>로고 이미지</a></div>   
            </div>
        </div>    
    </header>
    <div class='container'>
        <div class='row'>
            <div class='col-12 text-center'>
                <div class='btn-group btn-block'>
                    <button type="button" class="btn btn-secondary active" onclick="location.href='../user/01.html' ">회원</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../community/01.html' ">커뮤니티</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../movie/01.html' ">영화</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../inquiry/01.html' ">문의</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../review/01.html' ">후기</button>                    
                </div>
            </div>
        </div>


        <div class='row mt-5'>
            <div class='col'>
                <form>
                    <div class='row mb-3'>
                        <div class='col-2'>
                            <input type='text' class='form-control' name='userName' id='userName' placeholder='이름'/>
                        </div>
                        <div class='col-4'>
                            <input type='date' class='form-control' name='regDate' id='regDate' placeholder='가입일'/>
                        </div>
                        <div class='col'>
                            <nav class='d-flex'>
                                <button type='button' class='btn flex-fill border' id='listUserBtn'>
                                    <span class='label d-md-inline'>조회</span>
                                </button>
                                <button type='button' class='btn flex-fill border' id='delMemberBtn'
                                    data-toggle='modal' data-target='#delMemberModal'>
                                    <span class='label d-md-inline'>삭제</span>
                                </button>
                            </nav>
                        </div>
                    </div>
                    
                    <div class='row'>
                        <div class='col'>
                            <table class='table table-bordered' id='memberTable'>
                                <thead><tr><th></th><th>NO</th><th>ID</th><th>이름</th><th>생년월일</th><th>가입일</th><th>Email</th><th>Phone</th></tr></thead>
                                <tbody id='users'>
                                    <tr>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
<hr>
<div id='delUserModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p id='modalMsg'></p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-secondary' id='modalBtn' data-dismiss='modal'>아니오</button>
				<button type='button' class='btn btn-primary' id='delMemberOkBtn'>확인</button>
			</div>
		</div>
	</div>
</div>

<footer>
    <div class='row' style='float: none; margin:100 auto; text-align: center;'>
        <div class='col'>
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