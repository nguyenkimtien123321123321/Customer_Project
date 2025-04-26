page 50303 "Customer Test Card"
{
    Caption = 'Customer Test Card';
    PageType = Card;
    SourceTable = CustomerExt;
    UsageCategory = None;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    Editable = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec."Test ID" = '' then begin
                            if numberSeries.SelectSeries('demo', xRec."Test ID", Rec."Test ID") then begin
                                numberSeries.SetSeries(Rec."Test ID");
                            end

                        end
                    end;
                }
                field("Test Name"; Rec."Test Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY)';
                }
                field("Balance (LCY) As Vendor"; Rec."Balance (LCY) As Vendor")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY) As Vendor';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Due (LCY)';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit (LCY)';
                }
                field("Total Sales - Fiscal Year"; Rec."Total Sales - Fiscal Year")
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales - Fiscal Year';
                }
                field("Costs (LCY)"; Rec."Costs (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Costs (LCY)';
                }
            }
            group(AddressAndContact)
            {
                Caption = 'Address & Contact';
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Country/Region Code';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Caption = 'City';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Post Code';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mobile Phone No.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    Caption = 'Email';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = All;
                    Caption = 'Home Page';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Name';
                }
            }
        }
        area(factboxes)
        {
            part("Sales History"; "CustomerExt Sales History FB")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Sales History';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Customer Statistics"; "CustomerExt Statistics FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Statistics';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50000), "No." = field("Test ID");
                Provider = "Sales History";
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Home)
            {
                Caption = 'Home';
                action(SendEmail)
                {
                    Caption = 'Send Email';
                    ApplicationArea = All;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Email: Codeunit Email;
                        EmailMessage: Codeunit "Email Message";
                    begin
                        EmailMessage.Create('', '', '', true);
                        Email.OpenInEditor(EmailMessage);
                    end;
                }
                action(ApplyTemplate)
                {
                    Caption = 'Apply Template';
                    ApplicationArea = All;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    // trigger OnAction()
                    // begin
                    //     RunObject = Page "Config. Templates";
                    //     RunPageLink = "Table ID" = const(50000);
                    //     RunPageMode = Edit;
                    // end;
                }
                action(MergeWith)
                {
                    Caption = 'Merge With...';
                    ApplicationArea = All;
                    Image = Merge;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    // trigger OnAction()
                    // var
                    //     MergeDuplicate: Codeunit "Merge Duplicates";
                    // begin
                    //     MergeDuplicate.MergeRecords(Rec);
                    // end;
                }
            }
            group(RequestApproval)
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     ApprovalsMgmt.SendApprovalRequest(Rec);
                    // end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Request';
                    ApplicationArea = All;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     ApprovalsMgmt.CancelApprovalRequest(Rec);
                    // end;
                }
            }
            group(NewDocument)
            {
                Caption = 'New Document';
                action(SalesQuote)
                {
                    Caption = 'Sales Quote';
                    ApplicationArea = All;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Quote";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesOrder)
                {
                    Caption = 'Sales Order';
                    ApplicationArea = All;
                    Image = Sales;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Order";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesInvoice)
                {
                    Caption = 'Sales Invoice';
                    ApplicationArea = All;
                    Image = Invoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Invoice";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesCreditMemo)
                {
                    Caption = 'Sales Credit Memo';
                    ApplicationArea = All;
                    Image = CreditMemo;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Credit Memo";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(Reminder)
                {
                    Caption = 'Reminder';
                    ApplicationArea = All;
                    Image = Reminder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Reminder";
                    RunPageLink = "Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(Contract)
                {
                    Caption = 'Contract';
                    ApplicationArea = All;
                    Image = Contract;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Contract";
                    RunPageLink = "Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
            }
            group(PricesAndDiscounts)
            {
                Caption = 'Prices & Discounts';
                action(Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
                action(LineDiscount)
                {
                    Caption = 'Line Discount';
                    ApplicationArea = All;
                    Image = LineDiscount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
            }
            group(CustomerTest)
            {
                Caption = 'Customer Test';
                action(DimensionsMultiple)
                {
                    Caption = 'Dimensions-Multiple';
                    ApplicationArea = All;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        DimensionMgt: Codeunit DimensionManagement;
                    begin
                        DimensionMgt.ShowDimensionSet(Rec."Dimension Set ID", StrSubstNo('%1 %2', Rec.TableCaption, Rec."Test ID"));
                    end;
                }
                action(Quotes)
                {
                    Caption = 'Quotes';
                    ApplicationArea = All;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    ApplicationArea = All;
                    Image = Sales;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Orders";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(ReturnOrders)
                {
                    Caption = 'Return Orders';
                    ApplicationArea = All;
                    Image = ReturnOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Return Orders";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(Contracts)
                {
                    Caption = 'Contracts';
                    ApplicationArea = All;
                    Image = Contract;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Contracts";
                    RunPageLink = "Customer No." = field("Test ID");
                }
                action(ServiceObjects)
                {
                    Caption = 'Service Objects';
                    ApplicationArea = All;
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = field("Test ID");
                }
            }
            group(Report)
            {
                Caption = 'Report';
                action(ScheduledStatement)
                {
                    Caption = 'Scheduled Statement';
                    ApplicationArea = All;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        Report.Run(Report::"Customer Statement");
                    end;
                }
                action(Statement)
                {
                    Caption = 'Statement';
                    ApplicationArea = All;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        Report.Run(Report::"Customer Statement");
                    end;
                }
                action(CustomerOrderSummary)
                {
                    Caption = 'Customer - Order Summary';
                    ApplicationArea = All;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        Report.Run(Report::"Customer - Order Summary");
                    end;
                }
            }
        }
    }
    var
        numberSeries: Codeunit NoSeriesManagement;
}