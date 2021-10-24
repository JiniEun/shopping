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
		<h2>장바구니</h2>
		<form class="form-horizontal" action="/orders/pay" method="post"
			onsubmit="return checkIn(this)">
			<div class="panel panel-default">

				<div class="panel-heading">
					<h4>주문자 정보</h4>
				</div>

				<div class="panel-body">
					<p> id : ${dto.id}</p>
					<p> name : ${dto.mname}</p>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading clearfix">
					<div class="panel-title">

						<div class="col-sm-2" style="text-align: center;">
							<h4>상품번호</h4>
						</div>
						<div class="col-sm-2" style="text-align: center;">
							<h4>상품명</h4>
						</div>
						<div class="col-sm-2" style="text-align: center;">
							<h4>수량</h4>
						</div>
					</div>
				</div>
				<c:forEach var="d" items="${list}">
					<div class="panel-body">
						<div class="col-sm-2" style="text-align: center;">
							<p>${d.contentsno}</p>
						</div>
						<div class="col-sm-2">
							<p>${d.pname}</p>
						</div>
						<div class="col-sm-2" style="text-align: center;">
							<p>${d.quantity}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">할인 및 포인트</div>

				</div>
				<div class="panel-body">
					<p>보유 포인트</p>
				</div>

				<div class="panel-heading">
					<div class="panel-title">결제 수단</div>

				</div>
				<div class="panel-body">
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

				<div class="panel-footer" style="margin-top: 30px;">
					<button class="btn btn-default">결제하기</button>
					<button type="button" class="btn btn-default"
						onclick="history.back()">취소</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>
