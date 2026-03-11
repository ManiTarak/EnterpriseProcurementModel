using {MJJM.Gen.master as master,MJJM.Gen.transaction as transaction} from '../db/EPM-Db';
using {MJJM.views.ViewsEPM as views} from '../db/EPM-views';

namespace MJJM.Service;

service EPMService  @(path:'EPMService', requires:'authenticated-user') {

    entity POEntitySet @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
         when 'O' then 'New'
         when 'P' then 'Pending'
         when 'C' then 'Completed'
             end as OVERALL_STATUS_Text:String(10),
        case OVERALL_STATUS
          when 'O' then 1
          when 'P' then 2
          when 'C' then 3 
             end as IconColor:Integer
    }
    actions{
        action increaseSalary() returns POEntitySet;
    };
    entity BPEntitySet as projection on master.businesspartner;
    //@readonly
    entity AddressSet @(restrict:[
        {grant:['READ'], to:'Display', where:'COUNTRY=$user.Country'},
        {grant:['WRITE'], to:'Edit'}
        ]) as projection on master.address;
    entity ProductViewSet as projection on views.ProductView;
    entity POitemsset as projection on transaction.poitems;
    @Capabilities:{
       Updatable:false,
       Deletable:false,
    }
    entity EmployeeSet @(restrict:[
        {grant:['READ'], to:'Display', where:'bankName=$user.BankName'},
        {grant:['WRITE'], to:'Edit'}
        ]) as projection on master.Employees;
    
    function getMostExpensiveOrder() returns POEntitySet;
}