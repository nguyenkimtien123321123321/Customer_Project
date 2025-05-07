table 50330 "AI Setup"
{
    Caption = 'AI Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "API URL"; Text[250])
        {
            Caption = 'API URL';
            DataClassification = CustomerContent;
        }
        field(3; "API Key"; Text[250])
        {
            Caption = 'API Key';
            DataClassification = CustomerContent;
        }
        field(4; "Model"; Text[50])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
        field(5; "Temperature"; Decimal)
        {
            Caption = 'Temperature';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 1;
            DecimalPlaces = 1;
        }
        field(6; "Max Tokens"; Integer)
        {
            Caption = 'Max Tokens';
            DataClassification = CustomerContent;
            MinValue = 1;
            MaxValue = 4000;
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}