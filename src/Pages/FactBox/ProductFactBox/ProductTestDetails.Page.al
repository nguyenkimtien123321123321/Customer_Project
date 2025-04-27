page 50321 "Product Test Details"
{
    Caption = 'Details';
    PageType = CardPart;
    SourceTable = "Product Test";

    layout
    {
        area(content)
        {
            group("Item Details - Inventory")
            {
                Caption = 'Item Details - Inventory';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    Editable = false;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    Caption = 'Base Unit of Measure';
                    Editable = false;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    Caption = 'Item Category Code';
                    Editable = false;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Caption = 'Inventory';
                    Editable = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Cost';
                    Editable = false;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Price';
                    Editable = false;
                }
            }

            group("Item Details - Planning")
            {
                Caption = 'Item Details - Planning';
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                    Editable = false;
                }
                field("Variant Mandatory if Exists"; Rec."Variant Mandatory if Exists")
                {
                    ApplicationArea = All;
                    Caption = 'Variant Mandatory if Exists';
                    Editable = false;
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Purch. Order';
                    Editable = false;
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Sales Order';
                    Editable = false;
                }
                field("Stockout Warning"; Rec."Stockout Warning")
                {
                    ApplicationArea = All;
                    Caption = 'Stockout Warning';
                    Editable = false;
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Volume';
                    Editable = false;
                }
                field("Over-Receipt Code"; Rec."Over-Receipt Code")
                {
                    ApplicationArea = All;
                    Caption = 'Over-Receipt Code';
                    Editable = false;
                }
            }
        }
    }
}