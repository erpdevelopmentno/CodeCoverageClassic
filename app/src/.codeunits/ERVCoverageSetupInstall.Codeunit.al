codeunit 72653578 "ERV Coverage Setup Install"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::"Extension Installation", 'OnOpenPageEvent', '', false, false)]
    local procedure HandleExtensionSetup()
    begin
        ShowSetupPage();
    end;

    procedure ShowSetupPage()
    var
        ERPDCodeCoverageSetup: Record "ERV Code Coverage Setup";
    begin
        if not ERPDCodeCoverageSetup.Get() then begin
            ERPDCodeCoverageSetup.Init();
            ERPDCodeCoverageSetup."Primary Key" := '';
            ERPDCodeCoverageSetup."Style Objects" := "ERV Code Coverage Styles"::Strong;  // Value 2
            ERPDCodeCoverageSetup."Style Functions" := "ERV Code Coverage Styles"::Strong;  // Value 2
            ERPDCodeCoverageSetup."Style Code hit" := "ERV Code Coverage Styles"::Unfavorable;  // Value 7
            ERPDCodeCoverageSetup."Style Code no hit" := "ERV Code Coverage Styles"::Standard;  // Value 0
            ERPDCodeCoverageSetup.Insert();
        end;
        Page.Run(Page::"ERV Code Coverage Setup");
    end;
}