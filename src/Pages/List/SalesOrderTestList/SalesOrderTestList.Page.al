page 50307 "Sales Order Test List"
{
    Caption = 'Sales Order Test List';
    PageType = List;
    SourceTable = "Sales Order Test Header";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Sales Order Test Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Completely Shipped"; Rec."Completely Shipped")
                {
                    ApplicationArea = All;
                }
                field("Amount Shipped Not Invoiced (LCY)"; Rec."Amount Shipped Not Invoiced (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount Invoiced (LCY)"; Rec."Amount Invoiced (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Customer Statistics"; "CustomerExt Statistics FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Statistics';
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
                action(NewSalesOrderTest)
                {
                    Caption = 'New';
                    ApplicationArea = All;
                    Image = New;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

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
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

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
                action(PickInstruction)
                {
                    Caption = 'Pick Instruction';
                    ApplicationArea = All;
                    Image = PickLines;
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Attach as PDF logic to be implemented.');
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
                action(Shipments)
                {
                    Caption = 'Shipments';
                    ApplicationArea = All;
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Invoices logic to be implemented.');
                    end;
                }
            }
        }
        area(navigation)
        {
            action(OpenCard)
            {
                Caption = 'Open Card';
                ApplicationArea = All;
                Image = Edit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Sales Order Test Card";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}