<%--
  User: 오세훈
  Date: 2023/09/09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호찾기</title>
  <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>

  <script>
    document.addEventListener("DOMContentLoaded", function(){
        document.querySelector('.btn-submit').addEventListener('click', ()=>findPw())
    })

    function findPw() {
        let obj = $('form[name="frm"]').serializeObject()
        const rrn = document.querySelector('#frontRrn').value + "-" + document.querySelector('#backRrn').value
        obj.rrn = rrn
        console.log(obj)

        $.ajax({
            method : 'POST',
            url : '/member/api/find/pw',
            data : obj

        }).done(function(res) {
            alert(res)

        }).fail(function(res) {
            alert(res)
        })
    }
  </script>

    <style>
        html,
        body {
            height: 100%;
        }

        .form-signin {
            max-width: 500px;
            padding: 1rem;
        }
    </style>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
    <main class="form-signin w-100 m-auto">
        <form name="frm">
            <img class="mb-4" src="/img/icia-logo2.png" alt="" width="295">
            <h1 class="h3 mb-3 fw-normal">비밀번호찾기</h1>

            <div class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text p-3 w-25" style="background-color : #F6AB00"><b>아이디</b></span>
                        <input type="text" class="form-control" name="userId">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text p-3" style="background-color : #F6AB00"><b>주민등록번호</b></span>
                        <input type="text" id="frontRrn" name="rrn" class="form-control" maxlength="6">
                        <span class="input-group-text">-</span>
                        <input type="password" id="backRrn" name="rrn" class="form-control" maxlength="7">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col text-center">
                    <a href="/login" class="link-offset-2 link-underline link-underline-opacity-0">로그인</a>
                    <div class="vr"></div>
                    <a href="/member/find/id" class="link-offset-2 link-underline link-underline-opacity-0">아이디찾기</a>
                </div>
            </div>
        </form>
        <button class="btn text-white w-100 py-2 my-3 btn-submit" type="submit" style="background-color : #0B1B40">확인</button>
    </main>
</body>
</html>
