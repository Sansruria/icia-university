<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학부관리</title>
    
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
        	document.querySelector('.btn-save').addEventListener('click', ()=>save())
            document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-delete').addEventListener('click', ()=>del())
            document.querySelector('.btn-search-save').addEventListener('click', ()=>search('save'))
            document.querySelector('.btn-search-update').addEventListener('click', ()=>search('update'))
        })
	    
	    function save() {
	        const obj = $('form[name="frm"]').serializeObject()
	        console.log(obj)
	        
	        $.ajax({
	            method : 'PUT',
	            url : '/admin/mm/faculty/api/write',
	            data : obj
	            
	        }).done(function(res) {
	            alert(res)
	            location.href = '/admin/mm/faculty'
	            
	        }).fail(function(res) {
	            console.log(res)
	        })
	    }
	    
	    function update() {
	        const obj = $('form[name="detailFrm"]').serializeObject()
	        console.log(obj)
	        
	        $.ajax({
	            method : 'PATCH',
	            url : '/admin/mm/faculty/api/update',
	            data : obj
	            
	        }).done(function(res) {
	            alert(res)
	            location.href = '/admin/mm/faculty'
	            
	        }).fail(function(res) {
	            console.log(res)
	        })
	    }
	    
	    function del() {
	        const facultyId = document.detailFrm.querySelector('input[name="facultyId"]').value
	        
	        $.ajax({
	            method : 'DELETE',
	            url : '/admin/mm/faculty/api/delete/' + facultyId
	            
	        }).done(function(res) {
	            alert(res)
	            location.href = '/admin/mm/faculty'
	            
	        }).fail(function(res) {
	            console.log(res)
	        })
	    }
	    
	    function detail(id) {
	        $.ajax({
	            method : 'GET',
	            url : '/admin/mm/faculty/api/detail/' + id
	            
	        }).done(function(res) {
	            document.detailFrm.querySelector('input[name="deptLineId"]').value = res['deptLineId']
	            document.detailFrm.querySelector('input[name="deptLineName"]').value = res['deptLineName']
	            document.detailFrm.querySelector('input[name="facultyId"]').value = res['facultyId']
	            document.detailFrm.querySelector('input[name="facultyName"]').value = res['facultyName']
	            document.detailFrm.querySelector('input[name="createDate"]').value = res['createDate']
	            
	        }).fail(function(res) {
	            console.log(res)
	        })
	    }
	    
	    function search(kind) {
	        $.ajax({
	            method : "GET",
	            url : "/admin/mm/deptline/api/list/" + kind
	            
	        }).done(function(res) {
	        	console.log("res : ", res)
	            document.querySelector("#modal-body").innerHTML = res
	            if (kind == 'update') {
	                document.querySelector('.btn-close-searchModal').setAttribute('data-bs-target', '#detailModal') 
	                document.querySelector('.btn-close-searchModal').setAttribute('data-bs-toggle', 'modal') 
	            }
	            else {
	                document.querySelector('.btn-close-searchModal').removeAttribute('data-bs-target') 
	                document.querySelector('.btn-close-searchModal').removeAttribute('data-bs-toggle') 
	            }
	            
	        }).fail(function(res) {
	            console.log(res)
	        })
	    }
	    
	    function selected(id, name, kind) {
	        $('#searchModal').modal('hide')
	        
	        if (kind == 'save') {
	            document.frm.querySelector('input[name="deptLineId"]').value = id
	            document.frm.querySelector('input[name="deptLineName"]').value = name
	        }
	        else if (kind == 'update') {
	            document.detailFrm.querySelector('input[name="deptLineId"]').value = id
	            document.detailFrm.querySelector('input[name="deptLineName"]').value = name
	            $('#detailModal').modal('show')
	        }
	    }
    </script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<div class="container">
    <div class="row mb-3 mt-3">
        <h3>학부관리</h1>
    </div>

    <div class="row">
        <div class="card bg-light">
            <div class="card-body py-4">
            
                <div class="row">
                    <div class="col">
                        <div class="table-responsive text-center">
                            <table class="table table-bordered table-hover">
	                            <thead class="table-primary">
	                                <tr>
		                                <th>번호</th>
		                                <th>학과계열번호</th>
		                                <th>학과계열명</th>
		                                <th>학부번호</th>
		                                <th>학부명</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach var="faculty" items="${facultyList}">
	                                    <tr>
	                                        <td>${faculty.rnum}</td>
	                                        <td>${faculty.deptLineId}</td>
	                                        <td>${faculty.deptLineName}</td>
	                                        <td>${faculty.facultyId}</td>
	                                        <td>
	                                            <a href="#" onclick="detail('${faculty.facultyId}')"
	                                                data-bs-toggle="modal" data-bs-target="#detailModal" style="cursor:pointer" class="link-offset-2 link-underline link-underline-opacity-0">
	                                                ${faculty.facultyName}
	                                            </a>
	                                        </td>
	                                    </tr>
	                                </c:forEach>
	                            </tbody>
                            </table>
                        </div>
                    </div> <!-- end row -->
                    
                    <div class="col-4">
                        <form name="frm">
                            <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="deptLineId" name="deptLineId" placeholder="학과계열 고유번호를 입력해주세요." readonly>
	                            <label for="deptLineId">학과계열번호</label>
                            </div>
                            
                            <div class="row">
                                <div class="col">
		                            <div class="form-floating mb-3">
										<input type="text" class="form-control" id="deptLineName" name="deptLineName" placeholder="학과계열명을 입력해주세요." readonly>
										<label for="deptLineName">학과계열명</label>
		                            </div>
                                </div>
                                <div class="col-4">
	                                <button type="button" class="btn btn-primary btn-search-save"
	                                    data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                                </div>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="facultyId" name="facultyId" placeholder="학부 고유번호를 입력해주세요.">
                                <label for="facultyId">학부번호</label>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="facultyName" name="facultyName" placeholder="학부명을 입력해주세요.">
                                <label for="facultyName">학부명</label>
                            </div>
                        </form>
                        
                        <div class="row">
                            <div class="mb-3 text-lg-end">
                                <button type="button"
                                   class="input-group-text btn waves-effect waves-light btn-primary btn-save">
                                    <i class="mdi mdi-clipboard-edit me-1"></i>저장
                                </button>
                            </div>
                        </div>
                    </div>
                </div> <!-- end row -->
                
                <!-- Detail Modal -->
                <div class="modal fade" id="detailModal" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5" id="detailModalLabel">학과계열</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      
                      <div class="modal-body">
						<form name="detailFrm">
						  <table class="table table-bordered">
						      <tr>
						          <th class="table-primary align-middle">학과계열번호</th>
						          <td>
						              <input type="text" name="deptLineId" class="form-control" readonly>
						          </td>
						      </tr>
						      <tr>
						          <th class="table-primary align-middle">학과계열명</th>
						          <td>
						              <div class="row">
						                  <div class="col">
		                                    <input type="text" name="deptLineName" class="form-control" readonly>
		                                  </div>
			                              <div class="col">
			                                    <button type="button" class="btn btn-primary btn-search-update"
			                                        data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
			                              </div>
						              </div>
						          </td>
						      </tr>
						      <tr>
						          <th class="table-primary align-middle">학부번호</th>
						          <td>
						              <input type="text" name="facultyId" class="form-control-plaintext" readonly>
						          </td>
						      </tr>
						      <tr>
						          <th class="table-primary align-middle">학부명</th>
						          <td>
						              <input type="text" name="facultyName" class="form-control">
						          </td>
						      </tr>
						      <tr>
						          <th class="table-primary align-middle">등록일</th>
						          <td>
						              <input type="text" name="createDate" class="form-control-plaintext" disabled>
						          </td>
						      </tr>
						  </table>
						</form>
                      </div> <!-- ene modal-body -->
                      
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger btn-delete">삭제</button>
                        <button type="button" class="btn btn-primary btn-update">수정</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- end Detail Modal -->
                
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
                        <table class="table table-bordered table-hover text-center">
                            <thead class="table-primary">
                                <th>번호</th>
                                <th>학과계열번호</th>
                                <th>학과계열명</th>
                            </thead>
                            <tbody id="modal-body">
                            </tbody>
                        </table>
                      </div>
                      
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-close-searchModal" data-bs-dismiss="modal">닫기</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- end Search Modal -->
                
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>