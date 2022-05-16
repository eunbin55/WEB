<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
  request 내장객체: 웹브라우저 요청에 대한 처리
  -클라이언트와 관련된 정보 읽기
  -서버와 관련된 정보
  -클라이언트가 요청한 전송 정보
  -클라이언트가 전송한 쿠키(ex.쇼핑몰 장바구니)
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>request 내장객체</h2>
		<hr/>
    서버포트 : <%=request.getServerPort() %><br/>
    서버이름 : <%=request.getServerName() %><br/>
  client ip : <%=request.getRemoteAddr() %><br/>
    요청정보 프로토콜 : <%=request.getProtocol() %><br/>
   요청 컨텍스 : <%=request.getContextPath() %><br/>
   서버URI : <%=request.getRequestURI() %>
   <%--
	   서버포트 : 8081
		서버이름 : 192.168.105.18
		client ip : 192.168.105.18
		요청정보 프로토콜 : HTTP/1.1
		요청 컨텍스 : /studyhtml5
		서버URI : /studyhtml5/jsp/j01/h06_request.jsp
    --%>
  
</body>
</html>