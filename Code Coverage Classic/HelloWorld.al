pageextension 72653575 "My CustomerListExt" extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world!');
    end;
}

