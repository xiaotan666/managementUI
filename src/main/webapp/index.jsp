<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tx161
  Date: 2021/8/30
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <%
        request.setAttribute("PATH_HOME", request.getContextPath());
    %>
    <script type="text/javascript" src="${PATH_HOME}/Views/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${PATH_HOME}/Views/css/bootstrap.min.css">
    <script src="${PATH_HOME}/Views/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<!-- 新增用户组件 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="flase">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="from_add">
                <!--
                    <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">账号id</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="form_id" name="id" type="text" aria-label="Disabled input example" disabled readonly>
                    </div>
                </div>
                -->
                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" name="username" class="form-control" id="staticName" placeholder="username">
                        <div class="valid-feedback">
                            用户名可用！
                        </div>
                        <div id="username_add" class="invalid-feedback">
                            用户名已存在！
                        </div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="inputPassword" placeholder="password">
                        <div id="password_add" class="invalid-feedback">
                            请检查密码格式，里面至少包含8-16位英文或数字！
                        </div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">电子邮箱</label>
                    <div class="col-sm-10">
                        <input type="text" name="eMail" class="form-control" id="staticEmail" placeholder="email@example.com">
                        <div id="email_add" class="invalid-feedback">
                            请检查邮箱格式，例如：”email@example.com“！
                        </div>
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_add">添加</button>
            </div>
        </div>
    </div>
</div>
<!-- 批量删除用户组件 -->
<div class="modal fade" id="exampleModal_deleteAll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel_deleteAll">删除用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="msg_deleteAll">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="deleteAll">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 编辑用户组件 -->
<div class="modal fade" id="exampleModal_update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel_update">修改用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="from_update" id="update_reset">
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">账号id</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="update_id" name="id" type="text" aria-label="Disabled input example" disabled readonly>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="update_Name" placeholder="username">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="update_Password" placeholder="password">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="staticEmail" class="col-sm-2 col-form-label">电子邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="eMail" class="form-control" id="update_Email" placeholder="email@example.com">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_update">确认修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除用户组件 -->
<div class="modal fade" id="exampleModal_delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel_delete">删除用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="msg_delete">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="delete">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 提示信息组件 -->
<div class="toast-container position-absolute top-5 start-50 translate-middle-x" style="z-index: 11">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <i class="bi bi-exclamation-circle"></i>
            <strong class="me-auto">提示消息</strong>
            <small>1 mins ago</small>
        </div>
        <div class="toast-body">
            你还未勾选需要删除的用户信息~
        </div>
    </div>
</div>
<body>
    <div class="container">
        <!-- 头部信息 -->
        <div class="row">
            <div class="col-md-12">
                <p></p>
                <h2>后台用户管理</h2>
            </div>
        </div>
        <!-- 操作按钮 -->
        <div class="row">
            <div class="col-md-4 offset-md-8">
                <button class="btn btn-primary" id="add">
                    <i class="bi bi-clipboard-plus"></i>
                    新增
                </button>
                <button class="btn btn-danger" id="btn_deleteAll">
                    <i class="bi bi-x-circle"></i>
                    批量删除
                </button>
            </div>
        </div>
        <!-- 主体信息 -->
        <div class="row">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th><input class="form-check-input me-1" type="checkbox" id="check_all">全选</th>
                    <th>id</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>电子邮箱</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="iteam">
                </tbody>
            </table>
        </div>
        <!-- 加载动画 -->
        <div class="row">
            <div class="col-md-5 offset-md-5" id="animation_body">

            </div>
        </div>
        <!-- 分页数据信息 -->
        <div class="row">
            <div class="col-md-6" id="page_info_area">

            </div>
        </div>
        <!-- 分页事件 -->
        <div class="row">
            <div class="col-md-6 offset-md-4" id="page_nav_area">

            </div>
        </div>
    </div>
