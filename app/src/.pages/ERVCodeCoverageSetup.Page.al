page 72653577 "ERV Code Coverage Setup"
{
    ApplicationArea = All;
    Caption = 'ERP Code Coverage Setup';
    PageType = Card;
    SourceTable = "ERV Code Coverage Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Settings';

                field("Style Objects"; Rec."Style Objects")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the style for objects.';
                }
                field("Style Functions"; Rec."Style Functions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the style for functions.';
                }
                field("Style Code hit"; Rec."Style Code hit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the style for code that was hit during coverage.';
                }
                field("Style Code no hit"; Rec."Style Code no hit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the style for code that was not hit during coverage.';
                }
            }
        }
    }
}