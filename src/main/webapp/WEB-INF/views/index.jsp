<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"
    integrity="sha512-Gn0tSSjkIGAkaZQWjx3Ctl/0dVJuTmjW/f9QyB302kFjU4uTNP4HtA32U2qXs/TRlEsK5CoEqMEMs7LnzLOBsA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script>
    	document.addEventListener("DOMContentLoaded", function(){
    	})
    	
	    function move(str) {
	        location.href='/admin/mm/' + str
	    }

        function move2(str) {
            location.href='/sreg/' + str
        }
	</script>
</head>

<body>
	<h1>index.jsp</h1>
	<div class="row">
      <div class="col">
        <button type="button" onclick="move('deptline')" class="btn btn-primary mb-3">학과계열</button>
        <button type="button" onclick="move('faculty')" class="btn btn-primary mb-3">학부</button>
        <button type="button" onclick="move('dept')" class="btn btn-primary mb-3">학과</button>
        <button type="button" onclick="move2('st')" class="btn btn-primary mb-3">학생</button>
        <button type="button" onclick="move2('pf')" class="btn btn-danger mb-3">교수</button>
      </div>
    </div>
</body>

</html>