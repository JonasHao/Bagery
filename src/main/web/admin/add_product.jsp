<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="src/main/web/admin/css/product.css"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="/admin/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="/admin/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="/admin/css/animate.css" rel="stylesheet">
    <link href="/admin/css/style.css" rel="stylesheet">
    <link href="/admin/css/product.css" rel="stylesheet">
    <!-- Image cropper -->
    <link href="/admin/css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <title>Bagery | 后台管理系统</title>
</head>
<body>

<div id="wrapper">
    <jsp:include page="/admin/admin_nav.jsp"/>


    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Bagery后台管理系统</span></li>

                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i>
                            <span class="label label-primary">8</span></a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i>8个订单待发货
                                        <span class="pull-right text-muted small">4分钟前</span></div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/admin/login.jsp">
                            <i class="fa fa-sign-out"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>发布商品</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="html/index.html">首页</a>
                    </li>
                    <li>
                        <a>商品管理</a>
                    </li>
                    <li class="active">
                        <strong>发布商品</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>填写商品信息 </h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="#">Config option 1</a>
                                            </li>
                                            <li><a href="#">Config option 2</a>
                                            </li>
                                        </ul>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    


                                    <s:fielderror/>


                                    <form action="addPriced" namespace="/admin"  class="form-horizontal">
                                        <div class="form-group">

                                            <label class="col-sm-2 control-label">商品名称</label>
                                            <div class="col-sm-10"><s:textfield name="title"
                                                                                cssClass="form-control">
                                            </s:textfield></div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品图片</label>
                                            <div class="col-sm-10">
                                                <s:hidden name="img" />
                                                <img id="added_img" src=""  style="width: 200px;height: 200px; display: none;" />

                                                <a id = "add_img_btn" data-toggle="modal" class="btn btn-info" style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;" href="#modal-upload-img">添加</a>

                                                <div id="modal-upload-img" class="modal fade" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <div class="image-crop">
                                                                            <img src="/admin/img/p_big1.jpg" class="cropper-hidden ">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="margin-top: 1rem" class="row">
                                                                    <div class="col-sm-12">
                                                                        <center>
                                                                            <h4>预览</h4>
                                                                            <div class="img-preview img-preview-sm" style="width: 300px; height: 300px;">
                                                                                <img src="/admin/img/p_big1.jpg" style="min-width: 0px !important; min-height: 0px !important; max-width: none !important; max-height: none !important; width: 200px; height: 200px; margin-left: -25px; margin-top: -22px;">
                                                                            </div>
                                                                            <p></p>


                                                                            <div id="qiniu_container"class="btn-group">
                                                                                <label title="Upload image file" for="inputImage" class="btn btn-primary">
                                                                                    <input type="file" accept="image/*"
                                                                                           name="file" id="inputImage"
                                                                                           class="hide">
                                                                                    浏览
                                                                                </label>
                                                                                <label title="Download image" id="pickfile" class="btn btn-primary">七牛浏览</label>
                                                                                <label title="Download image" id="up_load" class="btn btn-primary">七牛上传</label>
                                                                            </div>
                                                                        </center>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>






                                        <div class="form-group"><label class="col-sm-2 control-label">商品描述</label>
                                            <div class="col-sm-10">
                                                <s:textarea name="description"
                                                         cssClass="form-control"
                                                            cssStyle="resize: vertical;height:120px;">
                                                </s:textarea>
                                                <span class="help-block m-b-none">*拖动文本框右下角可改变文本框高度</span>
                                            </div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品原价</label>
                                            <div class="col-sm-10"><s:textfield name="unit_price"
                                                                                cssClass="form-control"/></div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品优惠价</label>

                                            <div class="col-sm-10"><s:textfield name="sale_price"
                                                                                cssClass="form-control"/></div>
                                        </div>

                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group"><label class="col-sm-2 control-label">商品属性</label>
                                            <div class="col-sm-10">
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">品牌</label>
                                                    <div class="col-sm-4">
                                                        <%--todo: s:select的list属性设置成action中的List--%>
                                                            <s:select
                                                                    list="#{'1':'芬迪', '2':'古琦','3':'巴宝莉','4':'安娜苏','5':'宝格丽','6':'香奈儿',
                                                                           '7':'卡尔文•克莱恩','8':'川久保玲','9':'迪奥','10':'登喜路',
                                                                           '11':'纪梵希','12':'戈雅','13':'爱马仕'}"
                                                                    name="proIDs[0]" cssClass="form-control m-b" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">材质</label>
                                                    <div class="col-sm-4">
                                                        <s:select list="#{'14':'鳄鱼皮','15':'帆布','16':'公牛皮','17':'浣熊皮草','18':'棉',
                                                        '19':'尼龙','20':'蛇皮','21':'羊毛','22':'漆皮','23':'其他纤维'}"
                                                                  name="proIDs[1]" cssClass="form-control m-b"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">款式</label>
                                                    <div class="col-sm-4">
                                                        <s:select list="#{'24':'单肩包', '25':'双肩包', '26':'手拿包','27':'手提包',
                                                        '28':'斜挎包','29':'电脑包','30':'箱包','31':'腰包'}"
                                                                  name="proIDs[2]" cssClass="form-control m-b"/>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group"><label class="col-sm-2 control-label">商品颜色</label>

                                            <div class="col-sm-10" id="color_stock">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[0].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[0].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[1].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[1].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[2].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[2].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[3].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[3].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[4].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[4].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <%--<div class="form-group">--%>
                                            <%--<span class="col-sm-2"></span>--%>
                                            <%--<small class="col-sm-10 text-navy" onclick="addColor()">再添加一种颜色</small>--%>
                                        <%--</div>--%>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="col-sm-4 col-sm-offset-2">
                                                <s:submit cssClass="btn btn-primary" value="提交"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <div class="pull-right">
                        Based on a Bootstrap 3 framework called <strong>Inspinia</strong>
                    </div>
                    <div>
                        <strong>Copyright</strong> Exciting Company &copy; 2016
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Mainly scripts -->
<script src="/admin/js/jquery-2.1.1.js"></script>
<script src="/admin/js/bootstrap.min.js"></script>
<script src="/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Flot -->
<script src="/admin/js/plugins/flot/jquery.flot.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.pie.js"></script>
<!-- Peity -->
<script src="/admin/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/admin/js/demo/peity-demo.js"></script>
<!-- Custom and plugin javascript -->
<script src="/admin/js/inspinia.js"></script>
<script src="/admin/js/plugins/pace/pace.min.js"></script>
<!-- jQuery UI -->
<script src="/admin/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- GITTER -->
<script src="/admin/js/plugins/gritter/jquery.gritter.min.js"></script>
<!-- Sparkline -->
<script src="/admin/js/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Sparkline demo data -->
<script src="/admin/js/demo/sparkline-demo.js"></script>
<!-- ChartJS-->
<script src="/admin/js/plugins/chartJs/Chart.min.js"></script>
<!-- Toastr -->
<script src="/admin/js/plugins/toastr/toastr.min.js"></script>

