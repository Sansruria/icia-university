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
            document.querySelector('.btn-search-save').addEventListener('click', ()=>openSearchModal(false))
            document.querySelector('#paging').innerHTML = "${paging}"
        })

        function save() {
            const obj = $('form[name="frm"]').serializeObject()

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

        function detail(id) {
            $('.modal-content-detail').load('/admin/mm/faculty/modal/detail/' + id)
        }

        function openSearchModal(isUpdate) {
            let url = '/admin/mm/deptline/modal/list'

            if (isUpdate === true) {
                // $('#detailModal').modal('hide')
                url = '/admin/mm/deptline/modal/mm/list'
                console.log("url :", url)
            }

            $('.modal-content-search').load(url)
        }
    </script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<div class="container">
    <div class="row mb-3 mt-3"><h3>학부관리</h3></div>

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
                                               data-bs-toggle="modal" data-bs-target="#detailModal" style="cursor:pointer"
                                               class="link-offset-2 link-underline link-underline-opacity-0">
                                                    ${faculty.facultyName}
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div id="paging"></div>
                    </div>

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
            </div>
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

<!-- detail modal -->
<div class="modal fade" id="detailModal" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-content-detail">
        </div>
    </div>
</div>
<!-- end modal -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>