page 50305 "CustomerExt Sales History FB"
{
    Caption = 'Sell-to Customer Sales History';
    PageType = CardPart;
    SourceTable = CustomerExt;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }

                cuegroup(SalesHistoryTiles)
                {
                    Caption = ''; // No caption needed for the CueGroup, as the FactBox caption is sufficient
                    CueGroupLayout = Wide; // Ensures tiles are arranged in a grid

                    field(OngoingSalesQuotes; CalcOngoingSalesQuotes())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Quotes';
                        Style = Favorable; // Optional: Style for visual emphasis
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(OngoingSalesBlanketOrders; CalcOngoingSalesBlanketOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Blanket Orders';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(OngoingSalesOrders; CalcOngoingSalesOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Orders';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(OngoingSalesInvoices; CalcOngoingSalesInvoices())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Invoices';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(OngoingSalesReturnOrders; CalcOngoingSalesReturnOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Return Orders';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(OngoingSalesCreditMemos; CalcOngoingSalesCreditMemos())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Credit Memos';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(PostedSalesShipments; CalcPostedSalesShipments())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Shipments';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(PostedSalesInvoices; CalcPostedSalesInvoices())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Invoices';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(PostedSalesReturnReceipts; CalcPostedSalesReturnReceipts())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Return Receipts';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(PostedSalesCreditMemos; CalcPostedSalesCreditMemos())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Credit Memos';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(CustomerContracts; CalcCustomerContracts())
                    {
                        ApplicationArea = All;
                        Caption = 'Customer Contracts';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                    field(ServiceObjects; CalcServiceObjects())
                    {
                        ApplicationArea = All;
                        Caption = 'Service Objects';
                        Style = Favorable;
                        StyleExpr = 'Favorable';
                        DrillDown = true;
                    }
                }
            }
        }
    }

    local procedure CalcOngoingSalesQuotes(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcOngoingSalesBlanketOrders(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcOngoingSalesOrders(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcOngoingSalesInvoices(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcOngoingSalesReturnOrders(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Return Order");
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcOngoingSalesCreditMemos(): Integer
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Credit Memo");
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesHeader.Count());
    end;

    local procedure CalcPostedSalesShipments(): Integer
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        SalesShipmentHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesShipmentHeader.Count());
    end;

    local procedure CalcPostedSalesInvoices(): Integer
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        SalesInvoiceHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesInvoiceHeader.Count());
    end;

    local procedure CalcPostedSalesReturnReceipts(): Integer
    var
        ReturnReceiptHeader: Record "Return Receipt Header";
    begin
        ReturnReceiptHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(ReturnReceiptHeader.Count());
    end;

    local procedure CalcPostedSalesCreditMemos(): Integer
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrMemoHeader.SetRange("Sell-to Customer No.", Rec."Test ID");
        exit(SalesCrMemoHeader.Count());
    end;

    local procedure CalcCustomerContracts(): Integer
    var
        ServiceContractHeader: Record "Service Contract Header";
    begin
        ServiceContractHeader.SetRange("Customer No.", Rec."Test ID");
        exit(ServiceContractHeader.Count());
    end;

    local procedure CalcServiceObjects(): Integer
    var
        ServiceItem: Record "Service Item";
    begin
        ServiceItem.SetRange("Customer No.", Rec."Test ID");
        exit(ServiceItem.Count());
    end;
}