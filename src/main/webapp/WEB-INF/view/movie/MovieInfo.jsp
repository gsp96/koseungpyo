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
    let slides = document.querySelector('.slides'); 
    let slideImg = document.querySelectorAll('.slides li'); 
    currentIdx = 0; 
    slideCount = slideImg.length; 
    prev = $('.prev');
    next = $('.next');
    slideWidth = 300; 
    slideMargin = 100;
    makeClone();
    initfunction();
    function makeClone() { 
        let cloneSlide_first = slideImg[0].cloneNode(true); 
        let cloneSlide_last = slides.lastElementChild.cloneNode(true); 
        slides.append(cloneSlide_first); 
        slides.insertBefore(cloneSlide_last, slides.firstElementChild); 
    } 
    function initfunction() { 
        slides.style.width = (slideWidth + slideMargin) * (slideCount + 2) + 'px'; 
        slides.style.left = -(slideWidth + slideMargin) + 'px'; 
    } 
    next.addEventListener('click', function () { 
    
        if (currentIdx <= slideCount - 1) { 
        
            slides.style.left = -(currentIdx + 2) * (slideWidth + slideMargin) + 'px'; 
            slides.style.transition = `${0.5}s ease-out`; 
        } 
        if (currentIdx === slideCount - 1) {  
            setTimeout(function () { 
                slides.style.left = -(slideWidth + slideMargin) + 'px'; 
                slides.style.transition = `${0}s ease-out`; }, 500); 
                currentIdx = -1; 
            } currentIdx += 1; 
        }); 
        next.addEventListener('click', function () { 
            if (currentIdx <= slideCount - 1) { 
                slides.style.left = -(currentIdx + 2) * (slideWidth + slideMargin) + 'px'; 
                slides.style.transition = `${0.5}s ease-out`;
            } 
            if (currentIdx === slideCount - 1) { 
                setTimeout(function () {
                    slides.style.left = -(slideWidth + slideMargin) + 'px'; 
                    slides.style.transition = `${0}s ease-out`; 
                }, 500); currentIdx = -1; 
            } currentIdx += 1; 
            }); 
        prev.addEventListener('click', function () {
            console.log(currentIdx); 
            if (currentIdx >= 0) { 
                slides.style.left = -currentIdx * (slideWidth + slideMargin) + 'px';
                    slides.style.transition = `${0.5}s ease-out`;
                } 
                if (currentIdx === 0) { setTimeout(function () { 
                    slides.style.left = -slideCount * (slideWidth + slideMargin) + 'px';
                slides.style.transition = `${0}s ease-out`;
                }, 500);
                currentIdx = slideCount; } currentIdx -= 1; 
        });

    //Javascript
    //최초 로드 시 iframe 높이값 비율에 맞게 세팅
    var $videoIframe = document.getElementById('video');
    var responsiveHeight = $videoIframe.offsetWidth * 0.5625;
    $videoIframe.setAttribute('height', responsiveHeight);

    //브라우저 리사이즈 시 iframe 높이값 비율에 맞게 세팅
    window.addEventListener('resize', function(){
        responsiveHeight = $videoIframe.offsetWidth * 0.5625;
        $videoIframe.setAttribute('height', responsiveHeight);
    });
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

    .movie_video{
        position: relative;
        width: 100%;
        padding-bottom:56.25%;
    }

    #video {
        position: absolute;
        width: 100%;
        height: 100%;
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

    h5{
        color : rgb(255, 193, 7);
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
        <div class="row">
            <!--이미지 풀 사이즈-->
            <div class='mainposter1'>포스터 이미지</div>
        </div>
        <div class="row pt-3">
            <div class="col text-center"><a href="#"><span style="text-shadow:2px 2px 2px #000;"><h5> 평점 4.0 / 후기보기 </h5></span></a></div>
        </div>

        <div class='row'>
            <div class="bg-1">
                <div class="bgt-1 p-4">
                    <br>
                    <p>제목: 타이타닉</p>
                    <p>개봉일: 1997년 12월 19일(미국)</p>
                    <p>장르: 로맨스, 드라마</p>
                    <p>감독: 제임스 카메론</p>
                    <p>주연배우: 레오나르도 디카프리오(잭 도슨 역), 케이트 윈슬릿(로즈 드윗부카더 역)</p>
                    <p>관객수: 197만(대한민국 기준)</p>
                    <p>우연한 기회로 티켓을 구해 타이타닉호에 올라탄 자유로운 영혼을 가진 화가 잭(레오나르도 디카프리오)은 막강한 재력의 약혼자와 함께 1등실에 승선한 로즈(케이트 윈슬렛)에게 한 눈에 반한다. 진실한 사랑을 꿈꾸던 로즈 또한 생애 처음 황홀한 감정에 휩싸이고, 둘은 운명 같은 사랑에 빠지는데…</p>
                </div>
            </div>
        </div>
    </div>

    <div class='container p-5'>
        <div class='row'>
            <span style="text-shadow:2px 2px 2px #000;"><h5> 포토 </h5></span>
        </div>
        <div class='row'>
            <div class='col' style='padding:auto;'>
                <div class='preview_div'>
                </div>
                <div id='show_movie' class='carousel slide' data-ride='carousel' data-interval='4000'>
                    <div class="row">
                        <div class="col m-5">
                            <div class='carousel-inner  text-center' width='700' height='600' mazin='0 auto'>
                                <div class='carousel-item active' id='image1'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지1</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image2'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지2</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image3'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지3</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image4'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지4</a></div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image5'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지5</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image6'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지6</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image7'>
                                    <div>
                                        <div class='mx-auto border'>포스터 이미지7</div>
                                    </div>
                                </div>
                            </div>
                            <a href='#show_movie' class='left carousel-control-prev' role='button' data-slide='prev'>
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a href='#show_movie' class='right carousel-control-next' role='button' data-slide='next'>
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>            
        </div>

        <div class='row pb-3'>
            <span style="text-shadow:2px 2px 2px #000;"><h5> 예고편 </h5></span>
        </div>
        <div class='row pb-5'>
            <div class='movie_video'>
                    <iframe id='video' width='100%' height='100%' style="border:0px; min-height: 250px;" src="https://www.youtube.com/embed/xMqz1d4eKSk" title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                    </iframe>
            </div>
        </div>
    </div>
</body>
<footer class="pt-3">
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