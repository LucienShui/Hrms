<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/table.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script type="text/javascript">
        var t = n = 0,
            count;
        $(document).ready(function () {
            // 获取图片标签长度
            count = $("#banner_list a").length;
            // 不是当前显示的图片隐藏
            $("#banner_list a:not(:first-child)").hide();
            // 点击下面的1234按钮，切换图片
            $("#banner li").click(function () {
                var i = $(this).text() - 1;
                n = i;
                if (i >= count) return;
                // 淡入淡出效果
                $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);

                // 响应点击
                $(this).toggleClass("on");

                // 切换按钮的时候让上一个按钮回归原来的样式
                $(this).siblings().removeAttr("class");
            });
            t = setInterval("showAuto()", 2000);
            $("#banner").hover(function () {
                    clearInterval(t)
                },
                function () {
                    t = setInterval("showAuto()", 2000);
                });
        });

        // 自动轮播
        function showAuto() {
            n = n >= (count - 1) ? 0 : ++n;
            $("#banner li").eq(n).trigger('click');
        }
    </script>
</head>
<style>
    #banner {
        position: relative;
        width: 90%;
        height: 30em;
        border: 1px solid white;
        overflow: hidden;
        left: 2em;
    }

    #banner_list img {
        position: relative;
        border: 0 solid red;
        left: 4.5%;
        clear: both;
    }

    #banner_bg {
        position: absolute;
        bottom: 0;
        width: 100%;
        left: 5em;
        height: 28em;
        filter: Alpha(Opacity=3);
        opacity: 0.3;
        box-shadow: 8px 8px 14px #06c;
        z-index: 1;
        cursor: pointer;
        clear: both;
    }

    #banner_info {
        position: absolute;
        bottom: 0;
        left: 3em;
        height: 26em;
        color: greenyellow;
        z-index: 1001;
        cursor: pointer;
        background: lightgray;
        clear: both;
    }

    #banner_text {
        position: absolute;
        width: 120px;
        z-index: 1002;
        right: 3px;
        bottom: 3px;
    }

    #banner ul {
        text-align: center;
        position: absolute;
        list-style-type: none;
        filter: Alpha(Opacity=80);
        opacity: 0.8;
        z-index: 1002;
        margin: 0.1em;
        padding: 2px;
        bottom: 3px;
        right: 45%;
    }

    #banner ul li {

        padding: 0 6px;
        float: left;
        display: block;
        color: black;
        background: dimgray;
        cursor: pointer;
        border: 1px solid darkgray;
    }

    #banner ul li.on {
        background-color: lightgray;
    }

    #banner_list a {
        position: relative;
        left: 0;
        top: 0;
        margin: 0;
    }
