<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Home</title>
<link rel="stylesheet" href="FacultyHome.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
		table, th, td {
  				border: 1px solid;
		}
</style>
</head>
<body>
	
		<div>
				<h1 id="heading">Classroom Booking Portal</h1>
		</div>
	
	
		<div id = "header">
				<button id = "b3">Search Available Classroom</button>
				<button id = "b1">Book Available Classroom</button>
				<button id = "b2">Release Available Classroom</button>
				<button id = "b6" onclick = "listRooms()">List All Classrooms</button>
				<button id = "b4">My Bookings</button>
				<button id = "b5">My Account</button>
		</div>
		
		
		

	
		<div class="Book" id = "Book">
				<h1>Enter Details</h1>
				
				
						<span>Date :</span>&emsp;&emsp;
						<input type="date" id="date" name = "Date" value ="" placeholder="Enter Date" onkeyup = "validateDate()">
						<p class="error" id = "dateError"></p>
						
						<span>From :</span>&emsp;&emsp;
						<input type="time" id = "ftime" name = "fromTime" value = "" placeholder="Enter time" onkeyup = "validateFrom()">
						<p class="error" id = "fTimeError"></p>
			
						<span>To :</span>&emsp;&emsp;
						<input type="time" id = "ttime" name = "toTime" value = "" placeholder="Enter time" onkeyup = "validateTo()">
						<p class="error" id = "tTimeError"></p>
			
						<span>Classroom Id :</span>&emsp;&emsp;
						<input type="text" id = "cid" name = "Cid" value = "" placeholder="Enter classroom Id" onkeyup = "validateRoom()">
						<p class="error" id = "roomError"></p><br><br>
			
						<button type="submit" value="Submit" onclick = "validateAll()">Book</button>
				
							
				<div id="response" class="response"></div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
	
		<div id = "Free" class = "Free">
				<h1 style="text-align: center;">Free the Booked rooms</h1>
				<div style="margin: auto; text-align: center;">
						<input type = "date" id="booked_date" class = "booked_date" placeholder="enter date">&emsp;&emsp;
						<button id = "list" onclick = "listMyBookings()">List My Bookings</button>
						<p id="errorDelete" class="error"></p>
				</div><br>
				<div id = "releaseMsg" style="text-align: center; margin: auto;"></div><br><br>
				<div id = "listDiv" style="text-align: center; margin: auto; width: 400px;"></div>
		</div>
		
		
		
		
		
		
		
		
		
	
		<div id = "search" class = "Search">
				<h1 style='text-align: center;'>Search for the Available vacant Classrooms</h1>
				<div style = "display: flex;">
						<div style="width: 900px;">
								<span><b>Date :</b></span>
								<input type = "date" id="searchDate" name = "searchDate" onkeyup = "validateSearchDate()">&emsp;&emsp;&emsp;
								
								<span><b>From : </b></span>
								<input type = "time" id="searchFromTime" name = "searchFromTime" onkeyup = "validateSearchFromTime()">&emsp;&emsp;&emsp;
								
								<span><b>To :</b></span>
								<input type = "time" id="searchToTime" name = "searchToTime" onkeyup = "validateSearchToTime()">&emsp;&emsp;&emsp;
				
								<span><b>Search By :</b></span>
								<select id = "searchSelect" onclick = "getNext()">
										<option value="Lecture Hall">Lecture Hall</option>
										<option value = "Class Name">Class Name</option>
								</select>
						</div>
						<div id ="second" style = "width: 450px; padding: 0px;">
								<span><b>Lecture Hall :</b></span>
								<select id = "selectBuilding">
										<option value = "LHC1">LHC1</option>
										<option value = "LHC2">LHC2</option>
										<option value = "SCIS">SCIS</option>
										<option value = "ALL">ALL</option>
								</select>&emsp;&emsp;
								<button onclick = "ListSearchRooms()">Search</button>
						</div>
				</div><br>
				<div style = "margin: auto; text-align: center;">
						<span id="searchDateError" class="error"></span><br>
						<span id="searchFromError" class="error"></span><br>
						<span id="searchToError" class="error"></span><br>
						<span id="searchClassError" class="error"></span>
				</div>
				<div id="searchResult">
						
				</div>
				
		</div>
		
	
	
	
		<div id ="Mybookings" class="Mybookings">
				<h1>My Bookings</h1>
		</div>
		
		
	
		<div id = "MyAccount" class="MyAccount" style = "display: none;">
				<%
						String mid = (String)session.getAttribute("user_id");
						String pass = (String)session.getAttribute("user_pass");
						String type = (String)session.getAttribute("user_type");
						String name = (String)session.getAttribute("user_name");
						out.print("<h2>My Details</h2><br><br>");
						out.print("<b>Name : "+name+"</b><br><br>");
						out.print("<b>Id   : "+mid+"</b><br><br>");
						out.print("<b>Type : "+type+"</b><br><br>");
				%>
				<button onclick="goBack()">logout</button>
		</div>
		
		
		
	
		<div id="listRooms" style = "display: none;">
				<div id = "roomslist" style = 'display: flex;'><h1>Rooms List</h1></div>
				
		</div>
	
		<script>
			
				$(document).ready(function(){
    				
						// To display Book
    					$("#b1").click(function(){
      							$("#Book").css("display", "block");
        						$("#Free").css("display", "none");
      							$("#search").css("display", "none");
      							$("#Mybookings").css("display", "none");
      							$("#MyAccount").css("display", "none");
      							$("#listRooms").css("display", "none");
    					});
    
   		 				// To display Free
    					$("#b2").click(function(){
    							$("#Book").css("display", "none");
        						$("#Free").css("display", "block");
      							$("#search").css("display", "none");
      							$("#Mybookings").css("display", "none");
      							$("#MyAccount").css("display", "none");
      							$("#listRooms").css("display", "none");
    					});
    	
    					//To display search
  						$("#b3").click(function(){
  								$("#Book").css("display", "none");
        						$("#Free").css("display", "none");
      							$("#search").css("display", "block");
      							$("#Mybookings").css("display", "none");
      							$("#MyAccount").css("display", "none");
      							$("#listRooms").css("display", "none");
      							document.getElementById("searchResult").innerHTML = "";
    					});
    	
    					//To display My Bookings
  						$("#b4").click(function(){
  								$("#Book").css("display", "none");
        						$("#Free").css("display", "none");
      							$("#search").css("display", "none");
      							$("#Mybookings").css("display", "block");
      							$("#MyAccount").css("display", "none");
      							$("#listRooms").css("display", "none");
    					});
    				
    					//To display My Account
  						$("#b5").click(function(){
								$("#Book").css("display", "none");
    							$("#Free").css("display", "none");
  								$("#search").css("display", "none");
  								$("#Mybookings").css("display", "none");
  								$("#MyAccount").css("display", "block");
  								$("#listRooms").css("display", "none");
						});
    				
    					//To display list rooms
  						$("#b6").click(function(){
								$("#Book").css("display", "none");
								$("#Free").css("display", "none");
								$("#search").css("display", "none");
								$("#Mybookings").css("display", "none");
								$("#MyAccount").css("display", "none");
								$("#listRooms").css("display", "block");
								listRooms();
						});
    				
				});
			
			
	</script>
	
	<script src = "FacultyHome.js"></script>
</body>
</html>