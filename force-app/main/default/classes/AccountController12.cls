public class AccountController12{
@AuraEnabled
public static List <Account> fetchAccounts(){
List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone from Account LIMIT 10];
                                    return accList;
    }

}