trigger LeadConvert12 on Lead (after insert,after update) {
for(Lead myLead : Trigger.new)
  {
   if((myLead.isconverted==false) && (myLead.Status == 'Open - Not Contacted'))
     //if((myLead.isconverted==false))
   {
    Database.LeadConvert lc = new database.LeadConvert();
    lc.setLeadId(myLead.Id);
    //lc.setconvertedStatus = 'Qualified';        //Database.ConvertLead(lc,true); 
    lc.setConvertedStatus('Closed - Not Converted');
    //lc.setDoNotCreateOpportunity(false);  
    Database.LeadConvertResult lcr = Database.convertLead(lc);
    System.assert(lcr.isSuccess());     
   }
  }
}