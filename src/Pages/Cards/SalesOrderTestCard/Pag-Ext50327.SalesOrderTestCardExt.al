pageextension 50326 SalesOrderTestCardExt extends "Sales Order Test Card"
{
    actions
    {
        addlast(processing)
        {
            group(HomeGroup)
            {
                Caption = 'Home';
                Image = Home;
                group(Post1)
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
                group(Release1)
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
                action(ArchiveDocument)
                {
                    Caption = 'Archive Document';
                    ApplicationArea = All;
                    Image = Archive;


                    trigger OnAction()
                    begin
                        Message('Archive Document logic to be implemented.');
                    end;
                }
            }
            group(PrepareGroup)
            {
                Caption = 'Prepare';
                Image = Setup;
                action(CalculateInvoiceDiscount)
                {
                    Caption = 'Calculate Invoice Discount';
                    ApplicationArea = All;
                    Image = Calculate;


                    trigger OnAction()
                    begin
                        Message('Calculate Invoice Discount logic to be implemented.');
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
            }
            group(RequestApprovalGroup)
            {
                Caption = 'Request Approval';
                Image = Approval;
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    ApplicationArea = All;
                    Image = SendApprovalRequest;


                    trigger OnAction()
                    begin
                        Message('Send Approval Request logic to be implemented.');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Request';
                    ApplicationArea = All;
                    Image = Cancel;


                    trigger OnAction()
                    begin
                        Message('Cancel Approval Request logic to be implemented.');
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
            }
        }
    }
}
