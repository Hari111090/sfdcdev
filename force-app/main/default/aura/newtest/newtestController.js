({
	spinnerDisplayHandler : function(component, event, helper) {
        console.log('show spinner value changes');
        helper.showHideSpinner(component); 
        $(window).load(function(){
     $('.loader').fadeOut();
});
    }

})