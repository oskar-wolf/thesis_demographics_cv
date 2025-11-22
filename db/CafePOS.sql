USE SGCCafe
SELECT 
    Accounting.AccoID,
    Accounting.AccoDate,
    Accounting.AccoDocNo,
    Accounting.AccoTypeId,
    Accounting.AccoAmount,
    Accounting.AccoDebit,
    Accounting.AccoCredit,
    Accounting.VatRateId,
    Accounting.VatAmount,
    Accounting.SessionID,
    Accounting.AuditNo,
    Accounting.AuditSubNo,
    Accounting.WeekNo,
    Accounting.Total,
    Accounting.AccoDateStamp,
    AccountingDetails.Quantity,
    AccountingDetails.Discount,
    AccountingDetails.UnitPrice,
    StockCategory.StockCateDesc,
    StockNames.StockName,
    StockSize.StockSizeDesc,
    StockDescriptions.StockDesciption
FROM 
    StockDescriptions 
    RIGHT OUTER JOIN AccountingDetails 
        ON StockDescriptions.StockDescId = AccountingDetails.StockDescId 
    LEFT OUTER JOIN StockSize 
        ON AccountingDetails.StockSizeID = StockSize.StockSizeID 
    LEFT OUTER JOIN StockNames 
        ON AccountingDetails.StockNameID = StockNames.StockNameID 
    LEFT OUTER JOIN StockCategory 
        ON AccountingDetails.StockCateID = StockCategory.StockCateID 
    RIGHT OUTER JOIN Accounting 
        ON AccountingDetails.AccoID = Accounting.AccoID
WHERE 
    Accounting.AccoTypeId = 7
    AND CAST(Accounting.AccoDate AS DATE) = '2025/10/19'  

ORDER BY 
    Accounting.AccoID;
