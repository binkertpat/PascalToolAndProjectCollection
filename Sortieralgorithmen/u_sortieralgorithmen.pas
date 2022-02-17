unit u_sortieralgorithmen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ColorBox,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure Pause(pausenzeit:DWORD);
var jetzt:DWORD;
begin
 jetzt:=GetTickCount64;     //Prozedur für Pause
 while(GetTickCount64<jetzt+pausenzeit) and (not Application.Terminated) do Application.ProcessMessages;
end;


procedure TForm1.FormCreate(Sender: TObject);
var Shape : TShape; i,topp:integer;
begin
for i:=1 to 20 do begin
 shape := TShape.Create(self); //die aktuelle Instanz
 shape.Parent := self; //hier auch
 shape.Left := 20+(i*20);
 topp:=random(300)+1;
 shape.Top := topp;
 shape.Width := 20;
 shape.Height :=400-topp;
 shape.Shape := stRoundRect;
 shape.Name := 'Shape'+inttostr(i);
  end;

end;



end.

