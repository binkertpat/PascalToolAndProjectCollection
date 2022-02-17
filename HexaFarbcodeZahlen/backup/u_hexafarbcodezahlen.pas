unit u_HexaFarbcodeZahlen;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var r,g,b,rk,gk,bk:integer;
begin
//Eingabe Farbwerte
 r:=strtoint(Edit1.Text);
 If r>256 Then
  begin
   r:=256;
   Edit1.text:=inttostr(r);
  end;

 g:=strtoint(Edit2.text);
  If g>256 Then
   begin
    g:=256;
    Edit3.text:=inttostr(g);
   end;

 b:=strtoint(Edit3.text);
  If b>256 Then
   begin
    b:=256;
    Edit3.text:=inttostr(b);
   end;

//Ausgabe Farbe
 Panel1.Color:=RGB(r,g,b);

//Berechnung Komplementärfarbe
 rk:=256-r;
 gk:=256-g;
 bk:=256-b;

//Ausgabe Komplementärfarbe
 Panel2.Color:=RGB(rk,gk,bk);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


end.

