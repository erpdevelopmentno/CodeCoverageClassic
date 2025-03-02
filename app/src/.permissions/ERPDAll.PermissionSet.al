permissionset 72653575 "ERPD All"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         table "ERPD Code Coverage Setup" = X,
         page "ERPD Code Classic" = X,
         page "ERPD Coverage Classic" = X;
         page "ERPD Code Coverage Setup" = X;
         enum "ERPD Code Coverage Styles" = X;
         Codeunit "ERPD Code Coverage" = X;
}