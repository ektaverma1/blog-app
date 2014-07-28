
$(document).ready(function(viewId){
	 var newcalculator= new calculator("#command");
	 newcalculator.cal_api();
});

var calculator =function(stack)
{
	this.command = $('#command')
	this.button = $('#sub')
    var loadUrl='http://localhost:3000/api/calculator';
	 $.ajax({
             type: 'POST',
            dataType: 'json',
            url: loadUrl,
            success: function(anotherResult){
             alert("success");
            },
             error: function(result){
  	         alert(JSON.stringify(result));
           }
       });

}
calculator.prototype = {

	cal_api :function() {
		var self = this;
		this.button.click(function(){
        var loadUrl='http://localhost:3000/api/calculator';
		cmd=self.command.val();
		console.log(cmd)
        
		$.ajax({
			url:loadUrl,
		   data:{command:cmd},
		   type :'PUT',
		   success: function(anotherResult){
		   	alert(command);
               self.resultstring(anotherResult.state,command); 
           },
           error: function(result){
  	         alert(JSON.stringify(result));
           }
        });
	
	});
},

resultstring :function(state,command)
{
	$('#result').append("OutPut of Command " + command + " is " + state);
}

}