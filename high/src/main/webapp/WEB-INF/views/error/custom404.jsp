<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error</title>
<link rel="stylesheet" href="../resources/css/reset.css">
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<style>
  .container {
     position:absolute; top:50%; left:50%;  text-align:center;
    transform:translate(-50%,-50%);
  }
 .container  p {font-size:24px; margin-top:10px;}
  img { width:200px; height:200px; margin:0 auto;}
  
 
  h1, h2{padding-top:30px; line-height:50px; }
  h1 { text-align:center;}
  
  .btn { line-height:26px; margin-top:20px;}
</style>
<body>
<div class=container>
   <h1>404 ERROR</h1>
   <img src="/resources/imgs/404page.jpg">
   <p>죄송합니다 페이지를 찾을수 없습니다.</p>
   <p>존재하지 않는 주소를 입력하셨거나</p>
   <p>요청하신 페이지 주소가 변경,삭제되어 찾을수 없습니다.</p>
   <a href="/"><button class="btn">홈으로</button></a>
</div>
</body>
</html>