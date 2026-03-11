using MJJM.Service.EPMService as service from '../../srv/EPM-service';

annotate service.POEntitySet with @(
 UI.SelectionFields:[
    PO_ID,
    GROSS_Amount,
    CURRENCY_code
 ],
 UI.LineItem:[
    {
        $Type:'UI.DataField',
        Value:PO_ID
    },
    {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.COMPANY_NAME
    },
    {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.Address_Guid.COUNTRY
    },
    {
        $Type:'UI.DataField',
        Value:GROSS_Amount
    },
    {
        $Type:'UI.DataField',
        Value:CURRENCY_code
    },
    {
        $Type:'UI.DataField',
        Criticality:IconColor,
        Value:OVERALL_STATUS_Text
    }
],
 UI.HeaderInfo:{
    TypeName:'Purchase Order',
    TypeNamePlural:'Purchase Orders',
    Title:{Value:PO_ID},
    Description:{Value:PARTNER_GUID.COMPANY_NAME},
    ImageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaVXQQ8GDuvDMHQnF_3wRZXdvU0v-4k-tJDbkggHY8WSObgbq1OzPILjdcpqRgbpVsKgx6OpSA_ZLuJCVeUrKZ57uZSbt9Fi1B-DOnK2wWyg&s=10'
 },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            ID : 'OrderDetails',
            Target : '@UI.Identification',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Pricing',
            ID : 'Pricing',
            Target : '@UI.FieldGroup#Pricing',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Items',
            ID : 'OrderItems',
            Target : 'Items/@UI.LineItem#OrderItems',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
            Label : 'PO_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            Label : 'OVERALL_STATUS',
        },
        {
            $Type : 'UI.DataField',
            Value : LIFECYCLE_STATUS,
            Label : 'LIFECYCLE_STATUS',
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_Amount,
            Label : 'GROSS_Amount',
        },
    ],
    UI.FieldGroup #Pricing : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_Amount,
                Label : 'GROSS_Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_Amount,
                Label : 'TAX_Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : NET_Amount,
                Label : 'NET_Amount',
            },
        ],
    },
) ;
annotate service.POitemsset with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : NODE_KEY,
            Label : 'NODE_KEY',
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : PARENT_KEY.OVERALL_STATUS,
            Label : 'OVERALL_STATUS',
        },
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            Label : 'PO_ITEM_POS',
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_Amount,
            Label : 'GROSS_Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : NET_Amount,
            Label : 'NET_Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_Amount,
            Label : 'TAX_Amount',
        },
    ],
    UI.HeaderInfo : {
        TypeNamePlural : 'Order Items',
        TypeName : 'Order Item',
        Title : {
            $Type : 'UI.DataField',
            Value : NODE_KEY,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PARENT_KEY.PO_ID,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Purchase Order Item Basic details',
            ID : 'PurchaseOrderItemBasicdetails',
            Target : '@UI.Identification',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Details',
            ID : 'ProductDetails',
            Target : '@UI.FieldGroup#ProductDetails',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_Amount,
            Label : 'GROSS_Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : NET_Amount,
            Label : 'NET_Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : NODE_KEY,
            Label : 'NODE_KEY',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CompanyName,
            Label : 'CompanyName',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.Country,
            Label : 'Country',
        },
        {
            $Type : 'UI.DataField',
            Value : PARENT_KEY.PARTNER_GUID.BP_ID,
            Label : 'BP_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PARENT_KEY.PARTNER_GUID.COMPANY_NAME,
            Label : 'COMPANY_NAME',
        },
    ],
    UI.FieldGroup #ProductDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.ProductId,
                Label : 'ProductId',
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.ProductName,
                Label : 'ProductName',
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.SupplierID,
                Label : 'SupplierID',
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.Country,
                Label : 'Country',
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.CompanyName,
                Label : 'CompanyName',
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.Category,
                Label : 'Category',
            },
        ],
    },
);

