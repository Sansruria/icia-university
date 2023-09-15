<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학과계열관리</title>
    
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-save').addEventListener('click', ()=>save())
            document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-delete').addEventListener('click', ()=>del())
            document.querySelector('.btn-search').addEventListener('click', ()=>search())
            document.querySelector('.btn-reset').addEventListener('click', ()=>reset())
            document.querySelector('#paging').innerHTML = "${paging}"

            if ('${searchDto.deptLineName}' != null || '${searchDto.deptLineName}' != '') {
                document.searchFrm.querySelector('input[name="deptLineName"]').value = '${searchDto.deptLineName}'
            }
        })
    
        function save() {
            const obj = $('form[name="frm"]').serializeObject()
            console.log(obj)
            
            $.ajax({
                method : 'PUT',
                url : '/admin/mm/deptline/api/write',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/deptline'
                
            }).fail(function(res) {
                console.log(res)
            })
        }
        
        function update() {
            const obj = $('form[name="detailFrm"]').serializeObject()
            console.log(obj)
            
            $.ajax({
                method : 'PATCH',
                url : '/admin/mm/deptline/api/update',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/deptline'
                
            }).fail(function(res) {
                console.log(res)
            })
        }
        
        function del() {
            const deptLineId = document.detailFrm.querySelector('input[name="deptLineId"]').value
            
            $.ajax({
                method : 'DELETE',
                url : '/admin/mm/deptline/api/delete/' + deptLineId
                
            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/deptline'
                
            }).fail(function(res) {
                console.log(res)
            })
        }
        
        function detail(id) {
            $.ajax({
                method : 'GET',
                url : '/admin/mm/deptline/api/detail/' + id
                
            }).done(function(res) {
                document.detailFrm.querySelector('input[name="deptLineId"]').value = res['deptLineId']
                document.detailFrm.querySelector('input[name="deptLineName"]').value = res['deptLineName']
                document.detailFrm.querySelector('input[name="createDate"]').value = res['createDate']
                
            }).fail(function(res) {
                console.log(res)
            })
        }

        function search() {
            document.searchFrm.submit()
        }

        function selectedPage(pageNum) {
            document.searchFrm.querySelector('input[name="nowPage"]').value = pageNum
            search()
        }
        function prev() {
            document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.startPage - 1 }'
            search()
        }

        function next() {
            document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.endPage + 1 }'
            search()
        }

        function reset() {
            document.searchFrm.reset()
            search()
        }
    </script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<div class="container">
    <div class="row mb-3 mt-3">
        <h3>학과계열관리</h3>
    </div>

    <div class="row">
        <div class="card bg-light">
            <div class="card-body py-4">
            
                <div class="row">
                    <div class="col">
                        <form name="searchFrm" action="/admin/mm/deptline" method="GET">
                            <input type="hidden" name="nowPage" value="<c:out value="${searchDto.startPage}"></c:out>">
                            <input type="hidden" name="cntPerPage" value="<c:out value="${searchDto.cntPerPage}"></c:out>">

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text bg-primary-subtle w-25 p-3">학부명</span>
                                        <input type="text" class="form-control" name="deptLineName" placeholder="검색할 학과계열명을 입력해주세요.">
                                        <button type="button" class="btn btn-primary btn-search">검색</button>
                                        <button type="button" class="btn btn-secondary btn-reset">초기화</button>
                                    </div>
                                </div>
                            </div>
                        </form>
	                    <div class="table-responsive text-center">
	                       <table class="table table-bordered table-hover">
	                           <thead class="table-primary">
	                               <tr>
		                               <th>번호</th>
		                               <th>학과계열번호</th>
		                               <th>학과계열명</th>
	                               </tr>
	                           </thead>
	                           <tbody>
	                               <c:forEach var="deptLine" items="${deptLineList}">
	                                   <tr>
	                                       <td>${deptLine.rnum}</td>
	                                       <td>${deptLine.deptLineId}</td>
	                                       <td>
	                                           <a href="#" onclick="detail('${deptLine.deptLineId}')"
	                                               data-bs-toggle="modal" data-bs-target="#detailModal" class="link-offset-2 link-underline link-underline-opacity-0">
	                                               ${deptLine.deptLineName}
	                                           </a>
                                           </td>
	                                   </tr>
	                               </c:forEach>
	                           </tbody>
	                       </table>

                            <div id="paging"></div>

	                    </div>
                    </div> <!-- end col -->
                    
                    <div class="col-4">
                        <form name="frm">
                            <div class="form-floating mb-3">
							  <input type="text" class="form-control" id="deptLineId" name="deptLineId" placeholder="학과계열 고유번호를 입력해주세요.">
							  <label for="deptLineId">학과계열번호</label>
							</div>
							<div class="form-floating mb-3">
							  <input type="text" class="form-control" id="deptLineName" name="deptLineName" placeholder="학과계열명을 입력해주세요.">
							  <label for="deptLineName">학과계열명</label>
							</div>
                        </form>
                        
                        <div class="row">
                            <div class="mb-3 text-lg-end">
                                <button type="button"
                                   class="input-group-text btn btn-primary btn-save">
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
                                        <input type="text" name="deptLineId" class="form-control-plaintext" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="table-primary align-middle">학과계열명</th>
                                    <td>
                                        <input type="text" name="deptLineName" class="form-control">
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
                
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    
</body>
</html>