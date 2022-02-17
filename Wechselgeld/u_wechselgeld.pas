unit u_wechselgeld;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TWechselgeld }

  TWechselgeld = class(TForm)
    B_wechselgeld: TButton;
    B_close: TButton;
    A_eincent: TEdit;
    E_preis: TEdit;
    E_geld: TEdit;
    A_zwei: TEdit;
    A_eins: TEdit;
    A_fuenfzig: TEdit;
    A_zwanzig: TEdit;
    A_zehn: TEdit;
    A_fuenfcent: TEdit;
    A_zweicent: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure B_closeClick(Sender: TObject);
    procedure B_wechselgeldClick(Sender: TObject);
  private

  public

  end;

var
  Wechselgeld: TWechselgeld;

implementation

{$R *.lfm}

{ TWechselgeld }

procedure TWechselgeld.B_closeClick(Sender: TObject);
begin
  close;
end;

procedure TWechselgeld.B_wechselgeldClick(Sender: TObject);
var
 preis, geld, x, diff:double;
 zwei, eins, fuenfzig, zwanzig, zehn, fuenfcent, zweicent, eincent:integer;
begin

  //Eingabe

  preis:=strtofloat(E_preis.text);
  geld:=strtofloat(E_geld.text);

  //Variablen leeren

  zwei:=0;
  eins:=0;
  fuenfzig:=0;
  zwanzig:=0;
  zehn:=0;
  fuenfcent:=0;
  zweicent:=0;
  eincent:=0;
  x:=0;

  //Differenz berechnen

  diff:=geld-preis;

  //Berechnung 2€

  while  x<=diff do
   begin
     x:=x+2;
     zwei:=zwei+1;
   end;

   //Ausgabe 2€
   zwei:=zwei-1;
   A_zwei.text:=inttostr(zwei);

   //Zwischenrechnung

   diff:=diff-(zwei*2);
   x:=0;

   //Berechnung 1€

   while  x<=diff do
   begin
     x:=x+1;
     eins:=eins+1;
   end;

   //Ausgabe 1€

   eins:=eins-1;
   A_eins.text:=inttostr(eins);

   //Zwischenrechnung

   diff:=diff-(eins*1);
   x:=0;

   //Berechnung 0.50€

   while  x<=diff do
   begin
     x:=x+0.50;
     fuenfzig:=fuenfzig+1;
   end;

   //Ausgabe 0.50€

   fuenfzig:=fuenfzig-1;
   A_fuenfzig.text:=inttostr(fuenfzig);

   //Zwischenrechnung

   diff:=diff-(fuenfzig*0.50);
   x:=0;

   //Berechnung 0.20€

   while  x<=diff do
   begin
     x:=x+0.20;
     zwanzig:=zwanzig+1;
   end;

   //Ausgabe 0.20€

   zwanzig:=zwanzig-1;
   A_zwanzig.text:=inttostr(zwanzig);

   //Zwischenrechnung

   diff:=diff-(zwanzig*0.20);
   x:=0;

   //Berechnung 0.10€

   while  x<=diff do
   begin
     x:=x+0.10;
     zehn:=zehn+1;
   end;

   //Ausgabe 0.10€

   zehn:=zehn-1;
   A_zehn.text:=inttostr(zehn);

   //Zwischenrechnung

   diff:=diff-(zehn*0.10);
   x:=0;

   //Berechnung 0.05€

   while  x<=diff do
   begin
     x:=x+0.05;
     fuenfcent:=fuenfcent+1;
   end;

   //Ausgabe 0.05€

   fuenfcent:=fuenfcent-1;
   A_fuenfcent.text:=inttostr(fuenfcent);

    //Zwischenrechnung

   diff:=diff-(fuenfcent*0.05);
   x:=0;

   //Berechnung 0.02€

   while  x<=diff do
   begin
     x:=x+0.02;
     zweicent:=zweicent+1;
   end;

   //Ausgabe 0.02€

   zweicent:=zweicent-1;
   A_zweicent.text:=inttostr(zweicent);

   //Zwischenrechnung

   diff:=diff-(zweicent*0.02);
   x:=0;

   //Berechnung 0.01€

   while  x<=diff do
   begin
     x:=x+0.01;
     eincent:=eincent+1;
   end;

   //Ausgabe 0.01€

   eincent:=eincent-1;
   A_eincent.text:=inttostr(eincent);
end;

end.

