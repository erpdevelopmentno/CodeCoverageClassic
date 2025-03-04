permissionset 72653575 "ERV All"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         codeunit "ERV Coverage Setup Install" = X,
         page "ERV Code Classic" = X,
         page "ERV Code Coverage Setup" = X,
         page "ERV Coverage Classic" = X,
         table "ERV Code Coverage Setup" = X,
         tabledata "ERV Code Coverage Setup" = RIMD;

}