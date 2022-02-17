unit u_schaltjahr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    B_pruefe: TButton;
    B_killall: TButton;
    B_close: TButton;
    E_Jahreszahl: TEdit;
    A_Antwort: TEdit;
    t_jahr: TLabel;
    t_jahr1: TLabel;
    t_jahr2: TLabel;
    procedure B_killallClick(Sender: TObject);
    procedure B_closeClick(Sender: TObject);
    procedure B_pruefeClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.B_closeClick(Sender: TObject);
begin
  close;

end;

procedure TForm1.B_pruefeClick(Sender: TObject);
var k,n:integer;
begin
  n:=strtoint(E_Jahreszahl.text);

  k:= n mod 4;

  If k=0 Then A_Antwort.text:='Schaltjahr!'
         Else A_Antwort.text:='Kein Schaltjahr!'

end;

procedure TForm1.B_killallClick(Sender: TObject);
begin
  E_Jahreszahl.text:='';
  A_Antwort.text:='';
end;

end.

