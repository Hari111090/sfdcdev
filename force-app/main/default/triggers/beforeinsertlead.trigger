trigger beforeinsertlead on Lead (before insert) {
      for(Lead Ld: Trigger.new){
          //if(Ld.Status == 'Qualified'){
              if(Ld.isconverted==true) {
           Ld.Lead_Qualification__c =false;
              Ld.addError('Sorry! We cannot convert unqualified lead into Account and contact.');
        }
    }
}