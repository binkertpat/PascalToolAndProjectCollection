unit u_HexaFarbcodeZahlen;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;

    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  r,g,b,rk,gk,bk:integer;
begin
//Farbwerte aus Scrollbar
 r:=scrollbar1.Position;
 g:=scrollbar2.Position;
 b:=scrollbar3.Position;

//Ausgabe Zahlen aus Scrollbar
 Edit1.text:=inttostr(r);
 Edit2.text:=inttostr(g);
 Edit3.text:=inttostr(b);

//Berechnung Komplementärfarbe
 rk:=256-r;
 gk:=256-g;
 bk:=256-b;

//Darstellung (Komplementär-)Farbe
 panel1.color:=RGB(scrollbar1.Position,scrollbar2.Position,scrollbar3.Position);
 panel2.color:=RGB(rk,gk,bk);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  repaint;
end;


end.

