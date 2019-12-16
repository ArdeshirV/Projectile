// Projectile.dpr - Demonstrate Projectile Motion Equation Entry Point
// Github: https://github.com/ArdeshirV/Projectile
// Copyright© 2002-2003 ArdeshirV@protonmail.com, Licensed under GPLv3+
program Projectile;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {frmMainForm},
  UAbout in 'UAbout.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cinematic';
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.

