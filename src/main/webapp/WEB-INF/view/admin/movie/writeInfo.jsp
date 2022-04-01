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

function isVal(field) {
	let img = $('#posterFile')
	let isGood = false
	let errMsg

	$('#errMsg').text('')

	
	if(field.val() == img.val() && !img.val()) {
		errMsg = '포스터를 추가해 주세요.'
	} else if(!field.val()) {
		errMsg = field.attr('placeholder') + ' 입력하세요.'
	} else {
		 isGood = true
	}

	if(!isGood) {
		$('#errMsg').text(errMsg)
	}

	return isGood
}

$(() =>  {
	$('#registBtn').click(() => {
		if(isVal($('#title')) && isVal($('#openingDate')) && 
				isVal($('#genre')) && isVal($('#directorName')) && isVal($('#mainActorName')) &&
				isVal($('#audienceNum')) &&  isVal($('#topic')))
				{		
					$('form').submit()
				}
	})
})

</script>
<style>
    #errmsg, #errmsg2, #errmsg3 {
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
                <form class='form' method='post' action='/admin/add' enctype='multipart/form-data'>
                    <div class='form-group mt-1'>
                        <label for='#title'>제목</label><input type='text' id='title' name='title'class='text-area form-control' placeholder='제목' required/>
                        <!-- <span id='errmsg'>제목을 입력해야 합니다.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#openingDate'>개봉일</label>
                        <input type='date' id='openingDate' name='openingDate' class='form-control'placeholder='개봉일'  required/>
                        <!-- <span id='errmsg2'>개봉일을 입력해야 합니다.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#genre'>장르</label>
                        <input type='text' id='genre' name='genre' class='form-control textbox'placeholder='장르' required/>
                        <!-- <span id='errmsg3'>장르를 입력해야 합니다.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#directorName'>감독</label>
                        <input type='text' id='directorName' name='directorName' class='form-control textbox'placeholder='감독' required/>
                        <!-- <span id='errmsg3'>감독을 입력해야 합니다.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#mainActorName'>주연</label>
                        <input type='text' id='mainActorName' name='mainActorName' class='form-control textbox' placeholder='주연'/>
                    </div>
                    <div class='form-group mt-1'>
                    <label for="#posterFile">영화 포스터</label>
                    <input type="file" id="posterFile" name='posterFile' accept='image/*'>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#audienceNum'>관객수</label>
                        <input id='audienceNum' name='audienceNum' type='number' class='form-control' placeholder='관객수' />
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#topic'>주제</label><input id='topic' name='topic' type='text' class='form-control textbox' placeholder='주제'/>
                    </div> 
                    
                    <div class='row justify-content-right mt-3'>
                        <div class='col-4 form'>
                            <button id='registBtn' type='button' class='btn btn-secondary btn-block'>등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>