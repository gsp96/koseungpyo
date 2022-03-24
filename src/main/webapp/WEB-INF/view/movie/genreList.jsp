<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <title>movie</title>
        <meta charset='utf-8'>
        <link rel="shortcut icon" href="icon.png">
        <link rel="apple-touch-icon" href="icon.ico">
        <link rel="icon" type="image/png" sizes="128x128" href="/android-icon-192x192.png">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
        <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
        <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
</head>
<script language="javascript">
    $(document).ready(function () {
        setDateBox();
    });

    // select box 연도 , 월 표시
    function setDateBox() {
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();

        // 발행 뿌려주기
        $("#year").append("<option value=''>년도</option>");

        // 올해 기준으로 -50년부터 +1년을 보여준다.
        for (var y = (com_year - 50); y <= (com_year + 1); y++) {
        $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
        }

        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#month").append("<option value=''>월</option>");
        for (var i = 1; i <= 12; i++) {
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
        }

        // 일 뿌려주기(1일부터 31일)
        var day;
        $("#day").append("<option value=''>일</option>");
        for (var i = 1; i <= 31; i++) {
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
        }
    }
    <!--
    function listMovies() {
    	   $('input').val('')
    	   $('#movies').empty()
    	   
    	   $.ajax({
    	      url: 'movie/list'
    	   }).done(movies => {
    	      if(movies.length) {
    	            const movieArr = []
    	   
    	            $.each(movies, (i, movie) => {
    	            	movieArr.unshift( 
    	                  `<tr>
    	                     <td>\${movie.posterFileName}</td>
    	                     <td>\${movie.name}</td>
    	                  </tr>`
    	               )   
    	            })
    	   
    	            $('#movies').append(movieArr.join(''))
    	         } else $('#movies').append(
    	               '<tr><td colspan=4 class=text-center>영화가 없습니다.</td></tr>')
    	   })
    	} 
    -->
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

    .mainposter1{
        margin:auto;
        padding : 3em;
        width : 50%;
        border : 1px solid rgb(245, 245, 245);
        text-align : center;
    }

    .bg-1{
        background-color: rgb(245, 245, 245);
    }

    h6{
        color : #096191;
    }

    footer{
        background-color: rgb(225, 225, 225);
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
</style>
<div style='position:fixed; bottom:20px;right:10px;'>
    <a class='border' href='#header'>위로가기</a>
</div>
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
                      <a class="nav-link" href="../board/01.html">게시판</a>
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
        <div class='row mt-5'>
            <div class='col-12'>
                <ul class="nav nav-tabs nav-fill" id='nav2'>
                    <li class="nav-item">
                    <a class="nav-link" href="../recommendation/03.html"><span><h6>오늘의 추천</h6></span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="../movie/genreList"><span><h6>영화</h6></span></a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="../board/01.html"><span><h6>게시판</h6></span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class='container p-3'>
        <div class='row'>
            <div class='col-12 text-center'>
                <div class='btn-group btn-block'>
                    <button type="button" class="btn btn-secondary active" onclick="location.href='../movie/movieList' ">장르</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../movie/02.html' ">연도별</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='../movie/03.html' ">관객수별</button>
                </div>
            </div>
        </div>

        <div class="row mr-auto">
            <div class="col-md-4 mt-5" style="float: none; margin:0 auto;">
                <form method="post">    
                    <div class="form-group">
                        <label for="genres">장르</label>
                        <select class="form-control selectpicker" id="genre">
                            <option value="">전체</option>
                            <option value="">액션</option>
                            <option value="">로맨스</option>
                            <option value="">가족</option>
                            <option value="">드라마</option>
                            <option value="">코미디</option>
                            <option value="">SF</option>
                            <option value="">호러</option>
                            <option value="">판타지</option>
                        </select>
                    </div>    
                    <button class="btn btn-secondary" type="submit">영화 조회</button>
                </form>
            </div>
        </div>
    </div>

        <div class='row text-center'>
            <div class='col m-2'>
                <section id="1">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지1</a></div>
                </section>
            </div>
            <div class='col m-2'>
                <section id="2">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지2</a></div>
                </section>
            </div>
        </div>
        <div class='row text-center'>
            <div class='col m-2'>
                <section id="3">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지3</a></div>
                </section>
            </div>
            <div class='col m-2'>
                <section id="4">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지4</a></div>
                </section>
            </div>
        </div>
        <div class='row text-center'>
            <div class='col m-2'>
                <section id="5">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지5</a></div>
                </section>
            </div>
            <div class='col m-2'>
                <section id="6">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지6</a></div>
                </section>
            </div>
        </div>
        <div class='row text-center'>
            <div class='col m-2'>
                <section id="7">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지7</a></div>
                </section>
            </div>
            <div class='col m-2'>
                <section id="8">
                    <div class='mx-auto border'><a href='../movie/04.html'>포스터 이미지8</a></div>
                </section>
            </div>
        </div>
</body>
<footer>
    <div class='container text-center'>
        <div class='row-md-10'>
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