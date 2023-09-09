<%--
  User: 오세훈
  Date: 2023/09/09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
  <script>
    document.addEventListener("DOMContentLoaded", function(){
      if ('${msg}' != '') {
        alert('${msg}')
      }
    })
  </script>
</head>
<body>
  <div class="row">
    <form action="/login" method="POST">
      <div class="col"><input type="text" name="userId" placeholder="아이디" value="admin"></div>
      <div class="col"><input type="text" name="password" placeholder="비밀번호" value="1234"></div>
      <div class="col"><button type="submit">로그인</button></div>
    </form>
    <a href="/">메인으로</a>
  </div>
</body>
</html>
