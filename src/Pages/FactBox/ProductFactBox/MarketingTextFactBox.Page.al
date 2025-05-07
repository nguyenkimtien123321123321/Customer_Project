page 50318 "Marketing Text FactBox"
{
    Caption = 'Marketing Text';
    PageType = CardPart;
    SourceTable = "Product Test";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Marketing Text"; Rec."Marketing Text")
            {
                ApplicationArea = All;
                MultiLine = true;

                trigger OnValidate()
                begin
                    Rec.Modify();
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DraftWithCopilot)
            {
                Caption = 'Draft with Copilot';
                ApplicationArea = All;
                Image = Sparkle;

                trigger OnAction()
                begin
                    Message('Draft with Copilot logic to be implemented.');
                end;
            }
        }
    }
}