({
    submit : function(component, event, helper) {
        let userInput = component.get("v.userInput");
        let action = component.get("{!c.createPost}");
        component.set("v.userInput", "");
        action.setParams({
            "body":userInput
        });
        
        action.setCallback(this, function(response){
            let list = response.getReturnValue();
            helper.pageRefresh(component);
        });
        
        $A.enqueueAction(action); 
        
    },
    
    doInit : function(component, event, helper){
        helper.pageRefresh(component); 
    }
})