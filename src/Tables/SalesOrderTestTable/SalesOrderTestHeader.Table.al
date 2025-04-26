table 50302 "Sales Order Test Header"
{
    Caption = 'Sales Order Test Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            NotBlank = true;

        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = CustomerExt."Test ID";

            // trigger OnValidate()
            // var
            //     CustomerExt: Record CustomerExt;
            // begin
            //     if CustomerExt.Get("Sell-to Customer No.") then begin
            //         "Sell-to Customer Name" := CustomerExt."Test Name";
            //         "Sell-to Contact" := CustomerExt.Contact;
            //     end;
            // end;
            trigger OnValidate()
            var
                CustomerExt: Record CustomerExt;
                Contact: Record Contact;
            begin
                if CustomerExt.Get("Sell-to Customer No.") then begin
                    "Sell-to Customer Name" := CustomerExt."Test Name";
                    // Tìm liên hệ mặc định của khách hàng
                    Contact.SetRange("Company No.", CustomerExt."Test ID");
                    if Contact.FindFirst() then
                        "Sell-to Contact" := Contact.Name
                    else
                        "Sell-to Contact" := '';
                end else begin
                    "Sell-to Customer Name" := '';
                    "Sell-to Contact" := '';
                end;
            end;
        }
        field(3; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Sell-to Contact"; Text[100])
        {
            Caption = 'Contact';
            DataClassification = CustomerContent;
        }
        field(5; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(6; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(7; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(9; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(10; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(11; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
            DataClassification = CustomerContent;
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(13; "VAT Date"; Date)
        {
            Caption = 'VAT Date';
            DataClassification = CustomerContent;
        }
        field(14; Status; Enum "Sales Document Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(15; "Completely Shipped"; Boolean)
        {
            Caption = 'Completely Shipped';
            DataClassification = CustomerContent;
        }
        field(16; "Amount Shipped Not Invoiced (LCY)"; Decimal)
        {
            Caption = 'Amount Shipped Not Invoiced (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(17; "Amount Invoiced (LCY)"; Decimal)
        {
            Caption = 'Amount Invoiced (LCY)';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(18; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Editable = false;
        }
        field(19; "Amount Including VAT"; Decimal)
        {
            Caption = 'Amount Including VAT';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Editable = false;
        }
        field(20; "Subtotal Excl. VAT"; Decimal)
        {
            Caption = 'Subtotal Excl. VAT';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Editable = false;
        }
        field(21; "Invoice Discount Amount"; Decimal)
        {
            Caption = 'Invoice Discount Amount';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(22; "Invoice Discount %"; Decimal)
        {
            Caption = 'Invoice Discount %';
            DataClassification = CustomerContent;
        }
        field(23; "Total VAT"; Decimal)
        {
            Caption = 'Total VAT';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            Editable = false;
        }
        field(24; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    // ĐÁNH SỐ TỰ ĐỘNG
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        NoSeriesCode: Code[20];
    begin
        if "No." = '' then begin
            NoSeriesCode := 'SOTEST'; // Dòng số cố định
            SetupNoSeries(NoSeriesCode); // Tạo dòng số nếu chưa tồn tại
            "No. Series" := NoSeriesCode;
            NoSeriesMgt.InitSeries(NoSeriesCode, "No. Series", 0D, "No.", "No. Series");
        end;
    end;

    local procedure SetupNoSeries(NoSeriesCode: Code[20])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        // Kiểm tra nếu dòng số chưa tồn tại thì tạo mới
        if not NoSeries.Get(NoSeriesCode) then begin
            NoSeries.Init();
            NoSeries.Code := NoSeriesCode;
            NoSeries.Description := 'Sales Order Test Nos.';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert(true);

            // Tạo dòng số chi tiết
            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := NoSeriesCode;
            NoSeriesLine."Starting No." := '101001'; // Định dạng giống hệ thống mặc định
            NoSeriesLine."Ending No." := '999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert(true);
        end;
    end;
}