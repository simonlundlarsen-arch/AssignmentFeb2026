page 50101 "SLL Assignment Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "SLL Assignment";
    RefreshOnActivate = true;
    Caption = 'Assignment Card';

    AboutText = 'Details of an Assignment.';
    AboutTitle = 'About Assignment Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Importance = Standard;
                    ToolTip = 'Specifies the value of the Assignment No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        NoSeriesCheck();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Importance = Standard;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
            Group(SystemInfo)
            {
                Caption = 'System Information';

                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }

    local procedure NoSeriesCheck()
    var
        AssignmentSetup: Record "SLL Assignment Setup";
        NoSeriesErrorInfo: ErrorInfo;
        NoSeriesMissing: Label 'No. series missing on Assignment Setup';
        SetupErr: Label 'The No. series has not been setup in the Assignment Setup.';
    begin
        AssignmentSetup.InsertIfNotExists();
        //Basic Error Handling, throws a simple unusable error.
        // AssignmentSetup.TestField("No. Series");

        // Alternative basic error handling
        if AssignmentSetup."No. Series" = '' then begin
            //     Error(SetupErr);
            NoSeriesErrorInfo.Title := Format(NoSeriesMissing);
            NoSeriesErrorInfo.Message := Format(SetupErr);
            NoSeriesErrorInfo.AddNavigationAction('Go to Assignment Setup');
            NoSeriesErrorInfo.PageNo := Page::"SLL Assignment Setup";

            Error(NoSeriesErrorInfo);
        end;
    end;
}