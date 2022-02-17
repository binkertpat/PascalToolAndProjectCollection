unit u_Bildverschiebung;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ImageList1: TImageList;
    PaintBox1: TPaintBox;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.PaintBox1Paint(Sender: TObject);

begin
  ImageList1.Draw(
    Paintbox1.Canvas,
    ScrollBar1.Position * (PaintBox1.ClientWidth  - ImageList1.Width)  div ScrollBar1.Max,
    Scrollbar2.Position * (Paintbox1.ClientHeight - ImageList1.Height) div Scrollbar2.Max,
    0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  RePaint;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Repaint;
end;

end.

