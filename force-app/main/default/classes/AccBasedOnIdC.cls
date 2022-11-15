/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccBasedOnIdC {
/*comments*/
    public String selectedAccId{get;set;}
    public Boolean isShow {get;set;}
    public Account acc{get;set;}
    
    public AccBasedOnIdC(){
        isShow=false;
    }
    
    public List<SelectOption> getAccountIds() {
        List<SelectOption> accOptions= new List<SelectOption>();
        accOptions.add( new SelectOption('','--Select--'));
        for( Account acc : [SELECT Id FROM Account ] ) {
            accOptions.add( new SelectOption(acc.Id,acc.Id));
        }
        return accOptions;
    }
    
    public void cont() {
        isShow=true;
        if(selectedAccId != null) {     
            acc = [SELECT Id, Name, Rating FROM Account WHERE Id=:selectedAccId];
        }                 
    }
}