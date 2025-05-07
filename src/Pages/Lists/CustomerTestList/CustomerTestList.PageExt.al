pageextension 50324 CustomerListExt extends "Customer Test List"
{
    actions
    {
        addlast(processing)
        {
            group(HomeGroup)
            {
                Caption = 'Home';
                Image = Home;
                action(RegisterCustomerPayments)
                {
                    Caption = 'Register Customer Payments';
                    ApplicationArea = All;
                    Image = Payment;
                    trigger OnAction()
                    begin
                        Message('Register Customer Payments action triggered.');
                    end;
                }
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

                    trigger OnAction()
                    begin
                        Message('Apply Template action triggered.');
                    end;
                }
            }

            group(NewDocumentGroup)
            {
                Caption = 'New Document';
                Image = Document;

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

            group(CustomerGroup)
            {
                Caption = 'Customer';
                Image = Customer;

                action(LedgerEntries)
                {
                    Caption = 'Ledger Entries';
                    ApplicationArea = All;
                    Image = CustomerLedger;
                    trigger OnAction()
                    begin
                        Message('Ledger Entries action triggered.');
                    end;
                }

                action(Statistics)
                {
                    Caption = 'Statistics';
                    ApplicationArea = All;
                    Image = Statistics;
                    trigger OnAction()
                    begin
                        Message('Statistics action triggered.');
                    end;
                }

                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ApplicationArea = All;
                    Image = Dimensions;
                    trigger OnAction()
                    begin
                        Message('Dimensions action triggered.');
                    end;
                }

                action(Approvals)
                {
                    Caption = 'Approvals';
                    ApplicationArea = All;
                    Image = Approvals;
                    trigger OnAction()
                    begin
                        Message('Approvals action triggered.');
                    end;
                }

                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = All;
                    Image = Comment;
                    trigger OnAction()
                    begin
                        Message('Comments action triggered.');
                    end;
                }

                action(Contact)
                {
                    Caption = 'Contact';
                    ApplicationArea = All;
                    Image = ContactPerson;
                    trigger OnAction()
                    begin
                        Message('Contact action triggered.');
                    end;
                }

                action(SendEmails)
                {
                    Caption = 'Send Emails';
                    ApplicationArea = All;
                    Image = Email;
                    trigger OnAction()
                    begin
                        Message('Send Emails action triggered.');
                    end;
                }

                action(ItemTrackingEntries)
                {
                    Caption = 'Item Tracking Entries';
                    ApplicationArea = All;
                    Image = ItemTracking;
                    trigger OnAction()
                    begin
                        Message('Item Tracking Entries action triggered.');
                    end;
                }

                action(ItemReferences)
                {
                    Caption = 'Item References';
                    ApplicationArea = All;
                    Image = Item;
                    trigger OnAction()
                    begin
                        Message('Item References action triggered.');
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
                    Image = Contract;

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

            group(PricesAndDiscountsGroup)
            {
                Caption = 'Prices & Discounts';
                Image = Price;

                action(Prices)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                    Image = Price;

                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
                action(LineDiscounts)
                {
                    Caption = 'Line Discount';
                    ApplicationArea = All;
                    Image = LineDiscount;

                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Code" = field("Test ID");
                }
            }
        }
    }
}