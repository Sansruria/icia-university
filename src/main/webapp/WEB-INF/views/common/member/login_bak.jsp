<%--
  User: 오세훈
  Date: 2023/09/09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>

    <script>
        document.addEventListener("DOMContentLoaded", function(){
            if ('${msg}' != '') {
              alert('${msg}')
            }
        })
    </script>

    <style>
        html,
        body {
          height: 100%;
        }

        .form-signin {
          max-width: 330px;
          padding: 1rem;
        }

        .form-signin .form-floating:focus-within {
          z-index: 2;
        }

        .form-signin input[type="text"] {
          margin-bottom: -1px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
          margin-bottom: 10px;
          border-top-left-radius: 0;
          border-top-right-radius: 0;
        }
    </style>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
  <main class="form-signin w-100 m-auto">
    <form action="/login" method="POST">
      <img class="mb-4" src="/img/icia-logo2.png" alt="" width="295">
      <h1 class="h3 mb-3 fw-normal">로그인</h1>

      <div class="form-floating">
        <input type="text" class="form-control" id="userId" name="userId" placeholder="학번 및 교수번호를 입력해주세요" value="admin">
        <label for="userId">학번 및 교수번호</label>
      </div>

      <div class="form-floating">
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="1234">
        <label for="password">비밀번호</label>
      </div>

      <div class="row">
        <div class="col text-center">
          <a href="/member/find/id" class="link-offset-2 link-underline link-underline-opacity-0">아이디찾기</a>
          <div class="vr"></div>
          <a href="/member/find/pw" class="link-offset-2 link-underline link-underline-opacity-0">비밀번호찾기</a>
        </div>
      </div>

      <button class="btn text-white w-100 py-2 my-3" type="submit" style="background-color : #0B1B40">로그인</button>
    </form>
  </main>
</body>
</html>
