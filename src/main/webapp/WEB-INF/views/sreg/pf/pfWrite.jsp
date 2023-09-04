<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-save').addEventListener('click', ()=>save())
	        document.querySelector('.btn-search').addEventListener('click', ()=>search())
	    })

		function cancle() {
			location.href='/sreg/pf'
		}
	     
	    function save() {
			let obj = $('form[name="frm"]').serializeObject()
			const rrn = document.querySelector('#frontRrn').value + "-" + document.querySelector('#backRrn').value
			obj.rrn = rrn
            console.log(obj)
            
            $.ajax({
                method : 'PUT',
                url : '/sreg/pf/api/write',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/sreg/pf'
                
            }).fail(function(res) {
				console.log(res)
				console.log(res.responseJSON.trace)
                console.log(res.responseText)
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

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container">
        <form name="frm">
		    <div class="row">
			    <div class="col">학과</div>
			    <div class="col">
                    <input type="hidden" name="deptId" class="form-control" readonly>
                    <input type="text" name="deptName" class="form-control" readonly>
			    </div>
			    <div class="col">
			       <button type="button" class="btn btn-primary btn-search"
		                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
			    </div>
		    </div>
		    
		    <div class="row">
			    <div class="col">주민등록번호</div>
			    <div class="col">
			       <input type="text" id="frontRrn" name="rrn" class="form-control" maxlength="6">
			    </div>
			       -
			    <div class="col">
			       <input type="text" id="backRrn" name="rrn" class="form-control" maxlength="7">
			    </div>
		    </div>
		    
		    <div class="row">
			    <div class="col">교수명</div>
			    <div class="col"><input type="text" name="name" class="form-control"></div>
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
			    <div class="col"><input type="text" name="address" class="form-control"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">이메일</div>
			    <div class="col"><input type="text" name="email" class="form-control"></div>
		    </div>
		    
		    <div class="row">
			    <div class="col">프로필</div>
			    <div class="col"><input type="text" name="profile" class="form-control"></div>
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
            <button type="button" class="btn btn-primary btn-save">등록</button>
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
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>