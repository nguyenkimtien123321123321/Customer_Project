table 50315 "Product Test"
{
    Caption = 'Product Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(4; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(5; "Variant Mandatory if Exists"; Boolean)
        {
            Caption = 'Variant Mandatory if Exists';
            DataClassification = ToBeClassified;
        }
        field(6; "Inventory"; Decimal)
        {
            Caption = 'Inventory';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Qty. on Purch. Order"; Decimal)
        {
            Caption = 'Qty. on Purch. Order';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Qty. on Sales Order"; Decimal)
        {
            Caption = 'Qty. on Sales Order';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(10; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(11; "Stockout Warning"; Boolean)
        {
            Caption = 'Stockout Warning';
            DataClassification = ToBeClassified;
        }
        field(12; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DataClassification = ToBeClassified;
        }
        field(13; "Over-Receipt Code"; Code[10])
        {
            Caption = 'Over-Receipt Code';
            DataClassification = ToBeClassified;
            TableRelation = "Over-Receipt Code";
        }
        field(14; "Type"; Enum "Item Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16; "Picture"; Media)
        {
            Caption = 'Picture';
            DataClassification = ToBeClassified;
        }
        field(17; "Marketing Text"; Text[250])
        {
            Caption = 'Marketing Text';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        TestNoSeriesMgt: Codeunit "Test No Series Management";
    begin
        if "No." = '' then
            TestNoSeriesMgt.InitSeries('PRODTEST', "No. Series", "No.");
    end;
}
