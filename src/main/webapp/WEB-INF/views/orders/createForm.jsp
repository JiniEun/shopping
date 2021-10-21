<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>orders</title>
<meta charset="utf-8">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.wname.value == "") {
			alert("글쓴이를 입력하세요");
			f.wname.focus()
			return false;
		}
		if (f.title.value == "") {
			alert("제목를 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == '') {
			window.alert('내용을 입력해 주세요.');
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10" style="margin-bottom: 50px;">주문하기</h2>
		<br> <br>
		<form class="form-horizontal" action="/orders/pay" method="post"
			onsubmit="return checkIn(this)">
			<div class="row">

				<div class="col-md-1" style="border: 1px solid gray; padding: 10px;">
					<p>주문자 정보</p>
					<p>${dto.id}</p>
					<p>${dto.mname}</p>
				</div>

				<div class="col-md-9">
					<div class="form-group">
						<label class="control-label col-sm-2" for="contentsno">상품번호</label> 
						<label class="control-label col-sm-2" for="pname">상품명</label>
						<label class="control-label col-sm-2" for="quantity">수량</label>
					</div>
					<c:forEach var="d" items="${list}">
						<div class="form-group">
							<div class="col-sm-2" style="text-align:right;">
								<p>${d.contentsno}</p>
							</div>
							<div class="col-sm-2">
								<p>${d.pname}</p>
							</div>
							<div class="col-sm-2" style="text-align:right;">
								<p>${d.quantity}</p>
							</div>
						</div>
					</c:forEach>

					<div class="form-group">
						<label class="control-label col-sm-2" for="title">할인 및 포인트</label>
						<div class="col-sm-8">
							<p>보유 포인트</p>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="content">결제 수단</label>
						<div class="col-sm-4">
							<input type="checkbox" name="payment" value="crediCard"
								style="margin-right: 10px;" /><label for="creditCard">Credit
								card</label>
						</div>
						<div class="col-sm-4">
							<input type="checkbox" name="payment" value="virtualAccount"
								style="margin-right: 10px;" /><label for="virtualAccount">Virtual
								Account</label>
						</div>
						<div class="col-sm-4">
							<input type="checkbox" name="payment" value="pay"
								style="margin-right: 10px;" /><label for="pay">Pay</label>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5" style="margin-top: 30px;">
							<button class="btn btn-default">결제하기</button>
							<button type="button" class="btn btn-default"
								onclick="history.back()">취소</button>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
