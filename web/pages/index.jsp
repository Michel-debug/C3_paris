<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/pages/common/head.jsp"%>
    <style>
        span {
            color: red;
            font-size: 1rem;
        }
        .bottom-div{
            position: relative;
            margin-left: 1rem;
            height: 40px;
            vertical-align: bottom;
        }
        #code_txt{
            vertical-align: bottom;
            color: red;
            font-size: 0.8rem;
        }
        @keyframes blinker {
            50% { opacity: 0; }
        }

        .blink {
            animation: blinker 3s linear infinite;
        }

    </style>
    <script type="text/javascript">
        $(function () {

                if (document.querySelector("#feedback span")) {
                    var element = document.getElementById("feedback");
                    if (element) {
                        element.scrollIntoView();
                    }
                }

            var codeImg = document.getElementById("code_img");
            $('#code_txt').click(function (event) {
                codeImg.src ="${basePath}/kaptcha.jpg?d="+new Date();
            })

            $('#sub_btn').click(function () {
                let name = $('#name').val();

                if (name == null || name ==''){
                    $("span#nmsg").text("( name isn't null! )");
                    return false;
                }
                $("span#nmsg").text("");
                let emailText = $('#email').val();
                let emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                //3 使用test方法验证是否合法
                if (!emailPatt.test(emailText)) {
                    //4 提示用户
                    $("span#emsg").text(" ( email format error )");
                    return false;
                }
                $("span#emsg").text("");
                let phone = $('#phone').val();
                let phonePatt = /^\+(\d{1,4})\s?(\d{6,14})$/;
                if (!phonePatt.test(phone)){
                    $("span#pmsg").text(" ( Tel format error! )")
                    return false;
                }
                $("span#pmsg").text("");

            let codeText = $('#code').val();
            codeText  = $.trim(codeText);
                if (codeText == null || codeText == "") {
                    //4 提示用户
                    $("span#vmsg").text("( The code couldn't be vide！)");

                    return false;
                }
                // 去掉错误信息
                $("span#vmsg").text("");


            })

        })
    </script>
    <title>RED INTER</title>
</head>
<body>
<header id="home" class="main-header">
    <div class="navbar">
        <h1 class="brand">
            <img src="static/img/index/logo.png">
            RED Inter
        </h1>
        <nav>
            <ul>
                <li><a href="#home">ACCUEIL</a></li>
                <li><a href="#atouts">ATOUTS</a></li>
                <li><a href="#service">SERVICE</a></li>
                <li><a href="#service">NOUS</a></li>
                <li><a href="#service">NEWS</a></li>
                <li><a href="#references">REFERENCES</a></li>
                <li><a href="#contact">CONTACT</a></li>
            </ul>
        </nav>
    </div>

    <div class="content" onload="writeAuto()">
        <h1 id="demo" style="font-weight:bold;"></h1>
        <!--<b>E-commerce transfrontalier</b>-->
        <p>L'équipe franco-chinoise au service clé en main de votre développement en Chine.</p>
        <a href="index.php" class="btn">
            <i class="fas fa-chevron-right" aria-hidden="true"></i>
            <b>READ MORE</b>
        </a>
    </div>
</header>

