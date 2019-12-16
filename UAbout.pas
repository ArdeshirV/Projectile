// UAbout.pas - Demonstrate Projectile Motion Equation About Box
// https://ardeshirv.github.io/Projectile/
// Copyright© 2002-2003 ArdeshirV@protonmail.com, Licensed under GPLv3+
unit UAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    Version: TLabel;
    Comments: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    ProgramIcon: TImage;
    ProductName: TLabel;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.
 
