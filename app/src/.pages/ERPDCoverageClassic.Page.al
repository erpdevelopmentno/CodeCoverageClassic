Page 72653576 "ERPD Coverage Classic"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    Caption = 'Code Coverage Classic';
    SourceTable = "Code Coverage";
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Line; Rec.Line)
                {
                    ApplicationArea = All;
                    Caption = 'Line';
                    ToolTip = 'The line of code';
                }
                field(HitRatio; HitRatio)
                {
                    ApplicationArea = All;
                    Caption = 'Hit Ratio %';
                    ToolTip = 'The percentage of hits for this line.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Start Code Coverage")
            {
                ApplicationArea = All;
                Caption = 'Start Code Coverage';
                ToolTip = 'Start the code coverage';
                Enabled = not CodeCoverageActive;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CodeCoverageActive := CodeCoverageLog(true, false);
                end;
            }
            action("Stop Code Coverage")
            {
                ApplicationArea = All;
                Caption = 'Stop Code Coverage';
                ToolTip = 'Stop the code coverage and show the results';
                Enabled = CodeCoverageActive;
                Image = Stop;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CodeCoverageActive := CodeCoverageLog(false, false);
                    Process();
                end;
            }
            action("Code")
            {
                ApplicationArea = All;
                Caption = 'Code';
                Image = DesignCodeBehind;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Tooltip = 'Open the code coverage details';

                trigger OnAction()
                var
                    CodeCoverage: Record "Code Coverage";
                begin
                    CodeCoverage := Rec;
                    CodeCoverage.SetRecfilter();
                    CodeCoverage.SetRange("Line No.");
                    Page.Run(Page::"ERPD Code Classic", CodeCoverage);
                end;
            }
            action(Setup)
            {
                ApplicationArea = All;
                Caption = 'Setup';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open the code coverage setup page';

                trigger OnAction()
                begin
                    Page.Run(Page::"ERPD Code Coverage Setup");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        HitRatio := Rec."No. of Hits" / 100;
    end;

    trigger OnOpenPage()
    begin
        CodeCoverageActive := CodeCoverageLog();
        Process();
    end;

    var
        TempCodeCoverage: Record "Code Coverage" temporary;
        CodeCoverageActive: Boolean;
        HitRatio: Decimal;


    procedure Process()
    var
        CodeCoverage: Record "Code Coverage";
        AllHits: Integer;
    begin
        AllHits := 0;
        TempCodeCoverage.Reset();
        TempCodeCoverage.DeleteAll();

        if CodeCoverage.Find('-') then
            repeat

                if not TempCodeCoverage.Get(CodeCoverage."Object Type", CodeCoverage."Object ID", 0) then begin
                    TempCodeCoverage.TransferFields(CodeCoverage);
                    TempCodeCoverage.Insert();
                end;

                TempCodeCoverage."No. of Hits" := TempCodeCoverage."No. of Hits" + CodeCoverage."No. of Hits";
                TempCodeCoverage.Modify();

                AllHits := AllHits + CodeCoverage."No. of Hits";
            until CodeCoverage.Next() = 0;

        Rec.Reset();
        Rec.DeleteAll();

        if TempCodeCoverage.Find('-') then
            repeat
                TempCodeCoverage."No. of Hits" := (ROUND(TempCodeCoverage."No. of Hits" / AllHits * 100, 0.01) * 100);
                TempCodeCoverage.Modify();
                Rec := TempCodeCoverage;
                Rec.Insert();
            until TempCodeCoverage.Next() = 0;

        rec.SetFilter("No. of Hits", '>%1', 0);
    end;
}

