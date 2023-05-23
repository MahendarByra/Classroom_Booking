/**
 Javascript for Office member Home Page
 */
var isNow = 0;


function listMyBookings()
{
		document.getElementById("listDiv").innerHTML = "";
		let date = document.getElementById("booked_date").value;
		if(date == "")
		{
				document.getElementById("errorDelete").innerHTML = "*Please enter date";
				return;
		}
		else
		{
				document.getElementById("errorDelete").innerHTML = "";
		}
		let daydiff;
		
		let day = date.substring(8,10);
		let month = date.substring(5,7);
		let year = date.substring(0,4);
					
		let currentDate = new Date();
		let currentYear = currentDate.getFullYear();
		let currentMonth = currentDate.getMonth()+1;
		let currentDay = currentDate.getDate();
					
		let d1 = new Date(""+month+"/"+day+"/"+year);
		let d2 = new Date(""+currentMonth+"/"+currentDay+"/"+currentYear);
					
		if(d1.getDay() == 0 || d1.getDay() == 6)
		{
				document.getElementById("errorDelete").innerHTML = "*Date should not be a weekend";
				return;
		}
		else
		{
				document.getElementById("errorDelete").innerHTML = "";	
		}
							
							
		let diff = d1.getTime()- d2.getTime();
		daydiff = diff/(1000 * 60 * 60 * 24);
		if(daydiff < 0 || daydiff > 15)
		{
				document.getElementById("errorDelete").innerHTML = "*Plese enter a future date which is within 15 days";
				return;
		}
		else
		{
				document.getElementById("errorDelete").innerHTML = "";	
		}
							
		const xhttp = new XMLHttpRequest();			
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("listDiv").innerHTML = this.responseText;
				}
		};
				 
		xhttp.open("GET", "FreeClass.jsp?booked_date="+date);
		xhttp.send();
}


function releaseRoom(x,y,z,t)
{
		const xhttp = new XMLHttpRequest();
				
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("releaseMsg").innerHTML = this.responseText;
						listMyBookings();
				}
		};
				 
		xhttp.open("GET", "ReleaseClass.jsp?class_name="+x+"&date_name="+y+"&fromTime_name="+z+"&toTime_name="+t);
		xhttp.send();
}

function goBack()
{
		window.location.href = "loginVCB.jsp";
}

function validateDate()
{
		let Date = document.getElementById("date").value;
		if(Date == "")
		{
				document.getElementById("dateError").innerHTML = "*Plese enter date";
				return false;
		}
		else
		{
				document.getElementById("dateError").innerHTML = "";
				return true;
		}		
	
}

function validateFrom()
{
		let from = document.getElementById("ftime").value;	
		if(from == "")
		{
				document.getElementById("fTimeError").innerHTML ="*Please enter from Time";
				return false;
		}
		else
		{
				document.getElementById("fTimeError").innerHTML ="";
				return true;
		}
}

function validateTo()
{
		let to = document.getElementById("ttime").value;	
		if(to == "")
		{
				document.getElementById("tTimeError").innerHTML ="*Please enter to Time";
		}
		else
		{
				document.getElementById("tTimeError").innerHTML ="";
		}
		return ;
}

function validateRoom()
{
		let room = document.getElementById("cid").value;
		if(room == "")
		{
				document.getElementById("roomError").innerHTML ="*Please enter classroom id";
		}
		else
		{
				document.getElementById("errorMsg").innerHTML ="";		
		}
		return;
}

