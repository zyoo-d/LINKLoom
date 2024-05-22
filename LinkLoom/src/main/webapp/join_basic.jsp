<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>LINKLOOM</title>

<%@ include file="/inc/asset.jsp"%>

<style>
.modal-body input[type="text"] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
</head>

<body>
	<!-- 비회원 전용 템플릿입니다.  -->
	<%@ include file="/inc/header_visit.jsp"%>

	<!-- 일반회원가입 페이지입니다. -->
	<div class="container">
		<h2>회원가입</h2>
		<form action="" method="post">
			<div class="form-group">
				<label for="name">이름</label>
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" id="last-name"
							name="last-name" title="성을 한글자 이상 입력하세요." placeholder="성">
					</div>
					<div class="col">
						<input type="text" class="form-control" id="first-name"
							name="first-name" title="이름을 한글자 이상 입력하세요." placeholder="이름">
					</div>
				</div>
			</div>
			<div class="form-group">
    <label for="email">아이디(이메일)</label>
    <div class="input-group">
        <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요." required>
        <span class="input-group-text">@</span>
        <input type="text" id="domain" name="domain" class="form-control" placeholder="직접입력" />
        <select id="domain-list" class="form-select" onchange="selectDomain()">
            <option value="">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="yahoo.com">yahoo.com</option>
            <option value="kakao.com">kakao.com</option>
            <option value="msn.com">msn.com</option>
        </select>
        <button type="button" id="checkId" class="btn btn-primary">중복확인</button>
    </div>
</div>
			<div class="form-group">
				<label for="nickname">닉네임</label> <input type="text"
					class="form-control" id="nickname" name="nickname"
					placeholder="한글, 영문, 숫자 5자 이내" required>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="password" name="password"
							placeholder="특수문자(!, @, #, $, %, ^, &, *) 1개 포함 5자 이상 입력하세요.">
					</div>
					<div class="col">
						<label for="password">비밀번호 확인</label> <input type="password"
							class="form-control" id="confirm-password"
							name="confirm-password" placeholder="입력한 비밀번호와 동일한 비밀번호를 입력하세요.">
						<span id="pwCheckError" class="tomato"></span>
					</div>
				</div>
				<span id="password-mismatch-message"
					style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
			</div>

			<div class="form-group">
				<label for="topic">대표 관심사</label>
				<button type="button" class="btn custom-btn" data-bs-toggle="modal"
					data-bs-target="#topicModal">선택</button>
				<input type="text" class="form-control" id="topic" name="topic"
					placeholder="선택 버튼을 클릭하여 대표관심사 설정" readonly required>

			</div>
			<button type="submit" class="btn custom-btn">회원가입</button>
		</form>
	</div>

	<div class="modal fade" id="topicModal" tabindex="-1"
		aria-labelledby="topicModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="topicModalLabel">대표 관심사 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="text" id="searchInput" placeholder="검색어를 입력하세요"
						onkeyup="filterTopics()">
					<div id="topicList" class="list-group">

						<a href="#" class="list-group-item list-group-item-action"
							onclick="selectTopic('뉴스 및 블로그')">뉴스 및 블로그</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('쇼핑')">쇼핑</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('소셜 미디어(SNS)')">소셜 미디어(SNS)</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('엔터테인먼트')">엔터테인먼트</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('음악')">음악</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('사진 및 비디오')">사진 및 비디오</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('영화 및 TV프로그램')">영화 및 TV프로그램</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('예술 및 디자인')">예술 및 디자인</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('연극 및 뮤지컬')">연극 및 뮤지컬</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('도서 및 문학')">도서 및 문학</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('패션 및 뷰티')">패션 및 뷰티</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('인테리어 및 가구')">인테리어 및 가구</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('라이프스타일')">라이프스타일</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('육아 및 가족')">육아 및 가족</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('애완동물')">애완동물</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('자동차 및 오토바이')">자동차 및 오토바이</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('관광 명소')">관광 명소</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('여행 및 여가')">여행 및 여가</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('취미 및 수집')">취미 및 수집</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('게임')">게임</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('요리 및 레시피')">요리 및 레시피</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('음식')">음식</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('트렌드')">트렌드</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('식당 및 카페')">식당 및 카페</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('교육 및 학문')">교육 및 학문</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('외국어')">외국어</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('학습')">학습</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('커리어 및 직업')">커리어 및 직업</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('건강 및 의학')">건강 및 의학</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('스포츠 및 운동')">스포츠 및 운동</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('과학 기술')">과학 기술</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('자연 및 환경')">자연 및 환경</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('재테크 및 금융')">재테크 및 금융</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('사회 및 정치')">사회 및 정치</a> <a href="#"
							class="list-group-item list-group-item-action"
							onclick="selectTopic('행사 정보')">행사 정보</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="path/to/bootstrap.bundle.min.js"></script>
	<%@ include file="/inc/footer.jsp"%>
	<script>
	
	function selectDomain() {
	    var domainList = document.getElementById("domain-list");
	    var domainInput = document.getElementById("domain");
	    var selectedDomain = domainList.options[domainList.selectedIndex].value;

	    if (selectedDomain !== "") {
	        domainInput.value = selectedDomain;
	    } else {
	        domainInput.value = "";
	        domainInput.focus();
	    }
	}
	
		function filterTopics() {
			var input, filter, listItems, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			listItems = document.getElementById("topicList")
					.getElementsByTagName("a");

			for (i = 0; i < listItems.length; i++) {
				txtValue = listItems[i].textContent || listItems[i].innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					listItems[i].style.display = "";
				} else {
					listItems[i].style.display = "none";
				}
			}
		}

		
		function selectTopic(topic) {
			document.getElementById("topic").value = topic;
			var topicModal = bootstrap.Modal.getInstance(document
					.getElementById("topicModal"));
			topicModal.hide();
		}

		function validateForm() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirm-password").value;
			var passwordMismatchMessage = document
					.getElementById("password-mismatch-message");

			if (password !== confirmPassword) {
				passwordMismatchMessage.style.display = "block";
				return false;
			} else {
				passwordMismatchMessage.style.display = "none";
				return true;
			}
		}
	</script>
</body>
</html>