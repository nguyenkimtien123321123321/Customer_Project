pageextension 50327 SalesOrderTestListExt extends "Sales Order Test List"
{
    actions
    {
        addlast(processing)
        {
            group(HomeGroup)
            {
                Caption = 'Home';
                Image = Home;
                action(NewSalesOrderTest)
                {
                    Caption = 'New';
                    ApplicationArea = All;
                    Image = New;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                        SalesOrderTestPage: Page "Sales Order Test Card";
                    begin
                        SalesOrderTestHeader.Init();
                        SalesOrderTestHeader.Insert(true);
                        SalesOrderTestPage.SetRecord(SalesOrderTestHeader);
                        SalesOrderTestPage.Run();
                    end;
                }
                action(DeleteSalesOrderTest)
                {
                    Caption = 'Delete';
                    ApplicationArea = All;
                    Image = Delete;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to delete this record?', false) then
                            Rec.Delete(true);
                    end;
                }
                action(CreateWarehouseShipment)
                {
                    Caption = 'Create Warehouse Shipment';
                    ApplicationArea = All;
                    Image = Shipment;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                if SalesOrderTestHeader.Status = SalesOrderTestHeader.Status::Released then
                                    CreateWarehouseShipmentForOrder(SalesOrderTestHeader)
                                else
                                    Message('Đơn hàng %1 phải ở trạng thái Released để tạo Warehouse Shipment.', SalesOrderTestHeader."No.");
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
                action(CreateInventoryPutAwayPick)
                {
                    Caption = 'Create Inventory Put-away/Pick...';
                    ApplicationArea = All;
                    Image = Inventory;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                if SalesOrderTestHeader.Status = SalesOrderTestHeader.Status::Released then
                                    CreateInventoryPutAwayPickForOrder(SalesOrderTestHeader)
                                else
                                    Message('Đơn hàng %1 phải ở trạng thái Released để tạo Inventory Put-away/Pick.', SalesOrderTestHeader."No.");
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
            }
            group(ReleaseGroup)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    Caption = 'Release';
                    ApplicationArea = All;
                    Image = ReleaseDoc;


                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify();
                    end;
                }
                action(Reopen)
                {
                    Caption = 'Reopen';
                    ApplicationArea = All;
                    Image = ReOpen;


                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                    end;
                }
            }
            group(PostGroup)
            {
                Caption = 'Post...';
                Image = Post;
                action(Post)
                {
                    Caption = 'Post';
                    ApplicationArea = All;
                    Image = Post;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                        SalesOrderTestPost: Codeunit "Sales Order Test Post";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                if SalesOrderTestHeader.Status = SalesOrderTestHeader.Status::Released then
                                    SalesOrderTestPost.PostOrder(SalesOrderTestHeader, false, false)
                                else
                                    Message('Đơn hàng %1 phải ở trạng thái Released để đăng.', SalesOrderTestHeader."No.");
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
                action(PostAndSend)
                {
                    Caption = 'Post and Send...';
                    ApplicationArea = All;
                    Image = PostMail;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                        SalesOrderTestPost: Codeunit "Sales Order Test Post";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                if SalesOrderTestHeader.Status = SalesOrderTestHeader.Status::Released then begin
                                    SalesOrderTestPost.PostOrder(SalesOrderTestHeader, false, false);
                                    SendPostedDocumentByEmail(SalesOrderTestHeader);
                                end else
                                    Message('Đơn hàng %1 phải ở trạng thái Released để đăng và gửi.', SalesOrderTestHeader."No.");
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
                action(PostBatch)
                {
                    Caption = 'Post Batch...';
                    ApplicationArea = All;
                    Image = PostBatch;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                        SalesOrderTestPost: Codeunit "Sales Order Test Post";
                        Selection: Integer;
                    begin
                        Selection := StrMenu('Ship,Invoice,Ship and Invoice', 3, 'Chọn hành động đăng hàng loạt');
                        if Selection = 0 then
                            exit;

                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                if SalesOrderTestHeader.Status = SalesOrderTestHeader.Status::Released then
                                    case Selection of
                                        1:
                                            SalesOrderTestPost.PostOrder(SalesOrderTestHeader, true, false);
                                        2:
                                            SalesOrderTestPost.PostOrder(SalesOrderTestHeader, false, true);
                                        3:
                                            SalesOrderTestPost.PostOrder(SalesOrderTestHeader, true, true);
                                    end
                                else
                                    Message('Đơn hàng %1 phải ở trạng thái Released để đăng hàng loạt.', SalesOrderTestHeader."No.");
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
                action(PreviewPosting)
                {
                    Caption = 'Preview Posting';
                    ApplicationArea = All;
                    Image = View;

                    trigger OnAction()
                    var
                        SalesOrderTestPost: Codeunit "Sales Order Test Post";
                    begin
                        SalesOrderTestPost.PreviewPosting(Rec);
                    end;
                }
            }
            group(PrintSendGroup)
            {
                Caption = 'Print/Send';
                Image = Print;
                action(PrintConfirmation)
                {
                    Caption = 'Print Confirmation...';
                    ApplicationArea = All;
                    Image = Print;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                    // SalesOrderTestReport: Report "Sales Order Test Report";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        // SalesOrderTestReport.SetTableView(SalesOrderTestHeader);
                        // SalesOrderTestReport.Run();
                    end;
                }
                action(PickInstruction)
                {
                    Caption = 'Pick Instruction';
                    ApplicationArea = All;
                    Image = PickLines;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                    // PickInstructionReport: Report "Sales Order Test Pick";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        // PickInstructionReport.SetTableView(SalesOrderTestHeader);
                        // PickInstructionReport.Run();
                    end;
                }
                action(EmailConfirmation)
                {
                    Caption = 'Email Confirmation...';
                    ApplicationArea = All;
                    Image = Email;

                    trigger OnAction()
                    var
                        SalesOrderTestHeader: Record "Sales Order Test Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesOrderTestHeader);
                        if SalesOrderTestHeader.FindSet() then
                            repeat
                                SendConfirmationByEmail(SalesOrderTestHeader);
                            until SalesOrderTestHeader.Next() = 0;
                    end;
                }
                action(WorkOrder)
                {
                    Caption = 'Work Order...';
                    ApplicationArea = All;
                    Image = WorkCenter;


                    trigger OnAction()
                    begin
                        Message('Work Order logic to be implemented.');
                    end;
                }
                action(AttachAsPDF)
                {
                    Caption = 'Attach as PDF...';
                    ApplicationArea = All;
                    Image = Attach;


                    trigger OnAction()
                    begin
                        Message('Attach as PDF logic to be implemented.');
                    end;
                }
            }
            group(OrderGroup)
            {
                Caption = 'Order';
                Image = Order;
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ApplicationArea = All;
                    Image = Dimensions;


                    trigger OnAction()
                    var
                        DimensionMgt: Codeunit DimensionManagement;
                    begin
                        // DimensionMgt.ShowDimensionSet(Rec."Dimension Set ID", StrSubstNo('%1 %2', Rec.TableCaption, Rec."No."));
                    end;
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    ApplicationArea = All;
                    Image = Statistics;


                    trigger OnAction()
                    begin
                        Message('Statistics logic to be implemented.');
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = All;
                    Image = Comment;


                    trigger OnAction()
                    begin
                        Message('Comments logic to be implemented.');
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    ApplicationArea = All;
                    Image = Approvals;


                    trigger OnAction()
                    begin
                        Message('Approvals logic to be implemented.');
                    end;
                }
                action(Shipments)
                {
                    Caption = 'Shipments';
                    ApplicationArea = All;
                    Image = Shipment;


                    trigger OnAction()
                    begin
                        Message('Shipments logic to be implemented.');
                    end;
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    ApplicationArea = All;
                    Image = Invoice;


                    trigger OnAction()
                    begin
                        Message('Invoices logic to be implemented.');
                    end;
                }
            }
        }
    }

    local procedure CreateWarehouseShipmentForOrder(SalesOrderTestHeader: Record "Sales Order Test Header")
    var
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        WarehouseShipmentPage: Page "Warehouse Shipment";
        ShipmentNo: Code[20];
    begin
        // Tạo Warehouse Shipment Header
        WarehouseShipmentHeader.Init();
        WarehouseShipmentHeader."No." := '';  // Sẽ được tự động gán
        WarehouseShipmentHeader."Location Code" := 'MAIN';  // Thay bằng mã location thích hợp
        WarehouseShipmentHeader.Insert(true);
        ShipmentNo := WarehouseShipmentHeader."No.";

        // Tạo Warehouse Shipment Line
        WarehouseShipmentLine.Init();
        WarehouseShipmentLine."No." := ShipmentNo;
        WarehouseShipmentLine."Source Type" := 37;  // Sales Order
        WarehouseShipmentLine."Source Subtype" := 1;  // Sales Order
        WarehouseShipmentLine."Source No." := SalesOrderTestHeader."No.";
        WarehouseShipmentLine."Source Line No." := 10000;  // Thay bằng line no thích hợp
        WarehouseShipmentLine.Insert(true);

        // Mở trang Warehouse Shipment
        WarehouseShipmentHeader.Get(ShipmentNo);
        WarehouseShipmentPage.SetRecord(WarehouseShipmentHeader);
        WarehouseShipmentPage.Run();

        Message('Đã tạo Warehouse Shipment %1 cho đơn hàng %2.', ShipmentNo, SalesOrderTestHeader."No.");
    end;

    local procedure CreateInventoryPutAwayPickForOrder(SalesOrderTestHeader: Record "Sales Order Test Header")
    begin
        Message('Đã tạo Inventory Put-away/Pick cho đơn hàng %1.', SalesOrderTestHeader."No.");
        // Thêm logic tạo Inventory Put-away/Pick ở đây
    end;

    local procedure SendPostedDocumentByEmail(SalesOrderTestHeader: Record "Sales Order Test Header")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(
            SalesOrderTestHeader."Sell-to Customer Name",
            StrSubstNo('Đơn hàng đã đăng %1', SalesOrderTestHeader."No."),
            StrSubstNo('Kính gửi %1,\n\nĐơn hàng của bạn đã được đăng thành công.\n\nTrân trọng,\nPhòng Kinh doanh', SalesOrderTestHeader."Sell-to Customer Name"),
            true
        );
        Email.OpenInEditor(EmailMessage);
    end;

    local procedure SendConfirmationByEmail(SalesOrderTestHeader: Record "Sales Order Test Header")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(
            SalesOrderTestHeader."Sell-to Customer Name",
            StrSubstNo('Xác nhận đơn hàng %1', SalesOrderTestHeader."No."),
            StrSubstNo('Kính gửi %1,\n\nCảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xác nhận.\n\nTrân trọng,\nPhòng Kinh doanh', SalesOrderTestHeader."Sell-to Customer Name"),
            true
        );
        Email.OpenInEditor(EmailMessage);
    end;
}
