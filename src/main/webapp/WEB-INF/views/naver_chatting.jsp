<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9093/naver_chatting</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">  <%--/static 폴더 기준 --%>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%-- WebSocket 관련 설정 --%>
<script src="/js/sockjs.min.js"></script>  <%--/static 폴더 기준 --%>
<script src="/js/stomp.min.js"></script>  <%--/static 폴더 기준 --%>

<script type="text/JavaScript" src="/js/app.js"></script>  <%--/static 폴더 기준 --%>
          
</head>
<body>
<div id="main-content" class="container">
    <H2>개발 가이드</H2>
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">웹소켓 연결:</label>
                    <button id="connect" class="btn btn-default" type="submit">연결</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제</button>
                </div>
            </form>
            <form class="form-inline">
                <div class="form-group" style="width: 90%;">
                    <label for="msg">문의</label>
                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요...." value="배송은 얼마나 걸리나요?"  style="width:90%;">
                </div>
                <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
            </form>


    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>메세지</th>
                </tr>
                </thead>
                <tbody id="communicate">
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>