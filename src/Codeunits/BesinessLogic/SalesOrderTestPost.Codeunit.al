codeunit 50328 "Sales Order Test Post"
{
    procedure PostOrder(var SalesOrderTestHeader: Record "Sales Order Test Header"; ShowDialog: Boolean; PostingFromWhseShip: Boolean)
    begin
        // Thêm logic xử lý việc đăng đơn hàng ở đây
        // Ví dụ:
        if ShowDialog then
            Message('Đơn hàng %1 đã được đăng thành công.', SalesOrderTestHeader."No.");

        // Cập nhật trạng thái đơn hàng sau khi đăng
        SalesOrderTestHeader.Status := SalesOrderTestHeader.Status::Released;
        SalesOrderTestHeader.Modify();
    end;

    // Add this method to your "Sales Order Test Post" codeunit
    procedure PreviewPosting(var SalesOrderTestHeader: Record "Sales Order Test Header")
    begin
        // This is a simplified implementation
        Message('Preview posting for Sales Order %1', SalesOrderTestHeader."No.");
    end;
}