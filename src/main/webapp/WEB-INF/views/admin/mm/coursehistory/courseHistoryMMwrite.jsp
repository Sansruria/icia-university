<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강내역 등록</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>

<script>
	
	$( document ).ready(function() {
		// 등록
		$('#btn-close').click(function() {
			location.href = '/admin/mm/courselist/list';//등록 취소버튼
		})
		//찾아보기 버튼
		$('.btn-search').click(function(){
			search();
		})
// 		$('.btn-search').click(()=>search())
		//등록 버튼
		$('.btn-save').click(function(){
			save();
		})
	});
	
	function save() {
		let obj = $('form[name="frm"]').serializeObject()
		const course_time = document.querySelector('#inputstartDepartment').value + "~" + document.querySelector('#inputendDepartment').value
		obj.course_time = course_time
        console.log(obj)
        
        $.ajax({
            method : "Post",
            url : '/admin/mm/coursehistory/api/write',
            data : obj
            
        }).done(function(res) {//성공 했을떄
            alert(res)
            location.href = '/admin/mm/courselist/list'
            
        }).fail(function(res) {//실패 했을떄
            console.log(res)
        })
	}
	
	function search() {//찾아보기 했을떄
		$.ajax({
		    method : "GET",
		    url : '/admin/mm/dept/api/list'
		    
		}).done(function(res) {//성공 했을떄
		    document.querySelector("#modal-body").innerHTML = res
		    
		}).fail(function(res) {//실패 했을떄
		    console.log(res)
		})
	}
	function selected(id, name) {
	    $('#searchModal').modal('hide')//모달참 숨기기()
        document.querySelector('#deptId').value = id//학과명안에 id속성이 같아야 입력가능
        document.querySelector('#deptName').value = name
	}
	// 	등록	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<form name="frm">
		<div class="form-control"
			style="padding: 10px; font-size: 14px; width: 40%; margin: 0 auto; text-align: center;">
			<div class="col">
				<label for="inputSubject" class="form-label">과목명</label> 
				<input type="text" id="inputSubject" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_name}"></c:out>">
			</div>
			<div class="col mb-2">
				<label for="inputDepartment" class="form-label">학과명</label> 
				<input type="hidden" id="deptId" class="form-control" value="<c:out value="${stDto.deptId}"></c:out>"readonly>
				<input type="text" id="deptName" class="form-control" value="<c:out value="${stDto.deptName}"></c:out>"readonly>
			</div>
			<div class="col">
			<button type="button" class="btn btn-primary btn-search"
		                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
			</div>
			<div class="col">
				<label for="inputSubject" class="form-label">이수구분</label> 
				<input type="text" id="inputSubject" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_division}"></c:out>">	
			</div>
			<div class="col">
				<label for="inputDepartment" class="form-label">수강시작기간</label> <input
					type="text" id="inputstartDepartment" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_start_period}"></c:out>">
			</div>
			<div class="col">
				<label for="inputDepartment" class="form-label">수강종료기간</label> <input
					type="text" id="inputendDepartment" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_end_period}"></c:out>">
			</div>
			<div class="col mb-3">
				<label for="inputDepartment" class="form-label">수강신청최대인원</label> <input
					type="text" id="inputDepartment" class="form-control" value="<c:out value="${CourseHistoryMMDto.limit_max_count}"></c:out>">
			</div>

			<div class="row">
				<div class="col text-end">
					<button type="button" class="btn btn-secondary" id="btn-close">←취소</button>
<!-- 					document.querySelector('.btn-close') // class 선택자 -->
<!-- 					document.querySelector('#btn-close') // id 선택자 -->
<!-- 					document.querySelector('input[name="name"]') // name 선택자  -->
					<button type="button" class="btn btn-primary btn-save">📖등록</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- Search Modal -->
    <div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="searchModalLabel">학과명</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          
          <div class="modal-body">
            <div class="row">
                <div class="col">번호</div>
                <div class="col">학과번호</div>
                <div class="col">학과명</div>
            </div>
            
            <div id="modal-body"></div>
          </div>
          
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary btn-close-searchModal" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
<!--     end Search Modal -->
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	
</body>
</html>