codeunit 50102 "SLL Assignment Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        InsertCategoryCode();
    end;

    local procedure InsertCategoryCode()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(InsertCategoryCodeLbl) then exit;
        // Tilføj opgraderingslogik
        UpgradeCategoryCode();


        UpgradeTag.SetUpgradeTag(InsertCategoryCodeLbl);
    end;

    local procedure UpgradeCategoryCode()
    var
        Assignments: Record "SLL Assignment";
    begin
        Assignments.SetFilter("Category Code", '%1', '');
        Assignments.ModifyAll("Category Code", 'DEFAULT');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(InsertCategoryCodeLbl);
    end;

    var
        InsertCategoryCodeLbl: Label 'PublisherAffix-InsertCategoryCode-ID-20260217', Locked = true;
}