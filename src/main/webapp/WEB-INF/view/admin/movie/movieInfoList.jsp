<head>
<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
    <title>admin.movie</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
    <link rel='stylesheet' href='../../font.css'/>
</head>
<script>
    function isVal(field) { //파라미터 필드를 넘겨준다.
   let isGood = false
   let errMsg
   
   if(!field.length) errMsg = '영화를 선택하세요.' // radio 선택 했는지 확인.
   else {
      if(!field.val()) errMsg = field.attr('placeholder') + ' 입력하세요.' // .
      else isGood = true
   }
   
   if(!isGood) { // err msg를 띄운다.
      $('#modalMsg').text(errMsg).css('color', 'red')
      $('#modalBtn').hide()
      $('#modal').modal()
   }
   
   return isGood
}

function listLaborers() {
   $('input').not(':radio').val('')
   $('#movies').empty()
   
   $.ajax({
      url: 'movie/list'
   }).done(movies => {
      if(movies.length) { 
            const laborerArr = []
   
            $.each(movies, (i, movie) => {
               laborerArr.unshift( 
                  `<tr>
                     <td><input value='\${movie.movieNum}' type='radio' 
                                 name='movieNum' id='movieNum'/>
                     <td>\${movie.movieNum}</td>
                     <td>\${movie.title}</td>
                     <td>\${movie.directorName}</td>
                     <td>\${movie.genre}</td>
                  </tr>`
               )   
            })
   
            $('#movies').append(movieArr.join(''))
         } else $('#movies').append(
               '<tr><td colspan=5 class=text-center>노동자가 없습니다.</td></tr>')
   })
}

function init() {
   // 영화 추가
   

     
   $('#delLaborerBtn').click(() => {
      if(isVal($('#laborerId:checked'))) {
         $('#modalMsg').text('노동자를 삭제하시겠습니까?')
         $('#modalBtn').show()
         $('#modal').modal()
      }
   })

   $('#delLaborerOkBtn').click(() => {
      $('#modal').modal('hide')
      $.ajax({
         url: 'laborer/del/' + $('#laborerId:checked').val(),
         method: 'delete'
      }).done(listLaborers)
   })
   
   $('#laborers').on({
      change() {
         $('#laborerName').val($(this).parent().next().next().text())
         $('#hireDate').val($(this).parent().parent().next().next().text())
      }
   }, '#laborerId')
}

$(init)
</script>
<style>
    .btn:hover{
        background-color: rgb(255, 193, 7);
    }

    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }

    #searchMovieBtn,#fixMovieBtn,#delMovieBtn,#addMovieBtn{
        background-color: rgb(255, 202, 44);
    }

    #addBoardBtn:hover,#searchMovieBtn:hover,#fixMovieBtn:hover,#delMovieBtn:hover,#addMovieBtn:hover{
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
                    <button type="button" class="btn btn-secondary" onclick="location.href='../admin/user' ">회원</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='community/01.html' ">커뮤니티</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../admin/movieInfoList' ">영화</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='inquiry/01.html' ">문의</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='review/01.html' ">후기</button>
                </div>
            </div>
        </div>


        <div class='row mt-5'>
            <div class='col'>
                <form>
                    <div class='row mb-3'>
                        <div class='col'>
                            <input type='text' class='form-control' name='boardTitle' id='boardTitle' placeholder='영화 제목'/>
                        </div>
                        <div class='col'>
                            <nav class='d-flex'>
                                <button type='button' class='btn flex-fill border' id='searchMovieBtn'>
                                    <span class='label  d-md-inline'>조회</span>
                                </button>
                                <button type='button' class='btn flex-fill border' id='fixMovieBtn'>
                                    <span class='label  d-md-inline'>수정</span>
                                </button>
                                <button type='button' class='btn flex-fill border' id='delMovieBtn'
                                    data-toggle='modal' data-target='#delMovieModal'>
                                    <span class='label d-md-inline'>삭제</span>
                                </button>
                                <button type='button' class='btn flex-fill border'id='addMovieBtn' onclick="location.href='../admin/movieInfo' ">
                                    <span class='label  d-md-inline'>추가</span>
                                </button>
                            </nav>
                        </div>
                    </div>
                    
                    <div class='row'>
                        <div class='col'>
                            <table class='table table-bordered' id='BoardTable'>
                                <thead><tr><th></th><th>NO</th><th>제목</th><th>감독</th><th>장르</th></tr></thead>
                                <tbody>
                                    <tr><td colspan='5' class='text-center'>등록된 영화가 없습니다</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

<div id='delMovieModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p>영화를 삭제하시겠습니까?</p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-secondary' data-dismiss='modal'>아니오</button>
				<button type='button' class='btn btn-primary' data-dismiss='modal' id='delMovieOkBtn'>예</button>
			</div>
		</div>
	</div>
</div>
<hr>
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