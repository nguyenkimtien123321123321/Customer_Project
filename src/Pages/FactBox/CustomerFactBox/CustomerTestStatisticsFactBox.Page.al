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
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    StyleExpr = 'StandardAccent';
                    Style = StandardAccent;
                    ShowCaption = true;
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

                group(Sales)
                {
                    Caption = 'Sales';
                    field("Outstanding Orders (LCY)"; Rec."Balance Due (LCY)")
                    {
                        ApplicationArea = All;
                        Caption = 'Outstanding Orders (LCY)';
                    }
                    field("Shipped Not Invd. (LCY)"; 0)
                    {
                        ApplicationArea = All;
                        Caption = 'Shipped Not Invd. (LCY)';
                    }
                    field("Outstanding Invoices (LCY)"; Rec."Balance Due (LCY)")
                    {
                        ApplicationArea = All;
                        Caption = 'Outstanding Invoices (LCY)';
                    }
                }

                group(Payments)
                {
                    Caption = 'Payments';
                    field("Payments (LCY)"; Rec."Payments (LCY)")
                    {
                        ApplicationArea = All;
                        Caption = 'Payments (LCY)';
                    }
                    field("Refunds (LCY)"; 0)
                    {
                        ApplicationArea = All;
                        Caption = 'Refunds (LCY)';
                    }
                    field("Last Payment Receipt Date"; Today)
                    {
                        ApplicationArea = All;
                        Caption = 'Last Payment Receipt Date';
                    }
                }

                field("Total (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Total (LCY)';
                    Style = Strong;
                    StyleExpr = 'Strong';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit (LCY)';
                }
                field("Overdue Amounts (LCY)"; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Overdue Amounts (LCY)';
                }
                field("Total Sales (LCY)"; Rec."Total Sales - Fiscal Year")
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales (LCY)';
                }
                field("Invoiced Prepayment Amount (LCY)"; 0)
                {
                    ApplicationArea = All;
                    Caption = 'Invoiced Prepayment Amount (LCY)';
                }
            }
        }
    }
}