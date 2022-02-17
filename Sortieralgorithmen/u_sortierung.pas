unit u_sortierung;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Menus, ActnList;

type

  { TForm1 }

  TForm1 = class(TForm)
    B_anzahlbalken: TButton;
    B_start: TButton;
    B_stop: TButton;
    B_reset: TButton;
    B_close: TButton;
    CB_auswahl: TComboBox;
    L_2balken: TLabel;
    L_50Balken: TLabel;
    L_geschwindigkeit: TLabel;
    P_hintergrund: TPanel;
    L_bubblesort: TLabel;
    L_schnell: TLabel;
    L_langsam: TLabel;
    L_minsort: TLabel;
    L_quicksort: TLabel;
    L_Schrittanzahl: TLabel;
    rahmen: TPanel;
    rahmen1: TPanel;
    rahmen10: TPanel;
    rahmen11: TPanel;
    rahmen12: TPanel;
    rahmen13: TPanel;
    rahmen14: TPanel;
    rahmen15: TPanel;
    rahmen2: TPanel;
    rahmen3: TPanel;
    rahmen4: TPanel;
    rahmen5: TPanel;
    rahmen6: TPanel;
    rahmen7: TPanel;
    rahmen8: TPanel;
    rahmen9: TPanel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure B_anzahlbalkenClick(Sender: TObject);
    procedure B_startClick(Sender: TObject);
    procedure B_stopClick(Sender: TObject);
    procedure B_resetClick(Sender: TObject);
    procedure B_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rahmen1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
var balken:array [1..50] of integer;  schritte:integer; abbruch:boolean;
{$R *.lfm}

{ TForm1 }

procedure Pause(pausenzeit:DWORD);
var jetzt:DWORD;
begin
  jetzt:=GetTickCount64;     //Prozedur für Pause
 while(GetTickCount64<jetzt+pausenzeit) and (not Application.Terminated) do Application.ProcessMessages;
end;
procedure BubbleSort;
var i,y,n,newn,balkenzahl:integer; temp:string;
begin
balkenzahl:=Form1.TrackBar2.position;
abbruch:=false;
schritte:=0;
  temp:='Test';
  for i:=1 to Form1.TrackBar2.position do balken[i]:=(Form1.FindComponent('Panel'+inttostr(i)) as TPanel).height;

