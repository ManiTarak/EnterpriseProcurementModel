using {MJJM.Gen.master as master,MJJM.Gen.transaction as transaction} from '../db/EPM-Db';
using {MJJM.views.ViewsEPM as views} from '../db/EPM-views';

namespace MJJM.Service;

service EPMService {

    entity POEntitySet as projection on transaction.purchaseorder;

    entity BPEntitySet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity ProductViewSet as projection on views.ProductView;
    entity POitemsset as projection on transaction.poitems;
    
}