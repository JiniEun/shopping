<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
</head>
<body>
 
<div class="container">
  <div class="row">
  <div class="col-sm-3">
  <h3><span class="glyphicon glyphicon-user"></span> 나의 정보</h3>
  <img class="img-rounded" src="/member/storage/${dto.fname}" style="width:280px">${dto.fname}
    <div class="caption">
    <p>ID:${dto.id}, 성명:${dto.mname}, 마일리지:9000원</p>
    <p>배송지:(${dto.zipcode })${dto.address1 }  ${dto.address2}</p>
  </div>
  </div>
  <div class="col-sm-6">
  <h3><span class="glyphicon glyphicon-gift"></span> 주문 내역 및 리뷰 작성</h3>
  <ul class="list-group">
   <c:choose>
    <c:when test="${empty dto.list }">주문한 상품이 없습니다.</c:when>
    
    <c:otherwise>
    <c:forEach var="order" items="${dto.list}">
    <li class="list-group-item">${fn:substring(order.odate,0,10)}, ${order.pname},${order.quantity}, ${order.total }원
     <a href="review/create/{order.contentsno}"><span class="badge">Rivew</span></a></li>
    </c:forEach>
    </c:otherwise>
    </c:choose>
  </ul>
  </div>
  </div>
</div>
 
</body>
</html>