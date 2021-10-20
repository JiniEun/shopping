<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>삭제</title>
<meta charset="utf-8">
<style type="text/css">
#red {
  color: red;
}
</style>
</head>
<body>
  <div class="container">

    <h2 class="col-sm-offset-2 col-sm-10">삭제</h2>
    <form class="form-horizontal" action="/contents/delete" method="post">
      <input type="hidden" name="contentsno" value="${contentsno}">

      <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>

      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
          <button type="submit" class="btn btn-default" >삭제</button>
          <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
        </div>
      </div>
    </form>

  </div>
</body>
</html>