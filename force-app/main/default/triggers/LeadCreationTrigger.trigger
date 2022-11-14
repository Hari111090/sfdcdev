trigger LeadCreationTrigger on Account (after insert) {
   /* for(Account acc:trigger.new){
        if(acc.lead_Qualification__c==true){
            lead objlead = new lead(LastName=acc.Name,Company='ANC',Status='Working-Contacted');
            System.debug('======>>>>>'+objlead);
            insert objlead;
        }
    }*/

}