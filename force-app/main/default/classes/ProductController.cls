public class ProductController {
    
    public String strFamily {get;set;}
    public List<SelectOption> lstOptions {get;set;}
    public Product2 prd {get;set;}
    Public List<Product2> lstProducts {get;set;}
    
    public ProductController() {
        prd = new Product2();
        strFamily = '';
        lstOptions = new List<SelectOption>();
        lstProducts = new List<Product2>();
        
        Schema.DescribeFieldResult familyDesc = Product2.Family.getDescribe();
        List<Schema.PickListEntry> lst5 = familyDesc.getPickListValues();
        for(Schema.PickListEntry obj:lst5){
            lstOptions.add(new SelectOption(obj.getLabel(),obj.getValue()));
        }
    }
    
    
    public  void doNothing() {
        system.debug('Value after change is'+strFamily);
    }
    
    public List<Product2> getProductRecords() {
        lstProducts = [Select id, ProductCode,Family, Name From Product2 Where Family =:strFamily];
        return lstProducts;
    }
}