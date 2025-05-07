page 50303 "Customer Test Card"
{
    Caption = 'Customer Test Card';
    PageType = Card;
    SourceTable = CustomerExt;
    UsageCategory = None;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    Editable = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec."Test ID" = '' then begin
                            if numberSeries.SelectSeries('demo', xRec."Test ID", Rec."Test ID") then begin
                                numberSeries.SetSeries(Rec."Test ID");
                            end

                        end
                    end;
                }
                field("Test Name"; Rec."Test Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
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
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Due (LCY)';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit (LCY)';
                }
                field("Total Sales - Fiscal Year"; Rec."Total Sales - Fiscal Year")
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales - Fiscal Year';
                }
                field("Costs (LCY)"; Rec."Costs (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Costs (LCY)';
                }
            }
            group(AddressAndContact)
            {
                Caption = 'Address & Contact';
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Country/Region Code';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Caption = 'City';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Post Code';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mobile Phone No.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    Caption = 'Email';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = All;
                    Caption = 'Home Page';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Name';
                }
            }
        }
        area(factboxes)
        {
            part(Picture; "Customer Test Picture")
            {
                ApplicationArea = All;
                Caption = 'Customer Picture';
                SubPageLink = "Test ID" = field("Test ID");
            }
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
                SubPageLink = "Table ID" = const(50000), "No." = field("Test ID");
                Provider = "Sales History";
            }
        }
    }

    var
        numberSeries: Codeunit NoSeriesManagement;

    trigger OnAfterGetRecord()
    begin
        CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CurrPage.Update(false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // CurrPage.Update(true);
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        // CurrPage.Update(true);
        exit(true);
    end;
}