function validateAll()
{
		let date = document.getElementById("date").value;
		let fromTime = document.getElementById("ftime").value;
		let toTime = document.getElementById("ttime").value;
		let Classroom = document.getElementById("cid").value;
	
		var daydiff;
		if(date == "")
		{
				document.getElementById("dateError").innerHTML = "*Plese enter date";
			return;
		}
		else
		{
				let day = date.substring(8,10);
				let month = date.substring(5,7);
				let year = date.substring(0,4);
		
				let currentDate = new Date();
				let currentYear = currentDate.getFullYear();
				let currentMonth = currentDate.getMonth()+1;
				let currentDay = currentDate.getDate();
		
				let d1 = new Date(""+month+"/"+day+"/"+year);
				let d2 = new Date(""+currentMonth+"/"+currentDay+"/"+currentYear);
				
				if(d1.getDay() == 0 || d1.getDay() == 6)
				{
						document.getElementById("dateError").innerHTML = "Can't book classroom in weekends";
						return;
				}
				else
				{
						document.getElementById("dateError").innerHTML = "";	
				}
		
				let diff = d1.getTime()- d2.getTime();
				daydiff = diff/(1000 * 60 * 60 * 24);
				if(daydiff < 0 || daydiff > 15)
				{
						document.getElementById("dateError").innerHTML = "*Plese enter a future date which is within 15 days";
						return;
				}
				else
				{
						document.getElementById("dateError").innerHTML = "";	
				}
		}
	
		if(fromTime == "")
		{
				document.getElementById("fTimeError").innerHTML ="*Please enter from Time";
				return;
		}
		else
		{
				let hour = fromTime.substring(0,2);
				let min = fromTime.substring(3,5);
				let current = new Date();
				
				
				if(daydiff == 0)
				{
						if(hour <= current.getHours())
						{
								document.getElementById("fTimeError").innerHTML ="*can't book the room in past slot";
								return;	
						}	
						else
						{
								document.getElementById("fTimeError").innerHTML ="";
						}		
				}
				
				if(hour < 9 || hour > 17)
				{
						document.getElementById("fTimeError").innerHTML ="*from time should be within 9 to 17";
						return;
				}
				else
				{
						document.getElementById("fTimeError").innerHTML ="";
						if(hour == 13)
						{
								document.getElementById("fTimeError").innerHTML ="*can't book classrooms during lunch time";
								return;
						}
						else
						{
								document.getElementById("fTimeError").innerHTML ="";
						}
			
				}
		
				if(min != 0)
				{
						document.getElementById("fTimeError").innerHTML ="*can't book in the middle of the slot";
						return;
				}
				else
				{
						document.getElementById("fTimeError").innerHTML ="";
				}	
		}
	
		if(toTime == "")
		{
				document.getElementById("tTimeError").innerHTML ="*Please enter to Time";
				return;
		}
		else
		{
				let hour = toTime.substring(0,2);
				let min = toTime.substring(3,5);
				let hour2 = fromTime.substring(0,2);
				
				if(hour < hour2)
				{
						document.getElementById("tTimeError").innerHTML ="*to time can't be less than from time";
						return;	
				}
				else
				{
								document.getElementById("tTimeError").innerHTML ="";
				}
				
				let current = new Date();
				if(daydiff == 0)
				{
						if(hour <= current.getHours())
						{
								document.getElementById("tTimeError").innerHTML ="*can't book the room in past slot";
								return;	
						}	
						else
						{
								document.getElementById("tTimeError").innerHTML ="";
						}		
				}
						
				if(hour < 10 || hour > 18)
				{
						document.getElementById("tTimeError").innerHTML ="*to time should be within 10 to 18";
						return;
				}
				else
				{
						if(hour == 14)
						{
								document.getElementById("tTimeError").innerHTML ="*can't book classrooms during lunch time";
								return;
						}
				}
		
				if(min != 0)
				{
						document.getElementById("tTimeError").innerHTML ="*can't book in the middle of the slot";
						return;
				}	
		}
	
		if(Classroom == "")
		{
				document.getElementById("roomError").innerHTML ="*Please enter classroom id";
				return;
		}
	
		const xhttp = new XMLHttpRequest();
				
	
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("response").innerHTML = this.responseText;
				}
		};
				 
		xhttp.open("GET", "BookClass.jsp?Date="+date+"&fromTime="+fromTime+"&toTime="+toTime+"&Cid="+Classroom);
		xhttp.send();
}

function listRooms()
{
		const xhttp = new XMLHttpRequest();			
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("roomslist").innerHTML = this.responseText;
				}
		};
						 
		xhttp.open("GET", "Rooms.jsp?");
		xhttp.send();
}
			
function showAvailability(x)
{
					const xhttp = new XMLHttpRequest();			
					xhttp.onreadystatechange  = function() {
							if (this.readyState == 4 && this.status == 200) 
							{
									document.getElementById("roomslist").innerHTML = this.responseText;
							}
					};
					 
					xhttp.open("GET", "Showroom.jsp?cid="+x);
					xhttp.send();
}
			
