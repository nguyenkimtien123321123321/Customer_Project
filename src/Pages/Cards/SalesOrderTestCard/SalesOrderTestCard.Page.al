page 50308 "Sales Order Test Card"
{
    Caption = 'Sales Order Test';
    PageType = Document;
    SourceTable = "Sales Order Test Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnAssistEdit()
                    var
                        CustomerExt: Record CustomerExt;
                        CustomerExtList: Page "CustomerExt List";
                    begin
                        CustomerExtList.LookupMode(true);
                        if CustomerExtList.RunModal() = Action::LookupOK then begin
                            CustomerExtList.GetRecord(CustomerExt);
                            Rec."Sell-to Customer No." := CustomerExt."Test ID";
                            Rec.Validate("Sell-to Customer No.");
                        end;
                    end;
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        Contact: Record Contact;
                        ContactList: Page "Contact_List";
                    begin
                        if Rec."Sell-to Customer No." <> '' then begin
                            Contact.SetRange("Company No.", Rec."Sell-to Customer No.");
                            ContactList.SetTableView(Contact);
                            ContactList.SetCustomerInfo(Rec."Sell-to Customer No.", Rec."Sell-to Customer Name"); // Truyền thông tin khách hàng để cập nhật tiêu đề
                            ContactList.LookupMode(true);
                            if ContactList.RunModal() = Action::LookupOK then begin
                                ContactList.GetRecord(Contact);
                                Rec."Sell-to Contact" := Contact.Name;
                            end;
                        end else
                            Message('Please select a customer first.');
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("VAT Date"; Rec."VAT Date")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Sales Order Test Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group(Totals)
            {
                Caption = 'Totals';
                field("Subtotal Excl. VAT"; Rec."Subtotal Excl. VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Subtotal Excl. VAT (GBP)';
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Inv. Discount Amount Excl. VAT (GBP)';

                    trigger OnValidate()
                    begin
                        CalcTotals();
                    end;
                }
                field("Invoice Discount %"; Rec."Invoice Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Invoice Discount %';

                    trigger OnValidate()
                    begin
                        if Rec."Invoice Discount %" > 0 then
                            Rec."Invoice Discount Amount" := Rec."Subtotal Excl. VAT" * Rec."Invoice Discount %" / 100
                        else
                            Rec."Invoice Discount Amount" := 0;
                        CalcTotals();
                    end;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total Excl. VAT (GBP)';
                }
                field("Total VAT"; Rec."Total VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Total VAT (GBP)';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Total Incl. VAT (GBP)';
                }
            }
        }
        area(factboxes)
        {
            part("Sales History"; "CustomerExt Sales History FB")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer Sales History';
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

            }
        }
    }

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnAfterGetRecord()
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.CalcTotals(Rec);
    end;

    local procedure CalcTotals()
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.CalcTotals(Rec);
    end;
}