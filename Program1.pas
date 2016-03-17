//Динамическая DLL-библиотека на примере минуса
library FirstDLLProject;
uses
  SysUtils,
  Classes;
{$R *.res}
function Minus(X,Y:Extended):Extended;
StdCall;
begin
  Result:=X-Y;
end;
exports Minus;


begin
end.
//Подключение библиотеки к калькулятору
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus, Math, Buttons;

type TAddIntegers=function(p1,p2:integer):integer;
stdcall;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton...
private
    Summ, Minus, Umnojenie, Delenie: TAddIntegers;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a,b,c:real;
  x,y,z,i:integer;
  d:char;

implementation
{$R *.dfm}
procedure TForm1.Button20Click(Sender: TObject);
var
  r:integer;
  Handle:LongWord;
begin
b:=StrToFloat(Edit1.Text);
if (y>0) then
  begin
  Handle:=LoadLibrary('FirstDLLProject.dll');
  if (Handle=0) then
    begin
     ShowMessage('Библ. FirstDLLProject.dll не найдена');
     Halt;
     @Minus:=GetProcAddress(Handle,'Minus');
     r:=Minus(12,20);
     ShowMessage(IntToStr(r));
     FreeLibrary(Handle);
     end;
    c:=a-b;
    Edit1.Text:=FloatToStr(c);
    a:=0;
    b:=0;
    y:=0;
    c:=0;
  end;
end;  
