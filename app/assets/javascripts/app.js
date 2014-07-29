
// in oberserver pattern we do following
// observer/register
// notify
// handle

$(document).ready(function(){
	var cal1 = new Calculator("#calculator1");
	var cal2 =new Calculator("#calculator2");
	cal1.registerObservers(cal2);
	cal2.registerObservers(cal1);
});

var Calculator = function(viewid){
	this.command = $(viewid).find('.command');
	this.result = $(viewid).find(".result");
	this.button = $(viewid).find(".sub");
	this.initialize();
	this.observers = $({});
}

Calculator.prototype = {
	initialize : function(){
		this.makeCreateCall();
		this.calculate();
	},
	calculate : function (){
		this.observeButton();
	},
	makeCreateCall: function(type,url){
		$.ajax({
			method: 'POST',
			url:"/api/calculator"
		});
	},
	printResult: function(result){
		if(result != '') console.log(result);
		this.result.append("<div><span>Now </span> "+result['state']+"</div>");
	},
	observeButton: function(){
		var self = this;
		this.button.click(_.bind(this.processCalculation, this));
	},
	processCalculation: function(){
		var self = this;
		$.ajax({
			method: 'PUT',
			data: {"command": self.command.val()},
			url:"/api/calculator",
			success: function(result){
				self.printResult(result);
				self.notifyObservers(result);
			},
			error: function(){
				console.log('network down');
			}
		});
	},
	registerObservers: function(otherCalculator){
		var self =this
    // this.observers.on("calculator:notiyfy", _.bind(otherCalculator.printResult, otherCalculator));
    self.observers.on("calculator:notify",function(event,result){
    	otherCalculator.printResult(result);
    })
},
notifyObservers: function(result){
	var self= this
	self.observers.trigger("calculator:notify",result);
}
}