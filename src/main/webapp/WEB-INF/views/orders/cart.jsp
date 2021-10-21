<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<script>
  	function detail(contentsno) {
		var url = "../contents/detail";
		url += "?contentsno=" + contentsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
    
    function selectAll(selectAll)  {
   	  const checkboxes = document.getElementsByName('content_check');
   	  
   	  checkboxes.forEach((checkbox) => {
   	    checkbox.checked = selectAll.checked;
   	  })
   }
  </script>
</head>
<body>

	<div class="container">
		<h2>장바구니</h2>
		<br>
		<c:choose>
			<c:when test="${empty list}">
				<div class="row">
					<div class="col-sm-3">
						<h4>장바구니가 비어 있습니다.</h4>
						<button type="button" class="btn btn-lg text-white"
							style="background-color: #585858; color: white;"
							onclick="location.href='./'">쇼핑 계속하기</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:set var="list" value="${list}" />
				<div class="row" style="text-align: center;">
					<div class="col-sm-2" style="height:25.33;"><h3>
						<input type='checkbox' name='checkall' value='selectall'
							style="zoom:1.5;" onclick='selectAll(this)' /></h3>
					</div>
					<div class="col-sm-2">
						<h3>이미지</h3>
					</div>
					<div class="col-sm-2">
						<h3>상품명</h3>
					</div>
					<div class="col-sm-2">
						<h3>상품 가격</h3>
					</div>
					<div class="col-sm-2">
						<h3>선택</h3>
					</div>
				</div>
				<br>
				<c:forEach var="dto" begin="0" end="3" items="${list}">
					<div class="row" style="text-align: center;">
						<div class="col-sm-2"
							style="text-align: center; vertical-align: middle;">
							<label><input type="checkbox" name="content_check"
								style="zoom:1.5;" value="${dto.contentsno}"></label>
						</div>
						<div class="col-sm-2"
							style="text-align: center; vertical-align: middle;">
							<a href="javascript:detail('${dto.contentsno}')">
								<p>
									<img src="/pstorage/${dto.filename }" class="img-thumbnail"
										width="100" height="auto">
								</p>
							</a>
						</div>
						<div class="col-sm-2"
							style="text-align: center; vertical-align: middle;">
							<p>${dto.pname }</p>
						</div>
						<div class="col-sm-2">
							<p>
								<b>${dto.total}</b>
							</p>
						</div>
						<div class="col-sm-2"
							style="display: table-cell; vertical-align: middle;">
							<button type="button" class="btn btn-lg text-white"
								style="background-color: white;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z" />
									<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z" /> </svg>
							</button>
						</div>
					</div>
				</c:forEach>

				<div class="row">
					<div class="col-sm-2">
						<button type="button" class="btn btn-lg text-white"
							style="background-color: #585858; color: white;">전체 상품
							주문</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-lg">선택 상품 주문</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-lg">쇼핑 계속하기</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>