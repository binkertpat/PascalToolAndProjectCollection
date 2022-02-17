unit u_Notenspiegel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TNotenspiegel }

  TNotenspiegel = class(TForm)
    B_close: TButton;
    B_rechne: TButton;
    E_gesamtpunkte: TEdit;
    E_erreichtePunkte: TEdit;
    E_note: TEdit;
    E_punkte: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure B_rechneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Notenspiegel: TNotenspiegel;

implementation

{$R *.lfm}

{ TNotenspiegel }

procedure TNotenspiegel.FormCreate(Sender: TObject);
begin
end;

procedure TNotenspiegel.B_rechneClick(Sender: TObject);
var gesamtpunkte, erreichtepunkte,j:double;
begin
    //leeren der Variablen

    gesamtpunkte:=0;
    erreichtepunkte:=0;

    //Eingabe Punkte

    gesamtpunkte:=strtofloat(E_Gesamtpunkte.text);
    erreichtepunkte:=strtofloat(E_erreichtepunkte.text);

    //Rechenvariable leeren

    j:=0;

    //erreichte Prozent berechnen

    j:=erreichtepunkte / gesamtpunkte;

    //Ausgabe Note Sek 1

    if j>=0.95 then E_note.text:=floattostr(1);
    if (j<0.95) AND (j>=0.80) then E_note.text:=floattostr(2);
    if (j<0.8) AND (j>=0.60) then E_note.text:=floattostr(3);
    if (j<0.6) AND (j>=0.45)then E_note.text:=floattostr(4);
    if (j<0.45) AND (j>=0.25) then E_note.text:=floattostr(5);
    if (j<0.25) then E_note.text:=floattostr(6);

    //Ausgabe Punkte Sek 2

    if j>=0.96 then E_note.text:=floattostr(15);
    if (j<0.96) AND (j>=0.91) then E_punkte.text:=floattostr(14);
    if (j<0.91) AND (j>=0.86) then E_punkte.text:=floattostr(13);
    if (j<0.86) AND (j>=0.81)then E_punkte.text:=floattostr(12);
    if (j<0.81) AND (j>=0.76) then E_punkte.text:=floattostr(11);
    if (j<0.76) AND (j>=0.71) then E_punkte.text:=floattostr(10);
    if (j<0.71) AND (j>=0.66) then E_punkte.text:=floattostr(9);
    if (j<0.66) AND (j>=0.61)then E_punkte.text:=floattostr(8);
    if (j<0.61) AND (j>=0.56) then E_punkte.text:=floattostr(7);
    if (j<0.56) AND (j>=0.51) then E_punkte.text:=floattostr(6);
    if (j<0.51) AND (j>=0.46) then E_punkte.text:=floattostr(5);
    if (j<0.46) AND (j>=0.41)then E_punkte.text:=floattostr(4);
    if (j<0.41) AND (j>=0.35) then E_punkte.text:=floattostr(3);
    if (j<0.35) AND (j>=0.28) then E_punkte.text:=floattostr(2);
    if (j<0.28) AND (j>=0.21) then E_punkte.text:=floattostr(1);
    if (j<0.21) then E_punkte.text:=floattostr(0);

    end;


end.