<script type="text/javascript">
    //当前页数+1
    var endNmb;
    //当前页数-1
    var totalNmb;
    //当前页数
    var pageNmb;
    //当前修改id值
    var id_td;
    //当前删除id值
    var id_delete;
    //当前批量删除的id值
    var del_idstr = "";
    //新增检测
    var usernameCheck;
    var passwordCheck;
    var emailCheck;
    $(function () {
        var animation = $("<div class='spinner-grow text-dark' style='width: 5rem; height: 5rem;' role='status'/>");
        $("#animation_body").append(animation);
        callback(1);
    });
    function callback(pageFirst){
        $.ajax({
            url:"${PATH_HOME}/emps",
            data:"pageFirst=" + pageFirst,
            type:"GET",
            success:function (data) {
                iteam(data);
                page(data);
                pageToolbar(data);
                pageNmb = data.pageNum;
            }
        });
    }
        //获取所有用户/分页后的数据
        function iteam(data) {
            $("#animation_body").empty();
            $("#iteam").empty();
            var iteam = data.list;
            $.each(iteam,function (index,emps) {
                //<input class="form-check-input me-1" type="checkbox" value="">
                var check = $("<td></td>").append($("<input>").addClass("check_iteam").attr("type","checkbox").attr("td_id",emps.id).attr("td_username",emps.username));
                var id = $("<td></td>").append(emps.id);
                var username = $("<td></td>").append(emps.username);
                var password = $("<td></td>").append(emps.password);
                var email = $("<td></td>").append(emps.eMail);
                var editBtn = $("<button></button>").attr("td_id",emps.id).attr("td_username",emps.username)
                    .attr("td_password",emps.password).attr("td_email",emps.eMail).addClass("btn btn-primary").attr("id","btn_update")
                    .append($("<i></i>").addClass("bi bi-pencil-fill")).append(" 修改");
                var delBtn =  $("<button></button>").attr("td_id",emps.id).attr("td_username",emps.username).attr("id","btn_delete").addClass("btn btn-danger")
                    .append($("<i></i>").addClass("bi bi-x-circle")).append(" 删除");
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(check)
                    .append(id)
                    .append(username)
                    .append(password)
                    .append(email)
                    .append(btnTd)
                    .appendTo("#iteam");
            });
        }
        //新增用户名检验
        $("#staticName").change(function () {
        var format = /^\w{5,8}$/;
            if($(this).val() == ''){
                $("#staticName").prop("class","form-control");
                usernameCheck = false;
            }else if (format.test($(this).val())){
                $.ajax({
                    url: "${PATH_HOME}/checkName",
                    data: "username=" + $(this).val(),
                    type: "GET",
                    success: function (data) {
                        if (data){
                            $("#staticName").prop("class","form-control is-valid");
                            usernameCheck = true;
                        }else {
                            $("#username_add").empty();
                            $("#username_add").append("用户名已存在！");
                            $("#staticName").prop("class","form-control is-invalid");
                            usernameCheck = false;
                        }
                    }
                });
            }
            else {
                $("#username_add").empty();
                $("#username_add").append("请检查用户名格式，里面至少包含5-8位英文或数字！");
                $("#staticName").prop("class","form-control is-invalid");
                usernameCheck = false;
            }
        });
        //新增密码检验
        $("#inputPassword").change(function () {
            var checkName = /^\w{8,16}$/;
            if ($(this).val() == ''){
                $("#inputPassword").prop("class","form-control")
                passwordCheck = false;
            }else if (checkName.test($(this).val())){
                $("#inputPassword").prop("class","form-control is-valid")
                passwordCheck = true;
            }else {
                $("#inputPassword").prop("class","form-control is-invalid")
                passwordCheck = false;
            }
        });
        //新增邮箱检验
        $("#staticEmail").change(function () {
           var checkEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
           if ($(this).val() == ''){
               $("#staticEmail").prop("class","form-control");
               emailCheck = false;
           }else if (checkEmail.test($(this).val())){
               $("#staticEmail").prop("class","form-control is-valid")
               emailCheck = true;
           }else {
               $("#staticEmail").prop("class","form-control is-invalid")
               emailCheck = false;
           }
        });
        //全选事件
        $("#check_all").click(function () {
            $(".check_iteam").prop("checked",$(this).prop("checked"));
        });
        //单选事件
        $(document).on("click",".check_iteam",function () {
            var flag = $(".check_iteam:checked").length == $(".check_iteam").length;
            $("#check_all").prop("checked",flag);
        });
        //批量删除事件
        $("#btn_deleteAll").click(function () {
            $("#msg_deleteAll").empty();
            var tmp_username = "";
            //id_delete = $(".check_iteam:checked").attr("td_id");
            $(".check_iteam:checked").each(function () {
                    tmp_username += $(this).attr("td_username") + ",";
                    del_idstr += $(this).attr("td_id") + ",";
            });
            tmp_username = tmp_username.substring(0, tmp_username.length-1);
            del_idstr = del_idstr.substring(0, del_idstr.length-1);
            //var username = $(".check_iteam:checked").attr("td_username");
            if (tmp_username != ''){
                $("#msg_deleteAll").append("你确定要删除【" + tmp_username + "】用户？");
                $("#exampleModal_deleteAll").modal("show");
            }else {
                $("#liveToast").toast("show");
            }
        });
        //批量删除按钮事件
        $("#deleteAll").click(function () {
            $.ajax({
               url: "${PATH_HOME}/delete/" + del_idstr,
               type: "DELETE",
               success: function () {
                   //alert("删除成功");
                   del_idstr = "";
                   $("#exampleModal_deleteAll").modal("hide");
                   callback(pageNmb);
               }
            });
        });
        //添加按钮事件
        $("#add").click(function () {
            /*$.ajax({
                url: "${PATH_HOME}/getlast",
                type: "GET",
                success: function (data) {
                    $("#form_id").attr("value",data.id + 1);
                }
            });*/
            $("#exampleModal").modal("show");
    });
        //编辑按钮事件
        $(document).on("click","#btn_update",function () {
            $("#exampleModal_update").modal("show");
            id_td = $(this).attr("td_id");
            var username = $(this).attr("td_username");
            var password = $(this).attr("td_password");
            var email = $(this).attr("td_email");
            $("#update_id").attr("value",id_td);
            $("#update_Name").attr("value",username);
            $("#update_Password").attr("value",password);
            $("#update_Email").attr("value",email);
        });
        //修改事件
        $("#btn_update").click(function () {
            $.ajax({
               url:"${PATH_HOME}/update/" + id_td,
               type: "PUT",
               data: $(".from_update").serialize(),
               success:function () {
                   $("#exampleModal_update").modal("hide");
                   $(".from_update")[0].reset();
                   callback(pageNmb);
               }
            });
        });
        //删除按钮事件
        $(document).on("click","#btn_delete",function () {
            $("#msg_delete").empty();
            id_delete = $(this).attr("td_id");
            var username = $(this).attr("td_username");
            $("#msg_delete").append("你确定要删除【" + username + "】用户？");
            $("#exampleModal_delete").modal("show");
        });
        //删除事件
        $("#delete").click(function () {
            //alert(id_delete);
           $.ajax({
               url: "${PATH_HOME}/delete/" + id_delete,
               type: "DELETE",
               success: function () {
                   $("#exampleModal_delete").modal("hide");
                   callback(pageNmb);
               }
           }) ;
        });
    //显示分页信息
         function page(data){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+data.pageNum+"页,总"+
            data.pages+"页,总"+
            data.total+"条记录");
        endNmb = data.pages + 1;
    }
    //分页按钮事件
        function pageToolbar(data) {
            $("#check_all").prop("checked",false);
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            //构建元素
            var homePageLi = $("<li></li>").attr("style","cursor:pointer").addClass("page-item").append($("<a></a>").addClass("page-link").click(function () {
                callback(1);
            }).attr("aria-lable","Previous").append($("<span></span>").append("首页").addClass("sr-only")));
            var backPageLi = $("<li></li>").attr("style","cursor:pointer").addClass("page-item").append($("<a></a>").addClass("page-link").click(function () {
                callback(data.total);
            }).attr("aria-lable","Previous").append($("<span></span>").append("尾页").addClass("sr-only")));
            var firstPageLi = $("<li></li>").attr("style","cursor:pointer").addClass("page-item").append($("<a></a>").addClass("page-link").click(function () {
                callback(pageNmb - 1);
            }).attr("aria-lable","Previous")
                .append($("<span></span>").append("&laquo;").attr("aria-hidden","true")).append($("<span></span>").append("上一页").addClass("sr-only")));
            var prePageLi =  $("<li></li>").attr("style","cursor:pointer").addClass("page-item").append($("<a></a>").addClass("page-link").attr("aria-lable","Next").click(function () {
                callback(pageNmb + 1);
            })
                .append($("<span></span>").append("&raquo;").attr("aria-hidden","true")).append($("<span></span>").append("下一页").addClass("sr-only")));
            //添加首页
            ul.append(homePageLi);
            //添加前一页
            ul.append(firstPageLi);
            //1,2，3遍历给ul中添加页码提示
            $.each(data.navigatepageNums,function(index,item){
                var numLi = $("<li></li>").attr("style","cursor:pointer").append($("<a></a>").append(item).addClass("page-link"));
                if(data.pageNum == item){
                    numLi.addClass("page-item active");
                }
                numLi.click(function(){
                    callback(item);
                });
                ul.append(numLi);
            });
            //添加下一页
            ul.append(prePageLi);
            //添加尾页
            ul.append(backPageLi);
            //把ul加入到nav
            var navEle = $("<nav></nav>").attr("aria-label","Page navigation example").append(ul);
            navEle.appendTo("#page_nav_area");
        }
    //添加用户事件
         $("#btn_add").click(function () {
            if (usernameCheck && passwordCheck && emailCheck){
                 $.ajax({
                     url: "${PATH_HOME}/add",
                     data: $(".from_add").serialize(),
                     type: "POST",
                     success: function (data) {
                         $("#staticName").prop("class","form-control");
                         $("#inputPassword").prop("class","form-control");
                         $("#staticEmail").prop("class","form-control");
                         $("#exampleModal").modal('hide');
                         $("#exampleModal form")[0].reset();
                         callback(endNmb);
                     }
                 });
             }else {
                if (!usernameCheck){
                    $("#username_add").empty();
                    $("#username_add").append("请检查用户名格式，里面至少包含5-8位英文或数字！");
                    $("#staticName").prop("class","form-control is-invalid");
                }
            if (!passwordCheck){
                $("#inputPassword").prop("class","form-control is-invalid");
            }
            if (!emailCheck){
                $("#staticEmail").prop("class","form-control is-invalid");
            }
        }
    });
</script>
</body>
</html>
