codeunit 50301 "S_Order Test Line Management"
{
    procedure GetNextLineNo(DocumentNo: Code[20]): Integer
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
        NextLineNo: Integer;
    begin
        NextLineNo := 10000;
        SalesOrderTestLine.SetRange("Document No.", DocumentNo);
        if SalesOrderTestLine.FindLast() then
            NextLineNo := SalesOrderTestLine."Line No." + 10000;
        exit(NextLineNo);
    end;

    procedure CalcLineAmount(var SalesOrderTestLine: Record "_Sales Order Test Line")
    begin
        SalesOrderTestLine."Line Amount" := SalesOrderTestLine.Quantity * SalesOrderTestLine."Unit Price Excl. VAT";
        SalesOrderTestLine.Modify();
    end;

    procedure DeleteLine(var SalesOrderTestLine: Record "_Sales Order Test Line")
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        if SalesOrderTestLine.Delete(true) then
            SalesOrderTestMgt.UpdateHeaderAmountsFromLine(SalesOrderTestLine."Document No.");
    end;
}