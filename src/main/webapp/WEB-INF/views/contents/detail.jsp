<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 상세 페이지</title>
<meta charset="utf-8">

<script type="text/javascript">

	function updateM() {
		var url = "../admin/contents/update/${dto.contentsno}";
		location.href = url;
	}
	
	function deleteM() {
		var url = "../admin/contents/delete/${dto.contentsno}";
		location.href = url;
	}

	function listM() {
		var url = "./list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
	
	function mainlistM() {
		var url = "./mainlist/${dto.cateno}";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>

</head>
<body>
  <div class="container">

    <h2>상품 상세 페이지</h2>
    <div class="panel panel-default">
      <div class="panel-heading">상품번호</div>
      <div class="panel-body">${dto.contentsno}</div>

      <div class="panel-heading">상품명</div>
      <div class="panel-body">${dto.pname}</div>
      
      <div class="panel-heading">상품 이미지</div>
      <div class="panel-body">
      	<img src="/pstorage/${dto.filename}"  class="img-rounded" width="300px" height="300px">
	  </div>
	
      <div class="panel-heading">상품 설명</div>
      <div class="panel-body">${dto.detail}</div>

      <div class="panel-heading">가격</div>
      <div class="panel-body">${dto.price}</div>

      <div class="panel-heading">등록일</div>
      <div class="panel-body">${dto.rdate}</div>

    </div>
    <div>
    <c:choose>
    <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
      <button type="button" class="btn btn-default" onclick="location.href='../admin/contents/create'">등록</button>
      <button type="button" class="btn btn-default" onclick="updateM()">수정</button>
      <button type="button" class="btn btn-default" onclick="deleteM()">삭제</button>
      <button type="button" class="btn btn-default" onclick="listM()">목록</button>
      </c:when>
      <c:otherwise>
      <button type="button" class="btn btn-default">장바구니 담기</button>
      <button type="button" class="btn btn-default" onclick="mainlistM()">목록</button>
      </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>
</html>