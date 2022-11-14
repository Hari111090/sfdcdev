trigger test on Lead (before update) {
 for(Lead lead:System.Trigger.new) {
     if (Lead.IsConverted){
         
     }
  //do somethign here with converted leads
 }
}