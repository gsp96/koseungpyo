<head>
<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
    <title>movie regist</title>
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
$('#submit').click(() => {
	let errCnt = 0;
	errCnt = sizeCheck('#userId', '#errmsg', 10, errCnt)
	errCnt = sizeCheck('#userPw', '#errmsg2', 10, errCnt)
	errCnt = sizeCheck('#userName', '#errmsg3', 15, errCnt)
	errCnt = sizeCheck('#phoneNum', '#errmsg4', 11, errCnt)
	errCnt = sizeCheck('#email', '#errmsg5',  40, errCnt)
	if(errCnt == 0) {
		$('#registModal').modal();
	}
});

function isval() {
	$('#registBtn').click(() => {
		$.ajax({
			type:'put',
			url:'/movie/movieRegist',
			data:{
				title: $('#title').val(),
				openingDate: $('#openingDate').val(),
				genre: $('#genre').val(),
				directorName: $('#directorName').val(),
				mainActorName: $('#mainActorName').val(),
				posterFileName: $('#posterFileName').val(),
				audienceNum: $('#audienceNum').val(),
				topic: $('#topic').val()
			}
		})
		$('form').submit()
	});
}

$(init);
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

    #errmsg3 {
        color:red;
        visibility: hidden;
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
    <hr>
    <div class='container'>
        <div class='row'>
            <div class='col'>
                <form class='form' method='post'>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>제목</label><input type='text' id='movieTitle'class='text-area form-control' required/>
                        <span id='errmsg'>제목을 입력해야 합니다.</span>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>개봉일</label><input type='date' class='form-control' required/>
                        <span id='errmsg2'>개봉일을 입력해야 합니다.</span>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>장르</label><input type='text' class='form-control textbox' required/>
                        <span id='errmsg3'>장르를 입력해야 합니다.</span>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>감독</label><input type='text' class='form-control textbox' required/>
                        <span id='errmsg3'>감독을 입력해야 합니다.</span>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>주연</label><input type='text' class='form-control textbox'/>
                    </div>
                    <div class='form-group mt-1'>
                    <label for="moviePoster">영화 포스터</label>
                    <input type="file" id="moviePoster" name='moviePoster' accept='image/png, image/jpeg'>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>관객수</label><input type='number' class='form-control'/>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#movieTitle'>주제</label><input type='text' class='form-control textbox'/>
                    </div> 
                    
                    <div class='row justify-content-right mt-3'>
                        <div class='col-4'>
                            <button id='registBtn' type='submit' class='btn btn-secondary btn-block'>등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>