function validateSearchDate()
			{
				let Date = document.getElementById("searchDate").value;
				if(Date == "")
				{
						document.getElementById("searchDateError").innerHTML = "*Plese enter date";
						return false;
				}
				else
				{
						document.getElementById("searchDateError").innerHTML = "";
						return true;
				}		
			
} 
			
function validateSearchFromTime()
{
				
				let x = document.getElementById("searchFromTime").value;
				if(x == "")
				{
						document.getElementById("searchFromError").innerHTML = "*Plese enter from time";
						return false;
				}
				else
				{
						document.getElementById("searchFromError").innerHTML = "";
						return true;
				}		
			
} 
			
function validateSearchToTime()
{
				let x = document.getElementById("searchToTime").value;
				if(x == "")
				{
						document.getElementById("searchToError").innerHTML = "*Plese enter to time";
						return false;
				}
				else
				{
						document.getElementById("searchToError").innerHTML = "";
						return true;
				}		
			
				
} 
			
function validateSearchClass()
			{
				let x = document.getElementById("searchClassRoom").value;
				if(x == "")
				{
						document.getElementById("searchClassError").innerHTML = "*Plese ennter classroom name";
						return false;
				}
				else
				{
						document.getElementById("searchClassError").innerHTML = "";
						return true;
				}		
			
				
}
			
function getNext()
{
					let check = document.getElementById("searchSelect").value;
					if(check == "Class Name")
					{
							let x = "<span><b>Class Name :</b> <span>"
									+"<input type = 'text' id = 'searchClassRoom' name = 'searchClassRoom' onkeyup = 'validateSearchClass()'>&emsp;"
									+"<button onclick = 'ListSearchRooms()''>Search</button>";
							isNow = 1;
							
							document.getElementById("second").innerHTML = x;
					}
					else
					{
							let x = "<span><b>Lecture Hall :</b></span>"
									+"<select id = 'selectBuilding'>"
									+"<option value = 'LHC1'>LHC1</option>"
									+"<option value = 'LHC2'>LHC2</option>"
									+"<option value = 'SCIS'>SCIS</option>"
									+"<option value = 'ALL'>ALL</option>"
									+"</select>&emsp;&emsp;"
									+"<button onclick = 'ListSearchRooms()'>Search</button>";
							isNow = 0;
							document.getElementById("second").innerHTML = x;
							document.getElementById("searchClassError").innerHTML = "";
					}
}
			
