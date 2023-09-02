<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"
        integrity="sha512-Gn0tSSjkIGAkaZQWjx3Ctl/0dVJuTmjW/f9QyB302kFjU4uTNP4HtA32U2qXs/TRlEsK5CoEqMEMs7LnzLOBsA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
	<script>
		let genderVal = '<c:out value="${pfDto.gender}"></c:out>'
		genderVal = (genderVal == '1') ? "남" : "여"
		let nationalVal = '<c:out value="${pfDto.national}"></c:out>'

		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-delete').addEventListener('click', ()=>del())
			document.querySelector('#gender').innerText = genderVal

			switch (nationalVal) {
				case "KR":
					nationalVal = "한국"
					break
				case "JP":
					nationalVal = "일본"
					break
				case "CN":
					nationalVal = "중국"
					break
				case "US":
					nationalVal = "미국"
					break
				case "UK":
					nationalVal = "영국"
					break
			}
			document.querySelector('#national').innerText = nationalVal
	    })

		function cancle() {
			location.href='/sreg/pf'
		}
		
		function update() {
			const id = document.querySelector('#pfId').value
			location.href = '/sreg/pf/update/' + id
		}
		
		function del() {
			const id = document.querySelector('#pfId').value

			$.ajax({
				method : "DELETE",
				url : '/sreg/pf/api/delete/' + id

			}).done(function(res) {
				alert(res)
				location.href = '/sreg/pf'

			}).fail(function(res) {
				console.log(res)
			})
		}
	</script>
</head>

<body>

    <div class="container">
		<input type="hidden" id="pfId" value="<c:out value="${pfDto.pfId}"></c:out>">

		<div class="row">
			<div class="col">교수번호</div>
			<div class="col"><c:out value="${pfDto.pfId}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">학과명</div>
			<div class="col"><c:out value="${pfDto.deptName}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">주민등록번호</div>
			<div class="col"><c:out value="${pfDto.rrn}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">교수명</div>
			<div class="col"><c:out value="${pfDto.name}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">이메일</div>
			<div class="col"><c:out value="${pfDto.email}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">성별</div>
			<div class="col" id="gender"></div>
		</div>

		<div class="row">
			<div class="col">프로필</div>
			<div class="col"><c:out value="${pfDto.profile}"></c:out></div>
		</div>

		<div class="row">
			<div class="col">국적</div>
			<div class="col" id="national"></div>
		</div>

        <div class="row">
            <button type="button" class="btn btn-secondary btn-cancle">취소</button>
            <button type="button" class="btn btn-danger btn-delete">삭제</button>
            <button type="button" class="btn btn-primary btn-update">수정</button>
        </div>
    </div>
</body>
</html>