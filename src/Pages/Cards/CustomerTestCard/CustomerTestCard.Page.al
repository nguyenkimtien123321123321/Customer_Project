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
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    var
                        NoSeries: Record "No. Series";
                        NoSeriesSelectionList: Page "NoSeriesSelectionList";
                        SelectedNoSeries: Code[20];
                        LastNoSeriesSetup: Record "LastNoSeriesSetup";
                    begin
                        NoSeries.Reset();
                        NoSeriesSelectionList.SetTableView(NoSeries);
                        NoSeriesSelectionList.LookupMode(true);
                        if NoSeriesSelectionList.RunModal() = Action::LookupOK then begin
                            SelectedNoSeries := NoSeriesSelectionList.GetSelectedNoSeries();
                            if SelectedNoSeries <> '' then begin
                                Rec."No. Series" := SelectedNoSeries;
                                Rec."Test ID" := NoSeriesMgt.GetNextNo(SelectedNoSeries, WorkDate(), true);

                                // Lưu No. Series vào bảng LastNoSeriesSetup
                                if not LastNoSeriesSetup.Get('DEFAULT') then begin
                                    LastNoSeriesSetup.Init();
                                    LastNoSeriesSetup."Primary Key" := 'DEFAULT';
                                    LastNoSeriesSetup.Insert();
                                end;
                                LastNoSeriesSetup."Last No. Series" := SelectedNoSeries;
                                LastNoSeriesSetup.Modify();

                                CurrPage.Update();
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec."Test ID" = '' then
                            Error('Please select a No. Series using the AssistEdit button to generate a valid Test ID.');
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
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnAfterGetRecord()
    begin
        CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        LastNoSeriesSetup: Record "LastNoSeriesSetup";
    begin
        Rec.Init();
        if LastNoSeriesSetup.Get('DEFAULT') then begin
            if LastNoSeriesSetup."Last No. Series" <> '' then begin
                Rec."No. Series" := LastNoSeriesSetup."Last No. Series";
                Rec."Test ID" := NoSeriesMgt.GetNextNo(Rec."No. Series", WorkDate(), true);
            end;
        end;
        CurrPage.Update(false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Test ID" = '' then
            Error('Please select a No. Series using the AssistEdit button to generate a valid Test ID.');

        // Kiểm tra nếu bản ghi đã tồn tại
        if Rec.Get(Rec."Test ID") then
            Error('A record with Test ID %1 already exists.', Rec."Test ID");

        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Test ID" = '' then
            Error('Please select a No. Series using the AssistEdit button to generate a valid Test ID.');
        exit(true);
    end;
}