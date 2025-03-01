Page 72653575 "ERPD Code Classic"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Code Coverage";
    Caption = 'Code Coverage Classic';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. of Hits"; Rec."No. of Hits")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'Number of times the line was executed';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'Line number in the object';
                }
                field(Line; Rec.Line)
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'Line of code';
                }
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'Type of object';
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'ID of the object';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                    ToolTip = 'Type of line';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //LineStyle := 'None';
        LineStyle := 'Ambiguous';

        case true of
            Rec."Line Type" = Rec."line type"::Object:
                LineStyle := GetStyle(2);
            Rec."Line Type" = Rec."line type"::"Trigger/Function":
                LineStyle := GetStyle(2);
            (Rec."Line Type" = Rec."line type"::Code) and (Rec."No. of Hits" > 0):
                LineStyle := GetStyle(7);
            else
                LineStyle := GetStyle(0);
        end;
    end;

    internal procedure GetStyle(StyleValue: Integer): Text[50]
    begin
        case StyleValue of
            0:
                exit('Standard');
            1:
                exit('StandardAccent');
            2:
                exit('Strong');
            3:
                exit('StrongAccent');
            4:
                exit('Attention');
            5:
                exit('AttentionAccent');
            6:
                exit('Favorable');
            7:
                exit('Unfavorable');
            8:
                exit('Ambiguous');
            9:
                exit('Subordinate');
            10:
                exit('Subtle');
            11:
                exit('SubtleAccent');
            12:
                exit('StrongSubtle');
            13:
                exit('StrongSubtleAccent');
            14:
                exit('FavorableAccent');
            15:
                exit('UnfavorableAccent');
            16:
                exit('AmbiguousAccent');
            17:
                exit('SubordinateAccent');
        end;
    end;

    var
        LineStyle: Text;
}