<!-- Image cropper -->
<script src="/admin/js/plugins/cropper/cropper.min.js"></script>

<!-- QiniuUploader -->
<script src="/admin/js/imgupload/qiniu.js"></script>
<script src="/admin/js/imgupload/plupload.full.min.js"></script>
<!-- Crypto-js -->
<script type="text/javascript" src="/admin/js/crypto-js/crypto-js.js"></script>
<script type="text/javascript" src="/admin/js/crypto-js/hmac-sha1.js"></script>
<script>
    var croppeddata;
    var qiniu_config = {
        AK: "hRa8KzY6vcwOjKFZ0cNs_zAZNlcnhAWrJtmAmVhC",
        SK: "EeCydvwVtfPtvg_SHTR5Z7HYuPFHY5aetfOCNWjR",
        domain: "http://o9s6sj90d.bkt.clouddn.com",
        bucketName: "bagery"
    };
    function getUploadToken(putPolicyConfig) {
        var putPolicy = JSON.stringify(putPolicyConfig);
        var encodedPutPolicy = window.btoa(putPolicy);
        var hash = CryptoJS.HmacSHA1(encodedPutPolicy, qiniu_config.SK);
        var encodedSign = hash.toString(CryptoJS.enc.Base64);
        var uploadToken = qiniu_config.AK + ':' + encodedSign + ':' + encodedPutPolicy;
        return uploadToken;
    }
    $(document).ready(function () {

//七牛上传图片

        var deadline = (Date.parse(new Date()) / 1000) + 3600;
        // console.log(deadline);
        var putPolicyConfig = {
            scope: qiniu_config.bucketName,
            deadline: deadline,
        };
        myUploadToken = getUploadToken(putPolicyConfig);
        // console.log(myUploadToken);


        var uploader = Qiniu.uploader({
            runtimes: 'html5,flash,html4',      // 上传模式，依次退化
            browse_button: 'pickfile',         // 上传选择的点选按钮，必需
            // 在初始化时，uptoken，uptoken_url，uptoken_func三个参数中必须有一个被设置
            // 切如果提供了多个，其优先级为uptoken > uptoken_url > uptoken_func
            // 其中uptoken是直接提供上传凭证，uptoken_url是提供了获取上传凭证的地址，如果需要定制获取uptoken的过程则可以设置uptoken_func
            uptoken: myUploadToken, // uptoken是上传凭证，由其他程序生成
            // uptoken_url: '/uptoken',         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
            // uptoken_func: function(file){    // 在需要获取uptoken时，该方法会被调用
            //    // do something
            //    return uptoken;
            // },
            get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的uptoken
            // downtoken_url: '/downtoken',
            // Ajax请求downToken的Url，私有空间时使用，JS-SDK将向该地址POST文件的key和domain，服务端返回的JSON必须包含url字段，url值为该文件的下载地址
            unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
            // save_key: true,                  // 默认false。若在服务端生成uptoken的上传策略中指定了sava_key，则开启，SDK在前端将不对key进行任何处理
            domain: qiniu_config.domain,     // bucket域名，下载资源时用到，必需
            container: 'qiniu_container',             // 上传区域DOM ID，默认是browser_button的父元素
            max_file_size: '100mb',             // 最大文件体积限制
            flash_swf_url: 'js/imgupload/Moxie.swf',  //引入flash，相对路径
            max_retries: 3,                     // 上传失败最大重试次数
            dragdrop: true,                     // 开启可拖曳上传
            drop_element: 'qiniu_container',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                  // 分块上传时，每块的体积
            auto_start: false,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
            //x_vars : {
            //    查看自定义变量
            //    'time' : function(up,file) {
            //        var time = (new Date()).getTime();
            // do something with 'time'
            //        return time;
            //    },
            //    'size' : function(up,file) {
            //        var size = file.size;
            // do something with 'size'
            //        return size;
            //    }
            //},
            init: {
                'FilesAdded': function (up, files) {
                    // console.log(up);
                    // console.log(files);
                    plupload.each(files, function (file) {
                        // 文件添加进队列后，处理相关的事情
                    });
                },
                'BeforeUpload': function (up, file) {
                    // 每个文件上传前，处理相关的事情
                },
                'UploadProgress': function (up, file) {

                    alert("正在上传，请稍后");
                    // 每个文件上传时，处理相关的事情
                },
                'FileUploaded': function (up, file, info) {

                    // 每个文件上传成功后，处理相关的事情
                    // 其中info是文件上传成功后，服务端返回的json，形式如：
                    // {
                    //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                    //    "key": "gogopher.jpg"
                    //  }
                    // 查看简单反馈
                    console.log(croppeddata);
                    var domain = up.getOption('domain');
                    var res = JSON.parse(info);

                    var suffix = "?imageMogr2/crop/!"+parseInt(croppeddata.width)+"x"+parseInt(croppeddata.height)+"a"+parseInt(croppeddata.x)+"a"+parseInt(croppeddata.y);
                    var sourceLink = domain + '/' + res.key + suffix;
                    alert("上传成功，图片地址为"+sourceLink);
                    console.log(sourceLink)
                    document.getElementById("add_img_btn").style.display="none";
                    var img = document.getElementById("added_img");
                    var inputImg = document.getElementById("img");
                    img.src = sourceLink;
                    img.style.display="block";
                    inputImg.value = sourceLink;
                    console.log(inputImg);
                    $('#modal-upload-img').modal('hide');
                },
                'Error': function (up, err, errTip) {
                    //上传出错时，处理相关的事情
                },
                'UploadComplete': function () {
                    //队列文件处理完毕后，处理相关的事情
                },
                'Key': function (up, file) {
                    // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                    // 该配置必须要在unique_names: false，save_key: false时才生效

                    var key = "";
                    // do something with key here
                    return key
                }
            }
        });

// domain为七牛空间对应的域名，选择某个空间后，可通过 空间设置->基本设置->域名设置 查看获取

// uploader为一个plupload对象，继承了所有plupload的方法


        $('#up_load').on('click', function () {
            uploader.start();
        });
        $('#stop_load').on('click', function () {
            uploader.stop();
        });



//裁剪图片

        console.log(uploader);

        var $image = $(".image-crop > img")

        $($image).cropper({
            aspectRatio: 1,
            preview: ".img-preview",
            done: function (data) {
                croppeddata = data;
                // Output the result data for cropping image.
            }
        });

        var $inputImage = $("#inputImage");

        if (window.FileReader) {
            $inputImage.change(function () {
                var fileReader = new FileReader(),
                        files = this.files,
                        file;

                if (!files.length) {
                    return;
                }

                file = files[0];

                uploader.files

                console.log(files);

                console.log(file);


                if (/^image\/\w+$/.test(file.type)) {
                    fileReader.readAsDataURL(file);
                    fileReader.onload = function () {
                        $inputImage.val("");
                        $image.cropper("reset", true).cropper("replace", this.result);
                    };
                } else {
                    showMessage("Please choose an image file.");
                }
            });
        } else {
            $inputImage.addClass("hide");
        }







    });
    function addColor() {
        // document.getElementById('color_stock').appendChild("<strong>test</strong>");
        var div = document.createElement("div");
        div.innerHTML = "<div class=\"row\"><div class=\"col-sm-6\"><input type=\"text\" placeholder=\"请输入颜色\" class=\"form-control m-b\"></div><div class=\"col-sm-4\"><input type=\"text\" placeholder=\"请输入库存\" class=\"form-control m-b\"></div><button class=\"col-sm-2 btn btn-warning btn-circle\" type=\"button\" onclick=\"deleteColor()\"><i class=\"fa fa-times\"></i></button></div>";

        document.getElementById('color_stock').appendChild(div);
    }
    function deleteColor() {
        var clicked = event.target;
        var todelete;
        if (clicked.nodeName == "I") {
            todelete = clicked.parentNode.parentNode;
        } else {
            todelete = clicked.parentNode;
        }
        todelete.parentNode.removeChild(todelete);
    }
</script>
</body>
</html>
