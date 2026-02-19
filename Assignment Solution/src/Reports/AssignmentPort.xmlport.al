xmlport 50100 "SLL Assignment Port"
{
    Direction = Export;
    FileName = 'Assignments.xml';
    // Format = VariableText;

    schema
    {
        textelement(Root)
        {
            XmlName = 'root';
            tableelement(Assignment; "SLL Assignment")
            {
                XmlName = 'assignment';
                fieldattribute(No; Assignment."No.")
                {
                }
                fieldattribute(Status; Assignment.Status)
                {
                }

                fieldelement(Title; Assignment.Title)
                {
                }
                fieldelement(Description; Assignment.Description)
                {
                }
                fieldelement(CustomerNo; Assignment."Customer No.")
                {
                }
                fieldelement(CategoryCode; Assignment."Category Code")
                {
                }
            }
        }
    }
}