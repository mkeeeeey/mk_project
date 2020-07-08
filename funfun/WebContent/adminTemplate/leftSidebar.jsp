<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">대시보드</div>
                            <a class="nav-link" href="${path }/admin-main.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                통계</a
                            >
                            
                            <div class="sb-sidenav-menu-heading">관리</div>
                            <a class="nav-link" href="${path }/member-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원관리</a>
                            <a class="nav-link" href="${path }/maker-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                메이커 관리</a>
                            <a class="nav-link" href="${path }/project-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                프로젝트 관리</a>
                                <a class="nav-link" href="${path }/project-report-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                프로젝트 신고 관리</a>
                            <a class="nav-link" href="${path }/reward-store-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                리워드 스토어 관리</a>
                            <a class="nav-link" href="${path }/customer-service-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                고객센터 관리</a>
                            <a class="nav-link" href="${path }/admin-management.do"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                관리자 설정</a>
                        </div>
                    </div>
                </nav>
            </div>
</body>
</html>