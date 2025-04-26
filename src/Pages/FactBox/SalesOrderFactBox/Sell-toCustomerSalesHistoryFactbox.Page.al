page 50312 "Sell-to Customer Sales History"
{
    Caption = 'Sell-to Customer Sales History';
    PageType = CardPart;
    SourceTable = CustomerExt;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Statistics)
            {
                Caption = 'Sell-to Customer Sales History';
                field(OngoingSalesQuotes; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Quotes';
                    Style = Strong;
                }
                field(OngoingSalesOrders; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Orders';
                    Style = Strong;
                }
                field(OngoingSalesBlanketOrders; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Blanket Orders';
                    Style = Strong;
                }
                field(OngoingSalesInvoices; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Invoices';
                    Style = Strong;
                }
                field(OngoingSalesReturnOrders; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Return Orders';
                    Style = Strong;
                }
                field(OngoingSalesCreditMemos; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Ongoing Sales Credit Memos';
                    Style = Strong;
                }
                field(PostedSalesShipments; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Shipments';
                    Style = Strong;
                }
                field(PostedSalesInvoices; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Invoices';
                    Style = Strong;
                }
                field(PostedSalesReturnReceipts; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Return Receipts';
                    Style = Strong;
                }
                field(PostedSalesCreditMemos; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Credit Memos';
                    Style = Strong;
                }
                field(CustomerContracts; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Contracts';
                    Style = Strong;
                }
                field(ServiceObjects; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Service Objects';
                    Style = Strong;
                }
            }
        }
    }
}