function ListSearchRooms()
{	
					document.getElementById("searchResult").innerHTML = "";
					validateSearchDate();
					validateSearchFromTime();
					validateSearchToTime();
					if(isNow == 1)
					{
							validateSearchClass();
					}
					if(validateSearchDate() && validateSearchFromTime() && validateSearchToTime())
					{
							let Classroom = "null";
							let lectureHall = "null";
							if(isNow == 1)
							{
									if(!validateSearchClass())
									{
										return;
									}else
									{
										Classroom = document.getElementById("searchClassRoom").value;
									}
							}
							else
							{
									lectureHall =  document.getElementById("selectBuilding").value;
							}
							
							let date = document.getElementById("searchDate").value;
							let fromTime = document.getElementById("searchFromTime").value;
							let toTime = document.getElementById("searchToTime").value;
							
							
				
							var daydiff;
							let day = date.substring(8,10);
							let month = date.substring(5,7);
							let year = date.substring(0,4);
					
							let currentDate = new Date();
							let currentYear = currentDate.getFullYear();
							let currentMonth = currentDate.getMonth()+1;
							let currentDay = currentDate.getDate();
					
							let d1 = new Date(""+month+"/"+day+"/"+year);
							let d2 = new Date(""+currentMonth+"/"+currentDay+"/"+currentYear);
					
							if(d1.getDay() == 0 || d1.getDay() == 6)
							{
									document.getElementById("searchDateError").innerHTML = "Can't book classroom in weekends";
									return;
							}
							else
							{
									document.getElementById("searchDateError").innerHTML = "";	
							}
							
							
							let diff = d1.getTime()- d2.getTime();
							daydiff = diff/(1000 * 60 * 60 * 24);
							if(daydiff < 0 || daydiff > 15)
							{
									document.getElementById("searchDateError").innerHTML = "*Plese enter a future date which is within 15 days";
									return;
							}
							else
							{
									document.getElementById("searchDateError").innerHTML = "";	
							}
							
					
							let hour = fromTime.substring(0,2);
							let min = fromTime.substring(3,5);
							let current = new Date();
				
							if(daydiff == 0)
							{
									if(hour <= current.getHours())
									{
											document.getElementById("searchFromError").innerHTML ="*can't book the room in past slot";
											return;	
									}	
									else
									{
											document.getElementById("searchFromError").innerHTML ="";
									}		
							}
							
							if(hour < 9 || hour > 17)
							{
									document.getElementById("searchFromError").innerHTML ="*from time should be within 9 to 17";
									return;
							}
							else
							{
									document.getElementById("searchFromError").innerHTML ="";
									if(hour == 13)
									{
											document.getElementById("searchFromError").innerHTML ="*can't book classrooms during lunch time";
											return;
									}
									else
									{
											document.getElementById("searchFromError").innerHTML ="";
									}
								
							}
							
							if(min != 0)
							{
									document.getElementById("searchFromError").innerHTML ="*can't book in the middle of the slot";
									return;
							}
							else
							{
									document.getElementById("searchFromError").innerHTML ="";
							}	
							
						
							hour = toTime.substring(0,2);
							min = toTime.substring(3,5);
							let hour2 = document.getElementById("searchFromTime").value;
							if(hour < hour2)
							{
									document.getElementById("searchToError").innerHTML ="*to time can't be less than from time";
									return;	
							}
							else
							{
											document.getElementById("searchToError").innerHTML ="";
							}
							
							
							if(daydiff == 0)
							{
									if(hour <= current.getHours())
									{
											document.getElementById("searchToError").innerHTML ="*can't book the room in past slot";
											return;	
									}	
									else
									{
											document.getElementById("searchToError").innerHTML ="";
									}		
							}
							
							
							if(hour < 10 || hour > 18)
							{
									document.getElementById("searchToError").innerHTML ="*to time should be within 10 to 18";
									return;
							}
							else
							{
									if(hour == 14)
									{
											document.getElementById("searchToError").innerHTML ="*can't book classrooms during lunch time";
											return;
									}
							}
							
							if(min != 0)
							{
									document.getElementById("searchToError").innerHTML ="*can't book in the middle of the slot";
									return;
							}
							if(isNow == 1)
							{
									lectureHall = "null";
							}
							else
							{
									Classroom = "null";
							}
									const xhttp = new XMLHttpRequest();
							
							
									xhttp.onreadystatechange  = function() {
											if (this.readyState == 4 && this.status == 200) 
											{
													document.getElementById("searchResult").innerHTML = this.responseText;
											}
									};
									xhttp.open("GET", "Search.jsp?Date="+date+"&fromTime="+fromTime+"&toTime="+toTime+"&Cid="+Classroom+"&lectureHall="+lectureHall);
									xhttp.send();
							
					}
}


function validateRebookDate()
{
		let Date = document.getElementById("rebookDate").value;
		if(Date == "")
		{
				document.getElementById("reBookError").innerHTML = "*Plese enter date";
				return false;
		}
		else
		{
				document.getElementById("reBookError").innerHTML = "";
				return true;
		}			
} 
			
function validateRebookFromTime()
{
		let fromTime = document.getElementById("rebookFrom").value;
		if(fromTime == "")
		{
				document.getElementById("reBookError").innerHTML = "*Plese enter from time";
				return false;
		}
		else
		{
				document.getElementById("reBookError").innerHTML = "";
				return true;
		}			
} 
			
function validateRebookToTime()
{
		let toTime = document.getElementById("rebookTo").value;
		if(toTime == "")
		{
				document.getElementById("reBookError").innerHTML = "*Plese enter to time";
				return false;
		}
		else
		{
				document.getElementById("reBookError").innerHTML = "";
				return true;
		}				
} 

