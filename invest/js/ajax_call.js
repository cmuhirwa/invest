// Display Users
function page(pageID){
	var accID = pageID;
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				
				accID : accID,
			},
			success : function(html, textStatus){
				$("#users").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}

//Accept invitation of my account
function acceptance(account_to_conf, personalID){
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				account_to_conf : account_to_conf,
				personalID : personalID,
			},
			success : function(html, textStatus){
				$("#anouncement").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
 }
 
// Reject invitation of my account
 function rejectance(account_to_reg, personalID_to_reg){
 	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				account_to_reg : account_to_reg,
				personalID_to_reg : personalID_to_reg,
			},
			success : function(html, textStatus){
				$("#anouncement").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
 }

// Group invitation of my account
 function group_info(group_id, G_personalID){
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				group_id : group_id,
				G_personalID : G_personalID,
			},
			success : function(html, textStatus){
				$("#group_infromation").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
 }
 
function activate(activateID){
	
	var actID = activateID;
	alert('do you what to remove 0'+ actID +' from your account');
	
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				
				actID : actID,
			},
			success : function(html, textStatus){
				$("#users").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
 
function get_info(infoID){
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				infoID : infoID,
			},
			success : function(html, textStatus){
				$("#account_name").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}

function phone(phoneID){
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				
				phoneID : phoneID,
			},
			success : function(html, textStatus){
				$("#transactions").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
	
}

//Count the users in a group
function count_u(groupID){
	$.ajax({
			type : "GET",
			url : "testlog.php",
			dataType : "html",
			cache : "false",
			data : {
				
				groupID : groupID,
			},
			success : function(html, textStatus){
				$("#counted").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
	
}

function clear_info(){
	//document.getElementById ('transactions') = actionButton;
	//actionButton.innerHTML = "We are here"; 
	//alert('that"s good');
}