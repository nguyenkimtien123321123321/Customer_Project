page 50302 "Customer Test List"
{
    Caption = 'Customer Test List';
    PageType = List;
    SourceTable = CustomerExt;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Customer Test Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field("Test Name"; Rec."Test Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Caption = 'Responsibility Center';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance (LCY)';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Due (LCY)';
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Sales (LCY)';
                }
                field("Payments (LCY)"; Rec."Payments (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Payments (LCY)';
                }
            }
        }
        area(factboxes)
        {
            part("Sales History"; "CustomerExt Sales History FB")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Sales History';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Customer Statistics"; "CustomerExt Statistics FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Statistics';
                SubPageLink = "Test ID" = field("Test ID");
            }
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50301), "No." = field("Test ID");
            }
        }
    }
}