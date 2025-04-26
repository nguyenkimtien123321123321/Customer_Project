page 50314 "Contact_List"
{
    Caption = 'Contacts';
    PageType = List;
    SourceTable = Contact;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Contact Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field("Business Relation"; Rec.Type)
                {
                    ApplicationArea = All;
                    Caption = 'Business Relation';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Caption = 'Email';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(New)
            {
                Caption = 'New';
                ApplicationArea = All;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Contact Card";
                RunPageMode = Create;
            }
        }
    }

    var
        CustomerNo: Code[20];
        CustomerName: Text[100];

    procedure SetCustomerInfo(CustNo: Code[20]; CustName: Text[100])
    begin
        CustomerNo := CustNo;
        CustomerName := CustName;
        UpdateCaption();
    end;

    local procedure UpdateCaption()
    begin
        CurrPage.Caption := StrSubstNo('Contacts - %1 - %2', CustomerNo, CustomerName);
    end;

    trigger OnOpenPage()
    begin
        if CustomerNo <> '' then
            UpdateCaption();
    end;
}