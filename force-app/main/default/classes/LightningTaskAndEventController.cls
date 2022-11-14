public class LightningTaskAndEventController {
    @AuraEnabled
    public static List<Contact> fetchTaskandEvent(String contactId) { 
        List<Contact> lstContact=new List<Contact>();
        lstContact=[select id ,Name,Email,(select WhatID,Owner.Name,ActivityDate,Description,id,subject from tasks order by ActivityDate desc limit 5)
                    from contact where id=:contactId];
        return lstContact;
    }
}