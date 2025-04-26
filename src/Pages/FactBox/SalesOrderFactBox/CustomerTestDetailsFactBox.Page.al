page 50309 "CustomerExt Details FactBox"
{
    Caption = 'Customer Details';
    PageType = CardPart;
    SourceTable = CustomerExt;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Details)
            {
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Test Name"; Rec."Test Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    Caption = 'Email';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = All;
                    Caption = 'Fax No.';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit (LCY)';
                }
                field("Available Credit (LCY)"; Rec."Available Credit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Available Credit (LCY)';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Terms Code';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
            }
        }
    }
}