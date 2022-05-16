<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--    
jsp의 스크립트 요소                    
  1. 스크립트릿(Scriptlet) : <% %>               자바코드  
  2. 표현식(Expression): <%= %>                자바코드지만 ';' 오면 안 됨 
  3. 선언부(Declaration): <%! %>               자바에 함수 만들기. 권장되지 않음 
     --%>
<%
   int sum = 0;
   for(int i=1;i<=100;i++){
	   sum+=i;
   }
%>     

<%
  //servlet에 전역 변수가 된다.
  String[] str = {"jsp가","재미","있다"};
%>   
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>jsp의 스크립트 요소</h2>
		<hr/>
    <div>
      <p>1~100 합계는:<%=sum %></p>
    </div>
    <div>
      <%
         for(int i=0;i<str.length;i++){
        	 out.println("<p>"+str[i]+"</p>");
         }
      %>
    </div>
</body>
</html>