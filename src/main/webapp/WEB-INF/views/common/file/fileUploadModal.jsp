<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	document.addEventListener("DOMContentLoaded", function(){
	    document.querySelector('.btn-save').addEventListener('click', ()=>save())
	})
	
	function save() {
// 		const uploadFiles = document.querySelector('input[name="uploadFiles"]').value
		const frm = document.querySelector('form[name="frm"]')
		const formData = new FormData(frm)
		
		$.ajax({
		    method : "POST",
		    url    : "/file/api/profile/upload",
		    data   : formData,
		    contentType : false,
	        processData : false
	        
		}).done(function(res) {
			console.log('등록되었습니다.')
			
			let userId = '${memberInfo.userId}';
			if (userId.substr(0,2) == 'P') {
				location.href = '/sret/pf/main'
			}
			else {
				location.href='/sreg/st/main'
			}
			
		}).fail(function(res) {
			console.log('res :', res)
		})
	}
</script>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="modalLabel">프로필 사진 변경</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
    <div class="row">
        <div class="p-4">
            <form name="frm">
                <input class="form-control" type="file" id="formFile" name="uploadFiles">
            </form>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
    <button type="button" class="btn btn-primary" onclick="save()">저장</button>
</div>