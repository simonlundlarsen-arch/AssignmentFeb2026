codeunit 50100 "SLL Assignment Mgt"
{
    procedure InsertAssignment(Title: Text[100]; Description: Text[250])
    var
        Assignment: Record "SLL Assignment";
    begin
        Assignment.Init();
        GetNextNo(Assignment);
        Assignment.Title := Title;
        Assignment.Description := Description;
        Assignment."Customer No." := '';
        if not Assignment.Insert() then;
    end;

    procedure InsertAssignment(UserId: Integer; Title: Text[100]; CompletedStatus: Enum "SLL Assignment Status")
    var
        Assignment: Record "SLL Assignment";
    begin
        Assignment.Init();
        GetNextNo(Assignment);
        Assignment.Title := Title;
        Assignment.Description := Title;
        Assignment."User ID" := UserId;
        Assignment.Status := CompletedStatus;
        if not Assignment.Insert() then;
    end;

    procedure InsertAssignment(var Assignment: Record "SLL Assignment")
    begin
        if Assignment."No." = '' then
            GetNextNo(Assignment);
        Assignment.Insert();
    end;

    procedure GetNextNo(var Assignment: Record "SLL Assignment")
    var
        AssignmentLookup: Record "SLL Assignment";
        AssignmentSetup: Record "SLL Assignment Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Assignment."No." = '' then begin
            AssignmentSetup.InsertIfNotExists();
            AssignmentSetup.TestField("No. Series");
            Assignment."No." := NoSeries.GetNextNo(AssignmentSetup."No. Series");

            AssignmentLookup.ReadIsolation(IsolationLevel::ReadUncommitted);
            AssignmentLookup.SetLoadFields("No.");
            while AssignmentLookup.Get(Assignment."No.") do
                Assignment."No." := NoSeries.GetNextNo(AssignmentSetup."No. Series");
        end;
    end;

    procedure UpdateAssistedSetupStatus()
    var
        AssignmentSetup: Record "SLL Assignment Setup";
        AssignmentAssistedSetup: Codeunit "SLL Assignment Assisted Setup";
    begin
        if AssignmentSetup."No. Series" <> '' then
            AssignmentAssistedSetup.UpdateStatus();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    var
        SalesDocDescriptionLbl: Label 'Remember to post Sales Document %1', Comment = 'Sales Header No.';
        SalesDocTitleLbl: Label 'Post Sales Doc %1', Comment = 'Sales Header No.';
    begin
        InsertAssignment(StrSubstNo(SalesDocTitleLbl, SalesHeader."No."), StrSubstNo(SalesDocDescriptionLbl, SalesHeader."No."));
    end;
}