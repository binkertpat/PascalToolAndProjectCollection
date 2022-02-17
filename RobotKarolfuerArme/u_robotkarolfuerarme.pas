unit u_RobotKarolfuerArme;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var
  i,j:integer;
procedure TForm1.FormCreate(Sender: TObject);

begin
 StringGrid1.cells[i,j]:='#####';
 StringGrid1.cells[2,5]:='Baum';
 StringGrid1.cells[5,4]:='Auto';
 StringGrid1.cells[3,4]:='Bier';
 StringGrid1.cells[0,8]:='Haus';
 StringGrid1.cells[9,5]:='Baum';
 StringGrid1.cells[7,7]:='Auto';
 StringGrid1.cells[8,6]:='Bier';
 StringGrid1.cells[3,8]:='Haus';
 StringGrid1.cells[8,1]:='Baum';
 StringGrid1.cells[6,2]:='Auto';
 StringGrid1.cells[4,3]:='Bier';
 StringGrid1.cells[2,1]:='Haus';
 StringGrid1.cells[1,5]:='Tier';
 StringGrid1.cells[5,0]:='Clown';
 StringGrid1.cells[8,9]:='Bär';
 StringGrid1.cells[4,6]:='Kind';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     if j-1<0 THEN
         Begin
              Edit1.text:='Da steht eine Wand!';
              Form1.color:=clred;
         end;
     if (j-1>=0) AND (StringGrid1.cells[i,j-1]='') THEN
      begin
          StringGrid1.cells[i,j]:='';
          j:=j-1;
          StringGrid1.cells[i,j]:='#####';
          Edit1.text:='';
          Form1.color:=cldefault;
      end
     ELSE
      if j-1>0 THEN
          Begin
               Edit1.text:=Concat('Da steht ein ',StringGrid1.cells[i,j-1],' im Weg!');
               Form1.color:=clred;
          end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     if j+1>9 THEN
         Begin
              Edit1.text:='Da steht eine Wand!';
              Form1.color:=clred;
         end;
     if (j+1<10) AND (StringGrid1.cells[i,j+1]='') THEN
      begin
          StringGrid1.cells[i,j]:='';
          j:=j+1;
          StringGrid1.cells[i,j]:='#####';
          Edit1.text:='';
          Form1.color:=cldefault;
      end
     ELSE
      if j+1<10 THEN
       Begin
            Edit1.text:=Concat('Da steht ein ',StringGrid1.cells[i,j+1],' im Weg!');
            Form1.color:=clred;
       end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     if i-1<0 THEN
         Begin
              Edit1.text:='Da steht eine Wand!';
              Form1.color:=clred;
         end;
     if (i-1>=0) AND (StringGrid1.cells[i-1,j]='') THEN
      begin
          StringGrid1.cells[i,j]:='';
          i:=i-1;
          StringGrid1.cells[i,j]:='#####';
          Edit1.text:='';
          Form1.color:=cldefault;
      end
     ELSE
      if i-1>=0 THEN
       Begin
            Edit1.text:=Concat('Da steht ein ',StringGrid1.cells[i-1,j],' im Weg!');
            Form1.color:=clred;
       end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     if i+1>9 THEN
         Begin
              Edit1.text:='Da steht eine Wand!';
              Form1.color:=clred;
         end;
     if (i+1<=9) AND (StringGrid1.cells[i+1,j]='') THEN
      begin
          StringGrid1.cells[i,j]:='';
          i:=i+1;
          StringGrid1.cells[i,j]:='#####';
          Edit1.text:='';
          Form1.color:=cldefault;
      end
     ELSE
      if i+1<10 THEN
       Begin
            Edit1.text:=Concat('Da steht ein ',StringGrid1.cells[i+1,j],' im Weg!');
            Form1.color:=clred;
       end;
end;

end.

