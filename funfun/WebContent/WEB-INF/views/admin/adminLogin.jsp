<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FunFun - 관리자 로그인</title>
        <link href="${path }/adminTemplate/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 로그인</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="${path}/admin-main.do">
                                            <div class="form-group"><label class="small mb-1" for="inputAdminCode">관리자코드</label><input class="form-control py-4" id="inputAdminCode" name="admin_code" type="text" placeholder="관리자 코드를 입력해주세요" /></div>
                                            <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input class="form-control py-4" id="inputPassword" name="admin_pw" type="password" placeholder="비밀번호를 입력해주세요" /></div>
                                            <div class="form-group">
                                            	<!-- <div class="custom-control custom-checkbox"><input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" /><label class="custom-control-label" for="rememberPasswordCheck">비밀번호 기억하기</label></div> -->
                                            </div>
                                            <!-- <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="btn btn-primary" style="width:100%;" href="${path }/admin-main.do">로그인</a></div> -->
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="btn btn-primary loginBtn" style="width:100%;" >로그인</a></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; FunFun 2020</div>
                            <div>
                                <a>FunFun Admin</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path }/adminTemplate/js/scripts.js"></script>
        <script type="text/javascript">
        	$(document).ready(function(){
        		var admin_code="${param.admin_code}";
        		if(admin_code != ""){
        			alert("관리자코드와 비밀번호를 다시 확인해주세요.");
        		}
        		
        		$(".loginBtn").click(function(){
        			if(isNaN($("[name=admin_code]").val())){
	        			alert("관리자코드는 숫자입니다.");
	        		}else{
	        			$("form").submit();
	        		}
	        	});
        	});
        </script>
    </body>
</html>
