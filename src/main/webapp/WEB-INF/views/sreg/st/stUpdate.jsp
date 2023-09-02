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
		let rrnVal = '<c:out value="${stDto.rrn}"></c:out>'
		rrnVal = rrnVal.split("-")
		const genderVal = '<c:out value="${stDto.gender}"></c:out>'
		const nationalVal = '<c:out value="${stDto.national}"></c:out>'

		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
	        document.querySelector('.btn-search').addEventListener('click', ()=>search())
			document.querySelector('#frontRrn').value = rrnVal[0]
			document.querySelector('#backRrn').value = rrnVal[1]

			const genders = document.querySelectorAll('input[name="gender"]')
			genders.forEach(gender=>{
				if (gender.value == genderVal) {
					gender.checked = true
				}
			})

			let nationals = document.querySelector('select[name="national"]')
			nationals = nationals.options

			for (const option of nationals) {
				if (option.value == nationalVal) {
					option.selected = true
				}
			}
	    })

		function cancle() {
			location.href='/sreg/st'
		}

	    function update() {
			let obj = $('form[name="frm"]').serializeObject()
			const rrn = document.querySelector('#frontRrn').value + "-" + document.querySelector('#backRrn').value
			obj.rrn = rrn 

            $.ajax({
                method : 'PATCH',
                url : '/sreg/st/api/update',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/sreg/st'
                
            }).fail(function(res) {
                console.log(res)
            })
		}

		function search() {
			$.ajax({
			    method : "GET",
			    url : '/admin/mm/dept/api/list'
			    
			}).done(function(res) {
			    document.querySelector("#modal-body").innerHTML = res
			    
			}).fail(function(res) {
			    console.log(res)
			})
		}
		   
		function selected(id, name) {
		    $('#searchModal').modal('hide')
	        document.frm.querySelector('input[name="deptId"]').value = id
	        document.frm.querySelector('input[name="deptName"]').value = name
		}
	</script>
</head>

<body>

    <div class="container">
        <form name="frm">
			<input type="hidden" name="stId" value="<c:out value="${stDto.stId}"></c:out>">

		    <div class="row">
			    <div class="col">학과</div>
			    <div class="col">
                    <input type="hidden" name="deptId" class="form-control" value="<c:out value="${stDto.deptId}"></c:out>" readonly>
                    <input type="text" name="deptName" class="form-control" value="<c:out value="${stDto.deptName}"></c:out>" readonly>
			    </div>
			    <div class="col">
			       <button type="button" class="btn btn-primary btn-search"
		                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
			    </div>
		    </div>
		    
		    <div class="row">
			    <div class="col">주민등록번호</div>
			    <div class="col">
			       <input type="text" id="frontRrn" name="rrn" class="form-control">
			    </div>
			       -
			    <div class="col">
			       <input type="text" id="backRrn" name="rrn" class="form-control">
			    </div>
		    </div>
		    
		    <div class="row">
			    <div class="col">학생명</div>
			    <div class="col"><input type="text" name="name" class="form-control" value="<c:out value="${stDto.name}"></c:out>"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">성별</div>
			    <div class="col">
                    <input type="radio" id="male" name="gender" class="" value="1">
                    <label for="male">남자</label>
                    <input type="radio" id="female" name="gender" class="" value="0">
                    <label for="female">여자</label>
			    </div>
		    </div>
		    
		    <div class="row">
			    <div class="col">주소</div>
			    <div class="col"><input type="text" name="address" class="form-control" value="<c:out value="${stDto.address}"></c:out>"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">이메일</div>
			    <div class="col"><input type="text" name="email" class="form-control" value="<c:out value="${stDto.email}"></c:out>"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">프로필</div>
			    <div class="col"><input type="text" name="profile" class="form-control" value="<c:out value="${stDto.profile}"></c:out>"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">국적</div>
			    <div class="col">
			       <select name="national" class="form-select">
			           <option>-전체-</option>
			           <option value="KR">한국</option>
			           <option value="JP">일본</option>
			           <option value="US">미국</option>
			           <option value="UK">영국</option>
			           <option value="CN">중국</option>
			       </select>
			    </div>
		    </div>
        </form>
        
        <div class="row">
            <button type="button" class="btn btn-secondary btn-cancle">취소</button>
            <button type="button" class="btn btn-danger btn-delete">삭제</button>
            <button type="button" class="btn btn-primary btn-update">수정</button>
        </div>
    </div>
    
    <!-- Search Modal -->
    <div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="searchModalLabel">학과계열</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          
          <div class="modal-body">
            <div class="row">
                <div class="col">번호</div>
                <div class="col">학과계열번호</div>
                <div class="col">학과계열명</div>
            </div>
            
            <div id="modal-body"></div>
          </div>
          
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary btn-close-searchModal" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- end Search Modal -->
</body>
</html>