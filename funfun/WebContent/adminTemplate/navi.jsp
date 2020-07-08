<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var manager_code = "${manager.admin_code}";
	//console.log("admin_code:" + manager_code+" admin_pw:${manager.admin_pw}");
	//console.log("admin_name:${manager.admin_name} admin_auth:${manager.admin_auth}");
	if(manager_code == ""){
		alert("관리자 로그인 페이지 이동");
		location.href="${path}/admin.do";
	}
</script>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="${path }/admin-main.do">FunFun Admin</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button
            ><!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
				<p style="color:white; margin-top:8px;">${manager.admin_name}</p>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="${path}/admin-logout.do">Logout</a>
                    </div>
                </li>
            </ul>
      </nav>
</body>
</html>