function getList()
{
		if(!validateRebookDate())
		{
				return ;
		}
		if(!validateRebookFromTime())
		{
				return;
		}
		if(!validateRebookToTime())
		{
				return;
		}

		let date = document.getElementById("rebookDate").value;
		let fromTime = document.getElementById("rebookFrom").value;
		let toTime = document.getElementById("rebookTo").value;
							
								
		let day = date.substring(8,10);
		let month = date.substring(5,7);
		let year = date.substring(0,4);
					
		let currentDate = new Date();
		let currentYear = currentDate.getFullYear();
		let currentMonth = currentDate.getMonth()+1;
		let currentDay = currentDate.getDate();
					
		let d1 = new Date(""+month+"/"+day+"/"+year);
		let d2 = new Date(""+currentMonth+"/"+currentDay+"/"+currentYear);
					
		if(d1.getDay() == 0 || d1.getDay() == 6)
		{		
				document.getElementById("reBookError").innerHTML = "Can't book classroom in weekends";
				return;
		}
		else
		{
				document.getElementById("reBookError").innerHTML = "";	
		}
											
		let diff = d1.getTime()- d2.getTime();
		let daydiff = diff/(1000 * 60 * 60 * 24);
		if(daydiff < 0 || daydiff > 15)
		{
				document.getElementById("reBookError").innerHTML = "*Plese enter a future date which is within 15 days";
				return;
		}
		else
		{
				document.getElementById("reBookError").innerHTML = "";
		}
		
		let hour = fromTime.substring(0,2);
		let min = fromTime.substring(3,5);
		let current = new Date();
				
		if(daydiff == 0)
		{
				if(hour <= current.getHours())
				{
						document.getElementById("reBookError").innerHTML ="*can't book the room in past slot";
						return;	
				}	
				else
				{
						document.getElementById("reBookError").innerHTML ="";
				}		
		}
			
		if(hour < 9 || hour > 17)
		{
				document.getElementById("reBookError").innerHTML ="*from time should be within 9 to 17";
				return;
		}
		else
		{
				document.getElementById("reBookError").innerHTML ="";
				if(hour == 13)
				{
						document.getElementById("reBookError").innerHTML ="*can't book classrooms during lunch time";
						return;
				}
				else
				{
						document.getElementById("reBookError").innerHTML ="";
				}
		}
		
		if(min != 0)
		{
				document.getElementById("reBookError").innerHTML ="*can't book in the middle of the slot";
				return;
		}
		else
		{
				document.getElementById("reBookError").innerHTML ="";
		}	
			
		hour = toTime.substring(0,2);
		min = toTime.substring(3,5);
		let hour2 = fromTime.substring(0,2);
				
		if(hour < hour2)
		{
				document.getElementById("reBookError").innerHTML ="*to time can't be less than from time";
				return;	
		}
		else
		{
				document.getElementById("reBookError").innerHTML ="";
		}
				
		if(daydiff == 0)
		{
				if(hour <= current.getHours())
				{
						document.getElementById("reBookError").innerHTML ="*can't book the room in past slot";
						return;	
				}	
				else
				{
						document.getElementById("reBookError").innerHTML ="";
				}		
		}
						
		if(hour < 10 || hour > 18)
		{
				document.getElementById("reBookError").innerHTML ="*to time should be within 10 to 18";
				return;
		}
		else
		{
				if(hour == 14)
				{
						document.getElementById("reBookError").innerHTML ="*can't book classrooms during lunch time";
						return;
				}
		}
		
		if(min != 0)
		{
				document.getElementById("reBookError").innerHTML ="*can't book in the middle of the slot";
				return;
		}
		
		const xhttp = new XMLHttpRequest();			
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("rebookList").innerHTML = this.responseText;
				}
		};
					 
		xhttp.open("GET", "RebookList.jsp?Date="+date+"&fromTime="+fromTime+"&toTime="+toTime);
		xhttp.send();					
}

function Rebook(x,y,z,a,b,c)
{
		const xhttp = new XMLHttpRequest();			
		xhttp.onreadystatechange  = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
						document.getElementById("reBookMsg").innerHTML = this.responseText;
						getList();
				}
		};
					 
		xhttp.open("GET", "Rebook.jsp?previd="+x+"&prevtype="+y+"&class_id="+z+"&date="+a+"&fromTime="+b+"&toTime="+c);
		xhttp.send();
	
}
