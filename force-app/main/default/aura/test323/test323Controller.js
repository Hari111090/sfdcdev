({
    init: function (component) {
    },
    
    handleClick: function(component) {
    },
    
    handleBeforeSelect: function(component, event) {
        event.preventDefault();
        console.log(event.getParam('name'));
        component.set('v.activeItem', event.getParam('name'));
        var action = component.get("c.getSobject");
        action.setParams({ objName : component.get("v.activeItem") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.resultData" ,response.getReturnValue())
            }
        });
        $A.enqueueAction(action);
        
        
    },
    redirectToSobject: function(component, event) {
        var selectedItem = event.currentTarget;
        var recordId = selectedItem.dataset.record;
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recordId,
            "slideDevName": "related"
        });
        navEvt.fire();
        
        
    },
})