<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>XM02-小组交通视频分析平台</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css" />
    <link rel="stylesheet" type="text/css" href="./css/common.css">
    <link rel="stylesheet" href="http://www.5imoban.net/download/swiper/swiper-4.4.2.min.css" />
    <link rel="stylesheet" type="text/css" href="./css/animate.min.css">
    <style>
        strong{
            font-size: 20px;
        }
    </style>
</head>

<body>
<div class="index-header clearfix">
    <div class="index- fl">
        <a href=""></a>
    </div>
    <ul class="index-nav fl">
        <li><a href="index.jsp">首页</a></li>
        <li><a id="service1_link">车辆信息管理</a></li>

        <li><a id="service2_link">视频分析管理</a></li>

        <li><a id="service3_link">统计分析管理</a></li>

        <li><a id="service4_link">违章信息管理</a></li>

        <li><a id="service5_link">代办事项管理</a></li>


    </ul>
    <div class="index-header-right fr">
        <a href="" class="search-btn">搜索</a>
    </div>
    <div class="clear"></div>
</div>

<div class="search_sec">
    <a href="#" title="" class="close-search"><i class=" la-close"><img src="./images/icon5.png"></i></a>
    <div class="search_field">
        <div class="container">
            <form>
                <input type="text" name="search" placeholder="Search for...">
                <button type="submit"><img src="./images/search2.png" alt=""></button>
            </form>
        </div>
    </div>
</div>
<!--search_sec end-->

