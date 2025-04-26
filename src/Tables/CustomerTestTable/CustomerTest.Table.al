table 50301 CustomerExt
{
    Caption = 'Customer Test';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Test ID"; Code[20])
        {
            Caption = 'Test ID';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Test Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center";
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(5; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }
        field(6; Contact; Text[100])
        {
            Caption = 'Contact';
            DataClassification = CustomerContent;
        }
        field(7; "Balance (LCY)"; Decimal)
        {
            Caption = 'Balance (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(8; "Balance Due (LCY)"; Decimal)
        {
            Caption = 'Balance Due (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(9; "Sales (LCY)"; Decimal)
        {
            Caption = 'Sales (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(10; "Payments (LCY)"; Decimal)
        {
            Caption = 'Payments (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(11; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Set Entry";
        }
        field(12; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(13; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }
        field(14; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(15; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }
        field(16; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
            TableRelation = "Post Code";
        }
        field(17; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            DataClassification = CustomerContent;
        }
        field(18; Email; Text[80])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(19; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            DataClassification = CustomerContent;
        }
        field(20; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            DataClassification = CustomerContent;
        }
        field(21; "Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Credit Limit (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(22; "Balance (LCY) As Vendor"; Decimal)
        {
            Caption = 'Balance (LCY) As Vendor';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(23; "Total Sales - Fiscal Year"; Decimal)
        {
            Caption = 'Total Sales - Fiscal Year';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(24; "Costs (LCY)"; Decimal)
        {
            Caption = 'Costs (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(25; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Test ID")
        {
            Clustered = true;
        }
    }

    // Triển khai interface Document Attachment Supported
    procedure HasDocumentAttachment(): Boolean
    var
        DocumentAttachment: Record "Document Attachment";
    begin
        DocumentAttachment.SetRange("Table ID", Database::CustomerExt);
        DocumentAttachment.SetRange("No.", "Test ID");
        exit(not DocumentAttachment.IsEmpty);
    end;

    procedure DrillDownDocumentAttachment()
    var
        DocumentAttachment: Record "Document Attachment";
    begin
        DocumentAttachment.SetRange("Table ID", Database::CustomerExt);
        DocumentAttachment.SetRange("No.", "Test ID");
        Page.Run(Page::"Document Attachment Details", DocumentAttachment);
    end;
}