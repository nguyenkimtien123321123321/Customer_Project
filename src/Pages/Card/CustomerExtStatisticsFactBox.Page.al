page 50304 "CustomerExt Statistics FactBox"
{
    Caption = 'Customer Statistics';
    PageType = CardPart;
    SourceTable = CustomerExt;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Customer Statistics';
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY)';
                }
                field("Balance (LCY) As Vendor"; Rec."Balance (LCY) As Vendor")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY) As Vendor';
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales (LCY)';
                }
                field("Payments (LCY)"; Rec."Payments (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Payments (LCY)';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Outstanding Invoices (LCY)';
                }
                field("Total Sales - Fiscal Year"; Rec."Total Sales - Fiscal Year")
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales - Fiscal Year';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit (LCY)';
                }
            }
        }
    }
}