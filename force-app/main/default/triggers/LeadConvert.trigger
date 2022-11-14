trigger LeadConvert on Lead (after insert,after update) {
//Bulkified
List<String> LeadNames = new List<String>{};
for(Lead myLead: Trigger.new){
 if(myLead.isconverted==false)  {
Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(myLead.Id);
        lc.convertedStatus = 'Closed - Not Converted';
        //Database.ConvertLead(lc,true);
        lc.setDoNotCreateOpportunity(true);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        }
        }
}