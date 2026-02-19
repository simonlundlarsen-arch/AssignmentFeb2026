codeunit 50106 "SLL DemoData Loader" implements "SLL IAssignmentData"
{
    procedure GetData()
    var
        AssignmentMgt: Codeunit "SLL Assignment Mgt";
        Assignments: Record "SLL Assignment";
    begin
        // Project Setup & Configuration
        AssignmentMgt.InsertAssignment('Setup Assignment Solution', 'Configure the base assignment solution before proceeding');
        AssignmentMgt.InsertAssignment('Configure Number Series', 'Create and assign a number series for the Assignment table');
        AssignmentMgt.InsertAssignment('Create Permission Set', 'Define a permission set scoping access to Assignment objects');
        AssignmentMgt.InsertAssignment('Setup Demo Data', 'Run the demo data loader to populate initial assignments');

        // Development Tasks
        AssignmentMgt.InsertAssignment('Add Status Field', 'Extend the Assignment table with a Status field using the Status enum');
        AssignmentMgt.InsertAssignment('Implement IAssignmentData', 'Implement the RAA IAssignmentData interface in the loader codeunit');
        AssignmentMgt.InsertAssignment('Add Due Date Field', 'Add a Due Date field to the Assignment table and list page');
        AssignmentMgt.InsertAssignment('Create Assignment API', 'Expose assignments via an API page for external consumption');
        AssignmentMgt.InsertAssignment('Build Assignment FactBox', 'Create a FactBox showing assignment statistics on related pages');
        AssignmentMgt.InsertAssignment('Add Priority Field', 'Add a Priority field (Low/Medium/High) to the Assignment table');

        // Testing
        AssignmentMgt.InsertAssignment('Write Unit Tests', 'Write automated tests covering InsertAssignment and GetNextNo');
        AssignmentMgt.InsertAssignment('Test Number Series', 'Verify that the number series increments correctly on insert');
        AssignmentMgt.InsertAssignment('Test Status Transitions', 'Verify valid and invalid status transitions in Assignment Mgt.');
        AssignmentMgt.InsertAssignment('Verify Demo Data Load', 'Run GetData and confirm all demo records are created correctly');

        // Integration
        AssignmentMgt.InsertAssignment('Integrate with Sales Order', 'Trigger assignment creation on Sales Order release event');
        AssignmentMgt.InsertAssignment('Connect JSON Placeholder API', 'Fetch external tasks from JSONPlaceholder and map to assignments');
        AssignmentMgt.InsertAssignment('Setup Assisted Setup Entry', 'Register the assignment setup in the Assisted Setup module');

        // Documentation & Handover
        AssignmentMgt.InsertAssignment('Document Table Design', 'Write field-level documentation for the Assignment table');
        AssignmentMgt.InsertAssignment('Review Code with Team', 'Schedule and complete a code review session with the team');
        AssignmentMgt.InsertAssignment('Deploy to Test Environment', 'Publish the extension to the customer test environment and verify');
    end;
}