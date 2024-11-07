<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AGIT</title>
</head>
<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
    margin: 0 auto;
    padding: 0;
    font-family: 'NanumSquareRound';
    overflow: hidden;
    box-sizing: border-box;
    letter-spacing: -1px;
}
a{
    text-decoration: none;
}
.nav{
    width: 306px; height: 100%;
    background-color: #F4DABF;
    position: fixed;
    margin: 0;
    margin-left: 227px;
    display: flex;
    flex-direction: column;
}
.nav > img{
    width: 182px; height: 80px;
    margin: 46px auto;
}
.nav > .menu{
    width: 182px; height: 560px;
    display: flex;
    flex-direction: column;
}
.menu > label{
    font-weight: 700;
    font-size: 40px;
    margin-top: 37px;
    margin-right: 0px;
}
.menu > label > a{
    color: #A98467;
}
.menu > label > a:hover{
    color: #7C604B;
    font-weight: 800;
}
.undermenu{
    display: flex;
    flex-direction: column;
    margin-right: 20px;
    margin-top: 80px;
}
.undermenu > label{
    padding-top: 10px;
}
.undermenu > label > a{
    color: #A98467;
    font-size: 30px;
    font-weight: 300;
    text-decoration: underline;
}
.undermenu > label > a:hover{
    color: #7C604B;
    font-weight: 500;
}
</style>
<body>
    <div class="nav">
        <img src="./img/logo.png">
        <div class="menu">
            <label for="mypage"><a href="#">마이페이지</a></label>
            <label for="score"><a href="#">성적</a></label>
            <label for="advice"><a href="#">상담신청</a></label>
            <label for="community"><a href="#">커뮤니티</a></label>
            <label for="photo"><a href="#">행사사진</a></label>
        </div>
        <div class="undermenu">
            <label for="info"><a href="#">정보수정</a></label>
            <label for="logout"><a href="#">로그아웃</a></label>
        </div>
    </div>
</body>
</html>