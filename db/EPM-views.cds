using {MJJM.Gen.master as master ,MJJM.Gen.transaction as transaction} from './EPM-Db';
namespace MJJM.views;


context ViewsEPM{
  define view ![POWorkList] as 
      select from transaction.purchaseorder{
        key PO_ID as ![PurchaseOrderId],
        key Items.PO_ITEM_POS as ![ItemPosition],
        PARTNER_GUID.BP_ID as ![PartnerID],
        PARTNER_GUID.COMPANY_NAME as ![CompanyName],
        Items.GROSS_Amount as ![GrossAmount],
        Items.NET_Amount as ![NetAmount],
        Items.TAX_Amount as ![TaxAmount],
        Items.CURRENCY as ![CurrencyCode],
        OVERALL_STATUS as ![Status],
        Items.PRODUCT_GUID.CATEGORY as ![Category],
        PARTNER_GUID.Address_Guid.COUNTRY as ![Country],
        PARTNER_GUID.Address_Guid.CITY as ![City]
      }

      define view ![ProductHelpView] as select from master.product{
        @EndUserText.Label:[
            {language:'EN', text:'Product Id'},
            {language:'HI', text:'उत्पाद आयडी'}
        ]
        PRODUCT_ID as ![ProductId],
         @EndUserText.Label:[
            {language:'EN', text:'Description'},
            {language:'HI', text:'विवरण'}
        ]
        DESCRIPTION as ![Description],
        CATEGORY as ![Category],
        PRICE as ![Price],
        CURRENCY_CODE as ![CurrencyCode],
        SUPPLIER_GUID.COMPANY_NAME as ![CompanyName]
      }

      define view ![ItemView] as select from transaction.poitems{
        key NODE_KEY,
        PARENT_KEY.PARTNER_GUID.NODE_KEY as ![SupplierID],
        PRODUCT_GUID.NODE_KEY as ![ProductKey],
        GROSS_Amount as ![GrossAmount],
        NET_Amount as ![NetAmount],
        TAX_Amount as ![TaxAmount],
        CURRENCY as ![CurrencyCode],
        PARENT_KEY.OVERALL_STATUS as ![Status]
      }

    define view ![ProductView] as select from master.product
      mixin{
        PO_Items:Association to many ItemView on PO_Items.ProductKey=$projection.ProductId
      } into {
        NODE_KEY as ![ProductId],
        DESCRIPTION as ![ProductName],
        CATEGORY as ![Category],
        SUPPLIER_GUID.BP_ID as ![SupplierID],
        SUPPLIER_GUID.COMPANY_NAME as ![CompanyName],
        SUPPLIER_GUID.Address_Guid.COUNTRY as ![Country],
        PO_Items as ![To_Items]
      }
    define view ![CProductSalesAnalytics] as select from ProductView{
        key ProductName,
        Country,
        round(sum(To_Items.GrossAmount),2) as ![TotalPurchaseAmount]: Decimal(15,2),
        To_Items.CurrencyCode
    } group by ProductName, Country, To_Items.CurrencyCode

}
