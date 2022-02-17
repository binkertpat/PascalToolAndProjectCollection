unit u_SchereSteinPapier;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSchereSteinPapier }

  TSchereSteinPapier = class(TForm)
    Button1: TButton;
    B_reset: TButton;
    B_spiele: TButton;
    A_punktes: TEdit;
    A_punktec: TEdit;
    E_ssp: TEdit;
    A_computer: TEdit;
    A_sieg: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure B_resetClick(Sender: TObject);
    procedure B_spieleClick(Sender: TObject);
  private

  public

  end;

var
  SchereSteinPapier: TSchereSteinPapier;

implementation

{$R *.lfm}

{ TSchereSteinPapier }
var
  s,c:integer;
procedure TSchereSteinPapier.B_spieleClick(Sender: TObject);
var
  spieler, computer:string;
  zahl:integer;
begin
randomize;
 if E_ssp.text='' then E_ssp.text:=''
  Else
   begin
    spieler:=E_ssp.text;
    zahl:=Random(3)+1;
     case zahl of
      1: computer:='Schere';
      2: computer:='Stein';
      3: computer:='Papier';
     end;
    A_computer.text:=computer;

    if (spieler='Schere') AND (computer='Schere') Then A_sieg.text:='Unentschieden';
    if (spieler='Schere') AND (computer='Stein') Then A_sieg.text:='Verloren';
    if (spieler='Schere') AND (computer='Papier') Then A_sieg.text:='Sieg';

    if (spieler='Stein') AND (computer='Schere') Then A_sieg.text:='Sieg';
    if (spieler='Stein') AND (computer='Stein') Then A_sieg.text:='Unentschieden';
    if (spieler='Stein') AND (computer='Papier') Then A_sieg.text:='Verloren';

    if (spieler='Papier') AND (computer='Schere') Then A_sieg.text:='Verloren';
    if (spieler='Papier') AND (computer='Stein') Then A_sieg.text:='Sieg';
    if (spieler='Papier') AND (computer='Papier') Then A_sieg.text:='Unentschieden';

    if A_sieg.text='Unentschieden' then SchereSteinPapier.color:=clscrollbar;
    if A_sieg.text='Sieg' then
       begin
        SchereSteinPapier.color:=clgreen;
        s:=s+1;
       end;
    if A_sieg.text='Verloren' then
       begin
        SchereSteinPapier.color:=clred;
        c:=c+1;
       end;

     A_punktes.text:=inttostr(s);
     A_punktec.text:=inttostr(c);

  end;
end;

procedure TSchereSteinPapier.Button1Click(Sender: TObject);
begin
  close;

end;

procedure TSchereSteinPapier.B_resetClick(Sender: TObject);
begin
   SchereSteinPapier.color:=clDefault;
   E_ssp.text:='';
   A_computer.text:='';
   A_sieg.text:='';
   A_punktes.text:=inttostr(0);
   A_punktec.text:=inttostr(0);
end;

end.

