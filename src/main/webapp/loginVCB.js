/* Javascript for loginVCB.jsp */				

var isVisible = 0;
function Xvalid()
{
		let x = document.getElementById("mid").value;
		if(x == "")
		{
				document.getElementById("midError").innerHTML = "*member id can't be empty";
				return false;
		}
		else
		{
				let regEx = /^[0-9a-zA-Z]+$/;
				let length = x.length;	
				if(x.match(regEx) && length == 6)
				{
						document.getElementById("midError").innerHTML = "";
						for(let i=0; i<length; i++)
						{
								if(i == 0 || i == 1 || i == 4 || i == 5)
								{
										let n = x.charAt(i);	
										if(!n.match(/^\d+$/))
										{
												document.getElementById("midError").innerHTML = "invalid format{num.num.char.char.num.num}";
												return false;
										}
								}
								else
								{
										let n = x.charAt(i);
										if(!n.match(/^[A-Za-z]$/))
										{
												document.getElementById("midError").innerHTML = "invalid format{num.num.char.char.num.num}";
												return false;
										}
								}
							}
							return true;
					}		
					else
					{
							document.getElementById("midError").innerHTML = "*only numbers and alphabets are allowed and length=6";
							return false;
					}
			}			
}
		
		
function Yvalid()
{
		let y = document.getElementById("mpass").value;
		if(y == "")
		{
				document.getElementById("mpassError").innerHTML = "*Password can't be empty";
				return false;
		}
		else
		{
				let regEx = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
				if(y.match(regEx))
				{
						document.getElementById("mpassError").innerHTML = "";
						return true;
				}
				else
				{
						document.getElementById("mpassError").innerHTML = "not a strong password, Your password should "
																	   +"contain atleast one lowercase,one uppercase,"+
																	   "one digit,one special charecter and should have "+
																	   "length between 8 to 15";
					
						return false;
				}
		}		
}
		
		
function validate()
{					
		if(!Xvalid())
		{
				if(!Yvalid())
				{
						return false;
				}
				else
				{
						return false;
				}
				
		}
		else
		{
				if(!Yvalid())
				{
						return false;
				}
				else
				{
						return true;
				}
		}
}

function goBack()
{
		window.location.href = "Selection.jsp";
}

function visible()
{
		if(isVisible == 0)
		{
				isVisible = 1;
				document.getElementById("mpass").type = "text";
				document.getElementById("im").src = "https://cdn1.iconfinder.com/data/icons/essential-21/128/Eye-512.png";
				return;
		}
			
		if(isVisible == 1)
		{
				isVisible = 0;
				document.getElementById("mpass").type = "password";
				document.getElementById("im").src ="https://cdn1.iconfinder.com/data/icons/essential-21/128/Hide-512.png";
				return;
		}
}
