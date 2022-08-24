public class KustomKreationsController {
private String sortOrder = 'OrderNumber';
public List<Order> getOrders(){
        List<Order> results = Database.query(
            'SELECT Customer_Name__r.name, Status, OrderNumber, Order_Location__c ' + 'FROM Order ' + 'ORDER By ' + sortOrder);
        return results;
    }

    public void sortbyOrderNumber(){
    this.sortOrder = 'OrderNumber';
}
    public void sortByLocationName(){
    this.sortOrder = 'Order_Location__c';
}
}