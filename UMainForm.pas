// UMainForm.pas - Demonstrate Projectile Motion Equation Main Form
// https://ardeshirv.github.io/Projectile/
// Copyright© 2002-2003 ArdeshirV@protonmail.com, Licensed under GPLv3+
unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, XPMan, UAbout;

type
  TfrmMainForm = class(TForm)
    lblV: TLabel;
    Timer: TTimer;
    lblVValue: TLabel;
    lblDegree: TLabel;
    VChanger: TTrackBar;
    ButtonExit: TButton;
    ButtonAbout: TButton;
    lblDegreeValue: TLabel;
    XPManifest: TXPManifest;
    DegreeChanger: TTrackBar;
    PanelOutput: TPanel;
    Image: TImage;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonAboutClick(Sender: TObject);
    procedure DegreeChangerChange(Sender: TObject);
  private
    bln: Boolean;
    intTR: Integer;
    procedure Clear;
  end;

var
  frmMainForm: TfrmMainForm;

const
  PI_DIV_180 = 0.017453292519943295769236907684886;

implementation

{$R *.dfm}

procedure TfrmMainForm.Clear;
var
  rect: TRect;
  old, brh: TBrush;
begin
  brh := TBrush.Create;
  rect.Left := 0;
  rect.Top := 0;
  rect.Right := Image.Width;
  rect.Bottom := Image.Height;
  brh.Color := RGB(255,255,255);
  old := Image.Canvas.Brush;
  Image.Canvas.Brush := brh;
  Image.Canvas.FillRect(rect);
  Image.Canvas.Brush := old;
  brh.Free;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Clear;
  intTR := 0;
  bln := false;
  DegreeChangerChange(Sender);
end;

procedure TfrmMainForm.TimerTimer(Sender: TObject);
var
  rect :TRect;
  inj :integer;
  cosinus :double;
  old, brh :TBrush;
begin
  clear;
  if bln then
  begin
    intTR := 0;
    bln := false;
  end;
  inj := intTR;
  rect.Left := intTR;
  brh := TBrush.Create;
  cosinus := Cos(PI_DIV_180 * DegreeChanger.Position);
  rect.Top := Image.Height - trunc((-9.8 * inj * inj)
    / (2 * VChanger.Position * VChanger.Position * cosinus * cosinus)
    + inj * (sin(PI_DIV_180 * DegreeChanger.Position) / cosinus)) - 10;
  rect.Right := intTR + 10;
  rect.Bottom := rect.Top + 10;
  brh.Color := RGB(0, 0, 255);
  old := Image.Canvas.Brush;
  Image.Canvas.Brush := brh;
  Image.Canvas.Ellipse(rect);
  Image.Canvas.Brush := old;
  brh.Free;
  inc(intTR, 5);
  if (intTR >= Image.Width) or (rect.Top >= Image.Height + 20) then
    intTR := 0;
end;

procedure TfrmMainForm.DegreeChangerChange(Sender: TObject);
begin
  bln := true;
  lblVValue.Caption := inttostr(VChanger.Position) + '(m/s)';
  lblDegreeValue.Caption := inttostr(DegreeChanger.Position) + ' Degree';
end;

procedure TfrmMainForm.ButtonAboutClick(Sender: TObject);
  var AboutBox: TAboutBox;
begin
  AboutBox := TAboutBox.Create(self);
  AboutBox.ShowModal;
  AboutBox.Free;
end;

procedure TfrmMainForm.ButtonExitClick(Sender: TObject);
begin
  Close;
end;

end.

