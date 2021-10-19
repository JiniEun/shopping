<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
  <script type="text/JavaScript">
 $(function() {
	 CKEDITOR.replace('detail'); // <TEXTAREA>태그 id 값
	 });

 function checkIn(f){
     if (f.pname.value == ""){
             alert("상품명을 입력하세요");
             f.pname.focus()
             return false;
     }
     if (f.price.value == ""){
             alert("가격을 입력하세요");
             f.price.focus();
             return false;
     }
     if (CKEDITOR.instances['detail'].getData() == '') {
         window.alert('내용을 입력해 주세요.');
         CKEDITOR.instances['detail'].focus();
         return false;
     }
     if (f.stock.value == ""){
             alert("재고를 입력하세요");
             f.stock.focus();
             return false;
     }
}
 </script>
</head>
<body> 

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">상품 수정</h1>
<form class="form-horizontal" 
      action="/contents/update"
      method="post"
      onsubmit="return checkIn(this)">
  <input type="hidden" name="contentsno" value="${contentsno}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="cateno">상품분류</label>
    <div class="col-sm-6">
      <select class="form-control" name="cateno">
        <option value="1"
        <c:if test= "${dto.cateno==1}"> selected </c:if>
        >Jean</option>
        <option value="2"
        <c:if test= "${dto.cateno==2}"> selected </c:if>
        >Bag</option>
        <option value="3"
        <c:if test= "${dto.cateno==3}"> selected </c:if>
        >Shoes</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pname">상품명</label>
    <div class="col-sm-8">
      <input type="text" name="pname" id="pname" class="form-control" value="${dto.pname }">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="price">가격</label>
    <div class="col-sm-8">
      <input type="text" name="price" id="price" class="form-control" value="${dto.price }">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="detail">상세정보</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="detail" name="detail" class="form-control">${dto.detail }</textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="stock">재고</label>
    <div class="col-sm-6">
      <input type="text" name="stock" id="stock" class="form-control" value="${dto.stock }">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 