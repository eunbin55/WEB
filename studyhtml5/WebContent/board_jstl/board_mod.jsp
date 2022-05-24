<%@page import="com.pcwk.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/com/common.jsp" %>
    
<%--     <% --%>
//      BoardVO vo = (BoardVO)request.getAttribute("vo");
//     if(null == vo){
//       vo = new BoardVO();
//     }
<%--     %> --%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=contPath %>/favicon.ico">


<!--reset 스타일 시트 -->
<!-- link rel="stylesheet" type="text/css" href="<%=contPath %>/asset/css/reset.css" -->
<link rel="stylesheet"  type="text/css" href="<%=contPath %>/asset/css/jquery-ui.css">
<!--스타일 시트 -->
<style type="text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-1.12.4.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=contPath %>/asset/js/common.js"></script>

</head>
<body>
    <h2>게시 상세</h2>
    <hr/>
    <div width="600">
      <input type="button" value="수정" id="doUpdate">
      <input type="button" value="삭제" id="doDelete">
      <input type="button" value="목록" id="moveToList">
    </div>
    <form action="<%=contPath %>/board/board.do" name="boardFrm" id="boardFrm">
      <input type="hidden" name="seq" id="seq" value="${vo.seq}">
      <input type="hidden" name="work_div" id="work_div">
      <table width="600px">
        <tr>
          <td width="100">제목</td>
          <td width="500"><input type="text" name="title" id="title" maxlength="200" size="50" value="${vo.title}"></td>
        </tr>
        <tr>
          <td width="100">등록자</td>
          <td width="500"><input value="${vo.regId}" type="text" name="reg_id" id="reg_id" maxlength="50" size="50" readonly="readonly"></td>
        </tr>
        <tr>
          <td width="100">등록일</td>
          <td width="500"><input value="${vo.regDt}" type="text" name="regDt" id="regDt" maxlength="50" size="50" readonly="readonly"></td>
        </tr>
        <tr>
          <td width="100">수정자</td>
          <td width="500"><input value="${vo.modId}" type="text" name="mod_id" id="mod_id" maxlength="50" size="50"></td>
        </tr>
        <tr>
          <td width="100">수정일</td>
          <td width="500"><input value="${vo.modDt}" name="modDt" id="modDt" maxlength="50" size="50" readonly="readonly"></td>
        </tr>
        <tr>
          <td width="100">조회수</td>
          <td width="500"><input value="${vo.readCnt}" type="text" name="readCnt" id="readCnt" maxlength="50" size="50" readonly="readonly"></td>
        </tr>
        <tr>
          <td colspan="2">내용</td>
        </tr>
        <tr>
          <td colspan="2"><textarea rows="5" cols="68" name="contents" id="contents">${vo.contents}</textarea></td>
        </tr>
      </table>
    </form>
    
<script type="text/javascript">
			$('#doUpdate').on('click',function(){
			    console.log('#doUpdate');
			    
			    let title = $('#title').val();
			    if(isEmpty(title) || title.trim().length == 0){
			    	//focus
			    	$('#title').focus();
			    	alert('제목을 입력하세요.');
			    	return;
			    }
			    
			    title = title.trim();
			    
			    let modId = $('#mod_id').val();
			    
			    console.log('isEmpty(modId):'+isEmpty(modId));
			    
			    if(isEmpty(modId) || modId.trim().length == 0){
			    	$('#mod_id').focus();
			    	alert('수정자 ID를 입력하세요.');
			    	return;
			    }

			    modId = modId.trim();
			    
			    let contents = $('#contents').val();
			    if(isEmpty(contents) || contents.trim().length == 0){
			    	$('#contents').focus();
		            alert('내용을 입력하세요.');
		            return;
			    }
			    
			    contents = contents.trim();
			    
			    if(false == confirm('수정하시겠습니까?'))return;
			    
			       $.ajax({
			           type: "POST",
			           url:"<%=contPath%>/board/board.do",
			           asyn:"true",
			           dataType:"html",
			           data:{
			             work_div:"doUpdate",
			             seq: $('#seq').val(),
			             title: title,
			             modId: modId,
			             contents: contents
			             
			           },
			           success:function(data){//통신 성공
			               //console.log("success data:"+data);
			        	     //string to json
			        	     
			        	     const jsonObj = JSON.parse(data);
			        	     
			        	     if(!isEmpty(jsonObj) && jsonObj.messageId == "1"){
			        	    	 console.log("1");
			        	    	 alert(jsonObj.msgContents);
			        	    	 
			        	    	 goList();
			        	     }else{
			        	    	 alert(jsonObj.msgContents);
			        	     }
			        	     
			        	     
			             },
			             error:function(data){//실패시 처리
			               console.log("error:"+data);
			             }
			         });
			    
			    
			  });

      $('#moveToList').on('click',function(){
    	  goList();
      });
      
      function goList() {
    	  const listURL = "/studyhtml5/board/board.do?work_div=doRetrieve";
          window.location.href = listURL;
	}

      $('#doDelete').on('click',function(){
    	  //console.log('#doDelete');
    	  
    	  //ajax
    	  
    	  let seq = $('#seq').val();
    	  if(null === seq || seq.length ===0){
    		  alert('seq를 확인하세요');
    		  return;
    	  }
    	  
    	  if(false === confirm("삭제하시겠습니까?"))return;
    	  
          $.ajax({
              type: "GET",
              url:"<%=contPath%>/board/board.do",
              asyn:"true",
              dataType:"html",
              data:{
                work_div:"doDelete",
                seq: seq
              },
              success:function(data){//통신 성공
                  console.log("success data:"+data);
                  // string - json
                  const jsonObj = JSON.parse(data);
                  console.log('messageId:'+jsonObj.messageId);
                  console.log('msgContents:'+jsonObj.msgContents);
                  
                  if(null != jsonObj && jsonObj.messageId =="1"){
                	  alert(jsonObj.msgContents);
                	  
                	  //Controller로 보내서 데이터 조회 가능하게
//                       const listURL = "/studyhtml5/board/board.do?work_div=doRetrieve";
//                       window.location.href = listURL;
                	  goList();
                  }else{
                	  alert(jsonObj.msgContents);
                  }
                  
              },
                error:function(data){//실패시 처리
                  console.log("error:"+data);
                }
            });
    	  
      });
</script>    
</body>
</html>