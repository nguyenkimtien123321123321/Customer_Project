pageextension 50325 CustomerCardExt extends "Customer Test Card"
{
    actions
    {
        addlast(processing)
        {
            group(HomeGroup)
            {
                Caption = 'Home';
                Image = Home;
                action(SendEmail)
                {
                    Caption = 'Send Email';
                    ApplicationArea = All;
                    Image = Email;

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

                    // trigger OnAction()
                    // var
                    //     MergeDuplicate: Codeunit "Merge Duplicates";
                    // begin
                    //     MergeDuplicate.MergeRecords(Rec);
                    // end;
                }

            }
            group(RequestApprovalGroup)
            {
                Caption = 'Request Approval';
                Image = RequestApproval;
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    ApplicationArea = All;
                    Image = SendApprovalRequest;


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


                    // trigger OnAction()
                    // var
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // begin
                    //     ApprovalsMgmt.CancelApprovalRequest(Rec);
                    // end;
                }
            }
            group(NewDocumentGroup)
            {
                Caption = 'New Document';
                Image = NewDocument;
                action(SalesQuote)
                {
                    Caption = 'Sales Quote';
                    ApplicationArea = All;
                    Image = Quote;

                    RunObject = Page "Sales Quote";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesOrder)
                {
                    Caption = 'Sales Order';
                    ApplicationArea = All;
                    Image = Sales;

                    RunObject = Page "Sales Order";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesInvoice)
                {
                    Caption = 'Sales Invoice';
                    ApplicationArea = All;
                    Image = Invoice;

                    RunObject = Page "Sales Invoice";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(SalesCreditMemo)
                {
                    Caption = 'Sales Credit Memo';
                    ApplicationArea = All;
                    Image = CreditMemo;

                    RunObject = Page "Sales Credit Memo";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(Reminder)
                {
                    Caption = 'Reminder';
                    ApplicationArea = All;
                    Image = Reminder;

                    RunObject = Page "Reminder";
                    RunPageLink = "Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
                action(Contract)
                {
                    Caption = 'Contract';
                    ApplicationArea = All;
                    Image = Contract;

                    RunObject = Page "Service Contract";
                    RunPageLink = "Customer No." = field("Test ID");
                    RunPageMode = Create;
                }
            }
            group(PricesAndDiscountsGroup)
            {
                Caption = 'Prices & Discounts';
                Image = Price;
                action(Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                    Image = Price;

                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
                action(LineDiscount)
                {
                    Caption = 'Line Discount';
                    ApplicationArea = All;
                    Image = LineDiscount;

                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
            }
            group(CustomerGroup)
            {
                Caption = 'Customer Test';
                Image = Customer;
                action(DimensionsMultiple)
                {
                    Caption = 'Dimensions-Multiple';
                    ApplicationArea = All;
                    Image = Dimensions;


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

                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    ApplicationArea = All;
                    Image = Sales;

                    RunObject = Page "Sales Orders";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(ReturnOrders)
                {
                    Caption = 'Return Orders';
                    ApplicationArea = All;
                    Image = ReturnOrder;

                    RunObject = Page "Sales Return Orders";
                    RunPageLink = "Sell-to Customer No." = field("Test ID");
                }
                action(Contracts)
                {
                    Caption = 'Contracts';
                    ApplicationArea = All;
                    Image = ContractPayment;
                    RunObject = Page "Service Contracts";
                    RunPageLink = "Customer No." = field("Test ID");
                }
                action(ServiceObjects)
                {
                    Caption = 'Service Objects';
                    ApplicationArea = All;
                    Image = ServiceItem;

                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = field("Test ID");
                }
            }
            group(ReportGroup)
            {
                Caption = 'Report';
                // Image = Report;
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
}