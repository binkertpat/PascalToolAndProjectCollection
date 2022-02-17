unit u_ascii;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    E_zahl: TEdit;
    A_Zeichen: TEdit;
    E_zeichen: TEdit;
    A_Zahl: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  n:integer;
begin
  n:=strtoint(E_zahl.text);
  A_Zeichen.text:=Char(n);
end;

procedure TForm1.Button2Click(Sender: TObject);
var z:string; c:char; b:integer;
begin
  z:=E_zeichen.text;
  c:=z[1];
  b:=Ord(c);
  A_Zahl.text:=inttostr(b);
end;

end.

