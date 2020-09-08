({
    handleChange : function(component, event, helper) {
        let name = component.get("v.name")
        console.log(name)
    },
    
    handleClick : function(component, event, helper) {
        let buttonClicked = event.getSource().get("v.name")
        if(buttonClicked == "inputName"){
            let name = component.get("v.name")
            console.log(name)
            component.set("v.nameEntered", "true")   
        }else if(buttonClicked == "firstChapter"){
            console.log('FIRST CHAPTER!')
            component.set("v.firstChapter", "false")
            component.set("v.secondChapter", "true") 
        }else if(buttonClicked == "2-1"){
            component.set("v.secondChapter", "false") 
            component.set("v.secondChapter1", "true")
        }else if(buttonClicked == "2-2"){
            component.set("v.secondChapter", "false") 
            component.set("v.secondChapter2", "true")
        }else if(buttonClicked == "death" ){
			component.set("v.death1", true)
        }else if(buttonClicked == "macbook"){
            component.set("v.macbook1", true)
        }
    }
})