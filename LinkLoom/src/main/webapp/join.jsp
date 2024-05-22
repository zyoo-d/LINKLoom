<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>LINKLOOM</title>

<%@ include file="/inc/asset.jsp" %>

<style>

</style>
</head>

<body>
	<!-- 비회원 전용 템플릿입니다.  -->
	<%@ include file="/inc/header_visit.jsp" %>

	<!-- 회원가입 시작화면입니다. -->
	<div class="container">
	<h2>LINKLOOM 회원가입</h2>
        <form action="" method="post">
            <div class="form-group">
                <label for="agreement">필수약관 동의</label>
                <input type="checkbox" id="agreement" name="agreement" required>
                <span>필수 약관에 모두 동의합니다.</span>
            </div>
            <div class="form-group">
                <label for="phone">휴대폰 본인인증</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="01012345678" required>
                <button type="button" class="btn custom-btn" onclick="verifyPhone()">본인인증</button>
            </div>
	</form>
	</div>
	<%@ include file="/inc/footer.jsp" %>
	<script>
	 function verifyPhone() {
         // 휴대폰 본인인증 로직 구현
         alert("본인인증이 완료되었습니다.");
     }
	</script>
</body>
</html>