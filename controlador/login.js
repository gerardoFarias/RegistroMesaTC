$(document).ready(function(){
    $('#login').click(function(){

var user  = ('#user').val();
var pass = ('#pass').val();

if($.trim(user).length > 0 && $.trim(pass).length > 0){

    $.ajax({

            url:"../model/logon.php",
            method:"POST",
            data: {user_user,pass:pass},
            cache:"false",
            befoteSend:function(){
                $('#login').val("Conectando.....");
            },
            success:function(data){
                $('#login').val("login");
                if(data =="1"){
                    $(location).attr('href','../model/login-php');

                }s
            }

    });

};

    })
});