<%--
  Created by IntelliJ IDEA.
  User: 12550
  Date: 2021/11/20
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>服务支持 - 炫酷的科技公司静态html模板 - xxx</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css" />
    <link rel="stylesheet" type="text/css" href="./css/common.css">
    <link rel="stylesheet" type="text/css" href="./css/animate.min.css">
</head>

<body>
<div class="index-header clearfix">
    <div class="index- fl">
        <a href=""></a>
    </div>
    <ul class="index-nav fl">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="about.jsp">关于我们</a></li>
        <li><a href="business.jsp">业务范围</a></li>
        <li><a href="products.jsp">产品中心</a></li>
        <li><a href="cases.jsp">应用案例</a></li>
        <li><a href="news.jsp">新闻资讯</a></li>
        <li><a href="jobs.jsp">人才招聘</a></li>
        <li><a href="service.jsp">服务支持</a></li>
        <li><a href="contact.jsp">联系我们</a></li>
    </ul>
    <div class="index-header-right fr">
        <a href="" class="search-btn">搜索</a>
        <a href="" class="erweima">
            <div class="erweima-pic">
                <img src="./images/pic1.jpg">
            </div>
        </a>
    </div>
    <div class="clear"></div>
</div>

<div class="search_sec">
    <a href="#" title="" class="close-search"><i class=" la-close"><img src="./images/icon5.png"></i></a>
    <div class="search_field">
        <div class="container">
            <form>
                <input type="text" name="search" placeholder="Search for...">
                <button type="submit"><img src="./images/search2.png"></button>
            </form>
        </div>
    </div>
</div>
<!--search_sec end-->

<div id="wrap">
    <section id="top clearfix">
        <div class="page-banner pic scroll-animate animated fadeInDownSmall" data-effect="fadeInDownSmall" >
            <img src="./images/page-banner.jpg">
        </div>
        <div class="clear"></div>
        <div class="msg">
            <h1 class="f-50 mb-12">服务支持</h1>
            <div id="down-more">
                <i class="wc"><img src="./images/jt2.png"></i><br>
                <a class="">Scroll More</a>
            </div>
        </div>
        <section class="sub-menu clearfix">
            <div class="index-con">
                <div class="fl sub-menu-left">
                    <em><img src="./images/tu48.png"></em>
                    <a href="">our news</a>
                    <em><img src="./images/tu10.jpg"></em>
                    <a href="">我们的新闻</a>
                </div>
                <ul class="pinner fr">
                    <li><a href="" class="link on">案例展示一</a></li>
                    <li><a href="" class="link">案例展示二</a></li>
                    <li><a href="" class="link">案例展示三</a></li>
                    <li><a href="" class="link">案例展示四</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </section>
    </section>

    <div class="page-main">
        <div class="linian service">

            <div class="w1300">
                <div class="p-title">
                    <div class="t">服务与支持</div>
                    <i class="s"></i>
                    <div class="c" style="font-family: arial; text-transform: uppercase;" >Service and support</div>
                </div>
                <ol class="mt50">
                    <li>
                        <a href="">
                            <div class="ln_img fl"><img src="./images/fw-pic1.jpg"></div>
                            <div class="cont index-table fr">
                                <div class="index-cell">
                                    <h1>服务承诺 </h1>
                                    <p>Service promise</p>
                                    <span></span>
                                    <figure>
                                        <p>消费者投诉，是指消费者为生活消费需要购买、使用商品或者接受服务，与经营者之间发生消费者权益争议后，请求消费者权益保护组织调解，要求保护其合法权益的行为。</p>
                                    </figure>
                                </div>
                            </div>
                        </a>
                    </li>
                </ol>
                <div class="bottom clearfix">
                    <div class="left fl">
                        <div class="title">
                            <h1>投诉保修 </h1>
                            <p>Warranty for complaints</p>
                            <span></span>
                            <div class="img">
                                <img src="./images/fw-pic2.jpg">
                            </div>
                            <figure>
                                <p>消费者投诉，是指消费者为生活消费需要购买、使用商品或者接受服务，与经营者之间发生消费者权益争议后，请求消费者权益保护组织调解，要求保护其合法权益的行为。</p>
                            </figure>
                        </div>

                    </div>
                    <div class="right fr">
                        <div class="liuyan">

                            <ul>
                                <li><input type="text" value="请输入您的姓名" class="text" onblur="if(this.value=='')this.value='请输入您的姓名';" onfocus="this.value='';" onkeydown="entersearch()"></li>
                                <li><input type="text" value="请输入您的联系电话" class="text" onblur="if(this.value=='')this.value='请输入您的联系电话';" onfocus="this.value='';" onkeydown="entersearch()"></li>
                                <li><input type="text" value="请输入您的常用邮箱" class="text" onblur="if(this.value=='')this.value='请输入您的常用邮箱';" onfocus="this.value='';" onkeydown="entersearch()"></li>
                                <li class="on_11"><textarea placeholder="请在此处输入文本..."></textarea></li>
                                <li class="on_22"><input type="submit" value="立即提交" class="sub"></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--footer-->
    <div class="index-footer" style="margin-top: 0;">
        <div class="clearfix index-footer-info index-con">
            <div class=" fl">

            </div>
            <div class="lianxi fl">
                <h2>联系方式</h2>
                <p>前台电话： xxx </p>
                <p>报修电话：xxx</p>
                <P>地址：xxx省xxx市XX区XX1201号XXXXXX</P>
                <p>商务产业园x期x号楼东xxx室</p>
            </div>
            <div class="phone fl">
                xxx
            </div>
            <div class="erweima fr">
                <img src="./images/pic1.jpg">
                <p>二维码</p>
            </div>
        </div>

        <div class="index-footer-bottom">
            <div class="index-con clearfix">
                <p class="fl">版权所有 © 2020 xxxx科技有限公司  皖ICP备xxxxxxxx号 x公网安备xxxxxxxxxxxxxxxxxx号</p>
                <a href="http://www.5imoban.net" target="_blank" class="fr">技术支持：静态网页模板</a>
            </div>
        </div>
    </div>
    <div class="clear"></div>

</div>

<script type="text/javascript" src="http://www.5imoban.net/download/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
<script type='text/javascript' src='./js/base.js'></script>
<script type="text/javascript" src='./js/app.js'></script>
<script src="./js/more.js"></script>
<script>
    scrolly.init({
        wrapper: '#bloc',
        targets: '.scr-el',
        bgParallax: true,
        wrapperSpeed: 0.08
    });
</script>
</body>
</html>