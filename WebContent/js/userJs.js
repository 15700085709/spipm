$(document).ready(function(){
	    dropdownOpen();//调用
	    
	    $("#addTeamNumber").click(function(event){
	    	var value = $("#teamNumber2").val();
    		for (var i = 0; i < value.length; i++) {
    			$("#teamNumber3").append("<option value='"+value[i]+"'>" + value[i] + "</option>");
        		$("#teamNumber2 option[value='"+value[i]+"']").remove(); 
    		}

	    });
	    $("#deleteTeamNumber").click(function(event){
	    	var value = $("#teamNumber3").val();
    		for (var i = 0; i < value.length; i++) {
    			$("#teamNumber2").append("<option value='"+value[i]+"'>" + value[i] + "</option>");
        		$("#teamNumber3 option[value='"+value[i]+"']").remove(); 
    		}

	    });
	    
	    
	    $(".btn.btn-primary.loadUserlist").click( function(event){
	    	
	    	if($(this).attr('id')!=null){
	    		var teamId = $(this).attr('id').substr(2);
	    		var buttonId= "teamLeader" + teamId;
	    		var buttonId2= "manager" + teamId;
	    		var buttonId3= "planReceiver" + teamId;
	    	    $("#addTeamNumber"+teamId).click(function(event){
	    	    	var value = $("#teamNumber2"+teamId).val();
	        		for (var i = 0; i < value.length; i++) {
	        			$("#teamNumber3"+teamId).append("<option value='"+value[i]+"'>" + value[i] + "</option>");
	            		$("#teamNumber2"+teamId+" option[value='"+value[i]+"']").remove(); 
	        		}

     	            $("#teamNumber3"+teamId+" option:first").prop("selected", 'selected');
	    	    });
	    	    $("#deleteTeamNumber"+teamId).click(function(event){
	    	    	var value = $("#teamNumber3"+teamId).val();
	        		for (var i = 0; i < value.length; i++) {
	        			$("#teamNumber2"+teamId).append("<option value='"+value[i]+"'>" + value[i] + "</option>");
	            		$("#teamNumber3"+teamId+" option[value='"+value[i]+"']").remove(); 
	        		}

     	            $("#teamNumber3"+teamId+" option:first").prop("selected", 'selected');
	    	    });
	    		
	    	}
	    		
	    	
	    	
	    	
	    	var buttonName = $(this).val();
	         $.ajax({
   	          
   	          type: "POST",
   	          url: "/nssh/team/getAllUser",
   	          dataType: "json",
   	          data:{id:teamId!=null?teamId:null},
 	              contentType : 'application/json;charset=utf-8',
   	         success: function (data) {
   	        	var value;
   	        	if(buttonName == "添加"){
            		$("#teamLeader1").empty();
            		$("#teamNumber2").empty();
            		$("#planReceiver").empty();
            		$("#manager").empty();
            		for (var i = 0; i < data.users.length; i++) {
     	            	 value = (data.users)[i].userName + "("+ (data.users)[i].userId + ")";
             			$("#teamNumber2").append("<option value='"+value+"'>" + value + "</option>");
            			$("#teamLeader1").append("<option value='"+value+"'>" + value + "</option>");
            			$("#manager").append("<option value='"+value+"'>" + value + "</option>");
            			$("#planReceiver").append("<option value='"+value+"'>" + value + "</option>");
            		}
	            }else if(buttonName == "编辑"){
	            	value = $("#"+buttonId +" option:first").attr("value");
	   	        	var value2 = $("#"+buttonId2 +" option:first").attr("value");
	   	        	var value3 = $("#"+buttonId3 +" option:first").attr("value");
            		$("#"+buttonId).empty();
            		$("#"+buttonId2).empty();
            		$("#"+buttonId3).empty();
	            	$("#"+buttonId).append("<option value='"+value+"'>" + value + "</option>");
	            	$("#"+buttonId2).append("<option value='"+value2+"'>" + value2 + "</option>");
	            	$("#"+buttonId3).append("<option value='"+value3+"'>" + value3 + "</option>");
      	             for (var i = 0; i < data.users.length; i++) {
      	            	 value = (data.users)[i].userName + "("+ (data.users)[i].userId + ")";
      	            	$("#"+buttonId).append("<option value='" +value +"'>" + value + "</option>");
      	            	$("#"+buttonId2).append("<option value='" +value +"'>" + value + "</option>");
      	            	$("#"+buttonId3).append("<option value='" +value +"'>" + value + "</option>");
      	             }
      	             

             		$("#teamNumber2"+teamId).empty();
     	             for (var i = 0; i < data.selectNumber.length; i++) {
      	            	 value = (data.selectNumber)[i].userName + "("+ (data.selectNumber)[i].userId + ")";
      	            	$("#teamNumber2"+teamId).append("<option value='" +value +"'>" + value + "</option>");
      	             }

     	    	   
	            }
   	        	 
   	         },
   	         error: function(XMLHttpRequest, textStatus, errorThrown) {  //#3这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
                       alert(XMLHttpRequest.status);
                       alert(XMLHttpRequest.readyState);
                       alert(textStatus); // paser error;
                   }
   	     });
	    } );
	    
	    
	    
	    
	    $(".btn.btn-primary.loadUserlist.dpl").click( function(event){

	    	var buttonName = $(this).val();
	         $.ajax({
   	          type: "POST",
   	          url: "/nssh/dpl/getAllProject",
   	          dataType: "json",
   	         
 	              contentType : 'application/json;charset=utf-8',
   	         success: function (data) {
   	        	 	var value;
            		$("#dplProject").empty();
            		$("#reportProject").empty();
            		$("#planProject").empty();
            		$("#fdbkProject").empty();
            		$("#evltProject").empty();
            		
            		for (var i = 0; i < data.projects.length; i++) {
     	            	 value = (data.projects)[i].proName + "("+ (data.projects)[i].proCode + ")";
             			$("#dplProject").append("<option value='"+value+"'>" + value + "</option>");
             			$("#reportProject").append("<option value='"+value+"'>" + value + "</option>");
             			$("#planProject").append("<option value='"+value+"'>" + value + "</option>");
             			$("#fdbkProject").append("<option value='"+value+"'>" + value + "</option>");
             			$("#evltProject").append("<option value='"+value+"'>" + value + "</option>");
            		}
	           
      	            
   	        	 
   	         },
   	         error: function(XMLHttpRequest, textStatus, errorThrown) {  //#3这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
                       alert(XMLHttpRequest.status);
                       alert(XMLHttpRequest.readyState);
                       alert(textStatus); // paser error;
                   }
   	     });
	    } );
	    
	    
	    
	    $("#teamAdd").click(function(event){
	    	 $("#teamNumber3 option").each(function() { 
	    		$(this).attr("selected", true); 
	    		}); 
	    });
	    
	    $("#dplProject").bind('change',function(){
	    	var isDisabled=false;
       	 $(".add").each(function() {
       		 if($(this).val()==""){
       			 isDisabled = true;
       		 }
       	 });
       	 $("#dplAdd").attr('disabled',isDisabled);
	    });

	    $("#reportProject").bind('change',function(){
	    	var isDisabled=false;
       	 $(".add").each(function() {
       		 if($(this).val()==""){
       			 isDisabled = true;
       		 }
       	 });
       	 $("#reportAdd").attr('disabled',isDisabled);
	    });
	    
	    
	    $(".Wdate.pro").bind(' blur',function(){
	    	var startId = $(this).attr("id").replace("End","Start");
	    	var endId = $(this).attr("id").replace("Start","End");
	    	if($("#"+startId).val()!=""&&$("#"+endId).val()!=""){
	    		var ymdStart = $("#"+startId).val().split("-");
	    		var proStartTime = new Date(ymdStart[0],ymdStart[1],ymdStart[2]);
	    		var ymdEnd = $("#"+endId).val().split("-");
	    		var proEndTime = new Date(ymdEnd[0],ymdEnd[1],ymdEnd[2]);
	    		if(proStartTime>proEndTime){
	    			alert("项目结束时间必须大于开始时间！");
	    			$(this).val("");
	    		}
	    	}
		    	var isDisabled=false;
		    	var isDisabled2=false;
	       	 $(".add").each(function() {
	       		 if($(this).val()==""){
	       			 isDisabled = true;
	       		 }
	       	 });
	       	 

	      	        	$(this).parents('.updateForm').find(".update").each(function() {
	      	        		 if($(this).val()==""){
	      	        			 isDisabled2 = true;
	      	        		 }
	      	        	 });
	      	        	$(this).parents('.updateForm').find(".btn.btn-primary.projectUpdate").attr('disabled',isDisabled2);

	       	 
	       	 $("#projectAdd").attr('disabled',isDisabled);
	    });
	    
	    
	    $(".Wdate.plan").bind(' blur',function(){
	    	var startId = $(this).attr("id").replace("End","Start");
	    	var endId = $(this).attr("id").replace("Start","End");
	    	if($("#"+startId).val()!=""&&$("#"+endId).val()!=""){
	    		var ymdStart = $("#"+startId).val().split("-");
	    		var planStartTime = new Date(ymdStart[0],ymdStart[1],ymdStart[2]);
	    		var ymdEnd = $("#"+endId).val().split("-");
	    		var planEndTime = new Date(ymdEnd[0],ymdEnd[1],ymdEnd[2]);
	    		if(planStartTime>planEndTime){
	    			alert("项目结束时间必须大于开始时间！");
	    			$(this).val("");
	    		}
	    	}
		    	var isDisabled=false;
		    	var isDisabled2=false;
	       	 $(".add").each(function() {
	       		 if($(this).val()==""){
	       			 isDisabled = true;
	       		 }
	       	 });
	       	 

	      	        	$(this).parents('.updateForm').find(".update").each(function() {
	      	        		 if($(this).val()==""){
	      	        			 isDisabled2 = true;
	      	        		 }
	      	        	 });
	      	        	$(this).parents('.updateForm').find(".btn.btn-primary.planUpdate").attr('disabled',isDisabled2);

	       	 
	       	 $("#planAdd").attr('disabled',isDisabled);
	    });
	    
	    
	    
	    $(".add").each(function() {
	        $(this).bind(' input propertychange', function() {
	        	if($(this).attr("id")=="dplWar"){
	        		var value = $(this).val();
	        		var suffix = value.substr(value.lastIndexOf(".")+1);
	        		if(value!=""&&suffix.toLowerCase()!="war"){
	        			alert("请上传war文件！");
	        			$(this).val("");
	        		}
	        	}else if($(this).attr("id")=="dplSql"){
	        		var value = $(this).val();
	        		var suffix = value.substr(value.lastIndexOf(".")+1);
	        		if(suffix.toLowerCase()!="sql"){
	        			alert("请上传sql文件！");
	        			$(this).val("");
	        		}
	        	}
	        	var isDisabled=false;
	        	 $(".add").each(function() {
	        		 if($(this).val()==""){
	        			 isDisabled = true;
	        		 }
	        	 });
	        	 $("#userAdd").attr('disabled',isDisabled);
	        	 $("#teamAdd").attr('disabled',isDisabled);
	        	 $("#dplAdd").attr('disabled',isDisabled);
	        	 $("#projectAdd").attr('disabled',isDisabled);
	        	 $("#reportAdd").attr('disabled',isDisabled);
	        	 $("#planAdd").attr('disabled',isDisabled);
	        	 $("#feedbackAdd").attr('disabled',isDisabled);
	        	 $("#evaluationAdd").attr('disabled',isDisabled);
	        });
	    });
	    
  	   $(".update").each(function() {
   	    	
   	        $(this).bind(' input propertychange change', function() {
   	        	var isDisabled=false;
   	        	$(this).parents('.updateForm').find(".update").each(function() {
   	        		 if($(this).val()==""){
   	        			 isDisabled = true;
   	        		 }
   	        	 });
   	        	$(this).parents('.updateForm').find(".btn.btn-primary.userUpdate").attr('disabled',isDisabled);
   	        	$(this).parents('.updateForm').find(".btn.btn-primary.teamUpdate").attr('disabled',isDisabled);
   	        	$(this).parents('.updateForm').find(".btn.btn-primary.projectUpdate").attr('disabled',isDisabled);
   	        	$(this).parents('.updateForm').find(".btn.btn-primary.planUpdate").attr('disabled',isDisabled);
   	        });
   	    });


  	   
  		$(".dplState").each(function() {
  			$(this).bind('change',function(){
  				

  				window.location.href="/nssh/dpl/setState?state="+$(this).val()+"&id="+$(this).attr("id").substr(8);
  			});
  			
  		});
  		
  		$(".planState").each(function() {
  			$(this).bind('change',function(){

  				window.location.href="/nssh/plan/setState?state="+$(this).val()+"&id="+$(this).attr("id").substr(9);
  			});
  			
  		});
  	   
	});




	/**
	 * 鼠标划过就展开子菜单，免得需要点击才能展开
	 */
	function dropdownOpen() {
	 
	    var $dropdownLi = $('li.dropdown');
	 
	    $dropdownLi.mouseover(function() {
	        $(this).addClass('open');
	    }).mouseout(function() {
	        $(this).removeClass('open');
	    });
	}
	function userUpdate(form){
		if (confirm("确定要更新此记录吗？")){
			form.action = "/nssh/user/userUpdate";
			form.submit();
		}
	}

	function projectUpdate1(form){
		if (confirm("确定要更新此记录吗？")){
			form.action = "/nssh/project/projectUpdate";
			form.submit();
		}
	}
	function planUpdate1(form){
		if (confirm("确定要更新此记录吗？")){
			form.action = "/nssh/plan/planUpdate";
			form.submit();
		}
	}
	
	function setCreateTime(){
		var currentDate = dateFtt("yyyy-MM-dd hh:mm:ss",new Date());
		$("#createTime").attr("value",currentDate);
		$("#reportDate").attr("value",currentDate);
		$("#fdbkTime").attr("value",currentDate);
		$("#evltTime").attr("value",currentDate);
	}
	
	function teamUpdate1(id){
		if (confirm("确定要更新此记录吗？")){
	    	 $("#teamNumber3"+id+" option").each(function() { 
		    		$(this).attr("selected", true); 
		    		}); 
	    	 $("#"+id+"updateForm").attr("action", "/nssh/team/teamUpdate");
	    	 $("#"+id+"updateForm").submit();
		}
	}
	
	
	
	function projectDelete(form){
		if (confirm("确定要删除此记录吗？")){
			form.action = "/nssh/project/projectDelete";
			form.submit();
		}
	}
	function planDelete(form){
		if (confirm("确定要删除此记录吗？")){
			form.action = "/nssh/plan/planDelete";
			form.submit();
		}
	}
	function userDelete(form){
		if (confirm("确定要删除此记录吗？")){
			form.action = "/nssh/user/userDelete";
			form.submit();
		}
	}
	function teamDelete1(form){
		if (confirm("确定要删除此记录吗？")){
			form.action = "/nssh/team/teamDelete";
			form.submit();
		}
	}
	
	
	function userOrder(orderBy){
		window.location.href="/nssh/user/userOrder?orderBy="+orderBy;
	}
	function teamOrder(orderBy){
		window.location.href="/nssh/team/teamOrder?orderBy="+orderBy;
	}
	function dplOrder(orderBy){
		window.location.href="/nssh/dpl/dplOrder?orderBy="+orderBy;
	}
	function reportOrder(orderBy){
		window.location.href="/nssh/report/reportOrder?orderBy="+orderBy;
	}
	function checkAll(allcheck){
		if(allcheck.checked){
			$('input[type=checkbox]').each(function() {
		        $(this).prop('checked', true);
			});
		}
		else{
			$('input[type=checkbox]').each(function() {
		        $(this).prop('checked', false);
			});
		}
	
	}
	
	function deleteConfirm(){
		if (confirm("确定要删除此记录吗？")){
			$("#deleteCheck").submit();
		}
	}
	setInterval(function(){
		var ischecked = false;
		var checkCount = 0;
		$("input[type=checkbox]:checked").each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
			ischecked = true;
			checkCount++;
			$("#"+$(this).val()+"tr").addClass("active");
			});
		
		$("input[type=checkbox]:not(:checked)").each(function(){
			checkCount++;
			$("#"+$(this).val()+"tr").removeClass("active");
			}); 
        	$("#deleteChecked").attr('disabled',!ischecked);

    		if(checkCount==1)
            	$("#deleteChecked").attr('disabled',true);

        
    },200);
	
	
	function setAppendId(appendId){
		
		$("#appendMid").attr("value",appendId);
		var currentDate = dateFtt("yyyy-MM-dd hh:mm:ss",new Date());
		$("#appendContentM").attr("value",currentDate);
		$('.form-control.append').bind(' input',function(){
  				if($(this).val()!=""){
  	            	$("#appendAdd").attr('disabled',false);
  				}else{

  	            	$("#appendAdd").attr('disabled',true);
  				}
  				
  			});
	}
	
	
	
	
	/**************************************时间格式化处理************************************/
	function dateFtt(fmt,date)   
	{ //author: meizz   
	  var o = {   
	    "M+" : date.getMonth()+1,                 //月份   
	    "d+" : date.getDate(),                    //日   
	    "h+" : date.getHours(),                   //小时   
	    "m+" : date.getMinutes(),                 //分   
	    "s+" : date.getSeconds(),                 //秒   
	    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
	    "S"  : date.getMilliseconds()             //毫秒   
	  };   
	  if(/(y+)/.test(fmt))   
	    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
	  for(var k in o)   
	    if(new RegExp("("+ k +")").test(fmt))   
	  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	  return fmt;   
	}
	
	