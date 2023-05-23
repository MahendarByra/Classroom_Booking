<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page for Student Internship Eligibility portal</title>
<link rel="stylesheet" href="two.css">
</head>
<body>
	<div class = "f1">
		<pre>				         	<button onclick = "goBack()">Back</button></pre>
	<h1 style="color: red;">Login</h1>
		<form id = "login_siep" method = "post" onsubmit = "return validate()" action = "loginsiep">
				<span>Member Id</span><br>
				<input type="text" id="mid" name="Mid" placeholder = "Enter your member Id"><br><br>
				<span>Password</span><br>
				<input type="password" id="mpass" name="Mpass" placeholder = "Enter your password"><br><br>
				<span>Type</span><br>
				<input type="radio" id="type" name="Type" value="Student">&nbsp;
				<span>Student</span> &emsp;
				<input type="radio" id="type" name="Type" value="Intership selection Manager">&nbsp;
				<span>Intership Selection Manager</span><br>
				<br>
				<button type="submit" value="submit" class="b">Submit</button>
				
		</form>
		<script src = "loginSIEP.js">
			
		</script>
</body>
</html>