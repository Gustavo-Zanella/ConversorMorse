unit unMorse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmMorse = class(TForm)
    mmoEntrada: TMemo;
    mmoSaida: TMemo;
    btnConvMorse: TButton;
    btnConvHexa: TButton;
    btnLimpaEntrada: TBitBtn;
    btnLimpaSaida: TBitBtn;
    procedure btnConvMorseClick(Sender: TObject);
    procedure btnConvHexaClick(Sender: TObject);
    procedure btnLimpaEntradaClick(Sender: TObject);
    procedure btnLimpaSaidaClick(Sender: TObject);
  private
    function EncontrarMorse(letra:Char) : String;
    function DecodeMorse(sMorse:String) : String;
    function ExisteCaracterEspecial(oMemo : TMemo): Boolean;
    procedure LimpaMemo(oMemo : TMemo);
  public
    { Public declarations }
  end;

const
  aHexa: array [1..36] of Char =('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0');
  aMorse: array [1..36]of String = ('.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..','.----','..---','...--','....-','.....','-....','--...','---..','----.','-----');
  aCaracterEsp: array [0..18] of String = ('Ã', 'Á', 'Â', 'Ã', 'Ä','É', 'Ê', 'Ë','Í', 'Î', 'Ï','Ó', 'Ô', 'Õ', 'Ö','Ú', 'Û', 'Ü','Ç');
var
  frmMorse: TfrmMorse;

implementation

{$R *.dfm}

//Converte o hexadecimal para Código Morse
procedure TfrmMorse.btnConvMorseClick(Sender: TObject);
var
  i, j : Integer;
  sLinha,sMorse : string;
begin
  LimpaMemo(mmoSaida);
  if ExisteCaracterEspecial(mmoEntrada) then
  begin
    ShowMessage('Caracter Especial encontrado. Ajuste seu texto e tente novamente');
    mmoEntrada.SetFocus;
    Exit;
  end;

  for i := 0 to mmoEntrada.Lines.Count-1 do
  begin
    sLinha := mmoEntrada.Lines[i];
    for j := 1 to Length(sLinha) do
    begin
      sMorse := sMorse + EncontrarMorse(UpCase(sLinha[j])) + ' ';
    end;
    mmoSaida.Lines.Add(sMorse);
  end;
end;

//Encontra o morse referente à letra
function TfrmMorse.EncontrarMorse(letra: Char): String;
var
  i : integer;
begin
  Result := '';
  for i := Low(aHexa) to High(aHexa) do
  begin
    if letra = ' ' then
      Result:='/'
    else
    if letra = aHexa[i] then
    begin
      Result := aMorse[i];
      break;
    end
  end;
end;

//Converte morse para hexadecimal
procedure TfrmMorse.btnConvHexaClick(Sender: TObject);
var
  j, i: Integer;
  sLinha, sMorse, sJuntatexto: String;
begin
  LimpaMemo(mmoSaida);
  if ExisteCaracterEspecial(mmoEntrada) then
  begin
    ShowMessage('Caracter Especial encontrado. Ajuste seu texto e tente novamente');
    mmoEntrada.SetFocus;
    Exit;
  end;
  for i := 0 to mmoEntrada.Lines.Count - 1 do
  begin
    sLinha := mmoEntrada.Lines[i];
    for j := 1 to Length(sLinha) do
    begin
      if sLinha[j] = ' ' then
        begin
          sMorse := sMorse + DecodeMorse(sJuntatexto);
          sJuntatexto := '';
        end
      else
      if sLinha[j] = '/' then
        begin
          sMorse := sMorse+' ';
          sJuntatexto := '';
          sLinha[j]:=sLinha[j + 1];
        end
      else
          sJuntatexto := sJuntatexto + sLinha[j];
    end;
    mmoSaida.Lines.Add(sMorse);
  end;
end;

//Limpa o Memo
procedure TfrmMorse.LimpaMemo(oMemo: TMemo);
begin
  oMemo.Clear;
end;

function TfrmMorse.ExisteCaracterEspecial(oMemo: TMemo): Boolean;
var
  i : integer;
begin
  Result := False;

  for i := Low(aCaracterEsp) to High(aCaracterEsp) do
  begin
    if Pos(aCaracterEsp[i], UpperCase(oMemo.Text)) <> 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

//Decoda o morse digitados
function TfrmMorse.DecodeMorse(sMorse: String): String;
var
  i : Integer;
begin
  Result:= '';
  for i:= Low(aMorse) to High(aMorse) do
  begin
    if sMorse = aMorse[i]  then
    begin
      Result := aHexa[i];
    end
  end;
end;

//Limpar o memo Entrada
procedure TfrmMorse.btnLimpaEntradaClick(Sender: TObject);
begin
  LimpaMemo(mmoEntrada);
end;

//Limpar o memo Saida
procedure TfrmMorse.btnLimpaSaidaClick(Sender: TObject);
begin
  LimpaMemo(mmoSaida);
end;

end.