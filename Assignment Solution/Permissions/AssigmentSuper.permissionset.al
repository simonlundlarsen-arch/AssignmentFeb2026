permissionset 50100 "SLL Assigment Super"
{
    Assignable = true;
    Permissions = codeunit "SLL Assignment Mgt" = X,
        table "SLL Assignment" = X,
        tabledata "SLL Assignment" = RIMD,
        tabledata "SLL Assignment Setup" = RIMD,
        table "SLL Assignment Setup" = X,
        report "SLL Assignment Report" = X,
        codeunit "SLL Assignment Assisted Setup" = X,
        codeunit "SLL Assignment Data Facade" = X,
        codeunit "SLL Assignment Install" = X,
        codeunit "SLL Assignment Upgrade" = X,
        codeunit "SLL DemoData Loader" = X,
        codeunit "SLL JsonPlaceholder API Mgt" = X,
        xmlport "SLL Assignment CSV Port" = X,
        xmlport "SLL Assignment Port" = X,
        page "Assignment List" = X,
        page "SLL Assignment Card" = X,
        page "SLL Assignment Setup" = X,
        page "SLL Assignment Wizard" = X;
}