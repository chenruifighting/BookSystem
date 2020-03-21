let flag=60;
$(function(){
    $("#getCode").click(
        function(){
            const telephone=$("#telephone").val();
            if(flag<60){
                return;
            }
            $.ajax({
                url:"code",
                data:{"telephone":telephone},
            });
            timer();
        }
    );
});
function timer(){
    flag--;
    $("#getCode").html(flag+"秒后，重新获取验证码");
    if(flag==0){
        $("#getCode").html("获取验证码");
        flag=60;
    }else{
        setTimeout("timer()",1000);
    }
}