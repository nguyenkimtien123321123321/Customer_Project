page 50330 "NoSeriesSelectionList"
{
    Caption = 'Select No. Series';
    PageType = List;
    SourceTable = "No. Series";
    UsageCategory = None;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field("Default Nos."; Rec."Default Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Default Nos.';
                }
                field("Manual Nos."; Rec."Manual Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Manual Nos.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewGroup)
            {
                Caption = 'New';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewDocument;

                trigger OnAction()
                var
                    NoSeriesCard: Page "No. Series";
                    TempNoSeries: Record "No. Series";
                begin
                    // Mở trang No. Series để tạo mới
                    NoSeriesCard.SetTableView(Rec);
                    NoSeriesCard.LookupMode(true);
                    if NoSeriesCard.RunModal() = Action::LookupOK then begin
                        // Lấy bản ghi vừa tạo hoặc chọn
                        NoSeriesCard.GetRecord(TempNoSeries);
                        if TempNoSeries.Code <> '' then begin
                            Rec := TempNoSeries;
                            CurrPage.Update(false);
                        end;
                    end;
                end;
            }
            action(EditGroup)
            {
                Caption = 'Edit';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Edit;

                trigger OnAction()
                var
                    NoSeriesCard: Page "No. Series";
                    SelectedNoSeries: Record "No. Series";
                begin
                    // Lấy bản ghi được chọn
                    CurrPage.SetSelectionFilter(SelectedNoSeries);
                    if SelectedNoSeries.Count = 1 then begin
                        SelectedNoSeries.FindFirst();
                        // Mở trang No. Series để chỉnh sửa
                        NoSeriesCard.SetRecord(SelectedNoSeries);
                        NoSeriesCard.RunModal();
                        // Cập nhật lại danh sách sau khi chỉnh sửa
                        if SelectedNoSeries.Get(SelectedNoSeries.Code) then begin
                            Rec := SelectedNoSeries;
                            CurrPage.Update(false);
                        end;
                    end else
                        Message('Please select a single record to edit.');
                end;
            }
        }
    }

    procedure GetSelectedNoSeries(): Code[20]
    begin
        if Rec.Get(Rec.Code) then
            exit(Rec.Code);
        exit('');
    end;
}