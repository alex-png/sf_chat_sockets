({
	pageRefresh : function(component) {
		let getAction = component.get("{!c.getPosts}")
        	getAction.setCallback(this, function(response){
            console.log("loop??");
            let list = response.getReturnValue();
            component.set("v.allPosts", list);
            component.set("v.allPostsCalled", true);
            
                                  
        });
        $A.enqueueAction(getAction);}
})