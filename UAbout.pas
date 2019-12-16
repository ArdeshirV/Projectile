// UAbout.pas - Demonstrate Projectile Motion Equation About Box
// https://ardeshirv.github.io/Projectile/
// Copyright© 2002-2003 ArdeshirV@protonmail.com, Licensed under GPLv3+
unit UAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellApi;

type
  TAboutBox = class(TForm)
    Version: TLabel;
    Comments: TLabel;
    PanelMain: TPanel;
    Copyright: TLabel;
    OKButton: TButton;
    LabelLink: TLabel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    procedure LabelLinkClick(Sender: TObject);
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.LabelLinkClick(Sender: TObject);
begin
  LabelLink.Font.Color := Graphics.clRed;
  ShellExecute(Handle, 'open', PChar(LabelLink.Caption),
    nil, nil, SW_SHOWNORMAL);
end;

end.

