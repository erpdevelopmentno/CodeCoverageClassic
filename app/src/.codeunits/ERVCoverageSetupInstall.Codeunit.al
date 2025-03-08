codeunit 72653579 "ERV Coverage Setup Install"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure RegisterERVSetup()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertAssistedSetup(
            'ERV Coverage Setup',
            'ERV Coverage',
            'Set up ERV Coverage for code analysis.',
            5,
            ObjectType::Page,
            Page::"ERV Code Coverage Setup",
            Enum::"Assisted Setup Group"::Uncategorized,
            '',
            Enum::"Video Category"::Uncategorized,
            ''
        );
    end;
}
