using {MJJM.Gen.master.businesspartner as businesspartner,MJJM.Gen.master.address as address,MJJM.Gen.transaction.purchaseorder as Pos} from '../db/EPM-Db';
service DummySrv @(path:'DummySrv') {
    entity BPEntitySet as projection on businesspartner;
    entity AddressSet as projection on address;
    entity POEntitySet as projection on Pos;
}