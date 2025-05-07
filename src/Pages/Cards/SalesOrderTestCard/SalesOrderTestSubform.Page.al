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
                var
                    SalesOrderTestLineMgt: Codeunit "S_Order Test Line Management";
                begin
                    Rec.Init();
                    Rec."Document No." := CurrPage.Caption;
                    Rec."Line No." := SalesOrderTestLineMgt.GetNextLineNo(Rec."Document No.");
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
                var
                    SalesOrderTestLineMgt: Codeunit "S_Order Test Line Management";
                begin
                    SalesOrderTestLineMgt.DeleteLine(Rec);
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
                    ProductTest: Record "Product Test";
                    ProductTestList: Page "Product Test List";
                    SalesOrderTestLineMgt: Codeunit "S_Order Test Line Management";
                begin
                    ProductTestList.LookupMode(true);
                    if ProductTestList.RunModal() = Action::LookupOK then begin
                        ProductTestList.GetRecord(ProductTest);
                        Rec.Init();
                        Rec."Document No." := CurrPage.Caption;
                        Rec."Line No." := SalesOrderTestLineMgt.GetNextLineNo(Rec."Document No.");
                        Rec.Type := Rec.Type::Item;
                        Rec."No." := ProductTest."No.";
                        Rec.Insert(true);
                    end;
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        UpdateHeaderAmounts();
        exit(true);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UpdateHeaderAmounts();
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        UpdateHeaderAmounts();
        exit(true);
    end;

    local procedure UpdateHeaderAmounts()
    var
        SalesOrderTestHeader: Record "Sales Order Test Header";
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestHeader.Get(Rec."Document No.");
        SalesOrderTestMgt.CalcTotals(SalesOrderTestHeader);
    end;
}