<main>
    <section>
        <div class="carousel">
            <div class="slide" >
                <img src="static/img/index/30.jpg">
            </div>
            <div class="slide">
                <img src="static/img/index/fillmed-egerie.jpg">
            </div>

            <!-- Add as many slides as you want. -->
        </div>
    </section>

    <!-- about -->
    <div id="references">
        <section class="about flex-columns">
            <div class="row">
                <div class="column">
                    <div class="column-1">
                        <img src="static/img/index/original.jpg" alt="">
                    </div>
                </div>
                <div class="column">
                    <div class="column-2 bg-secondary">
                        <h3>法国有机美妆</h3>
                        <p>这里有更多的美妆产品 这里添加一些介绍内容</p>
                        <!--跳转页面 更多详情-->
                        <button class="btn btn-outline">Read More</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- about -->
        <section class="about flex-columns flex-reverse">
            <div class="row">
                <div class="column">
                    <div class="column-1">
                        <img src="static/img/index/luxe_1.jpg" alt="">
                    </div>
                </div>
                <div class="column">
                    <div class="column-2 bg-lightblue">
                        <h3>法国小众轻奢</h3>
                        <!--测试段-->
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto consequatur, eaque earum eligendi expedita facere illum impedit, iusto laudantium nesciunt optio pariatur possimus provident quam soluta veniam voluptatibus! Explicabo, illo.</p>
                        <button class="btn btn-outline">Read More</button>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <section class="teams section-padding bg-light isolde-default">


        <div id="flex-img" class="Cards">
            <div data-isolde-el>
                <div class="grid-item">
                    <img class="card__picture "src="static/img/Consultation/statistique.jpg" alt="rapport">
                    <div class="card_infos">
                        <h2 class="card__title">中法跨境报告</h2>
                        <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
                    </div>
                </div>
            </div>
            <div data-isolde-el><div class="grid-item">
                <img class="card__picture" src="static/img/index/Find-food.jpg" alt="sea food">
                <h2 class="card__title">法国有机海鲜</h2>
                <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
            </div></div>
            <div data-isolde-el> <div class="grid-item">
                <img src="static/img/index/fillmed-egerie.jpg" alt="maquillage">
                <h2 class="card__title">法国有机海鲜</h2>
                <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
            </div></div>
            <div data-isolde-el>  <div class="grid-item">
                <img src="static/img/Consultation/statistique.jpg" alt="rapport">
                <h2 class="card__title">法国有机海鲜</h2>
                <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
            </div></div>
            <div data-isolde-el><div class="grid-item">
                <img src="static/img/index/Find-food.jpg" alt="sea food">
                <h2 class="card__title">法国有机海鲜</h2>
                <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
            </div></div>
            <div data-isolde-el>   <div class="grid-item">
                <img src="static/img/index/fillmed-egerie.jpg" alt="maquillage">
                <h2 class="card__title">法国大牌美妆</h2>
                <p class="card__text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores aut, cumque et eveniet excepturi illum ipsum, laudantium, nemo odio officiis placeat quae quia reiciendis totam ut vel velit vitae voluptatibus.</p>
            </div></div>


        </div>
    </section>


    <!-- 留着自己测试
    <section id="gallery" class="gallery flex-grid section-padding">
        <header class="section-header">
            <h2>Lorem, ipsum.</h2>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ratione, incidunt.</p>
        </header>
        <div class="row">
            <div class="column">
                <img src="/static/img/index/luxe.jpg" alt="">
                <img src="/static/img/index/Find-food.jpg" alt="">
            </div>
            <div class="column">
                    <img src="/images/3.jpeg" alt="">
                <img src="/images/4.jpeg" alt="">
            </div>
            <div class="column">
                <img src="/images/1.jpeg" alt="">
                <img src="/images/2.jpeg" alt="">
            </div>
            <div class="column">
                <img src="/images/3.jpeg" alt="">
                <img src="/images/4.jpeg" alt="">
            </div>
        </div>
    </section>
    -->

    <!-- atouts -->
    <section id="atouts" class="icons bg-light">
        <header class="section-header">
            <h2><b>ATOUTS | 核心竞争力</b></h2>
        </header>
        <div id="atout-item" class="flex-items">
            <div>
                <i class="fa-solid fa-people-group"></i>
                <div>
                    <h4>中法专业团队</h4>
                    <p>
                        无语言与文化障碍<br>
                        无时差 反应迅速
                    </p>
                </div>
            </div>
            <div>
                <i class="fa-solid fa-chalkboard-user"></i>
                <div>
                    <h4>法中跨境专家</h4>
                    <p>
                        编撰百份战略报告 <br>
                        引入数十知名品牌
                    </p>
                </div>
            </div>
            <div>
                <i class="fa-solid fa-newspaper"></i>
                <div>
                    <h4>量身定制方案</h4>
                    <p>
                        从咨询到供应代理 <br>
                        点餐模式 无忧方案
                    </p>
                </div>
            </div>
            <div>
                <i class="fa-solid fa-font-awesome"></i>
                <div>
                    <h4>靠谱合作伙伴</h4>
                    <p>
                        诚信诚实 责任担当 <br>
                        欧盟标准 法国合同
                    </p>
                </div>
            </div>
            <div>
                <i class="fa-solid fa-euro-sign"></i>
                <div>
                    <h4>法国强大人脉</h4>
                    <p>
                        扎根法国 耕耘品牌<br>
                        与决策层多年合作
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section style="background-color: #f5f5f5">
        <header class="section-header">
            <h2><b>Lorem, ipsum.</b></h2>
            <p><b>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, provident?</b></p>
        </header>
    </section>

    <!-- rooms -->
    <section class="icons bg-basecolor">
        <div id="service" class="flex-item-service">
            <div class="card">
                <div class="card-body bg-basecolor" style="text-align: left">
                    <h3><b>Service | 服务</b></h3>
                    <ul class="card-list">
                        <li><i class="fa-solid fa-comments"></i><a href="#"> 战 略 咨 询 </a></li>
                        <li><i class="fa-solid fa-computer"></i><a href="#"> 电 商 代 运 营 </a></li>
                        <li><i class="fa-solid fa-phone"></i><a href="#"> 自 营 采 销 </a></li>
                        <li><i class="fa-solid fa-car"></i><a href="#"> 品 牌 经 纪 </a></li>
                        <li><i class="fa-solid fa-table"></i><a href="#"> 招 商 引 牌 </a></li>
                        <li><i class="fa-solid fa-graduation-cap"></i><a href="#"> 专 业 培 训 </a></li>
                    </ul>
                </div>
            </div>

            <div class="card">
                <div class="card-middle bg-basecolor">
                    <h3><b>Nous | 我们</b></h3>
                    <div id="card-video">
                        <span class="video-label">Video</span>
                        <div>
                            <video preload="auto">
                                <source src="#" type="video/mp4">
                                Your browser does not support the video tag
                            </video>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body bg-basecolor">
                    <h3><b>News | 动态</b></h3>
                    <br>
                    <div class="news-item">
                        <img src="static/img/maquillage2/image1.png" alt="">
                        <p>News 1 description...</p>
                    </div>
                    <div class="news-item">
                        <img src="static/img/maquillage2/image2.png" alt="">
                        <p>News 2 description...</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--后期使用servlet实现-->

    <!-- contact -->
    <section id="contact" class="contact flex-columns">
        <div class="row">
            <div class="column">
                <div class="column-1">
                    <img src="static/img/serveur/service.jpg" alt="service">
                </div>
            </div>
            <div class="column">
                <div class="column-2 bg-light">
                    <h2>Contact Us</h2>
                    <form action="${basePath}contactServlet" method="post" class="contact-form">
                        <input name="action" type="hidden" value="contactService">
                        <div class="form-control">
                            <label for="name">Name  <span id="nmsg"> </span></label>

                            <input type="text" id="name" name="name" placeholder="Enter your name" value="${requestScope.name}">
                        </div>
                        <div class="form-control">
                            <label for="name">Email <span id="emsg"></span></label>

                            <input type="email" id="email" name="email" placeholder="Enter your email" value="${requestScope.email}">
                        </div>
                        <div class="form-control">
                            <label for="name">Phone <span id="pmsg"></span></label>

                            <input type="text" id="phone" name="phone" placeholder="Enter your phone exg:+33 1234567890" value="${requestScope.phone}">
                        </div>

                        <div class="form-control">
                            <label for="name">Comment</label>
                            <textarea id="commentInput" name="comment" placeholder="Enter your comment" value="${requestScope.comment}"></textarea>
                        </div>

                        <label for="name">Verification code  <span id="vmsg"></span></label>

                        <div class="form-control" id="V_code">
                            <input type="text" name="code" style="width:120px" id="code">
                            <img id="code_img" alt="" src="${basePath}/kaptcha.jpg" style="width:120px; height:40px; margin-left: 1.5rem">
                            <div class="bottom-div">
                                <a href="javascript:void(0)"  id="code_txt" >( Is not clear ? click me )</a>
                            </div>
                        </div>


                        <button type="submit" class="btn btn-primary" id="sub_btn"><b>Submit</b></button>
                        <a id="feedback">
                            <% if(request.getAttribute("message") != null) { %>
                            <span style="font-size: large" class="blink">
                                <%= request.getAttribute("message") %>
                            </span>
                        <% } %>
                        </a>
                    </form>

                </div>
            </div>
        </div>
    </section>
</main>

<%@include file="/pages/common/foot.jsp"%>
</body>
</html>