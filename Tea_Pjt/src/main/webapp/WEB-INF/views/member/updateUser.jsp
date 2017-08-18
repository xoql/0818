<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateUser회원정보수정</title>
<style>
	/* body{
		text-align: center;
	} */
	table{
		margin: 12px;
		width: 100%;
		font-size: 17px;
	}
	.tdDiv{
		margin: 12px;
	}
	.inputText{
		margin: 12px;
		width: 70%;
		height: 30px;
	}
	.button{
		margin: 12px;
		margin-top: 30px;
		width: 40%;
		height: 30px;
	}
	#birthDiv{
		margin: 12px;
	}
	.birthText{
		width: 20%;
		height: 30px;
	}
	#genderDiv{
		margin: 12px;
	}
	.radio{
		font-size: 30px;
		margin: 12px;
	}
	.emailText{
		margin: 12px;
		width: 30%;
		height: 30px;
	}
	.radio{
		font-size: 30px;
	}
	#telDiv{
		margin: 12px;
	}
	.telText{
		width: 10%;
		height: 30px;
		text-align: center;
	}
	.addressDiv{
		margin-left: 12px;
		margin-top: 8px;
	}
	.inputAddress{
		width: 35%;
		height: 30px;
	}
	#buttonAddress{
		height: 30px;
	}
</style>
<script>
	$(function(){
		var pass_check;	//비밀번호 일치 여부
		var pass = $("#password").val();
		var pass2 = $("#password2").val();
		var passMsg = $("#passMsg"); //비밀번호 일치 여부 message
		$("#password2").blur(function(){
			if(pass!=pass2){
				passMsg.html("<font color='red'>비밀번호가 일치하지 않습니다.");
				pass_check = false;
			}else{
				if(pass2==null){
					passMsg.html("<font color='red'>비밀번호를 입력해주세요.");
					pass_check = false;
				}else{
					passMsg.text("비밀번호가 일치합니다.");
					pass_check = true;
				}
			}
		});
	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;

               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('sample6_address').value = fullAddr;

               // 커서를 상세주소 필드로 이동한다.
               document.getElementById('sample6_address2').focus();
           }
       }).open();
   }
</script>
</head>
<body>
	<%@include file="../include/menu.jsp" %>
	<form action="updateUser.do" method="post">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>회원 정보 수정</h3>
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<div class="tdDiv">
									${user.user_id}
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="inputText" type="password" name="password" id="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input class="inputText" type="password" name="password2" id="password2"><label id="passMsg"></label>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<div class="tdDiv">
									${user.user_name}
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<div class="tdDiv">
									${user.birth}
								</div>
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<c:if test="${user.gender=='M'}">
								<td>
									<div id="genderDiv">
										<label><input class="radio" type="radio" name="gender" value="M" checked="checked">남성</input></label>
										<label><input class="radio" type="radio" name="gender" value="F">여성</input></label>
									</div>
								</td>
							</c:if>
							<c:if test="${user.gender=='F'}">
								<td>
									<div id="genderDiv">
										<label><input class="radio" type="radio" name="gender" value="M">남성</input></label>
										<label><input class="radio" type="radio" name="gender" value="F" checked="checked">여성</input></label>
									</div>
								</td>
							</c:if>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<div id="telDiv">
									<c:choose>
										<c:when test="${user.tel1==010}">
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010" selected="selected">010</option>
												<option name="tel1" value="011">011</option>
												<option name="tel1" value="016">016</option>
												<option name="tel1" value="017">017</option>
												<option name="tel1" value="018">018</option>
												<option name="tel1" value="019">019</option>
											</select>
										</c:when>
										<c:when test="${user.tel1==011}">
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010">010</option>
												<option name="tel1" value="011" selected="selected">011</option>
												<option name="tel1" value="016">016</option>
												<option name="tel1" value="017">017</option>
												<option name="tel1" value="018">018</option>
												<option name="tel1" value="019">019</option>
											</select>
										</c:when>
										<c:when test="${user.tel1==016}">
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010">010</option>
												<option name="tel1" value="011">011</option>
												<option name="tel1" value="016" selected="selected">016</option>
												<option name="tel1" value="017">017</option>
												<option name="tel1" value="018">018</option>
												<option name="tel1" value="019">019</option>
											</select>
										</c:when>
										<c:when test="${user.tel1==017}">
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010">010</option>
												<option name="tel1" value="011">011</option>
												<option name="tel1" value="016">016</option>
												<option name="tel1" value="017" selected="selected">017</option>
												<option name="tel1" value="018">018</option>
												<option name="tel1" value="019">019</option>
											</select>
										</c:when>
										<c:when test="${user.tel1==018}">
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010">010</option>
												<option name="tel1" value="011">011</option>
												<option name="tel1" value="016">016</option>
												<option name="tel1" value="017">017</option>
												<option name="tel1" value="018" selected="selected">018</option>
												<option name="tel1" value="019">019</option>
											</select>
										</c:when>
										<c:otherwise>
											<select class="telText" id="tel1" name="tel1">
												<option name="tel1" value="010">010</option>
												<option name="tel1" value="011">011</option>
												<option name="tel1" value="016">016</option>
												<option name="tel1" value="017">017</option>
												<option name="tel1" value="018">018</option>
												<option name="tel1" value="019" selected="selected">019</option>
											</select>
										</c:otherwise>
									</c:choose>
									- <input class="telText" id="tel2" type="text" name="tel2" value="${user.tel2}">
									- <input class="telText" id="tel3" type="text" name="tel3" value="${user.tel3}">
								</div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input class="emailText" id="email1" type="text" name="email1" value="${user.email1}"> @ <input class="emailText" id="email2" type="text" name="email2" value="${user.email2}" >
							</td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
							<td>
								<div class="addressDiv">
									<input type="post" 	 class="inputAddress" name="address1" id="sample6_postcode" placeholder="우편번호" value="${user.address1}">
									<input type="button" id="buttonAddress" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="addressDiv">
									<input type="addess" class="inputAddress" name="address2" id="sample6_address" value="${user.address2}">
									<input type="addess" class="inputAddress" name="address3" id="sample6_address2" value="${user.address3}">
								</div>
							</td>
						</tr>
					</table>
				<input class="button" type="submit" value="수정완료">
				<input class="button" type="reset" value="다시 입력">
			</div>
			<div class="col-md-3"></div>
		</div>
	</form>
</body>
</html>