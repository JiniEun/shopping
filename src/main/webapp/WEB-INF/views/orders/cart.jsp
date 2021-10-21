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
<h3> 장바구니 </h3>
<c:choose>   
<c:when test="${empty list}">
   <div class="row">
   <div class="col-sm-3">
   <h4>장바구니가 비어 있습니다.</h4> 
       <button type="button" class="btn btn-lg">쇼핑 계속하기</button>
   </div>
   </div>
</c:when>
<c:otherwise>
<c:set var="list" value="${list}"/>
<div class="row">
<div class="col-sm-3">
    <button type="button" class="btn btn-lg">전체 상품 주문</button>
    <button type="button" class="btn btn-lg">선택 상품 주문</button>
    <button type="button" class="btn btn-lg">쇼핑 계속하기</button>
</div>
</div>
</c:otherwise></c:choose>
</div>
</body>
</html>