<div id="bloc">
    <article id="index">
        <div class="banner-position">
            <div class="index-banner swiper-container">
                <div class="swiper-wrapper">
                        <video  autoplay="autoplay" controls="controls" loop="loop" src="./images/2.mp4"/>
                </div>
                <!-- Add Navigation -->
                <div class="swiper-button-prev swiper-button-white"></div>
                <div class="swiper-button-next swiper-button-white"></div>
            </div>
            <div class="banner-wave">
                <svg viewBox="0 0 120 28">

                    <defs>

                        <filter id="goo">

                            <feGaussianBlur in="SourceGraphic" stdDeviation="1" result="blur" />

                            <feColorMatrix in="blur" mode="matrix" values="

            				   1 0 0 0 0

							   0 1 0 0 0

							   0 0 1 0 0

							   0 0 0 13 -9" result="goo" />

                            <xfeBlend in="SourceGraphic" in2="goo" />

                        </filter>

                        <path id="wave" d="M 0,10 C 30,10 30,15 60,15 90,15 90,10 120,10 150,10 150,15 180,15 210,15 210,10 240,10 v 28 h -240 z" />

                    </defs>

                    <use id="wave3" class="wave" xlink:href="#wave" x="0" y="-2"></use>

                    <use id="wave2" class="wave" xlink:href="#wave" x="0" y="0"></use>

                    <g class="gooeff" filter="url(#goo)">

                        <circle class="drop drop1" cx="20" cy="2" r="8.8" />

                        <circle class="drop drop2" cx="25" cy="2.5" r="7.5" />

                        <circle class="drop drop3" cx="16" cy="2.8" r="9.2" />

                        <circle class="drop drop4" cx="18" cy="2" r="8.8" />

                        <circle class="drop drop5" cx="22" cy="2.5" r="7.5" />

                        <circle class="drop drop6" cx="26" cy="2.8" r="9.2" />

                        <circle class="drop drop1" cx="5" cy="4.4" r="8.8" />

                        <circle class="drop drop2" cx="5" cy="4.1" r="7.5" />

                        <circle class="drop drop3" cx="8" cy="3.8" r="9.2" />

                        <circle class="drop drop4" cx="3" cy="4.4" r="8.8" />

                        <circle class="drop drop5" cx="7" cy="4.1" r="7.5" />

                        <circle class="drop drop6" cx="10" cy="4.3" r="9.2" />

                        <circle class="drop drop1" cx="1.2" cy="5.4" r="8.8" />

                        <circle class="drop drop2" cx="5.2" cy="5.1" r="7.5" />

                        <circle class="drop drop3" cx="10.2" cy="5.3" r="9.2" />

                        <circle class="drop drop4" cx="3.2" cy="5.4" r="8.8" />

                        <circle class="drop drop5" cx="14.2" cy="5.1" r="7.5" />

                        <circle class="drop drop6" cx="17.2" cy="4.8" r="9.2" />

                        <use id="wave1" class="wave" xlink:href="#wave" x="0" y="1" />

                    </g>
                </svg>
            </div>
        </div>
        <div class="clear"></div>


        <!--1.车辆管理开始-->
        <div class="index-about">
            <div class="index-con clearfix">
                <div class="index-about-text fl">
                    <div class="index-title">
                        <h3 class="scroll-animate" data-effect="fadeInUpSmall" id="service1">SERVICE 1</h3>
                        <h2 class="scroll-animate" data-delay="0.2" data-effect="fadeInUpSmall">信息管理</h2>
                        <span></span>
                    </div>
                    <p  class="scroll-animate" data-delay="0.6" data-effect="fadeInUpSmall"><strong>XM02小组智能交通视频分析平台立足于智慧交通领域，以OpenCV技术为核心，全国交通需求为导向，率先在智慧交通领域布局并取得重大突破。<br />
                        该平台可提供交管部门查询车辆信息的功能，提供增加、删除、修改、查询、统计、导出、打印、排序等功能</strong>
                    </p>
                    <div class="index-more">
                        <a href="../datatable/index.jsp">信息管理</a>
                    </div>
                </div>
                <div class="index-about-pic fr">
                    <a href="" >
                        <img src="./images/pic2.jpg" class="scroll-animate classGo" data-Tclass="go">
                    </a>
                </div>
            </div>
            <div class="wave_box1">
                <img src="./images/wavs.gif">
            </div>
        </div>
        <div class="position-yuan clearfix">
            <div class="bg scr-el" data-v="1" data-speed-x="12" data-offset="150 "></div>
        </div>
        <div class="clear"></div>

        <!--2.视频分析开始-->
        <div class="index-yewu">
            <div class="index-con clearfix">
                <div class="index-title">
                    <h3 id="service2">SERVICE 2</h3>
                    <h2>视频分析</h2>
                </div>

                <div class="index-yewu-info clearfix">
                    <div class="index-yewu-pic fl">
                        <a href="" >
                            <img src="./images/pic3.jpg" class="scroll-animate classGo" data-Tclass="go">
                        </a>
                    </div>
                    <ul class="index-yewu-list clearfix fr">
                        <li>
                            <a href="">
                                <em><img src="./images/ico1.png"></em>
                                <div class="text">
                                    <h2>违规停放检测</h2>
                                    <span>Parking Violation</span>
                                    <p>当车辆在违规停放区域超过15分钟会被视为违停。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico2.png"></em>
                                <div class="text">
                                    <h2>闯红灯检测</h2>
                                    <span>red lights</span>
                                    <p>车辆在红灯亮起时，若后轮压线则被判定为闯红灯。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico3.png"></em>
                                <div class="text">
                                    <h2>压双黄线检测</h2>
                                    <span>Double yellow line</span>
                                    <p>若车辆无视双黄线，直接压线变道或者掉头，则被判定为压双黄线。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico4.png"></em>
                                <div class="text">
                                    <h2>逆行检测</h2>
                                    <span>Retrograde</span>
                                    <p>若车辆不按规定方向行驶，则被判定为逆行。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico5.png"></em>
                                <div class="text">
                                    <h2>车牌号识别</h2>
                                    <span>plate recognition</span>
                                    <p>该平台能够对各种品质交通视频中的车牌号进行精准识别。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico6.png"></em>
                                <div class="text">
                                    <h2>速度识别</h2>
                                    <span>Speed recognition</span>
                                    <p>该平台能够对视频中出现的车辆进行精准的速度识别。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                    </ul>

                    <div class="wave_box1">
                        <img src="./images/wavs.gif">
                    </div>

                </div>
                <div class="index-more">
                    <a href="../videoWeb/html/index.jsp">视频分析</a>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="position-yuan clearfix">
            <div class="bg scr-el" data-v="1" data-speed-x="12" data-offset="150 "></div>
        </div>
        <div class="clear"></div>

        <!--3.统计分析管理-->
        <div class="index-yewu">
            <div class="index-con clearfix">
                <div class="index-title">
                    <h3 id="service3">SERVICE 3</h3>
                    <h2>统计分析</h2>
                </div>

                <div class="index-yewu-info clearfix">
                    <div class="index-yewu-pic fl">
                        <a href="" >
                            <img src="./images/研开.png" class="scroll-animate classGo" data-Tclass="go">
                        </a>
                    </div>
                    <ul class="index-yewu-list clearfix fr">
                        <li>
                            <a href="">
                                <em><img src="./images/ico1.png"></em>
                                <div class="text">
                                    <h2>车流量分析</h2>
                                    <span>Traffic volume</span>
                                    <p>该平台使用折线图展示每天24小时车流量统计图。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico2.png"></em>
                                <div class="text">
                                    <h2>违章数量分析</h2>
                                    <span>violations</span>
                                    <p>该平台展示每个路口的违章数量及类型统计。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico3.png"></em>
                                <div class="text">
                                    <h2>路口断流分析</h2>
                                    <span>cut off</span>
                                    <p>该平台展示路口五分钟断流和十分钟断流情况，供交警分析。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico4.png"></em>
                                <div class="text">
                                    <h2>磁盘空闲分析</h2>
                                    <span>Disk</span>
                                    <p>该平台展示图片存放磁盘的空闲分区，供技术人员参考。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico5.png"></em>
                                <div class="text">
                                    <h2>卡口记录分析</h2>
                                    <span>Bayonet record</span>
                                    <p>该平台循环滚动所有卡口最后捕获到的十条违章记录。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <em><img src="./images/ico6.png"></em>
                                <div class="text">
                                    <h2>天气展示</h2>
                                    <span>Weather</span>
                                    <p>该平台开放天气查看功能，以便了解天气情况，方便出行。</p>
                                </div>
                                <div class="button bz-buttonAnimat clockwise both">
                                    <div class="inner"></div>
                                </div>
                            </a>
                        </li>
                    </ul>

                    <div class="wave_box1">
                        <img src="./images/wavs.gif">
                    </div>

                </div>
                <div class="index-more">
                    <a href="../Statistics/index.jsp">统计分析</a>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="clear"></div>

        <!--4.违章信息管理开始-->
        <div class="index-about">
            <div class="index-con clearfix">
                <div class="index-about-text fl">
                    <div class="index-title">
                        <h3 class="scroll-animate" data-effect="fadeInUpSmall" id="service4">SERVICE 4</h3>
                        <h2 class="scroll-animate" data-delay="0.2" data-effect="fadeInUpSmall">违章管理</h2>
                        <span></span>
                    </div>
                    <p  class="scroll-animate" data-delay="0.6" data-effect="fadeInUpSmall">
                        <strong>XM02小组致力于同交管部门合作，为其提供违章管理功能<br/>
                        交警可执行违章记录查询，处理等功能。</strong>
                    </p>
                    <div class="index-more">
                        <a href="../TwoTable/index.html">违章管理</a>
                    </div>
                </div>
                <div class="index-about-pic fr">
                    <a href="" >
                        <img src="./images/研开2.png" class="scroll-animate classGo" data-Tclass="go">
                    </a>
                </div>
            </div>
            <div class="wave_box1">
                <img src="./images/wavs.gif">
            </div>
        </div>
        <div class="clear"></div>

        <!--5.代办事项-->
        <div class="index-product clearfix">
            <div class="index-con clearfix">
                <div class="index-title">
                    <h3 id="service5">SERVICE 5</h3>
                    <h2>待办事项</h2>
                </div>
                <ul class="clearfix index-product-list clearfix">
                    <li>
                        <a href="">
                            <em><img src="./images/pic4.jpg"></em>
                            <div class="text">
                                <h2>日常办公</h2>
                                <p>Routine work</p>
                                <span><img src="./images/jt.png"></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <em><img src="./images/pic5.jpg"></em>
                            <div class="text">
                                <h2>消息推送</h2>
                                <p>Message push</p>
                                <span><img src="./images/jt.png"></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <em><img src="./images/pic6.jpg"></em>
                            <div class="text">
                                <h2>通知公告</h2>
                                <p>Notice</p>
                                <span><img src="./images/jt.png"></span>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="index-more">
                    <a href="../todo-list/index.jsp">代办事项</a>
                </div>
            </div>
        </div>
        <div class="clear"></div>

        <!--6.footer-->
        <div class="index-footer">
            <div class="clearfix index-footer-info index-con">
                <div class=" fl">

                </div>
                <div class="lianxi fl">
                    <h2>联系方式</h2>
                    <p>负责人电话： 19981459097 </p>
                    <p>技术人员电话：15756486126</p>
                    <P>地址：四川省成都市双流区四川大学</P>
                </div>
                <div class="phone fl">
                    19981459097
                </div>
                <div class="erweima fr">
                    <img src="./images/1.png">
                    <p>负责人二维码</p>
                </div>
            </div>

            <div class="index-footer-bottom">
                <div class="index-con clearfix">
                    <p class="fl">版权所有 © 2021 辛卫研究与开发实践XM02小组 小组成员：彭睿、邱玥、包泓辉、董勉岐</p>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </article>
