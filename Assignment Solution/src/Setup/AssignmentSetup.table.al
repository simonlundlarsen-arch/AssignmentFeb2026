table 50101 "SLL Assignment Setup"
{
    Caption = 'Assignment Setup';
    DataClassification = SystemMetadata;
    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }

        field(20; "No. Series"; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series".Code;
            Caption = 'No. Series';

            trigger OnValidate()
            var
                AssignmentMgt: Codeunit "SLL Assignment Mgt";
            begin
                AssignmentMgt.UpdateAssistedSetupStatus();
            end;
        }
        field(30; "Assignment Handler"; Enum "SLL Assignment Handler Type")
        {
            DataClassification = SystemMetadata;
            Caption = 'Assignment Handler Type';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    [InherentPermissions(PermissionObjectType::TableData, Database::"SLL Assignment Setup", 'I', InherentPermissionsScope::Both)]
    procedure InsertIfNotExists()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;
}