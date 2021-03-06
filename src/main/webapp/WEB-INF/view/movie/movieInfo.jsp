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
    //?????? ?????? ??? iframe ????????? ????????? ?????? ??????
    var $videoIframe = document.getElementById('video');
    var responsiveHeight = $videoIframe.offsetWidth * 0.5625;
    $videoIframe.setAttribute('height', responsiveHeight);

    //???????????? ???????????? ??? iframe ????????? ????????? ?????? ??????
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
    <a class='border' href='#header'>????????????</a>
</div>
<body>
    <header id='header'>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class='p-4 border'><a href='main.html'>?????? ?????????</a></div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                      <a class="nav-link" href="../movie/01.html">?????? <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ??????
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../recommendation/01.html">?????????</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../recommendation/02.html">?????????</a>
                        
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../board/01.html">?????????</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../inquiry/01.html">????????????</a>
                      </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../user/01.html">?????????</a>
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
            <!--????????? ??? ?????????-->
            <div class='mainposter1'>????????? ?????????</div>
        </div>
        <div class="row pt-3">
            <div class="col text-center"><a href="#"><span style="text-shadow:2px 2px 2px #000;"><h5> ?????? 4.0 / ???????????? </h5></span></a></div>
        </div>

        <div class='row'>
            <div class="bg-1">
                <div class="bgt-1 p-4">
                    <br>
                    <p>??????: ????????????</p>
                    <p>?????????: 1997??? 12??? 19???(??????)</p>
                    <p>??????: ?????????, ?????????</p>
                    <p>??????: ????????? ?????????</p>
                    <p>????????????: ??????????????? ???????????????(??? ?????? ???), ????????? ?????????(?????? ??????????????? ???)</p>
                    <p>?????????: 197???(???????????? ??????)</p>
                    <p>????????? ????????? ????????? ?????? ?????????????????? ????????? ???????????? ????????? ?????? ?????? ???(??????????????? ???????????????)??? ????????? ????????? ???????????? ?????? 1????????? ????????? ??????(????????? ?????????)?????? ??? ?????? ?????????. ????????? ????????? ????????? ?????? ?????? ?????? ?????? ????????? ????????? ????????????, ?????? ?????? ?????? ????????? ???????????????</p>
                </div>
            </div>
        </div>
    </div>

    <div class='container p-5'>
        <div class='row'>
            <span style="text-shadow:2px 2px 2px #000;"><h5> ?????? </h5></span>
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
                                        <div class='mx-auto border'>????????? ?????????1</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image2'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????2</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image3'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????3</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image4'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????4</a></div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image5'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????5</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image6'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????6</div>
                                    </div>
                                </div>
                                <div class='carousel-item' id='image7'>
                                    <div>
                                        <div class='mx-auto border'>????????? ?????????7</div>
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
            <span style="text-shadow:2px 2px 2px #000;"><h5> ????????? </h5></span>
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
            <p class=''>?????? : <a href="https://https://is.ezenac.co.kr/" data-toggle='tooltip'>https://is.ezenac.co.kr/</a> </p>
            <div class='col text-center'>
                <span>??????????????? : ????????? ????????? ???????????? ????????? 890-4 ?????????????????? 9F 10414</span><br>
                <span>??????????????????????????? : ?????????????????????(???) ???????????? : 031-994-8881 ?????? ?????? : 1577-0000 ?????? ?????? : 1588-1111</span><br>
                <span>??? ??????????????? ???????????? ????????? ????????? ????????? ?????? ????????? ???????????? ???????????? ????????????.</span><br>
                <span>?????? ????????? ???????????? ?????? ????????? ????????????(???)??? ?????????????????? ????????? ???????????? ????????????, ???????????? ??? ?????? ?????? ???????????? ????????????.</span><br>
                <span>??? ???????????? ???????????? ??????????????? ????????? ?????? ??? ?????? ??????, ??????, ?????? ?????? ????????????.</span>
            </div>
        </div>
    </div>
</footer>