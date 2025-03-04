table 72653577 "ERV Code Coverage Setup"
{
    Caption = 'ERP Code Coverage Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(5; "Style Objects"; Enum "ERV Code Coverage Styles")
        {
            Caption = 'Style Objects';
            DataClassification = CustomerContent;
        }
        field(6; "Style Functions"; Enum "ERV Code Coverage Styles")
        {
            Caption = 'Style Functions';
            DataClassification = CustomerContent;
        }
        field(7; "Style Code hit"; Enum "ERV Code Coverage Styles")
        {
            Caption = 'Style Code hit';
            DataClassification = CustomerContent;
        }
        field(8; "Style Code no hit"; Enum "ERV Code Coverage Styles")
        {
            Caption = 'Style Code no hit';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}