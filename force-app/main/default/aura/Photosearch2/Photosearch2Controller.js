({
    photoSearch : function(component, event, helper) {
        

        var idphoto=component.get("v.photoid");
        var action = component.get("c.getPhotos");        
        action.setParams({
            idphoto: idphoto
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var photosDetail = response.getReturnValue();
                console.log('photosDetail values from apex'+ photosDetail);
                console.log('photos values'+JSON.stringify(photosDetail));
                component.set("v.photosDetail",photosDetail);
                component.set("v.showphotosDetail",true);
            }
            else {
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
        }
})