</div>

<script type="text/javascript" src="http://www.5imoban.net/download/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src='./js/modernizr.custom.js'></script>
<script src="./js/more.js"></script>
<script src="http://www.5imoban.net/download/swiper/swiper-4.4.2.min.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
<script type='text/javascript' src='./js/base.js'></script>
<script type="text/javascript" src='./js/app.js'></script>
<script>
    var swiper = new Swiper('.index-banner.swiper-container', {
        speed: 600,
        parallax: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
    scrolly.init({
        wrapper: '#bloc',
        targets: '.scr-el',
        bgParallax: true,
        wrapperSpeed: 0.08
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#service1_link").click(function() {
            $("html, body").animate({
                scrollTop: $("#service1").offset().top }, {duration: 500,easing: "swing"});
            return false;
        });
        $("#service2_link").click(function() {
            $("html, body").animate({
                scrollTop: $("#service2").offset().top }, {duration: 500,easing: "swing"});
            return false;
        });
        $("#service3_link").click(function() {
            $("html, body").animate({
                scrollTop: $("#service3").offset().top }, {duration: 500,easing: "swing"});
            return false;
        });
        $("#service4_link").click(function() {
            $("html, body").animate({
                scrollTop: $("#service4").offset().top }, {duration: 500,easing: "swing"});
            return false;
        });
        $("#service5_link").click(function() {
            $("html, body").animate({
                scrollTop: $("#service5").offset().top }, {duration: 500,easing: "swing"});
            return false;
        });
    });
</script>

</body>
</html>
