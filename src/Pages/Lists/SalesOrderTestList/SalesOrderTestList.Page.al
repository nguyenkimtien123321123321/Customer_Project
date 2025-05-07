page 50307 "Sales Order Test List"
{
    Caption = 'Sales Order Test List';
    PageType = List;
    SourceTable = "Sales Order Test Header";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Sales Order Test Card";

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
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Completely Shipped"; Rec."Completely Shipped")
                {
                    ApplicationArea = All;
                }
                field("Amount Shipped Not Invoiced (LCY)"; Rec."Amount Shipped Not Invoiced (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount Invoiced (LCY)"; Rec."Amount Invoiced (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Customer Statistics"; "CustomerExt Statistics FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Statistics';
                SubPageLink = "Test ID" = field("Sell-to Customer No.");
            }
            part("Customer Details"; "CustomerExt Details FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer Details';
                SubPageLink = "Test ID" = field("Sell-to Customer No.");
            }
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "No." = field("Sell-to Customer No.");
            }
        }
    }
}