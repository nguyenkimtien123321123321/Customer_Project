tableextension 50312 CustomerExtention extends "CustomerExt"
{
    fields
    {
        field(26; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
            DataClassification = CustomerContent;
        }
        field(27; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            DataClassification = CustomerContent;
            TableRelation = "Payment Terms";
        }
        field(28; "Available Credit (LCY)"; Decimal)
        {
            Caption = 'Available Credit (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(29; "Salesperson Code"; Text[10])
        {
            Caption = 'Salesperson Code';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
    }
}