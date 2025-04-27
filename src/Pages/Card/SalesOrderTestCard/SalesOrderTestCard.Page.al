page 50308 "Sales Order Test Card"
{
    Caption = 'Sales Order Test';
    PageType = Document;
    SourceTable = "Sales Order Test Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnAssistEdit()
                    var
                        CustomerExt: Record CustomerExt;
                        CustomerExtList: Page "CustomerExt List";
                    begin
                        CustomerExtList.LookupMode(true);
                        if CustomerExtList.RunModal() = Action::LookupOK then begin
                            CustomerExtList.GetRecord(CustomerExt);
                            Rec."Sell-to Customer No." := CustomerExt."Test ID";
                            Rec.Validate("Sell-to Customer No.");
                        end;
                    end;
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        Contact: Record Contact;
                        ContactList: Page "Contact_List";
                    begin
                        if Rec."Sell-to Customer No." <> '' then begin
                            Contact.SetRange("Company No.", Rec."Sell-to Customer No.");
                            ContactList.SetTableView(Contact);
                            ContactList.SetCustomerInfo(Rec."Sell-to Customer No.", Rec."Sell-to Customer Name"); // Truyền thông tin khách hàng để cập nhật tiêu đề
                            ContactList.LookupMode(true);
                            if ContactList.RunModal() = Action::LookupOK then begin
                                ContactList.GetRecord(Contact);
                                Rec."Sell-to Contact" := Contact.Name;
                            end;
                        end else
                            Message('Please select a customer first.');
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("VAT Date"; Rec."VAT Date")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Sales Order Test Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group(Totals)
            {
                Caption = 'Totals';
                field("Subtotal Excl. VAT"; Rec."Subtotal Excl. VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Subtotal Excl. VAT (GBP)';
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Inv. Discount Amount Excl. VAT (GBP)';

                    trigger OnValidate()
                    begin
                        CalcTotals();
                    end;
                }
                field("Invoice Discount %"; Rec."Invoice Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Invoice Discount %';

                    trigger OnValidate()
                    begin
                        if Rec."Invoice Discount %" > 0 then
                            Rec."Invoice Discount Amount" := Rec."Subtotal Excl. VAT" * Rec."Invoice Discount %" / 100
                        else
                            Rec."Invoice Discount Amount" := 0;
                        CalcTotals();
                    end;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total Excl. VAT (GBP)';
                }
                field("Total VAT"; Rec."Total VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Total VAT (GBP)';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Total Incl. VAT (GBP)';
                }
            }
        }
        area(factboxes)
        {
            part("Sales History"; "CustomerExt Sales History FB")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Sales History';
                SubPageLink = "Test ID" = field("Sell-to Customer No.");
            }
            part("Customer Details"; "CustomerExt Details FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Details';
                SubPageLink = "Test ID" = field("Sell-to Customer No.");
            }
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Home)
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
                        Promoted = true;
                        PromotedCategory = Process;

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
                        Promoted = true;
                        PromotedCategory = Process;

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
                        Promoted = true;
                        PromotedCategory = Process;

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
                        Promoted = true;
                        PromotedCategory = Process;

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
                        Promoted = true;
                        PromotedCategory = Process;

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
                        Promoted = true;
                        PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Archive Document logic to be implemented.');
                    end;
                }
            }
            group(Prepare)
            {
                Caption = 'Prepare';
                Image = Setup;
                action(CalculateInvoiceDiscount)
                {
                    Caption = 'Calculate Invoice Discount';
                    ApplicationArea = All;
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Calculate Invoice Discount logic to be implemented.');
                    end;
                }
            }
            group(PrintSend)
            {
                Caption = 'Print/Send';
                Image = Print;
                action(PrintConfirmation)
                {
                    Caption = 'Print Confirmation...';
                    ApplicationArea = All;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Email Confirmation logic to be implemented.');
                    end;
                }
            }
            group(RequestApproval)
            {
                Caption = 'Request Approval';
                Image = Approval;
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Cancel Approval Request logic to be implemented.');
                    end;
                }
            }
            group(Order)
            {
                Caption = 'Order';
                Image = Order;
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ApplicationArea = All;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Approvals logic to be implemented.');
                    end;
                }
            }
        }
    }

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnAfterGetRecord()
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.CalcTotals(Rec);
    end;

    local procedure CalcTotals()
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
        TotalAmount: Decimal;
        TotalVAT: Decimal;
        TotalAmountInclVAT: Decimal;
    begin
        SalesOrderTestLine.SetRange("Document No.", Rec."No.");
        if SalesOrderTestLine.FindSet() then
            repeat
                TotalAmount += SalesOrderTestLine."Line Amount";
                TotalVAT += SalesOrderTestLine."Line Amount" * (SalesOrderTestLine."VAT %" / 100);
                TotalAmountInclVAT += SalesOrderTestLine."Line Amount" * (1 + SalesOrderTestLine."VAT %" / 100);
            until SalesOrderTestLine.Next() = 0;

        Rec."Subtotal Excl. VAT" := TotalAmount;
        Rec."Total VAT" := TotalVAT;
        Rec."Amount" := TotalAmount - Rec."Invoice Discount Amount";
        Rec."Amount Including VAT" := TotalAmountInclVAT - Rec."Invoice Discount Amount";
        Rec.Modify();
    end;
}