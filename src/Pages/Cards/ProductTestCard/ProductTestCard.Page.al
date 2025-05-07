page 50316 "Product Test Card"
{
    Caption = 'Product Test Card';
    PageType = Card;
    SourceTable = "Product Test";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Item';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    var
                        TestNoSeriesMgt: Codeunit "Test No Series Management";
                    begin
                        if Rec."No." = '' then
                            TestNoSeriesMgt.InitSeries('PRODTEST', Rec."No. Series", Rec."No.");
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field("Variant Mandatory if Exists"; Rec."Variant Mandatory if Exists")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
            }
            group(InventoryGroup)
            {
                Caption = 'Inventory';
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                    ApplicationArea = All;
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {
                    ApplicationArea = All;
                }
                field("Stockout Warning"; Rec."Stockout Warning")
                {
                    ApplicationArea = All;
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                    ApplicationArea = All;
                }
                field("Over-Receipt Code"; Rec."Over-Receipt Code")
                {
                    ApplicationArea = All;
                }
            }
            group(CostsAndPosting)
            {
                Caption = 'Costs & Posting';
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
            }
            group(PricesAndSales)
            {
                Caption = 'Prices & Sales';
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Picture; "Product Test Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
            part(MarketingText; "Marketing Text FactBox")
            {
                ApplicationArea = All;
                Caption = 'Marketing Text';
                SubPageLink = "No." = field("No.");
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
                action(CopyProduct)
                {
                    Caption = 'Copy Product';
                    ApplicationArea = All;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Copy Product logic to be implemented.');
                    end;
                }
                action(AdjustInventory)
                {
                    Caption = 'Adjust Inventory';
                    ApplicationArea = All;
                    Image = AdjustInventory;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Adjust Inventory logic to be implemented.');
                    end;
                }
                action(CreateStockkeepingUnit)
                {
                    Caption = 'Create Stockkeeping Unit';
                    ApplicationArea = All;
                    Image = CreateSKU;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Create Stockkeeping Unit logic to be implemented.');
                    end;
                }
                action(ApplyTemplate)
                {
                    Caption = 'Apply Template';
                    ApplicationArea = All;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Apply Template logic to be implemented.');
                    end;
                }
            }
            group(PricesAndDiscounts)
            {
                Caption = 'Prices & Discounts';
                action(SalesPrices)
                {
                    Caption = 'Sales Prices';
                    ApplicationArea = All;
                    Image = SalesPrices;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = field("No.");
                }
                action(SalesDiscounts)
                {
                    Caption = 'Sales Discounts';
                    ApplicationArea = All;
                    Image = SalesLineDisc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Line Discounts";
                    // RunPageLink = "Item No." = field("No.");
                }
            }
        }
    }
}