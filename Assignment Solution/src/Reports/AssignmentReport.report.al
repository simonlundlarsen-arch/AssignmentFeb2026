report 50100 "SLL Assignment Report"
{
    Caption = 'Assignment Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(Assignment; "SLL Assignment")
        {

            column(No_Assignment; "No.")
            {
                IncludeCaption = true;
            }
            column(Title_Assignment; Title)
            {
                IncludeCaption = true;
            }
            column(Status_Assignment; Status)
            {
                IncludeCaption = true;
            }
            column(CustomerNo_Assignment; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(CategoryCode_Assignment; "Category Code")
            {
                IncludeCaption = true;
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = field("Customer No.");
                column(Name_Customer; Name)
                {
                    IncludeCaption = true;
                }
                column(Address; Address)
                {
                    IncludeCaption = true;
                }
                column(City; City)
                {
                    IncludeCaption = true;
                }
                column(Country_Region_Code; "Country/Region Code")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'src/Reports/Layouts/AssignmentReport.docx';
        }
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = 'src/Reports/Layouts/AssignmentReport.xlsx';
        }
    }

    var
        myInt: Integer;
}