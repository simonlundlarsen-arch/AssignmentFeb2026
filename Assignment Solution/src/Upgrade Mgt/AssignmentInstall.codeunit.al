codeunit 50101 "SLL Assignment Install"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        AssignmentMgt: Codeunit "SLL Assignment Mgt";
    begin
        // AssignmentMgt.InsertAssignment('Setup Assignment Solution', 'Setup the assignment solution', '');
    end;
}