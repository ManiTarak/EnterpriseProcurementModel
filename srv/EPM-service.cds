using {MJJM.Gen.master as master,MJJM.Gen.transaction as transaction} from '../db/EPM-Db';
using {MJJM.views.ViewsEPM as views} from '../db/EPM-views';

namespace MJJM.Service;

service EPMService  @(path:'EPMService') {

    entity POEntitySet as projection on transaction.purchaseorder
    actions{
        action increaseSalary() returns POEntitySet;
    };
    entity BPEntitySet as projection on master.businesspartner;
    @readonly
    entity AddressSet as projection on master.address;
    entity ProductViewSet as projection on views.ProductView;
    entity POitemsset as projection on transaction.poitems;
    @Capabilities:{
       Updatable:false,
       Deletable:false,
    }
    entity EmployeeSet as projection on master.Employees;
    
    function getMostExpensiveOrder() returns POEntitySet;
}