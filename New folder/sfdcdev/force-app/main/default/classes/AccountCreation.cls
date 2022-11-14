/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountCreation {
    /*account creation list*/
    public List<Account> createaccount(String s,String p){
       List<Account> a =new List<Account>();
        for(Account acc:a){
            acc.name=s;
            acc.phone=p;
            insert acc;
        }
        return a;
    }
}