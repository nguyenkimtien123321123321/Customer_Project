table 50303 "_Sales Order Test Line"
{
    Caption = 'Sales Order Test Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "Sales Order Test Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Type"; Enum "Sales Line Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = if (Type = const(Item)) Item;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Item.Get("No.") then begin
                    Description := Item.Description;
                    "Unit Price Excl. VAT" := Item."Unit Price";
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                    CalcLineAmount();
                end;
            end;
        }
        field(5; "Item Reference"; Code[50])
        {
            Caption = 'Item Reference';
            DataClassification = CustomerContent;
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
        field(9; "Qty. to Assemble to Order"; Decimal)
        {
            Caption = 'Qty. to Assemble to Order';
            DataClassification = CustomerContent;
        }
        field(10; "Reserved Quantity"; Decimal)
        {
            Caption = 'Reserved Quantity';
            DataClassification = CustomerContent;
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(12; "Unit Price Excl. VAT"; Decimal)
        {
            Caption = 'Unit Price Excl. VAT';
            DataClassification = CustomerContent;
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
        field(13; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Editable = false;
        }
        field(14; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DataClassification = CustomerContent;
        }
        field(15; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    local procedure CalcLineAmount()
    begin
        "Line Amount" := Quantity * "Unit Price Excl. VAT";
    end;
}