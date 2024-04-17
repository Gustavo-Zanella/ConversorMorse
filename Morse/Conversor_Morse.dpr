program Conversor_Morse;

uses
  Forms,
  unMorse in 'unMorse.pas' {frmMorse};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMorse, frmMorse);
  Application.Run;
end.