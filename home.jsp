<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>
    <link href="index.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
    <div class="header_top">
        <a href="#"><img class="img" src="logo.jpg"></a>
    </div>
    <div class="header_top2">
        <span class="namebar_line">인천일보 아카데미님(202041823)</span>
        <a class="my_page" href="#">내페이지</a>
        <a class="logout_link" href="#">로그아웃</a>
    </div>

    <ul>
        <!-- 학적 메뉴에 대한 드롭다운 -->
        <li class="tag dropdown">
            <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">학적</a>
            <ul class="dropdown-menu">
                <li><a href="#">개인정보 변경</a></li>
                <li><a href="#">휴/복학 신청</a></li>
                <li><a href="#">자퇴신청</a></li>
                <li><a href="#">전과신청</a></li>
                <li><a href="#">졸업자격 조회</a></li>
                <li><a href="#">학점 조회</a></li>
            </ul>
        </li>
        
        <!-- 수강 메뉴에 대한 드롭다운 -->
        <li class="water dropdown">
            <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">수강</a>
            <ul class="dropdown-menu">
                <li><a href="#">수강신청</a></li>
                <li><a href="#">수업계회서 조회</a></li>
                <li><a href="#">강의평가</a></li>
                <li><a href="#">학생시간표 출력</a></li>
            </ul>
        </li>

        <li class="flex"><a href="#">플리마켓</a></li>
        <li class="greeting"><a href="#">인사</a></li>
        <li class="system"><a href="#">시스템</a></li>
    </ul>
</header>
</body>
</html>