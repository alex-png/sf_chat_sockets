public class createTask {
	
    public static void associateTaskWithOpportunity(List<Opportunity> opps){
        for(Opportunity opp:opps){
            if(opp.stageName == 'Closed Won'){
                Task newTask = createNewTask();
                newTask.WhatId = opp.id;
            }
        }
    }
	
    public static Task createNewTask(){
        Task newTask = new Task();
        newTask.Subject = 'Follow Up Test Task';
        return newTask;
    }
}