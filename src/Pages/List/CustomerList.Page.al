page 50302 "Customer Test List"
{
    Caption = 'Customer Test List';
    PageType = List;
    SourceTable = CustomerExt;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Customer Test Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field("Test Name"; Rec."Test Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Caption = 'Responsibility Center';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY)';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Due (LCY)';
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Sales (LCY)';
                }
                field("Payments (LCY)"; Rec."Payments (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Payments (LCY)';
                }
            }
        }
        area(factboxes)
        {
            part("Customer Statistics"; "CustomerExt Statistics FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Statistics';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Sales History"; "CustomerExt Sales History FB")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Sales History';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50000), "No." = field("Test ID");
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

                action(NewCustomerTest)
                {
                    Caption = 'New';
                    ApplicationArea = All;
                    Image = New;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CustomerExt: Record CustomerExt;
                        CustomerTestCard: Page "Customer Test Card";
                    begin
                        CustomerExt.Init();
                        CustomerExt."Test ID" := GetNextTestID();
                        CustomerExt.Insert(true);
                        CustomerTestCard.SetRecord(CustomerExt);
                        CustomerTestCard.Run();
                    end;
                }
                action(DeleteCustomerTest)
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
            }
            group(NewDocument)
            {
                Caption = 'New Document';
                Image = Document;

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
            group(CustomerTest)
            {
                Caption = 'Customer';
                Image = Customer;

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
            group(PricesAndDiscounts)
            {
                Caption = 'Prices & Discounts';
                Image = Price;

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
            group(Report)
            {
                Caption = 'Report';
                Image = Report;

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
                RunObject = Page "Customer Test Card";
                RunPageLink = "Test ID" = field("Test ID");
            }
        }
    }

    local procedure GetNextTestID(): Code[20]
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        exit(NoSeriesMgt.GetNextNo('CUSTTEST', WorkDate(), true));
    end;
}