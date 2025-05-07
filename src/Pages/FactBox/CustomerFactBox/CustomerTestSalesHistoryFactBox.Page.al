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
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            SalesQuotePage: Page "Sales Quotes";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            SalesQuotePage.SetTableView(SalesHeader);
                            SalesQuotePage.SetRecord(SalesHeader);
                            SalesQuotePage.Run();
                        end;
                    }
                    field(OngoingSalesBlanketOrders; CalcOngoingSalesBlanketOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Blanket Orders';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            BlanketSalesOrdersPage: Page "Blanket Sales Orders";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            BlanketSalesOrdersPage.SetTableView(SalesHeader);
                            BlanketSalesOrdersPage.SetRecord(SalesHeader);
                            BlanketSalesOrdersPage.Run();
                        end;
                    }
                    field(OngoingSalesOrders; CalcOngoingSalesOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Orders';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            SalesOrdersPage: Page "Sales Orders";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            SalesOrdersPage.SetTableView(SalesHeader);
                            SalesOrdersPage.SetRecord(SalesHeader);
                            SalesOrdersPage.Run();
                        end;
                    }
                    field(OngoingSalesInvoices; CalcOngoingSalesInvoices())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Invoices';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            SalesInvoicesPage: Page "Sales Invoice List";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            SalesInvoicesPage.SetTableView(SalesHeader);
                            SalesInvoicesPage.SetRecord(SalesHeader);
                            SalesInvoicesPage.Run();
                        end;
                    }
                    field(OngoingSalesReturnOrders; CalcOngoingSalesReturnOrders())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Return Orders';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            SalesReturnOrdersPage: Page "Sales Return Orders";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Return Order");
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            SalesReturnOrdersPage.SetTableView(SalesHeader);
                            SalesReturnOrdersPage.SetRecord(SalesHeader);
                            SalesReturnOrdersPage.Run();
                        end;
                    }
                    field(OngoingSalesCreditMemos; CalcOngoingSalesCreditMemos())
                    {
                        ApplicationArea = All;
                        Caption = 'Ongoing Sales Credit Memos';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesHeader: Record "Sales Header";
                            SalesCreditMemosPage: Page "Sales Credit Memos";
                        begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Credit Memo");
                            SalesHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            SalesCreditMemosPage.SetTableView(SalesHeader);
                            SalesCreditMemosPage.SetRecord(SalesHeader);
                            SalesCreditMemosPage.Run();
                        end;
                    }
                    field(PostedSalesShipments; CalcPostedSalesShipments())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Shipments';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesShipmentHeader: Record "Sales Shipment Header";
                            PostedSalesShipmentsPage: Page "Posted Sales Shipments";
                        begin
                            SalesShipmentHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            PostedSalesShipmentsPage.SetTableView(SalesShipmentHeader);
                            PostedSalesShipmentsPage.SetRecord(SalesShipmentHeader);
                            PostedSalesShipmentsPage.Run();
                        end;
                    }
                    field(PostedSalesInvoices; CalcPostedSalesInvoices())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Invoices';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesInvoiceHeader: Record "Sales Invoice Header";
                            PostedSalesInvoicesPage: Page "Posted Sales Invoices";
                        begin
                            SalesInvoiceHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            PostedSalesInvoicesPage.SetTableView(SalesInvoiceHeader);
                            PostedSalesInvoicesPage.SetRecord(SalesInvoiceHeader);
                            PostedSalesInvoicesPage.Run();
                        end;
                    }
                    field(PostedSalesReturnReceipts; CalcPostedSalesReturnReceipts())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Return Receipts';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            ReturnReceiptHeader: Record "Return Receipt Header";
                            PostedReturnReceiptsPage: Page "Posted Return Receipts";
                        begin
                            ReturnReceiptHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            PostedReturnReceiptsPage.SetTableView(ReturnReceiptHeader);
                            PostedReturnReceiptsPage.SetRecord(ReturnReceiptHeader);
                            PostedReturnReceiptsPage.Run();
                        end;
                    }
                    field(PostedSalesCreditMemos; CalcPostedSalesCreditMemos())
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Credit Memos';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            PostedSalesCreditMemosPage: Page "Posted Sales Credit Memos";
                        begin
                            SalesCrMemoHeader.SetRange("Sell-to Customer No.", Rec."Test ID");

                            PostedSalesCreditMemosPage.SetTableView(SalesCrMemoHeader);
                            PostedSalesCreditMemosPage.SetRecord(SalesCrMemoHeader);
                            PostedSalesCreditMemosPage.Run();
                        end;
                    }
                    field(CustomerContracts; CalcCustomerContracts())
                    {
                        ApplicationArea = All;
                        Caption = 'Customer Contracts';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            ServiceContractHeader: Record "Service Contract Header";
                            ServiceContractsPage: Page "Service Contracts";
                        begin
                            ServiceContractHeader.SetRange("Customer No.", Rec."Test ID");

                            ServiceContractsPage.SetTableView(ServiceContractHeader);
                            ServiceContractsPage.SetRecord(ServiceContractHeader);
                            ServiceContractsPage.Run();
                        end;
                    }
                    field(ServiceObjects; CalcServiceObjects())
                    {
                        ApplicationArea = All;
                        Caption = 'Service Objects';
                        DrillDown = true;

                        trigger OnDrillDown()
                        var
                            ServiceItem: Record "Service Item";
                            ServiceItemsPage: Page "Service Items";
                        begin
                            ServiceItem.SetRange("Customer No.", Rec."Test ID");

                            ServiceItemsPage.SetTableView(ServiceItem);
                            ServiceItemsPage.SetRecord(ServiceItem);
                            ServiceItemsPage.Run();
                        end;
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