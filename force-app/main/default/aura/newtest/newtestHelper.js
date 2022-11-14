({
    showHideSpinner : function(component) {
        var logovalue = component.get('v.show');
        
        if(logovalue) {
            console.log('logovalue'+logovalue);
            var spinner = component.find("spinner");
            console.log('spinner'+spinner);
        	$A.util.removeClass(spinner, "slds-hide");
        } else {
            console.log('logovalue'+logovalue);
            var spinner = component.find("spinner");
            console.log('spinner'+spinner);
        	$A.util.addClass(spinner, "slds-hide");
        }
    }

})