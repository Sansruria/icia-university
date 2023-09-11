<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수강내역등록</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
            document.querySelector('.btn-save').addEventListener('click', ()=>save())
            document.querySelector('.btn-search').addEventListener('click', ()=>openSearchModal())
        })

        function cancle() {
            location.href='/admin/mm/course/history'
        }

        function save() {
            let obj = $('form[name="frm"]').serializeObject()
            const rrn = document.querySelector('#frontRrn').value + "-" + document.querySelector('#backRrn').value
            obj.rrn = rrn
            console.log(obj)

            $.ajax({
                method : 'PUT',
                url : '/sreg/st/api/write',
                data : obj

            }).done(function(res) {
                alert(res)
                location.href = '/sreg/st'

            }).fail(function(res) {
                console.log(res)
            })
        }

        function openSearchModal() {
            $('.modal-content').load('/sreg/pf/modal/list')
        }
    </script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container d-flex justify-content-center">
        <div class="w-50">
            <div class="card">
                <div class="card-body">
                    <div class="p-4">

                        <form name="frm">
                            <input type="hidden" name="pfId" readonly>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학수번호</span>
                                        <input type="text" class="form-control" name="courseId" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학과명</span>
                                        <input type="text" class="form-control" name="deptName" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">교수명</span>
                                        <input type="text" class="form-control" name="pfName" readonly>
                                        <button type="button" class="btn btn-primary btn-search"
                                                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <div class="row mt-4 text-end">
                <div class="col">
                    <button type="button" class="btn btn-secondary btn-cancle">취소</button>
                    <button type="button" class="btn btn-primary btn-save">등록</button>
                </div>
            </div>
        </div>
    </div> <!-- end Container -->

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

    <!-- Search Modal -->
    <div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <!-- end Search Modal -->
</body>
</html>