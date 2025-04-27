codeunit 50300 "Sales Order Test Management"
{
    procedure CalcTotals(var SalesOrderTestHeader: Record "Sales Order Test Header")
    begin
        SalesOrderTestHeader."Subtotal Excl. VAT" := GetSubtotalExclVAT(SalesOrderTestHeader);
        SalesOrderTestHeader."Amount" := SalesOrderTestHeader."Subtotal Excl. VAT" - SalesOrderTestHeader."Invoice Discount Amount";
        SalesOrderTestHeader."Total VAT" := GetTotalVAT(SalesOrderTestHeader);
        SalesOrderTestHeader."Amount Including VAT" := SalesOrderTestHeader."Amount" + SalesOrderTestHeader."Total VAT";
        SalesOrderTestHeader.Modify();
    end;

    procedure GetSubtotalExclVAT(SalesOrderTestHeader: Record "Sales Order Test Header"): Decimal
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
        SubtotalExclVAT: Decimal;
    begin
        SalesOrderTestLine.SetRange("Document No.", SalesOrderTestHeader."No.");
        if SalesOrderTestLine.FindSet() then
            repeat
                SubtotalExclVAT += SalesOrderTestLine."Line Amount";
            until SalesOrderTestLine.Next() = 0;
        exit(SubtotalExclVAT);
    end;

    procedure GetTotalVAT(SalesOrderTestHeader: Record "Sales Order Test Header"): Decimal
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
        TotalVAT: Decimal;
    begin
        SalesOrderTestLine.SetRange("Document No.", SalesOrderTestHeader."No.");
        if SalesOrderTestLine.FindSet() then
            repeat
                TotalVAT += SalesOrderTestLine."Line Amount" * SalesOrderTestLine."VAT %" / 100;
            until SalesOrderTestLine.Next() = 0;
        exit(TotalVAT);
    end;

    procedure UpdateHeaderAmountsFromLine(DocumentNo: Code[20])
    var
        SalesOrderTestHeader: Record "Sales Order Test Header";
    begin
        if SalesOrderTestHeader.Get(DocumentNo) then
            CalcTotals(SalesOrderTestHeader);
    end;

    procedure CalculateInvoiceDiscount(var SalesOrderTestHeader: Record "Sales Order Test Header")
    begin
        // Triển khai logic tính chiết khấu hóa đơn ở đây
        CalcTotals(SalesOrderTestHeader);
    end;
}