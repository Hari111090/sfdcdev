({
 doInit : function(component, event, helper){
        var action = component.get("c.fetchTaskandEvent"); 
        action.setParams({
            contactId: component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var lstContact=response.getReturnValue();            
                component.set("v.listOfContacts", response.getReturnValue());                
            }
            else if(state === "ERROR"){
                console.log('A problem occurred: ' + JSON.stringify(response.error));
            }
        });
        
        $A.enqueueAction(action);
 }
})