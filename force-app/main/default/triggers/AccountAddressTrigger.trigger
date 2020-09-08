trigger AccountAddressTrigger on Account (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        matchBillingAddressTrue.checkBox(trigger.new);
    }
}