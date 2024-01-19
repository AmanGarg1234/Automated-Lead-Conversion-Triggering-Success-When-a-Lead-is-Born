trigger AutoLeadConvertedHandlerTrigger on Lead (after insert) {
    
    Set<Id> setOfLeadIds = new Set<Id>();
    if(Trigger.IsAfter && Trigger.isInsert){
        for(Lead lead : trigger.new){
            //You can check any condition in the Lead Source
            if(lead.LeadSource == 'Web'){
                setOfLeadIds.add(lead.Id);
            }
        }
        if(setOfLeadIds.size()> 0){
AutoLeadConvertedHandler.autoConvertLeads(setOfLeadIds);
        }
    }
}
