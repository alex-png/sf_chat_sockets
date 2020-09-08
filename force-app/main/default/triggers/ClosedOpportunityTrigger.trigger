/*trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            createTask.associateTaskWithOpportunity(trigger.new);
        }
    }
    
    
} */

trigger ClosedOpportunityTrigger on Opportunity (after insert,after update)
{
    List<Task> l = new List<Task>();
    for(Opportunity o:[SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.new])
    {
        
            Task t = new Task();
            t.subject='Follow Up Test Task';
            t.WhatId=o.id;
            l.add(t);
     }
    if(l.size()>0 && l.size()-1<=200)
    {
        insert l;
    }
}