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
                    begin
                        Message('Create Warehouse Shipment logic to be implemented.');
                    end;
                }
                action(CreateInventoryPutAwayPick)
                {
                    Caption = 'Create Inventory Put-away/Pick...';
                    ApplicationArea = All;
                    Image = Inventory;


                    trigger OnAction()
                    begin
                        Message('Create Inventory Put-away/Pick logic to be implemented.');
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
                    begin
                        Message('Posting logic to be implemented.');
                    end;
                }
                action(PostAndSend)
                {
                    Caption = 'Post and Send...';
                    ApplicationArea = All;
                    Image = PostMail;


                    trigger OnAction()
                    begin
                        Message('Post and Send logic to be implemented.');
                    end;
                }
                action(PostBatch)
                {
                    Caption = 'Post Batch...';
                    ApplicationArea = All;
                    Image = PostBatch;


                    trigger OnAction()
                    begin
                        Message('Post Batch logic to be implemented.');
                    end;
                }
                action(PreviewPosting)
                {
                    Caption = 'Preview Posting';
                    ApplicationArea = All;
                    Image = View;


                    trigger OnAction()
                    begin
                        Message('Preview Posting logic to be implemented.');
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
                    begin
                        Message('Print Confirmation logic to be implemented.');
                    end;
                }
                action(PickInstruction)
                {
                    Caption = 'Pick Instruction';
                    ApplicationArea = All;
                    Image = PickLines;


                    trigger OnAction()
                    begin
                        Message('Pick Instruction logic to be implemented.');
                    end;
                }
                action(EmailConfirmation)
                {
                    Caption = 'Email Confirmation...';
                    ApplicationArea = All;
                    Image = Email;


                    trigger OnAction()
                    begin
                        Message('Email Confirmation logic to be implemented.');
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
}
