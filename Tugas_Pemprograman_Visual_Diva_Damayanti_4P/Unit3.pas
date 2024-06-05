unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    dbgrd1: TDBGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrid1CellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
if edt1.Text = '' then
  begin
    ShowMessage('Masukkan teks');
    Exit;
  end;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('INSERT INTO kategori VALUES (null,"'+edt1.Text+'")');
DataModule4.Zkategori.ExecSQL;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('select * from kategori');
DataModule4.Zkategori.Open;
ShowMessage('Data berhasil disimpan');
end;


procedure TForm3.btn2Click(Sender: TObject);
begin
DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('update kategori set name="'+edt1.Text+'" where id= "'+a+'"');
DataModule4.Zkategori.ExecSQL;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('select * from kategori');
DataModule4.Zkategori.Open;
ShowMessage('Data berhasil diupdate');
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('delete from kategori where id = "'+a+'"');
DataModule4.Zkategori.ExecSQL;

DataModule4.Zkategori.SQL.Clear;
DataModule4.Zkategori.SQL.Add('select * from kategori');
DataModule4.Zkategori.Open;
ShowMessage('Data berhasil dihapus');
end;

procedure TForm3.dbgrid1CellClick(Column: TColumn);
begin
edt1.Text:= DataModule4.Zkategori.Fields[1].AsString;
a:= DataModule4.Zkategori.Fields[0].AsString;
end;

end.
