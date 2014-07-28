 /*
no dom lookup anywhere except constructor
no anonymous function
no method calls in constructor
pull out methods for anything
*/

//using observer pattern in jquery 
//car c1 = new cal()
//var c2 = new cal()
//c1.registerObserver(c2)
//c2.registerObserver(c1)


$(document).ready(function(	){
	var newcalculator= new calculator("#calculator");
	var newcalculator1= new calculator("#calculator1");
	var newcalculator2 = new calculator("#calculator2");
});

var calculator =function(viewId)
{
	this.viewElement = $(viewId);
	this.commandElement = this.viewElement.find("#command");
	this.submitButtonElement = this.viewElement.find("#sub");
	this.resultElement = $("#result");
	this.initialize();
}
calculator.prototype = {
	initialize: function(){
		this.create();
		this.cal_api();
	},
	create : function(){
		var loadUrl='http://localhost:3000/api/calculator';
		$.ajax({
			type: 'POST',
			dataType: 'json',
			url: loadUrl,
			success: function(anotherResult){
				console.log("success");
			},
			error: function(result){
				console.log(JSON.stringify(result));
			}
		});

	},
	cal_api :function() {
		var self = this;
		self.observeButton();
	},

	observeButton: function(){
		var self = this;
		// self.submitButtonElement.click(function(){
		// 	self.calculate();			
		// });
 		//using bind method for the same implementation
		self.submitButtonElement.click(_.bind(this.calculate,this));
	},
	calculate: function(){
		var loadUrl='http://localhost:3000/api/calculator';
			cmd=this.commandElement.val();
			console.log(cmd)
			var self = this;
			$.ajax({
				url:loadUrl,
				data:{command:cmd},
				type :'PUT',
				success: function(anotherResult){
					console.log(cmd);
					self.resultstring(anotherResult.state,cmd,self); 
				},
				error: function(result){
					console.log(JSON.stringify(result));
				}
			});

	},

	resultstring :function(state,command)
	{
		this.resultElement.append("<div>OutPut of Command " + command + " is " + state+'</div>');
	}

}