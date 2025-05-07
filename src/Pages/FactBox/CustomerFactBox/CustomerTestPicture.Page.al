page 50323 "Customer Test Picture"
{
    Caption = 'Picture';
    PageType = CardPart;
    SourceTable = "CustomerExt";

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Hiển thị hình ảnh khách hàng.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import một hình ảnh từ file.';

                trigger OnAction()
                var
                    PictureInStream: InStream;
                    FileName: Text;
                    FromFilter: Text;
                begin
                    FromFilter := 'All Files (*.*)|*.*';
                    if UploadIntoStream('Chọn hình ảnh', '', FromFilter, FileName, PictureInStream) then begin
                        Clear(Rec.Picture);
                        Rec.Picture.ImportStream(PictureInStream, FileName);
                        Rec.Modify(true);
                    end;
                end;
            }
            // ... existing code ...
            action(ExportPicture)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Image = Export;
                ToolTip = 'Export hình ảnh ra file.';

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    PictureOutStream: OutStream;
                    PictureInStream: InStream;
                    FileName: Text;
                    ToFilter: Text;
                begin
                    if not Rec.Picture.HasValue then
                        Error('Không có hình ảnh để export.');

                    ToFilter := 'Image Files (*.jpg;*.jpeg;*.png;*.bmp)|*.jpg;*.jpeg;*.png;*.bmp';
                    FileName := Rec."Test ID" + '.jpg';

                    TempBlob.CreateOutStream(PictureOutStream);
                    Rec.Picture.ExportStream(PictureOutStream);
                    TempBlob.CreateInStream(PictureInStream);
                    DownloadFromStream(PictureInStream, 'Export', '', ToFilter, FileName);
                end;
            }
            // ... existing code ...
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                ToolTip = 'Xóa hình ảnh.';

                trigger OnAction()
                begin
                    if Confirm('Bạn có chắc muốn xóa hình ảnh?') then begin
                        Clear(Rec.Picture);
                        Rec.Modify(true);
                    end;
                end;
            }
        }
    }
}