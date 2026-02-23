using { Currency } from '@sap/cds/common';

namespace MJJM.commons;

type GUID : String(32);

type Gender:String(1) enum{
    male='M';
    female='F';
    undiscolsed='U';
}

type AmountT : Decimal(10,2) @(
    Semantics.amount.currencyCode:'CURRENCY_code',
    sap.unit:'CURRENCY_code'
);


aspect Amount : {
    CURRENCY:Currency;
    GROSS_Amount:AmountT;
    NET_Amount:AmountT;
    TAX_Amount:AmountT;
}

type phoneNumber: String(30) @assert.format : '^(\+91[\-\s]?|91[\-\s]?|0)?[6-9]\d{9}$';

type emailAddress: String(255) @assert.format : '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
