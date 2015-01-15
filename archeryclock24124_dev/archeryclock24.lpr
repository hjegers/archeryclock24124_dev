program archeryclock24;

{$MODE Delphi}

uses
  Forms, Interfaces,
  Countdown in 'Countdown.pas' {Countdownform};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Countdown Archery Clock';
  Application.CreateForm(TCountdownform, Countdownform);
  Application.Run;
end.
