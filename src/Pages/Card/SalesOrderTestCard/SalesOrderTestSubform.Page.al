page 50310 "Sales Order Test Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "_Sales Order Test Line";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item Reference"; Rec."Item Reference")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdateHeaderAmounts();
                    end;
                }
                field("Qty. to Assemble to Order"; Rec."Qty. to Assemble to Order")
                {
                    ApplicationArea = All;
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Price Excl. VAT"; Rec."Unit Price Excl. VAT")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdateHeaderAmounts();
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewLine)
            {
                Caption = 'New Line';
                ApplicationArea = All;
                Image = NewLine;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Init();
                    Rec."Document No." := CurrPage.Caption;
                    Rec."Line No." := GetNextLineNo();
                    Rec.Insert(true);
                end;
            }
            action(DeleteLine)
            {
                Caption = 'Delete Line';
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete this line?', false) then begin
                        Rec.Delete(true);
                        UpdateHeaderAmounts();
                    end;
                end;
            }
            action(SelectItems)
            {
                Caption = 'Select Items...';
                ApplicationArea = All;
                Image = Item;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Item: Record Item;
                    ItemList: Page "Item List";
                begin
                    ItemList.LookupMode(true);
                    if ItemList.RunModal() = Action::LookupOK then begin
                        ItemList.GetRecord(Item);
                        Rec.Init();
                        Rec."Document No." := CurrPage.Caption;
                        Rec."Line No." := GetNextLineNo();
                        Rec.Type := Rec.Type::Item;
                        Rec."No." := Item."No.";
                        Rec.Insert(true);
                    end;
                end;
            }
        }
    }

    local procedure GetNextLineNo(): Integer
    var
        SalesOrderTestLine: Record "_Sales Order Test Line";
    begin
        SalesOrderTestLine.SetRange("Document No.", Rec."Document No.");
        if SalesOrderTestLine.FindLast() then
            exit(SalesOrderTestLine."Line No." + 10000)
        else
            exit(10000);
    end;

    local procedure UpdateHeaderAmounts()
    var
        SalesOrderTestHeader: Record "Sales Order Test Header";
        SalesOrderTestLine: Record "_Sales Order Test Line";
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalVAT: Decimal;
    begin
        SalesOrderTestLine.SetRange("Document No.", Rec."Document No.");
        if SalesOrderTestLine.FindSet() then
            repeat
                TotalAmount += SalesOrderTestLine."Line Amount";
                TotalVAT += SalesOrderTestLine."Line Amount" * (SalesOrderTestLine."VAT %" / 100);
                TotalAmountInclVAT += SalesOrderTestLine."Line Amount" * (1 + SalesOrderTestLine."VAT %" / 100);
            until SalesOrderTestLine.Next() = 0;

        if SalesOrderTestHeader.Get(Rec."Document No.") then begin
            SalesOrderTestHeader."Subtotal Excl. VAT" := TotalAmount;
            SalesOrderTestHeader."Total VAT" := TotalVAT;
            SalesOrderTestHeader."Amount" := TotalAmount - SalesOrderTestHeader."Invoice Discount Amount";
            SalesOrderTestHeader."Amount Including VAT" := TotalAmountInclVAT - SalesOrderTestHeader."Invoice Discount Amount";
            SalesOrderTestHeader.Modify();
        end;
    end;
}