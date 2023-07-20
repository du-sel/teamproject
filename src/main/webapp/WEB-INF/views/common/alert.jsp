<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trackers</title>
</head>
<body onload="alert_exe('${alert_str}', '${alert_path}', '${alert_flag} }');">
	<script>
		function alert_exe(str, path, flag){
			console.log(str);
			console.log(path);
			
			alert(str);
			
			location.href = path;		// 정상 실행
		}
	</script>
</body>
</html>