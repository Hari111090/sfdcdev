({
    showToast : function(component, event, helper) {
                
        var params = event.getParam( 'arguments' );  
        try {
          component.find('notifLib').showToast({
                "variant": params.messageType,
                "message": params.message,
                "mode": "dismissable"
            });
        }
        catch(err) {
            component.set("v.message", params.message);
            component.set("v.messageType", params.messageType);
            
            $A.util.removeClass( component.find( 'toastModel' ), 'slds-hide' );
            $A.util.addClass( component.find( 'toastModel' ), 'slds-show' );
            
            var closeTime =  component.get("v.autoCloseTime");
            var autoClose =  component.get("v.autoClose");
            var autoCloseErrorWarning =  component.get("v.autoCloseErrorWarning");
            
            if(autoClose)
                if( (autoCloseErrorWarning && params.messageType != 'success') || params.messageType == 'success') {
                setTimeout(function(){ 
                    $A.util.addClass( component.find( 'toastModel' ), 'slds-hide' ); 
                    component.set("v.message", "");
                    component.set("v.messageType", "");
                }, closeTime);
            }
        }
       
	},
    
	closeModel : function(component, event, helper) {
		$A.util.addClass( component.find( 'toastModel' ), 'slds-hide' );
        component.set("v.messageType", "");
        component.set("v.messageType", "");
	}
})
/*var title = '';
var type = '';
var message = '';
if (state == "SUCCESS") {
    //Reset Form
    var newContact = {
        'sobjectType': 'Contact',
        'contact_FNAME__c': '',
        'contact_LNAME__c': '',
        'Email': '',
        'Phone': ''
    };
    //resetting the Values in the form
    component.set("v.Contact", newContact);
    alert('Record is Created Successfully');
    title = 'Success';
    type = 'success';
    message = 'Record is Created Successfully';
} else if (state == "ERROR") {
    title = 'Error';
    type = 'error';
    message = 'Error in calling server side action';
    alert('Error in calling server side action');
}
var toastEvent = $A.get("e.force:showToast");
toastEvent.setParams({
    "title": title,
    "type": type,
    "message": message
});
toastEvent.fire();*/