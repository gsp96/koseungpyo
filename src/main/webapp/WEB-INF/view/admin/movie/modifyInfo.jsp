<head>
<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
    <title>movie modify regist</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
    <link rel='stylesheet' href='../../font.css'/>
</head>
<<script>
	var ssmovieNum = "<%=(Number)session.getAttribute("movieNum")%>"
	function init() {
		console.log(ssmovieNum);
		$.ajax({
			url:'/admin/loadMovie',
			data:{ movieNum: ssmovieNum
			}
		}).done(movie => {
			console.log(movie);
			$('#title').val(movie.title);
			$('#openingDate').val(movie.openingDate);
			$('#genre').val(movie.genre);
			$('#directorName').val(movie.directorName);
			$('#mainActorName').val(movie.mainActorName);
			$('#posterFileName').val(movie.posterFileName);
			$('#audienceNum').val(movie.audienceNum);
			$('#topic').val(movie.topic);
		})
		
		$('#registBtn').click(() => {
				$.ajax({
					url: '/admin/movieModifyInfo',
					method:'post',
					data: {
						movieNum: ssmovieNum,
						title: $('#title').val(),
						openingDate: $('#openingDate').val(),
						genre: $('#genre').val(),
						directorName: $('#directorName').val(),
						mainActorName: $('#mainActorName').val(),
						posterFileName: $('#posterFileName').val(),
						audienceNum: $('#audienceNum').val(),
						topic: $('#topic').val(),
					}
				}).done((result) => {
				})
		})
		$('#modalOkBtn').click(() => {
		location.href='/admin/movieInfoList';
		})
	}
	
$(init);
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
                <div class='m-5 border text-center' style='height: 5rem;'><a href='../../main.html'>?????? ?????????</a></div>   
            </div>
        </div>    
    </header>
    <hr>
    <div class='container'>
        <div class='row'>
            <div class='col'>
                <form class='form' method='post' action='/admin/modify' enctype='multipart/form-data'>
                    <div class='form-group mt-1'>
                        <label for='#title'>??????</label><input type='text' id='title' name='title'class='text-area form-control' placeholder='??????' required/>
                        <!-- <span id='errmsg'>????????? ???????????? ?????????.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#openingDate'>?????????</label>
                        <input type='date' id='openingDate' name='openingDate' class='form-control'placeholder='?????????'  required/>
                        <!-- <span id='errmsg2'>???????????? ???????????? ?????????.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#genre'>??????</label>
                        <input type='text' id='genre' name='genre' class='form-control textbox'placeholder='??????' required/>
                        <!-- <span id='errmsg3'>????????? ???????????? ?????????.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#directorName'>??????</label>
                        <input type='text' id='directorName' name='directorName' class='form-control textbox'placeholder='??????' required/>
                        <!-- <span id='errmsg3'>????????? ???????????? ?????????.</span> -->
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#mainActorName'>??????</label>
                        <input type='text' id='mainActorName' name='mainActorName' class='form-control textbox' placeholder='??????'/>
                    </div>
                    <div class='form-group mt-1'>
                    <label for="#posterFile">?????? ?????????</label>
                    <input type="file" id="posterFile" name='posterFile' accept='image/*'>
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#audienceNum'>?????????</label>
                        <input id='audienceNum' name='audienceNum' type='number' class='form-control' placeholder='?????????' />
                    </div>
                    <div class='form-group mt-1'>
                        <label for='#topic'>??????</label><input id='topic' name='topic' type='text' class='form-control textbox' placeholder='??????'/>
                    </div> 
                    
                    <div class='row justify-content-right mt-3'>
                        <div class='col-4 form'>
                            <button id='registBtn' type='button' class='btn btn-secondary btn-block'>??????</button>
                        </div>
                    </div>
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
				<p>?????? ????????? ?????????????????????.</p>
			</div>
			<div class='modal-footer'>
				<button  id='modalOkBtn'type='button' class='btn btn-secondary' data-dismiss='modal' >??????</button>
			</div>
		</div>
	</div>
</div>