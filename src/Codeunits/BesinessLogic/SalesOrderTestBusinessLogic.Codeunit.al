codeunit 50305 "Sales Order Test BL"
{
    procedure CreateSalesOrder(var SalesOrderTestHeader: Record "Sales Order Test Header"): Code[20]
    var
        TestNoSeriesMgt: Codeunit "Test No Series Management";
    begin
        SalesOrderTestHeader.Init();
        TestNoSeriesMgt.InitSeries('SOTEST', SalesOrderTestHeader."No. Series", SalesOrderTestHeader."No.");
        SalesOrderTestHeader."Document Date" := WorkDate();
        SalesOrderTestHeader."Posting Date" := WorkDate();
        SalesOrderTestHeader.Insert(true);
        exit(SalesOrderTestHeader."No.");
    end;

    procedure PostSalesOrder(DocumentNo: Code[20]): Boolean
    var
        SalesOrderTestHeader: Record "Sales Order Test Header";
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        if not SalesOrderTestHeader.Get(DocumentNo) then
            exit(false);

        // Kiểm tra điều kiện trước khi đăng
        if not ValidateBeforePosting(SalesOrderTestHeader) then
            exit(false);

        // Cập nhật số tiền cuối cùng
        SalesOrderTestMgt.CalcTotals(SalesOrderTestHeader);

        // Thực hiện đăng (giả định)
        SalesOrderTestHeader."Status" := SalesOrderTestHeader."Status"::Released;  // Changed from Posted to Released
        SalesOrderTestHeader.Modify();

        exit(true);
    end;

    local procedure ValidateBeforePosting(SalesOrderTestHeader: Record "Sales Order Test Header"): Boolean
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
    begin
        // Kiểm tra xem có dòng nào không
        SalesOrderTestLine.SetRange("Document No.", SalesOrderTestHeader."No.");
        if not SalesOrderTestLine.FindSet() then
            exit(false);

        // Thêm các điều kiện kiểm tra khác ở đây

        exit(true);
    end;
}