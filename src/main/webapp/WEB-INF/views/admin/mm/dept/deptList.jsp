<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학과관리</title>
    
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
        	document.querySelector('.btn-save').addEventListener('click', ()=>save())
            document.querySelector('.btn-search').addEventListener('click', ()=>search())
            document.querySelector('.btn-search-save').addEventListener('click', ()=>openSearchModal(false))
            document.querySelector('.btn-reset').addEventListener('click', ()=>reset())
            document.querySelector('#paging').innerHTML = "${paging}"
        })
        
        function save() {
            const obj = $('form[name="frm"]').serializeObject()
            console.log(obj)
            
            $.ajax({
                method : 'PUT',
                url : '/admin/mm/dept/api/write',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/dept'
                
            }).fail(function(res) {
                console.log(res)
            })
        }

        function detail(id) {
            $('.modal-content-detail').load('/admin/mm/dept/modal/detail/' + id)
        }

        function openSearchModal(isUpdate) {
            let url = '/admin/mm/faculty/modal/list'

            if (isUpdate === true) {
                // $('#detailModal').modal('hide')
                url = '/admin/mm/faculty/modal/mm/list'
                console.log("url :", url)
            }

            $('.modal-content-search').load(url)
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
        <h3>학과관리</h3>
    </div>

    <div class="row">
        <div class="card bg-light">
            <div class="card-body py-4">
            
                <div class="row">
                    <div class="col">
                        <form name="searchFrm" action="/admin/mm/dept" method="GET">
                            <input type="hidden" name="nowPage" value="<c:out value="${searchDto.startPage}"></c:out>">
                            <input type="hidden" name="cntPerPage" value="<c:out value="${searchDto.cntPerPage}"></c:out>">

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text bg-primary-subtle w-25 p-3">학과명</span>
                                        <input type="text" class="form-control" name="deptName" placeholder="검색할 학과명을 입력해주세요.">
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
	                                    <th>학부번호</th>
	                                    <th>학부명</th>
	                                    <th>학과번호</th>
	                                    <th>학과명</th>
	                                    <th>운영상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="dept" items="${deptList}">
                                        <tr>
                                            <td>${dept.rnum}</td>
                                            <td>${dept.facultyId}</td>
                                            <td>${dept.facultyName}</td>
                                            <td>${dept.deptId}</td>
                                            <td>
                                                <a href="#" onclick="detail('${dept.deptId}')"
                                                    data-bs-toggle="modal" data-bs-target="#detailModal" style="cursor:pointer" class="link-offset-2 link-underline link-underline-opacity-0">
                                                    ${dept.deptName}
                                                </a>
                                            </td>
                                            <td>
	                                            <c:if test="${dept.status eq '1'}">운영</c:if>
	                                            <c:if test="${dept.status eq '0'}">폐지</c:if>
                                            </td>
                                         </tr>
                                     </c:forEach>
                                 </tbody>
                             </table>

                            <div id="paging"></div>

                         </div>
                    </div>
                    
                    <div class="col-4">
                        <form name="frm">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="facultyId" name="facultyId" placeholder="학부 고유번호를 입력해주세요." readonly>
                                <label for="facultyId">학부번호</label>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="facultyName" name="facultyName" placeholder="학부명을 입력해주세요." readonly>
                                <label for="facultyName">학부명</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <button type="button" class="btn btn-primary btn-search-save"
                                        data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                                </div>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="deptId" name="deptId" placeholder="학과 고유번호를 입력해주세요.">
                                <label for="deptId">학과번호</label>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="deptName" name="deptName" placeholder="학과명을 입력해주세요.">
                                <label for="deptName">학과명</label>
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
            </div>
        </div>
    </div>

    <!-- search modal -->
    <div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-content-search">
            </div>
        </div>
    </div>
    <!-- end modal -->

    <!-- Detail Modal -->
    <div class="modal fade" id="detailModal" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-content-detail">
            </div>
        </div>
    </div>
    <!-- end Detail Modal -->
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    
</div>
</body>
</html>