<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login for classroom Booking</title>
<link rel="stylesheet" href="loginVCB.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
		<div style="margin:auto; text-align: center;">
				<h1>Welcome to Classroom Booking Portal</h1>
		</div>
		
		
		<div class = "f1">
				<div>
						<button id="b1">Login</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<button id="b2">Register</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<button onclick="goBack()">Back</button>
				</div>
						
				<div id = "login">
						<h1 style="color: red;">Login</h1>
				
						<form id = "login_vcb" method = "post" onsubmit = "return validate()" action = "loginVCB">
						
								<span>Member Id:</span><br>
								<input type="text" id="mid" name="Mid" placeholder = "Enter your member Id"  onclick="Xvalid()" onkeyup = "Xvalid()"><br>
								<span class="error" id="midError"></span><br>
						
								<span>Password</span><br>
								<input type="password" id="mpass" name="Mpass" placeholder = "Enter your password"  onclick="Yvalid()" onkeyup = "Yvalid()">
								<img id = "im" src="https://w7.pngwing.com/pngs/27/357/png-transparent-eye-eyeball-hide-interface-secret-revamp-icon.png" width="15px" height="15px"
									onclick = "visible()"><br>
								<span class="error" id="mpassError"></span><br>
						
								<span>Type :</span><br>
								<select name="Mtype" id="mtype">
  										<option value="Faculty">Faculty</option>
  										<option value="Office Member">Office Member</option>
  										<option value="Database Manager">Database Manager</option>
								</select><br>
								<span class="error" id="mtypeError"></span><br><br>
						
								<button type = "submit">Submit</button>
						</form>
				
				
						<div id="loginVCB">
								<h3 style="color: red;">
								<%
										if(session.getAttribute("loginMsgVCB") != null)
										{	
												out.print(session.getAttribute("loginMsgVCB"));
												session.setAttribute("loginMsgVCB",null);		
										}
								%></h3>
						</div>
				
				</div>
				<div id = "Register" style="display: none;">
						<h1>Register</h1>
				</div>
				
				
		</div>
		
		<script src = "loginVCB.js"> </script>
		<script>
				$(document).ready(function(){
			
						// To display Login
						$("#b1").click(function(){
								$("#login").css("display", "block");
								$("#Register").css("display", "none");
						
						});

						// To display Register
						$("#b2").click(function(){
								$("#login").css("display", "none");
								$("#Register").css("display", "block");
						
						});
				});
		</script>
</body>
</html>