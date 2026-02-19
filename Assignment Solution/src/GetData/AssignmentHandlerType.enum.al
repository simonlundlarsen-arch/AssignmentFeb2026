enum 50101 "SLL Assignment Handler Type" implements "SLL IAssignmentData"
{
    Extensible = true;

    value(0; JsonPlaceholder)
    {
        Caption = 'JsonPlaceholder';
        Implementation = "SLL IAssignmentData" = "SLL JsonPlaceholder API Mgt";
    }
    value(1; DemoDataLoader)
    {
        Caption = 'DemoDataLoader';
        Implementation = "SLL IAssignmentData" = "SLL DemoData Loader";
    }
}