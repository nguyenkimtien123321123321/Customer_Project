codeunit 50304 "Sales Order Test Event Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"_Sales Order Test Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyLine(var Rec: Record "_Sales Order Test Line")
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.UpdateHeaderAmountsFromLine(Rec."Document No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"_Sales Order Test Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertLine(var Rec: Record "_Sales Order Test Line")
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.UpdateHeaderAmountsFromLine(Rec."Document No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"_Sales Order Test Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteLine(var Rec: Record "_Sales Order Test Line")
    var
        SalesOrderTestMgt: Codeunit "Sales Order Test Management";
    begin
        SalesOrderTestMgt.UpdateHeaderAmountsFromLine(Rec."Document No.");
    end;
}