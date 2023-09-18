<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생수정</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
	    })

		function cancle() {
			const id = document.querySelector('input[name="noticeId"]').value
			location.href='/common/notice/' + id
		}

	    function update() {
			let obj = $('form[name="frm"]').serializeObject()

            $.ajax({
                method : 'PATCH',
                url : '/common/notice/api/update',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/common/notice'
                
            }).fail(function(res) {
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
							<input type="hidden" name="noticeId" value="<c:out value="${noticeDto.noticeId}"></c:out>">

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">제목</span>
										<input type="text" class="form-control" name="title" value="<c:out value="${noticeDto.title}"></c:out>">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<div class="form-floating">
										  <textarea class="form-control" placeholder="내용을 적어주세요" id="floatingTextarea" name="contents" style="height:300px"><c:out value="${noticeDto.contents}"></c:out></textarea>
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
					<button type="button" class="btn btn-primary btn-update">수정</button>
				</div>
			</div>
		</div>

    </div> <!-- end Container -->
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>