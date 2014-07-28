
$(document).ready(function(	){
	 var newcalculator= new calculator("#calculator");
	 newcalculator.cal_api();
	 	 var newcalculator1= new calculator("#calculator1");
	 newcalculator1.cal_api();
});

var calculator =function(viewId)
{
	this.viewElement = $(viewId);
   this.commandElement = this.viewElement.find("#command");
   this.submitButtonElement = this.viewElement.find("#sub");
   this.resultElement = this.viewElement.find("#result1");
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
		self.submitButtonElement.click(function(){
        var loadUrl='http://localhost:3000/api/calculator';
		cmd=self.commandElement.val();
		console.log(cmd)
        
		$.ajax({
			url:loadUrl,
		   data:{command:cmd},
		   type :'PUT',
		   success: function(anotherResult){
		   	alert(command);
               self.resultstring(anotherResult.state,cmd,self); 
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