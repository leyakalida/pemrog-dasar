unit uMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnAdd: TButton;
    btnDelete: TButton;
    btnCalculate: TButton;
    edtNoOrder: TEdit;
    edtNama: TEdit;
    edtAlamat: TEdit;
    edtJumlahKilogram: TEdit;
    lstLaundry: TListBox;
    lblNoOrder: TLabel;
    lblNama: TLabel;
    lblAlamat: TLabel;
    lblJenis: TLabel;
    lblJumlahKilogram: TLabel;
    lblHarga: TLabel;
    lblTotalHarga: TLabel;
    cmbJenisLaundry: TComboBox;
    procedure btnAddClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstLaundrySelectionChange(Sender: TObject; User: boolean);

  private
    FSelectedIndex : integer;
    procedure FillListBox;
    procedure ClearForm;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SetLength(arrLaundry, 0);
  FSelectedIndex := -1;
end;

procedure TfrmMain.lstLaundrySelectionChange(Sender: TObject; User: boolean);
begin

end;

procedure TfrmMain.FillListBox;
begin

end;

procedure TfrmMain.ClearForm;
begin

end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  no_order: integer;
  nama_pelanggan, alamat, jenis_laundry: string;
  jumlah_kilogram, harga: double;
begin
  if edtNoOrder.Text = '' then
  begin
    ShowMessage('Nomor order harus diisi.');
    Exit;
  end;

  if edtNama.Text = '' then
  begin
    ShowMessage('Nama pelanggan harus diisi.');
    Exit;
  end;

  if edtAlamat.Text = '' then
  begin
    ShowMessage('Alamat pelanggan harus diisi.');
    Exit;
  end;

  if edtJumlahKilogram.Text = '' then
  begin
    ShowMessage('Jumlah kilogram harus diisi.');
    Exit;
  end;

  no_order := StrToInt(edtNoOrder.Text);
  nama_pelanggan := edtNama.Text;
  alamat := edtAlamat.Text;
  jenis_laundry := cmbJenisLaundry.Text;
  jumlah_kilogram := StrToFloat(edtJumlahKilogram.Text);
  harga := CalculateTotalPrice(jumlah_kilogram);

  AddLaundry(no_order, nama_pelanggan, alamat, jenis_laundry, jumlah_kilogram, harga);

  FillListBox;
  ClearForm;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
  if FSelectedIndex < 0 then
  begin
    ShowMessage('Pilih data laundry yang akan dihapus.');
    Exit;
  end;

  DeleteLaundry(FSelectedIndex);

  FillListBox;
  ClearForm;
end;

procedure TfrmMain.btnCalculateClick(Sender: TObject);
begin
  if edtJumlahKilogram.Text = '' then
  begin
    ShowMessage('Jumlah kilogram harus diisi.');
    Exit;
  end;

  lblHarga.Caption := Format('Rp %.0n', [CalculateTotalPrice(StrToFloat(edtJumlahKilogram.Text))]);
end;

procedure TfrmMain.lstLaundrySelectionChange(Sender: TObject; User: boolean);
var
  idx: integer;
begin
   if lstLaundry.ItemIndex < 0 then
    Exit;

  idx := lstLaundry.ItemIndex;

  FSelectedIndex := idx;

  edtNoOrder.Text := IntToStr(arrLaundry[idx].no_order);
  edtNama.Text := arrLaundry[idx].nama_pelanggan;
  edtAlamat.Text := arrLaundry[idx].alamat_pelanggan;
  cmbJenisLaundry.ItemIndex := cmbJenisLaundry.Items.IndexOf(arrLaundry[idx].jenis_laundry);
  edtJumlahKilogram.Text := FloatToStr(arrLaundry[idx].jumlah_kilogram);
  lblHarga.Caption := Format('Rp %.0n', [arrLaundry[idx].harga]);
end;
end.

