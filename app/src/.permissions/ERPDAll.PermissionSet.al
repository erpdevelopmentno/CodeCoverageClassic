permissionset 72653575 "ERPD All"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         codeunit "ERPD Coverage Setup Install" = X,
         page "ERPD Code Classic" = X,
         page "ERPD Code Coverage Setup" = X,
         page "ERPD Coverage Classic" = X,
         table "ERPD Code Coverage Setup" = X,
         tabledata "ERPD Code Coverage Setup" = RIMD;

}