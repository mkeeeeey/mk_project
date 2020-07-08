// 카테고리
	$("#all").click(function(){
		$("[name=category]").val("all");
		$("#category").submit();
	});
	$("#edu").click(function(){
		$("[name=category]").val("edu");
		$("#category").submit();
	});
	$("#beauty").click(function(){
		$("[name=category]").val("beauty");
		$("#category").submit();
	});
	$("#homeLiving").click(function(){
		$("[name=category]").val("homeLiving");
		$("#category").submit();
	});
	$("#culture").click(function(){
		$("[name=category]").val("culture");
		$("#category").submit();
	});
	$("#sports").click(function(){
		$("[name=category]").val("sports");
		$("#category").submit();
	});
	$("#book").click(function(){
		$("[name=category]").val("book");
		$("#category").submit();
	});
	$("#dog").click(function(){
		$("[name=category]").val("dog");
		$("#category").submit();
	});
	$("#electro").click(function(){
		$("[name=category]").val("electro");
		$("#category").submit();
	});
	
// 프로젝트 상세보기
	function go_detail(no){
		$(location).attr("href", "funding.do?method=detail&pro_code="+no);
	}