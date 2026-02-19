xmlport 50101 "SLL Assignment CSV Port"
{
    Caption = 'Assignment CSV Port';
    Direction = Export;
    FileName = 'Assignment.csv';
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ';';

    schema
    {
        textelement(root)
        {
            tableelement(Assignments; "SLL Assignment")
            {

                fieldelement(No; Assignments."No.")
                {
                }
                fieldelement(Status; Assignments.Status)
                {
                }
                fieldelement(Title; Assignments.Title)
                {
                }
                fieldelement(CategoryCode; Assignments."Category Code")
                {
                }
            }
        }
    }
}