n:=Form1.TrackBar2.position;
newn:=0;
Repeat
 if abbruch<>true then
  begin
  for i:=1 to n-1 do
   begin
    if abbruch<>true then
    begin
      (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color:=clred;
      Pause(Form1.TrackBar1.position);
    end;
  if balken[i]>=balken[i+1] then
   begin
     if abbruch<>true then
     begin
      (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).left:=((Form1.FindComponent('Panel'+inttostr(i)) as TPanel).left+20);
      (Form1.FindComponent('Panel'+inttostr(i+1)) as TPanel).left:=((Form1.FindComponent('Panel'+inttostr(i+1)) as TPanel).left-20);
      (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).name:=temp;
      (Form1.FindComponent('Panel'+inttostr(i+1)) as TPanel).name:='Panel'+inttostr(i);
      (Form1.FindComponent(temp) as TPanel).name:='Panel'+inttostr(i+1);
      schritte:=schritte+2;
      Form1.L_bubblesort.caption:='BubbleSort (bei '+inttostr(balkenzahl)+' Balken): '+ inttostr(schritte);
      (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color:=clwhite;
      Pause(Form1.TrackBar1.position);
      (Form1.FindComponent('Panel'+inttostr(i+1)) as TPanel).color:=clblue;
      newn:=i;
      for y:=1 to Form1.TrackBar2.position do balken[y]:=(Form1.FindComponent('Panel'+inttostr(y)) as TPanel).height;
     end;
    end
   else
      begin
        if abbruch<>true then
        begin
         (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color:=clwhite;
         (Form1.FindComponent('Panel'+inttostr(i+1)) as TPanel).color:=clblue;
         Inc(Schritte);
         Form1.L_bubblesort.caption:='BubbleSort (bei '+inttostr(balkenzahl)+' Balken): '+ inttostr(schritte);
         newn:=i;
         if n=2 then (Form1.FindComponent('Panel'+inttostr(1)) as TPanel).color:=clblue;
        end;
      end;
   end;
   n:=newn;
  end
  else n:=1;
 UNTIL n=1;
end;

Procedure SelectionSort;
var i,j,y,zaehler,min,temp,temptop,tempheight,balkenzahl:integer;
Begin
balkenzahl:=Form1.TrackBar2.position;
 for i:=1 to Form1.TrackBar2.position do balken[i]:=(Form1.FindComponent('Panel'+inttostr(i)) as TPanel).height;
 schritte:=0;
 zaehler:=1;
 min:=1;
  Repeat
   for i:=zaehler to Form1.TrackBar2.position do
    begin
     Inc(schritte);
     Form1.L_minsort.caption:='MinSort (bei '+inttostr(balkenzahl)+' Balken): '+ inttostr(schritte);
     (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color:=clyellow;
     Pause(Form1.TrackBar1.position);
     if balken[min]> balken[i] then
      begin
        temp:=min;
        min:=i;
        (Form1.FindComponent('Panel'+inttostr(min)) as TPanel).color:=clred;
        (Form1.FindComponent('Panel'+inttostr(temp)) as TPanel).color:=clwhite;
        Pause(Form1.TrackBar1.position);
        Inc(schritte);
        Form1.L_minsort.caption:='MinSort(bei '+inttostr(balkenzahl)+' Balken): '+ inttostr(schritte);
       end;
      if (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color <> clred then (Form1.FindComponent('Panel'+inttostr(i)) as TPanel).color:=clwhite;
    end;
   (Form1.FindComponent('Panel'+inttostr(min)) as TPanel).color:=clred;
   Pause(Form1.TrackBar1.position);
   temptop:=(Form1.FindComponent('Panel'+inttostr(zaehler)) as TPanel).top;
   tempheight:=(Form1.FindComponent('Panel'+inttostr(zaehler)) as TPanel).height;
   (Form1.FindComponent('Panel'+inttostr(zaehler)) as TPanel).height:=(Form1.FindComponent('Panel'+inttostr(min)) as TPanel).height;
   (Form1.FindComponent('Panel'+inttostr(zaehler)) as TPanel).top:=(Form1.FindComponent('Panel'+inttostr(min)) as TPanel).top;
   (Form1.FindComponent('Panel'+inttostr(min)) as TPanel).height:=tempheight;
   (Form1.FindComponent('Panel'+inttostr(min)) as TPanel).top:=temptop;
   (Form1.FindComponent('Panel'+inttostr(min)) as TPanel).color:=clwhite;
   (Form1.FindComponent('Panel'+inttostr(zaehler)) as TPanel).color:=clblue;
   Pause(Form1.TrackBar1.position);
   Inc(zaehler);
   min:=zaehler;
   Inc(schritte);
   Form1.L_minsort.caption:='MinSort (bei '+inttostr(balkenzahl)+' Balken): '+ inttostr(schritte);
   for i:=1 to Form1.TrackBar2.position do balken[i]:=(Form1.FindComponent('Panel'+inttostr(i)) as TPanel).height;
   if zaehler=Form1.TrackBar2.position then (Form1.FindComponent('Panel'+inttostr(Form1.TrackBar2.position)) as TPanel).color:=clblue;
 until zaehler=Form1.TrackBar2.position;
End;


procedure TForm1.FormCreate(Sender: TObject);
var shape : TPanel; i,topp:integer;
begin

randomize;

for i:=1 to 50 do begin
 shape := TPanel.Create(self); //die aktuelle Instanz
 shape.Parent := self; //hier auch
 shape.Left :=(i*20);
 topp:=random(300)+1;
 shape.Top := topp+10;
 shape.Width := 20;
 shape.Height :=400-topp;
 shape.Name := 'Panel'+inttostr(i);
end;

for i:=1 to 50 do
 begin
  (FindComponent('Panel'+inttostr(i)) as TPanel).color:=clwhite;
  (FindComponent('Panel'+inttostr(i)) as TPanel).caption:='';
 end;

for i:=1 to 50 do (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=false;
for i:=1 to Form1.TrackBar2.position do (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=true;

end;

procedure TForm1.rahmen1Click(Sender: TObject);
begin

end;

procedure TForm1.B_startClick(Sender: TObject);
begin
 if CB_auswahl.itemindex=0 then BubbleSort;
 if CB_auswahl.itemindex=1 then SelectionSort;
end;

procedure TForm1.B_anzahlbalkenClick(Sender: TObject);
var i:integer;
begin
 for i:=1 to 50 do (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=false;
 for i:=1 to Form1.TrackBar2.position do (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=true;
end;

procedure TForm1.B_stopClick(Sender: TObject);
begin
 abbruch:=true;
end;

procedure TForm1.B_resetClick(Sender: TObject);
var i,topp:integer;
begin
for i:=1 to 50 do (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=false;

for i:=1 to Form1.TrackBar2.position do
  begin
   (FindComponent('Panel'+inttostr(i)) as TPanel).visible:=true;
   topp:=random(300)+1;
   (FindComponent('Panel'+inttostr(i)) as TPanel).top:=topp+10;
   (FindComponent('Panel'+inttostr(i)) as TPanel).height:=400-topp;
   (FindComponent('Panel'+inttostr(i)) as TPanel).color:=clwhite;
  end;
end;

procedure TForm1.B_closeClick(Sender: TObject);
begin
  close;
end;

end.

