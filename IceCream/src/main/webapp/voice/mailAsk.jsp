<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <title>ICECREAM</title>
    <!-- 다음 Maps API -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63&libraries=services"></script>
   
   <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
	
	<script src="../se2/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../script/mailAskCheck.js?v=3"></script>
<style type="text/css">
body {
    background-color: #dee9ff;
} 

.registration-form {
    padding: 50px 0;
}

.registration-form form {
    background-color: #fff;
    max-width: 800px;
    margin: auto;
    padding: 50px 70px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .form-icon {
    text-align: center;
    background-color: #5891ff;
    border-radius: 50%;
    font-size: 40px;
    color: white;
    width: 100px;
    height: 100px;
    margin: auto;
    margin-bottom: 50px;
    line-height: 100px;
}

.registration-form .item {
    border-radius: 20px;
    margin-bottom: 25px;
    padding: 10px 20px;
}

.registration-form .create-account {
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;
    background-color: #5791ff;
    border: none;
    color: white;
    margin-top: 20px;
}
}
</style>

</head>
<body>
<header class="smallHeader">
    <h1>고객 문의</h1>
</header>
    <div class="registration-form">
        <form action="mailAskResult.do" name="frm" method="post" id="frm">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            
            <div class="form-group">
                <input type="text" class="form-control item" id="recipient" name="recipient"
                    placeholder="받는사람 메일주소">
            </div>
            <div class="form-group">
                 <input type="text" class="form-control item" id="title" name="title"
                    placeholder="제목">
            </div>
            <div class="form-group">
                    <textarea name="content" id="content" style="width: auto; height: 200px" placeholder="내용을 입력해 주세요"></textarea>
                <script type="text/javascript">
                    let oEditors = [];
                    nhn.husky.EZCreator.createInIFrame({
                        oAppRef: oEditors,
                        elPlaceHolder: "content",
                        sSkinURI: "../se2/SmartEditor2Skin.html",
                        fCreator: "createSEditor2"
                    });

                    function submitContent() {
                        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
                    }
                </script>
                  
                    
            </div>
            <div class="form-group" >
                <button type="button" class="btn btn-block create-account" onclick="submitContent(); voiceMailCheck()">문의하기</button>
            </div>
            
            <div class="form-group" >
                <button type="button" class="btn btn-block create-account" onclick="back()">취소</button>
            </div>
        </form>

    </div>
    <script type="text/javascript"
        src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <!-- <script src="assets/js/script.js"></script> -->
    
    <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../script/scripts.js"></script>
</body>
</html>