codeunit 50302 "Test No Series Management"
{
    procedure InitSeries(NoSeriesCode: Code[20]; var NoSeriesField: Code[20]; var DocumentNo: Code[20])
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        SetupNoSeries(NoSeriesCode);
        NoSeriesField := NoSeriesCode;
        NoSeriesMgt.InitSeries(NoSeriesCode, NoSeriesField, 0D, DocumentNo, NoSeriesField);
    end;

    procedure SetupNoSeries(NoSeriesCode: Code[20])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        // Kiểm tra nếu dòng số chưa tồn tại thì tạo mới
        if not NoSeries.Get(NoSeriesCode) then begin
            NoSeries.Init();
            NoSeries.Code := NoSeriesCode;
            NoSeries.Description := GetNoSeriesDescription(NoSeriesCode);
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert(true);

            // Tạo dòng số chi tiết
            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := NoSeriesCode;
            NoSeriesLine."Starting No." := GetStartingNo(NoSeriesCode);
            NoSeriesLine."Ending No." := '999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert(true);
        end;
    end;

    local procedure GetNoSeriesDescription(NoSeriesCode: Code[20]): Text[100]
    begin
        case NoSeriesCode of
            'SOTEST':
                exit('Sales Order Test Nos.');
            'CUSTTEST':
                exit('Customer Test Nos.');
            'PRODTEST':
                exit('Product Test Nos.');
            else
                exit(NoSeriesCode + ' Nos.');
        end;
    end;

    local procedure GetStartingNo(NoSeriesCode: Code[20]): Code[20]
    begin
        case NoSeriesCode of
            'SOTEST':
                exit('101001');
            'CUSTTEST':
                exit('201001');
            'PRODTEST':
                exit('301001');
            else
                exit('100001');
        end;
    end;
}