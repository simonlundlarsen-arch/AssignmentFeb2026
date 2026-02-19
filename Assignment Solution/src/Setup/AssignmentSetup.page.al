page 50103 "SLL Assignment Setup"
{

    PageType = Card;
    SourceTable = "SLL Assignment Setup";
    Caption = 'Assignment Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = all;

    AboutTitle = 'The Assignment Setup Page';
    AboutText = 'The **Assignment Setup** page handels the setup for the Assignment Module.';

    layout
    {
        area(content)
        {
            group(General)
            {
                AboutTitle = 'The General Settings';
                AboutText = 'The General settings for the Assignment Module, which allow you to control the basic functionality of the Assignment Module';
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'The No. Series chosen in this field determines the no series used when creating new assignments.', Comment = '%';
                }
                field("Assignment Handler"; Rec."Assignment Handler")
                {
                    AboutTitle = 'The Assignment Handler';
                    AboutText = 'The Assignment Handler allow you to control the method of assignment import.';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Assignment Handler Type field.', Comment = '%';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
