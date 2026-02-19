table 50100 "SLL Assignment"
{
    DataClassification = CustomerContent;
    LookupPageId = "Assignment List";
    DrillDownPageId = "Assignment List";
    DataCaptionFields = "No.", Title;
    Caption = 'Assignment';
    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Assignment No.';
            OptimizeForTextSearch = true;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    AssignmentSetup.InsertIfNotExists();
                    NoSeries.TestManual(AssignmentSetup."No. Series");
                end;
            end;
        }
        field(20; "User ID"; Integer)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'User ID';
        }
        field(30; Title; Text[100])
        {
            DataClassification = CustomerContent;
            OptimizeForTextSearch = true;
            Caption = 'Title';
        }
        field(40; Description; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(50; "Customer No."; Code[20])
        {
            DataClassification = OrganizationIdentifiableInformation;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(60; "Category Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Category Code';
        }
        field(70; Status; Enum "SLL Assignment Status")
        {
            DataClassification = SystemMetadata;
            Caption = 'Status';
        }
        field(80; "Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Caption = 'Customer Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "No.", Status, Title, "Customer No.", "Category Code")
        {
        }
        FieldGroup(DropDown; "No.", Status, Title, Description)
        {
        }
    }

    trigger OnInsert()
    var
        AssignmentMgt: Codeunit "SLL Assignment Mgt";
    begin
        AssignmentMgt.GetNextNo(Rec);
    end;



    var
        AssignmentSetup: Record "SLL Assignment Setup";
        NoSeries: Codeunit "No. Series";

}