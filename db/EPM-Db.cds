using { cuid } from '@sap/cds/common';
using { MJJM.commons as commons} from './commons.cds';

namespace MJJM.Gen;

context master{
    entity Employees:cuid{
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        sex: String(1);
        language: String(1);
        phoneNumber: commons.phoneNumber;
        email: commons.emailAddress;
        Currency: String(4);
        salaryAmount: Decimal(10, 2);
        accountNumber: String(16);
        bankId: String(8);
        bankName: String(64);
    }

    entity businesspartner {
            key NODE_KEY: commons.GUID;
            BP_ROLE: String(2);
            EMAIL_ADDRESS: String(105);
            PHONE_NUMBER: String(32);
            FAX_NUMBER: String(32);
            WEB_ADDRESS: String(44);
            BP_ID: String(32);
            COMPANY_NAME: String(250);
            Address_Guid: Association to one address;
        }

    entity address {
            key NODE_KEY: commons.GUID;
            CITY: String(44);
            POSTAL_CODE: String(8);
            STREET: String(44);
            BUILDING: String(128);
            COUNTRY: String(44);
            ADDRESS_TYPE: String(44);
            VAL_START_DATE: Date;
            VAL_END_DATE: Date;
            LATITUDE: Decimal;
            LONGITUDE: Decimal;
            businesspartnerID: Association to one businesspartner on businesspartnerID.NODE_KEY=$self.NODE_KEY;
        }

    entity product {
                    key NODE_KEY: commons.GUID;
                    PRODUCT_ID: String(28);
                    TYPE_CODE: String(2);
                    CATEGORY: String(32);
                    DESCRIPTION: localized String(255);
                    SUPPLIER_GUID: Association to businesspartner;
                    TAX_TARIF_CODE: Integer;
                    MEASURE_UNIT: String(2);
                    WEIGHT_MEASURE: Decimal(5,2);
                    WEIGHT_UNIT: String(2);
                    CURRENCY_CODE: String(4);
                    PRICE: Decimal(15,2);
                    WIDTH: Decimal(15,2);
                    DEPTH: Decimal(15,2);
                    HEIGHT: Decimal(15,2);
                    DIM_UNIT: String(2);
        }
}


context transaction {

    entity purchaseorder : commons.Amount {
        key NODE_KEY        : commons.GUID;
        PO_ID               : String(40);
        PARTNER_GUID        : Association to one master.businesspartner;
        LIFECYCLE_STATUS    : String(1);
        OVERALL_STATUS      : String(1);
        Items               : Composition of many poitems
                              on Items.PARENT_KEY = $self;
    };

    entity poitems : commons.Amount {
        key NODE_KEY   : commons.GUID;
        PARENT_KEY     : Association to one purchaseorder;
        PO_ITEM_POS    : Integer;
        PRODUCT_GUID   : Association to one master.product;
    }

}