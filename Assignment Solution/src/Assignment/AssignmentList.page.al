page 50100 "Assignment List"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Assignments';
    Editable = false;
    UsageCategory = Lists;
    SourceTable = "SLL Assignment";
    AdditionalSearchTerms = 'Assignment List, Assignment, To do, To Do, Task';
    CardPageId = "SLL Assignment Card";
    AboutTitle = 'About Assignments';
    AboutText = 'Overview of Assignments.';

    layout
    {
        area(Content)
        {
            repeater(Assignments)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Assignment No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(ExportToExcel)
            {
                Caption = 'Create Assignment';
                ApplicationArea = all;
                ToolTip = 'Creates a new assignment.';
                Promoted = true;
                PromotedCategory = New;
                Image = New;

                trigger OnAction()
                var
                    AssignmentMgt: Codeunit "SLL Assignment Mgt";
                begin
                    AssignmentMgt.InsertAssignment('Test Assignment', 'This is a test assignment.');
                end;
            }
            action(GetData)
            {
                Caption = 'Get Data';
                Image = Import;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    AssignmentDataFacade: Codeunit "SLL Assignment Data Facade";
                begin
                    AssignmentDataFacade.GetData();
                end;
            }

        }
        // area(Processing)
        // {
        //     action(DeleteSelected)
        //     {
        //         trigger OnAction()
        //         var
        //             Assignments: Record "SLL Assignment";
        //         begin
        //             SetSelectionFilter(Assignments);

        //             if not Assignments.IsEmpty then
        //                 Assignments.DeleteAll();
        //         end;
        //     }
        // }
        area(Reporting)
        {
            action(ExportToXML)
            {
                Caption = 'Create Assignment xml Export';
                ApplicationArea = all;
                RunObject = XmlPort "SLL Assignment Port";
                ToolTip = 'Creates a XML Export.';
                Promoted = true;
                PromotedCategory = Report;
                Image = Export;
            }
            action(ExportToCSV)
            {
                Caption = 'Create Assignment CSV Export';
                ApplicationArea = all;
                RunObject = XmlPort "SLL Assignment CSV Port";
                ToolTip = 'Creates a CSV Export.';
                Promoted = true;
                PromotedCategory = Report;
                Image = Export;
            }
        }
    }
}