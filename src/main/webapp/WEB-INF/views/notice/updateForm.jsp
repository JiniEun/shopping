<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>
<meta charset="utf-8">

</head>
<body>

  <div class="container">
    <h1 class="col-sm-offset-2 col-sm-10">게시판 수정</h1>
    <form class="form-horizontal" action="/notice/update" method="post">
      <input type="hidden" name="noticeno" value="${dto.noticeno}">
      <div class="form-group">
        <label class="control-label col-sm-2" for="wname">작성자</label>
        <div class="col-sm-6">
          <input type="text" name="wname" id="wname" class="form-control" value="${dto.wname}">
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-2" for="title">제목</label>
        <div class="col-sm-8">
          <input type="text" name="title" id="title" class="form-control" value="${dto.title}">
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="content">내용</label>
        <div class="col-sm-8">
          <textarea rows="12" cols="7" id="content" name="content" class="form-control">${dto.content}</textarea>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="passwd">비밀번호</label>
        <div class="col-sm-6">
          <input type="password" name="passwd" id="passwd" class="form-control">
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
          <button class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
