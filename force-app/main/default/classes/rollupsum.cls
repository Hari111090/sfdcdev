public class rollupsum{
public static void increment(list<contact>con){
set<id>ids = new set<id>();
for(contact c:con){
ids.add(c.accountid);
}
list<account> a=[select id,name,no_of_contacts__c,(select id,lastname from contacts) from account where id=:ids];
for(account ac:a){
ac.no_of_contacts__c =ac.contacts.size();
}
update a;
}

}