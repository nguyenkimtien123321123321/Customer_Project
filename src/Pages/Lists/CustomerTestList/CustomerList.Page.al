page 50313 "CustomerExt List"
{
    Caption = 'Customers';
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
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Post Code';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address';
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
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Code';
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
                RunObject = Page "Customer Test Card";
                RunPageMode = Create;
            }
        }
    }
}