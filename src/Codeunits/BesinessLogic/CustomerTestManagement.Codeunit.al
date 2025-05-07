codeunit 50315 "Customer Test Management"
{
    procedure ValidateSellToCustomerNo(var SalesOrderTestHeader: Record "Sales Order Test Header"; CustomerNo: Code[20])
    var
        CustomerExt: Record CustomerExt;
        Contact: Record Contact;
    begin
        if CustomerNo = '' then begin
            SalesOrderTestHeader."Sell-to Customer Name" := '';
            SalesOrderTestHeader."Sell-to Contact" := '';
            exit;
        end;

        if CustomerExt.Get(CustomerNo) then begin
            SalesOrderTestHeader."Sell-to Customer Name" := CustomerExt."Test Name";

            // Tìm liên hệ mặc định của khách hàng
            Contact.SetRange("Company No.", CustomerExt."Test ID");
            if Contact.FindFirst() then
                SalesOrderTestHeader."Sell-to Contact" := Contact.Name
            else
                SalesOrderTestHeader."Sell-to Contact" := '';
        end else begin
            SalesOrderTestHeader."Sell-to Customer Name" := '';
            SalesOrderTestHeader."Sell-to Contact" := '';
        end;
    end;
}