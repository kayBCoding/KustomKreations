@isTest
public class KustomKreationsTesting {
    @isTest static void testOrders(){
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Active__c = 'Yes';
        insert acc; 
        
        Contact con = new Contact(); 
        con.FirstName = 'Pam';
        con.Lastname = 'Williams';
        con.Phone = '222-545-3233';
        insert con; 
        
        
        Order one = new Order();
         one.Customer_Name__c = con.Id;
         one.EffectiveDate = Date.newInstance(2022, 7, 25);
         one.EndDate = System.today().addDays(10);
         one.Order_Location__c = 'Kustom Kreations Las Vegas';
         one.Wrapping_Choice__c = 'In Store Standard';
         one.Status = 'Submitted';
         one.AccountId = acc.Id;
        
         insert one;
        
        KustomKreationsController kkc = new KustomKreationsController();
       Test.startTest();
       List<Order> orderResult =  kkc.getOrders();
        
        system.debug(orderResult);
        kkc.sortByLocationName();
        kkc.sortbyOrderNumber();
        Test.stopTest();

    }
}