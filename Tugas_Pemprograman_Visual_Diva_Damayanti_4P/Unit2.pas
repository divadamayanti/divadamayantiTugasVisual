unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  if (edt1.Text = 'admin') or (edt1.Text = 'ADMIN') then
  begin
    Form1.mm1.Items[1].Visible:= True;
    Form1.mm1.Items[2].Visible:= False;
    Form1.mm1.Items[1].Visible:= True;
    ShowMessage('Login Successful as Admin');
    close;
    end else if (edt1.Text = 'kasir') or (edt1.Text = 'KASIR')then
    begin
    Form1.mm1.Items[1].Visible:= False;
    Form1.mm1.Items[2].Visible:= True;
    Form1.mm1.Items[3].Visible:= False;
    ShowMessage('Login Successful as Admin');
    close;
    end else if (edt1.Text = 'pemilik') or (edt1.Text = 'PEMILIK')then
    begin
    Form1.mm1.Items[1].Visible:= False;
    Form1.mm1.Items[2].Visible:= False;
    Form1.mm1.Items[3].Visible:= True;
    ShowMessage('Login Successful as Admin');
    close;
    end else if edt1.Text = '' then
    begin
    ShowMessage('Login failed, please fill the text');
    end else
    begin
    ShowMessage('Login Failed, please fill according to your position');
    end;

end;

end.
