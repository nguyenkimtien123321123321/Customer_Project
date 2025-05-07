page 50306 "Documents Attachment FactBox"
{
    Caption = 'Attachments';
    PageType = CardPart;
    SourceTable = CustomerExt;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Tabs)
            {
                Caption = 'Attachments';
                field(DocumentCount; CalcDocumentCount())
                {
                    ApplicationArea = All;
                    Caption = 'Documents';
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        DrillDownDocumentAttachment();
                    end;
                }
                field(LinkCount; CalcLinkCount())
                {
                    ApplicationArea = All;
                    Caption = 'Links';
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        DrillDownLinks();
                    end;
                }
                field(NoteCount; CalcNoteCount())
                {
                    ApplicationArea = All;
                    Caption = 'Notes';
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        DrillDownNotes();
                    end;
                }
            }
        }
    }

    local procedure CalcDocumentCount(): Integer
    var
        DocumentAttachment: Record "Document Attachment";
    begin
        DocumentAttachment.SetRange("Table ID", Database::CustomerExt);
        DocumentAttachment.SetRange("No.", Rec."Test ID");
        exit(DocumentAttachment.Count());
    end;

    local procedure CalcLinkCount(): Integer
    var
        RecordLink: Record "Record Link";
    begin
        RecordLink.SetRange("Record ID", Rec.RecordId);
        RecordLink.SetRange(Type, RecordLink.Type::Link);
        exit(RecordLink.Count());
    end;

    local procedure CalcNoteCount(): Integer
    var
        RecordLink: Record "Record Link";
    begin
        RecordLink.SetRange("Record ID", Rec.RecordId);
        RecordLink.SetRange(Type, RecordLink.Type::Note);
        exit(RecordLink.Count());
    end;

    local procedure DrillDownDocumentAttachment()
    var
        DocumentAttachment: Record "Document Attachment";
    begin
        DocumentAttachment.SetRange("Table ID", Database::CustomerExt);
        DocumentAttachment.SetRange("No.", Rec."Test ID");
        Page.Run(Page::"Document Attachment Details", DocumentAttachment);
    end;

    local procedure DrillDownLinks()
    var
        RecordLink: Record "Record Link";
    begin
        RecordLink.SetRange("Record ID", Rec.RecordId);
        RecordLink.SetRange(Type, RecordLink.Type::Link);
        // Page.Run(Page::"Record Links", RecordLink);
    end;

    local procedure DrillDownNotes()
    var
        RecordLink: Record "Record Link";
    begin
        RecordLink.SetRange("Record ID", Rec.RecordId);
        RecordLink.SetRange(Type, RecordLink.Type::Note);
        // Page.Run(Page::"Record Links", RecordLink);
    end;
}