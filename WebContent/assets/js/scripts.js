
jQuery(document).ready(function() {
	
	
    $('.page-container form').submit(function(){
        var userId = $(this).find('.userId').val();
        var password = $(this).find('.password').val();
        if(userId == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.userId').focus();
            });
            return false;
        }
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
        if(userId!=''&&password!=''){
        	userLogin();
        	return false;
        }
    });

    $('.page-container form .userId, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });
	
	
	
	

    
    function userLogin() {
        var userId = $("#userId").val();
        var password = $("#password").val();
        var user = {
       	 userId : userId,
            password : password
        };//拼装成json格式  

       $.ajax({
           type : "POST",
           url : "/nssh/user/login2",
           data : JSON.stringify(user),
           contentType : 'application/json;charset=utf-8',
           dataType : 'json',
           success : function(data) {

                 if (data.isUser == '1') {
                   window.location.href = "/nssh/home/homeInfo?userId="+userId;
               }else{
       			$("#message").show();
               }  

           },

           error : function(data) {
               alert("出错：" + data);
           }

       });

	}
    
});
