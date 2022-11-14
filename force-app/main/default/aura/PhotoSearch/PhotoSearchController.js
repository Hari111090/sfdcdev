({
	doInt : function(component, event, helper) {
		
	},
    photoSearch : function(component, event, helper) {
		var idphoto=component.get("v.photoid");
        var action = component.get("c.getPhoto");        
        action.setParams({
            idphoto: idphoto
        });
        // Callback function to get the response
        action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
            // Check if response state is success
            if(state === 'SUCCESS') {
                // Getting the list of contacts from response and storing in js variable
                var photosDetail = response.getReturnValue();
                console.log('photosDetail values from apex'+ photosDetail);
                console.log('photos values'+JSON.stringify(photosDetail));
                //
                //console.log('picss'+JSON)
                // Set the list attribute in component with the value returned by function
                component.set("v.photosDetail",photosDetail);
                component.set("v.showimage",true);
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');
            }
        });
        // Adding the action variable to the global action queue
        $A.enqueueAction(action);
        }
})