</style>
<body style="overflow-x: hidden">
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 class="panel-title">东软集团股份有限公司</h3>
                    <p class="panel-subtitle">Neusoft，Beyond technology(超越技术)</p>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-9">
                            <style type="text/css">
                                p {
                                    text-indent: 2em
                                }
                            </style>
                            <p>
											<span class="title">1991年，年轻的东北大学教授刘积仁在中国东北大学创立了东软。公司拥有员工23000余名，
													在中国建立了8个区域总部，16个软件开发与技术支持中心，6个软件研发基地，在40多个城市建立营销与服务网络，
													在大连、南海、成都和沈阳分别建立3所东软学院和1所生物医学与信息工程学院;在美国、欧洲、日本、中东、中国香港、
													印度都设有子公司。 </span>
                            </p>
                            <p>
											<span class="title"> 东软将"超越技术"作为公司的经营思想和品牌承诺。作为一家以软件技术为核心的公司，东软通过开放式创新、卓越运营管理、
                                                                                                         人力资源发展等战略的实施，全面构造公司的核心竞争力，创造客户和社会的价值，从而实现技术的价值。</span>
                            </p>
                            <p>
											<span class="title"> 国家主席习近平29日来到东软集团(大连)有限公司。在远程医疗系统显示屏前，听说中日友好医院和1000多家医疗机构建立了联系，他问远在北京的
                                                                                                           医院院长:"系统好用吧?""非常好用。""用信息化系统提高医疗水平，叫如虎添翼。要利用好这套系统，更好为群众服务。"</span>
                            </p>
                            <p>
											<span class="title">习近平在东软集团(大连)有限公司对年轻人说，全面小康社会靠什么实现?如果走粗放经营的老路，能源资源无法支撑。
                                                                                                          必须走出一条新路，依靠创新驱动。要发展实体经济，促进信息化、工业化融合。要把人才工作抓好，让人才事业兴旺起 来，国家发展靠人才，民族振兴靠人才。</span>
                            </p>
                        </div>
                        <div class="col-md-3">
                            <img src="assets/img/biaozhi.jpg" height="100%" width="100%"/>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OVERVIEW -->
            <div class="row">
                <div class="col-md-12">
                    <!-- RECENT PURCHASES -->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">企业理念</h3>

                        </div>
                        <div class="panel-body">
                            <style type="text/css">
                                p {
                                    text-indent: 2em
                                }
                            </style>
                            <p>
											<span title="">东软致力于成为最受社会、客户、投资者和员工尊敬的公司，并通过组织与过程的持续改进，领导力与员工竞争力的发展，联盟与开放式创新，使东软成为全球
												优秀的IT解决方案和服务供应商。</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6" style="left: 1em">
                <!-- TODO LIST -->
                <div class="panel" style="height: 33.3em">
                    <div id="banner">
                        <div id="banner_bg">
                        </div>
                        <div id="banner_info">
                        </div>
                        <ul>
                            <li class="on">
                                1
                            </li>
                            <li>
                                2
                            </li>
                            <li>
                                3
                            </li>
                            <li>
                                4
                            </li>
                        </ul>
                        <div id="banner_list">
                            <a href="#" target="_blank"><img src="assets/img/tupian1.jpg"
                                                             style="width: 100%;height: 33em;margin: 1em;"/></a>
                            <a href="#" target="_blank"><img src="assets/img/tu2.jpg"
                                                             style="width: 100%;height: 33em;margin: 1em;"/></a>
                            <a href="#" target="_blank"><img src="assets/img/tu3.jpg"
                                                             style="width: 100%;height: 33em;margin: 1em;"/> </a>
                            <a href="#" target="_blank"><img src="assets/img/tu4.jpg"
                                                             style="width: 100%;height: 33em;margin: 1em;"/> </a>
                        </div>
                    </div>
                </div>
                <!-- END TODO LIST -->
            </div>
            <div class="col-md-6" style="right: 1%">
                <!-- TIMELINE -->
                <div class="panel panel-scrolling">
                    <div class="panel-heading">
                        <h3 class="panel-title">公司奖项</h3>
                    </div>
                    <div class="panel-body">
                        <style type="text/css">
                            p {
                                text-indent: 2em
                            }
                        </style>
                        <p>
                            <span title="">东软获得"2006CCTV年度雇主"称号(中央电视台)东软连续获得"中国杰出创新企业奖"和"中国IT创新企业奖"(《计算机世界》、《IT经理世界》杂志)</span>
                        </p>
                        <p>
                            <span title="">东软获得"2008中国信息产业年度公益企业奖"、"2008中国信息产业年度高成长性企业"称号(中国电子信息产业发展研究院、赛迪集团)</span>
                        </p>
                        <p>
										<span title="">东软入选"2008年最具全球竞争力中国公司20强"(罗兰.贝格国际管理咨询公司和《环球企业家》杂志) 东软连续进入"全球外包100强"榜单，
												并于2007年进入25强，成为全球最优秀的外包公司之一。2009年，东软董事长兼首席执行官刘积仁作为首位中国人入选"外包名人堂"名单(国际外包专业委员会)</span>
                        </p>
                        <p>
										<span title="">东软连续进入"全球IT服务100强"榜单，蝉联"亚洲新兴市场外包十强"榜首，并于2009年入围全球"最佳表现IT服务提供商10强"和"人力资本发
												展10强"榜单(美国《全球外包》杂志和"全球外包服务咨询公司") 东软入选"中国上市公司价值评选百强"榜单(证券时报)</span>
                        </p>
                        <p>
                            <span title="">东软入选央视评选的"60年60品牌"榜单(CCTV)</span>
                        </p>
                        <p>
                            <span title="">东软获得"2009中国最佳人力资源典范企业"称号(前程无忧)</span>
                        </p>
                        <p>
                            <span title="">东软获得"中国最佳客户服务"和"中国最佳外包服务商"称号(中国服务贸易协会)</span>
                        </p>
                        <p>
                            <span title="">东软入选"Chinasourcing 2009年度中国服务外包企业最佳实践TOP50" 榜单(中国外包网)(CCTV)</span>
                        </p>
                        <p>
                            <span title="">东软董事长兼首席执行官刘积仁成功入选"2009年度10位全球外包杰出人物"称号(亚太总裁协会)(CCTV)</span>
                        </p>
                        <p>
                            <span title="">东软董事长兼首席执行官刘积仁入选"2009中国经济年度人物"(CCTV)</span>
                        </p>
                        <p>
                            <span title="">东软董事长兼首席执行官刘积仁入选"中国最具影响力的25位商界领袖"(《财富》(中文版))</span>
                        </p>
                        <p>
                            <span title="">东软获得 "辉煌十年卓越企业"奖;东软董事长兼首席执行官刘积仁获得"辉煌十年领袖人物"奖</span>
                        </p>
                        <p>
                            <span title="">东软入选由Teleos和The KNOW Network联合发起的2010年全球最受赏识的知识型企业，并在2010年亚洲最受赏识的知识型企业研究报告中被提名。</span>
                        </p>
                    </div>
                </div>
                <!-- END TIMELINE -->
            </div>
        </div>

    </div>
</div>
<div class="clearfix"></div>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="assets/vendor/chartist/js/chartist.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>
</html>
