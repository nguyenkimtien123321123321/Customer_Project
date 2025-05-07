page 50317 "Product Test List"
{
    Caption = 'Product Test List';
    PageType = List;
    SourceTable = "Product Test";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Product Test Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PictureField; Rec.Picture)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Hiển thị hình ảnh sản phẩm.';
                    StyleExpr = PictureStyleTxt;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Picture; "Product Test Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
            part("Item Details"; "Product Test Details")
            {
                ApplicationArea = All;
                Caption = 'Details';
                SubPageLink = "No." = field("No.");
            }
            part("Attachments"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Product Test"),
                              "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewProductTest)
            {
                Caption = 'New';
                ApplicationArea = All;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ProductTest: Record "Product Test";
                    ProductTestCard: Page "Product Test Card";
                begin
                    ProductTest.Init();
                    ProductTest.Insert(true);
                    ProductTestCard.SetRecord(ProductTest);
                    ProductTestCard.Run();
                end;
            }
            action(DeleteProductTest)
            {
                Caption = 'Delete';
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete this record?', false) then
                        Rec.Delete(true);
                end;
            }
        }
    }
    var
        PictureStyleTxt: Text;

    trigger OnAfterGetRecord()
    begin
        PictureStyleTxt := 'StandardAccent';
    end;
}