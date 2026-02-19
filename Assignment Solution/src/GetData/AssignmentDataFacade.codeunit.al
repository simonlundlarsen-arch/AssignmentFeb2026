codeunit 50105 "SLL Assignment Data Facade"
{
    var
        AssignmentDataInterface: Interface "SLL IAssignmentData";
        AssigmentSetup: Record "SLL Assignment Setup";

    procedure GetData()
    begin
        AssigmentSetup.InsertIfNotExists();
        AssignmentDataInterface := AssigmentSetup."Assignment Handler";
        AssignmentDataInterface.GetData();
    end;

}