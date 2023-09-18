<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생등록</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-save').addEventListener('click', ()=>save())
	    })

		function cancle() {
			location.href='/common/notice'
		}
	     
	    function save() {
			let obj = $('form[name="frm"]').serializeObject()
			console.log('obj :', obj)
            
            $.ajax({
                method : 'PUT',
                url : '/common/notice/api/write',
                data : obj
                
            }).done(function(res) {//성공 했을떄
                alert(res)
                location.href = '/common/notice'
                
            }).fail(function(res) {//실패 했을떄
                console.log(res)
            })
		}
	</script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container d-flex justify-content-center">

		<div class="w-100">
			<div class="card">
				<div class="card-body">
					<div class="p-4">
						<form name="frm">

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">제목</span>
										<input type="text" class="form-control" name="title">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<div class="form-floating">
										  <textarea class="form-control" placeholder="내용을 적어주세요" id="floatingTextarea" name="contents" style="height:300px"></textarea>
										  <label for="floatingTextarea">내용</label>
										</div>
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
</body>
</html>