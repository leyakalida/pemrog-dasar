program laundry;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
var
   kdpaket, YN, nmpaket:string;
  harga, jml, subtotal, diskon, totalbiaya:real;

begin
  writeln('-------------------- LaundryKu -------------------');
  writeln;
  writeln('Pilih Paket ');
  writeln;
  writeln('--------------------------------------------------');
  writeln('| Kode Paket | Nama Paket           | Harga      |');
  writeln('--------------------------------------------------');
  writeln('|     L1     | Cuci Lipat           | Rp. 3.000  |');
  writeln('|     L2     | Cuci Setrika         | Rp. 6.000  |');
  writeln('|     L3     | Setrika              | Rp. 4.000  |');
  writeln('|     L4     | Cuci Setrika Express | Rp. 10.000 |');
  writeln('--------------------------------------------------');
  writeln;
  writeln('---------------------------------------------------');
  writeln;
  write('Masukkan Kode Paket: ');
  readln(kdpaket);
  if kdpaket='L1' then begin
    nmpaket:='Cuci Lipat';
    harga:=3.000;
    end
  else if kdpaket='L2' then begin
    nmpaket:='Cuci Setrika';
    harga:=6.000;
    end
  else if kdpaket='L3' then begin
    nmpaket:='Setrika';
    harga:=4.000;
    end
  else if kdpaket='L4' then begin
    nmpaket:='Cuci Setrika Express';
    harga:=10.000;
    end
  else begin
    writeln;
    writeln('Masukkan Kode Paket Yang Telah Ditentukan');
    writeln;
    write('Membuat Transaksi Baru? ');
    readln(YN);
    if YN='Y' then
    begin
      exit;
    end
    else
    begin
      exit;
    end;
  end;
  write('Masukkan Jumlah Dalam Kilo: ');
  readln(jml);
  writeln;
  writeln('---------------------------------------------------');
  writeln;
  writeln('Output:');
  writeln;
  write('Nama Paket : ');
  writeln(nmpaket);
  write('SubTotal   : ');
  subtotal:=jml*harga;
  writeln('Rp. ',subtotal:0:3);
  write('Diskon     : ');
  if jml<20 then begin
    if jml>=10 then begin
    diskon:=harga;
    end;
    end
  else if jml<30 then begin
    if jml>=20 then begin
    diskon:=harga*2;
      end;
    end
  else if jml>=30 then begin
    diskon:=harga*3;
  end;
  writeln('Rp. ',diskon:0:3);
  write('Total Biaya: ');
  totalbiaya:=subtotal-diskon;
  writeln('Rp. ',totalbiaya:0:3);
  writeln;
  writeln('Transaksi Baru Lagi? [Y/N]');
  readln;
end.

