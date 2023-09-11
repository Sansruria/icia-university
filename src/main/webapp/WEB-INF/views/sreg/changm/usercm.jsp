<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 헤더 정보 -->
</head>
<body>
    <!-- JSP 페이지 내용 -->
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>UserName</th>
                <th>UserRole</th>
                <th>UpdateRole</th>
                <th>Email</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="u">
                <tr>
                    <td>${u.st_id}</td>
                    <td>${u.st_name}</td>
                    <td>${u.username}</td>
                    <td>${u.userRole}</td>
                    <td>
                        <select name="role">
                            <option value="ROLE_SELLER">ROLE_SELLER</option>
                            <option value="ROLE_USER">ROLE_USER</option>
                        </select>
                    </td>
                    <td>${u.email}</td>
                 
                    <td>
                        <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                            업데이트
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
