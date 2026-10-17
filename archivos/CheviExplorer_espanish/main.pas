unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls
type
  TForm1=class(TForm)
    StatusBar1: TStatusBar;
    Panel_Knopki: TPanel;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    MenuItem_Save: TMenuItem;
    MenuItem_Load: TMenuItem;
    MenuItem_Exit: TMenuItem;
    MenuItem_Service: TMenuItem;
    MenuItem_Start: TMenuItem;
    MenuItem_Stop: TMenuItem;
    List_Ident: TValueListEditor;
    List_Param: TValueListEditor;
    Button_Parameters: TButton;
    TimerTesterPresent: TTimer;
    TimerParam: TTimer;
    Button_ECUIdent: TButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    Button_DTC: TButton;
    Panel_DTC: TPanel;
    Button_Graf: TButton;
    N2: TMenuItem;
    MenuItem_Test: TMenuItem;
    MenuItem_Setting: TMenuItem;
    Image1: TImage;
    MenuItem_SaveToXLS: TMenuItem;
    N_Sirius: TMenuItem;
    N_MR140: TMenuItem;
    N_ZF: TMenuItem;
    N_Aisin: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Panel_ClearDTC: TPanel;
    Button_ClearDTC: TButton;
    Label1: TLabel;
    Label_Dvig: TLabel;
    Label_AKPP: TLabel;
    Label_ABS: TLabel;
    Label_Load: TLabel;
    Label_AIRBAG: TLabel;
    N4: TMenuItem;
    ActionList: TActionList;
    Previous_Nabor: TAction;
    Next_Nabor: TAction;
    Edit_Nabor: TAction;
    N_Airbag_SRS0: TMenuItem;
    StringGrid_DTC: TStringGrid;
    N_ABS_Bosh: TMenuItem;
    N_ABS_Teves: TMenuItem;
    PopupMenu_Dvig: TPopupMenu;
    Popup_N1416LSiriusD421: TMenuItem;
    Popup_N18LMR1401: TMenuItem;
    PopupMenu_AKPP: TPopupMenu;
    Popup_Aisin8116L1: TMenuItem;
    Popup_ZF4P1618L1: TMenuItem;
    PopupMenu_ABS: TPopupMenu;
    Bosh: TMenuItem;
    Teves: TMenuItem;
    AVEO1: TMenuItem;
    AVEO3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N_ABS_AVEO1: TMenuItem;
    N_ABS_AVEO3: TMenuItem;
    N_Airbag_SRS1: TMenuItem;
    PopupMenu_SRS: TPopupMenu;
    Popup_N_Airbag_SRS0: TMenuItem;
    Popup_N_Airbag_SRS1: TMenuItem;
    N10: TMenuItem;
    Button_Sbros: TMenuItem;
    Button_Obuchenie: TMenuItem;
    DriverIM: TMenuItem;
    N14: TMenuItem;
    PL23xx: TMenuItem;
    Test_DK: TMenuItem;
    Popup_N1SiriusD321: TMenuItem;
    N_SiriusD32: TMenuItem;
    Popup_N1Bosch79711: TMenuItem;
    N_Bosch: TMenuItem;
    procedure FormCreate(Sender : TObject);
    procedure FormClose(Sender : TObject);
    procedure PortInit(Sender : TObject);
    procedure WriteReadComm(Sender : TObject);
    procedure PreobrTipECU(Sender : TObject);
    procedure TipECU_for_button(Sender : TObject);
    procedure VichMaxNomParam(Sender : TObject);
    procedure Start(Sender : TObject);
    procedure Button_ParametersClick(Sender : TObject);
    procedure MenuItem_SettingClick(Sender : TObject);
    procedure TimerTesterPresentTimer(Sender : TObject);
    procedure Disconnect(Sender : TObject);
    procedure Button_ECUIdentClick(Sender : TObject);
    procedure MenuItem_StopClick(Sender : TObject);
    procedure Button_DTCClick(Sender : TObject);
    procedure MenuItem_SaveClick(Sender : TObject);
    procedure Button_ClearDTCClick(Sender : TObject);
    procedure Button_GrafClick(Sender : TObject);
    procedure RaschetParam(Sender : TObject);
    procedure MenuItem_LoadClick(Sender : TObject);
    procedure MenuItem_ExitClick(Sender : TObject);
    procedure MenuItem_TestClick(Sender : TObject);
    procedure MenuItem_SaveToXLSClick(Sender : TObject);
    procedure N_MR140Click(Sender : TObject);
    procedure N_SiriusClick(Sender : TObject);
    procedure N_AisinClick(Sender : TObject);
    procedure N_ZFClick(Sender : TObject);
    procedure N5Click(Sender : TObject);
    procedure TimerParamTimer(Sender : TObject);
    procedure VspomRaschetParam(Sender : TObject);
    procedure N4Click(Sender : TObject);
    procedure Previous_NaborExecute(Sender : TObject);
    procedure Next_NaborExecute(Sender : TObject);
    procedure Edit_NaborExecute(Sender : TObject);
    procedure N_Airbag_SRS0Click(Sender : TObject);
    procedure FormResize(Sender : TObject);
    procedure N_ABS_BoshClick(Sender : TObject);
    procedure N_ABS_TevesClick(Sender : TObject);
    procedure N_ABS_AVEO1Click(Sender : TObject);
    procedure N_ABS_AVEO3Click(Sender : TObject);
    procedure Label_DvigClick(Sender : TObject);
    procedure Label_AKPPClick(Sender : TObject);
    procedure Label_ABSClick(Sender : TObject);
    procedure SecurityAccess(Sender : TObject);
    procedure Button_SbrosClick(Sender : TObject);
    procedure Button_ObuchenieClick(Sender : TObject);
    procedure ZapProtokol(Sender : TObject);
    procedure PL23xxClick(Sender : TObject);
    procedure StringGrid_DTCSelectCell(Sender : TObject);
    procedure N8Click(Sender : TObject);
    procedure N_Airbag_SRS1Click(Sender : TObject);
    procedure Label_AIRBAGClick(Sender : TObject);
    procedure FormActivate(Sender : TObject);
    procedure Driver(Sender : TObject);
    procedure Test_DKClick(Sender : TObject);
    procedure DriverIMClick(Sender : TObject);
    procedure N_SiriusD32Click(Sender : TObject);
    procedure N_BoschClick(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end ;

var
  Form1: TForm1;

{This file is generated by DeDe Ver 3.50.02 Copyright (c) 1999-2002 DaFixer}

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender : TObject);
begin
(*
004E2570   55                     push    ebp
004E2571   8BEC                   mov     ebp, esp
004E2573   6A00                   push    $00
004E2575   6A00                   push    $00
004E2577   6A00                   push    $00
004E2579   53                     push    ebx
004E257A   8BD8                   mov     ebx, eax
004E257C   33C0                   xor     eax, eax
004E257E   55                     push    ebp
004E257F   6820274E00             push    $004E2720

***** TRY
|
004E2584   64FF30                 push    dword ptr fs:[eax]
004E2587   648920                 mov     fs:[eax], esp
004E258A   B205                   mov     dl, $05

* Reference to control TForm1.List_Param : TValueListEditor
|
004E258C   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E2592   E8E1D1F7FF             call    0045F778
004E2597   B205                   mov     dl, $05

* Reference to control TForm1.Panel_DTC : TPanel
|
004E2599   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E259F   E8D4D1F7FF             call    0045F778
004E25A4   B205                   mov     dl, $05

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E25A6   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E25AC   E8C7D1F7FF             call    0045F778
004E25B1   6874565400             push    $00545674
004E25B6   33C9                   xor     ecx, ecx
004E25B8   33D2                   xor     edx, edx

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E25BA   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E25C0   E8F7C0FAFF             call    0048E6BC
004E25C5   6888565400             push    $00545688
004E25CA   33C9                   xor     ecx, ecx
004E25CC   BA01000000             mov     edx, $00000001

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E25D1   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E25D7   E8E0C0FAFF             call    0048E6BC
004E25DC   689C565400             push    $0054569C
004E25E1   33C9                   xor     ecx, ecx
004E25E3   BA02000000             mov     edx, $00000002

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E25E8   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E25EE   E8C9C0FAFF             call    0048E6BC
004E25F3   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E25F5   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E25FB   E88805F9FF             call    00472B88
004E2600   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E2602   8B8328030000           mov     eax, [ebx+$0328]
004E2608   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E260A   FF5164                 call    dword ptr [ecx+$64]
004E260D   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E260F   8B8334030000           mov     eax, [ebx+$0334]
004E2615   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E2617   FF5164                 call    dword ptr [ecx+$64]
004E261A   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E261C   8B8340030000           mov     eax, [ebx+$0340]
004E2622   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E2624   FF5164                 call    dword ptr [ecx+$64]
004E2627   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E2629   8B8348030000           mov     eax, [ebx+$0348]
004E262F   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E2631   FF5164                 call    dword ptr [ecx+$64]
004E2634   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E2636   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E263C   E84705F9FF             call    00472B88
004E2641   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E2643   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E2649   E83A05F9FF             call    00472B88
004E264E   C6051D724F0000         mov     byte ptr [$004F721D], $00
004E2655   8D55F8                 lea     edx, [ebp-$08]

* Reference to TApplication instance
|
004E2658   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004E265D   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.GetExeName(TApplication):AnsiString;
|
004E265F   E83CE9F9FF             call    00480FA0
004E2664   8B45F8                 mov     eax, [ebp-$08]
004E2667   8D55FC                 lea     edx, [ebp-$04]

* Reference to: SysUtils.ExtractFilePath(AnsiString):AnsiString;
|
004E266A   E8E96FF2FF             call    00409658
004E266F   8B55FC                 mov     edx, [ebp-$04]
004E2672   B8F46D4F00             mov     eax, $004F6DF4

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E2677   E80424F2FF             call    00404A80
004E267C   8D45F4                 lea     eax, [ebp-$0C]

* Possible String Reference to: 'CE.ini'
|
004E267F   B96C274E00             mov     ecx, $004E276C
004E2684   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E268A   E8A926F2FF             call    00404D38
004E268F   8B4DF4                 mov     ecx, [ebp-$0C]
004E2692   B201                   mov     dl, $01

* Reference to class TIniFile
|
004E2694   A16C964300             mov     eax, dword ptr [$0043966C]

* Reference to: IniFiles.TCustomIniFile.Create(TCustomIniFile;boolean;AnsiString);
|
004E2699   E87E70F5FF             call    0043971C

* Reference to GlobalVar_004F7220
|
004E269E   A320724F00             mov     dword ptr [$004F7220], eax
004E26A3   B201                   mov     dl, $01
004E26A5   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26A7   E88C0B0000             call    004E3238
004E26AC   B202                   mov     dl, $02
004E26AE   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26B0   E8830B0000             call    004E3238
004E26B5   B203                   mov     dl, $03
004E26B7   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26B9   E87A0B0000             call    004E3238
004E26BE   B204                   mov     dl, $04
004E26C0   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26C2   E8710B0000             call    004E3238
004E26C7   68F85B5400             push    $00545BF8

* Reference to control TForm1.N3 : TMenuItem
|
004E26CC   8B8370030000           mov     eax, [ebx+$0370]

* Reference to: Menus.TMenuItem.GetHandle(TMenuItem):HMENU;
|
004E26D2   E819EBF8FF             call    004711F0
004E26D7   50                     push    eax
004E26D8   6810440000             push    $00004410
004E26DD   6A04                   push    $04

* Reference to control TForm1.MainMenu : TMainMenu
|
004E26DF   8B8300030000           mov     eax, [ebx+$0300]
004E26E5   8B10                   mov     edx, [eax]

* Reference to method TMainMenu.GetHandle()
|
004E26E7   FF5234                 call    dword ptr [edx+$34]
004E26EA   50                     push    eax

* Reference to: user32.ModifyMenuA()
|
004E26EB   E88051F2FF             call    00407870
004E26F0   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E26F7   C60525724F0000         mov     byte ptr [$004F7225], $00
004E26FE   C60518724F0000         mov     byte ptr [$004F7218], $00
004E2705   33C0                   xor     eax, eax
004E2707   5A                     pop     edx
004E2708   59                     pop     ecx
004E2709   59                     pop     ecx
004E270A   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E270D   6827274E00             push    $004E2727
004E2712   8D45F4                 lea     eax, [ebp-$0C]
004E2715   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E271A   E83123F2FF             call    00404A50
004E271F   C3                     ret


* Reference to: System.@HandleFinally;
|
004E2720   E9871CF2FF             jmp     004043AC
004E2725   EBEB                   jmp     004E2712

****** END
|
004E2727   5B                     pop     ebx
004E2728   8BE5                   mov     esp, ebp
004E272A   5D                     pop     ebp
004E272B   C3                     ret

*)
end;

procedure TForm1.FormClose(Sender : TObject);
begin
(*
004EC264   55                     push    ebp
004EC265   8BEC                   mov     ebp, esp
004EC267   6A00                   push    $00
004EC269   6A00                   push    $00
004EC26B   53                     push    ebx
004EC26C   8BD8                   mov     ebx, eax
004EC26E   33C0                   xor     eax, eax
004EC270   55                     push    ebp

* Possible String Reference to: 'ÈIÄÒˇÎÎ[YY]√'
|
004EC271   685EC34E00             push    $004EC35E

***** TRY
|
004EC276   64FF30                 push    dword ptr fs:[eax]
004EC279   648920                 mov     fs:[eax], esp

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EC27C   8B831C030000           mov     eax, [ebx+$031C]
004EC282   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EC284   FF5244                 call    dword ptr [edx+$44]
004EC287   A120724F00             mov     eax, dword ptr [$004F7220]

* Reference to: System.TObject.Free(TObject);
|
004EC28C   E88779F1FF             call    00403C18

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EC291   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EC297   8B8008020000           mov     eax, [eax+$0208]
004EC29D   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EC2A2   E8F138F5FF             call    0043FB98

* Reference to field TStatusPanels.UpdateCount : Integer
|
004EC2A7   8B400C                 mov     eax, [eax+$0C]
004EC2AA   50                     push    eax
004EC2AB   8D4DF8                 lea     ecx, [ebp-$08]
004EC2AE   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004EC2B4   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EC2B6   E8116DFFFF             call    004E2FCC
004EC2BB   8B4DF8                 mov     ecx, [ebp-$08]
004EC2BE   8D45FC                 lea     eax, [ebp-$04]
004EC2C1   BA94585400             mov     edx, $00545894

* Reference to: System.@LStrCat3;
|
004EC2C6   E86D8AF1FF             call    00404D38
004EC2CB   8B55FC                 mov     edx, [ebp-$04]
004EC2CE   58                     pop     eax

* Reference to: System.@LStrCmp;
|
004EC2CF   E8648BF1FF             call    00404E38
004EC2D4   744E                   jz      004EC324
004EC2D6   803D19724F0000         cmp     byte ptr [$004F7219], $00
004EC2DD   7545                   jnz     004EC324
004EC2DF   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004EC2E6   7E3C                   jle     004EC324

* Reference to TOptionsForm instance
|
004EC2E8   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004EC2ED   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.AutoSave : TCheckBox
|
004EC2EF   8B8024030000           mov     eax, [eax+$0324]
004EC2F5   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004EC2F7   FF92C8000000           call    dword ptr [edx+$00C8]
004EC2FD   84C0                   test    al, al
004EC2FF   7523                   jnz     004EC324
004EC301   6A34                   push    $34
004EC303   68185C5400             push    $00545C18
004EC308   68945C5400             push    $00545C94
004EC30D   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EC30F   E854B5F1FF             call    00407868
004EC314   83F806                 cmp     eax, +$06
004EC317   750B                   jnz     004EC324

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EC319   8B8308030000           mov     eax, [ebx+$0308]
004EC31F   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EC321   FF5244                 call    dword ptr [edx+$44]
004EC324   803D1C724F0001         cmp     byte ptr [$004F721C], $01
004EC32B   7516                   jnz     004EC343
004EC32D   C6051C724F0000         mov     byte ptr [$004F721C], $00
004EC334   B84C704F00             mov     eax, $004F704C

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EC339   E8326DF1FF             call    00403070

|
004EC33E   E87165F1FF             call    004028B4
004EC343   33C0                   xor     eax, eax
004EC345   5A                     pop     edx
004EC346   59                     pop     ecx
004EC347   59                     pop     ecx
004EC348   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[YY]√'
|
004EC34B   6865C34E00             push    $004EC365
004EC350   8D45F8                 lea     eax, [ebp-$08]
004EC353   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC358   E8F386F1FF             call    00404A50
004EC35D   C3                     ret


* Reference to: System.@HandleFinally;
|
004EC35E   E94980F1FF             jmp     004043AC
004EC363   EBEB                   jmp     004EC350

****** END
|
004EC365   5B                     pop     ebx
004EC366   59                     pop     ecx
004EC367   59                     pop     ecx
004EC368   5D                     pop     ebp
004EC369   C3                     ret

*)
end;

procedure TForm1.PortInit(Sender : TObject);
begin
(*
004E27F0   55                     push    ebp
004E27F1   8BEC                   mov     ebp, esp
004E27F3   6A00                   push    $00
004E27F5   6A00                   push    $00
004E27F7   6A00                   push    $00
004E27F9   53                     push    ebx
004E27FA   56                     push    esi
004E27FB   57                     push    edi
004E27FC   8BF0                   mov     esi, eax
004E27FE   BF7C6D4F00             mov     edi, $004F6D7C
004E2803   33C0                   xor     eax, eax
004E2805   55                     push    ebp
004E2806   68FE294E00             push    $004E29FE

***** TRY
|
004E280B   64FF30                 push    dword ptr fs:[eax]
004E280E   648920                 mov     fs:[eax], esp
004E2811   33DB                   xor     ebx, ebx
004E2813   6A00                   push    $00
004E2815   6A00                   push    $00
004E2817   6A03                   push    $03
004E2819   6A00                   push    $00
004E281B   6A00                   push    $00
004E281D   68000000C0             push    $C0000000
004E2822   8D55F8                 lea     edx, [ebp-$08]

* Reference to TOptionsForm instance
|
004E2825   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E282A   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.ComboBox_PortName : TComboBox
|
004E282C   8B8004030000           mov     eax, [eax+$0304]

* Reference to: Controls.TControl.GetText(TControl):TCaption;
|
004E2832   E82DDAF7FF             call    00460264
004E2837   8B4DF8                 mov     ecx, [ebp-$08]
004E283A   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: '\\.\'
|
004E283D   BA182A4E00             mov     edx, $004E2A18

* Reference to: System.@LStrCat3;
|
004E2842   E8F124F2FF             call    00404D38
004E2847   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004E284A   E89D26F2FF             call    00404EEC
004E284F   50                     push    eax

* Reference to: kernel32.CreateFileA()
|
004E2850   E89346F2FF             call    00406EE8

* Reference to GlobalVar_004F6DC4
|
004E2855   A3C46D4F00             mov     dword ptr [$004F6DC4], eax
004E285A   833DC46D4F0000         cmp     dword ptr [$004F6DC4], +$00
004E2861   7D38                   jnl     004E289B

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E2863   8B86F8020000           mov     eax, [esi+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E2869   8B8008020000           mov     eax, [eax+$0208]
004E286F   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E2874   E81FD3F5FF             call    0043FB98
004E2879   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E287B   E874D2F5FF             call    0043FAF4
004E2880   6810000400             push    $00040010
004E2885   68785B5400             push    $00545B78
004E288A   68005C5400             push    $00545C00
004E288F   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E2891   E8D24FF2FF             call    00407868
004E2896   E93D010000             jmp     004E29D8
004E289B   6800020000             push    $00000200
004E28A0   6800020000             push    $00000200
004E28A5   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28AA   50                     push    eax

* Reference to: kernel32.SetupComm()
|
004E28AB   E8A848F2FF             call    00407158
004E28B0   6A0F                   push    $0F
004E28B2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28B7   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004E28B8   E82B48F2FF             call    004070E8
004E28BD   57                     push    edi
004E28BE   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28C3   50                     push    eax

* Reference to: kernel32.GetCommState()
|
004E28C4   E8EF46F2FF             call    00406FB8
004E28C9   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E28D0   7509                   jnz     004E28DB
004E28D2   C7470480250000         mov     dword ptr [edi+$04], $00002580
004E28D9   EB07                   jmp     004E28E2
004E28DB   C74704A0280000         mov     dword ptr [edi+$04], $000028A0
004E28E2   C6471300               mov     byte ptr [edi+$13], $00
004E28E6   C6471208               mov     byte ptr [edi+$12], $08
004E28EA   C6471400               mov     byte ptr [edi+$14], $00
004E28EE   33C0                   xor     eax, eax
004E28F0   894708                 mov     [edi+$08], eax
004E28F3   57                     push    edi
004E28F4   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28F9   50                     push    eax

* Reference to: kernel32.SetCommState()
|
004E28FA   E81948F2FF             call    00407118
004E28FF   C705686D4F00DC050000   mov     dword ptr [$004F6D68], $000005DC
004E2909   C7056C6D4F000F000000   mov     dword ptr [$004F6D6C], $0000000F
004E2913   C705706D4F000F000000   mov     dword ptr [$004F6D70], $0000000F
004E291D   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6D74
|
004E291F   A3746D4F00             mov     dword ptr [$004F6D74], eax
004E2924   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6D78
|
004E2926   A3786D4F00             mov     dword ptr [$004F6D78], eax
004E292B   68686D4F00             push    $004F6D68
004E2930   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2935   50                     push    eax

* Reference to: kernel32.SetCommTimeouts()
|
004E2936   E8E547F2FF             call    00407120
004E293B   803D26724F0001         cmp     byte ptr [$004F7226], $01
004E2942   0F858E000000           jnz     004E29D6
004E2948   803D1C724F0000         cmp     byte ptr [$004F721C], $00
004E294F   0F8581000000           jnz     004E29D6
004E2955   8D45F4                 lea     eax, [ebp-$0C]

* Possible String Reference to: 'protokol.htm'
|
004E2958   B9402A4E00             mov     ecx, $004E2A40
004E295D   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E2963   E8D023F2FF             call    00404D38
004E2968   8B55F4                 mov     edx, [ebp-$0C]
004E296B   B84C704F00             mov     eax, $004F704C

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E2970   E85705F2FF             call    00402ECC
004E2975   B84C704F00             mov     eax, $004F704C

* Reference to: System.@RewritText(TTextRec;TTextRec):Integer;
|
004E297A   E8E902F2FF             call    00402C68

|
004E297F   E830FFF1FF             call    004028B4
004E2984   C6051C724F0001         mov     byte ptr [$004F721C], $01

* Possible String Reference to: '<html><head>'
|
004E298B   BA582A4E00             mov     edx, $004E2A58
004E2990   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2995   E86E27F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E299A   E8E10CF2FF             call    00403680

|
004E299F   E810FFF1FF             call    004028B4

* Possible String Reference to: '<meta HTTP-EQUIV="Content-Type" CON
|                                TENT="text/html; CHARSET=windows-12
|                                52"></head>'
|
004E29A4   BA702A4E00             mov     edx, $004E2A70
004E29A9   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E29AE   E85527F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E29B3   E8C80CF2FF             call    00403680

|
004E29B8   E8F7FEF1FF             call    004028B4

* Possible String Reference to: '<PRE><CODE>'
|
004E29BD   BACC2A4E00             mov     edx, $004E2ACC
004E29C2   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E29C7   E83C27F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E29CC   E8AF0CF2FF             call    00403680

|
004E29D1   E8DEFEF1FF             call    004028B4
004E29D6   B301                   mov     bl, $01
004E29D8   33C0                   xor     eax, eax
004E29DA   5A                     pop     edx
004E29DB   59                     pop     ecx
004E29DC   59                     pop     ecx
004E29DD   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: 'ã√_^[ãÂ]√'
|
004E29E0   68052A4E00             push    $004E2A05
004E29E5   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004E29E8   E83F20F2FF             call    00404A2C
004E29ED   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E29F0   E83720F2FF             call    00404A2C
004E29F5   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E29F8   E82F20F2FF             call    00404A2C
004E29FD   C3                     ret


* Reference to: System.@HandleFinally;
|
004E29FE   E9A919F2FF             jmp     004043AC
004E2A03   EBE0                   jmp     004E29E5

****** END
|
004E2A05   8BC3                   mov     eax, ebx
004E2A07   5F                     pop     edi
004E2A08   5E                     pop     esi
004E2A09   5B                     pop     ebx
004E2A0A   8BE5                   mov     esp, ebp
004E2A0C   5D                     pop     ebp
004E2A0D   C3                     ret

*)
end;

procedure TForm1.WriteReadComm(Sender : TObject);
begin
(*
004E2E40   55                     push    ebp
004E2E41   8BEC                   mov     ebp, esp
004E2E43   51                     push    ecx
004E2E44   53                     push    ebx
004E2E45   56                     push    esi
004E2E46   57                     push    edi
004E2E47   8BD9                   mov     ebx, ecx
004E2E49   85DB                   test    ebx, ebx
004E2E4B   780A                   js      004E2E57
004E2E4D   C1EB02                 shr     ebx, $02
004E2E50   8B349A                 mov     esi, [edx+ebx*4]
004E2E53   4B                     dec     ebx
004E2E54   56                     push    esi
004E2E55   79F9                   jns     004E2E50
004E2E57   8BD4                   mov     edx, esp
004E2E59   8BF1                   mov     esi, ecx
004E2E5B   8BFA                   mov     edi, edx
004E2E5D   8945FC                 mov     [ebp-$04], eax
004E2E60   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E2E67   742D                   jz      004E2E96
004E2E69   C605A66D4F0000         mov     byte ptr [$004F6DA6], $00
004E2E70   8D5E01                 lea     ebx, [esi+$01]
004E2E73   83EB02                 sub     ebx, +$02
004E2E76   85DB                   test    ebx, ebx
004E2E78   7C0F                   jl      004E2E89
004E2E7A   43                     inc     ebx
004E2E7B   8BC7                   mov     eax, edi
004E2E7D   8A10                   mov     dl, byte ptr [eax]
004E2E7F   0015A66D4F00           add     [$004F6DA6], dl
004E2E85   40                     inc     eax
004E2E86   4B                     dec     ebx
004E2E87   75F4                   jnz     004E2E7D
004E2E89   8D4601                 lea     eax, [esi+$01]
004E2E8C   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E2E92   885407FF               mov     [edi+eax-$01], dl
004E2E96   6A0F                   push    $0F
004E2E98   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2E9D   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004E2E9E   E84542F2FF             call    004070E8
004E2EA3   8D5E01                 lea     ebx, [esi+$01]
004E2EA6   53                     push    ebx
004E2EA7   68CC565400             push    $005456CC

* Possible String Reference to: 'FF0000'
|
004E2EAC   68A42F4E00             push    $004E2FA4
004E2EB1   8BD7                   mov     edx, edi
004E2EB3   8BCE                   mov     ecx, esi

* Reference to Form1
|
004E2EB5   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.ZapProtokol()
|
004E2EB8   E81BFCFFFF             call    004E2AD8
004E2EBD   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E2EC4   752A                   jnz     004E2EF0
004E2EC6   4B                     dec     ebx
004E2EC7   85DB                   test    ebx, ebx
004E2EC9   7C39                   jl      004E2F04
004E2ECB   43                     inc     ebx
004E2ECC   8BF7                   mov     esi, edi
004E2ECE   6A00                   push    $00
004E2ED0   689C6D4F00             push    $004F6D9C
004E2ED5   6A01                   push    $01
004E2ED7   56                     push    esi
004E2ED8   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2EDD   50                     push    eax

* Reference to: kernel32.WriteFile()
|
004E2EDE   E8AD42F2FF             call    00407190
004E2EE3   6A05                   push    $05

* Reference to: kernel32.Sleep()
|
004E2EE5   E892B4F2FF             call    0040E37C
004E2EEA   46                     inc     esi
004E2EEB   4B                     dec     ebx
004E2EEC   75E0                   jnz     004E2ECE
004E2EEE   EB14                   jmp     004E2F04
004E2EF0   6A00                   push    $00
004E2EF2   689C6D4F00             push    $004F6D9C
004E2EF7   53                     push    ebx
004E2EF8   57                     push    edi
004E2EF9   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2EFE   50                     push    eax

* Reference to: kernel32.WriteFile()
|
004E2EFF   E88C42F2FF             call    00407190
004E2F04   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E2F0B   7420                   jz      004E2F2D

* Reference to Form1
|
004E2F0D   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E2F10   8B802C030000           mov     eax, [eax+$032C]
004E2F16   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E2F18   E88724F5FF             call    004353A4

* Reference to Form1
|
004E2F1D   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E2F20   8B802C030000           mov     eax, [eax+$032C]
004E2F26   B201                   mov     dl, $01

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E2F28   E87724F5FF             call    004353A4
004E2F2D   BA00010000             mov     edx, $00000100
004E2F32   B8F86D4F00             mov     eax, $004F6DF8
004E2F37   C60000                 mov     byte ptr [eax], $00
004E2F3A   40                     inc     eax
004E2F3B   4A                     dec     edx
004E2F3C   75F9                   jnz     004E2F37
004E2F3E   6A00                   push    $00
004E2F40   68A06D4F00             push    $004F6DA0
004E2F45   8B4508                 mov     eax, [ebp+$08]
004E2F48   50                     push    eax
004E2F49   68F86D4F00             push    $004F6DF8
004E2F4E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2F53   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004E2F54   E89741F2FF             call    004070F0
004E2F59   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004E2F5E   50                     push    eax
004E2F5F   68E0565400             push    $005456E0

* Possible String Reference to: '0000FF'
|
004E2F64   68C42F4E00             push    $004E2FC4
004E2F69   BAF86D4F00             mov     edx, $004F6DF8
004E2F6E   B9FF000000             mov     ecx, $000000FF

* Reference to Form1
|
004E2F73   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.ZapProtokol()
|
004E2F76   E85DFBFFFF             call    004E2AD8
004E2F7B   8B7DF0                 mov     edi, [ebp-$10]
004E2F7E   8B75F4                 mov     esi, [ebp-$0C]
004E2F81   8B5DF8                 mov     ebx, [ebp-$08]
004E2F84   8BE5                   mov     esp, ebp
004E2F86   5D                     pop     ebp
004E2F87   C20400                 ret     $0004

*)
end;

procedure TForm1.PreobrTipECU(Sender : TObject);
begin
(*
004E2FCC   53                     push    ebx
004E2FCD   8BD9                   mov     ebx, ecx
004E2FCF   C6051B724F0000         mov     byte ptr [$004F721B], $00
004E2FD6   33C0                   xor     eax, eax
004E2FD8   8AC2                   mov     al, dl
004E2FDA   83C0EF                 add     eax, -$11
004E2FDD   83F833                 cmp     eax, +$33
004E2FE0   0F871D010000           jnbe    004E3103
004E2FE6   8A80F32F4E00           mov     al, byte ptr [eax+$4E2FF3]
004E2FEC   FF248527304E00         jmp     dword ptr [$4E3027+eax*4]
004E2FF3   0102                   add     [edx], eax
004E2FF5   030400                 add     eax, [eax+eax]
004E2FF8   0000                   add     [eax], al

*)
end;

procedure TForm1.TipECU_for_button(Sender : TObject);
begin
(*
004E3238   53                     push    ebx
004E3239   56                     push    esi
004E323A   8BD8                   mov     ebx, eax
004E323C   FECA                   dec     dl
004E323E   741D                   jz      004E325D
004E3240   FECA                   dec     dl
004E3242   0F848E000000           jz      004E32D6
004E3248   FECA                   dec     dl
004E324A   0F84CF000000           jz      004E331F
004E3250   FECA                   dec     dl
004E3252   0F8437010000           jz      004E338F
004E3258   E972010000             jmp     004E33CF
004E325D   6A00                   push    $00

* Possible String Reference to: 'Dvig'
|
004E325F   B9DC334E00             mov     ecx, $004E33DC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3264   BAEC334E00             mov     edx, $004E33EC
004E3269   A120724F00             mov     eax, dword ptr [$004F7220]
004E326E   8B30                   mov     esi, [eax]
004E3270   FF5608                 call    dword ptr [esi+$08]
004E3273   48                     dec     eax
004E3274   740E                   jz      004E3284
004E3276   48                     dec     eax
004E3277   7420                   jz      004E3299
004E3279   48                     dec     eax
004E327A   7432                   jz      004E32AE
004E327C   48                     dec     eax
004E327D   7444                   jz      004E32C3
004E327F   E94B010000             jmp     004E33CF
004E3284   BA14575400             mov     edx, $00545714

* Reference to control TForm1.Label_Dvig : TLabel
|
004E3289   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E328F   E800D0F7FF             call    00460294
004E3294   E936010000             jmp     004E33CF
004E3299   BA30575400             mov     edx, $00545730

* Reference to control TForm1.Label_Dvig : TLabel
|
004E329E   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E32A4   E8EBCFF7FF             call    00460294
004E32A9   E921010000             jmp     004E33CF
004E32AE   BA48575400             mov     edx, $00545748

* Reference to control TForm1.Label_Dvig : TLabel
|
004E32B3   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E32B9   E8D6CFF7FF             call    00460294
004E32BE   E90C010000             jmp     004E33CF
004E32C3   BA64575400             mov     edx, $00545764

* Reference to control TForm1.Label_Dvig : TLabel
|
004E32C8   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E32CE   E8C1CFF7FF             call    00460294
004E32D3   5E                     pop     esi
004E32D4   5B                     pop     ebx
004E32D5   C3                     ret

*)
end;

procedure TForm1.VichMaxNomParam(Sender : TObject);
begin
(*
004E3560   53                     push    ebx
004E3561   56                     push    esi
004E3562   57                     push    edi
004E3563   B9A76D4F00             mov     ecx, $004F6DA7
004E3568   BED06D4F00             mov     esi, $004F6DD0
004E356D   BFD46D4F00             mov     edi, $004F6DD4
004E3572   33C0                   xor     eax, eax
004E3574   8906                   mov     [esi], eax
004E3576   33C0                   xor     eax, eax
004E3578   8907                   mov     [edi], eax
004E357A   BA75010000             mov     edx, $00000175
004E357F   B894224F00             mov     eax, $004F2294
004E3584   8A18                   mov     bl, byte ptr [eax]
004E3586   3A19                   cmp     bl, byte ptr [ecx]
004E3588   7512                   jnz     004E359C
004E358A   83781001               cmp     dword ptr [eax+$10], +$01
004E358E   750C                   jnz     004E359C
004E3590   8B5804                 mov     ebx, [eax+$04]
004E3593   3B1E                   cmp     ebx, [esi]
004E3595   7E05                   jle     004E359C
004E3597   8B5804                 mov     ebx, [eax+$04]
004E359A   891E                   mov     [esi], ebx
004E359C   8A18                   mov     bl, byte ptr [eax]
004E359E   3A19                   cmp     bl, byte ptr [ecx]
004E35A0   7512                   jnz     004E35B4
004E35A2   83781002               cmp     dword ptr [eax+$10], +$02
004E35A6   750C                   jnz     004E35B4
004E35A8   8B5804                 mov     ebx, [eax+$04]
004E35AB   3B1F                   cmp     ebx, [edi]
004E35AD   7E05                   jle     004E35B4
004E35AF   8B5804                 mov     ebx, [eax+$04]
004E35B2   891F                   mov     [edi], ebx
004E35B4   83C024                 add     eax, +$24
004E35B7   4A                     dec     edx
004E35B8   75CA                   jnz     004E3584
004E35BA   5F                     pop     edi
004E35BB   5E                     pop     esi
004E35BC   5B                     pop     ebx
004E35BD   C3                     ret

*)
end;

procedure TForm1.Start(Sender : TObject);
begin
(*
004E3F98   55                     push    ebp
004E3F99   8BEC                   mov     ebp, esp
004E3F9B   81C408FDFFFF           add     esp, $FFFFFD08
004E3FA1   53                     push    ebx
004E3FA2   56                     push    esi
004E3FA3   33D2                   xor     edx, edx
004E3FA5   8955E8                 mov     [ebp-$18], edx
004E3FA8   8955F0                 mov     [ebp-$10], edx
004E3FAB   8955EC                 mov     [ebp-$14], edx
004E3FAE   8BD8                   mov     ebx, eax
004E3FB0   33C0                   xor     eax, eax
004E3FB2   55                     push    ebp

* Possible String Reference to: 'È¿ÂÒˇÎÎ^[ãÂ]√¬ÌËÏ‡ÌËÂ, ÓÚ˜ÂÚ ÌÂ ÒÓı
|                                ‡ÌˇÎÒˇ!'
|
004E3FB3   68E75D4E00             push    $004E5DE7

***** TRY
|
004E3FB8   64FF30                 push    dword ptr fs:[eax]
004E3FBB   648920                 mov     fs:[eax], esp
004E3FBE   833DC86D4F0001         cmp     dword ptr [$004F6DC8], +$01
004E3FC5   7D0A                   jnl     004E3FD1
004E3FC7   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DA5
|
004E3FCC   A2A56D4F00             mov     byte ptr [$004F6DA5], al
004E3FD1   A0A56D4F00             mov     al, byte ptr [$004F6DA5]
004E3FD6   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004E3FDC   743F                   jz      004E401D
004E3FDE   803D19724F0000         cmp     byte ptr [$004F7219], $00
004E3FE5   7536                   jnz     004E401D
004E3FE7   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E3FEE   7E2D                   jle     004E401D
004E3FF0   6834000400             push    $00040034
004E3FF5   68185C5400             push    $00545C18
004E3FFA   683C5C5400             push    $00545C3C
004E3FFF   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4001   E86238F2FF             call    00407868
004E4006   83F806                 cmp     eax, +$06
004E4009   750B                   jnz     004E4016

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E400B   8B8308030000           mov     eax, [ebx+$0308]
004E4011   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E4013   FF5244                 call    dword ptr [edx+$44]
004E4016   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E401D   A0A56D4F00             mov     al, byte ptr [$004F6DA5]
004E4022   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004E4028   7541                   jnz     004E406B
004E402A   803D19724F0000         cmp     byte ptr [$004F7219], $00
004E4031   7538                   jnz     004E406B
004E4033   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E403A   7E2F                   jle     004E406B
004E403C   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E4043   7526                   jnz     004E406B
004E4045   6834000400             push    $00040034
004E404A   68185C5400             push    $00545C18
004E404F   68945C5400             push    $00545C94
004E4054   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4056   E80D38F2FF             call    00407868
004E405B   83F806                 cmp     eax, +$06
004E405E   750B                   jnz     004E406B

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E4060   8B8308030000           mov     eax, [ebx+$0308]
004E4066   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E4068   FF5244                 call    dword ptr [edx+$44]
004E406B   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E4072   7537                   jnz     004E40AB
004E4074   33C0                   xor     eax, eax
004E4076   8905E46D4F00           mov     [$004F6DE4], eax
004E407C   8905E86D4F00           mov     [$004F6DE8], eax
004E4082   33C0                   xor     eax, eax
004E4084   8905DC6D4F00           mov     [$004F6DDC], eax
004E408A   8905E06D4F00           mov     [$004F6DE0], eax
004E4090   8BC3                   mov     eax, ebx

* Reference to : TForm1.VichMaxNomParam()
|
004E4092   E8C9F4FFFF             call    004E3560
004E4097   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DC8
|
004E4099   A3C86D4F00             mov     dword ptr [$004F6DC8], eax
004E409E   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E40A0   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E40A6   E8DDEAF8FF             call    00472B88
004E40AB   C6051F724F0000         mov     byte ptr [$004F721F], $00
004E40B2   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DB0
|
004E40B4   A3B06D4F00             mov     dword ptr [$004F6DB0], eax
004E40B9   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E40BB   8B8334030000           mov     eax, [ebx+$0334]
004E40C1   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E40C3   FF5164                 call    dword ptr [ecx+$64]
004E40C6   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E40C8   8B8328030000           mov     eax, [ebx+$0328]
004E40CE   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E40D0   FF5164                 call    dword ptr [ecx+$64]
004E40D3   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E40D5   8B8340030000           mov     eax, [ebx+$0340]
004E40DB   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E40DD   FF5164                 call    dword ptr [ecx+$64]
004E40E0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E40E2   8B8348030000           mov     eax, [ebx+$0348]
004E40E8   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E40EA   FF5164                 call    dword ptr [ecx+$64]
004E40ED   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E40EF   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E40F5   E88EEAF8FF             call    00472B88
004E40FA   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E40FC   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4102   E881EAF8FF             call    00472B88
004E4107   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E4109   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E410F   E874EAF8FF             call    00472B88
004E4114   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E4116   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E411C   E867EAF8FF             call    00472B88
004E4121   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E4123   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4129   E85AEAF8FF             call    00472B88

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E412E   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E4134   8B8008020000           mov     eax, [eax+$0208]
004E413A   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E413F   E854BAF5FF             call    0043FB98
004E4144   BA20585400             mov     edx, $00545820

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E4149   E8A6B9F5FF             call    0043FAF4
004E414E   8BC3                   mov     eax, ebx

* Reference to : TForm1.PortInit()
|
004E4150   E89BE6FFFF             call    004E27F0
004E4155   84C0                   test    al, al
004E4157   0F846F1C0000           jz      004E5DCC

* Reference to TOptionsForm instance
|
004E415D   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E4162   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.Altinit : TCheckBox
|
004E4164   8B8020030000           mov     eax, [eax+$0320]
004E416A   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004E416C   FF92C8000000           call    dword ptr [edx+$00C8]
004E4172   3C01                   cmp     al, $01
004E4174   750C                   jnz     004E4182
004E4176   C705C06D4F0014000000   mov     dword ptr [$004F6DC0], $00000014
004E4180   EB0A                   jmp     004E418C
004E4182   C705C06D4F0017000000   mov     dword ptr [$004F6DC0], $00000017
004E418C   FF05C06D4F00           inc     dword ptr [$004F6DC0]
004E4192   33F6                   xor     esi, esi
004E4194   46                     inc     esi
004E4195   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004E4197   E8B8EAFAFF             call    00492C54
004E419C   682C010000             push    $0000012C

* Reference to: kernel32.Sleep()
|
004E41A1   E8D6A1F2FF             call    0040E37C

* Reference to: SysUtils.Time:TDateTime;
|
004E41A6   E8796DF2FF             call    0040AF24
004E41AB   DD1D28724F00           fstp    qword ptr [$004F7228]
004E41B1   9B                     wait
004E41B2   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E41B9   0F858F000000           jnz     004E424E

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E41BF   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to: Controls.TControl.Refresh(TControl);
|
004E41C5   E8D6C5F7FF             call    004607A0
004E41CA   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E41CF   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E41D0   E83B2FF2FF             call    00407110
004E41D5   6820030000             push    $00000320

* Reference to: kernel32.Sleep()
|
004E41DA   E89DA1F2FF             call    0040E37C
004E41DF   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E41E4   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E41E5   E8D62CF2FF             call    00406EC0
004E41EA   68C8000000             push    $000000C8

* Reference to: kernel32.Sleep()
|
004E41EF   E888A1F2FF             call    0040E37C
004E41F4   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E41F9   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E41FA   E8112FF2FF             call    00407110
004E41FF   6890010000             push    $00000190

* Reference to: kernel32.Sleep()
|
004E4204   E873A1F2FF             call    0040E37C
004E4209   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E420E   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E420F   E8AC2CF2FF             call    00406EC0
004E4214   68C8000000             push    $000000C8

* Reference to: kernel32.Sleep()
|
004E4219   E85EA1F2FF             call    0040E37C
004E421E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4223   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E4224   E8972CF2FF             call    00406EC0
004E4229   6820030000             push    $00000320

* Reference to: kernel32.Sleep()
|
004E422E   E849A1F2FF             call    0040E37C
004E4233   6A00                   push    $00
004E4235   68A06D4F00             push    $004F6DA0
004E423A   6A05                   push    $05
004E423C   68F86D4F00             push    $004F6DF8
004E4241   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4246   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004E4247   E8A42EF2FF             call    004070F0
004E424C   EB7E                   jmp     004E42CC

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E424E   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to: Controls.TControl.Refresh(TControl);
|
004E4254   E847C5F7FF             call    004607A0
004E4259   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E425E   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E425F   E85C2CF2FF             call    00406EC0
004E4264   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E4269   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E426A   E80DA1F2FF             call    0040E37C
004E426F   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4274   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E4275   E8962EF2FF             call    00407110
004E427A   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E427F   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E4280   E8F7A0F2FF             call    0040E37C
004E4285   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E428A   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E428B   E8302CF2FF             call    00406EC0
004E4290   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E4295   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E4296   E8E1A0F2FF             call    0040E37C
004E429B   6A0C                   push    $0C
004E429D   C645F881               mov     byte ptr [ebp-$08], $81
004E42A1   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E42A6   8845F9                 mov     [ebp-$07], al
004E42A9   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E42AE   8845FA                 mov     [ebp-$06], al
004E42B1   C645FB81               mov     byte ptr [ebp-$05], $81
004E42B5   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E42BA   8845FC                 mov     [ebp-$04], al
004E42BD   8D55F8                 lea     edx, [ebp-$08]
004E42C0   B904000000             mov     ecx, $00000004
004E42C5   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E42C7   E874EBFFFF             call    004E2E40
004E42CC   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E42D3   7460                   jz      004E4335
004E42D5   A0FA6D4F00             mov     al, byte ptr [$004F6DFA]
004E42DA   3A05A96D4F00           cmp     al, byte ptr [$004F6DA9]
004E42E0   7453                   jz      004E4335

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E42E2   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E42E8   8B8008020000           mov     eax, [eax+$0208]
004E42EE   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E42F3   E8A0B8F5FF             call    0043FB98
004E42F8   BA38585400             mov     edx, $00545838

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E42FD   E8F2B7F5FF             call    0043FAF4
004E4302   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4307   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E4308   E8BB2BF2FF             call    00406EC8
004E430D   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E430F   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E4315   E88A10F5FF             call    004353A4
004E431A   6810000400             push    $00040010
004E431F   68785B5400             push    $00545B78
004E4324   68B45C5400             push    $00545CB4
004E4329   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E432B   E83835F2FF             call    00407868
004E4330   E9971A0000             jmp     004E5DCC
004E4335   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E433C   0F8488000000           jz      004E43CA
004E4342   A0FF6D4F00             mov     al, byte ptr [$004F6DFF]
004E4347   3A05A86D4F00           cmp     al, byte ptr [$004F6DA8]
004E434D   7512                   jnz     004E4361
004E434F   803D006E4F00C1         cmp     byte ptr [$004F6E00], $C1
004E4356   7472                   jz      004E43CA
004E4358   803D016E4F00C1         cmp     byte ptr [$004F6E01], $C1
004E435F   7469                   jz      004E43CA
004E4361   83FE03                 cmp     esi, +$03
004E4364   0F8C2AFEFFFF           jl      004E4194
004E436A   833DC06D4F001A         cmp     dword ptr [$004F6DC0], +$1A
004E4371   0F8C15FEFFFF           jl      004E418C

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E4377   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E437D   8B8008020000           mov     eax, [eax+$0208]
004E4383   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E4388   E80BB8F5FF             call    0043FB98
004E438D   BA58585400             mov     edx, $00545858

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E4392   E85DB7F5FF             call    0043FAF4
004E4397   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E439C   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E439D   E8262BF2FF             call    00406EC8
004E43A2   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E43A4   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E43AA   E8F50FF5FF             call    004353A4
004E43AF   6810000400             push    $00040010
004E43B4   68785B5400             push    $00545B78
004E43B9   68F85C5400             push    $00545CF8
004E43BE   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E43C0   E8A334F2FF             call    00407868
004E43C5   E9021A0000             jmp     004E5DCC
004E43CA   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E43D1   7577                   jnz     004E444A
004E43D3   6A11                   push    $11
004E43D5   C645F47F               mov     byte ptr [ebp-$0C], $7F
004E43D9   8D55F4                 lea     edx, [ebp-$0C]
004E43DC   33C9                   xor     ecx, ecx
004E43DE   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E43E0   E85BEAFFFF             call    004E2E40
004E43E5   803DF86D4F007F         cmp     byte ptr [$004F6DF8], $7F
004E43EC   0F85F0FEFFFF           jnz     004E42E2
004E43F2   803DF96D4F000E         cmp     byte ptr [$004F6DF9], $0E
004E43F9   7509                   jnz     004E4404
004E43FB   803DFA6D4F00A0         cmp     byte ptr [$004F6DFA], $A0
004E4402   7446                   jz      004E444A

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E4404   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E440A   8B8008020000           mov     eax, [eax+$0208]
004E4410   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E4415   E87EB7F5FF             call    0043FB98
004E441A   BA58585400             mov     edx, $00545858

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E441F   E8D0B6F5FF             call    0043FAF4
004E4424   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4429   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E442A   E8992AF2FF             call    00406EC8
004E442F   6810000400             push    $00040010
004E4434   68785B5400             push    $00545B78
004E4439   68905D5400             push    $00545D90
004E443E   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4440   E82334F2FF             call    00407868
004E4445   E982190000             jmp     004E5DCC
004E444A   8D4DEC                 lea     ecx, [ebp-$14]
004E444D   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004E4453   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004E4455   E872EBFFFF             call    004E2FCC
004E445A   8B4DEC                 mov     ecx, [ebp-$14]
004E445D   8D45F0                 lea     eax, [ebp-$10]
004E4460   BA78585400             mov     edx, $00545878

* Reference to: System.@LStrCat3;
|
004E4465   E8CE08F2FF             call    00404D38
004E446A   8B45F0                 mov     eax, [ebp-$10]
004E446D   50                     push    eax

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E446E   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E4474   8B8008020000           mov     eax, [eax+$0208]
004E447A   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E447F   E814B7F5FF             call    0043FB98
004E4484   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E4485   E86AB6F5FF             call    0043FAF4
004E448A   C6051F724F0001         mov     byte ptr [$004F721F], $01
004E4491   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E4498   753B                   jnz     004E44D5
004E449A   8D45E8                 lea     eax, [ebp-$18]

* Possible String Reference to: 'temp.tmp'
|
004E449D   B914604E00             mov     ecx, $004E6014
004E44A2   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E44A8   E88B08F2FF             call    00404D38
004E44AD   8B55E8                 mov     edx, [ebp-$18]
004E44B0   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E44B5   E812EAF1FF             call    00402ECC
004E44BA   BA01000000             mov     edx, $00000001
004E44BF   B8006F4F00             mov     eax, $004F6F00

* Reference to: CommCtrl.TreeView_GetChild(HWND;HTREEITEM):HTREEITEM;
|
004E44C4   E863EFF1FF             call    0040342C

|
004E44C9   E8E6E3F1FF             call    004028B4
004E44CE   C6051D724F0001         mov     byte ptr [$004F721D], $01
004E44D5   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E44D7   8B8334030000           mov     eax, [ebx+$0334]
004E44DD   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E44DF   FF5164                 call    dword ptr [ecx+$64]
004E44E2   B201                   mov     dl, $01

* Reference to control TForm1.Button_Parameters : TButton
|
004E44E4   8B8328030000           mov     eax, [ebx+$0328]
004E44EA   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E44EC   FF5164                 call    dword ptr [ecx+$64]
004E44EF   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E44F1   8B8340030000           mov     eax, [ebx+$0340]
004E44F7   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E44F9   FF5164                 call    dword ptr [ecx+$64]
004E44FC   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E44FE   8B8348030000           mov     eax, [ebx+$0348]
004E4504   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E4506   FF5164                 call    dword ptr [ecx+$64]
004E4509   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E450B   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4511   E872E6F8FF             call    00472B88
004E4516   B201                   mov     dl, $01

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E4518   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E451E   E865E6F8FF             call    00472B88
004E4523   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E4525   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E452B   E858E6F8FF             call    00472B88
004E4530   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Test : TMenuItem
|
004E4532   8B8350030000           mov     eax, [ebx+$0350]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4538   E84BE6F8FF             call    00472B88
004E453D   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Start : TMenuItem
|
004E453F   8B8318030000           mov     eax, [ebx+$0318]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4545   E83EE6F8FF             call    00472B88
004E454A   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E454C   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4552   E831E6F8FF             call    00472B88
004E4557   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Setting : TMenuItem
|
004E4559   8B8354030000           mov     eax, [ebx+$0354]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E455F   E824E6F8FF             call    00472B88
004E4564   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Load : TMenuItem
|
004E4566   8B830C030000           mov     eax, [ebx+$030C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E456C   E817E6F8FF             call    00472B88
004E4571   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E4578   7414                   jz      004E458E
004E457A   33F6                   xor     esi, esi
004E457C   B8F86D4F00             mov     eax, $004F6DF8
004E4581   C60000                 mov     byte ptr [eax], $00
004E4584   46                     inc     esi
004E4585   40                     inc     eax
004E4586   81FE80000000           cmp     esi, $00000080
004E458C   75F3                   jnz     004E4581
004E458E   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DF8
|
004E4593   A2F86D4F00             mov     byte ptr [$004F6DF8], al
004E4598   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DA5
|
004E459D   A2A56D4F00             mov     byte ptr [$004F6DA5], al
004E45A2   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E45A9   7536                   jnz     004E45E1
004E45AB   68CC6D4F00             push    $004F6DCC
004E45B0   BAF86D4F00             mov     edx, $004F6DF8
004E45B5   B980000000             mov     ecx, $00000080
004E45BA   B8006F4F00             mov     eax, $004F6F00

|
004E45BF   E88CEAF1FF             call    00403050

|
004E45C4   E8EBE2F1FF             call    004028B4
004E45C9   C60525724F0000         mov     byte ptr [$004F7225], $00

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E45D0   8B8334030000           mov     eax, [ebx+$0334]
004E45D6   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004E45DA   E835F8F1FF             call    00403E14
004E45DF   EB0D                   jmp     004E45EE
004E45E1   B201                   mov     dl, $01

* Reference to control TForm1.TimerParam : TTimer
|
004E45E3   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E45E9   E8B60DF5FF             call    004353A4
004E45EE   6A4B                   push    $4B

* Reference to: kernel32.Sleep()
|
004E45F0   E8879DF2FF             call    0040E37C
004E45F5   33C0                   xor     eax, eax
004E45F7   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E45FC   83F822                 cmp     eax, +$22
004E45FF   7F1E                   jnle    004E461F
004E4601   0F84B9100000           jz      004E56C0
004E4607   83E811                 sub     eax, +$11
004E460A   742A                   jz      004E4636
004E460C   48                     dec     eax
004E460D   0F8414030000           jz      004E4927
004E4613   48                     dec     eax
004E4614   0F84C90C0000           jz      004E52E3
004E461A   E945170000             jmp     004E5D64
004E461F   83E831                 sub     eax, +$31
004E4622   0F8489130000           jz      004E59B1
004E4628   83E810                 sub     eax, +$10
004E462B   0F84C6130000           jz      004E59F7
004E4631   E92E170000             jmp     004E5D64
004E4636   68FF000000             push    $000000FF
004E463B   C68558FFFFFF80         mov     byte ptr [ebp+$FFFFFF58], $80
004E4642   C68559FFFFFF11         mov     byte ptr [ebp+$FFFFFF59], $11
004E4649   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E464E   88855AFFFFFF           mov     [ebp+$FFFFFF5A], al
004E4654   C6855BFFFFFF89         mov     byte ptr [ebp+$FFFFFF5B], $89
004E465B   C6855CFFFFFF2C         mov     byte ptr [ebp+$FFFFFF5C], $2C
004E4662   C6855DFFFFFFF0         mov     byte ptr [ebp+$FFFFFF5D], $F0
004E4669   C6855EFFFFFF01         mov     byte ptr [ebp+$FFFFFF5E], $01
004E4670   C6855FFFFFFF01         mov     byte ptr [ebp+$FFFFFF5F], $01
004E4677   C68560FFFFFF01         mov     byte ptr [ebp+$FFFFFF60], $01
004E467E   C68561FFFFFF0C         mov     byte ptr [ebp+$FFFFFF61], $0C
004E4685   C68562FFFFFF01         mov     byte ptr [ebp+$FFFFFF62], $01
004E468C   C68563FFFFFF01         mov     byte ptr [ebp+$FFFFFF63], $01
004E4693   C68564FFFFFF02         mov     byte ptr [ebp+$FFFFFF64], $02
004E469A   C68565FFFFFF01         mov     byte ptr [ebp+$FFFFFF65], $01
004E46A1   C68566FFFFFF0C         mov     byte ptr [ebp+$FFFFFF66], $0C
004E46A8   C68567FFFFFF20         mov     byte ptr [ebp+$FFFFFF67], $20
004E46AF   C68568FFFFFF01         mov     byte ptr [ebp+$FFFFFF68], $01
004E46B6   C68569FFFFFF03         mov     byte ptr [ebp+$FFFFFF69], $03
004E46BD   C6856AFFFFFF01         mov     byte ptr [ebp+$FFFFFF6A], $01
004E46C4   C6856BFFFFFF0B         mov     byte ptr [ebp+$FFFFFF6B], $0B
004E46CB   C6856CFFFFFF01         mov     byte ptr [ebp+$FFFFFF6C], $01
004E46D2   C6856DFFFFFF01         mov     byte ptr [ebp+$FFFFFF6D], $01
004E46D9   C6856EFFFFFF04         mov     byte ptr [ebp+$FFFFFF6E], $04
004E46E0   C6856FFFFFFF01         mov     byte ptr [ebp+$FFFFFF6F], $01
004E46E7   C68570FFFFFF0B         mov     byte ptr [ebp+$FFFFFF70], $0B
004E46EE   C68571FFFFFF08         mov     byte ptr [ebp+$FFFFFF71], $08
004E46F5   C68572FFFFFF01         mov     byte ptr [ebp+$FFFFFF72], $01
004E46FC   C68573FFFFFF05         mov     byte ptr [ebp+$FFFFFF73], $05
004E4703   C68574FFFFFF01         mov     byte ptr [ebp+$FFFFFF74], $01
004E470A   C68575FFFFFF0B         mov     byte ptr [ebp+$FFFFFF75], $0B
004E4711   C68576FFFFFF09         mov     byte ptr [ebp+$FFFFFF76], $09
004E4718   C68577FFFFFF01         mov     byte ptr [ebp+$FFFFFF77], $01
004E471F   C68578FFFFFF06         mov     byte ptr [ebp+$FFFFFF78], $06
004E4726   C68579FFFFFF05         mov     byte ptr [ebp+$FFFFFF79], $05
004E472D   C6857AFFFFFF0B         mov     byte ptr [ebp+$FFFFFF7A], $0B
004E4734   C6857BFFFFFF11         mov     byte ptr [ebp+$FFFFFF7B], $11
004E473B   C6857CFFFFFF01         mov     byte ptr [ebp+$FFFFFF7C], $01
004E4742   C6857DFFFFFF0B         mov     byte ptr [ebp+$FFFFFF7D], $0B
004E4749   C6857EFFFFFF02         mov     byte ptr [ebp+$FFFFFF7E], $02
004E4750   C6857FFFFFFF06         mov     byte ptr [ebp+$FFFFFF7F], $06
004E4757   C6458002               mov     byte ptr [ebp-$80], $02
004E475B   C6458101               mov     byte ptr [ebp-$7F], $01
004E475F   C645820D               mov     byte ptr [ebp-$7E], $0D
004E4763   C6458301               mov     byte ptr [ebp-$7D], $01
004E4767   C6458405               mov     byte ptr [ebp-$7C], $05
004E476B   C6458506               mov     byte ptr [ebp-$7B], $06
004E476F   C6458601               mov     byte ptr [ebp-$7A], $01
004E4773   C645870E               mov     byte ptr [ebp-$79], $0E
004E4777   C6458801               mov     byte ptr [ebp-$78], $01
004E477B   C6458905               mov     byte ptr [ebp-$77], $05
004E477F   C6458A07               mov     byte ptr [ebp-$76], $07
004E4783   C6458B01               mov     byte ptr [ebp-$75], $01
004E4787   C6458C0F               mov     byte ptr [ebp-$74], $0F
004E478B   C6458D02               mov     byte ptr [ebp-$73], $02
004E478F   C6458E04               mov     byte ptr [ebp-$72], $04
004E4793   C6458F02               mov     byte ptr [ebp-$71], $02
004E4797   C6459001               mov     byte ptr [ebp-$70], $01
004E479B   C6459111               mov     byte ptr [ebp-$6F], $11
004E479F   C6459202               mov     byte ptr [ebp-$6E], $02
004E47A3   C6459304               mov     byte ptr [ebp-$6D], $04
004E47A7   C6459406               mov     byte ptr [ebp-$6C], $06
004E47AB   C6459501               mov     byte ptr [ebp-$6B], $01
004E47AF   C6459613               mov     byte ptr [ebp-$6A], $13
004E47B3   C6459702               mov     byte ptr [ebp-$69], $02
004E47B7   C6459804               mov     byte ptr [ebp-$68], $04
004E47BB   C6459912               mov     byte ptr [ebp-$67], $12
004E47BF   C6459A01               mov     byte ptr [ebp-$66], $01
004E47C3   C6459B15               mov     byte ptr [ebp-$65], $15
004E47C7   C6459C02               mov     byte ptr [ebp-$64], $02
004E47CB   C6459D04               mov     byte ptr [ebp-$63], $04
004E47CF   C6459E16               mov     byte ptr [ebp-$62], $16
004E47D3   C6459F01               mov     byte ptr [ebp-$61], $01
004E47D7   C645A017               mov     byte ptr [ebp-$60], $17
004E47DB   C645A104               mov     byte ptr [ebp-$5F], $04
004E47DF   C645A203               mov     byte ptr [ebp-$5E], $03
004E47E3   C645A301               mov     byte ptr [ebp-$5D], $01
004E47E7   C645A401               mov     byte ptr [ebp-$5C], $01
004E47EB   C645A51B               mov     byte ptr [ebp-$5B], $1B
004E47EF   C645A601               mov     byte ptr [ebp-$5A], $01
004E47F3   C645A703               mov     byte ptr [ebp-$59], $03
004E47F7   C645A807               mov     byte ptr [ebp-$58], $07
004E47FB   C645A901               mov     byte ptr [ebp-$57], $01
004E47FF   C645AA1C               mov     byte ptr [ebp-$56], $1C
004E4803   C645AB01               mov     byte ptr [ebp-$55], $01
004E4807   C645AC01               mov     byte ptr [ebp-$54], $01
004E480B   C645AD07               mov     byte ptr [ebp-$53], $07
004E480F   C645AE01               mov     byte ptr [ebp-$52], $01
004E4813   C645AF1D               mov     byte ptr [ebp-$51], $1D
004E4817   C645B001               mov     byte ptr [ebp-$50], $01
004E481B   C645B101               mov     byte ptr [ebp-$4F], $01
004E481F   C645B208               mov     byte ptr [ebp-$4E], $08
004E4823   C645B301               mov     byte ptr [ebp-$4D], $01
004E4827   C645B41E               mov     byte ptr [ebp-$4C], $1E
004E482B   C645B501               mov     byte ptr [ebp-$4B], $01
004E482F   C645B604               mov     byte ptr [ebp-$4A], $04
004E4833   C645B709               mov     byte ptr [ebp-$49], $09
004E4837   C645B801               mov     byte ptr [ebp-$48], $01
004E483B   C645B91F               mov     byte ptr [ebp-$47], $1F
004E483F   C645BA01               mov     byte ptr [ebp-$46], $01
004E4843   C645BB04               mov     byte ptr [ebp-$45], $04
004E4847   C645BC0D               mov     byte ptr [ebp-$44], $0D
004E484B   C645BD01               mov     byte ptr [ebp-$43], $01
004E484F   C645BE20               mov     byte ptr [ebp-$42], $20
004E4853   C645BF01               mov     byte ptr [ebp-$41], $01
004E4857   C645C00C               mov     byte ptr [ebp-$40], $0C
004E485B   C645C104               mov     byte ptr [ebp-$3F], $04
004E485F   C645C201               mov     byte ptr [ebp-$3E], $01
004E4863   C645C321               mov     byte ptr [ebp-$3D], $21
004E4867   C645C401               mov     byte ptr [ebp-$3C], $01
004E486B   C645C514               mov     byte ptr [ebp-$3B], $14
004E486F   C645C609               mov     byte ptr [ebp-$3A], $09
004E4873   C645C701               mov     byte ptr [ebp-$39], $01
004E4877   C645C822               mov     byte ptr [ebp-$38], $22
004E487B   C645C902               mov     byte ptr [ebp-$37], $02
004E487F   C645CA01               mov     byte ptr [ebp-$36], $01
004E4883   C645CB02               mov     byte ptr [ebp-$35], $02
004E4887   C645CC01               mov     byte ptr [ebp-$34], $01
004E488B   C645CD24               mov     byte ptr [ebp-$33], $24
004E488F   C645CE02               mov     byte ptr [ebp-$32], $02
004E4893   C645CF01               mov     byte ptr [ebp-$31], $01
004E4897   C645D004               mov     byte ptr [ebp-$30], $04
004E489B   C645D101               mov     byte ptr [ebp-$2F], $01
004E489F   C645D226               mov     byte ptr [ebp-$2E], $26
004E48A3   C645D302               mov     byte ptr [ebp-$2D], $02
004E48A7   C645D401               mov     byte ptr [ebp-$2C], $01
004E48AB   C645D506               mov     byte ptr [ebp-$2B], $06
004E48AF   C645D601               mov     byte ptr [ebp-$2A], $01
004E48B3   C645D728               mov     byte ptr [ebp-$29], $28
004E48B7   C645D802               mov     byte ptr [ebp-$28], $02
004E48BB   C645D901               mov     byte ptr [ebp-$27], $01
004E48BF   C645DA1C               mov     byte ptr [ebp-$26], $1C
004E48C3   C645DB01               mov     byte ptr [ebp-$25], $01
004E48C7   C645DC2A               mov     byte ptr [ebp-$24], $2A
004E48CB   C645DD02               mov     byte ptr [ebp-$23], $02
004E48CF   C645DE01               mov     byte ptr [ebp-$22], $01
004E48D3   C645DF20               mov     byte ptr [ebp-$21], $20
004E48D7   C645E001               mov     byte ptr [ebp-$20], $01
004E48DB   C645E12C               mov     byte ptr [ebp-$1F], $2C
004E48DF   C645E202               mov     byte ptr [ebp-$1E], $02
004E48E3   C645E301               mov     byte ptr [ebp-$1D], $01
004E48E7   C645E416               mov     byte ptr [ebp-$1C], $16
004E48EB   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E48F0   8845E5                 mov     [ebp-$1B], al
004E48F3   8D9558FFFFFF           lea     edx, [ebp+$FFFFFF58]
004E48F9   B98D000000             mov     ecx, $0000008D
004E48FE   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4900   E83BE5FFFF             call    004E2E40
004E4905   803D896E4F006C         cmp     byte ptr [$004F6E89], $6C
004E490C   750D                   jnz     004E491B
004E490E   803D8A6E4F00F0         cmp     byte ptr [$004F6E8A], $F0
004E4915   0F8449140000           jz      004E5D64
004E491B   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E491D   E8A64C0000             call    004E95C8
004E4922   E9A5140000             jmp     004E5DCC
004E4927   68FF000000             push    $000000FF
004E492C   C685B4FEFFFF80         mov     byte ptr [ebp+$FFFFFEB4], $80
004E4933   C685B5FEFFFF11         mov     byte ptr [ebp+$FFFFFEB5], $11
004E493A   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E493F   8885B6FEFFFF           mov     [ebp+$FFFFFEB6], al
004E4945   C685B7FEFFFF9E         mov     byte ptr [ebp+$FFFFFEB7], $9E
004E494C   C685B8FEFFFF2C         mov     byte ptr [ebp+$FFFFFEB8], $2C
004E4953   C685B9FEFFFFF0         mov     byte ptr [ebp+$FFFFFEB9], $F0
004E495A   C685BAFEFFFF02         mov     byte ptr [ebp+$FFFFFEBA], $02
004E4961   C685BBFEFFFF01         mov     byte ptr [ebp+$FFFFFEBB], $01
004E4968   C685BCFEFFFF01         mov     byte ptr [ebp+$FFFFFEBC], $01
004E496F   C685BDFEFFFF00         mov     byte ptr [ebp+$FFFFFEBD], $00
004E4976   C685BEFEFFFF0B         mov     byte ptr [ebp+$FFFFFEBE], $0B
004E497D   C685BFFEFFFF01         mov     byte ptr [ebp+$FFFFFEBF], $01
004E4984   C685C0FEFFFF02         mov     byte ptr [ebp+$FFFFFEC0], $02
004E498B   C685C1FEFFFF02         mov     byte ptr [ebp+$FFFFFEC1], $02
004E4992   C685C2FEFFFF01         mov     byte ptr [ebp+$FFFFFEC2], $01
004E4999   C685C3FEFFFF00         mov     byte ptr [ebp+$FFFFFEC3], $00
004E49A0   C685C4FEFFFF0D         mov     byte ptr [ebp+$FFFFFEC4], $0D
004E49A7   C685C5FEFFFF01         mov     byte ptr [ebp+$FFFFFEC5], $01
004E49AE   C685C6FEFFFF02         mov     byte ptr [ebp+$FFFFFEC6], $02
004E49B5   C685C7FEFFFF03         mov     byte ptr [ebp+$FFFFFEC7], $03
004E49BC   C685C8FEFFFF01         mov     byte ptr [ebp+$FFFFFEC8], $01
004E49C3   C685C9FEFFFF00         mov     byte ptr [ebp+$FFFFFEC9], $00
004E49CA   C685CAFEFFFF0E         mov     byte ptr [ebp+$FFFFFECA], $0E
004E49D1   C685CBFEFFFF01         mov     byte ptr [ebp+$FFFFFECB], $01
004E49D8   C685CCFEFFFF02         mov     byte ptr [ebp+$FFFFFECC], $02
004E49DF   C685CDFEFFFF04         mov     byte ptr [ebp+$FFFFFECD], $04
004E49E6   C685CEFEFFFF01         mov     byte ptr [ebp+$FFFFFECE], $01
004E49ED   C685CFFEFFFF00         mov     byte ptr [ebp+$FFFFFECF], $00
004E49F4   C685D0FEFFFF0F         mov     byte ptr [ebp+$FFFFFED0], $0F
004E49FB   C685D1FEFFFF01         mov     byte ptr [ebp+$FFFFFED1], $01
004E4A02   C685D2FEFFFF02         mov     byte ptr [ebp+$FFFFFED2], $02
004E4A09   C685D3FEFFFF05         mov     byte ptr [ebp+$FFFFFED3], $05
004E4A10   C685D4FEFFFF01         mov     byte ptr [ebp+$FFFFFED4], $01
004E4A17   C685D5FEFFFF00         mov     byte ptr [ebp+$FFFFFED5], $00
004E4A1E   C685D6FEFFFF11         mov     byte ptr [ebp+$FFFFFED6], $11
004E4A25   C685D7FEFFFF01         mov     byte ptr [ebp+$FFFFFED7], $01
004E4A2C   C685D8FEFFFF02         mov     byte ptr [ebp+$FFFFFED8], $02
004E4A33   C685D9FEFFFF06         mov     byte ptr [ebp+$FFFFFED9], $06
004E4A3A   C685DAFEFFFF02         mov     byte ptr [ebp+$FFFFFEDA], $02
004E4A41   C685DBFEFFFF11         mov     byte ptr [ebp+$FFFFFEDB], $11
004E4A48   C685DCFEFFFFAC         mov     byte ptr [ebp+$FFFFFEDC], $AC
004E4A4F   C685DDFEFFFF01         mov     byte ptr [ebp+$FFFFFEDD], $01
004E4A56   C685DEFEFFFF02         mov     byte ptr [ebp+$FFFFFEDE], $02
004E4A5D   C685DFFEFFFF08         mov     byte ptr [ebp+$FFFFFEDF], $08
004E4A64   C685E0FEFFFF01         mov     byte ptr [ebp+$FFFFFEE0], $01
004E4A6B   C685E1FEFFFF00         mov     byte ptr [ebp+$FFFFFEE1], $00
004E4A72   C685E2FEFFFF04         mov     byte ptr [ebp+$FFFFFEE2], $04
004E4A79   C685E3FEFFFF01         mov     byte ptr [ebp+$FFFFFEE3], $01
004E4A80   C685E4FEFFFF02         mov     byte ptr [ebp+$FFFFFEE4], $02
004E4A87   C685E5FEFFFF09         mov     byte ptr [ebp+$FFFFFEE5], $09
004E4A8E   C685E6FEFFFF01         mov     byte ptr [ebp+$FFFFFEE6], $01
004E4A95   C685E7FEFFFF11         mov     byte ptr [ebp+$FFFFFEE7], $11
004E4A9C   C685E8FEFFFF92         mov     byte ptr [ebp+$FFFFFEE8], $92
004E4AA3   C685E9FEFFFF01         mov     byte ptr [ebp+$FFFFFEE9], $01
004E4AAA   C685EAFEFFFF02         mov     byte ptr [ebp+$FFFFFEEA], $02
004E4AB1   C685EBFEFFFF0A         mov     byte ptr [ebp+$FFFFFEEB], $0A
004E4AB8   C685ECFEFFFF02         mov     byte ptr [ebp+$FFFFFEEC], $02
004E4ABF   C685EDFEFFFF00         mov     byte ptr [ebp+$FFFFFEED], $00
004E4AC6   C685EEFEFFFF0C         mov     byte ptr [ebp+$FFFFFEEE], $0C
004E4ACD   C685EFFEFFFF01         mov     byte ptr [ebp+$FFFFFEEF], $01
004E4AD4   C685F0FEFFFF02         mov     byte ptr [ebp+$FFFFFEF0], $02
004E4ADB   C685F1FEFFFF0C         mov     byte ptr [ebp+$FFFFFEF1], $0C
004E4AE2   C685F2FEFFFF02         mov     byte ptr [ebp+$FFFFFEF2], $02
004E4AE9   C685F3FEFFFF12         mov     byte ptr [ebp+$FFFFFEF3], $12
004E4AF0   C685F4FEFFFFE3         mov     byte ptr [ebp+$FFFFFEF4], $E3
004E4AF7   C685F5FEFFFF01         mov     byte ptr [ebp+$FFFFFEF5], $01
004E4AFE   C685F6FEFFFF02         mov     byte ptr [ebp+$FFFFFEF6], $02
004E4B05   C685F7FEFFFF0E         mov     byte ptr [ebp+$FFFFFEF7], $0E
004E4B0C   C685F8FEFFFF01         mov     byte ptr [ebp+$FFFFFEF8], $01
004E4B13   C685F9FEFFFF11         mov     byte ptr [ebp+$FFFFFEF9], $11
004E4B1A   C685FAFEFFFF41         mov     byte ptr [ebp+$FFFFFEFA], $41
004E4B21   C685FBFEFFFF01         mov     byte ptr [ebp+$FFFFFEFB], $01
004E4B28   C685FCFEFFFF02         mov     byte ptr [ebp+$FFFFFEFC], $02
004E4B2F   C685FDFEFFFF0F         mov     byte ptr [ebp+$FFFFFEFD], $0F
004E4B36   C685FEFEFFFF01         mov     byte ptr [ebp+$FFFFFEFE], $01
004E4B3D   C685FFFEFFFF11         mov     byte ptr [ebp+$FFFFFEFF], $11
004E4B44   C68500FFFFFF43         mov     byte ptr [ebp+$FFFFFF00], $43
004E4B4B   C68501FFFFFF01         mov     byte ptr [ebp+$FFFFFF01], $01
004E4B52   C68502FFFFFF02         mov     byte ptr [ebp+$FFFFFF02], $02
004E4B59   C68503FFFFFF10         mov     byte ptr [ebp+$FFFFFF03], $10
004E4B60   C68504FFFFFF01         mov     byte ptr [ebp+$FFFFFF04], $01
004E4B67   C68505FFFFFF11         mov     byte ptr [ebp+$FFFFFF05], $11
004E4B6E   C68506FFFFFF45         mov     byte ptr [ebp+$FFFFFF06], $45
004E4B75   C68507FFFFFF01         mov     byte ptr [ebp+$FFFFFF07], $01
004E4B7C   C68508FFFFFF02         mov     byte ptr [ebp+$FFFFFF08], $02
004E4B83   C68509FFFFFF11         mov     byte ptr [ebp+$FFFFFF09], $11
004E4B8A   C6850AFFFFFF01         mov     byte ptr [ebp+$FFFFFF0A], $01
004E4B91   C6850BFFFFFF11         mov     byte ptr [ebp+$FFFFFF0B], $11
004E4B98   C6850CFFFFFF46         mov     byte ptr [ebp+$FFFFFF0C], $46
004E4B9F   C6850DFFFFFF01         mov     byte ptr [ebp+$FFFFFF0D], $01
004E4BA6   C6850EFFFFFF02         mov     byte ptr [ebp+$FFFFFF0E], $02
004E4BAD   C6850FFFFFFF12         mov     byte ptr [ebp+$FFFFFF0F], $12
004E4BB4   C68510FFFFFF01         mov     byte ptr [ebp+$FFFFFF10], $01
004E4BBB   C68511FFFFFF00         mov     byte ptr [ebp+$FFFFFF11], $00
004E4BC2   C68512FFFFFF07         mov     byte ptr [ebp+$FFFFFF12], $07
004E4BC9   C68513FFFFFF01         mov     byte ptr [ebp+$FFFFFF13], $01
004E4BD0   C68514FFFFFF02         mov     byte ptr [ebp+$FFFFFF14], $02
004E4BD7   C68515FFFFFF13         mov     byte ptr [ebp+$FFFFFF15], $13
004E4BDE   C68516FFFFFF01         mov     byte ptr [ebp+$FFFFFF16], $01
004E4BE5   C68517FFFFFF11         mov     byte ptr [ebp+$FFFFFF17], $11
004E4BEC   C68518FFFFFF4E         mov     byte ptr [ebp+$FFFFFF18], $4E
004E4BF3   C68519FFFFFF01         mov     byte ptr [ebp+$FFFFFF19], $01
004E4BFA   C6851AFFFFFF02         mov     byte ptr [ebp+$FFFFFF1A], $02
004E4C01   C6851BFFFFFF14         mov     byte ptr [ebp+$FFFFFF1B], $14
004E4C08   C6851CFFFFFF01         mov     byte ptr [ebp+$FFFFFF1C], $01
004E4C0F   C6851DFFFFFF11         mov     byte ptr [ebp+$FFFFFF1D], $11
004E4C16   C6851EFFFFFF55         mov     byte ptr [ebp+$FFFFFF1E], $55
004E4C1D   C6851FFFFFFF01         mov     byte ptr [ebp+$FFFFFF1F], $01
004E4C24   C68520FFFFFF02         mov     byte ptr [ebp+$FFFFFF20], $02
004E4C2B   C68521FFFFFF15         mov     byte ptr [ebp+$FFFFFF21], $15
004E4C32   C68522FFFFFF01         mov     byte ptr [ebp+$FFFFFF22], $01
004E4C39   C68523FFFFFF11         mov     byte ptr [ebp+$FFFFFF23], $11
004E4C40   C68524FFFFFF01         mov     byte ptr [ebp+$FFFFFF24], $01
004E4C47   C68525FFFFFF01         mov     byte ptr [ebp+$FFFFFF25], $01
004E4C4E   C68526FFFFFF02         mov     byte ptr [ebp+$FFFFFF26], $02
004E4C55   C68527FFFFFF16         mov     byte ptr [ebp+$FFFFFF27], $16
004E4C5C   C68528FFFFFF01         mov     byte ptr [ebp+$FFFFFF28], $01
004E4C63   C68529FFFFFF11         mov     byte ptr [ebp+$FFFFFF29], $11
004E4C6A   C6852AFFFFFF70         mov     byte ptr [ebp+$FFFFFF2A], $70
004E4C71   C6852BFFFFFF01         mov     byte ptr [ebp+$FFFFFF2B], $01
004E4C78   C6852CFFFFFF02         mov     byte ptr [ebp+$FFFFFF2C], $02
004E4C7F   C6852DFFFFFF17         mov     byte ptr [ebp+$FFFFFF2D], $17
004E4C86   C6852EFFFFFF01         mov     byte ptr [ebp+$FFFFFF2E], $01
004E4C8D   C6852FFFFFFF11         mov     byte ptr [ebp+$FFFFFF2F], $11
004E4C94   C68530FFFFFF4B         mov     byte ptr [ebp+$FFFFFF30], $4B
004E4C9B   C68531FFFFFF01         mov     byte ptr [ebp+$FFFFFF31], $01
004E4CA2   C68532FFFFFF02         mov     byte ptr [ebp+$FFFFFF32], $02
004E4CA9   C68533FFFFFF18         mov     byte ptr [ebp+$FFFFFF33], $18
004E4CB0   C68534FFFFFF01         mov     byte ptr [ebp+$FFFFFF34], $01
004E4CB7   C68535FFFFFF11         mov     byte ptr [ebp+$FFFFFF35], $11
004E4CBE   C68536FFFFFF72         mov     byte ptr [ebp+$FFFFFF36], $72
004E4CC5   C68537FFFFFF01         mov     byte ptr [ebp+$FFFFFF37], $01
004E4CCC   C68538FFFFFF02         mov     byte ptr [ebp+$FFFFFF38], $02
004E4CD3   C68539FFFFFF19         mov     byte ptr [ebp+$FFFFFF39], $19
004E4CDA   C6853AFFFFFF01         mov     byte ptr [ebp+$FFFFFF3A], $01
004E4CE1   C6853BFFFFFF11         mov     byte ptr [ebp+$FFFFFF3B], $11
004E4CE8   C6853CFFFFFF90         mov     byte ptr [ebp+$FFFFFF3C], $90
004E4CEF   C6853DFFFFFF01         mov     byte ptr [ebp+$FFFFFF3D], $01
004E4CF6   C6853EFFFFFF02         mov     byte ptr [ebp+$FFFFFF3E], $02
004E4CFD   C6853FFFFFFF1A         mov     byte ptr [ebp+$FFFFFF3F], $1A
004E4D04   C68540FFFFFF01         mov     byte ptr [ebp+$FFFFFF40], $01
004E4D0B   C68541FFFFFF00         mov     byte ptr [ebp+$FFFFFF41], $00
004E4D12   C68542FFFFFF05         mov     byte ptr [ebp+$FFFFFF42], $05
004E4D19   C68543FFFFFF01         mov     byte ptr [ebp+$FFFFFF43], $01
004E4D20   C68544FFFFFF02         mov     byte ptr [ebp+$FFFFFF44], $02
004E4D27   C68545FFFFFF1B         mov     byte ptr [ebp+$FFFFFF45], $1B
004E4D2E   C68546FFFFFF01         mov     byte ptr [ebp+$FFFFFF46], $01
004E4D35   C68547FFFFFF00         mov     byte ptr [ebp+$FFFFFF47], $00
004E4D3C   C68548FFFFFF06         mov     byte ptr [ebp+$FFFFFF48], $06
004E4D43   C68549FFFFFF01         mov     byte ptr [ebp+$FFFFFF49], $01
004E4D4A   C6854AFFFFFF02         mov     byte ptr [ebp+$FFFFFF4A], $02
004E4D51   C6854BFFFFFF1C         mov     byte ptr [ebp+$FFFFFF4B], $1C
004E4D58   C6854CFFFFFF01         mov     byte ptr [ebp+$FFFFFF4C], $01
004E4D5F   C6854DFFFFFF11         mov     byte ptr [ebp+$FFFFFF4D], $11
004E4D66   C6854EFFFFFF9D         mov     byte ptr [ebp+$FFFFFF4E], $9D
004E4D6D   C6854FFFFFFF01         mov     byte ptr [ebp+$FFFFFF4F], $01
004E4D74   C68550FFFFFF02         mov     byte ptr [ebp+$FFFFFF50], $02
004E4D7B   C68551FFFFFF1D         mov     byte ptr [ebp+$FFFFFF51], $1D
004E4D82   C68552FFFFFF01         mov     byte ptr [ebp+$FFFFFF52], $01
004E4D89   C68553FFFFFF11         mov     byte ptr [ebp+$FFFFFF53], $11
004E4D90   C68554FFFFFF9E         mov     byte ptr [ebp+$FFFFFF54], $9E
004E4D97   C68555FFFFFF01         mov     byte ptr [ebp+$FFFFFF55], $01
004E4D9E   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E4DA3   888556FFFFFF           mov     [ebp+$FFFFFF56], al
004E4DA9   8D95B4FEFFFF           lea     edx, [ebp+$FFFFFEB4]
004E4DAF   B9A2000000             mov     ecx, $000000A2
004E4DB4   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4DB6   E885E0FFFF             call    004E2E40
004E4DBB   803D9E6E4F006C         cmp     byte ptr [$004F6E9E], $6C
004E4DC2   7509                   jnz     004E4DCD
004E4DC4   803D9F6E4F00F0         cmp     byte ptr [$004F6E9F], $F0
004E4DCB   740C                   jz      004E4DD9
004E4DCD   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E4DCF   E8F4470000             call    004E95C8
004E4DD4   E9F30F0000             jmp     004E5DCC
004E4DD9   68FF000000             push    $000000FF
004E4DDE   C68504FEFFFF80         mov     byte ptr [ebp+$FFFFFE04], $80
004E4DE5   C68505FEFFFF11         mov     byte ptr [ebp+$FFFFFE05], $11
004E4DEC   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E4DF1   888506FEFFFF           mov     [ebp+$FFFFFE06], al
004E4DF7   C68507FEFFFFAA         mov     byte ptr [ebp+$FFFFFE07], $AA
004E4DFE   C68508FEFFFF2C         mov     byte ptr [ebp+$FFFFFE08], $2C
004E4E05   C68509FEFFFFF1         mov     byte ptr [ebp+$FFFFFE09], $F1
004E4E0C   C6850AFEFFFF02         mov     byte ptr [ebp+$FFFFFE0A], $02
004E4E13   C6850BFEFFFF01         mov     byte ptr [ebp+$FFFFFE0B], $01
004E4E1A   C6850CFEFFFF01         mov     byte ptr [ebp+$FFFFFE0C], $01
004E4E21   C6850DFEFFFF11         mov     byte ptr [ebp+$FFFFFE0D], $11
004E4E28   C6850EFEFFFF5E         mov     byte ptr [ebp+$FFFFFE0E], $5E
004E4E2F   C6850FFEFFFF01         mov     byte ptr [ebp+$FFFFFE0F], $01
004E4E36   C68510FEFFFF02         mov     byte ptr [ebp+$FFFFFE10], $02
004E4E3D   C68511FEFFFF02         mov     byte ptr [ebp+$FFFFFE11], $02
004E4E44   C68512FEFFFF02         mov     byte ptr [ebp+$FFFFFE12], $02
004E4E4B   C68513FEFFFF11         mov     byte ptr [ebp+$FFFFFE13], $11
004E4E52   C68514FEFFFFA1         mov     byte ptr [ebp+$FFFFFE14], $A1
004E4E59   C68515FEFFFF01         mov     byte ptr [ebp+$FFFFFE15], $01
004E4E60   C68516FEFFFF02         mov     byte ptr [ebp+$FFFFFE16], $02
004E4E67   C68517FEFFFF04         mov     byte ptr [ebp+$FFFFFE17], $04
004E4E6E   C68518FEFFFF01         mov     byte ptr [ebp+$FFFFFE18], $01
004E4E75   C68519FEFFFF11         mov     byte ptr [ebp+$FFFFFE19], $11
004E4E7C   C6851AFEFFFFA6         mov     byte ptr [ebp+$FFFFFE1A], $A6
004E4E83   C6851BFEFFFF01         mov     byte ptr [ebp+$FFFFFE1B], $01
004E4E8A   C6851CFEFFFF02         mov     byte ptr [ebp+$FFFFFE1C], $02
004E4E91   C6851DFEFFFF05         mov     byte ptr [ebp+$FFFFFE1D], $05
004E4E98   C6851EFEFFFF02         mov     byte ptr [ebp+$FFFFFE1E], $02
004E4E9F   C6851FFEFFFF11         mov     byte ptr [ebp+$FFFFFE1F], $11
004E4EA6   C68520FEFFFF93         mov     byte ptr [ebp+$FFFFFE20], $93
004E4EAD   C68521FEFFFF01         mov     byte ptr [ebp+$FFFFFE21], $01
004E4EB4   C68522FEFFFF02         mov     byte ptr [ebp+$FFFFFE22], $02
004E4EBB   C68523FEFFFF07         mov     byte ptr [ebp+$FFFFFE23], $07
004E4EC2   C68524FEFFFF01         mov     byte ptr [ebp+$FFFFFE24], $01
004E4EC9   C68525FEFFFF11         mov     byte ptr [ebp+$FFFFFE25], $11
004E4ED0   C68526FEFFFF76         mov     byte ptr [ebp+$FFFFFE26], $76
004E4ED7   C68527FEFFFF01         mov     byte ptr [ebp+$FFFFFE27], $01
004E4EDE   C68528FEFFFF02         mov     byte ptr [ebp+$FFFFFE28], $02
004E4EE5   C68529FEFFFF08         mov     byte ptr [ebp+$FFFFFE29], $08
004E4EEC   C6852AFEFFFF01         mov     byte ptr [ebp+$FFFFFE2A], $01
004E4EF3   C6852BFEFFFF11         mov     byte ptr [ebp+$FFFFFE2B], $11
004E4EFA   C6852CFEFFFF00         mov     byte ptr [ebp+$FFFFFE2C], $00
004E4F01   C6852DFEFFFF01         mov     byte ptr [ebp+$FFFFFE2D], $01
004E4F08   C6852EFEFFFF02         mov     byte ptr [ebp+$FFFFFE2E], $02
004E4F0F   C6852FFEFFFF09         mov     byte ptr [ebp+$FFFFFE2F], $09
004E4F16   C68530FEFFFF01         mov     byte ptr [ebp+$FFFFFE30], $01
004E4F1D   C68531FEFFFF11         mov     byte ptr [ebp+$FFFFFE31], $11
004E4F24   C68532FEFFFF04         mov     byte ptr [ebp+$FFFFFE32], $04
004E4F2B   C68533FEFFFF01         mov     byte ptr [ebp+$FFFFFE33], $01
004E4F32   C68534FEFFFF02         mov     byte ptr [ebp+$FFFFFE34], $02
004E4F39   C68535FEFFFF0A         mov     byte ptr [ebp+$FFFFFE35], $0A
004E4F40   C68536FEFFFF01         mov     byte ptr [ebp+$FFFFFE36], $01
004E4F47   C68537FEFFFF11         mov     byte ptr [ebp+$FFFFFE37], $11
004E4F4E   C68538FEFFFF02         mov     byte ptr [ebp+$FFFFFE38], $02
004E4F55   C68539FEFFFF01         mov     byte ptr [ebp+$FFFFFE39], $01
004E4F5C   C6853AFEFFFF02         mov     byte ptr [ebp+$FFFFFE3A], $02
004E4F63   C6853BFEFFFF0B         mov     byte ptr [ebp+$FFFFFE3B], $0B
004E4F6A   C6853CFEFFFF01         mov     byte ptr [ebp+$FFFFFE3C], $01
004E4F71   C6853DFEFFFF11         mov     byte ptr [ebp+$FFFFFE3D], $11
004E4F78   C6853EFEFFFF03         mov     byte ptr [ebp+$FFFFFE3E], $03
004E4F7F   C6853FFEFFFF01         mov     byte ptr [ebp+$FFFFFE3F], $01
004E4F86   C68540FEFFFF02         mov     byte ptr [ebp+$FFFFFE40], $02
004E4F8D   C68541FEFFFF0C         mov     byte ptr [ebp+$FFFFFE41], $0C
004E4F94   C68542FEFFFF01         mov     byte ptr [ebp+$FFFFFE42], $01
004E4F9B   C68543FEFFFF11         mov     byte ptr [ebp+$FFFFFE43], $11
004E4FA2   C68544FEFFFFA0         mov     byte ptr [ebp+$FFFFFE44], $A0
004E4FA9   C68545FEFFFF01         mov     byte ptr [ebp+$FFFFFE45], $01
004E4FB0   C68546FEFFFF02         mov     byte ptr [ebp+$FFFFFE46], $02
004E4FB7   C68547FEFFFF0D         mov     byte ptr [ebp+$FFFFFE47], $0D
004E4FBE   C68548FEFFFF01         mov     byte ptr [ebp+$FFFFFE48], $01
004E4FC5   C68549FEFFFF16         mov     byte ptr [ebp+$FFFFFE49], $16
004E4FCC   C6854AFEFFFF16         mov     byte ptr [ebp+$FFFFFE4A], $16
004E4FD3   C6854BFEFFFF01         mov     byte ptr [ebp+$FFFFFE4B], $01
004E4FDA   C6854CFEFFFF02         mov     byte ptr [ebp+$FFFFFE4C], $02
004E4FE1   C6854DFEFFFF0E         mov     byte ptr [ebp+$FFFFFE4D], $0E
004E4FE8   C6854EFEFFFF01         mov     byte ptr [ebp+$FFFFFE4E], $01
004E4FEF   C6854FFEFFFF11         mov     byte ptr [ebp+$FFFFFE4F], $11
004E4FF6   C68550FEFFFF6F         mov     byte ptr [ebp+$FFFFFE50], $6F
004E4FFD   C68551FEFFFF01         mov     byte ptr [ebp+$FFFFFE51], $01
004E5004   C68552FEFFFF02         mov     byte ptr [ebp+$FFFFFE52], $02
004E500B   C68553FEFFFF0F         mov     byte ptr [ebp+$FFFFFE53], $0F
004E5012   C68554FEFFFF01         mov     byte ptr [ebp+$FFFFFE54], $01
004E5019   C68555FEFFFF12         mov     byte ptr [ebp+$FFFFFE55], $12
004E5020   C68556FEFFFFE2         mov     byte ptr [ebp+$FFFFFE56], $E2
004E5027   C68557FEFFFF01         mov     byte ptr [ebp+$FFFFFE57], $01
004E502E   C68558FEFFFF02         mov     byte ptr [ebp+$FFFFFE58], $02
004E5035   C68559FEFFFF10         mov     byte ptr [ebp+$FFFFFE59], $10
004E503C   C6855AFEFFFF01         mov     byte ptr [ebp+$FFFFFE5A], $01
004E5043   C6855BFEFFFF11         mov     byte ptr [ebp+$FFFFFE5B], $11
004E504A   C6855CFEFFFF44         mov     byte ptr [ebp+$FFFFFE5C], $44
004E5051   C6855DFEFFFF01         mov     byte ptr [ebp+$FFFFFE5D], $01
004E5058   C6855EFEFFFF02         mov     byte ptr [ebp+$FFFFFE5E], $02
004E505F   C6855FFEFFFF11         mov     byte ptr [ebp+$FFFFFE5F], $11
004E5066   C68560FEFFFF01         mov     byte ptr [ebp+$FFFFFE60], $01
004E506D   C68561FEFFFF12         mov     byte ptr [ebp+$FFFFFE61], $12
004E5074   C68562FEFFFF00         mov     byte ptr [ebp+$FFFFFE62], $00
004E507B   C68563FEFFFF01         mov     byte ptr [ebp+$FFFFFE63], $01
004E5082   C68564FEFFFF02         mov     byte ptr [ebp+$FFFFFE64], $02
004E5089   C68565FEFFFF12         mov     byte ptr [ebp+$FFFFFE65], $12
004E5090   C68566FEFFFF02         mov     byte ptr [ebp+$FFFFFE66], $02
004E5097   C68567FEFFFF12         mov     byte ptr [ebp+$FFFFFE67], $12
004E509E   C68568FEFFFF01         mov     byte ptr [ebp+$FFFFFE68], $01
004E50A5   C68569FEFFFF01         mov     byte ptr [ebp+$FFFFFE69], $01
004E50AC   C6856AFEFFFF02         mov     byte ptr [ebp+$FFFFFE6A], $02
004E50B3   C6856BFEFFFF14         mov     byte ptr [ebp+$FFFFFE6B], $14
004E50BA   C6856CFEFFFF02         mov     byte ptr [ebp+$FFFFFE6C], $02
004E50C1   C6856DFEFFFF12         mov     byte ptr [ebp+$FFFFFE6D], $12
004E50C8   C6856EFEFFFF02         mov     byte ptr [ebp+$FFFFFE6E], $02
004E50CF   C6856FFEFFFF01         mov     byte ptr [ebp+$FFFFFE6F], $01
004E50D6   C68570FEFFFF02         mov     byte ptr [ebp+$FFFFFE70], $02
004E50DD   C68571FEFFFF16         mov     byte ptr [ebp+$FFFFFE71], $16
004E50E4   C68572FEFFFF02         mov     byte ptr [ebp+$FFFFFE72], $02
004E50EB   C68573FEFFFF12         mov     byte ptr [ebp+$FFFFFE73], $12
004E50F2   C68574FEFFFF03         mov     byte ptr [ebp+$FFFFFE74], $03
004E50F9   C68575FEFFFF01         mov     byte ptr [ebp+$FFFFFE75], $01
004E5100   C68576FEFFFF02         mov     byte ptr [ebp+$FFFFFE76], $02
004E5107   C68577FEFFFF18         mov     byte ptr [ebp+$FFFFFE77], $18
004E510E   C68578FEFFFF02         mov     byte ptr [ebp+$FFFFFE78], $02
004E5115   C68579FEFFFF12         mov     byte ptr [ebp+$FFFFFE79], $12
004E511C   C6857AFEFFFF04         mov     byte ptr [ebp+$FFFFFE7A], $04
004E5123   C6857BFEFFFF01         mov     byte ptr [ebp+$FFFFFE7B], $01
004E512A   C6857CFEFFFF02         mov     byte ptr [ebp+$FFFFFE7C], $02
004E5131   C6857DFEFFFF1A         mov     byte ptr [ebp+$FFFFFE7D], $1A
004E5138   C6857EFEFFFF01         mov     byte ptr [ebp+$FFFFFE7E], $01
004E513F   C6857FFEFFFF11         mov     byte ptr [ebp+$FFFFFE7F], $11
004E5146   C68580FEFFFFA3         mov     byte ptr [ebp+$FFFFFE80], $A3
004E514D   C68581FEFFFF01         mov     byte ptr [ebp+$FFFFFE81], $01
004E5154   C68582FEFFFF02         mov     byte ptr [ebp+$FFFFFE82], $02
004E515B   C68583FEFFFF1B         mov     byte ptr [ebp+$FFFFFE83], $1B
004E5162   C68584FEFFFF01         mov     byte ptr [ebp+$FFFFFE84], $01
004E5169   C68585FEFFFF12         mov     byte ptr [ebp+$FFFFFE85], $12
004E5170   C68586FEFFFFED         mov     byte ptr [ebp+$FFFFFE86], $ED
004E5177   C68587FEFFFF01         mov     byte ptr [ebp+$FFFFFE87], $01
004E517E   C68588FEFFFF02         mov     byte ptr [ebp+$FFFFFE88], $02
004E5185   C68589FEFFFF1C         mov     byte ptr [ebp+$FFFFFE89], $1C
004E518C   C6858AFEFFFF02         mov     byte ptr [ebp+$FFFFFE8A], $02
004E5193   C6858BFEFFFF12         mov     byte ptr [ebp+$FFFFFE8B], $12
004E519A   C6858CFEFFFF1A         mov     byte ptr [ebp+$FFFFFE8C], $1A
004E51A1   C6858DFEFFFF01         mov     byte ptr [ebp+$FFFFFE8D], $01
004E51A8   C6858EFEFFFF02         mov     byte ptr [ebp+$FFFFFE8E], $02
004E51AF   C6858FFEFFFF1E         mov     byte ptr [ebp+$FFFFFE8F], $1E
004E51B6   C68590FEFFFF01         mov     byte ptr [ebp+$FFFFFE90], $01
004E51BD   C68591FEFFFF11         mov     byte ptr [ebp+$FFFFFE91], $11
004E51C4   C68592FEFFFF9B         mov     byte ptr [ebp+$FFFFFE92], $9B
004E51CB   C68593FEFFFF01         mov     byte ptr [ebp+$FFFFFE93], $01
004E51D2   C68594FEFFFF02         mov     byte ptr [ebp+$FFFFFE94], $02
004E51D9   C68595FEFFFF1F         mov     byte ptr [ebp+$FFFFFE95], $1F
004E51E0   C68596FEFFFF02         mov     byte ptr [ebp+$FFFFFE96], $02
004E51E7   C68597FEFFFF11         mov     byte ptr [ebp+$FFFFFE97], $11
004E51EE   C68598FEFFFFBB         mov     byte ptr [ebp+$FFFFFE98], $BB
004E51F5   C68599FEFFFF01         mov     byte ptr [ebp+$FFFFFE99], $01
004E51FC   C6859AFEFFFF02         mov     byte ptr [ebp+$FFFFFE9A], $02
004E5203   C6859BFEFFFF21         mov     byte ptr [ebp+$FFFFFE9B], $21
004E520A   C6859CFEFFFF01         mov     byte ptr [ebp+$FFFFFE9C], $01
004E5211   C6859DFEFFFF11         mov     byte ptr [ebp+$FFFFFE9D], $11
004E5218   C6859EFEFFFF71         mov     byte ptr [ebp+$FFFFFE9E], $71
004E521F   C6859FFEFFFF01         mov     byte ptr [ebp+$FFFFFE9F], $01
004E5226   C685A0FEFFFF02         mov     byte ptr [ebp+$FFFFFEA0], $02
004E522D   C685A1FEFFFF22         mov     byte ptr [ebp+$FFFFFEA1], $22
004E5234   C685A2FEFFFF02         mov     byte ptr [ebp+$FFFFFEA2], $02
004E523B   C685A3FEFFFF11         mov     byte ptr [ebp+$FFFFFEA3], $11
004E5242   C685A4FEFFFFC1         mov     byte ptr [ebp+$FFFFFEA4], $C1
004E5249   C685A5FEFFFF01         mov     byte ptr [ebp+$FFFFFEA5], $01
004E5250   C685A6FEFFFF02         mov     byte ptr [ebp+$FFFFFEA6], $02
004E5257   C685A7FEFFFF24         mov     byte ptr [ebp+$FFFFFEA7], $24
004E525E   C685A8FEFFFF01         mov     byte ptr [ebp+$FFFFFEA8], $01
004E5265   C685A9FEFFFF11         mov     byte ptr [ebp+$FFFFFEA9], $11
004E526C   C685AAFEFFFFBD         mov     byte ptr [ebp+$FFFFFEAA], $BD
004E5273   C685ABFEFFFF01         mov     byte ptr [ebp+$FFFFFEAB], $01
004E527A   C685ACFEFFFF02         mov     byte ptr [ebp+$FFFFFEAC], $02
004E5281   C685ADFEFFFF25         mov     byte ptr [ebp+$FFFFFEAD], $25
004E5288   C685AEFEFFFF01         mov     byte ptr [ebp+$FFFFFEAE], $01
004E528F   C685AFFEFFFF12         mov     byte ptr [ebp+$FFFFFEAF], $12
004E5296   C685B0FEFFFFF0         mov     byte ptr [ebp+$FFFFFEB0], $F0
004E529D   C685B1FEFFFF01         mov     byte ptr [ebp+$FFFFFEB1], $01
004E52A4   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E52A9   8885B2FEFFFF           mov     [ebp+$FFFFFEB2], al
004E52AF   8D9504FEFFFF           lea     edx, [ebp+$FFFFFE04]
004E52B5   B9AE000000             mov     ecx, $000000AE
004E52BA   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E52BC   E87FDBFFFF             call    004E2E40
004E52C1   803DAA6E4F006C         cmp     byte ptr [$004F6EAA], $6C
004E52C8   750D                   jnz     004E52D7
004E52CA   803DAB6E4F00F1         cmp     byte ptr [$004F6EAB], $F1
004E52D1   0F848D0A0000           jz      004E5D64
004E52D7   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E52D9   E8EA420000             call    004E95C8
004E52DE   E9E90A0000             jmp     004E5DCC
004E52E3   68FF000000             push    $000000FF
004E52E8   C68580FDFFFF80         mov     byte ptr [ebp+$FFFFFD80], $80
004E52EF   C68581FDFFFF11         mov     byte ptr [ebp+$FFFFFD81], $11
004E52F6   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E52FB   888582FDFFFF           mov     [ebp+$FFFFFD82], al
004E5301   C68583FDFFFF7F         mov     byte ptr [ebp+$FFFFFD83], $7F
004E5308   C68584FDFFFF2C         mov     byte ptr [ebp+$FFFFFD84], $2C
004E530F   C68585FDFFFFF0         mov     byte ptr [ebp+$FFFFFD85], $F0
004E5316   C68586FDFFFF01         mov     byte ptr [ebp+$FFFFFD86], $01
004E531D   C68587FDFFFF01         mov     byte ptr [ebp+$FFFFFD87], $01
004E5324   C68588FDFFFF01         mov     byte ptr [ebp+$FFFFFD88], $01
004E532B   C68589FDFFFF0B         mov     byte ptr [ebp+$FFFFFD89], $0B
004E5332   C6858AFDFFFF01         mov     byte ptr [ebp+$FFFFFD8A], $01
004E5339   C6858BFDFFFF01         mov     byte ptr [ebp+$FFFFFD8B], $01
004E5340   C6858CFDFFFF02         mov     byte ptr [ebp+$FFFFFD8C], $02
004E5347   C6858DFDFFFF01         mov     byte ptr [ebp+$FFFFFD8D], $01
004E534E   C6858EFDFFFF0C         mov     byte ptr [ebp+$FFFFFD8E], $0C
004E5355   C6858FFDFFFF20         mov     byte ptr [ebp+$FFFFFD8F], $20
004E535C   C68590FDFFFF01         mov     byte ptr [ebp+$FFFFFD90], $01
004E5363   C68591FDFFFF03         mov     byte ptr [ebp+$FFFFFD91], $03
004E536A   C68592FDFFFF01         mov     byte ptr [ebp+$FFFFFD92], $01
004E5371   C68593FDFFFF0B         mov     byte ptr [ebp+$FFFFFD93], $0B
004E5378   C68594FDFFFF09         mov     byte ptr [ebp+$FFFFFD94], $09
004E537F   C68595FDFFFF01         mov     byte ptr [ebp+$FFFFFD95], $01
004E5386   C68596FDFFFF04         mov     byte ptr [ebp+$FFFFFD96], $04
004E538D   C68597FDFFFF03         mov     byte ptr [ebp+$FFFFFD97], $03
004E5394   C68598FDFFFF0B         mov     byte ptr [ebp+$FFFFFD98], $0B
004E539B   C68599FDFFFF12         mov     byte ptr [ebp+$FFFFFD99], $12
004E53A2   C6859AFDFFFF01         mov     byte ptr [ebp+$FFFFFD9A], $01
004E53A9   C6859BFDFFFF07         mov     byte ptr [ebp+$FFFFFD9B], $07
004E53B0   C6859CFDFFFF01         mov     byte ptr [ebp+$FFFFFD9C], $01
004E53B7   C6859DFDFFFF15         mov     byte ptr [ebp+$FFFFFD9D], $15
004E53BE   C6859EFDFFFF13         mov     byte ptr [ebp+$FFFFFD9E], $13
004E53C5   C6859FFDFFFF01         mov     byte ptr [ebp+$FFFFFD9F], $01
004E53CC   C685A0FDFFFF08         mov     byte ptr [ebp+$FFFFFDA0], $08
004E53D3   C685A1FDFFFF01         mov     byte ptr [ebp+$FFFFFDA1], $01
004E53DA   C685A2FDFFFF15         mov     byte ptr [ebp+$FFFFFDA2], $15
004E53E1   C685A3FDFFFF14         mov     byte ptr [ebp+$FFFFFDA3], $14
004E53E8   C685A4FDFFFF01         mov     byte ptr [ebp+$FFFFFDA4], $01
004E53EF   C685A5FDFFFF09         mov     byte ptr [ebp+$FFFFFDA5], $09
004E53F6   C685A6FDFFFF02         mov     byte ptr [ebp+$FFFFFDA6], $02
004E53FD   C685A7FDFFFF01         mov     byte ptr [ebp+$FFFFFDA7], $01
004E5404   C685A8FDFFFF16         mov     byte ptr [ebp+$FFFFFDA8], $16
004E540B   C685A9FDFFFF01         mov     byte ptr [ebp+$FFFFFDA9], $01
004E5412   C685AAFDFFFF0B         mov     byte ptr [ebp+$FFFFFDAA], $0B
004E5419   C685ABFDFFFF02         mov     byte ptr [ebp+$FFFFFDAB], $02
004E5420   C685ACFDFFFF04         mov     byte ptr [ebp+$FFFFFDAC], $04
004E5427   C685ADFDFFFF02         mov     byte ptr [ebp+$FFFFFDAD], $02
004E542E   C685AEFDFFFF01         mov     byte ptr [ebp+$FFFFFDAE], $01
004E5435   C685AFFDFFFF0D         mov     byte ptr [ebp+$FFFFFDAF], $0D
004E543C   C685B0FDFFFF02         mov     byte ptr [ebp+$FFFFFDB0], $02
004E5443   C685B1FDFFFF04         mov     byte ptr [ebp+$FFFFFDB1], $04
004E544A   C685B2FDFFFF06         mov     byte ptr [ebp+$FFFFFDB2], $06
004E5451   C685B3FDFFFF01         mov     byte ptr [ebp+$FFFFFDB3], $01
004E5458   C685B4FDFFFF0F         mov     byte ptr [ebp+$FFFFFDB4], $0F
004E545F   C685B5FDFFFF01         mov     byte ptr [ebp+$FFFFFDB5], $01
004E5466   C685B6FDFFFF0C         mov     byte ptr [ebp+$FFFFFDB6], $0C
004E546D   C685B7FDFFFF04         mov     byte ptr [ebp+$FFFFFDB7], $04
004E5474   C685B8FDFFFF01         mov     byte ptr [ebp+$FFFFFDB8], $01
004E547B   C685B9FDFFFF10         mov     byte ptr [ebp+$FFFFFDB9], $10
004E5482   C685BAFDFFFF01         mov     byte ptr [ebp+$FFFFFDBA], $01
004E5489   C685BBFDFFFF14         mov     byte ptr [ebp+$FFFFFDBB], $14
004E5490   C685BCFDFFFF09         mov     byte ptr [ebp+$FFFFFDBC], $09
004E5497   C685BDFDFFFF01         mov     byte ptr [ebp+$FFFFFDBD], $01
004E549E   C685BEFDFFFF11         mov     byte ptr [ebp+$FFFFFDBE], $11
004E54A5   C685BFFDFFFF02         mov     byte ptr [ebp+$FFFFFDBF], $02
004E54AC   C685C0FDFFFF04         mov     byte ptr [ebp+$FFFFFDC0], $04
004E54B3   C685C1FDFFFF12         mov     byte ptr [ebp+$FFFFFDC1], $12
004E54BA   C685C2FDFFFF01         mov     byte ptr [ebp+$FFFFFDC2], $01
004E54C1   C685C3FDFFFF13         mov     byte ptr [ebp+$FFFFFDC3], $13
004E54C8   C685C4FDFFFF02         mov     byte ptr [ebp+$FFFFFDC4], $02
004E54CF   C685C5FDFFFF04         mov     byte ptr [ebp+$FFFFFDC5], $04
004E54D6   C685C6FDFFFF16         mov     byte ptr [ebp+$FFFFFDC6], $16
004E54DD   C685C7FDFFFF01         mov     byte ptr [ebp+$FFFFFDC7], $01
004E54E4   C685C8FDFFFF15         mov     byte ptr [ebp+$FFFFFDC8], $15
004E54EB   C685C9FDFFFF02         mov     byte ptr [ebp+$FFFFFDC9], $02
004E54F2   C685CAFDFFFF05         mov     byte ptr [ebp+$FFFFFDCA], $05
004E54F9   C685CBFDFFFF02         mov     byte ptr [ebp+$FFFFFDCB], $02
004E5500   C685CCFDFFFF01         mov     byte ptr [ebp+$FFFFFDCC], $01
004E5507   C685CDFDFFFF17         mov     byte ptr [ebp+$FFFFFDCD], $17
004E550E   C685CEFDFFFF02         mov     byte ptr [ebp+$FFFFFDCE], $02
004E5515   C685CFFDFFFF05         mov     byte ptr [ebp+$FFFFFDCF], $05
004E551C   C685D0FDFFFF0A         mov     byte ptr [ebp+$FFFFFDD0], $0A
004E5523   C685D1FDFFFF01         mov     byte ptr [ebp+$FFFFFDD1], $01
004E552A   C685D2FDFFFF19         mov     byte ptr [ebp+$FFFFFDD2], $19
004E5531   C685D3FDFFFF03         mov     byte ptr [ebp+$FFFFFDD3], $03
004E5538   C685D4FDFFFF03         mov     byte ptr [ebp+$FFFFFDD4], $03
004E553F   C685D5FDFFFF01         mov     byte ptr [ebp+$FFFFFDD5], $01
004E5546   C685D6FDFFFF01         mov     byte ptr [ebp+$FFFFFDD6], $01
004E554D   C685D7FDFFFF1C         mov     byte ptr [ebp+$FFFFFDD7], $1C
004E5554   C685D8FDFFFF01         mov     byte ptr [ebp+$FFFFFDD8], $01
004E555B   C685D9FDFFFF03         mov     byte ptr [ebp+$FFFFFDD9], $03
004E5562   C685DAFDFFFF07         mov     byte ptr [ebp+$FFFFFDDA], $07
004E5569   C685DBFDFFFF01         mov     byte ptr [ebp+$FFFFFDDB], $01
004E5570   C685DCFDFFFF1D         mov     byte ptr [ebp+$FFFFFDDC], $1D
004E5577   C685DDFDFFFF01         mov     byte ptr [ebp+$FFFFFDDD], $01
004E557E   C685DEFDFFFF04         mov     byte ptr [ebp+$FFFFFDDE], $04
004E5585   C685DFFDFFFF09         mov     byte ptr [ebp+$FFFFFDDF], $09
004E558C   C685E0FDFFFF01         mov     byte ptr [ebp+$FFFFFDE0], $01
004E5593   C685E1FDFFFF1E         mov     byte ptr [ebp+$FFFFFDE1], $1E
004E559A   C685E2FDFFFF01         mov     byte ptr [ebp+$FFFFFDE2], $01
004E55A1   C685E3FDFFFF04         mov     byte ptr [ebp+$FFFFFDE3], $04
004E55A8   C685E4FDFFFF0D         mov     byte ptr [ebp+$FFFFFDE4], $0D
004E55AF   C685E5FDFFFF01         mov     byte ptr [ebp+$FFFFFDE5], $01
004E55B6   C685E6FDFFFF1F         mov     byte ptr [ebp+$FFFFFDE6], $1F
004E55BD   C685E7FDFFFF02         mov     byte ptr [ebp+$FFFFFDE7], $02
004E55C4   C685E8FDFFFF01         mov     byte ptr [ebp+$FFFFFDE8], $01
004E55CB   C685E9FDFFFF02         mov     byte ptr [ebp+$FFFFFDE9], $02
004E55D2   C685EAFDFFFF01         mov     byte ptr [ebp+$FFFFFDEA], $01
004E55D9   C685EBFDFFFF21         mov     byte ptr [ebp+$FFFFFDEB], $21
004E55E0   C685ECFDFFFF02         mov     byte ptr [ebp+$FFFFFDEC], $02
004E55E7   C685EDFDFFFF01         mov     byte ptr [ebp+$FFFFFDED], $01
004E55EE   C685EEFDFFFF04         mov     byte ptr [ebp+$FFFFFDEE], $04
004E55F5   C685EFFDFFFF01         mov     byte ptr [ebp+$FFFFFDEF], $01
004E55FC   C685F0FDFFFF23         mov     byte ptr [ebp+$FFFFFDF0], $23
004E5603   C685F1FDFFFF02         mov     byte ptr [ebp+$FFFFFDF1], $02
004E560A   C685F2FDFFFF01         mov     byte ptr [ebp+$FFFFFDF2], $01
004E5611   C685F3FDFFFF06         mov     byte ptr [ebp+$FFFFFDF3], $06
004E5618   C685F4FDFFFF01         mov     byte ptr [ebp+$FFFFFDF4], $01
004E561F   C685F5FDFFFF25         mov     byte ptr [ebp+$FFFFFDF5], $25
004E5626   C685F6FDFFFF02         mov     byte ptr [ebp+$FFFFFDF6], $02
004E562D   C685F7FDFFFF01         mov     byte ptr [ebp+$FFFFFDF7], $01
004E5634   C685F8FDFFFF08         mov     byte ptr [ebp+$FFFFFDF8], $08
004E563B   C685F9FDFFFF01         mov     byte ptr [ebp+$FFFFFDF9], $01
004E5642   C685FAFDFFFF27         mov     byte ptr [ebp+$FFFFFDFA], $27
004E5649   C685FBFDFFFF02         mov     byte ptr [ebp+$FFFFFDFB], $02
004E5650   C685FCFDFFFF01         mov     byte ptr [ebp+$FFFFFDFC], $01
004E5657   C685FDFDFFFF1C         mov     byte ptr [ebp+$FFFFFDFD], $1C
004E565E   C685FEFDFFFF01         mov     byte ptr [ebp+$FFFFFDFE], $01
004E5665   C685FFFDFFFF29         mov     byte ptr [ebp+$FFFFFDFF], $29
004E566C   C68500FEFFFF02         mov     byte ptr [ebp+$FFFFFE00], $02
004E5673   C68501FEFFFF01         mov     byte ptr [ebp+$FFFFFE01], $01
004E567A   C68502FEFFFF20         mov     byte ptr [ebp+$FFFFFE02], $20
004E5681   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E5686   888503FEFFFF           mov     [ebp+$FFFFFE03], al
004E568C   8D9580FDFFFF           lea     edx, [ebp+$FFFFFD80]
004E5692   B983000000             mov     ecx, $00000083
004E5697   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E5699   E8A2D7FFFF             call    004E2E40
004E569E   803D7F6E4F006C         cmp     byte ptr [$004F6E7F], $6C
004E56A5   750D                   jnz     004E56B4
004E56A7   803D806E4F00F0         cmp     byte ptr [$004F6E80], $F0
004E56AE   0F84B0060000           jz      004E5D64
004E56B4   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E56B6   E80D3F0000             call    004E95C8
004E56BB   E90C070000             jmp     004E5DCC
004E56C0   68FF000000             push    $000000FF
004E56C5   C68558FFFFFF80         mov     byte ptr [ebp+$FFFFFF58], $80
004E56CC   C68559FFFFFF18         mov     byte ptr [ebp+$FFFFFF59], $18
004E56D3   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E56D8   88855AFFFFFF           mov     [ebp+$FFFFFF5A], al
004E56DE   C6855BFFFFFF89         mov     byte ptr [ebp+$FFFFFF5B], $89
004E56E5   C6855CFFFFFF2C         mov     byte ptr [ebp+$FFFFFF5C], $2C
004E56EC   C6855DFFFFFFF0         mov     byte ptr [ebp+$FFFFFF5D], $F0
004E56F3   C6855EFFFFFF01         mov     byte ptr [ebp+$FFFFFF5E], $01
004E56FA   C6855FFFFFFF01         mov     byte ptr [ebp+$FFFFFF5F], $01
004E5701   C68560FFFFFF01         mov     byte ptr [ebp+$FFFFFF60], $01
004E5708   C68561FFFFFF01         mov     byte ptr [ebp+$FFFFFF61], $01
004E570F   C68562FFFFFF01         mov     byte ptr [ebp+$FFFFFF62], $01
004E5716   C68563FFFFFF01         mov     byte ptr [ebp+$FFFFFF63], $01
004E571D   C68564FFFFFF02         mov     byte ptr [ebp+$FFFFFF64], $02
004E5724   C68565FFFFFF01         mov     byte ptr [ebp+$FFFFFF65], $01
004E572B   C68566FFFFFF01         mov     byte ptr [ebp+$FFFFFF66], $01
004E5732   C68567FFFFFF02         mov     byte ptr [ebp+$FFFFFF67], $02
004E5739   C68568FFFFFF01         mov     byte ptr [ebp+$FFFFFF68], $01
004E5740   C68569FFFFFF03         mov     byte ptr [ebp+$FFFFFF69], $03
004E5747   C6856AFFFFFF01         mov     byte ptr [ebp+$FFFFFF6A], $01
004E574E   C6856BFFFFFF01         mov     byte ptr [ebp+$FFFFFF6B], $01
004E5755   C6856CFFFFFF03         mov     byte ptr [ebp+$FFFFFF6C], $03
004E575C   C6856DFFFFFF01         mov     byte ptr [ebp+$FFFFFF6D], $01
004E5763   C6856EFFFFFF04         mov     byte ptr [ebp+$FFFFFF6E], $04
004E576A   C6856FFFFFFF01         mov     byte ptr [ebp+$FFFFFF6F], $01
004E5771   C68570FFFFFF02         mov     byte ptr [ebp+$FFFFFF70], $02
004E5778   C68571FFFFFF01         mov     byte ptr [ebp+$FFFFFF71], $01
004E577F   C68572FFFFFF01         mov     byte ptr [ebp+$FFFFFF72], $01
004E5786   C68573FFFFFF05         mov     byte ptr [ebp+$FFFFFF73], $05
004E578D   C68574FFFFFF02         mov     byte ptr [ebp+$FFFFFF74], $02
004E5794   C68575FFFFFF02         mov     byte ptr [ebp+$FFFFFF75], $02
004E579B   C68576FFFFFF02         mov     byte ptr [ebp+$FFFFFF76], $02
004E57A2   C68577FFFFFF01         mov     byte ptr [ebp+$FFFFFF77], $01
004E57A9   C68578FFFFFF07         mov     byte ptr [ebp+$FFFFFF78], $07
004E57B0   C68579FFFFFF01         mov     byte ptr [ebp+$FFFFFF79], $01
004E57B7   C6857AFFFFFF02         mov     byte ptr [ebp+$FFFFFF7A], $02
004E57BE   C6857BFFFFFF04         mov     byte ptr [ebp+$FFFFFF7B], $04
004E57C5   C6857CFFFFFF01         mov     byte ptr [ebp+$FFFFFF7C], $01
004E57CC   C6857DFFFFFF08         mov     byte ptr [ebp+$FFFFFF7D], $08
004E57D3   C6857EFFFFFF02         mov     byte ptr [ebp+$FFFFFF7E], $02
004E57DA   C6857FFFFFFF03         mov     byte ptr [ebp+$FFFFFF7F], $03
004E57E1   C6458001               mov     byte ptr [ebp-$80], $01
004E57E5   C6458101               mov     byte ptr [ebp-$7F], $01
004E57E9   C645820A               mov     byte ptr [ebp-$7E], $0A
004E57ED   C6458302               mov     byte ptr [ebp-$7D], $02
004E57F1   C6458403               mov     byte ptr [ebp-$7C], $03
004E57F5   C6458503               mov     byte ptr [ebp-$7B], $03
004E57F9   C6458601               mov     byte ptr [ebp-$7A], $01
004E57FD   C645870C               mov     byte ptr [ebp-$79], $0C
004E5801   C6458802               mov     byte ptr [ebp-$78], $02
004E5805   C6458903               mov     byte ptr [ebp-$77], $03
004E5809   C6458A05               mov     byte ptr [ebp-$76], $05
004E580D   C6458B01               mov     byte ptr [ebp-$75], $01
004E5811   C6458C0E               mov     byte ptr [ebp-$74], $0E
004E5815   C6458D02               mov     byte ptr [ebp-$73], $02
004E5819   C6458E03               mov     byte ptr [ebp-$72], $03
004E581D   C6458F07               mov     byte ptr [ebp-$71], $07
004E5821   C6459001               mov     byte ptr [ebp-$70], $01
004E5825   C6459110               mov     byte ptr [ebp-$6F], $10
004E5829   C6459201               mov     byte ptr [ebp-$6E], $01
004E582D   C6459303               mov     byte ptr [ebp-$6D], $03
004E5831   C6459409               mov     byte ptr [ebp-$6C], $09
004E5835   C6459501               mov     byte ptr [ebp-$6B], $01
004E5839   C6459611               mov     byte ptr [ebp-$6A], $11
004E583D   C6459701               mov     byte ptr [ebp-$69], $01
004E5841   C6459803               mov     byte ptr [ebp-$68], $03
004E5845   C645990A               mov     byte ptr [ebp-$67], $0A
004E5849   C6459A01               mov     byte ptr [ebp-$66], $01
004E584D   C6459B12               mov     byte ptr [ebp-$65], $12
004E5851   C6459C02               mov     byte ptr [ebp-$64], $02
004E5855   C6459D03               mov     byte ptr [ebp-$63], $03
004E5859   C6459E0B               mov     byte ptr [ebp-$62], $0B
004E585D   C6459F01               mov     byte ptr [ebp-$61], $01
004E5861   C645A014               mov     byte ptr [ebp-$60], $14
004E5865   C645A101               mov     byte ptr [ebp-$5F], $01
004E5869   C645A203               mov     byte ptr [ebp-$5E], $03
004E586D   C645A30D               mov     byte ptr [ebp-$5D], $0D
004E5871   C645A401               mov     byte ptr [ebp-$5C], $01
004E5875   C645A515               mov     byte ptr [ebp-$5B], $15
004E5879   C645A601               mov     byte ptr [ebp-$5A], $01
004E587D   C645A703               mov     byte ptr [ebp-$59], $03
004E5881   C645A80E               mov     byte ptr [ebp-$58], $0E
004E5885   C645A901               mov     byte ptr [ebp-$57], $01
004E5889   C645AA16               mov     byte ptr [ebp-$56], $16
004E588D   C645AB01               mov     byte ptr [ebp-$55], $01
004E5891   C645AC04               mov     byte ptr [ebp-$54], $04
004E5895   C645AD01               mov     byte ptr [ebp-$53], $01
004E5899   C645AE01               mov     byte ptr [ebp-$52], $01
004E589D   C645AF17               mov     byte ptr [ebp-$51], $17
004E58A1   C645B002               mov     byte ptr [ebp-$50], $02
004E58A5   C645B104               mov     byte ptr [ebp-$4F], $04
004E58A9   C645B202               mov     byte ptr [ebp-$4E], $02
004E58AD   C645B301               mov     byte ptr [ebp-$4D], $01
004E58B1   C645B419               mov     byte ptr [ebp-$4C], $19
004E58B5   C645B502               mov     byte ptr [ebp-$4B], $02
004E58B9   C645B604               mov     byte ptr [ebp-$4A], $04
004E58BD   C645B704               mov     byte ptr [ebp-$49], $04
004E58C1   C645B801               mov     byte ptr [ebp-$48], $01
004E58C5   C645B91B               mov     byte ptr [ebp-$47], $1B
004E58C9   C645BA02               mov     byte ptr [ebp-$46], $02
004E58CD   C645BB04               mov     byte ptr [ebp-$45], $04
004E58D1   C645BC06               mov     byte ptr [ebp-$44], $06
004E58D5   C645BD01               mov     byte ptr [ebp-$43], $01
004E58D9   C645BE1D               mov     byte ptr [ebp-$42], $1D
004E58DD   C645BF02               mov     byte ptr [ebp-$41], $02
004E58E1   C645C004               mov     byte ptr [ebp-$40], $04
004E58E5   C645C108               mov     byte ptr [ebp-$3F], $08
004E58E9   C645C201               mov     byte ptr [ebp-$3E], $01
004E58ED   C645C31F               mov     byte ptr [ebp-$3D], $1F
004E58F1   C645C402               mov     byte ptr [ebp-$3C], $02
004E58F5   C645C504               mov     byte ptr [ebp-$3B], $04
004E58F9   C645C60A               mov     byte ptr [ebp-$3A], $0A
004E58FD   C645C701               mov     byte ptr [ebp-$39], $01
004E5901   C645C821               mov     byte ptr [ebp-$38], $21
004E5905   C645C902               mov     byte ptr [ebp-$37], $02
004E5909   C645CA04               mov     byte ptr [ebp-$36], $04
004E590D   C645CB0C               mov     byte ptr [ebp-$35], $0C
004E5911   C645CC01               mov     byte ptr [ebp-$34], $01
004E5915   C645CD23               mov     byte ptr [ebp-$33], $23
004E5919   C645CE02               mov     byte ptr [ebp-$32], $02
004E591D   C645CF04               mov     byte ptr [ebp-$31], $04
004E5921   C645D00E               mov     byte ptr [ebp-$30], $0E
004E5925   C645D101               mov     byte ptr [ebp-$2F], $01
004E5929   C645D225               mov     byte ptr [ebp-$2E], $25
004E592D   C645D302               mov     byte ptr [ebp-$2D], $02
004E5931   C645D404               mov     byte ptr [ebp-$2C], $04
004E5935   C645D510               mov     byte ptr [ebp-$2B], $10
004E5939   C645D601               mov     byte ptr [ebp-$2A], $01
004E593D   C645D727               mov     byte ptr [ebp-$29], $27
004E5941   C645D801               mov     byte ptr [ebp-$28], $01
004E5945   C645D906               mov     byte ptr [ebp-$27], $06
004E5949   C645DA01               mov     byte ptr [ebp-$26], $01
004E594D   C645DB01               mov     byte ptr [ebp-$25], $01
004E5951   C645DC28               mov     byte ptr [ebp-$24], $28
004E5955   C645DD01               mov     byte ptr [ebp-$23], $01
004E5959   C645DE06               mov     byte ptr [ebp-$22], $06
004E595D   C645DF03               mov     byte ptr [ebp-$21], $03
004E5961   C645E001               mov     byte ptr [ebp-$20], $01
004E5965   C645E129               mov     byte ptr [ebp-$1F], $29
004E5969   C645E201               mov     byte ptr [ebp-$1E], $01
004E596D   C645E306               mov     byte ptr [ebp-$1D], $06
004E5971   C645E404               mov     byte ptr [ebp-$1C], $04
004E5975   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E597A   8845E5                 mov     [ebp-$1B], al
004E597D   8D9558FFFFFF           lea     edx, [ebp+$FFFFFF58]
004E5983   B98D000000             mov     ecx, $0000008D
004E5988   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E598A   E8B1D4FFFF             call    004E2E40
004E598F   803D896E4F006C         cmp     byte ptr [$004F6E89], $6C
004E5996   750D                   jnz     004E59A5
004E5998   803D8A6E4F00F0         cmp     byte ptr [$004F6E8A], $F0
004E599F   0F84BF030000           jz      004E5D64
004E59A5   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E59A7   E81C3C0000             call    004E95C8
004E59AC   E91B040000             jmp     004E5DCC
004E59B1   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E59B3   8B8334030000           mov     eax, [ebx+$0334]
004E59B9   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E59BB   FF5164                 call    dword ptr [ecx+$64]
004E59BE   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E59C0   8B8328030000           mov     eax, [ebx+$0328]
004E59C6   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E59C8   FF5164                 call    dword ptr [ecx+$64]
004E59CB   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E59CD   8B8340030000           mov     eax, [ebx+$0340]
004E59D3   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E59D5   FF5164                 call    dword ptr [ecx+$64]
004E59D8   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E59DA   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E59E0   E8BFF9F4FF             call    004353A4
004E59E5   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E59E7   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E59ED   E896D1F8FF             call    00472B88
004E59F2   E96D030000             jmp     004E5D64
004E59F7   68FF000000             push    $000000FF
004E59FC   C68508FDFFFF80         mov     byte ptr [ebp+$FFFFFD08], $80
004E5A03   C68509FDFFFF28         mov     byte ptr [ebp+$FFFFFD09], $28
004E5A0A   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E5A0F   88850AFDFFFF           mov     [ebp+$FFFFFD0A], al
004E5A15   C6850BFDFFFF70         mov     byte ptr [ebp+$FFFFFD0B], $70
004E5A1C   C6850CFDFFFF3B         mov     byte ptr [ebp+$FFFFFD0C], $3B
004E5A23   C6850DFDFFFF01         mov     byte ptr [ebp+$FFFFFD0D], $01
004E5A2A   C6850EFDFFFF00         mov     byte ptr [ebp+$FFFFFD0E], $00
004E5A31   C6850FFDFFFFBB         mov     byte ptr [ebp+$FFFFFD0F], $BB
004E5A38   C68510FDFFFF07         mov     byte ptr [ebp+$FFFFFD10], $07
004E5A3F   C68511FDFFFF07         mov     byte ptr [ebp+$FFFFFD11], $07
004E5A46   C68512FDFFFF64         mov     byte ptr [ebp+$FFFFFD12], $64
004E5A4D   C68513FDFFFF07         mov     byte ptr [ebp+$FFFFFD13], $07
004E5A54   C68514FDFFFF00         mov     byte ptr [ebp+$FFFFFD14], $00
004E5A5B   C68515FDFFFFB1         mov     byte ptr [ebp+$FFFFFD15], $B1
004E5A62   C68516FDFFFF02         mov     byte ptr [ebp+$FFFFFD16], $02
004E5A69   C68517FDFFFF24         mov     byte ptr [ebp+$FFFFFD17], $24
004E5A70   C68518FDFFFFA3         mov     byte ptr [ebp+$FFFFFD18], $A3
004E5A77   C68519FDFFFF01         mov     byte ptr [ebp+$FFFFFD19], $01
004E5A7E   C6851AFDFFFFA2         mov     byte ptr [ebp+$FFFFFD1A], $A2
004E5A85   C6851BFDFFFF20         mov     byte ptr [ebp+$FFFFFD1B], $20
004E5A8C   C6851CFDFFFF20         mov     byte ptr [ebp+$FFFFFD1C], $20
004E5A93   C6851DFDFFFFA2         mov     byte ptr [ebp+$FFFFFD1D], $A2
004E5A9A   C6851EFDFFFF79         mov     byte ptr [ebp+$FFFFFD1E], $79
004E5AA1   C6851FFDFFFF22         mov     byte ptr [ebp+$FFFFFD1F], $22
004E5AA8   C68520FDFFFFA2         mov     byte ptr [ebp+$FFFFFD20], $A2
004E5AAF   C68521FDFFFF21         mov     byte ptr [ebp+$FFFFFD21], $21
004E5AB6   C68522FDFFFF1E         mov     byte ptr [ebp+$FFFFFD22], $1E
004E5ABD   C68523FDFFFF88         mov     byte ptr [ebp+$FFFFFD23], $88
004E5AC4   C68524FDFFFF00         mov     byte ptr [ebp+$FFFFFD24], $00
004E5ACB   C68525FDFFFF1E         mov     byte ptr [ebp+$FFFFFD25], $1E
004E5AD2   C68526FDFFFFDF         mov     byte ptr [ebp+$FFFFFD26], $DF
004E5AD9   C68527FDFFFF34         mov     byte ptr [ebp+$FFFFFD27], $34
004E5AE0   C68528FDFFFF51         mov     byte ptr [ebp+$FFFFFD28], $51
004E5AE7   C68529FDFFFFFE         mov     byte ptr [ebp+$FFFFFD29], $FE
004E5AEE   C6852AFDFFFF1E         mov     byte ptr [ebp+$FFFFFD2A], $1E
004E5AF5   C6852BFDFFFF1D         mov     byte ptr [ebp+$FFFFFD2B], $1D
004E5AFC   C6852CFDFFFF78         mov     byte ptr [ebp+$FFFFFD2C], $78
004E5B03   C6852DFDFFFF23         mov     byte ptr [ebp+$FFFFFD2D], $23
004E5B0A   C6852EFDFFFF1D         mov     byte ptr [ebp+$FFFFFD2E], $1D
004E5B11   C6852FFDFFFFD7         mov     byte ptr [ebp+$FFFFFD2F], $D7
004E5B18   C68530FDFFFFEF         mov     byte ptr [ebp+$FFFFFD30], $EF
004E5B1F   C68531FDFFFF51         mov     byte ptr [ebp+$FFFFFD31], $51
004E5B26   C68532FDFFFFF8         mov     byte ptr [ebp+$FFFFFD32], $F8
004E5B2D   C68533FDFFFF1F         mov     byte ptr [ebp+$FFFFFD33], $1F
004E5B34   C68534FDFFFF1C         mov     byte ptr [ebp+$FFFFFD34], $1C
004E5B3B   C68535FDFFFF08         mov     byte ptr [ebp+$FFFFFD35], $08
004E5B42   C68536FDFFFF02         mov     byte ptr [ebp+$FFFFFD36], $02
004E5B49   C68537FDFFFF1C         mov     byte ptr [ebp+$FFFFFD37], $1C
004E5B50   C68538FDFFFF67         mov     byte ptr [ebp+$FFFFFD38], $67
004E5B57   C68539FDFFFF01         mov     byte ptr [ebp+$FFFFFD39], $01
004E5B5E   C6853AFDFFFFAC         mov     byte ptr [ebp+$FFFFFD3A], $AC
004E5B65   C6853BFDFFFF20         mov     byte ptr [ebp+$FFFFFD3B], $20
004E5B6C   C6853CFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3C], $1C
004E5B73   C6853DFDFFFFA2         mov     byte ptr [ebp+$FFFFFD3D], $A2
004E5B7A   C6853EFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3E], $1C
004E5B81   C6853FFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3F], $1C
004E5B88   C68540FDFFFF38         mov     byte ptr [ebp+$FFFFFD40], $38
004E5B8F   C68541FDFFFF1E         mov     byte ptr [ebp+$FFFFFD41], $1E
004E5B96   C68542FDFFFF16         mov     byte ptr [ebp+$FFFFFD42], $16
004E5B9D   C68543FDFFFFA1         mov     byte ptr [ebp+$FFFFFD43], $A1
004E5BA4   C68544FDFFFF01         mov     byte ptr [ebp+$FFFFFD44], $01
004E5BAB   C68545FDFFFF01         mov     byte ptr [ebp+$FFFFFD45], $01
004E5BB2   C68546FDFFFF20         mov     byte ptr [ebp+$FFFFFD46], $20
004E5BB9   C68547FDFFFF71         mov     byte ptr [ebp+$FFFFFD47], $71
004E5BC0   C68548FDFFFF07         mov     byte ptr [ebp+$FFFFFD48], $07
004E5BC7   C68549FDFFFF1F         mov     byte ptr [ebp+$FFFFFD49], $1F
004E5BCE   C6854AFDFFFF09         mov     byte ptr [ebp+$FFFFFD4A], $09
004E5BD5   C6854BFDFFFF1F         mov     byte ptr [ebp+$FFFFFD4B], $1F
004E5BDC   C6854CFDFFFF20         mov     byte ptr [ebp+$FFFFFD4C], $20
004E5BE3   C6854DFDFFFF92         mov     byte ptr [ebp+$FFFFFD4D], $92
004E5BEA   C6854EFDFFFF1C         mov     byte ptr [ebp+$FFFFFD4E], $1C
004E5BF1   C6854FFDFFFF20         mov     byte ptr [ebp+$FFFFFD4F], $20
004E5BF8   C68550FDFFFF3A         mov     byte ptr [ebp+$FFFFFD50], $3A
004E5BFF   C68551FDFFFF22         mov     byte ptr [ebp+$FFFFFD51], $22
004E5C06   C68552FDFFFF03         mov     byte ptr [ebp+$FFFFFD52], $03
004E5C0D   C68553FDFFFF94         mov     byte ptr [ebp+$FFFFFD53], $94
004E5C14   C68554FDFFFF21         mov     byte ptr [ebp+$FFFFFD54], $21
004E5C1B   C68555FDFFFF20         mov     byte ptr [ebp+$FFFFFD55], $20
004E5C22   C68556FDFFFFB0         mov     byte ptr [ebp+$FFFFFD56], $B0
004E5C29   C68557FDFFFF20         mov     byte ptr [ebp+$FFFFFD57], $20
004E5C30   C68558FDFFFF22         mov     byte ptr [ebp+$FFFFFD58], $22
004E5C37   C68559FDFFFFC6         mov     byte ptr [ebp+$FFFFFD59], $C6
004E5C3E   C6855AFDFFFF1C         mov     byte ptr [ebp+$FFFFFD5A], $1C
004E5C45   C6855BFDFFFF22         mov     byte ptr [ebp+$FFFFFD5B], $22
004E5C4C   C6855CFDFFFFE0         mov     byte ptr [ebp+$FFFFFD5C], $E0
004E5C53   C6855DFDFFFF24         mov     byte ptr [ebp+$FFFFFD5D], $24
004E5C5A   C6855EFDFFFFB9         mov     byte ptr [ebp+$FFFFFD5E], $B9
004E5C61   C6855FFDFFFF07         mov     byte ptr [ebp+$FFFFFD5F], $07
004E5C68   C68560FDFFFF40         mov     byte ptr [ebp+$FFFFFD60], $40
004E5C6F   C68561FDFFFF9A         mov     byte ptr [ebp+$FFFFFD61], $9A
004E5C76   C68562FDFFFF40         mov     byte ptr [ebp+$FFFFFD62], $40
004E5C7D   C68563FDFFFF00         mov     byte ptr [ebp+$FFFFFD63], $00
004E5C84   C68564FDFFFFDF         mov     byte ptr [ebp+$FFFFFD64], $DF
004E5C8B   C68565FDFFFF15         mov     byte ptr [ebp+$FFFFFD65], $15
004E5C92   C68566FDFFFFA2         mov     byte ptr [ebp+$FFFFFD66], $A2
004E5C99   C68567FDFFFF79         mov     byte ptr [ebp+$FFFFFD67], $79
004E5CA0   C68568FDFFFF7C         mov     byte ptr [ebp+$FFFFFD68], $7C
004E5CA7   C68569FDFFFF88         mov     byte ptr [ebp+$FFFFFD69], $88
004E5CAE   C6856AFDFFFF00         mov     byte ptr [ebp+$FFFFFD6A], $00
004E5CB5   C6856BFDFFFF7C         mov     byte ptr [ebp+$FFFFFD6B], $7C
004E5CBC   C6856CFDFFFFD7         mov     byte ptr [ebp+$FFFFFD6C], $D7
004E5CC3   C6856DFDFFFF04         mov     byte ptr [ebp+$FFFFFD6D], $04
004E5CCA   C6856EFDFFFF07         mov     byte ptr [ebp+$FFFFFD6E], $07
004E5CD1   C6856FFDFFFF40         mov     byte ptr [ebp+$FFFFFD6F], $40
004E5CD8   C68570FDFFFF27         mov     byte ptr [ebp+$FFFFFD70], $27
004E5CDF   C68571FDFFFFA3         mov     byte ptr [ebp+$FFFFFD71], $A3
004E5CE6   C68572FDFFFF6B         mov     byte ptr [ebp+$FFFFFD72], $6B
004E5CED   C68573FDFFFF01         mov     byte ptr [ebp+$FFFFFD73], $01
004E5CF4   C68574FDFFFFA6         mov     byte ptr [ebp+$FFFFFD74], $A6
004E5CFB   C68575FDFFFF20         mov     byte ptr [ebp+$FFFFFD75], $20
004E5D02   C68576FDFFFF7C         mov     byte ptr [ebp+$FFFFFD76], $7C
004E5D09   C68577FDFFFFD9         mov     byte ptr [ebp+$FFFFFD77], $D9
004E5D10   C68578FDFFFF02         mov     byte ptr [ebp+$FFFFFD78], $02
004E5D17   C68579FDFFFF07         mov     byte ptr [ebp+$FFFFFD79], $07
004E5D1E   C6857AFDFFFF40         mov     byte ptr [ebp+$FFFFFD7A], $40
004E5D25   C6857BFDFFFFF0         mov     byte ptr [ebp+$FFFFFD7B], $F0
004E5D2C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E5D31   88857CFDFFFF           mov     [ebp+$FFFFFD7C], al
004E5D37   8D9508FDFFFF           lea     edx, [ebp+$FFFFFD08]
004E5D3D   B974000000             mov     ecx, $00000074
004E5D42   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E5D44   E8F7D0FFFF             call    004E2E40
004E5D49   803D706E4F007B         cmp     byte ptr [$004F6E70], $7B
004E5D50   7509                   jnz     004E5D5B
004E5D52   803D716E4F0001         cmp     byte ptr [$004F6E71], $01
004E5D59   7409                   jz      004E5D64
004E5D5B   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E5D5D   E866380000             call    004E95C8
004E5D62   EB68                   jmp     004E5DCC

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E5D64   8B831C030000           mov     eax, [ebx+$031C]

* Reference to field TMenuItem.Enabled : Boolean
|
004E5D6A   80783901               cmp     byte ptr [eax+$39], $01
004E5D6E   755C                   jnz     004E5DCC
004E5D70   33C9                   xor     ecx, ecx
004E5D72   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E5D74   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E5D77   E88C91F7FF             call    0045EF08
004E5D7C   33C9                   xor     ecx, ecx
004E5D7E   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E5D83   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E5D86   E87D91F7FF             call    0045EF08
004E5D8B   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Dvig : TLabel
|
004E5D8D   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5D93   E8ECA3F7FF             call    00460184
004E5D98   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AKPP : TLabel
|
004E5D9A   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5DA0   E8DFA3F7FF             call    00460184
004E5DA5   33D2                   xor     edx, edx

* Reference to control TForm1.Label_ABS : TLabel
|
004E5DA7   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5DAD   E8D2A3F7FF             call    00460184
004E5DB2   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Load : TLabel
|
004E5DB4   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5DBA   E8C5A3F7FF             call    00460184
004E5DBF   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004E5DC1   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5DC7   E8B8A3F7FF             call    00460184
004E5DCC   33C0                   xor     eax, eax
004E5DCE   5A                     pop     edx
004E5DCF   59                     pop     ecx
004E5DD0   59                     pop     ecx
004E5DD1   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '^[ãÂ]√¬ÌËÏ‡ÌËÂ, ÓÚ˜ÂÚ ÌÂ ÒÓı‡ÌˇÎÒˇ
|                                !'
|
004E5DD4   68EE5D4E00             push    $004E5DEE
004E5DD9   8D45E8                 lea     eax, [ebp-$18]
004E5DDC   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E5DE1   E86AECF1FF             call    00404A50
004E5DE6   C3                     ret


* Reference to: System.@HandleFinally;
|
004E5DE7   E9C0E5F1FF             jmp     004043AC
004E5DEC   EBEB                   jmp     004E5DD9

****** END
|
004E5DEE   5E                     pop     esi
004E5DEF   5B                     pop     ebx
004E5DF0   8BE5                   mov     esp, ebp
004E5DF2   5D                     pop     ebp
004E5DF3   C3                     ret

*)
end;

procedure TForm1.Button_ParametersClick(Sender : TObject);
begin
(*
004E6020   53                     push    ebx
004E6021   56                     push    esi
004E6022   8BD8                   mov     ebx, eax
004E6024   C60534724F0000         mov     byte ptr [$004F7234], $00

* Reference to TOptionsForm instance
|
004E602B   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E6030   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.InquireInterval : TSpinEdit
|
004E6032   8B800C030000           mov     eax, [eax+$030C]

* Reference to : TTimerSpeedButton._PROC_004C2644()
|
004E6038   E807C6FDFF             call    004C2644
004E603D   8BD0                   mov     edx, eax

* Reference to control TForm1.TimerParam : TTimer
|
004E603F   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetInterval(TTimer;Cardinal);
|
004E6045   E86AF3F4FF             call    004353B4
004E604A   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004E6051   741E                   jz      004E6071
004E6053   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E605A   7524                   jnz     004E6080
004E605C   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E6063   740C                   jz      004E6071

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E6065   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E606B   83780C02               cmp     dword ptr [eax+$0C], +$02
004E606F   750F                   jnz     004E6080

* Reference to TParamCaseForm instance
|
004E6071   A1DC584F00             mov     eax, dword ptr [$004F58DC]
004E6076   8B00                   mov     eax, [eax]
004E6078   8B10                   mov     edx, [eax]

* Reference to method TParamCaseForm.ShowModal()
|
004E607A   FF92EC000000           call    dword ptr [edx+$00EC]
004E6080   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004E6085   E8EEFAF1FF             call    00405B78
004E608A   85C0                   test    eax, eax
004E608C   7E6A                   jle     004E60F8

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E608E   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E6094   C7400C02000000         mov     dword ptr [eax+$0C], $00000002

* Reference to control TForm1.List_Param : TValueListEditor
|
004E609B   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004E60A1   E87EB0FAFF             call    00491124
004E60A6   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004E60A8   FF5244                 call    dword ptr [edx+$44]
004E60AB   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E60AD   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E60B3   E8D0CAF8FF             call    00472B88
004E60B8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E60BA   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E60C0   E8C3CAF8FF             call    00472B88
004E60C5   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E60C7   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E60CD   E8B6CAF8FF             call    00472B88
004E60D2   B201                   mov     dl, $01

* Reference to control TForm1.DriverIM : TMenuItem
|
004E60D4   8B8318040000           mov     eax, [ebx+$0418]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E60DA   E8A9CAF8FF             call    00472B88
004E60DF   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E60E6   7510                   jnz     004E60F8

* Reference to control TForm1.TimerParam : TTimer
|
004E60E8   8B8330030000           mov     eax, [ebx+$0330]
004E60EE   8BF0                   mov     esi, eax
004E60F0   8BD0                   mov     edx, eax

* Reference to field TTimer.OFFS_003C
|
004E60F2   8B463C                 mov     eax, [esi+$3C]

* Possible reference to virtual method TTimer.OFFS_38
|
004E60F5   FF5638                 call    dword ptr [esi+$38]
004E60F8   5E                     pop     esi
004E60F9   5B                     pop     ebx
004E60FA   C3                     ret

*)
end;

procedure TForm1.MenuItem_SettingClick(Sender : TObject);
begin
(*

* Reference to TOptionsForm instance
|
004E9530   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E9535   8B00                   mov     eax, [eax]
004E9537   8B10                   mov     edx, [eax]

* Reference to method TOptionsForm.ShowModal()
|
004E9539   FF92EC000000           call    dword ptr [edx+$00EC]
004E953F   C3                     ret

*)
end;

procedure TForm1.TimerTesterPresentTimer(Sender : TObject);
begin
(*
004E9540   83C4F0                 add     esp, -$10
004E9543   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E954A   753F                   jnz     004E958B
004E954C   6A12                   push    $12
004E954E   C644240480             mov     byte ptr [esp+$04], $80
004E9553   8A15A86D4F00           mov     dl, byte ptr [$004F6DA8]
004E9559   88542405               mov     [esp+$05], dl
004E955D   8A15A96D4F00           mov     dl, byte ptr [$004F6DA9]
004E9563   88542406               mov     [esp+$06], dl
004E9567   C644240701             mov     byte ptr [esp+$07], $01
004E956C   C64424083E             mov     byte ptr [esp+$08], $3E
004E9571   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E9577   88542409               mov     [esp+$09], dl
004E957B   8D542404               lea     edx, [esp+$04]
004E957F   B905000000             mov     ecx, $00000005

* Reference to : TForm1.WriteReadComm()
|
004E9584   E8B798FFFF             call    004E2E40
004E9589   EB38                   jmp     004E95C3
004E958B   6A12                   push    $12
004E958D   C644240C81             mov     byte ptr [esp+$0C], $81
004E9592   8A15A86D4F00           mov     dl, byte ptr [$004F6DA8]
004E9598   8854240D               mov     [esp+$0D], dl
004E959C   8A15A96D4F00           mov     dl, byte ptr [$004F6DA9]
004E95A2   8854240E               mov     [esp+$0E], dl
004E95A6   C644240F3E             mov     byte ptr [esp+$0F], $3E
004E95AB   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E95B1   88542410               mov     [esp+$10], dl
004E95B5   8D54240C               lea     edx, [esp+$0C]
004E95B9   B904000000             mov     ecx, $00000004

* Reference to : TForm1.WriteReadComm()
|
004E95BE   E87D98FFFF             call    004E2E40
004E95C3   83C410                 add     esp, +$10
004E95C6   C3                     ret

*)
end;

procedure TForm1.Disconnect(Sender : TObject);
begin
(*
004E95C8   53                     push    ebx
004E95C9   8BD8                   mov     ebx, eax
004E95CB   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004E95D2   0F849F000000           jz      004E9677
004E95D8   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004E95DA   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E95E0   E8BFBDF4FF             call    004353A4
004E95E5   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E95E7   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E95ED   E8B2BDF4FF             call    004353A4
004E95F2   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004E95F7   3B059C6D4F00           cmp     eax, [$004F6D9C]
004E95FD   7409                   jz      004E9608
004E95FF   833DA06D4F0000         cmp     dword ptr [$004F6DA0], +$00
004E9606   752D                   jnz     004E9635
004E9608   6814000400             push    $00040014
004E960D   68785B5400             push    $00545B78
004E9612   68FC5D5400             push    $00545DFC
004E9617   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E9619   E84AE2F1FF             call    00407868
004E961E   83F806                 cmp     eax, +$06
004E9621   7509                   jnz     004E962C
004E9623   C6051A724F0001         mov     byte ptr [$004F721A], $01
004E962A   EB34                   jmp     004E9660
004E962C   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E9633   EB2B                   jmp     004E9660
004E9635   6814000400             push    $00040014
004E963A   68785B5400             push    $00545B78
004E963F   682C5E5400             push    $00545E2C
004E9644   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E9646   E81DE2F1FF             call    00407868
004E964B   83F806                 cmp     eax, +$06
004E964E   7509                   jnz     004E9659
004E9650   C6051A724F0001         mov     byte ptr [$004F721A], $01
004E9657   EB07                   jmp     004E9660
004E9659   C6051A724F0000         mov     byte ptr [$004F721A], $00

* Reference to TGrafForm instance
|
004E9660   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004E9665   8B00                   mov     eax, [eax]

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004E9667   E8E43BF9FF             call    0047D250

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E966C   8B831C030000           mov     eax, [ebx+$031C]
004E9672   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E9674   FF5244                 call    dword ptr [edx+$44]
004E9677   5B                     pop     ebx
004E9678   C3                     ret

*)
end;

procedure TForm1.Button_ECUIdentClick(Sender : TObject);
begin
(*
004E9EF4   55                     push    ebp
004E9EF5   8BEC                   mov     ebp, esp
004E9EF7   83C4BC                 add     esp, -$44
004E9EFA   53                     push    ebx
004E9EFB   56                     push    esi
004E9EFC   57                     push    edi
004E9EFD   33C9                   xor     ecx, ecx
004E9EFF   894DC8                 mov     [ebp-$38], ecx
004E9F02   894DC4                 mov     [ebp-$3C], ecx
004E9F05   894DD0                 mov     [ebp-$30], ecx
004E9F08   894DCC                 mov     [ebp-$34], ecx
004E9F0B   894DD4                 mov     [ebp-$2C], ecx
004E9F0E   894DD8                 mov     [ebp-$28], ecx
004E9F11   894DF4                 mov     [ebp-$0C], ecx
004E9F14   8945FC                 mov     [ebp-$04], eax
004E9F17   33C0                   xor     eax, eax
004E9F19   55                     push    ebp

* Possible String Reference to: 'È)ûÒˇÎ„_^[ãÂ]√Œ¯Ë·Í‡'
|
004E9F1A   687EA54E00             push    $004EA57E

***** TRY
|
004E9F1F   64FF30                 push    dword ptr fs:[eax]
004E9F22   648920                 mov     fs:[eax], esp

* Reference to Form1
|
004E9F25   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E9F28   8B8020030000           mov     eax, [eax+$0320]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004E9F2E   E8F171FAFF             call    00491124
004E9F33   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004E9F35   FF5244                 call    dword ptr [edx+$44]

* Reference to Form1
|
004E9F38   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E9F3B   8B8020030000           mov     eax, [eax+$0320]
004E9F41   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9F43   E83C62F7FF             call    00460184

* Reference to Form1
|
004E9F48   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Param : TValueListEditor
|
004E9F4B   8B8024030000           mov     eax, [eax+$0324]
004E9F51   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9F53   E82C62F7FF             call    00460184

* Reference to Form1
|
004E9F58   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.Panel_DTC : TPanel
|
004E9F5B   8B8044030000           mov     eax, [eax+$0344]
004E9F61   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9F63   E81C62F7FF             call    00460184

* Reference to Form1
|
004E9F68   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerParam : TTimer
|
004E9F6B   8B8030030000           mov     eax, [eax+$0330]
004E9F71   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E9F73   E82CB4F4FF             call    004353A4
004E9F78   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E9F7F   7527                   jnz     004E9FA8
004E9F81   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9F86   2C11                   sub     al, $11
004E9F88   7404                   jz      004E9F8E
004E9F8A   2C02                   sub     al, $02
004E9F8C   751A                   jnz     004E9FA8
004E9F8E   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E9F95   7511                   jnz     004E9FA8
004E9F97   C60524724F0000         mov     byte ptr [$004F7224], $00

* Reference to Form1
|
004E9F9E   A1646D4F00             mov     eax, dword ptr [$004F6D64]

* Reference to : TForm1.SecurityAccess()
|
004E9FA3   E87C2C0000             call    004ECC24
004E9FA8   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E9FAF   0F85CD020000           jnz     004EA282
004E9FB5   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E9FBC   0F84C0020000           jz      004EA282
004E9FC2   803D25724F0000         cmp     byte ptr [$004F7225], $00
004E9FC9   0F85B3020000           jnz     004EA282

* Reference to: kernel32.GetTickCount()
|
004E9FCF   E87CD0F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004E9FD4   A3986D4F00             mov     dword ptr [$004F6D98], eax
004E9FD9   EB0C                   jmp     004E9FE7

* Reference to TApplication instance
|
004E9FDB   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004E9FE0   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004E9FE2   E8FD67F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004E9FE7   E864D0F1FF             call    00407050
004E9FEC   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004E9FF2   3DC8000000             cmp     eax, $000000C8
004E9FF7   72E2                   jb      004E9FDB
004E9FF9   33C0                   xor     eax, eax
004E9FFB   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA000   83F841                 cmp     eax, +$41
004EA003   7F1C                   jnle    004EA021
004EA005   742D                   jz      004EA034
004EA007   83C0EF                 add     eax, -$11
004EA00A   83E804                 sub     eax, +$04
004EA00D   7225                   jb      004EA034
004EA00F   83C0F4                 add     eax, -$0C
004EA012   83E802                 sub     eax, +$02
004EA015   721D                   jb      004EA034
004EA017   83E80F                 sub     eax, +$0F
004EA01A   7456                   jz      004EA072
004EA01C   E9D1000000             jmp     004EA0F2
004EA021   83E842                 sub     eax, +$42
004EA024   0F8487000000           jz      004EA0B1
004EA02A   48                     dec     eax
004EA02B   83E802                 sub     eax, +$02
004EA02E   0F83BE000000           jnb     004EA0F2
004EA034   68FF000000             push    $000000FF
004EA039   C645EC82               mov     byte ptr [ebp-$14], $82
004EA03D   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA042   8845ED                 mov     [ebp-$13], al
004EA045   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA04A   8845EE                 mov     [ebp-$12], al
004EA04D   C645EF1A               mov     byte ptr [ebp-$11], $1A
004EA051   C645F080               mov     byte ptr [ebp-$10], $80
004EA055   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA05A   8845F1                 mov     [ebp-$0F], al
004EA05D   8D55EC                 lea     edx, [ebp-$14]
004EA060   B905000000             mov     ecx, $00000005

* Reference to Form1
|
004EA065   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA068   E8D38DFFFF             call    004E2E40
004EA06D   E980000000             jmp     004EA0F2
004EA072   68FF000000             push    $000000FF
004EA077   C645E480               mov     byte ptr [ebp-$1C], $80
004EA07B   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA080   8845E5                 mov     [ebp-$1B], al
004EA083   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA088   8845E6                 mov     [ebp-$1A], al
004EA08B   C645E702               mov     byte ptr [ebp-$19], $02
004EA08F   C645E81A               mov     byte ptr [ebp-$18], $1A
004EA093   C645E991               mov     byte ptr [ebp-$17], $91
004EA097   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA09C   8845EA                 mov     [ebp-$16], al
004EA09F   8D55E4                 lea     edx, [ebp-$1C]
004EA0A2   B906000000             mov     ecx, $00000006

* Reference to Form1
|
004EA0A7   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA0AA   E8918DFFFF             call    004E2E40
004EA0AF   EB41                   jmp     004EA0F2
004EA0B1   68FF000000             push    $000000FF
004EA0B6   C645DC84               mov     byte ptr [ebp-$24], $84
004EA0BA   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA0BF   8845DD                 mov     [ebp-$23], al
004EA0C2   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA0C7   8845DE                 mov     [ebp-$22], al
004EA0CA   C645DFB1               mov     byte ptr [ebp-$21], $B1
004EA0CE   C645E003               mov     byte ptr [ebp-$20], $03
004EA0D2   C645E100               mov     byte ptr [ebp-$1F], $00
004EA0D6   C645E200               mov     byte ptr [ebp-$1E], $00
004EA0DA   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA0DF   8845E3                 mov     [ebp-$1D], al
004EA0E2   8D55DC                 lea     edx, [ebp-$24]
004EA0E5   B907000000             mov     ecx, $00000007

* Reference to Form1
|
004EA0EA   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA0ED   E84E8DFFFF             call    004E2E40
004EA0F2   33F6                   xor     esi, esi
004EA0F4   803DA76D4F0041         cmp     byte ptr [$004F6DA7], $41
004EA0FB   751D                   jnz     004EA11A
004EA0FD   8D4609                 lea     eax, [esi+$09]
004EA100   80B8F86D4F007F         cmp     byte ptr [eax+$4F6DF8], $7F
004EA107   7511                   jnz     004EA11A
004EA109   8D460B                 lea     eax, [esi+$0B]
004EA10C   80B8F86D4F0078         cmp     byte ptr [eax+$4F6DF8], $78
004EA113   7505                   jnz     004EA11A
004EA115   83C607                 add     esi, +$07
004EA118   EBDA                   jmp     004EA0F4
004EA11A   803DA76D4F0011         cmp     byte ptr [$004F6DA7], $11
004EA121   750D                   jnz     004EA130
004EA123   803D016E4F00A5         cmp     byte ptr [$004F6E01], $A5
004EA12A   0F85C3000000           jnz     004EA1F3
004EA130   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004EA137   750D                   jnz     004EA146
004EA139   803D016E4F0050         cmp     byte ptr [$004F6E01], $50
004EA140   0F85AD000000           jnz     004EA1F3
004EA146   803DA76D4F0013         cmp     byte ptr [$004F6DA7], $13
004EA14D   750D                   jnz     004EA15C
004EA14F   803D016E4F00A5         cmp     byte ptr [$004F6E01], $A5
004EA156   0F8597000000           jnz     004EA1F3
004EA15C   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EA163   750D                   jnz     004EA172
004EA165   803D016E4F0081         cmp     byte ptr [$004F6E01], $81
004EA16C   0F8581000000           jnz     004EA1F3
004EA172   803DA76D4F0021         cmp     byte ptr [$004F6DA7], $21
004EA179   7509                   jnz     004EA184
004EA17B   803D016E4F0063         cmp     byte ptr [$004F6E01], $63
004EA182   756F                   jnz     004EA1F3
004EA184   803DA76D4F0022         cmp     byte ptr [$004F6DA7], $22
004EA18B   7509                   jnz     004EA196
004EA18D   803D016E4F0076         cmp     byte ptr [$004F6E01], $76
004EA194   755D                   jnz     004EA1F3
004EA196   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EA19D   7509                   jnz     004EA1A8
004EA19F   803D026E4F0012         cmp     byte ptr [$004F6E02], $12
004EA1A6   754B                   jnz     004EA1F3
004EA1A8   803DA76D4F0041         cmp     byte ptr [$004F6DA7], $41
004EA1AF   750C                   jnz     004EA1BD
004EA1B1   8D4606                 lea     eax, [esi+$06]
004EA1B4   80B8F86D4F009E         cmp     byte ptr [eax+$4F6DF8], $9E
004EA1BB   7536                   jnz     004EA1F3
004EA1BD   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004EA1C4   7509                   jnz     004EA1CF
004EA1C6   803D006E4F008D         cmp     byte ptr [$004F6E00], $8D
004EA1CD   7524                   jnz     004EA1F3
004EA1CF   803DA76D4F0043         cmp     byte ptr [$004F6DA7], $43
004EA1D6   7509                   jnz     004EA1E1
004EA1D8   803DFE6D4F00A3         cmp     byte ptr [$004F6DFE], $A3
004EA1DF   7512                   jnz     004EA1F3
004EA1E1   803DA76D4F0044         cmp     byte ptr [$004F6DA7], $44
004EA1E8   7532                   jnz     004EA21C
004EA1EA   803DFE6D4F009F         cmp     byte ptr [$004F6DFE], $9F
004EA1F1   7429                   jz      004EA21C

* Reference to Form1
|
004EA1F3   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EA1F6   8B801C030000           mov     eax, [eax+$031C]
004EA1FC   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EA1FE   FF5244                 call    dword ptr [edx+$44]
004EA201   6810000400             push    $00040010
004EA206   68785B5400             push    $00545B78
004EA20B   68845E5400             push    $00545E84
004EA210   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EA212   E851D6F1FF             call    00407868
004EA217   E93F030000             jmp     004EA55B
004EA21C   C605FA6D4F0000         mov     byte ptr [$004F6DFA], $00
004EA223   BA01000000             mov     edx, $00000001
004EA228   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EA22D   E80692F1FF             call    00403438

|
004EA232   E87D86F1FF             call    004028B4
004EA237   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EA23E   BBCC1D4F00             mov     ebx, $004F1DCC
004EA243   8A03                   mov     al, byte ptr [ebx]
004EA245   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EA24B   7522                   jnz     004EA26F
004EA24D   68CC6D4F00             push    $004F6DCC
004EA252   8B4B0C                 mov     ecx, [ebx+$0C]
004EA255   8B4308                 mov     eax, [ebx+$08]
004EA258   03C6                   add     eax, esi
004EA25A   8D90F86D4F00           lea     edx, [eax+$4F6DF8]
004EA260   B8006F4F00             mov     eax, $004F6F00

|
004EA265   E8E68DF1FF             call    00403050

|
004EA26A   E84586F1FF             call    004028B4
004EA26F   FF45F8                 inc     dword ptr [ebp-$08]
004EA272   83C318                 add     ebx, +$18
004EA275   837DF834               cmp     dword ptr [ebp-$08], +$34
004EA279   75C8                   jnz     004EA243
004EA27B   C60525724F0001         mov     byte ptr [$004F7225], $01
004EA282   BA01000000             mov     edx, $00000001
004EA287   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004EA28C   E87F91F1FF             call    00403410

|
004EA291   E81E86F1FF             call    004028B4
004EA296   68CC6D4F00             push    $004F6DCC
004EA29B   BAF86D4F00             mov     edx, $004F6DF8
004EA2A0   B980000000             mov     ecx, $00000080
004EA2A5   B8006F4F00             mov     eax, $004F6F00

|
004EA2AA   E8818DF1FF             call    00403030

|
004EA2AF   E80086F1FF             call    004028B4

* Reference to Form1
|
004EA2B4   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA2B7   8B8020030000           mov     eax, [eax+$0320]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EA2BD   E8626EFAFF             call    00491124
004EA2C2   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EA2C4   FF5244                 call    dword ptr [edx+$44]

* Reference to Form1
|
004EA2C7   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.Panel_Knopki : TPanel
|
004EA2CA   8B80FC020000           mov     eax, [eax+$02FC]

* Reference to field TPanel.Tag : Longint
|
004EA2D0   C7400C01000000         mov     dword ptr [eax+$0C], $00000001
004EA2D7   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EA2DE   BBCC1D4F00             mov     ebx, $004F1DCC
004EA2E3   8A03                   mov     al, byte ptr [ebx]
004EA2E5   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EA2EB   0F85B6000000           jnz     004EA3A7
004EA2F1   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EA2F4   E833A7F1FF             call    00404A2C
004EA2F9   8B4314                 mov     eax, [ebx+$14]
004EA2FC   8BF8                   mov     edi, eax
004EA2FE   037B0C                 add     edi, [ebx+$0C]
004EA301   4F                     dec     edi
004EA302   2BF8                   sub     edi, eax
004EA304   7C6F                   jl      004EA375
004EA306   47                     inc     edi
004EA307   8DB0F86D4F00           lea     esi, [eax+$4F6DF8]
004EA30D   8B4310                 mov     eax, [ebx+$10]
004EA310   48                     dec     eax
004EA311   7408                   jz      004EA31B
004EA313   48                     dec     eax
004EA314   741C                   jz      004EA332
004EA316   48                     dec     eax
004EA317   7437                   jz      004EA350
004EA319   EB56                   jmp     004EA371
004EA31B   8D45D8                 lea     eax, [ebp-$28]
004EA31E   8A16                   mov     dl, byte ptr [esi]

* Reference to: System.@LStrFromChar(String;String;Char);
|
004EA320   E8EFA8F1FF             call    00404C14
004EA325   8B55D8                 mov     edx, [ebp-$28]
004EA328   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrCat;
|
004EA32B   E8C4A9F1FF             call    00404CF4
004EA330   EB3F                   jmp     004EA371
004EA332   8D4DD4                 lea     ecx, [ebp-$2C]
004EA335   33C0                   xor     eax, eax
004EA337   8A06                   mov     al, byte ptr [esi]
004EA339   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EA33E   E891EEF1FF             call    004091D4
004EA343   8B55D4                 mov     edx, [ebp-$2C]
004EA346   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrCat;
|
004EA349   E8A6A9F1FF             call    00404CF4
004EA34E   EB21                   jmp     004EA371
004EA350   8B4314                 mov     eax, [ebx+$14]
004EA353   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004EA35A   C1E008                 shl     eax, $08
004EA35D   8B5314                 mov     edx, [ebx+$14]
004EA360   0FB692F96D4F00         movzx   edx, byte ptr [edx+$4F6DF9]
004EA367   03C2                   add     eax, edx
004EA369   8D55F4                 lea     edx, [ebp-$0C]

* Reference to: SysUtils.IntToStr(Integer):AnsiString;overload;
|
004EA36C   E84FEDF1FF             call    004090C0
004EA371   46                     inc     esi
004EA372   4F                     dec     edi
004EA373   7598                   jnz     004EA30D
004EA375   8B4314                 mov     eax, [ebx+$14]
004EA378   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EA37E   2C20                   sub     al, $20
004EA380   7404                   jz      004EA386
004EA382   2CDF                   sub     al, $DF
004EA384   750D                   jnz     004EA393
004EA386   8D45F4                 lea     eax, [ebp-$0C]
004EA389   BAA4585400             mov     edx, $005458A4

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EA38E   E831A7F1FF             call    00404AC4

* Reference to Form1
|
004EA393   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA396   8B8020030000           mov     eax, [eax+$0320]
004EA39C   8B4DF4                 mov     ecx, [ebp-$0C]
004EA39F   8B5304                 mov     edx, [ebx+$04]

* Reference to: ValEdit.TValueListEditor.SetValue(TValueListEditor;AnsiString;AnsiString);
|
004EA3A2   E8796CFAFF             call    00491020
004EA3A7   FF45F8                 inc     dword ptr [ebp-$08]
004EA3AA   83C318                 add     ebx, +$18
004EA3AD   837DF834               cmp     dword ptr [ebp-$08], +$34
004EA3B1   0F852CFFFFFF           jnz     004EA2E3
004EA3B7   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA3BE   0F858A000000           jnz     004EA44E
004EA3C4   A1806D4F00             mov     eax, dword ptr [$004F6D80]
004EA3C9   33D2                   xor     edx, edx
004EA3CB   52                     push    edx
004EA3CC   50                     push    eax
004EA3CD   8D45CC                 lea     eax, [ebp-$34]

|
004EA3D0   E8D7EDF1FF             call    004091AC
004EA3D5   8B4DCC                 mov     ecx, [ebp-$34]
004EA3D8   8D45D0                 lea     eax, [ebp-$30]
004EA3DB   BAD4585400             mov     edx, $005458D4

* Reference to: System.@LStrCat3;
|
004EA3E0   E853A9F1FF             call    00404D38
004EA3E5   8B45D0                 mov     eax, [ebp-$30]
004EA3E8   50                     push    eax

* Reference to Form1
|
004EA3E9   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA3EC   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA3F2   8B8008020000           mov     eax, [eax+$0208]
004EA3F8   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA3FD   E89657F5FF             call    0043FB98
004EA402   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA403   E8EC56F5FF             call    0043FAF4
004EA408   8D4DC4                 lea     ecx, [ebp-$3C]
004EA40B   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]

* Reference to Form1
|
004EA411   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.PreobrTipECU()
|
004EA414   E8B38BFFFF             call    004E2FCC
004EA419   8B4DC4                 mov     ecx, [ebp-$3C]
004EA41C   8D45C8                 lea     eax, [ebp-$38]
004EA41F   BAEC585400             mov     edx, $005458EC

* Reference to: System.@LStrCat3;
|
004EA424   E80FA9F1FF             call    00404D38
004EA429   8B45C8                 mov     eax, [ebp-$38]
004EA42C   50                     push    eax

* Reference to Form1
|
004EA42D   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA430   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA436   8B8008020000           mov     eax, [eax+$0208]
004EA43C   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA441   E85257F5FF             call    0043FB98
004EA446   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA447   E8A856F5FF             call    0043FAF4
004EA44C   EB20                   jmp     004EA46E

* Reference to Form1
|
004EA44E   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA451   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA457   8B8008020000           mov     eax, [eax+$0208]
004EA45D   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA462   E83157F5FF             call    0043FB98
004EA467   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA469   E88656F5FF             call    0043FAF4
004EA46E   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA475   0F85E0000000           jnz     004EA55B
004EA47B   803DA76D4F0040         cmp     byte ptr [$004F6DA7], $40
004EA482   0F86D3000000           jbe     004EA55B
004EA488   6A0F                   push    $0F
004EA48A   C645BC81               mov     byte ptr [ebp-$44], $81
004EA48E   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA493   8845BD                 mov     [ebp-$43], al
004EA496   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA49B   8845BE                 mov     [ebp-$42], al
004EA49E   C645BF82               mov     byte ptr [ebp-$41], $82
004EA4A2   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA4A7   8845C0                 mov     [ebp-$40], al
004EA4AA   8D55BC                 lea     edx, [ebp-$44]
004EA4AD   B904000000             mov     ecx, $00000004

* Reference to Form1
|
004EA4B2   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA4B5   E88689FFFF             call    004E2E40
004EA4BA   68F4010000             push    $000001F4

* Reference to: kernel32.Sleep()
|
004EA4BF   E8B83EF2FF             call    0040E37C
004EA4C4   33C0                   xor     eax, eax
004EA4C6   8945F8                 mov     [ebp-$08], eax
004EA4C9   FF45F8                 inc     dword ptr [ebp-$08]
004EA4CC   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA4D1   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EA4D2   E8E9C9F1FF             call    00406EC0
004EA4D7   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA4DC   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA4DD   E89A3EF2FF             call    0040E37C
004EA4E2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA4E7   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EA4E8   E823CCF1FF             call    00407110
004EA4ED   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA4F2   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA4F3   E8843EF2FF             call    0040E37C
004EA4F8   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA4FD   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EA4FE   E8BDC9F1FF             call    00406EC0
004EA503   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA508   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA509   E86E3EF2FF             call    0040E37C
004EA50E   6A0F                   push    $0F
004EA510   C645BC81               mov     byte ptr [ebp-$44], $81
004EA514   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA519   8845BD                 mov     [ebp-$43], al
004EA51C   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA521   8845BE                 mov     [ebp-$42], al
004EA524   C645BF81               mov     byte ptr [ebp-$41], $81
004EA528   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA52D   8845C0                 mov     [ebp-$40], al
004EA530   8D55BC                 lea     edx, [ebp-$44]
004EA533   B904000000             mov     ecx, $00000004

* Reference to Form1
|
004EA538   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA53B   E80089FFFF             call    004E2E40
004EA540   803D006E4F00C1         cmp     byte ptr [$004F6E00], $C1
004EA547   7412                   jz      004EA55B
004EA549   837DF802               cmp     dword ptr [ebp-$08], +$02
004EA54D   0F8E76FFFFFF           jle     004EA4C9

* Reference to Form1
|
004EA553   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.Disconnect()
|
004EA556   E86DF0FFFF             call    004E95C8
004EA55B   33C0                   xor     eax, eax
004EA55D   5A                     pop     edx
004EA55E   59                     pop     ecx
004EA55F   59                     pop     ecx
004EA560   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[ãÂ]√Œ¯Ë·Í‡'
|
004EA563   6885A54E00             push    $004EA585
004EA568   8D45C4                 lea     eax, [ebp-$3C]
004EA56B   BA06000000             mov     edx, $00000006

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EA570   E8DBA4F1FF             call    00404A50
004EA575   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EA578   E8AFA4F1FF             call    00404A2C
004EA57D   C3                     ret


* Reference to: System.@HandleFinally;
|
004EA57E   E9299EF1FF             jmp     004043AC
004EA583   EBE3                   jmp     004EA568

****** END
|
004EA585   5F                     pop     edi
004EA586   5E                     pop     esi
004EA587   5B                     pop     ebx
004EA588   8BE5                   mov     esp, ebp
004EA58A   5D                     pop     ebp
004EA58B   C3                     ret

*)
end;

procedure TForm1.MenuItem_StopClick(Sender : TObject);
begin
(*
004EBE14   55                     push    ebp
004EBE15   8BEC                   mov     ebp, esp
004EBE17   B904000000             mov     ecx, $00000004
004EBE1C   6A00                   push    $00
004EBE1E   6A00                   push    $00
004EBE20   49                     dec     ecx
004EBE21   75F9                   jnz     004EBE1C
004EBE23   51                     push    ecx
004EBE24   53                     push    ebx
004EBE25   8BD8                   mov     ebx, eax
004EBE27   33C0                   xor     eax, eax
004EBE29   55                     push    ebp

* Possible String Reference to: 'È≤ÅÒˇÎﬁ[ãÂ]√'
|
004EBE2A   68F5C14E00             push    $004EC1F5

***** TRY
|
004EBE2F   64FF30                 push    dword ptr fs:[eax]
004EBE32   648920                 mov     fs:[eax], esp
004EBE35   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EBE37   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBE3D   E8466DF8FF             call    00472B88
004EBE42   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004EBE44   8B8328030000           mov     eax, [ebx+$0328]
004EBE4A   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EBE4C   FF5164                 call    dword ptr [ecx+$64]
004EBE4F   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004EBE51   8B8334030000           mov     eax, [ebx+$0334]
004EBE57   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EBE59   FF5164                 call    dword ptr [ecx+$64]
004EBE5C   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004EBE5E   8B8340030000           mov     eax, [ebx+$0340]
004EBE64   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EBE66   FF5164                 call    dword ptr [ecx+$64]
004EBE69   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004EBE6B   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004EBE71   E82E6EF8FF             call    00472CA4
004EBE76   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004EBE78   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004EBE7E   E8216EF8FF             call    00472CA4
004EBE83   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Start : TMenuItem
|
004EBE85   8B8318030000           mov     eax, [ebx+$0318]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBE8B   E8F86CF8FF             call    00472B88
004EBE90   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Setting : TMenuItem
|
004EBE92   8B8354030000           mov     eax, [ebx+$0354]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBE98   E8EB6CF8FF             call    00472B88
004EBE9D   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Load : TMenuItem
|
004EBE9F   8B830C030000           mov     eax, [ebx+$030C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBEA5   E8DE6CF8FF             call    00472B88
004EBEAA   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Test : TMenuItem
|
004EBEAC   8B8350030000           mov     eax, [ebx+$0350]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBEB2   E8D16CF8FF             call    00472B88
004EBEB7   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EBEB9   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBEBF   E8C46CF8FF             call    00472B88
004EBEC4   833DC86D4F0002         cmp     dword ptr [$004F6DC8], +$02
004EBECB   7E0D                   jle     004EBEDA
004EBECD   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004EBECF   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EBED5   E8AE6CF8FF             call    00472B88
004EBEDA   C6051F724F0000         mov     byte ptr [$004F721F], $00
004EBEE1   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EBEE3   E89424F2FF             call    0040E37C
004EBEE8   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EBEED   04CF                   add     al, -$31
004EBEEF   2C02                   sub     al, $02
004EBEF1   7233                   jb      004EBF26
004EBEF3   6A0C                   push    $0C
004EBEF5   C645F881               mov     byte ptr [ebp-$08], $81
004EBEF9   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EBEFE   8845F9                 mov     [ebp-$07], al
004EBF01   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EBF06   8845FA                 mov     [ebp-$06], al
004EBF09   C645FB82               mov     byte ptr [ebp-$05], $82
004EBF0D   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EBF12   8845FC                 mov     [ebp-$04], al
004EBF15   8D55F8                 lea     edx, [ebp-$08]
004EBF18   B904000000             mov     ecx, $00000004
004EBF1D   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EBF1F   E81C6FFFFF             call    004E2E40
004EBF24   EB5D                   jmp     004EBF83
004EBF26   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EBF2D   7537                   jnz     004EBF66
004EBF2F   6A0C                   push    $0C
004EBF31   C645F080               mov     byte ptr [ebp-$10], $80
004EBF35   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EBF3A   8845F1                 mov     [ebp-$0F], al
004EBF3D   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EBF42   8845F2                 mov     [ebp-$0E], al
004EBF45   C645F301               mov     byte ptr [ebp-$0D], $01
004EBF49   C645F482               mov     byte ptr [ebp-$0C], $82
004EBF4D   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EBF52   8845F5                 mov     [ebp-$0B], al
004EBF55   8D55F0                 lea     edx, [ebp-$10]
004EBF58   B905000000             mov     ecx, $00000005
004EBF5D   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EBF5F   E8DC6EFFFF             call    004E2E40
004EBF64   EB1D                   jmp     004EBF83
004EBF66   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBF6B   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EBF6C   E89FB1F1FF             call    00407110
004EBF71   6A32                   push    $32

* Reference to: kernel32.Sleep()
|
004EBF73   E80424F2FF             call    0040E37C
004EBF78   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBF7D   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EBF7E   E83DAFF1FF             call    00406EC0
004EBF83   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004EBF85   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EBF8B   E81494F4FF             call    004353A4
004EBF90   33D2                   xor     edx, edx

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EBF92   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EBF98   E8E741F7FF             call    00460184
004EBF9D   33D2                   xor     edx, edx

* Reference to control TForm1.List_Param : TValueListEditor
|
004EBF9F   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EBFA5   E8DA41F7FF             call    00460184
004EBFAA   33D2                   xor     edx, edx

* Reference to control TForm1.Panel_DTC : TPanel
|
004EBFAC   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EBFB2   E8CD41F7FF             call    00460184
004EBFB7   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004EBFB9   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EBFBF   E8E093F4FF             call    004353A4
004EBFC4   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EBFC6   E8916CFAFF             call    00492C5C

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EBFCB   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EBFD1   8B8008020000           mov     eax, [eax+$0208]
004EBFD7   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EBFDC   E8B73BF5FF             call    0043FB98
004EBFE1   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EBFE3   E80C3BF5FF             call    0043FAF4

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EBFE8   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EBFEE   8B8008020000           mov     eax, [eax+$0208]
004EBFF4   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EBFF9   E89A3BF5FF             call    0043FB98
004EBFFE   BAB85A5400             mov     edx, $00545AB8

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EC003   E8EC3AF5FF             call    0043FAF4
004EC008   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC00D   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EC00E   E8B5AEF1FF             call    00406EC8
004EC013   85C0                   test    eax, eax
004EC015   750B                   jnz     004EC022
004EC017   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC01C   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EC01D   E8A6AEF1FF             call    00406EC8
004EC022   803D1D724F0001         cmp     byte ptr [$004F721D], $01
004EC029   7561                   jnz     004EC08C
004EC02B   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004EC032   7558                   jnz     004EC08C
004EC034   803D34724F0001         cmp     byte ptr [$004F7234], $01
004EC03B   7539                   jnz     004EC076
004EC03D   BA40000000             mov     edx, $00000040
004EC042   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EC047   E8EC73F1FF             call    00403438

|
004EC04C   E86368F1FF             call    004028B4
004EC051   C605F86D4F00FF         mov     byte ptr [$004F6DF8], $FF
004EC058   68CC6D4F00             push    $004F6DCC
004EC05D   BAF86D4F00             mov     edx, $004F6DF8
004EC062   B901000000             mov     ecx, $00000001
004EC067   B8006F4F00             mov     eax, $004F6F00

|
004EC06C   E8DF6FF1FF             call    00403050

|
004EC071   E83E68F1FF             call    004028B4
004EC076   C6051D724F0000         mov     byte ptr [$004F721D], $00
004EC07D   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EC082   E8E96FF1FF             call    00403070

|
004EC087   E82868F1FF             call    004028B4
004EC08C   B922020000             mov     ecx, $00000222
004EC091   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004EC093   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004EC096   E86D2EF7FF             call    0045EF08
004EC09B   B919030000             mov     ecx, $00000319
004EC0A0   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004EC0A5   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004EC0A8   E85B2EF7FF             call    0045EF08
004EC0AD   B201                   mov     dl, $01

* Reference to control TForm1.Label_Dvig : TLabel
|
004EC0AF   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC0B5   E8CA40F7FF             call    00460184
004EC0BA   B201                   mov     dl, $01

* Reference to control TForm1.Label_AKPP : TLabel
|
004EC0BC   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC0C2   E8BD40F7FF             call    00460184
004EC0C7   B201                   mov     dl, $01

* Reference to control TForm1.Label_ABS : TLabel
|
004EC0C9   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC0CF   E8B040F7FF             call    00460184
004EC0D4   B201                   mov     dl, $01

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004EC0D6   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC0DC   E8A340F7FF             call    00460184
004EC0E1   B201                   mov     dl, $01

* Reference to control TForm1.Label_Load : TLabel
|
004EC0E3   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC0E9   E89640F7FF             call    00460184
004EC0EE   C60525724F0000         mov     byte ptr [$004F7225], $00

* Reference to TOptionsForm instance
|
004EC0F5   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004EC0FA   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.AutoSave : TCheckBox
|
004EC0FC   8B8024030000           mov     eax, [eax+$0324]
004EC102   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004EC104   FF92C8000000           call    dword ptr [edx+$00C8]
004EC10A   3C01                   cmp     al, $01
004EC10C   0F85AB000000           jnz     004EC1BD
004EC112   803D19724F0000         cmp     byte ptr [$004F7219], $00
004EC119   0F859E000000           jnz     004EC1BD
004EC11F   6A00                   push    $00
004EC121   8D55E8                 lea     edx, [ebp-$18]

* Reference to TOptionsForm instance
|
004EC124   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004EC129   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.Label4 : TLabel
|
004EC12B   8B8048030000           mov     eax, [eax+$0348]

* Reference to: Controls.TControl.GetText(TControl):TCaption;
|
004EC131   E82E41F7FF             call    00460264
004EC136   FF75E8                 push    dword ptr [ebp-$18]

* Reference to: SysUtils.Now:TDateTime;
|
004EC139   E81AEEF1FF             call    0040AF58
004EC13E   83C4F8                 add     esp, -$08
004EC141   DD1C24                 fstp    qword ptr [esp]
004EC144   9B                     wait
004EC145   8D55E4                 lea     edx, [ebp-$1C]

* Possible String Reference to: 'yymmddhhnn'
|
004EC148   B828C24E00             mov     eax, $004EC228

|
004EC14D   E882FAF1FF             call    0040BBD4
004EC152   FF75E4                 push    dword ptr [ebp-$1C]
004EC155   683CC24E00             push    $004EC23C
004EC15A   8D4DE0                 lea     ecx, [ebp-$20]
004EC15D   8A15A56D4F00           mov     dl, byte ptr [$004F6DA5]
004EC163   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EC165   E8626EFFFF             call    004E2FCC
004EC16A   FF75E0                 push    dword ptr [ebp-$20]

* Possible String Reference to: '.cedat'
|
004EC16D   6848C24E00             push    $004EC248
004EC172   8D45EC                 lea     eax, [ebp-$14]
004EC175   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCatN;
|
004EC17A   E82D8CF1FF             call    00404DAC
004EC17F   8B45EC                 mov     eax, [ebp-$14]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EC182   E8658DF1FF             call    00404EEC
004EC187   50                     push    eax
004EC188   8D45DC                 lea     eax, [ebp-$24]

* Possible String Reference to: 'temp.tmp'
|
004EC18B   B958C24E00             mov     ecx, $004EC258
004EC190   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EC196   E89D8BF1FF             call    00404D38
004EC19B   8B45DC                 mov     eax, [ebp-$24]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EC19E   E8498DF1FF             call    00404EEC
004EC1A3   50                     push    eax

* Reference to: kernel32.CopyFileA()
|
004EC1A4   E82FADF1FF             call    00406ED8
004EC1A9   C60519724F0001         mov     byte ptr [$004F7219], $01
004EC1B0   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EC1B2   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC1B8   E8CB69F8FF             call    00472B88
004EC1BD   803D1A724F0001         cmp     byte ptr [$004F721A], $01
004EC1C4   7507                   jnz     004EC1CD
004EC1C6   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004EC1C8   E8CB7DFFFF             call    004E3F98
004EC1CD   33C0                   xor     eax, eax
004EC1CF   5A                     pop     edx
004EC1D0   59                     pop     ecx
004EC1D1   59                     pop     ecx
004EC1D2   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[ãÂ]√'
|
004EC1D5   68FCC14E00             push    $004EC1FC
004EC1DA   8D45DC                 lea     eax, [ebp-$24]
004EC1DD   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC1E2   E86988F1FF             call    00404A50
004EC1E7   8D45E8                 lea     eax, [ebp-$18]
004EC1EA   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC1EF   E85C88F1FF             call    00404A50
004EC1F4   C3                     ret


* Reference to: System.@HandleFinally;
|
004EC1F5   E9B281F1FF             jmp     004043AC
004EC1FA   EBDE                   jmp     004EC1DA

****** END
|
004EC1FC   5B                     pop     ebx
004EC1FD   8BE5                   mov     esp, ebp
004EC1FF   5D                     pop     ebp
004EC200   C3                     ret

*)
end;

procedure TForm1.Button_DTCClick(Sender : TObject);
begin
(*
004EA604   55                     push    ebp
004EA605   8BEC                   mov     ebp, esp
004EA607   B90F000000             mov     ecx, $0000000F
004EA60C   6A00                   push    $00
004EA60E   6A00                   push    $00
004EA610   49                     dec     ecx
004EA611   75F9                   jnz     004EA60C
004EA613   53                     push    ebx
004EA614   56                     push    esi
004EA615   57                     push    edi
004EA616   8955FC                 mov     [ebp-$04], edx
004EA619   8BF8                   mov     edi, eax
004EA61B   33C0                   xor     eax, eax
004EA61D   55                     push    ebp
004EA61E   6897B34E00             push    $004EB397

***** TRY
|
004EA623   64FF30                 push    dword ptr fs:[eax]
004EA626   648920                 mov     fs:[eax], esp
004EA629   8B8744030000           mov     eax, [edi+$0344]
004EA62F   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA631   E84E5BF7FF             call    00460184
004EA636   8B8720030000           mov     eax, [edi+$0320]
004EA63C   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA63E   E8415BF7FF             call    00460184
004EA643   8B8724030000           mov     eax, [edi+$0324]
004EA649   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA64B   E8345BF7FF             call    00460184
004EA650   8B8730030000           mov     eax, [edi+$0330]
004EA656   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EA658   E847ADF4FF             call    004353A4
004EA65D   8B9FB0030000           mov     ebx, [edi+$03B0]
004EA663   8BC3                   mov     eax, ebx
004EA665   33D2                   xor     edx, edx

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004EA667   E8681AFAFF             call    0048C0D4
004EA66C   8B9744030000           mov     edx, [edi+$0344]
004EA672   8B5248                 mov     edx, [edx+$48]
004EA675   2BD0                   sub     edx, eax
004EA677   52                     push    edx
004EA678   8B87B0030000           mov     eax, [edi+$03B0]
004EA67E   BA01000000             mov     edx, $00000001

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004EA683   E84C1AFAFF             call    0048C0D4
004EA688   59                     pop     ecx
004EA689   2BC8                   sub     ecx, eax
004EA68B   83E907                 sub     ecx, +$07
004EA68E   8BC3                   mov     eax, ebx
004EA690   BA02000000             mov     edx, $00000002

* Reference to: Grids.TCustomGrid.SetColWidths(TCustomGrid;Longint;Integer);
|
004EA695   E8721BFAFF             call    0048C20C
004EA69A   8B87B0030000           mov     eax, [edi+$03B0]
004EA6A0   BA02000000             mov     edx, $00000002

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EA6A5   E8961EFAFF             call    0048C540
004EA6AA   6A00                   push    $00
004EA6AC   8B87B0030000           mov     eax, [edi+$03B0]
004EA6B2   B901000000             mov     ecx, $00000001
004EA6B7   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA6B9   E8FE3FFAFF             call    0048E6BC
004EA6BE   6A00                   push    $00
004EA6C0   8B87B0030000           mov     eax, [edi+$03B0]
004EA6C6   B901000000             mov     ecx, $00000001
004EA6CB   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA6D0   E8E73FFAFF             call    0048E6BC
004EA6D5   6A00                   push    $00
004EA6D7   8B87B0030000           mov     eax, [edi+$03B0]
004EA6DD   B901000000             mov     ecx, $00000001
004EA6E2   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA6E7   E8D03FFAFF             call    0048E6BC
004EA6EC   8B8744030000           mov     eax, [edi+$0344]

* Reference to: Controls.TControl.Refresh(TControl);
|
004EA6F2   E8A960F7FF             call    004607A0
004EA6F7   8B87FC020000           mov     eax, [edi+$02FC]
004EA6FD   C7400C03000000         mov     dword ptr [eax+$0C], $00000003
004EA704   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EA70B   0F84F6060000           jz      004EAE07

* Reference to: kernel32.GetTickCount()
|
004EA711   E83AC9F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004EA716   A3986D4F00             mov     dword ptr [$004F6D98], eax
004EA71B   EB0C                   jmp     004EA729

* Reference to TApplication instance
|
004EA71D   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004EA722   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EA724   E8BB60F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EA729   E822C9F1FF             call    00407050
004EA72E   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EA734   3DC8000000             cmp     eax, $000000C8
004EA739   72E2                   jb      004EA71D
004EA73B   803D1B724F0001         cmp     byte ptr [$004F721B], $01
004EA742   7509                   jnz     004EA74D
004EA744   C745F030000000         mov     dword ptr [ebp-$10], $00000030
004EA74B   EB05                   jmp     004EA752
004EA74D   33C0                   xor     eax, eax
004EA74F   8945F0                 mov     [ebp-$10], eax
004EA752   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA759   0F85F9020000           jnz     004EAA58
004EA75F   33C0                   xor     eax, eax
004EA761   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA766   83F832                 cmp     eax, +$32
004EA769   7F61                   jnle    004EA7CC
004EA76B   0F8492010000           jz      004EA903
004EA771   83C0EF                 add     eax, -$11
004EA774   83F811                 cmp     eax, +$11
004EA777   0F8783020000           jnbe    004EAA00
004EA77D   FF248584A74E00         jmp     dword ptr [$4EA784+eax*4]
004EA784   EF                     out     dx, eax
004EA785   A7                     cmpsd
004EA786   4E                     dec     esi
004EA787   0034A8                 add     [eax+ebp*4], dh
004EA78A   4E                     dec     esi
004EA78B   00EF                   add     bh, ch
004EA78D   A7                     cmpsd
004EA78E   4E                     dec     esi
004EA78F   00EF                   add     bh, ch
004EA791   A7                     cmpsd
004EA792   4E                     dec     esi
004EA793   0000                   add     [eax], al
004EA795   AA                     stosb
004EA796   4E                     dec     esi
004EA797   0000                   add     [eax], al
004EA799   AA                     stosb
004EA79A   4E                     dec     esi
004EA79B   0000                   add     [eax], al
004EA79D   AA                     stosb
004EA79E   4E                     dec     esi
004EA79F   0000                   add     [eax], al
004EA7A1   AA                     stosb
004EA7A2   4E                     dec     esi
004EA7A3   0000                   add     [eax], al
004EA7A5   AA                     stosb
004EA7A6   4E                     dec     esi
004EA7A7   0000                   add     [eax], al
004EA7A9   AA                     stosb
004EA7AA   4E                     dec     esi
004EA7AB   0000                   add     [eax], al
004EA7AD   AA                     stosb
004EA7AE   4E                     dec     esi
004EA7AF   0000                   add     [eax], al
004EA7B1   AA                     stosb
004EA7B2   4E                     dec     esi
004EA7B3   0000                   add     [eax], al
004EA7B5   AA                     stosb
004EA7B6   4E                     dec     esi
004EA7B7   0000                   add     [eax], al
004EA7B9   AA                     stosb
004EA7BA   4E                     dec     esi
004EA7BB   0000                   add     [eax], al
004EA7BD   AA                     stosb
004EA7BE   4E                     dec     esi
004EA7BF   0000                   add     [eax], al
004EA7C1   AA                     stosb
004EA7C2   4E                     dec     esi
004EA7C3   0079A8                 add     [ecx-$58], bh
004EA7C6   4E                     dec     esi
004EA7C7   00BEA84E0083           add     [esi+$83004EA8], bh
004EA7CD   E8410F8477             call    77D2B713
004EA7D2   0100                   add     [eax], eax
004EA7D4   00480F                 add     [eax+$0F], cl
004EA7D7   84B201000048           test    [edx+$48000001], dh
004EA7DD   0F8469010000           jz      004EA94C
004EA7E3   48                     dec     eax
004EA7E4   0F84DA010000           jz      004EA9C4
004EA7EA   E911020000             jmp     004EAA00
004EA7EF   68FF000000             push    $000000FF
004EA7F4   C645DC84               mov     byte ptr [ebp-$24], $84
004EA7F8   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA7FD   8845DD                 mov     [ebp-$23], al
004EA800   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA805   8845DE                 mov     [ebp-$22], al
004EA808   C645DF18               mov     byte ptr [ebp-$21], $18
004EA80C   C645E000               mov     byte ptr [ebp-$20], $00
004EA810   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EA814   C645E200               mov     byte ptr [ebp-$1E], $00
004EA818   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA81D   8845E3                 mov     [ebp-$1D], al
004EA820   8D55DC                 lea     edx, [ebp-$24]
004EA823   B907000000             mov     ecx, $00000007
004EA828   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA82A   E81186FFFF             call    004E2E40
004EA82F   E9CC010000             jmp     004EAA00
004EA834   68FF000000             push    $000000FF
004EA839   C645DC84               mov     byte ptr [ebp-$24], $84
004EA83D   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA842   8845DD                 mov     [ebp-$23], al
004EA845   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA84A   8845DE                 mov     [ebp-$22], al
004EA84D   C645DF19               mov     byte ptr [ebp-$21], $19
004EA851   C645E0DA               mov     byte ptr [ebp-$20], $DA
004EA855   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EA859   C645E200               mov     byte ptr [ebp-$1E], $00
004EA85D   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA862   8845E3                 mov     [ebp-$1D], al
004EA865   8D55DC                 lea     edx, [ebp-$24]
004EA868   B907000000             mov     ecx, $00000007
004EA86D   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA86F   E8CC85FFFF             call    004E2E40
004EA874   E987010000             jmp     004EAA00
004EA879   68FF000000             push    $000000FF
004EA87E   C645DC84               mov     byte ptr [ebp-$24], $84
004EA882   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA887   8845DD                 mov     [ebp-$23], al
004EA88A   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA88F   8845DE                 mov     [ebp-$22], al
004EA892   C645DF18               mov     byte ptr [ebp-$21], $18
004EA896   C645E000               mov     byte ptr [ebp-$20], $00
004EA89A   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EA89E   C645E200               mov     byte ptr [ebp-$1E], $00
004EA8A2   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA8A7   8845E3                 mov     [ebp-$1D], al
004EA8AA   8D55DC                 lea     edx, [ebp-$24]
004EA8AD   B907000000             mov     ecx, $00000007
004EA8B2   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA8B4   E88785FFFF             call    004E2E40
004EA8B9   E942010000             jmp     004EAA00
004EA8BE   68FF000000             push    $000000FF
004EA8C3   C645DC84               mov     byte ptr [ebp-$24], $84
004EA8C7   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA8CC   8845DD                 mov     [ebp-$23], al
004EA8CF   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA8D4   8845DE                 mov     [ebp-$22], al
004EA8D7   C645DF18               mov     byte ptr [ebp-$21], $18
004EA8DB   C645E000               mov     byte ptr [ebp-$20], $00
004EA8DF   C645E100               mov     byte ptr [ebp-$1F], $00
004EA8E3   C645E200               mov     byte ptr [ebp-$1E], $00
004EA8E7   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA8EC   8845E3                 mov     [ebp-$1D], al
004EA8EF   8D55DC                 lea     edx, [ebp-$24]
004EA8F2   B907000000             mov     ecx, $00000007
004EA8F7   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA8F9   E84285FFFF             call    004E2E40
004EA8FE   E9FD000000             jmp     004EAA00
004EA903   68FF000000             push    $000000FF
004EA908   C645D080               mov     byte ptr [ebp-$30], $80
004EA90C   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA911   8845D1                 mov     [ebp-$2F], al
004EA914   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA919   8845D2                 mov     [ebp-$2E], al
004EA91C   C645D304               mov     byte ptr [ebp-$2D], $04
004EA920   C645D418               mov     byte ptr [ebp-$2C], $18
004EA924   C645D500               mov     byte ptr [ebp-$2B], $00
004EA928   C645D680               mov     byte ptr [ebp-$2A], $80
004EA92C   C645D700               mov     byte ptr [ebp-$29], $00
004EA930   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA935   8845D8                 mov     [ebp-$28], al
004EA938   8D55D0                 lea     edx, [ebp-$30]
004EA93B   B908000000             mov     ecx, $00000008
004EA940   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA942   E8F984FFFF             call    004E2E40
004EA947   E9B4000000             jmp     004EAA00
004EA94C   68FF000000             push    $000000FF
004EA951   C645DC84               mov     byte ptr [ebp-$24], $84
004EA955   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA95A   8845DD                 mov     [ebp-$23], al
004EA95D   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA962   8845DE                 mov     [ebp-$22], al
004EA965   C645DF18               mov     byte ptr [ebp-$21], $18
004EA969   C645E000               mov     byte ptr [ebp-$20], $00
004EA96D   C645E140               mov     byte ptr [ebp-$1F], $40
004EA971   C645E200               mov     byte ptr [ebp-$1E], $00
004EA975   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA97A   8845E3                 mov     [ebp-$1D], al
004EA97D   8D55DC                 lea     edx, [ebp-$24]
004EA980   B907000000             mov     ecx, $00000007
004EA985   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA987   E8B484FFFF             call    004E2E40
004EA98C   EB72                   jmp     004EAA00
004EA98E   68FF000000             push    $000000FF
004EA993   C645C881               mov     byte ptr [ebp-$38], $81
004EA997   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA99C   8845C9                 mov     [ebp-$37], al
004EA99F   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA9A4   8845CA                 mov     [ebp-$36], al
004EA9A7   C645CB13               mov     byte ptr [ebp-$35], $13
004EA9AB   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA9B0   8845CC                 mov     [ebp-$34], al
004EA9B3   8D55C8                 lea     edx, [ebp-$38]
004EA9B6   B904000000             mov     ecx, $00000004
004EA9BB   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA9BD   E87E84FFFF             call    004E2E40
004EA9C2   EB3C                   jmp     004EAA00
004EA9C4   68FF000000             push    $000000FF
004EA9C9   C645C083               mov     byte ptr [ebp-$40], $83
004EA9CD   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA9D2   8845C1                 mov     [ebp-$3F], al
004EA9D5   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA9DA   8845C2                 mov     [ebp-$3E], al
004EA9DD   C645C313               mov     byte ptr [ebp-$3D], $13
004EA9E1   C645C440               mov     byte ptr [ebp-$3C], $40
004EA9E5   C645C500               mov     byte ptr [ebp-$3B], $00
004EA9E9   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA9EE   8845C6                 mov     [ebp-$3A], al
004EA9F1   8D55C0                 lea     edx, [ebp-$40]
004EA9F4   B906000000             mov     ecx, $00000006
004EA9F9   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EA9FB   E84084FFFF             call    004E2E40

* Reference to Application
|
004EAA00   8B55F0                 mov     edx, [ebp-$10]
004EAA03   83C240                 add     edx, +$40
004EAA06   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAA0B   E8288AF1FF             call    00403438

|
004EAA10   E89F7EF1FF             call    004028B4
004EAA15   68CC6D4F00             push    $004F6DCC
004EAA1A   B940000000             mov     ecx, $00000040
004EAA1F   2B4DF0                 sub     ecx, dword ptr [ebp-$10]
004EAA22   BAF86D4F00             mov     edx, $004F6DF8
004EAA27   B8006F4F00             mov     eax, $004F6F00

|
004EAA2C   E81F86F1FF             call    00403050

|
004EAA31   E87E7EF1FF             call    004028B4
004EAA36   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004EAA3B   E84088F1FF             call    00403280

|
004EAA40   E86F7EF1FF             call    004028B4
004EAA45   8BD0                   mov     edx, eax
004EAA47   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAA4C   E8E789F1FF             call    00403438

|
004EAA51   E85E7EF1FF             call    004028B4
004EAA56   EB46                   jmp     004EAA9E
004EAA58   BA01000000             mov     edx, $00000001
004EAA5D   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004EAA62   E8A989F1FF             call    00403410

|
004EAA67   E8487EF1FF             call    004028B4
004EAA6C   BA40000000             mov     edx, $00000040
004EAA71   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAA76   E8BD89F1FF             call    00403438

|
004EAA7B   E8347EF1FF             call    004028B4
004EAA80   68CC6D4F00             push    $004F6DCC
004EAA85   BAF86D4F00             mov     edx, $004F6DF8
004EAA8A   B940000000             mov     ecx, $00000040
004EAA8F   B8006F4F00             mov     eax, $004F6F00

|
004EAA94   E89785F1FF             call    00403030

|
004EAA99   E8167EF1FF             call    004028B4
004EAA9E   8A15F86D4F00           mov     dl, byte ptr [$004F6DF8]
004EAAA4   8BCA                   mov     ecx, edx
004EAAA6   80E10F                 and     cl, $0F
004EAAA9   8BF1                   mov     esi, ecx
004EAAAB   81E6FF000000           and     esi, $000000FF
004EAAB1   8A8EFF6D4F00           mov     cl, byte ptr [esi+$4F6DFF]
004EAAB7   A0FB6D4F00             mov     al, byte ptr [$004F6DFB]
004EAABC   8BD8                   mov     ebx, eax
004EAABE   80CB40                 or      bl, $40
004EAAC1   3ACB                   cmp     cl, bl
004EAAC3   7419                   jz      004EAADE
004EAAC5   8A0DFC6D4F00           mov     cl, byte ptr [$004F6DFC]
004EAACB   80C940                 or      cl, $40
004EAACE   33DB                   xor     ebx, ebx
004EAAD0   8AD8                   mov     bl, al
004EAAD2   3A8B016E4F00           cmp     cl, byte ptr [ebx+$4F6E01]
004EAAD8   0F851D030000           jnz     004EADFB
004EAADE   80FA80                 cmp     dl, $80
004EAAE1   760D                   jbe     004EAAF0
004EAAE3   33C0                   xor     eax, eax
004EAAE5   8A86006E4F00           mov     al, byte ptr [esi+$4F6E00]
004EAAEB   8945EC                 mov     [ebp-$14], eax
004EAAEE   EB0F                   jmp     004EAAFF
004EAAF0   25FF000000             and     eax, $000000FF
004EAAF5   0FB680026E4F00         movzx   eax, byte ptr [eax+$4F6E02]
004EAAFC   8945EC                 mov     [ebp-$14], eax
004EAAFF   837DEC00               cmp     dword ptr [ebp-$14], +$00
004EAB03   0F8EC6020000           jle     004EADCF

* Reference to Application
|
004EAB09   8B45EC                 mov     eax, [ebp-$14]
004EAB0C   85C0                   test    eax, eax
004EAB0E   0F8E8E020000           jle     004EADA2
004EAB14   8945E4                 mov     [ebp-$1C], eax
004EAB17   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EAB1E   837DF801               cmp     dword ptr [ebp-$08], +$01
004EAB22   7E12                   jle     004EAB36
004EAB24   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to field Application.OFFS_024C
|
004EAB2A   8B904C020000           mov     edx, [eax+$024C]
004EAB30   42                     inc     edx

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EAB31   E80A1AFAFF             call    0048C540
004EAB36   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004EAB3D   751D                   jnz     004EAB5C
004EAB3F   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EAB44   240F                   and     al, $0F
004EAB46   25FF000000             and     eax, $000000FF
004EAB4B   83C009                 add     eax, +$09
004EAB4E   8B55F8                 mov     edx, [ebp-$08]
004EAB51   4A                     dec     edx
004EAB52   C1E202                 shl     edx, $02
004EAB55   03C2                   add     eax, edx
004EAB57   8945F4                 mov     [ebp-$0C], eax
004EAB5A   EB65                   jmp     004EABC1
004EAB5C   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EAB61   2C42                   sub     al, $42
004EAB63   7404                   jz      004EAB69
004EAB65   2C02                   sub     al, $02
004EAB67   751C                   jnz     004EAB85
004EAB69   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EAB6E   240F                   and     al, $0F
004EAB70   25FF000000             and     eax, $000000FF
004EAB75   83C009                 add     eax, +$09
004EAB78   8B55F8                 mov     edx, [ebp-$08]
004EAB7B   4A                     dec     edx
004EAB7C   03D2                   add     edx, edx
004EAB7E   03C2                   add     eax, edx
004EAB80   8945F4                 mov     [ebp-$0C], eax
004EAB83   EB3C                   jmp     004EABC1
004EAB85   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EAB8C   7518                   jnz     004EABA6
004EAB8E   33C0                   xor     eax, eax
004EAB90   A0FB6D4F00             mov     al, byte ptr [$004F6DFB]
004EAB95   83C00B                 add     eax, +$0B
004EAB98   8B55F8                 mov     edx, [ebp-$08]
004EAB9B   4A                     dec     edx
004EAB9C   8D1452                 lea     edx, [edx+edx*2]
004EAB9F   03C2                   add     eax, edx
004EABA1   8945F4                 mov     [ebp-$0C], eax
004EABA4   EB1B                   jmp     004EABC1
004EABA6   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EABAB   240F                   and     al, $0F
004EABAD   25FF000000             and     eax, $000000FF
004EABB2   83C009                 add     eax, +$09
004EABB5   8B55F8                 mov     edx, [ebp-$08]
004EABB8   4A                     dec     edx
004EABB9   8D1452                 lea     edx, [edx+edx*2]
004EABBC   03C2                   add     eax, edx
004EABBE   8945F4                 mov     [ebp-$0C], eax
004EABC1   8B45F4                 mov     eax, [ebp-$0C]
004EABC4   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EABCA   24C0                   and     al, $C0
004EABCC   2C01                   sub     al, $01
004EABCE   720E                   jb      004EABDE
004EABD0   2C3F                   sub     al, $3F
004EABD2   7419                   jz      004EABED
004EABD4   2C40                   sub     al, $40
004EABD6   7424                   jz      004EABFC
004EABD8   2C40                   sub     al, $40
004EABDA   742F                   jz      004EAC0B
004EABDC   EB3A                   jmp     004EAC18
004EABDE   8D45E8                 lea     eax, [ebp-$18]
004EABE1   BAB0B34E00             mov     edx, $004EB3B0

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EABE6   E8D99EF1FF             call    00404AC4
004EABEB   EB2B                   jmp     004EAC18
004EABED   8D45E8                 lea     eax, [ebp-$18]
004EABF0   BABCB34E00             mov     edx, $004EB3BC

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EABF5   E8CA9EF1FF             call    00404AC4
004EABFA   EB1C                   jmp     004EAC18
004EABFC   8D45E8                 lea     eax, [ebp-$18]
004EABFF   BAC8B34E00             mov     edx, $004EB3C8

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAC04   E8BB9EF1FF             call    00404AC4
004EAC09   EB0D                   jmp     004EAC18
004EAC0B   8D45E8                 lea     eax, [ebp-$18]
004EAC0E   BAD4B34E00             mov     edx, $004EB3D4

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAC13   E8AC9EF1FF             call    00404AC4
004EAC18   FF75E8                 push    dword ptr [ebp-$18]
004EAC1B   8B45F4                 mov     eax, [ebp-$0C]
004EAC1E   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EAC24   243F                   and     al, $3F
004EAC26   25FF000000             and     eax, $000000FF
004EAC2B   8D4DBC                 lea     ecx, [ebp-$44]
004EAC2E   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EAC33   E89CE5F1FF             call    004091D4
004EAC38   FF75BC                 push    dword ptr [ebp-$44]
004EAC3B   8D4DB8                 lea     ecx, [ebp-$48]
004EAC3E   8B45F4                 mov     eax, [ebp-$0C]
004EAC41   0FB680F96D4F00         movzx   eax, byte ptr [eax+$4F6DF9]
004EAC48   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EAC4D   E882E5F1FF             call    004091D4
004EAC52   FF75B8                 push    dword ptr [ebp-$48]
004EAC55   8D45E8                 lea     eax, [ebp-$18]
004EAC58   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004EAC5D   E84AA1F1FF             call    00404DAC
004EAC62   8D45B4                 lea     eax, [ebp-$4C]
004EAC65   8B4DE8                 mov     ecx, [ebp-$18]
004EAC68   BAE0B34E00             mov     edx, $004EB3E0

* Reference to: System.@LStrCat3;
|
004EAC6D   E8C6A0F1FF             call    00404D38
004EAC72   8B45B4                 mov     eax, [ebp-$4C]
004EAC75   50                     push    eax
004EAC76   8B87B0030000           mov     eax, [edi+$03B0]
004EAC7C   8B4DF8                 mov     ecx, [ebp-$08]
004EAC7F   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAC81   E8363AFAFF             call    0048E6BC
004EAC86   BE01000000             mov     esi, $00000001
004EAC8B   EB01                   jmp     004EAC8E
004EAC8D   46                     inc     esi
004EAC8E   8D1C76                 lea     ebx, [esi+esi*2]
004EAC91   A1745D4F00             mov     eax, dword ptr [$004F5D74]
004EAC96   8B4C98F8               mov     ecx, [eax+ebx*4-$08]
004EAC9A   A1745D4F00             mov     eax, dword ptr [$004F5D74]
004EAC9F   8B5498F4               mov     edx, [eax+ebx*4-$0C]
004EACA3   8D45B0                 lea     eax, [ebp-$50]

* Reference to: System.@LStrCat3;
|
004EACA6   E88DA0F1FF             call    00404D38
004EACAB   8B45B0                 mov     eax, [ebp-$50]
004EACAE   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EACB1   E882A1F1FF             call    00404E38
004EACB6   7408                   jz      004EACC0
004EACB8   81FE43010000           cmp     esi, $00000143
004EACBE   7CCD                   jl      004EAC8D
004EACC0   8D1C76                 lea     ebx, [esi+esi*2]
004EACC3   A1745D4F00             mov     eax, dword ptr [$004F5D74]
004EACC8   8B4C98F8               mov     ecx, [eax+ebx*4-$08]
004EACCC   A1745D4F00             mov     eax, dword ptr [$004F5D74]
004EACD1   8B5498F4               mov     edx, [eax+ebx*4-$0C]
004EACD5   8D45AC                 lea     eax, [ebp-$54]

* Reference to: System.@LStrCat3;
|
004EACD8   E85BA0F1FF             call    00404D38
004EACDD   8B45AC                 mov     eax, [ebp-$54]
004EACE0   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EACE3   E850A1F1FF             call    00404E38
004EACE8   752F                   jnz     004EAD19
004EACEA   A1745D4F00             mov     eax, dword ptr [$004F5D74]
004EACEF   8B4C98FC               mov     ecx, [eax+ebx*4-$04]
004EACF3   8D45A8                 lea     eax, [ebp-$58]
004EACF6   BAE0B34E00             mov     edx, $004EB3E0

* Reference to: System.@LStrCat3;
|
004EACFB   E838A0F1FF             call    00404D38
004EAD00   8B45A8                 mov     eax, [ebp-$58]
004EAD03   50                     push    eax
004EAD04   8B87B0030000           mov     eax, [edi+$03B0]
004EAD0A   8B4DF8                 mov     ecx, [ebp-$08]
004EAD0D   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAD12   E8A539FAFF             call    0048E6BC
004EAD17   EB18                   jmp     004EAD31
004EAD19   6804595400             push    $00545904
004EAD1E   8B87B0030000           mov     eax, [edi+$03B0]
004EAD24   8B4DF8                 mov     ecx, [ebp-$08]
004EAD27   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAD2C   E88B39FAFF             call    0048E6BC
004EAD31   8B45F4                 mov     eax, [ebp-$0C]
004EAD34   8A80FA6D4F00           mov     al, byte ptr [eax+$4F6DFA]
004EAD3A   2460                   and     al, $60
004EAD3C   2C20                   sub     al, $20
004EAD3E   740A                   jz      004EAD4A
004EAD40   2C20                   sub     al, $20
004EAD42   7420                   jz      004EAD64
004EAD44   2C20                   sub     al, $20
004EAD46   7436                   jz      004EAD7E
004EAD48   EB4C                   jmp     004EAD96
004EAD4A   6834595400             push    $00545934
004EAD4F   8B87B0030000           mov     eax, [edi+$03B0]
004EAD55   8B4DF8                 mov     ecx, [ebp-$08]
004EAD58   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAD5D   E85A39FAFF             call    0048E6BC
004EAD62   EB32                   jmp     004EAD96
004EAD64   6844595400             push    $00545944
004EAD69   8B87B0030000           mov     eax, [edi+$03B0]
004EAD6F   8B4DF8                 mov     ecx, [ebp-$08]
004EAD72   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAD77   E84039FAFF             call    0048E6BC
004EAD7C   EB18                   jmp     004EAD96
004EAD7E   6854595400             push    $00545954
004EAD83   8B87B0030000           mov     eax, [edi+$03B0]
004EAD89   8B4DF8                 mov     ecx, [ebp-$08]
004EAD8C   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAD91   E82639FAFF             call    0048E6BC
004EAD96   FF45F8                 inc     dword ptr [ebp-$08]
004EAD99   FF4DE4                 dec     dword ptr [ebp-$1C]
004EAD9C   0F857CFDFFFF           jnz     004EAB1E
004EADA2   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EADA9   7512                   jnz     004EADBD
004EADAB   8B877C030000           mov     eax, [edi+$037C]
004EADB1   B201                   mov     dl, $01
004EADB3   8B08                   mov     ecx, [eax]
004EADB5   FF5164                 call    dword ptr [ecx+$64]
004EADB8   E9AA050000             jmp     004EB367
004EADBD   8B877C030000           mov     eax, [edi+$037C]
004EADC3   33D2                   xor     edx, edx
004EADC5   8B08                   mov     ecx, [eax]
004EADC7   FF5164                 call    dword ptr [ecx+$64]
004EADCA   E998050000             jmp     004EB367
004EADCF   6868595400             push    $00545968
004EADD4   8B87B0030000           mov     eax, [edi+$03B0]
004EADDA   B901000000             mov     ecx, $00000001
004EADDF   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EADE4   E8D338FAFF             call    0048E6BC
004EADE9   8B877C030000           mov     eax, [edi+$037C]
004EADEF   33D2                   xor     edx, edx
004EADF1   8B08                   mov     ecx, [eax]
004EADF3   FF5164                 call    dword ptr [ecx+$64]
004EADF6   E96C050000             jmp     004EB367
004EADFB   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EADFD   E8C6E7FFFF             call    004E95C8
004EAE02   E960050000             jmp     004EB367
004EAE07   803D1B724F0001         cmp     byte ptr [$004F721B], $01
004EAE0E   7509                   jnz     004EAE19
004EAE10   C745F080000000         mov     dword ptr [ebp-$10], $00000080
004EAE17   EB05                   jmp     004EAE1E
004EAE19   33C0                   xor     eax, eax
004EAE1B   8945F0                 mov     [ebp-$10], eax
004EAE1E   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EAE25   0F85D3020000           jnz     004EB0FE
004EAE2B   33DB                   xor     ebx, ebx
004EAE2D   43                     inc     ebx
004EAE2E   83FB05                 cmp     ebx, +$05
004EAE31   7E0C                   jle     004EAE3F
004EAE33   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EAE35   E88EE7FFFF             call    004E95C8
004EAE3A   E928050000             jmp     004EB367
004EAE3F   33C0                   xor     eax, eax
004EAE41   8945F8                 mov     [ebp-$08], eax
004EAE44   BAF86D4F00             mov     edx, $004F6DF8
004EAE49   C60200                 mov     byte ptr [edx], $00
004EAE4C   FF45F8                 inc     dword ptr [ebp-$08]
004EAE4F   42                     inc     edx
004EAE50   817DF800010000         cmp     dword ptr [ebp-$08], $00000100
004EAE57   75F0                   jnz     004EAE49
004EAE59   6A0F                   push    $0F
004EAE5B   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAE60   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004EAE61   E882C2F1FF             call    004070E8
004EAE66   33F6                   xor     esi, esi
004EAE68   EB1F                   jmp     004EAE89
004EAE6A   6A00                   push    $00
004EAE6C   68A06D4F00             push    $004F6DA0
004EAE71   6A01                   push    $01
004EAE73   68F86D4F00             push    $004F6DF8
004EAE78   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAE7D   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EAE7E   E86DC2F1FF             call    004070F0
004EAE83   46                     inc     esi
004EAE84   83FE64                 cmp     esi, +$64
004EAE87   7FA4                   jnle    004EAE2D
004EAE89   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EAE8E   2C06                   sub     al, $06
004EAE90   7408                   jz      004EAE9A
004EAE92   2C08                   sub     al, $08
004EAE94   7404                   jz      004EAE9A
004EAE96   2C02                   sub     al, $02
004EAE98   75D0                   jnz     004EAE6A
004EAE9A   33C0                   xor     eax, eax
004EAE9C   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EAEA1   8945F8                 mov     [ebp-$08], eax
004EAEA4   6A00                   push    $00
004EAEA6   68A06D4F00             push    $004F6DA0
004EAEAB   6A01                   push    $01
004EAEAD   68F86D4F00             push    $004F6DF8
004EAEB2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAEB7   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EAEB8   E833C2F1FF             call    004070F0
004EAEBD   837DF810               cmp     dword ptr [ebp-$08], +$10
004EAEC1   7509                   jnz     004EAECC
004EAEC3   803DF86D4F00A1         cmp     byte ptr [$004F6DF8], $A1
004EAECA   75BD                   jnz     004EAE89
004EAECC   837DF806               cmp     dword ptr [ebp-$08], +$06
004EAED0   7509                   jnz     004EAEDB
004EAED2   803DF86D4F00F0         cmp     byte ptr [$004F6DF8], $F0
004EAED9   75AE                   jnz     004EAE89
004EAEDB   837DF80E               cmp     dword ptr [ebp-$08], +$0E
004EAEDF   7509                   jnz     004EAEEA
004EAEE1   803DF86D4F00A0         cmp     byte ptr [$004F6DF8], $A0
004EAEE8   759F                   jnz     004EAE89
004EAEEA   6A00                   push    $00
004EAEEC   68A06D4F00             push    $004F6DA0
004EAEF1   8B45F8                 mov     eax, [ebp-$08]
004EAEF4   50                     push    eax
004EAEF5   68F86D4F00             push    $004F6DF8
004EAEFA   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAEFF   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EAF00   E8EBC1F1FF             call    004070F0
004EAF05   83FB03                 cmp     ebx, +$03
004EAF08   7D15                   jnl     004EAF1F
004EAF0A   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EAF0C   E8437DFAFF             call    00492C54
004EAF11   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EAF13   E86434F2FF             call    0040E37C
004EAF18   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EAF1A   E83D7DFAFF             call    00492C5C
004EAF1F   6A04                   push    $04
004EAF21   C645A402               mov     byte ptr [ebp-$5C], $02
004EAF25   C645A511               mov     byte ptr [ebp-$5B], $11
004EAF29   C645A600               mov     byte ptr [ebp-$5A], $00
004EAF2D   C645A713               mov     byte ptr [ebp-$59], $13
004EAF31   8D55A4                 lea     edx, [ebp-$5C]
004EAF34   B903000000             mov     ecx, $00000003
004EAF39   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAF3B   E8007FFFFF             call    004E2E40
004EAF40   8B55F0                 mov     edx, [ebp-$10]
004EAF43   83C240                 add     edx, +$40
004EAF46   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAF4B   E8E884F1FF             call    00403438

|
004EAF50   E85F79F1FF             call    004028B4
004EAF55   68CC6D4F00             push    $004F6DCC
004EAF5A   BAF86D4F00             mov     edx, $004F6DF8
004EAF5F   B910000000             mov     ecx, $00000010
004EAF64   B8006F4F00             mov     eax, $004F6F00

|
004EAF69   E8E280F1FF             call    00403050

|
004EAF6E   E84179F1FF             call    004028B4
004EAF73   33F6                   xor     esi, esi
004EAF75   EB23                   jmp     004EAF9A
004EAF77   6A00                   push    $00
004EAF79   68A06D4F00             push    $004F6DA0
004EAF7E   6A01                   push    $01
004EAF80   68F86D4F00             push    $004F6DF8
004EAF85   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAF8A   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EAF8B   E860C1F1FF             call    004070F0
004EAF90   46                     inc     esi
004EAF91   83FE64                 cmp     esi, +$64
004EAF94   0F8F93FEFFFF           jnle    004EAE2D
004EAF9A   803DF86D4F0010         cmp     byte ptr [$004F6DF8], $10
004EAFA1   75D4                   jnz     004EAF77
004EAFA3   8B55F0                 mov     edx, [ebp-$10]
004EAFA6   83C250                 add     edx, +$50
004EAFA9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAFAE   E88584F1FF             call    00403438

|
004EAFB3   E8FC78F1FF             call    004028B4
004EAFB8   68CC6D4F00             push    $004F6DCC
004EAFBD   BAF86D4F00             mov     edx, $004F6DF8
004EAFC2   B901000000             mov     ecx, $00000001
004EAFC7   B8006F4F00             mov     eax, $004F6F00

|
004EAFCC   E87F80F1FF             call    00403050

|
004EAFD1   E8DE78F1FF             call    004028B4
004EAFD6   6A00                   push    $00
004EAFD8   68A06D4F00             push    $004F6DA0
004EAFDD   6A01                   push    $01
004EAFDF   68F86D4F00             push    $004F6DF8
004EAFE4   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EAFE9   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EAFEA   E801C1F1FF             call    004070F0
004EAFEF   803DF86D4F00A1         cmp     byte ptr [$004F6DF8], $A1
004EAFF6   75A2                   jnz     004EAF9A
004EAFF8   8B55F0                 mov     edx, [ebp-$10]
004EAFFB   83C251                 add     edx, +$51
004EAFFE   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB003   E83084F1FF             call    00403438

|
004EB008   E8A778F1FF             call    004028B4
004EB00D   68CC6D4F00             push    $004F6DCC
004EB012   BAF86D4F00             mov     edx, $004F6DF8
004EB017   B901000000             mov     ecx, $00000001
004EB01C   B8006F4F00             mov     eax, $004F6F00

|
004EB021   E82A80F1FF             call    00403050

|
004EB026   E88978F1FF             call    004028B4
004EB02B   6A00                   push    $00
004EB02D   68A06D4F00             push    $004F6DA0
004EB032   6A01                   push    $01
004EB034   68F86D4F00             push    $004F6DF8
004EB039   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB03E   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB03F   E8ACC0F1FF             call    004070F0
004EB044   803DF86D4F0004         cmp     byte ptr [$004F6DF8], $04
004EB04B   0F8549FFFFFF           jnz     004EAF9A
004EB051   8B55F0                 mov     edx, [ebp-$10]
004EB054   83C252                 add     edx, +$52
004EB057   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB05C   E8D783F1FF             call    00403438

|
004EB061   E84E78F1FF             call    004028B4
004EB066   68CC6D4F00             push    $004F6DCC
004EB06B   BAF86D4F00             mov     edx, $004F6DF8
004EB070   B901000000             mov     ecx, $00000001
004EB075   B8006F4F00             mov     eax, $004F6F00

|
004EB07A   E8D17FF1FF             call    00403050

|
004EB07F   E83078F1FF             call    004028B4
004EB084   6A00                   push    $00
004EB086   68A06D4F00             push    $004F6DA0
004EB08B   6A0F                   push    $0F
004EB08D   68F86D4F00             push    $004F6DF8
004EB092   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB097   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB098   E853C0F1FF             call    004070F0
004EB09D   68CC6D4F00             push    $004F6DCC
004EB0A2   BAF86D4F00             mov     edx, $004F6DF8
004EB0A7   B92D000000             mov     ecx, $0000002D
004EB0AC   B8006F4F00             mov     eax, $004F6F00

|
004EB0B1   E89A7FF1FF             call    00403050

|
004EB0B6   E8F977F1FF             call    004028B4
004EB0BB   B8B5000000             mov     eax, $000000B5
004EB0C0   33D2                   xor     edx, edx
004EB0C2   8955F8                 mov     [ebp-$08], edx
004EB0C5   BAF86D4F00             mov     edx, $004F6DF8
004EB0CA   33C9                   xor     ecx, ecx
004EB0CC   8A0A                   mov     cl, byte ptr [edx]
004EB0CE   03C1                   add     eax, ecx
004EB0D0   FF45F8                 inc     dword ptr [ebp-$08]
004EB0D3   42                     inc     edx
004EB0D4   837DF80D               cmp     dword ptr [ebp-$08], +$0D
004EB0D8   75F0                   jnz     004EB0CA
004EB0DA   33D2                   xor     edx, edx
004EB0DC   8A15056E4F00           mov     dl, byte ptr [$004F6E05]
004EB0E2   C1E208                 shl     edx, $08
004EB0E5   33C9                   xor     ecx, ecx
004EB0E7   8A0D066E4F00           mov     cl, byte ptr [$004F6E06]
004EB0ED   03D1                   add     edx, ecx
004EB0EF   3BC2                   cmp     eax, edx
004EB0F1   0F8536FDFFFF           jnz     004EAE2D
004EB0F7   33C0                   xor     eax, eax
004EB0F9   8945F4                 mov     [ebp-$0C], eax
004EB0FC   EB07                   jmp     004EB105
004EB0FE   C745F453000000         mov     dword ptr [ebp-$0C], $00000053
004EB105   33C0                   xor     eax, eax
004EB107   8945F8                 mov     [ebp-$08], eax
004EB10A   33F6                   xor     esi, esi
004EB10C   8B5DF4                 mov     ebx, [ebp-$0C]
004EB10F   03DE                   add     ebx, esi
004EB111   80BBF86D4F0000         cmp     byte ptr [ebx+$4F6DF8], $00
004EB118   0F86A8010000           jbe     004EB2C6
004EB11E   8D45A0                 lea     eax, [ebp-$60]
004EB121   50                     push    eax
004EB122   8B87B0030000           mov     eax, [edi+$03B0]
004EB128   B901000000             mov     ecx, $00000001
004EB12D   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB132   E81535FAFF             call    0048E64C
004EB137   837DA000               cmp     dword ptr [ebp-$60], +$00
004EB13B   7412                   jz      004EB14F
004EB13D   8B87B0030000           mov     eax, [edi+$03B0]
004EB143   8B904C020000           mov     edx, [eax+$024C]
004EB149   42                     inc     edx

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EB14A   E8F113FAFF             call    0048C540
004EB14F   8D55E8                 lea     edx, [ebp-$18]
004EB152   33C0                   xor     eax, eax
004EB154   8A83F86D4F00           mov     al, byte ptr [ebx+$4F6DF8]

* Reference to: SysUtils.IntToStr(Integer):AnsiString;overload;
|
004EB15A   E861DFF1FF             call    004090C0
004EB15F   8D459C                 lea     eax, [ebp-$64]
004EB162   8B4DE8                 mov     ecx, [ebp-$18]

* Possible String Reference to: '     '
|
004EB165   BA5CB44E00             mov     edx, $004EB45C

* Reference to: System.@LStrCat3;
|
004EB16A   E8C99BF1FF             call    00404D38
004EB16F   8B459C                 mov     eax, [ebp-$64]
004EB172   50                     push    eax
004EB173   8B9FB0030000           mov     ebx, [edi+$03B0]
004EB179   8B8B4C020000           mov     ecx, [ebx+$024C]
004EB17F   49                     dec     ecx
004EB180   8BC3                   mov     eax, ebx
004EB182   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB184   E83335FAFF             call    0048E6BC
004EB189   BB01000000             mov     ebx, $00000001
004EB18E   EB01                   jmp     004EB191
004EB190   43                     inc     ebx
004EB191   8D045B                 lea     eax, [ebx+ebx*2]
004EB194   8B15745D4F00           mov     edx, [$004F5D74]
004EB19A   8B4C82F8               mov     ecx, [edx+eax*4-$08]
004EB19E   8D045B                 lea     eax, [ebx+ebx*2]
004EB1A1   8B15745D4F00           mov     edx, [$004F5D74]
004EB1A7   8B5482F4               mov     edx, [edx+eax*4-$0C]
004EB1AB   8D4598                 lea     eax, [ebp-$68]

* Reference to: System.@LStrCat3;
|
004EB1AE   E8859BF1FF             call    00404D38
004EB1B3   8B4598                 mov     eax, [ebp-$68]
004EB1B6   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EB1B9   E87A9CF1FF             call    00404E38
004EB1BE   7408                   jz      004EB1C8
004EB1C0   81FB43010000           cmp     ebx, $00000143
004EB1C6   7CC8                   jl      004EB190
004EB1C8   8D045B                 lea     eax, [ebx+ebx*2]
004EB1CB   8B15745D4F00           mov     edx, [$004F5D74]
004EB1D1   8B4C82F8               mov     ecx, [edx+eax*4-$08]
004EB1D5   8D045B                 lea     eax, [ebx+ebx*2]
004EB1D8   8B15745D4F00           mov     edx, [$004F5D74]
004EB1DE   8B5482F4               mov     edx, [edx+eax*4-$0C]
004EB1E2   8D4594                 lea     eax, [ebp-$6C]

* Reference to: System.@LStrCat3;
|
004EB1E5   E84E9BF1FF             call    00404D38
004EB1EA   8B4594                 mov     eax, [ebp-$6C]
004EB1ED   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EB1F0   E8439CF1FF             call    00404E38
004EB1F5   753D                   jnz     004EB234
004EB1F7   8D045B                 lea     eax, [ebx+ebx*2]
004EB1FA   8B15745D4F00           mov     edx, [$004F5D74]
004EB200   8B4C82FC               mov     ecx, [edx+eax*4-$04]
004EB204   8D4590                 lea     eax, [ebp-$70]
004EB207   BAE0B34E00             mov     edx, $004EB3E0

* Reference to: System.@LStrCat3;
|
004EB20C   E8279BF1FF             call    00404D38
004EB211   8B4590                 mov     eax, [ebp-$70]
004EB214   50                     push    eax
004EB215   8B87B0030000           mov     eax, [edi+$03B0]
004EB21B   8B884C020000           mov     ecx, [eax+$024C]
004EB221   49                     dec     ecx
004EB222   8B87B0030000           mov     eax, [edi+$03B0]
004EB228   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB22D   E88A34FAFF             call    0048E6BC
004EB232   EB1C                   jmp     004EB250
004EB234   6804595400             push    $00545904
004EB239   8B87B0030000           mov     eax, [edi+$03B0]
004EB23F   8B884C020000           mov     ecx, [eax+$024C]
004EB245   49                     dec     ecx
004EB246   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB24B   E86C34FAFF             call    0048E6BC
004EB250   8BCE                   mov     ecx, esi
004EB252   03C9                   add     ecx, ecx
004EB254   8B45F4                 mov     eax, [ebp-$0C]
004EB257   0FB680FC6D4F00         movzx   eax, byte ptr [eax+$4F6DFC]
004EB25E   D3E8                   shr     eax, cl
004EB260   83E003                 and     eax, +$03
004EB263   48                     dec     eax
004EB264   7408                   jz      004EB26E
004EB266   48                     dec     eax
004EB267   7423                   jz      004EB28C
004EB269   48                     dec     eax
004EB26A   743E                   jz      004EB2AA
004EB26C   EB58                   jmp     004EB2C6
004EB26E   6834595400             push    $00545934
004EB273   8B87B0030000           mov     eax, [edi+$03B0]
004EB279   8B884C020000           mov     ecx, [eax+$024C]
004EB27F   49                     dec     ecx
004EB280   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB285   E83234FAFF             call    0048E6BC
004EB28A   EB3A                   jmp     004EB2C6
004EB28C   6854595400             push    $00545954
004EB291   8B87B0030000           mov     eax, [edi+$03B0]
004EB297   8B884C020000           mov     ecx, [eax+$024C]
004EB29D   49                     dec     ecx
004EB29E   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB2A3   E81434FAFF             call    0048E6BC
004EB2A8   EB1C                   jmp     004EB2C6
004EB2AA   6844595400             push    $00545944
004EB2AF   8B87B0030000           mov     eax, [edi+$03B0]
004EB2B5   8B884C020000           mov     ecx, [eax+$024C]
004EB2BB   49                     dec     ecx
004EB2BC   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB2C1   E8F633FAFF             call    0048E6BC
004EB2C6   46                     inc     esi
004EB2C7   83FE04                 cmp     esi, +$04
004EB2CA   0F853CFEFFFF           jnz     004EB10C
004EB2D0   8345F405               add     dword ptr [ebp-$0C], +$05
004EB2D4   FF45F8                 inc     dword ptr [ebp-$08]
004EB2D7   837DF802               cmp     dword ptr [ebp-$08], +$02
004EB2DB   0F8529FEFFFF           jnz     004EB10A
004EB2E1   8D458C                 lea     eax, [ebp-$74]
004EB2E4   50                     push    eax
004EB2E5   8B87B0030000           mov     eax, [edi+$03B0]
004EB2EB   B901000000             mov     ecx, $00000001
004EB2F0   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB2F5   E85233FAFF             call    0048E64C
004EB2FA   837D8C00               cmp     dword ptr [ebp-$74], +$00
004EB2FE   751A                   jnz     004EB31A
004EB300   6868595400             push    $00545968
004EB305   8B87B0030000           mov     eax, [edi+$03B0]
004EB30B   B901000000             mov     ecx, $00000001
004EB310   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB315   E8A233FAFF             call    0048E6BC
004EB31A   8D4588                 lea     eax, [ebp-$78]
004EB31D   50                     push    eax
004EB31E   8B87B0030000           mov     eax, [edi+$03B0]
004EB324   B901000000             mov     ecx, $00000001
004EB329   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB32E   E81933FAFF             call    0048E64C
004EB333   8B4588                 mov     eax, [ebp-$78]
004EB336   BA68595400             mov     edx, $00545968

* Reference to: System.@LStrCmp;
|
004EB33B   E8F89AF1FF             call    00404E38
004EB340   7409                   jz      004EB34B
004EB342   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004EB349   750F                   jnz     004EB35A
004EB34B   8B877C030000           mov     eax, [edi+$037C]
004EB351   33D2                   xor     edx, edx
004EB353   8B08                   mov     ecx, [eax]
004EB355   FF5164                 call    dword ptr [ecx+$64]
004EB358   EB0D                   jmp     004EB367
004EB35A   8B877C030000           mov     eax, [edi+$037C]
004EB360   B201                   mov     dl, $01
004EB362   8B08                   mov     ecx, [eax]
004EB364   FF5164                 call    dword ptr [ecx+$64]
004EB367   33C0                   xor     eax, eax
004EB369   5A                     pop     edx
004EB36A   59                     pop     ecx
004EB36B   59                     pop     ecx
004EB36C   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[ãÂ]√'
|
004EB36F   689EB34E00             push    $004EB39E
004EB374   8D4588                 lea     eax, [ebp-$78]
004EB377   BA07000000             mov     edx, $00000007

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EB37C   E8CF96F1FF             call    00404A50
004EB381   8D45A8                 lea     eax, [ebp-$58]
004EB384   BA06000000             mov     edx, $00000006

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EB389   E8C296F1FF             call    00404A50
004EB38E   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004EB391   E89696F1FF             call    00404A2C
004EB396   C3                     ret


* Reference to: System.@HandleFinally;
|
004EB397   E91090F1FF             jmp     004043AC
004EB39C   EBD6                   jmp     004EB374

****** END
|
004EB39E   5F                     pop     edi
004EB39F   5E                     pop     esi
004EB3A0   5B                     pop     ebx
004EB3A1   8BE5                   mov     esp, ebp
004EB3A3   5D                     pop     ebp
004EB3A4   C3                     ret

*)
end;

procedure TForm1.MenuItem_SaveClick(Sender : TObject);
begin
(*
004EB9F0   55                     push    ebp
004EB9F1   8BEC                   mov     ebp, esp
004EB9F3   33C9                   xor     ecx, ecx
004EB9F5   51                     push    ecx
004EB9F6   51                     push    ecx
004EB9F7   51                     push    ecx
004EB9F8   51                     push    ecx
004EB9F9   53                     push    ebx
004EB9FA   8BD8                   mov     ebx, eax
004EB9FC   33C0                   xor     eax, eax
004EB9FE   55                     push    ebp

* Possible String Reference to: 'È÷àÒˇÎ€[ãÂ]√'
|
004EB9FF   68D1BA4E00             push    $004EBAD1

***** TRY
|
004EBA04   64FF30                 push    dword ptr fs:[eax]
004EBA07   648920                 mov     fs:[eax], esp

* Reference to: SysUtils.Now:TDateTime;
|
004EBA0A   E849F5F1FF             call    0040AF58
004EBA0F   83C4F8                 add     esp, -$08
004EBA12   DD1C24                 fstp    qword ptr [esp]
004EBA15   9B                     wait
004EBA16   8D55FC                 lea     edx, [ebp-$04]

* Possible String Reference to: 'yymmddhhnn'
|
004EBA19   B8E8BA4E00             mov     eax, $004EBAE8

|
004EBA1E   E8B101F2FF             call    0040BBD4
004EBA23   FF75FC                 push    dword ptr [ebp-$04]
004EBA26   68FCBA4E00             push    $004EBAFC
004EBA2B   8D4DF8                 lea     ecx, [ebp-$08]
004EBA2E   8A15A56D4F00           mov     dl, byte ptr [$004F6DA5]
004EBA34   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EBA36   E89175FFFF             call    004E2FCC
004EBA3B   FF75F8                 push    dword ptr [ebp-$08]

* Possible String Reference to: '.cedat'
|
004EBA3E   6808BB4E00             push    $004EBB08

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBA43   8B8338030000           mov     eax, [ebx+$0338]
004EBA49   83C078                 add     eax, +$78
004EBA4C   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004EBA51   E85693F1FF             call    00404DAC

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBA56   8B8338030000           mov     eax, [ebx+$0338]
004EBA5C   8B10                   mov     edx, [eax]

* Reference to method TSaveDialog.Execute()
|
004EBA5E   FF523C                 call    dword ptr [edx+$3C]
004EBA61   84C0                   test    al, al
004EBA63   7441                   jz      004EBAA6
004EBA65   6A00                   push    $00
004EBA67   8D55F4                 lea     edx, [ebp-$0C]

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBA6A   8B8338030000           mov     eax, [ebx+$0338]

* Reference to: Dialogs.TOpenDialog.GetFileName(TOpenDialog):TFileName;
|
004EBA70   E86F67F4FF             call    004321E4
004EBA75   8B45F4                 mov     eax, [ebp-$0C]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EBA78   E86F94F1FF             call    00404EEC
004EBA7D   50                     push    eax
004EBA7E   8D45F0                 lea     eax, [ebp-$10]

* Possible String Reference to: 'temp.tmp'
|
004EBA81   B918BB4E00             mov     ecx, $004EBB18
004EBA86   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EBA8C   E8A792F1FF             call    00404D38
004EBA91   8B45F0                 mov     eax, [ebp-$10]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EBA94   E85394F1FF             call    00404EEC
004EBA99   50                     push    eax

* Reference to: kernel32.CopyFileA()
|
004EBA9A   E839B4F1FF             call    00406ED8
004EBA9F   C60519724F0001         mov     byte ptr [$004F7219], $01
004EBAA6   33C0                   xor     eax, eax
004EBAA8   5A                     pop     edx
004EBAA9   59                     pop     ecx
004EBAAA   59                     pop     ecx
004EBAAB   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[ãÂ]√'
|
004EBAAE   68D8BA4E00             push    $004EBAD8
004EBAB3   8D45F0                 lea     eax, [ebp-$10]

* Reference to: System.@LStrClr(void;void);
|
004EBAB6   E8718FF1FF             call    00404A2C
004EBABB   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EBABE   E8698FF1FF             call    00404A2C
004EBAC3   8D45F8                 lea     eax, [ebp-$08]
004EBAC6   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EBACB   E8808FF1FF             call    00404A50
004EBAD0   C3                     ret


* Reference to: System.@HandleFinally;
|
004EBAD1   E9D688F1FF             jmp     004043AC
004EBAD6   EBDB                   jmp     004EBAB3

****** END
|
004EBAD8   5B                     pop     ebx
004EBAD9   8BE5                   mov     esp, ebp
004EBADB   5D                     pop     ebp
004EBADC   C3                     ret

*)
end;

procedure TForm1.Button_ClearDTCClick(Sender : TObject);
begin
(*
004EB464   53                     push    ebx
004EB465   56                     push    esi
004EB466   57                     push    edi
004EB467   55                     push    ebp
004EB468   83C4E0                 add     esp, -$20
004EB46B   8BF8                   mov     edi, eax
004EB46D   BEF86D4F00             mov     esi, $004F6DF8
004EB472   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EB479   0F8454010000           jz      004EB5D3
004EB47F   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EB484   2C41                   sub     al, $41
004EB486   7406                   jz      004EB48E
004EB488   04FE                   add     al, -$02
004EB48A   2C02                   sub     al, $02
004EB48C   7349                   jnb     004EB4D7
004EB48E   68FF000000             push    $000000FF
004EB493   C644240883             mov     byte ptr [esp+$08], $83
004EB498   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB49D   88442409               mov     [esp+$09], al
004EB4A1   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB4A6   8844240A               mov     [esp+$0A], al
004EB4AA   C644240B14             mov     byte ptr [esp+$0B], $14
004EB4AF   C644240C40             mov     byte ptr [esp+$0C], $40
004EB4B4   C644240D00             mov     byte ptr [esp+$0D], $00
004EB4B9   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB4BE   8844240E               mov     [esp+$0E], al
004EB4C2   8D542408               lea     edx, [esp+$08]
004EB4C6   B906000000             mov     ecx, $00000006
004EB4CB   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB4CD   E86E79FFFF             call    004E2E40
004EB4D2   E9E5000000             jmp     004EB5BC
004EB4D7   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EB4DE   754B                   jnz     004EB52B
004EB4E0   6A10                   push    $10
004EB4E2   C644241080             mov     byte ptr [esp+$10], $80
004EB4E7   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB4EC   88442411               mov     [esp+$11], al
004EB4F0   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB4F5   88442412               mov     [esp+$12], al
004EB4F9   C644241303             mov     byte ptr [esp+$13], $03
004EB4FE   C644241414             mov     byte ptr [esp+$14], $14
004EB503   C644241580             mov     byte ptr [esp+$15], $80
004EB508   C644241600             mov     byte ptr [esp+$16], $00
004EB50D   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB512   88442417               mov     [esp+$17], al
004EB516   8D542410               lea     edx, [esp+$10]
004EB51A   B907000000             mov     ecx, $00000007
004EB51F   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB521   E81A79FFFF             call    004E2E40
004EB526   E991000000             jmp     004EB5BC
004EB52B   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004EB532   7539                   jnz     004EB56D
004EB534   6A0F                   push    $0F
004EB536   C644241881             mov     byte ptr [esp+$18], $81
004EB53B   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB540   88442419               mov     [esp+$19], al
004EB544   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB549   8844241A               mov     [esp+$1A], al
004EB54D   C644241B14             mov     byte ptr [esp+$1B], $14
004EB552   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB557   8844241C               mov     [esp+$1C], al
004EB55B   8D542418               lea     edx, [esp+$18]
004EB55F   B904000000             mov     ecx, $00000004
004EB564   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB566   E8D578FFFF             call    004E2E40
004EB56B   EB4F                   jmp     004EB5BC
004EB56D   6A0F                   push    $0F
004EB56F   C644240883             mov     byte ptr [esp+$08], $83
004EB574   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB579   88442409               mov     [esp+$09], al
004EB57D   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB582   8844240A               mov     [esp+$0A], al
004EB586   C644240B14             mov     byte ptr [esp+$0B], $14
004EB58B   C644240CFF             mov     byte ptr [esp+$0C], $FF
004EB590   C644240D00             mov     byte ptr [esp+$0D], $00
004EB595   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB59A   8844240E               mov     [esp+$0E], al
004EB59E   8D542408               lea     edx, [esp+$08]
004EB5A2   B906000000             mov     ecx, $00000006
004EB5A7   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB5A9   E89278FFFF             call    004E2E40
004EB5AE   EB0C                   jmp     004EB5BC

* Reference to TApplication instance
|
004EB5B0   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004EB5B5   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EB5B7   E82852F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EB5BC   E88FBAF1FF             call    00407050
004EB5C1   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EB5C7   3DD0070000             cmp     eax, $000007D0
004EB5CC   72E2                   jb      004EB5B0
004EB5CE   E956020000             jmp     004EB829
004EB5D3   8B877C030000           mov     eax, [edi+$037C]
004EB5D9   33D2                   xor     edx, edx
004EB5DB   8B08                   mov     ecx, [eax]
004EB5DD   FF5164                 call    dword ptr [ecx+$64]
004EB5E0   33C0                   xor     eax, eax
004EB5E2   890424                 mov     [esp], eax
004EB5E5   FF0424                 inc     dword ptr [esp]
004EB5E8   833C2405               cmp     dword ptr [esp], +$05
004EB5EC   7E0C                   jle     004EB5FA
004EB5EE   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB5F0   E8D3DFFFFF             call    004E95C8
004EB5F5   E945020000             jmp     004EB83F
004EB5FA   33DB                   xor     ebx, ebx
004EB5FC   8BC6                   mov     eax, esi
004EB5FE   C60000                 mov     byte ptr [eax], $00
004EB601   43                     inc     ebx
004EB602   40                     inc     eax
004EB603   81FB00010000           cmp     ebx, $00000100
004EB609   75F3                   jnz     004EB5FE
004EB60B   6A0F                   push    $0F
004EB60D   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB612   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004EB613   E8D0BAF1FF             call    004070E8
004EB618   33ED                   xor     ebp, ebp
004EB61A   EB27                   jmp     004EB643
004EB61C   6A00                   push    $00
004EB61E   68A06D4F00             push    $004F6DA0
004EB623   6A01                   push    $01
004EB625   56                     push    esi
004EB626   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB62B   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB62C   E8BFBAF1FF             call    004070F0
004EB631   45                     inc     ebp
004EB632   83FD64                 cmp     ebp, +$64
004EB635   7E0C                   jle     004EB643
004EB637   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB639   E88ADFFFFF             call    004E95C8
004EB63E   E9FC010000             jmp     004EB83F
004EB643   8A06                   mov     al, byte ptr [esi]
004EB645   2C06                   sub     al, $06
004EB647   7408                   jz      004EB651
004EB649   2C08                   sub     al, $08
004EB64B   7404                   jz      004EB651
004EB64D   2C02                   sub     al, $02
004EB64F   75CB                   jnz     004EB61C
004EB651   33DB                   xor     ebx, ebx
004EB653   8A1E                   mov     bl, byte ptr [esi]
004EB655   6A00                   push    $00
004EB657   68A06D4F00             push    $004F6DA0
004EB65C   6A01                   push    $01
004EB65E   56                     push    esi
004EB65F   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB664   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB665   E886BAF1FF             call    004070F0
004EB66A   83FB10                 cmp     ebx, +$10
004EB66D   7505                   jnz     004EB674
004EB66F   803EA1                 cmp     byte ptr [esi], $A1
004EB672   75CF                   jnz     004EB643
004EB674   83FB06                 cmp     ebx, +$06
004EB677   7505                   jnz     004EB67E
004EB679   803EF0                 cmp     byte ptr [esi], $F0
004EB67C   75C5                   jnz     004EB643
004EB67E   83FB0E                 cmp     ebx, +$0E
004EB681   7505                   jnz     004EB688
004EB683   803EA0                 cmp     byte ptr [esi], $A0
004EB686   75BB                   jnz     004EB643
004EB688   6A00                   push    $00
004EB68A   68A06D4F00             push    $004F6DA0
004EB68F   53                     push    ebx
004EB690   56                     push    esi
004EB691   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB696   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB697   E854BAF1FF             call    004070F0
004EB69C   833C2403               cmp     dword ptr [esp], +$03
004EB6A0   7D15                   jnl     004EB6B7
004EB6A2   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EB6A4   E8AB75FAFF             call    00492C54
004EB6A9   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EB6AB   E8CC2CF2FF             call    0040E37C
004EB6B0   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EB6B2   E8A575FAFF             call    00492C5C
004EB6B7   6A04                   push    $04
004EB6B9   C644242002             mov     byte ptr [esp+$20], $02
004EB6BE   C6442421B1             mov     byte ptr [esp+$21], $B1
004EB6C3   C644242200             mov     byte ptr [esp+$22], $00
004EB6C8   C6442423B3             mov     byte ptr [esp+$23], $B3
004EB6CD   8D542420               lea     edx, [esp+$20]
004EB6D1   B903000000             mov     ecx, $00000003
004EB6D6   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB6D8   E86377FFFF             call    004E2E40
004EB6DD   BA80000000             mov     edx, $00000080
004EB6E2   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB6E7   E84C7DF1FF             call    00403438

|
004EB6EC   E8C371F1FF             call    004028B4
004EB6F1   68CC6D4F00             push    $004F6DCC
004EB6F6   8BD6                   mov     edx, esi
004EB6F8   B910000000             mov     ecx, $00000010
004EB6FD   B8006F4F00             mov     eax, $004F6F00

|
004EB702   E84979F1FF             call    00403050

|
004EB707   E8A871F1FF             call    004028B4
004EB70C   33DB                   xor     ebx, ebx
004EB70E   EB1F                   jmp     004EB72F
004EB710   6A00                   push    $00
004EB712   68A06D4F00             push    $004F6DA0
004EB717   6A01                   push    $01
004EB719   56                     push    esi
004EB71A   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB71F   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB720   E8CBB9F1FF             call    004070F0
004EB725   43                     inc     ebx
004EB726   83FB64                 cmp     ebx, +$64
004EB729   0F8FB6FEFFFF           jnle    004EB5E5
004EB72F   803E06                 cmp     byte ptr [esi], $06
004EB732   75DC                   jnz     004EB710
004EB734   BA90000000             mov     edx, $00000090
004EB739   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB73E   E8F57CF1FF             call    00403438

|
004EB743   E86C71F1FF             call    004028B4
004EB748   68CC6D4F00             push    $004F6DCC
004EB74D   8BD6                   mov     edx, esi
004EB74F   B901000000             mov     ecx, $00000001
004EB754   B8006F4F00             mov     eax, $004F6F00

|
004EB759   E8F278F1FF             call    00403050

|
004EB75E   E85171F1FF             call    004028B4
004EB763   6A00                   push    $00
004EB765   68A06D4F00             push    $004F6DA0
004EB76A   6A01                   push    $01
004EB76C   56                     push    esi
004EB76D   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB772   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB773   E878B9F1FF             call    004070F0
004EB778   803EF0                 cmp     byte ptr [esi], $F0
004EB77B   75B2                   jnz     004EB72F
004EB77D   BA91000000             mov     edx, $00000091
004EB782   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB787   E8AC7CF1FF             call    00403438

|
004EB78C   E82371F1FF             call    004028B4
004EB791   68CC6D4F00             push    $004F6DCC
004EB796   8BD6                   mov     edx, esi
004EB798   B901000000             mov     ecx, $00000001
004EB79D   B8006F4F00             mov     eax, $004F6F00

|
004EB7A2   E8A978F1FF             call    00403050

|
004EB7A7   E80871F1FF             call    004028B4
004EB7AC   6A00                   push    $00
004EB7AE   68A06D4F00             push    $004F6DA0
004EB7B3   6A01                   push    $01
004EB7B5   56                     push    esi
004EB7B6   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB7BB   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB7BC   E82FB9F1FF             call    004070F0
004EB7C1   803EAA                 cmp     byte ptr [esi], $AA
004EB7C4   0F8565FFFFFF           jnz     004EB72F
004EB7CA   BA92000000             mov     edx, $00000092
004EB7CF   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB7D4   E85F7CF1FF             call    00403438

|
004EB7D9   E8D670F1FF             call    004028B4
004EB7DE   68CC6D4F00             push    $004F6DCC
004EB7E3   8BD6                   mov     edx, esi
004EB7E5   B901000000             mov     ecx, $00000001
004EB7EA   B8006F4F00             mov     eax, $004F6F00

|
004EB7EF   E85C78F1FF             call    00403050

|
004EB7F4   E8BB70F1FF             call    004028B4
004EB7F9   6A00                   push    $00
004EB7FB   68A06D4F00             push    $004F6DA0
004EB800   6A04                   push    $04
004EB802   56                     push    esi
004EB803   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB808   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB809   E8E2B8F1FF             call    004070F0
004EB80E   68CC6D4F00             push    $004F6DCC
004EB813   8BD6                   mov     edx, esi
004EB815   B92D000000             mov     ecx, $0000002D
004EB81A   B8006F4F00             mov     eax, $004F6F00

|
004EB81F   E82C78F1FF             call    00403050

|
004EB824   E88B70F1FF             call    004028B4
004EB829   C6051B724F0001         mov     byte ptr [$004F721B], $01
004EB830   8B8740030000           mov     eax, [edi+$0340]
004EB836   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004EB83A   E8D585F1FF             call    00403E14
004EB83F   83C420                 add     esp, +$20
004EB842   5D                     pop     ebp
004EB843   5F                     pop     edi
004EB844   5E                     pop     esi
004EB845   5B                     pop     ebx
004EB846   C3                     ret

*)
end;

procedure TForm1.Button_GrafClick(Sender : TObject);
begin
(*
004EB848   53                     push    ebx
004EB849   56                     push    esi
004EB84A   57                     push    edi
004EB84B   BF94224F00             mov     edi, $004F2294
004EB850   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004EB857   7518                   jnz     004EB871
004EB859   803D34724F0000         cmp     byte ptr [$004F7234], $00
004EB860   750F                   jnz     004EB871

* Reference to TParamCaseForm instance
|
004EB862   A1DC584F00             mov     eax, dword ptr [$004F58DC]
004EB867   8B00                   mov     eax, [eax]
004EB869   8B10                   mov     edx, [eax]

* Reference to method TParamCaseForm.ShowModal()
|
004EB86B   FF92EC000000           call    dword ptr [edx+$00EC]
004EB871   803D34724F0001         cmp     byte ptr [$004F7234], $01
004EB878   757F                   jnz     004EB8F9
004EB87A   6A02                   push    $02
004EB87C   B8FC6E4F00             mov     eax, $004F6EFC
004EB881   B901000000             mov     ecx, $00000001

* Reference to class main
|
004EB886   8B15FCFA4D00           mov     edx, [$004DFAFC]

* Reference to: System.@DynArraySetLength;
|
004EB88C   E8A3A4F1FF             call    00405D34
004EB891   83C404                 add     esp, +$04
004EB894   33DB                   xor     ebx, ebx
004EB896   EB01                   jmp     004EB899
004EB898   43                     inc     ebx
004EB899   8D34DB                 lea     esi, [ebx+ebx*8]
004EB89C   8A04B7                 mov     al, byte ptr [edi+esi*4]
004EB89F   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EB8A5   75F1                   jnz     004EB898
004EB8A7   8B44B708               mov     eax, [edi+esi*4+$08]
004EB8AB   BA8C2B5400             mov     edx, $00542B8C

* Reference to: System.@LStrCmp;
|
004EB8B0   E88395F1FF             call    00404E38
004EB8B5   75E1                   jnz     004EB898
004EB8B7   8D04DB                 lea     eax, [ebx+ebx*8]
004EB8BA   8B448704               mov     eax, [edi+eax*4+$04]
004EB8BE   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EB8C4   8902                   mov     [edx], eax
004EB8C6   33DB                   xor     ebx, ebx
004EB8C8   EB01                   jmp     004EB8CB
004EB8CA   43                     inc     ebx
004EB8CB   8D34DB                 lea     esi, [ebx+ebx*8]
004EB8CE   8A04B7                 mov     al, byte ptr [edi+esi*4]
004EB8D1   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EB8D7   75F1                   jnz     004EB8CA
004EB8D9   8B44B708               mov     eax, [edi+esi*4+$08]
004EB8DD   BAA02B5400             mov     edx, $00542BA0

* Reference to: System.@LStrCmp;
|
004EB8E2   E85195F1FF             call    00404E38
004EB8E7   75E1                   jnz     004EB8CA
004EB8E9   8D04DB                 lea     eax, [ebx+ebx*8]
004EB8EC   8B448704               mov     eax, [edi+eax*4+$04]
004EB8F0   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EB8F6   894204                 mov     [edx+$04], eax
004EB8F9   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004EB8FE   E875A2F1FF             call    00405B78
004EB903   85C0                   test    eax, eax
004EB905   7E0F                   jle     004EB916

* Reference to TGrafForm instance
|
004EB907   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EB90C   8B00                   mov     eax, [eax]
004EB90E   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EB910   FF92EC000000           call    dword ptr [edx+$00EC]
004EB916   5F                     pop     edi
004EB917   5E                     pop     esi
004EB918   5B                     pop     ebx
004EB919   C3                     ret

*)
end;

procedure TForm1.RaschetParam(Sender : TObject);
begin
(*
004E69B4   55                     push    ebp
004E69B5   8BEC                   mov     ebp, esp
004E69B7   83C4E0                 add     esp, -$20
004E69BA   53                     push    ebx
004E69BB   56                     push    esi
004E69BC   57                     push    edi
004E69BD   33DB                   xor     ebx, ebx
004E69BF   895DE0                 mov     [ebp-$20], ebx
004E69C2   895DE4                 mov     [ebp-$1C], ebx
004E69C5   895DF0                 mov     [ebp-$10], ebx
004E69C8   894DFC                 mov     [ebp-$04], ecx
004E69CB   8BFA                   mov     edi, edx
004E69CD   8B7510                 mov     esi, [ebp+$10]
004E69D0   8B450C                 mov     eax, [ebp+$0C]
004E69D3   85C0                   test    eax, eax
004E69D5   7404                   jz      004E69DB
004E69D7   33D2                   xor     edx, edx
004E69D9   8910                   mov     [eax], edx
004E69DB   33C0                   xor     eax, eax
004E69DD   55                     push    ebp
004E69DE   686B934E00             push    $004E936B

***** TRY
|
004E69E3   64FF30                 push    dword ptr fs:[eax]
004E69E6   648920                 mov     fs:[eax], esp
004E69E9   33C0                   xor     eax, eax
004E69EB   8945F8                 mov     [ebp-$08], eax
004E69EE   8B4508                 mov     eax, [ebp+$08]
004E69F1   C700FFFFFFFF           mov     dword ptr [eax], $FFFFFFFF
004E69F7   33DB                   xor     ebx, ebx
004E69F9   EB01                   jmp     004E69FC
004E69FB   43                     inc     ebx
004E69FC   8D04DB                 lea     eax, [ebx+ebx*8]
004E69FF   8A148594224F00         mov     dl, byte ptr [$4F2294+eax*4]
004E6A06   3A15A76D4F00           cmp     dl, byte ptr [$004F6DA7]
004E6A0C   7509                   jnz     004E6A17
004E6A0E   3B3C8598224F00         cmp     edi, [$4F2298+eax*4]
004E6A15   7408                   jz      004E6A1F
004E6A17   81FB75010000           cmp     ebx, $00000175
004E6A1D   7EDC                   jle     004E69FB
004E6A1F   81FB76010000           cmp     ebx, $00000176
004E6A25   0F841A290000           jz      004E9345
004E6A2B   8B4508                 mov     eax, [ebp+$08]
004E6A2E   8918                   mov     [eax], ebx
004E6A30   803DA76D4F0021         cmp     byte ptr [$004F6DA7], $21
004E6A37   7537                   jnz     004E6A70
004E6A39   803DFE6D4F009D         cmp     byte ptr [$004F6DFE], $9D
004E6A40   752E                   jnz     004E6A70
004E6A42   8D04DB                 lea     eax, [ebx+ebx*8]
004E6A45   8B0485A8224F00         mov     eax, [$4F22A8+eax*4]
004E6A4C   83E818                 sub     eax, +$18
004E6A4F   7408                   jz      004E6A59
004E6A51   48                     dec     eax
004E6A52   83E80E                 sub     eax, +$0E
004E6A55   720B                   jb      004E6A62
004E6A57   EB12                   jmp     004E6A6B
004E6A59   C745F802000000         mov     dword ptr [ebp-$08], $00000002
004E6A60   EB0E                   jmp     004E6A70
004E6A62   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004E6A69   EB05                   jmp     004E6A70
004E6A6B   33C0                   xor     eax, eax
004E6A6D   8945F8                 mov     [ebp-$08], eax
004E6A70   837DFC01               cmp     dword ptr [ebp-$04], +$01
004E6A74   0F84E1270000           jz      004E925B
004E6A7A   8D04DB                 lea     eax, [ebx+ebx*8]
004E6A7D   8B1485AC224F00         mov     edx, [$4F22AC+eax*4]
004E6A84   83EA01                 sub     edx, +$01
004E6A87   720A                   jb      004E6A93
004E6A89   743E                   jz      004E6AC9
004E6A8B   4A                     dec     edx
004E6A8C   7457                   jz      004E6AE5
004E6A8E   E988000000             jmp     004E6B1B
004E6A93   8B0485A8224F00         mov     eax, [$4F22A8+eax*4]
004E6A9A   40                     inc     eax
004E6A9B   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6A9E   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6AA5   C1E008                 shl     eax, $08
004E6AA8   8D14DB                 lea     edx, [ebx+ebx*8]
004E6AAB   8B1495A8224F00         mov     edx, [$4F22A8+edx*4]
004E6AB2   2B55F8                 sub     edx, dword ptr [ebp-$08]
004E6AB5   0FB692F86D4F00         movzx   edx, byte ptr [edx+$4F6DF8]
004E6ABC   03C2                   add     eax, edx
004E6ABE   8945F4                 mov     [ebp-$0C], eax
004E6AC1   DB45F4                 fild    dword ptr [ebp-$0C]
004E6AC4   DD1E                   fstp    qword ptr [esi]
004E6AC6   9B                     wait
004E6AC7   EB59                   jmp     004E6B22
004E6AC9   8B0485A8224F00         mov     eax, [$4F22A8+eax*4]
004E6AD0   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6AD3   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6ADA   8945F4                 mov     [ebp-$0C], eax
004E6ADD   DB45F4                 fild    dword ptr [ebp-$0C]
004E6AE0   DD1E                   fstp    qword ptr [esi]
004E6AE2   9B                     wait
004E6AE3   EB3D                   jmp     004E6B22
004E6AE5   8B0485A8224F00         mov     eax, [$4F22A8+eax*4]
004E6AEC   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6AEF   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6AF6   C1E008                 shl     eax, $08
004E6AF9   8D14DB                 lea     edx, [ebx+ebx*8]
004E6AFC   8B1495A8224F00         mov     edx, [$4F22A8+edx*4]
004E6B03   42                     inc     edx
004E6B04   2B55F8                 sub     edx, dword ptr [ebp-$08]
004E6B07   0FB692F86D4F00         movzx   edx, byte ptr [edx+$4F6DF8]
004E6B0E   03C2                   add     eax, edx
004E6B10   8945F4                 mov     [ebp-$0C], eax
004E6B13   DB45F4                 fild    dword ptr [ebp-$0C]
004E6B16   DD1E                   fstp    qword ptr [esi]
004E6B18   9B                     wait
004E6B19   EB07                   jmp     004E6B22
004E6B1B   33C0                   xor     eax, eax
004E6B1D   8906                   mov     [esi], eax
004E6B1F   894604                 mov     [esi+$04], eax
004E6B22   33C0                   xor     eax, eax
004E6B24   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E6B29   83C0EF                 add     eax, -$11
004E6B2C   83F833                 cmp     eax, +$33
004E6B2F   0F8726270000           jnbe    004E925B
004E6B35   8A80426B4E00           mov     al, byte ptr [eax+$4E6B42]
004E6B3B   FF2485766B4E00         jmp     dword ptr [$4E6B76+eax*4]
004E6B42   0102                   add     [edx], eax
004E6B44   030400                 add     eax, [eax+eax]
004E6B47   0000                   add     [eax], al
004E6B49   0000                   add     [eax], al
004E6B4B   0000                   add     [eax], al
004E6B4D   0000                   add     [eax], al
004E6B4F   0000                   add     [eax], al
004E6B51   000506000000           add     [$00000006], al
004E6B57   0000                   add     [eax], al
004E6B59   0000                   add     [eax], al
004E6B5B   0000                   add     [eax], al
004E6B5D   0000                   add     [eax], al
004E6B5F   0000                   add     [eax], al
004E6B61   0000                   add     [eax], al
004E6B63   07                     pop     es
004E6B64   0000                   add     [eax], al
004E6B66   0000                   add     [eax], al
004E6B68   0000                   add     [eax], al
004E6B6A   0000                   add     [eax], al
004E6B6C   0000                   add     [eax], al
004E6B6E   0000                   add     [eax], al
004E6B70   0000                   add     [eax], al
004E6B72   0809                   or      [ecx], cl
004E6B74   0A0B                   or      cl, byte ptr [ebx]
004E6B76   5B                     pop     ebx
004E6B77   92                     xchg    eax, edx
004E6B78   4E                     dec     esi
004E6B79   00A66B4E00F6           add     [esi+$F6004E6B], ah
004E6B7F   704E                   jo      004E6BCF
004E6B81   00917A4E00C8           add     [ecx+$C8004E7A], dl
004E6B87   7F4E                   jnle    004E6BD7
004E6B89   005685                 add     [esi-$7B], dl
004E6B8C   4E                     dec     esi
004E6B8D   006189                 add     [ecx-$77], ah
004E6B90   4E                     dec     esi
004E6B91   00438C                 add     [ebx-$74], al
004E6B94   4E                     dec     esi
004E6B95   001A                   add     [edx], bl
004E6B97   8D4E00                 lea     ecx, [esi+$00]
004E6B9A   B48D                   mov     ah, $8D
004E6B9C   4E                     dec     esi
004E6B9D   00978E4E00AB           add     [edi+$AB004E8E], dl
004E6BA3   90                     nop
004E6BA4   4E                     dec     esi
004E6BA5   0083FF380F87           add     [ebx+$870F38FF], al
004E6BAB   AC                     lodsb
004E6BAC   260000                 add     es:[eax], al
004E6BAF   0FB6BFBD6B4E00         movzx   edi, byte ptr [edi+$4E6BBD]
004E6BB6   FF24BDF66B4E00         jmp     dword ptr [$4E6BF6+edi*4]
004E6BBD   0001                   add     [ecx], al
004E6BBF   0102                   add     [edx], eax
004E6BC1   030404                 add     eax, [esp+eax]
004E6BC4   030506070809           add     eax, [$09080706]
004E6BCA   0A03                   or      al, byte ptr [ebx]
004E6BCC   0302                   add     eax, [edx]
004E6BCE   020B                   add     cl, byte ptr [ebx]
004E6BD0   0C0D                   or      al, $0D
004E6BD2   0E                     push    cs
004E6BD3   0F0F                   DB  $0F, $0F  //
004E6BD5   0E                     push    cs
004E6BD6   0E                     push    cs
004E6BD7   1010                   adc     [eax], dl
004E6BD9   1010                   adc     [eax], dl
004E6BDB   1112                   adc     [edx], edx
004E6BDD   0303                   add     eax, [ebx]
004E6BDF   0303                   add     eax, [ebx]
004E6BE1   0303                   add     eax, [ebx]
004E6BE3   0303                   add     eax, [ebx]
004E6BE5   0303                   add     eax, [ebx]
004E6BE7   0202                   add     al, byte ptr [edx]
004E6BE9   0303                   add     eax, [ebx]
004E6BEB   1212                   adc     dl, byte ptr [edx]
004E6BED   1212                   adc     dl, byte ptr [edx]
004E6BEF   1212                   adc     dl, byte ptr [edx]
004E6BF1   13141516175B92         adc     edx, [$925B1716+edx]
004E6BF8   4E                     dec     esi
004E6BF9   00566C                 add     [esi+$6C], dl
004E6BFC   4E                     dec     esi
004E6BFD   006C6C4E               add     [esp+ebp*2+$4E], ch
004E6C01   007C6C4E               add     [esp+ebp*2+$4E], bh
004E6C05   008B6C4E009B           add     [ebx+$9B004E6C], cl
004E6C0B   6C                     insb
004E6C0C   4E                     dec     esi
004E6C0D   00B36C4E00C3           add     [ebx+$C3004E6C], dh
004E6C13   6C                     insb
004E6C14   4E                     dec     esi
004E6C15   00EC                   add     ah, ch
004E6C17   6C                     insb
004E6C18   4E                     dec     esi
004E6C19   00156D4E0025           add     [$25004E6D], dl
004E6C1F   6D                     insd
004E6C20   4E                     dec     esi
004E6C21   00586D                 add     [eax+$6D], bl
004E6C24   4E                     dec     esi
004E6C25   00846D4E00BF6D         add     [ebp+ebp*2+$6DBF004E], al
004E6C2C   4E                     dec     esi
004E6C2D   00CF                   add     bh, cl
004E6C2F   6D                     insd
004E6C30   4E                     dec     esi
004E6C31   0002                   add     [edx], al
004E6C33   6E                     outsb
004E6C34   4E                     dec     esi
004E6C35   0012                   add     [edx], dl
004E6C37   6E                     outsb
004E6C38   4E                     dec     esi
004E6C39   0028                   add     [eax], ch
004E6C3B   6E                     outsb
004E6C3C   4E                     dec     esi
004E6C3D   003E                   add     [esi], bh
004E6C3F   6E                     outsb
004E6C40   4E                     dec     esi
004E6C41   004E6E                 add     [esi+$6E], cl
004E6C44   4E                     dec     esi
004E6C45   00E6                   add     dh, ah
004E6C47   6E                     outsb
004E6C48   4E                     dec     esi
004E6C49   006E6F                 add     [esi+$6F], ch
004E6C4C   4E                     dec     esi
004E6C4D   005F70                 add     [edi+$70], bl
004E6C50   4E                     dec     esi
004E6C51   00A6704E00DD           add     [esi+$DD004E70], ah
004E6C57   06                     push    es
004E6C58   D8257C934E00           fsub    dword ptr [$004E937C]
004E6C5E   D80D80934E00           fmul    dword ptr [$004E9380]
004E6C64   DD1E                   fstp    qword ptr [esi]
004E6C66   9B                     wait
004E6C67   E9EF250000             jmp     004E925B
004E6C6C   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E6C72   DC3E                   fdivr   qword ptr [esi]
004E6C74   DD1E                   fstp    qword ptr [esi]
004E6C76   9B                     wait
004E6C77   E9DF250000             jmp     004E925B
004E6C7C   8B06                   mov     eax, [esi]
004E6C7E   8906                   mov     [esi], eax
004E6C80   8B4604                 mov     eax, [esi+$04]
004E6C83   894604                 mov     [esi+$04], eax
004E6C86   E9D0250000             jmp     004E925B
004E6C8B   DD06                   fld     qword ptr [esi]
004E6C8D   D83590934E00           fdiv    dword ptr [$004E9390]
004E6C93   DD1E                   fstp    qword ptr [esi]
004E6C95   9B                     wait
004E6C96   E9C0250000             jmp     004E925B
004E6C9B   DD06                   fld     qword ptr [esi]
004E6C9D   D83594934E00           fdiv    dword ptr [$004E9394]
004E6CA3   DC06                   fadd    qword ptr [esi]
004E6CA5   D83598934E00           fdiv    dword ptr [$004E9398]
004E6CAB   DD1E                   fstp    qword ptr [esi]
004E6CAD   9B                     wait
004E6CAE   E9A8250000             jmp     004E925B
004E6CB3   DB2D9C934E00           fld     tbyte ptr [$004E939C]
004E6CB9   DC0E                   fmul    qword ptr [esi]
004E6CBB   DD1E                   fstp    qword ptr [esi]
004E6CBD   9B                     wait
004E6CBE   E998250000             jmp     004E925B
004E6CC3   DD06                   fld     qword ptr [esi]
004E6CC5   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E6CCB   DFE0                   fstsw   ax
004E6CCD   9E                     sahf
004E6CCE   7610                   jbe     004E6CE0
004E6CD0   DB2DAC934E00           fld     tbyte ptr [$004E93AC]
004E6CD6   DC3E                   fdivr   qword ptr [esi]
004E6CD8   DD1E                   fstp    qword ptr [esi]
004E6CDA   9B                     wait
004E6CDB   E97B250000             jmp     004E925B
004E6CE0   33C0                   xor     eax, eax
004E6CE2   8906                   mov     [esi], eax
004E6CE4   894604                 mov     [esi+$04], eax
004E6CE7   E96F250000             jmp     004E925B
004E6CEC   DD06                   fld     qword ptr [esi]
004E6CEE   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E6CF4   DFE0                   fstsw   ax
004E6CF6   9E                     sahf
004E6CF7   7610                   jbe     004E6D09
004E6CF9   DD06                   fld     qword ptr [esi]
004E6CFB   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E6D01   DD1E                   fstp    qword ptr [esi]
004E6D03   9B                     wait
004E6D04   E952250000             jmp     004E925B
004E6D09   33C0                   xor     eax, eax
004E6D0B   8906                   mov     [esi], eax
004E6D0D   894604                 mov     [esi+$04], eax
004E6D10   E946250000             jmp     004E925B
004E6D15   DD06                   fld     qword ptr [esi]
004E6D17   D835BC934E00           fdiv    dword ptr [$004E93BC]
004E6D1D   DD1E                   fstp    qword ptr [esi]
004E6D1F   9B                     wait
004E6D20   E936250000             jmp     004E925B
004E6D25   DD06                   fld     qword ptr [esi]
004E6D27   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E6D2D   DFE0                   fstsw   ax
004E6D2F   9E                     sahf
004E6D30   7310                   jnb     004E6D42
004E6D32   DD06                   fld     qword ptr [esi]
004E6D34   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E6D3A   DD1E                   fstp    qword ptr [esi]
004E6D3C   9B                     wait
004E6D3D   E919250000             jmp     004E925B
004E6D42   DD06                   fld     qword ptr [esi]
004E6D44   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E6D4A   D825C4934E00           fsub    dword ptr [$004E93C4]
004E6D50   DD1E                   fstp    qword ptr [esi]
004E6D52   9B                     wait
004E6D53   E903250000             jmp     004E925B
004E6D58   DD06                   fld     qword ptr [esi]
004E6D5A   D81DC8934E00           fcomp   dword ptr [$004E93C8]
004E6D60   DFE0                   fstsw   ax
004E6D62   9E                     sahf
004E6D63   7610                   jbe     004E6D75
004E6D65   DD06                   fld     qword ptr [esi]
004E6D67   D825CC934E00           fsub    dword ptr [$004E93CC]
004E6D6D   DD1E                   fstp    qword ptr [esi]
004E6D6F   9B                     wait
004E6D70   E9E6240000             jmp     004E925B
004E6D75   8B06                   mov     eax, [esi]
004E6D77   8906                   mov     [esi], eax
004E6D79   8B4604                 mov     eax, [esi+$04]
004E6D7C   894604                 mov     [esi+$04], eax
004E6D7F   E9D7240000             jmp     004E925B
004E6D84   8D55F0                 lea     edx, [ebp-$10]

* Reference to TOptionsForm instance
|
004E6D87   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E6D8C   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.MaskEdit : TMaskEdit
|
004E6D8E   8B8034030000           mov     eax, [eax+$0334]

* Reference to: Mask.TCustomMaskEdit.GetText(TCustomMaskEdit):TMaskedText;
|
004E6D94   E883C9F9FF             call    0048371C
004E6D99   8B45F0                 mov     eax, [ebp-$10]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004E6D9C   E85B24F2FF             call    004091FC
004E6DA1   8945F4                 mov     [ebp-$0C], eax
004E6DA4   DB45F4                 fild    dword ptr [ebp-$0C]
004E6DA7   D835D0934E00           fdiv    dword ptr [$004E93D0]
004E6DAD   DC0E                   fmul    qword ptr [esi]
004E6DAF   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E6DB5   DEF9                   fdivp   st(1), st(0)
004E6DB7   DD1E                   fstp    qword ptr [esi]
004E6DB9   9B                     wait
004E6DBA   E99C240000             jmp     004E925B
004E6DBF   DD06                   fld     qword ptr [esi]
004E6DC1   D835D4934E00           fdiv    dword ptr [$004E93D4]
004E6DC7   DD1E                   fstp    qword ptr [esi]
004E6DC9   9B                     wait
004E6DCA   E98C240000             jmp     004E925B
004E6DCF   DD06                   fld     qword ptr [esi]
004E6DD1   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E6DD7   DFE0                   fstsw   ax
004E6DD9   9E                     sahf
004E6DDA   7310                   jnb     004E6DEC
004E6DDC   DD06                   fld     qword ptr [esi]
004E6DDE   D835D4934E00           fdiv    dword ptr [$004E93D4]
004E6DE4   DD1E                   fstp    qword ptr [esi]
004E6DE6   9B                     wait
004E6DE7   E96F240000             jmp     004E925B
004E6DEC   DD06                   fld     qword ptr [esi]
004E6DEE   D835D4934E00           fdiv    dword ptr [$004E93D4]
004E6DF4   D825D0934E00           fsub    dword ptr [$004E93D0]
004E6DFA   DD1E                   fstp    qword ptr [esi]
004E6DFC   9B                     wait
004E6DFD   E959240000             jmp     004E925B
004E6E02   DB2DD8934E00           fld     tbyte ptr [$004E93D8]
004E6E08   DC3E                   fdivr   qword ptr [esi]
004E6E0A   DD1E                   fstp    qword ptr [esi]
004E6E0C   9B                     wait
004E6E0D   E949240000             jmp     004E925B
004E6E12   DD06                   fld     qword ptr [esi]
004E6E14   D80DE4934E00           fmul    dword ptr [$004E93E4]
004E6E1A   D82DE8934E00           fsubr   dword ptr [$004E93E8]
004E6E20   DD1E                   fstp    qword ptr [esi]
004E6E22   9B                     wait
004E6E23   E933240000             jmp     004E925B
004E6E28   DD06                   fld     qword ptr [esi]
004E6E2A   D80DE4934E00           fmul    dword ptr [$004E93E4]
004E6E30   D825EC934E00           fsub    dword ptr [$004E93EC]
004E6E36   DD1E                   fstp    qword ptr [esi]
004E6E38   9B                     wait
004E6E39   E91D240000             jmp     004E925B
004E6E3E   DD06                   fld     qword ptr [esi]
004E6E40   D835F0934E00           fdiv    dword ptr [$004E93F0]
004E6E46   DD1E                   fstp    qword ptr [esi]
004E6E48   9B                     wait
004E6E49   E90D240000             jmp     004E925B
004E6E4E   6B3DC86D4F004C         imul    edi, [$004F6DC8], $4C
004E6E55   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6E5A   DD84F808010000         fld     qword ptr [eax+edi*8+$0108]
004E6E61   D81DF4934E00           fcomp   dword ptr [$004E93F4]
004E6E67   DFE0                   fstsw   ax
004E6E69   9E                     sahf
004E6E6A   746E                   jz      004E6EDA

* Reference to TOptionsForm instance
|
004E6E6C   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E6E71   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E6E73   8B8018030000           mov     eax, [eax+$0318]
004E6E79   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E6E7B   FF92CC000000           call    dword ptr [edx+$00CC]
004E6E81   8945F4                 mov     [ebp-$0C], eax
004E6E84   DB45F4                 fild    dword ptr [ebp-$0C]
004E6E87   D83598934E00           fdiv    dword ptr [$004E9398]
004E6E8D   D805F8934E00           fadd    dword ptr [$004E93F8]
004E6E93   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6E98   DD44F858               fld     qword ptr [eax+edi*8+$58]
004E6E9C   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6EA1   DC44F868               fadd    qword ptr [eax+edi*8+$68]
004E6EA5   DEC9                   fmulp   st(1), st(0)
004E6EA7   D80DFC934E00           fmul    dword ptr [$004E93FC]
004E6EAD   D80D00944E00           fmul    dword ptr [$004E9400]
004E6EB3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E6EBA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6EC0   DD44C220               fld     qword ptr [edx+eax*8+$20]
004E6EC4   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E6ECA   DEC9                   fmulp   st(1), st(0)
004E6ECC   D83504944E00           fdiv    dword ptr [$004E9404]
004E6ED2   DD1E                   fstp    qword ptr [esi]
004E6ED4   9B                     wait
004E6ED5   E981230000             jmp     004E925B
004E6EDA   33C0                   xor     eax, eax
004E6EDC   8906                   mov     [esi], eax
004E6EDE   894604                 mov     [esi+$04], eax
004E6EE1   E975230000             jmp     004E925B
004E6EE6   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E6EED   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6EF2   DD44D038               fld     qword ptr [eax+edx*8+$38]
004E6EF6   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E6EFC   DFE0                   fstsw   ax
004E6EFE   9E                     sahf
004E6EFF   7661                   jbe     004E6F62
004E6F01   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E6F08   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E6F0E   DD44C138               fld     qword ptr [ecx+eax*8+$38]
004E6F12   D81D08944E00           fcomp   dword ptr [$004E9408]
004E6F18   DFE0                   fstsw   ax
004E6F1A   9E                     sahf
004E6F1B   731A                   jnb     004E6F37
004E6F1D   D90598934E00           fld     dword ptr [$004E9398]
004E6F23   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6F28   DC8CD0A0010000         fmul    qword ptr [eax+edx*8+$01A0]
004E6F2F   DD1E                   fstp    qword ptr [esi]
004E6F31   9B                     wait
004E6F32   E924230000             jmp     004E925B
004E6F37   D905D0934E00           fld     dword ptr [$004E93D0]
004E6F3D   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E6F42   DC8CD0A0010000         fmul    qword ptr [eax+edx*8+$01A0]
004E6F49   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E6F50   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6F56   DC74C238               fdiv    qword ptr [edx+eax*8+$38]
004E6F5A   DD1E                   fstp    qword ptr [esi]
004E6F5C   9B                     wait
004E6F5D   E9F9220000             jmp     004E925B
004E6F62   33C0                   xor     eax, eax
004E6F64   8906                   mov     [esi], eax
004E6F66   894604                 mov     [esi+$04], eax
004E6F69   E9ED220000             jmp     004E925B
004E6F6E   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E6F75   7543                   jnz     004E6FBA
004E6F77   33C0                   xor     eax, eax
004E6F79   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E6F7E   69C080EE3600           imul    eax, eax, $0036EE80
004E6F84   33D2                   xor     edx, edx
004E6F86   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E6F8C   69D260EA0000           imul    edx, edx, $0000EA60
004E6F92   03C2                   add     eax, edx
004E6F94   33D2                   xor     edx, edx
004E6F96   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E6F9C   69D2E8030000           imul    edx, edx, $000003E8
004E6FA2   03C2                   add     eax, edx
004E6FA4   33D2                   xor     edx, edx
004E6FA6   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E6FAC   03D2                   add     edx, edx
004E6FAE   8D1492                 lea     edx, [edx+edx*4]
004E6FB1   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E6FB3   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E6FB8   EB0A                   jmp     004E6FC4
004E6FBA   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E6FBF   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E6FC4   33C0                   xor     eax, eax
004E6FC6   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E6FCB   69C080EE3600           imul    eax, eax, $0036EE80
004E6FD1   33D2                   xor     edx, edx
004E6FD3   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E6FD9   69D260EA0000           imul    edx, edx, $0000EA60
004E6FDF   03C2                   add     eax, edx
004E6FE1   33D2                   xor     edx, edx
004E6FE3   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E6FE9   69D2E8030000           imul    edx, edx, $000003E8
004E6FEF   03C2                   add     eax, edx
004E6FF1   33D2                   xor     edx, edx
004E6FF3   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E6FF9   03D2                   add     edx, edx
004E6FFB   8D1492                 lea     edx, [edx+edx*4]
004E6FFE   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E7000   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E7005   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E700A   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E7010   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E7015   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E701C   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7022   DD84C2A0010000         fld     qword ptr [edx+eax*8+$01A0]
004E7029   D8350C944E00           fdiv    dword ptr [$004E940C]
004E702F   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7035   DEC9                   fmulp   st(1), st(0)
004E7037   DD1E                   fstp    qword ptr [esi]
004E7039   9B                     wait
004E703A   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E7040   DC06                   fadd    qword ptr [esi]
004E7042   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E7048   9B                     wait
004E7049   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E704F   8906                   mov     [esi], eax
004E7051   8B05E06D4F00           mov     eax, [$004F6DE0]
004E7057   894604                 mov     [esi+$04], eax
004E705A   E9FC210000             jmp     004E925B
004E705F   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7066   8B15F86E4F00           mov     edx, [$004F6EF8]
004E706C   DD44C238               fld     qword ptr [edx+eax*8+$38]
004E7070   D8350C944E00           fdiv    dword ptr [$004E940C]
004E7076   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E707C   DEC9                   fmulp   st(1), st(0)
004E707E   DD1E                   fstp    qword ptr [esi]
004E7080   9B                     wait
004E7081   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E7087   DC06                   fadd    qword ptr [esi]
004E7089   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E708F   9B                     wait
004E7090   8B05E46D4F00           mov     eax, [$004F6DE4]
004E7096   8906                   mov     [esi], eax
004E7098   8B05E86D4F00           mov     eax, [$004F6DE8]
004E709E   894604                 mov     [esi+$04], eax
004E70A1   E9B5210000             jmp     004E925B
004E70A6   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E70AD   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E70B2   DD84D0B8010000         fld     qword ptr [eax+edx*8+$01B8]
004E70B9   D81D10944E00           fcomp   dword ptr [$004E9410]
004E70BF   DFE0                   fstsw   ax
004E70C1   9E                     sahf
004E70C2   0F8693210000           jbe     004E925B
004E70C8   D905D0934E00           fld     dword ptr [$004E93D0]
004E70CE   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E70D3   DC8CD0B0010000         fmul    qword ptr [eax+edx*8+$01B0]
004E70DA   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E70E1   8B15F86E4F00           mov     edx, [$004F6EF8]
004E70E7   DCB4C2B8010000         fdiv    qword ptr [edx+eax*8+$01B8]
004E70EE   DD1E                   fstp    qword ptr [esi]
004E70F0   9B                     wait
004E70F1   E965210000             jmp     004E925B
004E70F6   83FF47                 cmp     edi, +$47
004E70F9   0F875C210000           jnbe    004E925B
004E70FF   FF24BD06714E00         jmp     dword ptr [$4E7106+edi*4]
004E7106   5B                     pop     ebx
004E7107   92                     xchg    eax, edx
004E7108   4E                     dec     esi
004E7109   0026                   add     [esi], ah
004E710B   724E                   jb      004E715B
004E710D   0035724E0044           add     [$44004E72], dh
004E7113   724E                   jb      004E7163
004E7115   005A72                 add     [edx+$72], bl
004E7118   4E                     dec     esi
004E7119   006A72                 add     [edx+$72], ch
004E711C   4E                     dec     esi
004E711D   007A72                 add     [edx+$72], bh
004E7120   4E                     dec     esi
004E7121   008A724E009A           add     [edx+$9A004E72], cl
004E7127   724E                   jb      004E7177
004E7129   00AA724E00BA           add     [edx+$BA004E72], ch
004E712F   724E                   jb      004E717F
004E7131   00D6                   add     dh, dl
004E7133   724E                   jb      004E7183
004E7135   00E6                   add     dh, ah
004E7137   724E                   jb      004E7187
004E7139   00F6                   add     dh, dh
004E713B   724E                   jb      004E718B
004E713D   0006                   add     [esi], al
004E713F   734E                   jnb     004E718F
004E7141   0016                   add     [esi], dl
004E7143   734E                   jnb     004E7193
004E7145   0032                   add     [edx], dh
004E7147   734E                   jnb     004E7197
004E7149   004273                 add     [edx+$73], al
004E714C   4E                     dec     esi
004E714D   005273                 add     [edx+$73], dl
004E7150   4E                     dec     esi
004E7151   007973                 add     [ecx+$73], bh
004E7154   4E                     dec     esi
004E7155   00A0734E00C6           add     [eax+$C6004E73], ah
004E715B   734E                   jnb     004E71AB
004E715D   00ED                   add     ch, ch
004E715F   734E                   jnb     004E71AF
004E7161   00FD                   add     ch, bh
004E7163   734E                   jnb     004E71B3
004E7165   000D744E001C           add     [$1C004E74], cl
004E716B   744E                   jz      004E71BB
004E716D   002B                   add     [ebx], ch
004E716F   744E                   jz      004E71BF
004E7171   003B                   add     [ebx], bh
004E7173   744E                   jz      004E71C3
004E7175   005774                 add     [edi+$74], dl
004E7178   4E                     dec     esi
004E7179   007374                 add     [ebx+$74], dh
004E717C   4E                     dec     esi
004E717D   0083744E0092           add     [ebx+$92004E74], al
004E7183   744E                   jz      004E71D3
004E7185   00A1744E00B1           add     [ecx+$B1004E74], ah
004E718B   744E                   jz      004E71DB
004E718D   00C1                   add     cl, al
004E718F   744E                   jz      004E71DF
004E7191   00D0                   add     al, dl
004E7193   744E                   jz      004E71E3
004E7195   00F7                   add     bh, dh
004E7197   744E                   jz      004E71E7
004E7199   001E                   add     [esi], bl
004E719B   754E                   jnz     004E71EB
004E719D   004575                 add     [ebp+$75], al
004E71A0   4E                     dec     esi
004E71A1   006C754E               add     [ebp+esi*2+$4E], ch
004E71A5   0093754E00B3           add     [ebx+$B3004E75], dl
004E71AB   754E                   jnz     004E71FB
004E71AD   00D9                   add     cl, bl
004E71AF   754E                   jnz     004E71FF
004E71B1   0000                   add     [eax], al
004E71B3   764E                   jbe     004E7203
004E71B5   0027                   add     [edi], ah
004E71B7   764E                   jbe     004E7207
004E71B9   004E76                 add     [esi+$76], cl
004E71BC   4E                     dec     esi
004E71BD   007576                 add     [ebp+$76], dh
004E71C0   4E                     dec     esi
004E71C1   009B764E00C2           add     [ebx+$C2004E76], bl
004E71C7   764E                   jbe     004E7217
004E71C9   00E9                   add     cl, ch
004E71CB   764E                   jbe     004E721B
004E71CD   00F8                   add     al, bh
004E71CF   764E                   jbe     004E721F
004E71D1   0008                   add     [eax], cl
004E71D3   774E                   jnbe    004E7223
004E71D5   0018                   add     [eax], bl
004E71D7   774E                   jnbe    004E7227
004E71D9   0028                   add     [eax], ch
004E71DB   774E                   jnbe    004E722B
004E71DD   0038                   add     [eax], bh
004E71DF   774E                   jnbe    004E722F
004E71E1   004777                 add     [edi+$77], al
004E71E4   4E                     dec     esi
004E71E5   005677                 add     [esi+$77], dl
004E71E8   4E                     dec     esi
004E71E9   006577                 add     [ebp+$77], ah
004E71EC   4E                     dec     esi
004E71ED   0074774E               add     [edi+esi*2+$4E], dh
004E71F1   0083774E0099           add     [ebx+$99004E77], al
004E71F7   774E                   jnbe    004E7247
004E71F9   00A9774E00B8           add     [ecx+$B8004E77], ch
004E71FF   774E                   jnbe    004E724F
004E7201   00C8                   add     al, cl
004E7203   774E                   jnbe    004E7253
004E7205   00DE                   add     dh, bl
004E7207   774E                   jnbe    004E7257
004E7209   00EE                   add     dh, ch
004E720B   774E                   jnbe    004E725B
004E720D   000478                 add     [eax+edi*2], al
004E7210   4E                     dec     esi
004E7211   0013                   add     [ebx], dl
004E7213   784E                   js      004E7263
004E7215   0081784E0009           add     [ecx+$9004E78], al
004E721B   794E                   jns     004E726B
004E721D   00FA                   add     dl, bh
004E721F   794E                   jns     004E726F
004E7221   00417A                 add     [ecx+$7A], al
004E7224   4E                     dec     esi
004E7225   008B0689068B           add     [ebx+$8B068906], cl
004E722B   46                     inc     esi
004E722C   0489                   add     al, -$77
004E722E   46                     inc     esi
004E722F   04E9                   add     al, -$17
004E7231   262000                 and     es:[eax], al
004E7234   008B0689068B           add     [ebx+$8B068906], cl
004E723A   46                     inc     esi
004E723B   0489                   add     al, -$77
004E723D   46                     inc     esi
004E723E   04E9                   add     al, -$17
004E7240   17                     pop     ss
004E7241   2000                   and     [eax], al
004E7243   00DD                   add     ch, bl
004E7245   06                     push    es
004E7246   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E724C   D82514944E00           fsub    dword ptr [$004E9414]
004E7252   DD1E                   fstp    qword ptr [esi]
004E7254   9B                     wait
004E7255   E901200000             jmp     004E925B
004E725A   DD06                   fld     qword ptr [esi]
004E725C   D82518944E00           fsub    dword ptr [$004E9418]
004E7262   DD1E                   fstp    qword ptr [esi]
004E7264   9B                     wait
004E7265   E9F11F0000             jmp     004E925B
004E726A   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E7270   DC3E                   fdivr   qword ptr [esi]
004E7272   DD1E                   fstp    qword ptr [esi]
004E7274   9B                     wait
004E7275   E9E11F0000             jmp     004E925B
004E727A   DD06                   fld     qword ptr [esi]
004E727C   D83528944E00           fdiv    dword ptr [$004E9428]
004E7282   DD1E                   fstp    qword ptr [esi]
004E7284   9B                     wait
004E7285   E9D11F0000             jmp     004E925B
004E728A   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E7290   DC3E                   fdivr   qword ptr [esi]
004E7292   DD1E                   fstp    qword ptr [esi]
004E7294   9B                     wait
004E7295   E9C11F0000             jmp     004E925B
004E729A   DD06                   fld     qword ptr [esi]
004E729C   D80D2C944E00           fmul    dword ptr [$004E942C]
004E72A2   DD1E                   fstp    qword ptr [esi]
004E72A4   9B                     wait
004E72A5   E9B11F0000             jmp     004E925B
004E72AA   DD06                   fld     qword ptr [esi]
004E72AC   D835C8934E00           fdiv    dword ptr [$004E93C8]
004E72B2   DD1E                   fstp    qword ptr [esi]
004E72B4   9B                     wait
004E72B5   E9A11F0000             jmp     004E925B
004E72BA   DD06                   fld     qword ptr [esi]
004E72BC   D83530944E00           fdiv    dword ptr [$004E9430]
004E72C2   D80D34944E00           fmul    dword ptr [$004E9434]
004E72C8   D82D00944E00           fsubr   dword ptr [$004E9400]
004E72CE   DD1E                   fstp    qword ptr [esi]
004E72D0   9B                     wait
004E72D1   E9851F0000             jmp     004E925B
004E72D6   DD06                   fld     qword ptr [esi]
004E72D8   D83598934E00           fdiv    dword ptr [$004E9398]
004E72DE   DD1E                   fstp    qword ptr [esi]
004E72E0   9B                     wait
004E72E1   E9751F0000             jmp     004E925B
004E72E6   DD06                   fld     qword ptr [esi]
004E72E8   D83538944E00           fdiv    dword ptr [$004E9438]
004E72EE   DD1E                   fstp    qword ptr [esi]
004E72F0   9B                     wait
004E72F1   E9651F0000             jmp     004E925B
004E72F6   DD06                   fld     qword ptr [esi]
004E72F8   D8353C944E00           fdiv    dword ptr [$004E943C]
004E72FE   DD1E                   fstp    qword ptr [esi]
004E7300   9B                     wait
004E7301   E9551F0000             jmp     004E925B
004E7306   DD06                   fld     qword ptr [esi]
004E7308   D8353C944E00           fdiv    dword ptr [$004E943C]
004E730E   DD1E                   fstp    qword ptr [esi]
004E7310   9B                     wait
004E7311   E9451F0000             jmp     004E925B
004E7316   DD06                   fld     qword ptr [esi]
004E7318   D80D40944E00           fmul    dword ptr [$004E9440]
004E731E   D83544944E00           fdiv    dword ptr [$004E9444]
004E7324   D825D0934E00           fsub    dword ptr [$004E93D0]
004E732A   DD1E                   fstp    qword ptr [esi]
004E732C   9B                     wait
004E732D   E9291F0000             jmp     004E925B
004E7332   DD06                   fld     qword ptr [esi]
004E7334   D83538944E00           fdiv    dword ptr [$004E9438]
004E733A   DD1E                   fstp    qword ptr [esi]
004E733C   9B                     wait
004E733D   E9191F0000             jmp     004E925B
004E7342   DD06                   fld     qword ptr [esi]
004E7344   D83538944E00           fdiv    dword ptr [$004E9438]
004E734A   DD1E                   fstp    qword ptr [esi]
004E734C   9B                     wait
004E734D   E9091F0000             jmp     004E925B
004E7352   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7354   E86BB8F1FF             call    00402BC4
004E7359   81E010000000           and     eax, $00000010
004E735F   33D2                   xor     edx, edx
004E7361   0FACD004               shrd    eax, edx, $04
004E7365   C1EA04                 shr     edx, $04
004E7368   8945E8                 mov     [ebp-$18], eax
004E736B   8955EC                 mov     [ebp-$14], edx
004E736E   DF6DE8                 fild    qword ptr [ebp-$18]
004E7371   DD1E                   fstp    qword ptr [esi]
004E7373   9B                     wait
004E7374   E9E21E0000             jmp     004E925B
004E7379   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E737B   E844B8F1FF             call    00402BC4
004E7380   81E040000000           and     eax, $00000040
004E7386   33D2                   xor     edx, edx
004E7388   0FACD006               shrd    eax, edx, $06
004E738C   C1EA06                 shr     edx, $06
004E738F   8945E8                 mov     [ebp-$18], eax
004E7392   8955EC                 mov     [ebp-$14], edx
004E7395   DF6DE8                 fild    qword ptr [ebp-$18]
004E7398   DD1E                   fstp    qword ptr [esi]
004E739A   9B                     wait
004E739B   E9BB1E0000             jmp     004E925B
004E73A0   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E73A2   E81DB8F1FF             call    00402BC4
004E73A7   81E002000000           and     eax, $00000002
004E73AD   33D2                   xor     edx, edx
004E73AF   0FACD001               shrd    eax, edx, $01
004E73B3   D1EA                   shr     edx, 1
004E73B5   8945E8                 mov     [ebp-$18], eax
004E73B8   8955EC                 mov     [ebp-$14], edx
004E73BB   DF6DE8                 fild    qword ptr [ebp-$18]
004E73BE   DD1E                   fstp    qword ptr [esi]
004E73C0   9B                     wait
004E73C1   E9951E0000             jmp     004E925B
004E73C6   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E73C8   E8F7B7F1FF             call    00402BC4
004E73CD   81E004000000           and     eax, $00000004
004E73D3   33D2                   xor     edx, edx
004E73D5   0FACD002               shrd    eax, edx, $02
004E73D9   C1EA02                 shr     edx, $02
004E73DC   8945E8                 mov     [ebp-$18], eax
004E73DF   8955EC                 mov     [ebp-$14], edx
004E73E2   DF6DE8                 fild    qword ptr [ebp-$18]
004E73E5   DD1E                   fstp    qword ptr [esi]
004E73E7   9B                     wait
004E73E8   E96E1E0000             jmp     004E925B
004E73ED   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E73F3   DC3E                   fdivr   qword ptr [esi]
004E73F5   DD1E                   fstp    qword ptr [esi]
004E73F7   9B                     wait
004E73F8   E95E1E0000             jmp     004E925B
004E73FD   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E7403   DC3E                   fdivr   qword ptr [esi]
004E7405   DD1E                   fstp    qword ptr [esi]
004E7407   9B                     wait
004E7408   E94E1E0000             jmp     004E925B
004E740D   8B06                   mov     eax, [esi]
004E740F   8906                   mov     [esi], eax
004E7411   8B4604                 mov     eax, [esi+$04]
004E7414   894604                 mov     [esi+$04], eax
004E7417   E93F1E0000             jmp     004E925B
004E741C   8B06                   mov     eax, [esi]
004E741E   8906                   mov     [esi], eax
004E7420   8B4604                 mov     eax, [esi+$04]
004E7423   894604                 mov     [esi+$04], eax
004E7426   E9301E0000             jmp     004E925B
004E742B   DD06                   fld     qword ptr [esi]
004E742D   D82518944E00           fsub    dword ptr [$004E9418]
004E7433   DD1E                   fstp    qword ptr [esi]
004E7435   9B                     wait
004E7436   E9201E0000             jmp     004E925B
004E743B   DD06                   fld     qword ptr [esi]
004E743D   D80D40944E00           fmul    dword ptr [$004E9440]
004E7443   D83544944E00           fdiv    dword ptr [$004E9444]
004E7449   D825D0934E00           fsub    dword ptr [$004E93D0]
004E744F   DD1E                   fstp    qword ptr [esi]
004E7451   9B                     wait
004E7452   E9041E0000             jmp     004E925B
004E7457   DD06                   fld     qword ptr [esi]
004E7459   D80D48944E00           fmul    dword ptr [$004E9448]
004E745F   D83544944E00           fdiv    dword ptr [$004E9444]
004E7465   D80598934E00           fadd    dword ptr [$004E9398]
004E746B   DD1E                   fstp    qword ptr [esi]
004E746D   9B                     wait
004E746E   E9E81D0000             jmp     004E925B
004E7473   DD06                   fld     qword ptr [esi]
004E7475   D83598934E00           fdiv    dword ptr [$004E9398]
004E747B   DD1E                   fstp    qword ptr [esi]
004E747D   9B                     wait
004E747E   E9D81D0000             jmp     004E925B
004E7483   8B06                   mov     eax, [esi]
004E7485   8906                   mov     [esi], eax
004E7487   8B4604                 mov     eax, [esi+$04]
004E748A   894604                 mov     [esi+$04], eax
004E748D   E9C91D0000             jmp     004E925B
004E7492   8B06                   mov     eax, [esi]
004E7494   8906                   mov     [esi], eax
004E7496   8B4604                 mov     eax, [esi+$04]
004E7499   894604                 mov     [esi+$04], eax
004E749C   E9BA1D0000             jmp     004E925B
004E74A1   DB2D4C944E00           fld     tbyte ptr [$004E944C]
004E74A7   DC3E                   fdivr   qword ptr [esi]
004E74A9   DD1E                   fstp    qword ptr [esi]
004E74AB   9B                     wait
004E74AC   E9AA1D0000             jmp     004E925B
004E74B1   DD06                   fld     qword ptr [esi]
004E74B3   D83558944E00           fdiv    dword ptr [$004E9458]
004E74B9   DD1E                   fstp    qword ptr [esi]
004E74BB   9B                     wait
004E74BC   E99A1D0000             jmp     004E925B
004E74C1   8B06                   mov     eax, [esi]
004E74C3   8906                   mov     [esi], eax
004E74C5   8B4604                 mov     eax, [esi+$04]
004E74C8   894604                 mov     [esi+$04], eax
004E74CB   E98B1D0000             jmp     004E925B
004E74D0   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E74D2   E8EDB6F1FF             call    00402BC4
004E74D7   81E010000000           and     eax, $00000010
004E74DD   33D2                   xor     edx, edx
004E74DF   0FACD004               shrd    eax, edx, $04
004E74E3   C1EA04                 shr     edx, $04
004E74E6   8945E8                 mov     [ebp-$18], eax
004E74E9   8955EC                 mov     [ebp-$14], edx
004E74EC   DF6DE8                 fild    qword ptr [ebp-$18]
004E74EF   DD1E                   fstp    qword ptr [esi]
004E74F1   9B                     wait
004E74F2   E9641D0000             jmp     004E925B
004E74F7   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E74F9   E8C6B6F1FF             call    00402BC4
004E74FE   81E020000000           and     eax, $00000020
004E7504   33D2                   xor     edx, edx
004E7506   0FACD005               shrd    eax, edx, $05
004E750A   C1EA05                 shr     edx, $05
004E750D   8945E8                 mov     [ebp-$18], eax
004E7510   8955EC                 mov     [ebp-$14], edx
004E7513   DF6DE8                 fild    qword ptr [ebp-$18]
004E7516   DD1E                   fstp    qword ptr [esi]
004E7518   9B                     wait
004E7519   E93D1D0000             jmp     004E925B
004E751E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7520   E89FB6F1FF             call    00402BC4
004E7525   81E040000000           and     eax, $00000040
004E752B   33D2                   xor     edx, edx
004E752D   0FACD006               shrd    eax, edx, $06
004E7531   C1EA06                 shr     edx, $06
004E7534   8945E8                 mov     [ebp-$18], eax
004E7537   8955EC                 mov     [ebp-$14], edx
004E753A   DF6DE8                 fild    qword ptr [ebp-$18]
004E753D   DD1E                   fstp    qword ptr [esi]
004E753F   9B                     wait
004E7540   E9161D0000             jmp     004E925B
004E7545   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7547   E878B6F1FF             call    00402BC4
004E754C   81E080000000           and     eax, $00000080
004E7552   33D2                   xor     edx, edx
004E7554   0FACD007               shrd    eax, edx, $07
004E7558   C1EA07                 shr     edx, $07
004E755B   8945E8                 mov     [ebp-$18], eax
004E755E   8955EC                 mov     [ebp-$14], edx
004E7561   DF6DE8                 fild    qword ptr [ebp-$18]
004E7564   DD1E                   fstp    qword ptr [esi]
004E7566   9B                     wait
004E7567   E9EF1C0000             jmp     004E925B
004E756C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E756E   E851B6F1FF             call    00402BC4
004E7573   81E010000000           and     eax, $00000010
004E7579   33D2                   xor     edx, edx
004E757B   0FACD004               shrd    eax, edx, $04
004E757F   C1EA04                 shr     edx, $04
004E7582   8945E8                 mov     [ebp-$18], eax
004E7585   8955EC                 mov     [ebp-$14], edx
004E7588   DF6DE8                 fild    qword ptr [ebp-$18]
004E758B   DD1E                   fstp    qword ptr [esi]
004E758D   9B                     wait
004E758E   E9C81C0000             jmp     004E925B
004E7593   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7595   E82AB6F1FF             call    00402BC4
004E759A   81E001000000           and     eax, $00000001
004E75A0   33D2                   xor     edx, edx
004E75A2   8945E8                 mov     [ebp-$18], eax
004E75A5   8955EC                 mov     [ebp-$14], edx
004E75A8   DF6DE8                 fild    qword ptr [ebp-$18]
004E75AB   DD1E                   fstp    qword ptr [esi]
004E75AD   9B                     wait
004E75AE   E9A81C0000             jmp     004E925B
004E75B3   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E75B5   E80AB6F1FF             call    00402BC4
004E75BA   81E002000000           and     eax, $00000002
004E75C0   33D2                   xor     edx, edx
004E75C2   0FACD001               shrd    eax, edx, $01
004E75C6   D1EA                   shr     edx, 1
004E75C8   8945E8                 mov     [ebp-$18], eax
004E75CB   8955EC                 mov     [ebp-$14], edx
004E75CE   DF6DE8                 fild    qword ptr [ebp-$18]
004E75D1   DD1E                   fstp    qword ptr [esi]
004E75D3   9B                     wait
004E75D4   E9821C0000             jmp     004E925B
004E75D9   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E75DB   E8E4B5F1FF             call    00402BC4
004E75E0   81E004000000           and     eax, $00000004
004E75E6   33D2                   xor     edx, edx
004E75E8   0FACD002               shrd    eax, edx, $02
004E75EC   C1EA02                 shr     edx, $02
004E75EF   8945E8                 mov     [ebp-$18], eax
004E75F2   8955EC                 mov     [ebp-$14], edx
004E75F5   DF6DE8                 fild    qword ptr [ebp-$18]
004E75F8   DD1E                   fstp    qword ptr [esi]
004E75FA   9B                     wait
004E75FB   E95B1C0000             jmp     004E925B
004E7600   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7602   E8BDB5F1FF             call    00402BC4
004E7607   81E008000000           and     eax, $00000008
004E760D   33D2                   xor     edx, edx
004E760F   0FACD003               shrd    eax, edx, $03
004E7613   C1EA03                 shr     edx, $03
004E7616   8945E8                 mov     [ebp-$18], eax
004E7619   8955EC                 mov     [ebp-$14], edx
004E761C   DF6DE8                 fild    qword ptr [ebp-$18]
004E761F   DD1E                   fstp    qword ptr [esi]
004E7621   9B                     wait
004E7622   E9341C0000             jmp     004E925B
004E7627   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7629   E896B5F1FF             call    00402BC4
004E762E   81E010000000           and     eax, $00000010
004E7634   33D2                   xor     edx, edx
004E7636   0FACD004               shrd    eax, edx, $04
004E763A   C1EA04                 shr     edx, $04
004E763D   8945E8                 mov     [ebp-$18], eax
004E7640   8955EC                 mov     [ebp-$14], edx
004E7643   DF6DE8                 fild    qword ptr [ebp-$18]
004E7646   DD1E                   fstp    qword ptr [esi]
004E7648   9B                     wait
004E7649   E90D1C0000             jmp     004E925B
004E764E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7650   E86FB5F1FF             call    00402BC4
004E7655   81E001000000           and     eax, $00000001
004E765B   33D2                   xor     edx, edx
004E765D   0FACD000               shrd    eax, edx, $00
004E7661   C1EA00                 shr     edx, $00
004E7664   8945E8                 mov     [ebp-$18], eax
004E7667   8955EC                 mov     [ebp-$14], edx
004E766A   DF6DE8                 fild    qword ptr [ebp-$18]
004E766D   DD1E                   fstp    qword ptr [esi]
004E766F   9B                     wait
004E7670   E9E61B0000             jmp     004E925B
004E7675   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7677   E848B5F1FF             call    00402BC4
004E767C   81E002000000           and     eax, $00000002
004E7682   33D2                   xor     edx, edx
004E7684   0FACD001               shrd    eax, edx, $01
004E7688   D1EA                   shr     edx, 1
004E768A   8945E8                 mov     [ebp-$18], eax
004E768D   8955EC                 mov     [ebp-$14], edx
004E7690   DF6DE8                 fild    qword ptr [ebp-$18]
004E7693   DD1E                   fstp    qword ptr [esi]
004E7695   9B                     wait
004E7696   E9C01B0000             jmp     004E925B
004E769B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E769D   E822B5F1FF             call    00402BC4
004E76A2   81E008000000           and     eax, $00000008
004E76A8   33D2                   xor     edx, edx
004E76AA   0FACD003               shrd    eax, edx, $03
004E76AE   C1EA03                 shr     edx, $03
004E76B1   8945E8                 mov     [ebp-$18], eax
004E76B4   8955EC                 mov     [ebp-$14], edx
004E76B7   DF6DE8                 fild    qword ptr [ebp-$18]
004E76BA   DD1E                   fstp    qword ptr [esi]
004E76BC   9B                     wait
004E76BD   E9991B0000             jmp     004E925B
004E76C2   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E76C4   E8FBB4F1FF             call    00402BC4
004E76C9   81E040000000           and     eax, $00000040
004E76CF   33D2                   xor     edx, edx
004E76D1   0FACD006               shrd    eax, edx, $06
004E76D5   C1EA06                 shr     edx, $06
004E76D8   8945E8                 mov     [ebp-$18], eax
004E76DB   8955EC                 mov     [ebp-$14], edx
004E76DE   DF6DE8                 fild    qword ptr [ebp-$18]
004E76E1   DD1E                   fstp    qword ptr [esi]
004E76E3   9B                     wait
004E76E4   E9721B0000             jmp     004E925B
004E76E9   8B06                   mov     eax, [esi]
004E76EB   8906                   mov     [esi], eax
004E76ED   8B4604                 mov     eax, [esi+$04]
004E76F0   894604                 mov     [esi+$04], eax
004E76F3   E9631B0000             jmp     004E925B
004E76F8   DB2D5C944E00           fld     tbyte ptr [$004E945C]
004E76FE   DC3E                   fdivr   qword ptr [esi]
004E7700   DD1E                   fstp    qword ptr [esi]
004E7702   9B                     wait
004E7703   E9531B0000             jmp     004E925B
004E7708   DD06                   fld     qword ptr [esi]
004E770A   D82518944E00           fsub    dword ptr [$004E9418]
004E7710   DD1E                   fstp    qword ptr [esi]
004E7712   9B                     wait
004E7713   E9431B0000             jmp     004E925B
004E7718   DD06                   fld     qword ptr [esi]
004E771A   D82518944E00           fsub    dword ptr [$004E9418]
004E7720   DD1E                   fstp    qword ptr [esi]
004E7722   9B                     wait
004E7723   E9331B0000             jmp     004E925B
004E7728   DB2D5C944E00           fld     tbyte ptr [$004E945C]
004E772E   DC3E                   fdivr   qword ptr [esi]
004E7730   DD1E                   fstp    qword ptr [esi]
004E7732   9B                     wait
004E7733   E9231B0000             jmp     004E925B
004E7738   8B06                   mov     eax, [esi]
004E773A   8906                   mov     [esi], eax
004E773C   8B4604                 mov     eax, [esi+$04]
004E773F   894604                 mov     [esi+$04], eax
004E7742   E9141B0000             jmp     004E925B
004E7747   8B06                   mov     eax, [esi]
004E7749   8906                   mov     [esi], eax
004E774B   8B4604                 mov     eax, [esi+$04]
004E774E   894604                 mov     [esi+$04], eax
004E7751   E9051B0000             jmp     004E925B
004E7756   8B06                   mov     eax, [esi]
004E7758   8906                   mov     [esi], eax
004E775A   8B4604                 mov     eax, [esi+$04]
004E775D   894604                 mov     [esi+$04], eax
004E7760   E9F61A0000             jmp     004E925B
004E7765   8B06                   mov     eax, [esi]
004E7767   8906                   mov     [esi], eax
004E7769   8B4604                 mov     eax, [esi+$04]
004E776C   894604                 mov     [esi+$04], eax
004E776F   E9E71A0000             jmp     004E925B
004E7774   8B06                   mov     eax, [esi]
004E7776   8906                   mov     [esi], eax
004E7778   8B4604                 mov     eax, [esi+$04]
004E777B   894604                 mov     [esi+$04], eax
004E777E   E9D81A0000             jmp     004E925B
004E7783   DD06                   fld     qword ptr [esi]
004E7785   D80DFC934E00           fmul    dword ptr [$004E93FC]
004E778B   D80568944E00           fadd    dword ptr [$004E9468]
004E7791   DD1E                   fstp    qword ptr [esi]
004E7793   9B                     wait
004E7794   E9C21A0000             jmp     004E925B
004E7799   DB2D5C944E00           fld     tbyte ptr [$004E945C]
004E779F   DC3E                   fdivr   qword ptr [esi]
004E77A1   DD1E                   fstp    qword ptr [esi]
004E77A3   9B                     wait
004E77A4   E9B21A0000             jmp     004E925B
004E77A9   8B06                   mov     eax, [esi]
004E77AB   8906                   mov     [esi], eax
004E77AD   8B4604                 mov     eax, [esi+$04]
004E77B0   894604                 mov     [esi+$04], eax
004E77B3   E9A31A0000             jmp     004E925B
004E77B8   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E77BE   DC3E                   fdivr   qword ptr [esi]
004E77C0   DD1E                   fstp    qword ptr [esi]
004E77C2   9B                     wait
004E77C3   E9931A0000             jmp     004E925B
004E77C8   DD06                   fld     qword ptr [esi]
004E77CA   D8356C944E00           fdiv    dword ptr [$004E946C]
004E77D0   D80DF4934E00           fmul    dword ptr [$004E93F4]
004E77D6   DD1E                   fstp    qword ptr [esi]
004E77D8   9B                     wait
004E77D9   E97D1A0000             jmp     004E925B
004E77DE   DB2D1C944E00           fld     tbyte ptr [$004E941C]
004E77E4   DC3E                   fdivr   qword ptr [esi]
004E77E6   DD1E                   fstp    qword ptr [esi]
004E77E8   9B                     wait
004E77E9   E96D1A0000             jmp     004E925B
004E77EE   DD06                   fld     qword ptr [esi]
004E77F0   D8356C944E00           fdiv    dword ptr [$004E946C]
004E77F6   D80DF4934E00           fmul    dword ptr [$004E93F4]
004E77FC   DD1E                   fstp    qword ptr [esi]
004E77FE   9B                     wait
004E77FF   E9571A0000             jmp     004E925B
004E7804   8B06                   mov     eax, [esi]
004E7806   8906                   mov     [esi], eax
004E7808   8B4604                 mov     eax, [esi+$04]
004E780B   894604                 mov     [esi+$04], eax
004E780E   E9481A0000             jmp     004E925B

* Reference to TOptionsForm instance
|
004E7813   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E7818   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E781A   8B8018030000           mov     eax, [eax+$0318]
004E7820   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E7822   FF92CC000000           call    dword ptr [edx+$00CC]
004E7828   8945F4                 mov     [ebp-$0C], eax
004E782B   DB45F4                 fild    dword ptr [ebp-$0C]
004E782E   D83598934E00           fdiv    dword ptr [$004E9398]
004E7834   D805F8934E00           fadd    dword ptr [$004E93F8]
004E783A   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7841   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7847   DC8CC208010000         fmul    qword ptr [edx+eax*8+$0108]
004E784E   D80DC8934E00           fmul    dword ptr [$004E93C8]
004E7854   D80D00944E00           fmul    dword ptr [$004E9400]
004E785A   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7861   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7867   DD44C248               fld     qword ptr [edx+eax*8+$48]
004E786B   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E7871   DEC9                   fmulp   st(1), st(0)
004E7873   D83504944E00           fdiv    dword ptr [$004E9404]
004E7879   DD1E                   fstp    qword ptr [esi]
004E787B   9B                     wait
004E787C   E9DA190000             jmp     004E925B
004E7881   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7888   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E788D   DD44D010               fld     qword ptr [eax+edx*8+$10]
004E7891   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E7897   DFE0                   fstsw   ax
004E7899   9E                     sahf
004E789A   7661                   jbe     004E78FD
004E789C   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E78A3   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E78A9   DD44C110               fld     qword ptr [ecx+eax*8+$10]
004E78AD   D81D08944E00           fcomp   dword ptr [$004E9408]
004E78B3   DFE0                   fstsw   ax
004E78B5   9E                     sahf
004E78B6   731A                   jnb     004E78D2
004E78B8   D90598934E00           fld     dword ptr [$004E9398]
004E78BE   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E78C3   DC8CD018020000         fmul    qword ptr [eax+edx*8+$0218]
004E78CA   DD1E                   fstp    qword ptr [esi]
004E78CC   9B                     wait
004E78CD   E989190000             jmp     004E925B
004E78D2   D905D0934E00           fld     dword ptr [$004E93D0]
004E78D8   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E78DD   DC8CD018020000         fmul    qword ptr [eax+edx*8+$0218]
004E78E4   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E78EB   8B15F86E4F00           mov     edx, [$004F6EF8]
004E78F1   DC74C210               fdiv    qword ptr [edx+eax*8+$10]
004E78F5   DD1E                   fstp    qword ptr [esi]
004E78F7   9B                     wait
004E78F8   E95E190000             jmp     004E925B
004E78FD   33C0                   xor     eax, eax
004E78FF   8906                   mov     [esi], eax
004E7901   894604                 mov     [esi+$04], eax
004E7904   E952190000             jmp     004E925B
004E7909   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E7910   7543                   jnz     004E7955
004E7912   33C0                   xor     eax, eax
004E7914   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E7919   69C080EE3600           imul    eax, eax, $0036EE80
004E791F   33D2                   xor     edx, edx
004E7921   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7927   69D260EA0000           imul    edx, edx, $0000EA60
004E792D   03C2                   add     eax, edx
004E792F   33D2                   xor     edx, edx
004E7931   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E7937   69D2E8030000           imul    edx, edx, $000003E8
004E793D   03C2                   add     eax, edx
004E793F   33D2                   xor     edx, edx
004E7941   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E7947   03D2                   add     edx, edx
004E7949   8D1492                 lea     edx, [edx+edx*4]
004E794C   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E794E   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7953   EB0A                   jmp     004E795F
004E7955   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E795A   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E795F   33C0                   xor     eax, eax
004E7961   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E7966   69C080EE3600           imul    eax, eax, $0036EE80
004E796C   33D2                   xor     edx, edx
004E796E   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7974   69D260EA0000           imul    edx, edx, $0000EA60
004E797A   03C2                   add     eax, edx
004E797C   33D2                   xor     edx, edx
004E797E   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E7984   69D2E8030000           imul    edx, edx, $000003E8
004E798A   03C2                   add     eax, edx
004E798C   33D2                   xor     edx, edx
004E798E   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E7994   03D2                   add     edx, edx
004E7996   8D1492                 lea     edx, [edx+edx*4]
004E7999   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E799B   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E79A0   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E79A5   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E79AB   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E79B0   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E79B7   8B15F86E4F00           mov     edx, [$004F6EF8]
004E79BD   DD84C218020000         fld     qword ptr [edx+eax*8+$0218]
004E79C4   D8350C944E00           fdiv    dword ptr [$004E940C]
004E79CA   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E79D0   DEC9                   fmulp   st(1), st(0)
004E79D2   DD1E                   fstp    qword ptr [esi]
004E79D4   9B                     wait
004E79D5   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E79DB   DC06                   fadd    qword ptr [esi]
004E79DD   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E79E3   9B                     wait
004E79E4   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E79EA   8906                   mov     [esi], eax
004E79EC   8B05E06D4F00           mov     eax, [$004F6DE0]
004E79F2   894604                 mov     [esi+$04], eax
004E79F5   E961180000             jmp     004E925B
004E79FA   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7A01   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7A07   DD44C210               fld     qword ptr [edx+eax*8+$10]
004E7A0B   D8350C944E00           fdiv    dword ptr [$004E940C]
004E7A11   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7A17   DEC9                   fmulp   st(1), st(0)
004E7A19   DD1E                   fstp    qword ptr [esi]
004E7A1B   9B                     wait
004E7A1C   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E7A22   DC06                   fadd    qword ptr [esi]
004E7A24   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E7A2A   9B                     wait
004E7A2B   8B05E46D4F00           mov     eax, [$004F6DE4]
004E7A31   8906                   mov     [esi], eax
004E7A33   8B05E86D4F00           mov     eax, [$004F6DE8]
004E7A39   894604                 mov     [esi+$04], eax
004E7A3C   E91A180000             jmp     004E925B
004E7A41   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7A48   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7A4D   DD84D030020000         fld     qword ptr [eax+edx*8+$0230]
004E7A54   D81D10944E00           fcomp   dword ptr [$004E9410]
004E7A5A   DFE0                   fstsw   ax
004E7A5C   9E                     sahf
004E7A5D   0F86F8170000           jbe     004E925B
004E7A63   D905D0934E00           fld     dword ptr [$004E93D0]
004E7A69   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7A6E   DC8CD028020000         fmul    qword ptr [eax+edx*8+$0228]
004E7A75   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7A7C   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7A82   DCB4C230020000         fdiv    qword ptr [edx+eax*8+$0230]
004E7A89   DD1E                   fstp    qword ptr [esi]
004E7A8B   9B                     wait
004E7A8C   E9CA170000             jmp     004E925B
004E7A91   83FF33                 cmp     edi, +$33
004E7A94   0F87C1170000           jnbe    004E925B
004E7A9A   0FB6BFA87A4E00         movzx   edi, byte ptr [edi+$4E7AA8]
004E7AA1   FF24BDDC7A4E00         jmp     dword ptr [$4E7ADC+edi*4]
004E7AA8   0001                   add     [ecx], al
004E7AAA   0102                   add     [edx], eax
004E7AAC   030404                 add     eax, [esp+eax]
004E7AAF   030506070809           add     eax, [$09080706]
004E7AB5   0A02                   or      al, byte ptr [edx]
004E7AB7   020B                   add     cl, byte ptr [ebx]
004E7AB9   0C03                   or      al, $03
004E7ABB   0303                   add     eax, [ebx]
004E7ABD   0303                   add     eax, [ebx]
004E7ABF   0303                   add     eax, [ebx]
004E7AC1   0311                   add     edx, [ecx]
004E7AC3   0E                     push    cs
004E7AC4   0E                     push    cs
004E7AC5   0303                   add     eax, [ebx]
004E7AC7   0D0D0D0D0F             or      eax, $0F0D0D0D
004E7ACC   0F0F                   DB  $0F, $0F  //
004E7ACE   1002                   adc     [edx], al
004E7AD0   0211                   add     dl, byte ptr [ecx]
004E7AD2   1111                   adc     [ecx], edx
004E7AD4   1111                   adc     [ecx], edx
004E7AD6   1112                   adc     [edx], edx
004E7AD8   131415165B924E         adc     edx, [$4E925B16+edx]
004E7ADF   0038                   add     [eax], bh
004E7AE1   7B4E                   jnp     004E7B31
004E7AE3   004E7B                 add     [esi+$7B], cl
004E7AE6   4E                     dec     esi
004E7AE7   005E7B                 add     [esi+$7B], bl
004E7AEA   4E                     dec     esi
004E7AEB   006D7B                 add     [ebp+$7B], ch
004E7AEE   4E                     dec     esi
004E7AEF   007D7B                 add     [ebp+$7B], bh
004E7AF2   4E                     dec     esi
004E7AF3   00957B4E00A5           add     [ebp+$A5004E7B], dl
004E7AF9   7B4E                   jnp     004E7B49
004E7AFB   00CE                   add     dh, cl
004E7AFD   7B4E                   jnp     004E7B4D
004E7AFF   00F7                   add     bh, dh
004E7B01   7B4E                   jnp     004E7B51
004E7B03   0007                   add     [edi], al
004E7B05   7C4E                   jl      004E7B55
004E7B07   003A                   add     [edx], bh
004E7B09   7C4E                   jl      004E7B59
004E7B0B   00667C                 add     [esi+$7C], ah
004E7B0E   4E                     dec     esi
004E7B0F   00A17C4E00D4           add     [ecx+$D4004E7C], ah
004E7B15   7C4E                   jl      004E7B65
004E7B17   00E4                   add     ah, ah
004E7B19   7C4E                   jl      004E7B69
004E7B1B   00FA                   add     dl, bh
004E7B1D   7C4E                   jl      004E7B6D
004E7B1F   0010                   add     [eax], dl
004E7B21   7D4E                   jnl     004E7B71
004E7B23   0020                   add     [eax], ah
004E7B25   7D4E                   jnl     004E7B75
004E7B27   00B87D4E0040           add     [eax+$40004E7D], bh
004E7B2D   7E4E                   jle     004E7B7D
004E7B2F   0031                   add     [ecx], dh
004E7B31   7F4E                   jnle    004E7B81
004E7B33   00787F                 add     [eax+$7F], bh
004E7B36   4E                     dec     esi
004E7B37   00DD                   add     ch, bl
004E7B39   06                     push    es
004E7B3A   D8257C934E00           fsub    dword ptr [$004E937C]
004E7B40   D80D80934E00           fmul    dword ptr [$004E9380]
004E7B46   DD1E                   fstp    qword ptr [esi]
004E7B48   9B                     wait
004E7B49   E90D170000             jmp     004E925B
004E7B4E   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E7B54   DC3E                   fdivr   qword ptr [esi]
004E7B56   DD1E                   fstp    qword ptr [esi]
004E7B58   9B                     wait
004E7B59   E9FD160000             jmp     004E925B
004E7B5E   8B06                   mov     eax, [esi]
004E7B60   8906                   mov     [esi], eax
004E7B62   8B4604                 mov     eax, [esi+$04]
004E7B65   894604                 mov     [esi+$04], eax
004E7B68   E9EE160000             jmp     004E925B
004E7B6D   DD06                   fld     qword ptr [esi]
004E7B6F   D83590934E00           fdiv    dword ptr [$004E9390]
004E7B75   DD1E                   fstp    qword ptr [esi]
004E7B77   9B                     wait
004E7B78   E9DE160000             jmp     004E925B
004E7B7D   DD06                   fld     qword ptr [esi]
004E7B7F   D83594934E00           fdiv    dword ptr [$004E9394]
004E7B85   DC06                   fadd    qword ptr [esi]
004E7B87   D83598934E00           fdiv    dword ptr [$004E9398]
004E7B8D   DD1E                   fstp    qword ptr [esi]
004E7B8F   9B                     wait
004E7B90   E9C6160000             jmp     004E925B
004E7B95   DB2D9C934E00           fld     tbyte ptr [$004E939C]
004E7B9B   DC0E                   fmul    qword ptr [esi]
004E7B9D   DD1E                   fstp    qword ptr [esi]
004E7B9F   9B                     wait
004E7BA0   E9B6160000             jmp     004E925B
004E7BA5   DD06                   fld     qword ptr [esi]
004E7BA7   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E7BAD   DFE0                   fstsw   ax
004E7BAF   9E                     sahf
004E7BB0   7610                   jbe     004E7BC2
004E7BB2   DB2DAC934E00           fld     tbyte ptr [$004E93AC]
004E7BB8   DC3E                   fdivr   qword ptr [esi]
004E7BBA   DD1E                   fstp    qword ptr [esi]
004E7BBC   9B                     wait
004E7BBD   E999160000             jmp     004E925B
004E7BC2   33C0                   xor     eax, eax
004E7BC4   8906                   mov     [esi], eax
004E7BC6   894604                 mov     [esi+$04], eax
004E7BC9   E98D160000             jmp     004E925B
004E7BCE   DD06                   fld     qword ptr [esi]
004E7BD0   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E7BD6   DFE0                   fstsw   ax
004E7BD8   9E                     sahf
004E7BD9   7610                   jbe     004E7BEB
004E7BDB   DD06                   fld     qword ptr [esi]
004E7BDD   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E7BE3   DD1E                   fstp    qword ptr [esi]
004E7BE5   9B                     wait
004E7BE6   E970160000             jmp     004E925B
004E7BEB   33C0                   xor     eax, eax
004E7BED   8906                   mov     [esi], eax
004E7BEF   894604                 mov     [esi+$04], eax
004E7BF2   E964160000             jmp     004E925B
004E7BF7   DD06                   fld     qword ptr [esi]
004E7BF9   D835BC934E00           fdiv    dword ptr [$004E93BC]
004E7BFF   DD1E                   fstp    qword ptr [esi]
004E7C01   9B                     wait
004E7C02   E954160000             jmp     004E925B
004E7C07   DD06                   fld     qword ptr [esi]
004E7C09   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E7C0F   DFE0                   fstsw   ax
004E7C11   9E                     sahf
004E7C12   7310                   jnb     004E7C24
004E7C14   DD06                   fld     qword ptr [esi]
004E7C16   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E7C1C   DD1E                   fstp    qword ptr [esi]
004E7C1E   9B                     wait
004E7C1F   E937160000             jmp     004E925B
004E7C24   DD06                   fld     qword ptr [esi]
004E7C26   D835B8934E00           fdiv    dword ptr [$004E93B8]
004E7C2C   D825C4934E00           fsub    dword ptr [$004E93C4]
004E7C32   DD1E                   fstp    qword ptr [esi]
004E7C34   9B                     wait
004E7C35   E921160000             jmp     004E925B
004E7C3A   DD06                   fld     qword ptr [esi]
004E7C3C   D81DC8934E00           fcomp   dword ptr [$004E93C8]
004E7C42   DFE0                   fstsw   ax
004E7C44   9E                     sahf
004E7C45   7610                   jbe     004E7C57
004E7C47   DD06                   fld     qword ptr [esi]
004E7C49   D825CC934E00           fsub    dword ptr [$004E93CC]
004E7C4F   DD1E                   fstp    qword ptr [esi]
004E7C51   9B                     wait
004E7C52   E904160000             jmp     004E925B
004E7C57   8B06                   mov     eax, [esi]
004E7C59   8906                   mov     [esi], eax
004E7C5B   8B4604                 mov     eax, [esi+$04]
004E7C5E   894604                 mov     [esi+$04], eax
004E7C61   E9F5150000             jmp     004E925B
004E7C66   8D55E4                 lea     edx, [ebp-$1C]

* Reference to TOptionsForm instance
|
004E7C69   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E7C6E   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.MaskEdit : TMaskEdit
|
004E7C70   8B8034030000           mov     eax, [eax+$0334]

* Reference to: Mask.TCustomMaskEdit.GetText(TCustomMaskEdit):TMaskedText;
|
004E7C76   E8A1BAF9FF             call    0048371C
004E7C7B   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004E7C7E   E87915F2FF             call    004091FC
004E7C83   8945F4                 mov     [ebp-$0C], eax
004E7C86   DB45F4                 fild    dword ptr [ebp-$0C]
004E7C89   D835D0934E00           fdiv    dword ptr [$004E93D0]
004E7C8F   DC0E                   fmul    qword ptr [esi]
004E7C91   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E7C97   DEF9                   fdivp   st(1), st(0)
004E7C99   DD1E                   fstp    qword ptr [esi]
004E7C9B   9B                     wait
004E7C9C   E9BA150000             jmp     004E925B
004E7CA1   DD06                   fld     qword ptr [esi]
004E7CA3   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E7CA9   DFE0                   fstsw   ax
004E7CAB   9E                     sahf
004E7CAC   7310                   jnb     004E7CBE
004E7CAE   DD06                   fld     qword ptr [esi]
004E7CB0   D835D4934E00           fdiv    dword ptr [$004E93D4]
004E7CB6   DD1E                   fstp    qword ptr [esi]
004E7CB8   9B                     wait
004E7CB9   E99D150000             jmp     004E925B
004E7CBE   DD06                   fld     qword ptr [esi]
004E7CC0   D835D4934E00           fdiv    dword ptr [$004E93D4]
004E7CC6   D825D0934E00           fsub    dword ptr [$004E93D0]
004E7CCC   DD1E                   fstp    qword ptr [esi]
004E7CCE   9B                     wait
004E7CCF   E987150000             jmp     004E925B
004E7CD4   DB2DD8934E00           fld     tbyte ptr [$004E93D8]
004E7CDA   DC3E                   fdivr   qword ptr [esi]
004E7CDC   DD1E                   fstp    qword ptr [esi]
004E7CDE   9B                     wait
004E7CDF   E977150000             jmp     004E925B
004E7CE4   DD06                   fld     qword ptr [esi]
004E7CE6   D80DE4934E00           fmul    dword ptr [$004E93E4]
004E7CEC   D82DE8934E00           fsubr   dword ptr [$004E93E8]
004E7CF2   DD1E                   fstp    qword ptr [esi]
004E7CF4   9B                     wait
004E7CF5   E961150000             jmp     004E925B
004E7CFA   DD06                   fld     qword ptr [esi]
004E7CFC   D80DE4934E00           fmul    dword ptr [$004E93E4]
004E7D02   D825EC934E00           fsub    dword ptr [$004E93EC]
004E7D08   DD1E                   fstp    qword ptr [esi]
004E7D0A   9B                     wait
004E7D0B   E94B150000             jmp     004E925B
004E7D10   DD06                   fld     qword ptr [esi]
004E7D12   D835F0934E00           fdiv    dword ptr [$004E93F0]
004E7D18   DD1E                   fstp    qword ptr [esi]
004E7D1A   9B                     wait
004E7D1B   E93B150000             jmp     004E925B
004E7D20   6B3DC86D4F004C         imul    edi, [$004F6DC8], $4C
004E7D27   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7D2C   DD84F898000000         fld     qword ptr [eax+edi*8+$0098]
004E7D33   D81DF4934E00           fcomp   dword ptr [$004E93F4]
004E7D39   DFE0                   fstsw   ax
004E7D3B   9E                     sahf
004E7D3C   746E                   jz      004E7DAC

* Reference to TOptionsForm instance
|
004E7D3E   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E7D43   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E7D45   8B8018030000           mov     eax, [eax+$0318]
004E7D4B   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E7D4D   FF92CC000000           call    dword ptr [edx+$00CC]
004E7D53   8945F4                 mov     [ebp-$0C], eax
004E7D56   DB45F4                 fild    dword ptr [ebp-$0C]
004E7D59   D83598934E00           fdiv    dword ptr [$004E9398]
004E7D5F   D805F8934E00           fadd    dword ptr [$004E93F8]
004E7D65   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7D6A   DD44F858               fld     qword ptr [eax+edi*8+$58]
004E7D6E   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7D73   DC44F868               fadd    qword ptr [eax+edi*8+$68]
004E7D77   DEC9                   fmulp   st(1), st(0)
004E7D79   D80DFC934E00           fmul    dword ptr [$004E93FC]
004E7D7F   D80D00944E00           fmul    dword ptr [$004E9400]
004E7D85   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7D8C   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7D92   DD44C220               fld     qword ptr [edx+eax*8+$20]
004E7D96   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E7D9C   DEC9                   fmulp   st(1), st(0)
004E7D9E   D83504944E00           fdiv    dword ptr [$004E9404]
004E7DA4   DD1E                   fstp    qword ptr [esi]
004E7DA6   9B                     wait
004E7DA7   E9AF140000             jmp     004E925B
004E7DAC   33C0                   xor     eax, eax
004E7DAE   8906                   mov     [esi], eax
004E7DB0   894604                 mov     [esi+$04], eax
004E7DB3   E9A3140000             jmp     004E925B
004E7DB8   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7DBF   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7DC4   DD44D038               fld     qword ptr [eax+edx*8+$38]
004E7DC8   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E7DCE   DFE0                   fstsw   ax
004E7DD0   9E                     sahf
004E7DD1   7661                   jbe     004E7E34
004E7DD3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7DDA   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E7DE0   DD44C138               fld     qword ptr [ecx+eax*8+$38]
004E7DE4   D81D08944E00           fcomp   dword ptr [$004E9408]
004E7DEA   DFE0                   fstsw   ax
004E7DEC   9E                     sahf
004E7DED   731A                   jnb     004E7E09
004E7DEF   D90598934E00           fld     dword ptr [$004E9398]
004E7DF5   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7DFA   DC8CD078010000         fmul    qword ptr [eax+edx*8+$0178]
004E7E01   DD1E                   fstp    qword ptr [esi]
004E7E03   9B                     wait
004E7E04   E952140000             jmp     004E925B
004E7E09   D905D0934E00           fld     dword ptr [$004E93D0]
004E7E0F   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7E14   DC8CD078010000         fmul    qword ptr [eax+edx*8+$0178]
004E7E1B   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7E22   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7E28   DC74C238               fdiv    qword ptr [edx+eax*8+$38]
004E7E2C   DD1E                   fstp    qword ptr [esi]
004E7E2E   9B                     wait
004E7E2F   E927140000             jmp     004E925B
004E7E34   33C0                   xor     eax, eax
004E7E36   8906                   mov     [esi], eax
004E7E38   894604                 mov     [esi+$04], eax
004E7E3B   E91B140000             jmp     004E925B
004E7E40   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E7E47   7543                   jnz     004E7E8C
004E7E49   33C0                   xor     eax, eax
004E7E4B   A0486E4F00             mov     al, byte ptr [$004F6E48]
004E7E50   69C080EE3600           imul    eax, eax, $0036EE80
004E7E56   33D2                   xor     edx, edx
004E7E58   8A15496E4F00           mov     dl, byte ptr [$004F6E49]
004E7E5E   69D260EA0000           imul    edx, edx, $0000EA60
004E7E64   03C2                   add     eax, edx
004E7E66   33D2                   xor     edx, edx
004E7E68   8A154A6E4F00           mov     dl, byte ptr [$004F6E4A]
004E7E6E   69D2E8030000           imul    edx, edx, $000003E8
004E7E74   03C2                   add     eax, edx
004E7E76   33D2                   xor     edx, edx
004E7E78   8A154B6E4F00           mov     dl, byte ptr [$004F6E4B]
004E7E7E   03D2                   add     edx, edx
004E7E80   8D1492                 lea     edx, [edx+edx*4]
004E7E83   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E7E85   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7E8A   EB0A                   jmp     004E7E96
004E7E8C   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E7E91   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7E96   33C0                   xor     eax, eax
004E7E98   A0486E4F00             mov     al, byte ptr [$004F6E48]
004E7E9D   69C080EE3600           imul    eax, eax, $0036EE80
004E7EA3   33D2                   xor     edx, edx
004E7EA5   8A15496E4F00           mov     dl, byte ptr [$004F6E49]
004E7EAB   69D260EA0000           imul    edx, edx, $0000EA60
004E7EB1   03C2                   add     eax, edx
004E7EB3   33D2                   xor     edx, edx
004E7EB5   8A154A6E4F00           mov     dl, byte ptr [$004F6E4A]
004E7EBB   69D2E8030000           imul    edx, edx, $000003E8
004E7EC1   03C2                   add     eax, edx
004E7EC3   33D2                   xor     edx, edx
004E7EC5   8A154B6E4F00           mov     dl, byte ptr [$004F6E4B]
004E7ECB   03D2                   add     edx, edx
004E7ECD   8D1492                 lea     edx, [edx+edx*4]
004E7ED0   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E7ED2   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E7ED7   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E7EDC   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E7EE2   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E7EE7   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7EEE   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7EF4   DD84C278010000         fld     qword ptr [edx+eax*8+$0178]
004E7EFB   D8350C944E00           fdiv    dword ptr [$004E940C]
004E7F01   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7F07   DEC9                   fmulp   st(1), st(0)
004E7F09   DD1E                   fstp    qword ptr [esi]
004E7F0B   9B                     wait
004E7F0C   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E7F12   DC06                   fadd    qword ptr [esi]
004E7F14   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E7F1A   9B                     wait
004E7F1B   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E7F21   8906                   mov     [esi], eax
004E7F23   8B05E06D4F00           mov     eax, [$004F6DE0]
004E7F29   894604                 mov     [esi+$04], eax
004E7F2C   E92A130000             jmp     004E925B
004E7F31   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7F38   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7F3E   DD44C238               fld     qword ptr [edx+eax*8+$38]
004E7F42   D8350C944E00           fdiv    dword ptr [$004E940C]
004E7F48   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7F4E   DEC9                   fmulp   st(1), st(0)
004E7F50   DD1E                   fstp    qword ptr [esi]
004E7F52   9B                     wait
004E7F53   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E7F59   DC06                   fadd    qword ptr [esi]
004E7F5B   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E7F61   9B                     wait
004E7F62   8B05E46D4F00           mov     eax, [$004F6DE4]
004E7F68   8906                   mov     [esi], eax
004E7F6A   8B05E86D4F00           mov     eax, [$004F6DE8]
004E7F70   894604                 mov     [esi+$04], eax
004E7F73   E9E3120000             jmp     004E925B
004E7F78   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7F7F   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7F84   DD84D090010000         fld     qword ptr [eax+edx*8+$0190]
004E7F8B   D81D10944E00           fcomp   dword ptr [$004E9410]
004E7F91   DFE0                   fstsw   ax
004E7F93   9E                     sahf
004E7F94   0F86C1120000           jbe     004E925B
004E7F9A   D905D0934E00           fld     dword ptr [$004E93D0]
004E7FA0   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7FA5   DC8CD088010000         fmul    qword ptr [eax+edx*8+$0188]
004E7FAC   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7FB3   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7FB9   DCB4C290010000         fdiv    qword ptr [edx+eax*8+$0190]
004E7FC0   DD1E                   fstp    qword ptr [esi]
004E7FC2   9B                     wait
004E7FC3   E993120000             jmp     004E925B
004E7FC8   83FF3F                 cmp     edi, +$3F
004E7FCB   0F878A120000           jnbe    004E925B
004E7FD1   0FB6BFDF7F4E00         movzx   edi, byte ptr [edi+$4E7FDF]
004E7FD8   FF24BD1F804E00         jmp     dword ptr [$4E801F+edi*4]
004E7FDF   0001                   add     [ecx], al
004E7FE1   0203                   add     al, byte ptr [ebx]
004E7FE3   03040506030407         add     eax, [$7040306+eax]
004E7FEA   06                     push    es
004E7FEB   07                     pop     es
004E7FEC   0202                   add     al, byte ptr [edx]
004E7FEE   0308                   add     ecx, [eax]
004E7FF0   090A                   or      [edx], ecx
004E7FF2   0B0C0D0D0D0E0C         or      ecx, [$C0E0D0D+ecx]
004E7FF9   0F10                   DB  $0F, $10  //
004E7FFB   1111                   adc     [ecx], edx
004E7FFD   1213                   adc     dl, byte ptr [ebx]
004E7FFF   1415                   adc     al, $15
004E8001   1514141614             adc     eax, $14161414
004E8006   1414                   adc     al, $14
004E8008   0C17                   or      al, $17
004E800A   17                     pop     ss
004E800B   17                     pop     ss
004E800C   1817                   sbb     [edi], dl
004E800E   0C0C                   or      al, $0C
004E8010   0C0C                   or      al, $0C
004E8012   0C0C                   or      al, $0C
004E8014   0C0C                   or      al, $0C
004E8016   0C0C                   or      al, $0C
004E8018   0C0C                   or      al, $0C
004E801A   191A                   sbb     [edx], ebx
004E801C   1B1C1D5B924E00         sbb     ebx, [$4E925B+ebx]
004E8023   97                     xchg    eax, edi
004E8024   804E00A6               or      byte ptr [esi+$00], $A6
004E8028   804E00CD               or      byte ptr [esi+$00], $CD
004E802C   804E00F3               or      byte ptr [esi+$00], $F3
004E8030   804E001A               or      byte ptr [esi+$00], $1A
004E8034   814E0041814E00         or      dword ptr [esi+$00], $004E8141
004E803B   68814E008F             push    $8F004E81
004E8040   814E00B6814E00         or      dword ptr [esi+$00], $004E81B6
004E8047   C6814E00D6814E         mov     byte ptr [ecx+$81D6004E], $4E
004E804E   00E6                   add     dh, ah
004E8050   814E00F5814E00         or      dword ptr [esi+$00], $004E81F5
004E8057   05824E001B             add     eax, +$1B004E82
004E805C   824E002B               or      dword ptr [esi+$00], $2B
004E8060   824E003B               or      dword ptr [esi+$00], $3B
004E8064   824E0053               or      dword ptr [esi+$00], $53
004E8068   824E0063               or      dword ptr [esi+$00], $63
004E806C   824E0079               or      dword ptr [esi+$00], $79
004E8070   824E0089               or      dword ptr [esi+$00], $89
004E8074   824E0099               or      dword ptr [esi+$00], $99
004E8078   824E00A9               or      dword ptr [esi+$00], $A9
004E807C   824E00B9               or      dword ptr [esi+$00], $B9
004E8080   824E00C9               or      dword ptr [esi+$00], $C9
004E8084   824E003A               or      dword ptr [esi+$00], $3A
004E8088   834E00CB               or      dword ptr [esi+$00], -$35
004E808C   834E00BC               or      dword ptr [esi+$00], -$44
004E8090   844E00                 test    [esi+$00], cl
004E8093   06                     push    es
004E8094   854E00                 test    [esi+$00], ecx
004E8097   8B06                   mov     eax, [esi]
004E8099   8906                   mov     [esi], eax
004E809B   8B4604                 mov     eax, [esi+$04]
004E809E   894604                 mov     [esi+$04], eax
004E80A1   E9B5110000             jmp     004E925B
004E80A6   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E80A8   E817ABF1FF             call    00402BC4
004E80AD   81E001000000           and     eax, $00000001
004E80B3   33D2                   xor     edx, edx
004E80B5   0FACD000               shrd    eax, edx, $00
004E80B9   C1EA00                 shr     edx, $00
004E80BC   8945E8                 mov     [ebp-$18], eax
004E80BF   8955EC                 mov     [ebp-$14], edx
004E80C2   DF6DE8                 fild    qword ptr [ebp-$18]
004E80C5   DD1E                   fstp    qword ptr [esi]
004E80C7   9B                     wait
004E80C8   E98E110000             jmp     004E925B
004E80CD   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E80CF   E8F0AAF1FF             call    00402BC4
004E80D4   81E002000000           and     eax, $00000002
004E80DA   33D2                   xor     edx, edx
004E80DC   0FACD001               shrd    eax, edx, $01
004E80E0   D1EA                   shr     edx, 1
004E80E2   8945E8                 mov     [ebp-$18], eax
004E80E5   8955EC                 mov     [ebp-$14], edx
004E80E8   DF6DE8                 fild    qword ptr [ebp-$18]
004E80EB   DD1E                   fstp    qword ptr [esi]
004E80ED   9B                     wait
004E80EE   E968110000             jmp     004E925B
004E80F3   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E80F5   E8CAAAF1FF             call    00402BC4
004E80FA   81E004000000           and     eax, $00000004
004E8100   33D2                   xor     edx, edx
004E8102   0FACD002               shrd    eax, edx, $02
004E8106   C1EA02                 shr     edx, $02
004E8109   8945E8                 mov     [ebp-$18], eax
004E810C   8955EC                 mov     [ebp-$14], edx
004E810F   DF6DE8                 fild    qword ptr [ebp-$18]
004E8112   DD1E                   fstp    qword ptr [esi]
004E8114   9B                     wait
004E8115   E941110000             jmp     004E925B
004E811A   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E811C   E8A3AAF1FF             call    00402BC4
004E8121   81E008000000           and     eax, $00000008
004E8127   33D2                   xor     edx, edx
004E8129   0FACD003               shrd    eax, edx, $03
004E812D   C1EA03                 shr     edx, $03
004E8130   8945E8                 mov     [ebp-$18], eax
004E8133   8955EC                 mov     [ebp-$14], edx
004E8136   DF6DE8                 fild    qword ptr [ebp-$18]
004E8139   DD1E                   fstp    qword ptr [esi]
004E813B   9B                     wait
004E813C   E91A110000             jmp     004E925B
004E8141   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8143   E87CAAF1FF             call    00402BC4
004E8148   81E010000000           and     eax, $00000010
004E814E   33D2                   xor     edx, edx
004E8150   0FACD004               shrd    eax, edx, $04
004E8154   C1EA04                 shr     edx, $04
004E8157   8945E8                 mov     [ebp-$18], eax
004E815A   8955EC                 mov     [ebp-$14], edx
004E815D   DF6DE8                 fild    qword ptr [ebp-$18]
004E8160   DD1E                   fstp    qword ptr [esi]
004E8162   9B                     wait
004E8163   E9F3100000             jmp     004E925B
004E8168   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E816A   E855AAF1FF             call    00402BC4
004E816F   81E020000000           and     eax, $00000020
004E8175   33D2                   xor     edx, edx
004E8177   0FACD005               shrd    eax, edx, $05
004E817B   C1EA05                 shr     edx, $05
004E817E   8945E8                 mov     [ebp-$18], eax
004E8181   8955EC                 mov     [ebp-$14], edx
004E8184   DF6DE8                 fild    qword ptr [ebp-$18]
004E8187   DD1E                   fstp    qword ptr [esi]
004E8189   9B                     wait
004E818A   E9CC100000             jmp     004E925B
004E818F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8191   E82EAAF1FF             call    00402BC4
004E8196   81E040000000           and     eax, $00000040
004E819C   33D2                   xor     edx, edx
004E819E   0FACD006               shrd    eax, edx, $06
004E81A2   C1EA06                 shr     edx, $06
004E81A5   8945E8                 mov     [ebp-$18], eax
004E81A8   8955EC                 mov     [ebp-$14], edx
004E81AB   DF6DE8                 fild    qword ptr [ebp-$18]
004E81AE   DD1E                   fstp    qword ptr [esi]
004E81B0   9B                     wait
004E81B1   E9A5100000             jmp     004E925B
004E81B6   DB2D70944E00           fld     tbyte ptr [$004E9470]
004E81BC   DC3E                   fdivr   qword ptr [esi]
004E81BE   DD1E                   fstp    qword ptr [esi]
004E81C0   9B                     wait
004E81C1   E995100000             jmp     004E925B
004E81C6   DD06                   fld     qword ptr [esi]
004E81C8   D835C8934E00           fdiv    dword ptr [$004E93C8]
004E81CE   DD1E                   fstp    qword ptr [esi]
004E81D0   9B                     wait
004E81D1   E985100000             jmp     004E925B
004E81D6   DD06                   fld     qword ptr [esi]
004E81D8   D80D98934E00           fmul    dword ptr [$004E9398]
004E81DE   DD1E                   fstp    qword ptr [esi]
004E81E0   9B                     wait
004E81E1   E975100000             jmp     004E925B
004E81E6   8B06                   mov     eax, [esi]
004E81E8   8906                   mov     [esi], eax
004E81EA   8B4604                 mov     eax, [esi+$04]
004E81ED   894604                 mov     [esi+$04], eax
004E81F0   E966100000             jmp     004E925B
004E81F5   DD06                   fld     qword ptr [esi]
004E81F7   D82518944E00           fsub    dword ptr [$004E9418]
004E81FD   DD1E                   fstp    qword ptr [esi]
004E81FF   9B                     wait
004E8200   E956100000             jmp     004E925B
004E8205   DD06                   fld     qword ptr [esi]
004E8207   D80D80934E00           fmul    dword ptr [$004E9380]
004E820D   D8257C944E00           fsub    dword ptr [$004E947C]
004E8213   DD1E                   fstp    qword ptr [esi]
004E8215   9B                     wait
004E8216   E940100000             jmp     004E925B
004E821B   DD06                   fld     qword ptr [esi]
004E821D   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E8223   DD1E                   fstp    qword ptr [esi]
004E8225   9B                     wait
004E8226   E930100000             jmp     004E925B
004E822B   DD06                   fld     qword ptr [esi]
004E822D   D83598934E00           fdiv    dword ptr [$004E9398]
004E8233   DD1E                   fstp    qword ptr [esi]
004E8235   9B                     wait
004E8236   E920100000             jmp     004E925B
004E823B   DD06                   fld     qword ptr [esi]
004E823D   D82528944E00           fsub    dword ptr [$004E9428]
004E8243   DB2D80944E00           fld     tbyte ptr [$004E9480]
004E8249   DEF9                   fdivp   st(1), st(0)
004E824B   DD1E                   fstp    qword ptr [esi]
004E824D   9B                     wait
004E824E   E908100000             jmp     004E925B
004E8253   DB2D8C944E00           fld     tbyte ptr [$004E948C]
004E8259   DC3E                   fdivr   qword ptr [esi]
004E825B   DD1E                   fstp    qword ptr [esi]
004E825D   9B                     wait
004E825E   E9F80F0000             jmp     004E925B
004E8263   DD06                   fld     qword ptr [esi]
004E8265   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E826B   D82514944E00           fsub    dword ptr [$004E9414]
004E8271   DD1E                   fstp    qword ptr [esi]
004E8273   9B                     wait
004E8274   E9E20F0000             jmp     004E925B
004E8279   DD06                   fld     qword ptr [esi]
004E827B   D83538944E00           fdiv    dword ptr [$004E9438]
004E8281   DD1E                   fstp    qword ptr [esi]
004E8283   9B                     wait
004E8284   E9D20F0000             jmp     004E925B
004E8289   DB2D98944E00           fld     tbyte ptr [$004E9498]
004E828F   DC0E                   fmul    qword ptr [esi]
004E8291   DD1E                   fstp    qword ptr [esi]
004E8293   9B                     wait
004E8294   E9C20F0000             jmp     004E925B
004E8299   DD06                   fld     qword ptr [esi]
004E829B   D835A4944E00           fdiv    dword ptr [$004E94A4]
004E82A1   DD1E                   fstp    qword ptr [esi]
004E82A3   9B                     wait
004E82A4   E9B20F0000             jmp     004E925B
004E82A9   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E82AF   DC3E                   fdivr   qword ptr [esi]
004E82B1   DD1E                   fstp    qword ptr [esi]
004E82B3   9B                     wait
004E82B4   E9A20F0000             jmp     004E925B
004E82B9   DB2DA8944E00           fld     tbyte ptr [$004E94A8]
004E82BF   DC3E                   fdivr   qword ptr [esi]
004E82C1   DD1E                   fstp    qword ptr [esi]
004E82C3   9B                     wait
004E82C4   E9920F0000             jmp     004E925B

* Reference to TOptionsForm instance
|
004E82C9   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E82CE   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E82D0   8B8018030000           mov     eax, [eax+$0318]
004E82D6   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E82D8   FF92CC000000           call    dword ptr [edx+$00CC]
004E82DE   8945F4                 mov     [ebp-$0C], eax
004E82E1   DB45F4                 fild    dword ptr [ebp-$0C]
004E82E4   D83598934E00           fdiv    dword ptr [$004E9398]
004E82EA   D805F8934E00           fadd    dword ptr [$004E93F8]
004E82F0   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E82F7   8B15F86E4F00           mov     edx, [$004F6EF8]
004E82FD   DC8CC2D8000000         fmul    qword ptr [edx+eax*8+$00D8]
004E8304   D80DC8934E00           fmul    dword ptr [$004E93C8]
004E830A   D80D00944E00           fmul    dword ptr [$004E9400]
004E8310   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E8317   8B15F86E4F00           mov     edx, [$004F6EF8]
004E831D   DD84C290000000         fld     qword ptr [edx+eax*8+$0090]
004E8324   D835CC934E00           fdiv    dword ptr [$004E93CC]
004E832A   DEC9                   fmulp   st(1), st(0)
004E832C   D83504944E00           fdiv    dword ptr [$004E9404]
004E8332   DD1E                   fstp    qword ptr [esi]
004E8334   9B                     wait
004E8335   E9210F0000             jmp     004E925B
004E833A   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E8341   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8346   DD84D0A0000000         fld     qword ptr [eax+edx*8+$00A0]
004E834D   D81DA8934E00           fcomp   dword ptr [$004E93A8]
004E8353   DFE0                   fstsw   ax
004E8355   9E                     sahf
004E8356   7667                   jbe     004E83BF
004E8358   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E835F   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E8365   DD84C1A0000000         fld     qword ptr [ecx+eax*8+$00A0]
004E836C   D81D08944E00           fcomp   dword ptr [$004E9408]
004E8372   DFE0                   fstsw   ax
004E8374   9E                     sahf
004E8375   731A                   jnb     004E8391
004E8377   D90598934E00           fld     dword ptr [$004E9398]
004E837D   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8382   DC8CD0D8010000         fmul    qword ptr [eax+edx*8+$01D8]
004E8389   DD1E                   fstp    qword ptr [esi]
004E838B   9B                     wait
004E838C   E9CA0E0000             jmp     004E925B
004E8391   D905D0934E00           fld     dword ptr [$004E93D0]
004E8397   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E839C   DC8CD0D8010000         fmul    qword ptr [eax+edx*8+$01D8]
004E83A3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E83AA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E83B0   DCB4C2A0000000         fdiv    qword ptr [edx+eax*8+$00A0]
004E83B7   DD1E                   fstp    qword ptr [esi]
004E83B9   9B                     wait
004E83BA   E99C0E0000             jmp     004E925B
004E83BF   33C0                   xor     eax, eax
004E83C1   8906                   mov     [esi], eax
004E83C3   894604                 mov     [esi+$04], eax
004E83C6   E9900E0000             jmp     004E925B
004E83CB   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E83D2   7543                   jnz     004E8417
004E83D4   33C0                   xor     eax, eax
004E83D6   A0746E4F00             mov     al, byte ptr [$004F6E74]
004E83DB   69C080EE3600           imul    eax, eax, $0036EE80
004E83E1   33D2                   xor     edx, edx
004E83E3   8A15756E4F00           mov     dl, byte ptr [$004F6E75]
004E83E9   69D260EA0000           imul    edx, edx, $0000EA60
004E83EF   03C2                   add     eax, edx
004E83F1   33D2                   xor     edx, edx
004E83F3   8A15766E4F00           mov     dl, byte ptr [$004F6E76]
004E83F9   69D2E8030000           imul    edx, edx, $000003E8
004E83FF   03C2                   add     eax, edx
004E8401   33D2                   xor     edx, edx
004E8403   8A15776E4F00           mov     dl, byte ptr [$004F6E77]
004E8409   03D2                   add     edx, edx
004E840B   8D1492                 lea     edx, [edx+edx*4]
004E840E   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E8410   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E8415   EB0A                   jmp     004E8421
004E8417   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E841C   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E8421   33C0                   xor     eax, eax
004E8423   A0746E4F00             mov     al, byte ptr [$004F6E74]
004E8428   69C080EE3600           imul    eax, eax, $0036EE80
004E842E   33D2                   xor     edx, edx
004E8430   8A15756E4F00           mov     dl, byte ptr [$004F6E75]
004E8436   69D260EA0000           imul    edx, edx, $0000EA60
004E843C   03C2                   add     eax, edx
004E843E   33D2                   xor     edx, edx
004E8440   8A15766E4F00           mov     dl, byte ptr [$004F6E76]
004E8446   69D2E8030000           imul    edx, edx, $000003E8
004E844C   03C2                   add     eax, edx
004E844E   33D2                   xor     edx, edx
004E8450   8A15776E4F00           mov     dl, byte ptr [$004F6E77]
004E8456   03D2                   add     edx, edx
004E8458   8D1492                 lea     edx, [edx+edx*4]
004E845B   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E845D   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E8462   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E8467   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E846D   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E8472   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E8479   8B15F86E4F00           mov     edx, [$004F6EF8]
004E847F   DD84C2D8010000         fld     qword ptr [edx+eax*8+$01D8]
004E8486   D8350C944E00           fdiv    dword ptr [$004E940C]
004E848C   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E8492   DEC9                   fmulp   st(1), st(0)
004E8494   DD1E                   fstp    qword ptr [esi]
004E8496   9B                     wait
004E8497   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E849D   DC06                   fadd    qword ptr [esi]
004E849F   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E84A5   9B                     wait
004E84A6   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E84AC   8906                   mov     [esi], eax
004E84AE   8B05E06D4F00           mov     eax, [$004F6DE0]
004E84B4   894604                 mov     [esi+$04], eax
004E84B7   E99F0D0000             jmp     004E925B
004E84BC   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E84C3   8B15F86E4F00           mov     edx, [$004F6EF8]
004E84C9   DD84C2A0000000         fld     qword ptr [edx+eax*8+$00A0]
004E84D0   D8350C944E00           fdiv    dword ptr [$004E940C]
004E84D6   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E84DC   DEC9                   fmulp   st(1), st(0)
004E84DE   DD1E                   fstp    qword ptr [esi]
004E84E0   9B                     wait
004E84E1   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E84E7   DC06                   fadd    qword ptr [esi]
004E84E9   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E84EF   9B                     wait
004E84F0   8B05E46D4F00           mov     eax, [$004F6DE4]
004E84F6   8906                   mov     [esi], eax
004E84F8   8B05E86D4F00           mov     eax, [$004F6DE8]
004E84FE   894604                 mov     [esi+$04], eax
004E8501   E9550D0000             jmp     004E925B
004E8506   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E850D   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8512   DD84D0F0010000         fld     qword ptr [eax+edx*8+$01F0]
004E8519   D81D10944E00           fcomp   dword ptr [$004E9410]
004E851F   DFE0                   fstsw   ax
004E8521   9E                     sahf
004E8522   0F86330D0000           jbe     004E925B
004E8528   D905D0934E00           fld     dword ptr [$004E93D0]
004E852E   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8533   DC8CD0E8010000         fmul    qword ptr [eax+edx*8+$01E8]
004E853A   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E8541   8B15F86E4F00           mov     edx, [$004F6EF8]
004E8547   DCB4C2F0010000         fdiv    qword ptr [edx+eax*8+$01F0]
004E854E   DD1E                   fstp    qword ptr [esi]
004E8550   9B                     wait
004E8551   E9050D0000             jmp     004E925B
004E8556   83FF23                 cmp     edi, +$23
004E8559   0F87FC0C0000           jnbe    004E925B
004E855F   FF24BD66854E00         jmp     dword ptr [$4E8566+edi*4]
004E8566   5B                     pop     ebx
004E8567   92                     xchg    eax, edx
004E8568   4E                     dec     esi
004E8569   00F6                   add     dh, dh
004E856B   854E00                 test    [esi+$00], ecx
004E856E   06                     push    es
004E856F   864E00                 xchg    [esi+$00], cl
004E8572   F6854E00F6854E         test    byte ptr [ebp+$85F6004E], $4E
004E8579   0015864E0015           add     [$15004E86], dl
004E857F   864E00                 xchg    [esi+$00], cl
004E8582   25864E0035             and     eax, $35004E86
004E8587   864E00                 xchg    [esi+$00], cl
004E858A   45                     inc     ebp
004E858B   864E00                 xchg    [esi+$00], cl
004E858E   55                     push    ebp
004E858F   864E00                 xchg    [esi+$00], cl
004E8592   45                     inc     ebp
004E8593   864E00                 xchg    [esi+$00], cl
004E8596   65864E00               xchg    gs:[esi+$00], cl
004E859A   7586                   jnz     004E8522
004E859C   4E                     dec     esi
004E859D   008B864E008B           add     [ebx+$8B004E86], cl
004E85A3   864E00                 xchg    [esi+$00], cl
004E85A6   8B864E00A186           mov     eax, [esi+$86A1004E]
004E85AC   4E                     dec     esi
004E85AD   00C8                   add     al, cl
004E85AF   864E00                 xchg    [esi+$00], cl
004E85B2   EE                     out     dx, al
004E85B3   864E00                 xchg    [esi+$00], cl
004E85B6   15874E003C             adc     eax, $3C004E87
004E85BB   874E00                 xchg    [esi+$00], ecx
004E85BE   63874E008987           arpl    [edi+$8789004E], ax
004E85C4   4E                     dec     esi
004E85C5   00B0874E00D7           add     [eax+$D7004E87], dh
004E85CB   874E00                 xchg    [esi+$00], ecx
004E85CE   06                     push    es
004E85CF   864E00                 xchg    [esi+$00], cl
004E85D2   2B884E000686           sub     ecx, dword ptr [eax+$8606004E]
004E85D8   4E                     dec     esi
004E85D9   005288                 add     [edx-$78], dl
004E85DC   4E                     dec     esi
004E85DD   007988                 add     [ecx-$78], bh
004E85E0   4E                     dec     esi
004E85E1   009F884E00C6           add     [edi+$C6004E88], bl
004E85E7   884E00                 mov     [esi+$00], cl
004E85EA   EC                     in      al, dx
004E85EB   884E00                 mov     [esi+$00], cl
004E85EE   13894E003A89           adc     ecx, [ecx+$893A004E]
004E85F4   4E                     dec     esi
004E85F5   00DD                   add     ch, bl
004E85F7   06                     push    es
004E85F8   D835C8934E00           fdiv    dword ptr [$004E93C8]
004E85FE   DD1E                   fstp    qword ptr [esi]
004E8600   9B                     wait
004E8601   E9550C0000             jmp     004E925B
004E8606   8B06                   mov     eax, [esi]
004E8608   8906                   mov     [esi], eax
004E860A   8B4604                 mov     eax, [esi+$04]
004E860D   894604                 mov     [esi+$04], eax
004E8610   E9460C0000             jmp     004E925B
004E8615   DD06                   fld     qword ptr [esi]
004E8617   D82518944E00           fsub    dword ptr [$004E9418]
004E861D   DD1E                   fstp    qword ptr [esi]
004E861F   9B                     wait
004E8620   E9360C0000             jmp     004E925B
004E8625   DB2DB4944E00           fld     tbyte ptr [$004E94B4]
004E862B   DC3E                   fdivr   qword ptr [esi]
004E862D   DD1E                   fstp    qword ptr [esi]
004E862F   9B                     wait
004E8630   E9260C0000             jmp     004E925B
004E8635   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E863B   DC3E                   fdivr   qword ptr [esi]
004E863D   DD1E                   fstp    qword ptr [esi]
004E863F   9B                     wait
004E8640   E9160C0000             jmp     004E925B
004E8645   DB2D5C944E00           fld     tbyte ptr [$004E945C]
004E864B   DC3E                   fdivr   qword ptr [esi]
004E864D   DD1E                   fstp    qword ptr [esi]
004E864F   9B                     wait
004E8650   E9060C0000             jmp     004E925B
004E8655   DD06                   fld     qword ptr [esi]
004E8657   D80DF4934E00           fmul    dword ptr [$004E93F4]
004E865D   DD1E                   fstp    qword ptr [esi]
004E865F   9B                     wait
004E8660   E9F60B0000             jmp     004E925B
004E8665   DD06                   fld     qword ptr [esi]
004E8667   D835C0944E00           fdiv    dword ptr [$004E94C0]
004E866D   DD1E                   fstp    qword ptr [esi]
004E866F   9B                     wait
004E8670   E9E60B0000             jmp     004E925B
004E8675   DD06                   fld     qword ptr [esi]
004E8677   D80DC4944E00           fmul    dword ptr [$004E94C4]
004E867D   D825C8944E00           fsub    dword ptr [$004E94C8]
004E8683   DD1E                   fstp    qword ptr [esi]
004E8685   9B                     wait
004E8686   E9D00B0000             jmp     004E925B
004E868B   DD06                   fld     qword ptr [esi]
004E868D   D80DCC934E00           fmul    dword ptr [$004E93CC]
004E8693   D825D0934E00           fsub    dword ptr [$004E93D0]
004E8699   DD1E                   fstp    qword ptr [esi]
004E869B   9B                     wait
004E869C   E9BA0B0000             jmp     004E925B
004E86A1   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E86A3   E81CA5F1FF             call    00402BC4
004E86A8   81E001000000           and     eax, $00000001
004E86AE   33D2                   xor     edx, edx
004E86B0   0FACD000               shrd    eax, edx, $00
004E86B4   C1EA00                 shr     edx, $00
004E86B7   8945E8                 mov     [ebp-$18], eax
004E86BA   8955EC                 mov     [ebp-$14], edx
004E86BD   DF6DE8                 fild    qword ptr [ebp-$18]
004E86C0   DD1E                   fstp    qword ptr [esi]
004E86C2   9B                     wait
004E86C3   E9930B0000             jmp     004E925B
004E86C8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E86CA   E8F5A4F1FF             call    00402BC4
004E86CF   81E002000000           and     eax, $00000002
004E86D5   33D2                   xor     edx, edx
004E86D7   0FACD001               shrd    eax, edx, $01
004E86DB   D1EA                   shr     edx, 1
004E86DD   8945E8                 mov     [ebp-$18], eax
004E86E0   8955EC                 mov     [ebp-$14], edx
004E86E3   DF6DE8                 fild    qword ptr [ebp-$18]
004E86E6   DD1E                   fstp    qword ptr [esi]
004E86E8   9B                     wait
004E86E9   E96D0B0000             jmp     004E925B
004E86EE   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E86F0   E8CFA4F1FF             call    00402BC4
004E86F5   81E004000000           and     eax, $00000004
004E86FB   33D2                   xor     edx, edx
004E86FD   0FACD002               shrd    eax, edx, $02
004E8701   C1EA02                 shr     edx, $02
004E8704   8945E8                 mov     [ebp-$18], eax
004E8707   8955EC                 mov     [ebp-$14], edx
004E870A   DF6DE8                 fild    qword ptr [ebp-$18]
004E870D   DD1E                   fstp    qword ptr [esi]
004E870F   9B                     wait
004E8710   E9460B0000             jmp     004E925B
004E8715   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8717   E8A8A4F1FF             call    00402BC4
004E871C   81E008000000           and     eax, $00000008
004E8722   33D2                   xor     edx, edx
004E8724   0FACD003               shrd    eax, edx, $03
004E8728   C1EA03                 shr     edx, $03
004E872B   8945E8                 mov     [ebp-$18], eax
004E872E   8955EC                 mov     [ebp-$14], edx
004E8731   DF6DE8                 fild    qword ptr [ebp-$18]
004E8734   DD1E                   fstp    qword ptr [esi]
004E8736   9B                     wait
004E8737   E91F0B0000             jmp     004E925B
004E873C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E873E   E881A4F1FF             call    00402BC4
004E8743   81E001000000           and     eax, $00000001
004E8749   33D2                   xor     edx, edx
004E874B   0FACD000               shrd    eax, edx, $00
004E874F   C1EA00                 shr     edx, $00
004E8752   8945E8                 mov     [ebp-$18], eax
004E8755   8955EC                 mov     [ebp-$14], edx
004E8758   DF6DE8                 fild    qword ptr [ebp-$18]
004E875B   DD1E                   fstp    qword ptr [esi]
004E875D   9B                     wait
004E875E   E9F80A0000             jmp     004E925B
004E8763   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8765   E85AA4F1FF             call    00402BC4
004E876A   81E002000000           and     eax, $00000002
004E8770   33D2                   xor     edx, edx
004E8772   0FACD001               shrd    eax, edx, $01
004E8776   D1EA                   shr     edx, 1
004E8778   8945E8                 mov     [ebp-$18], eax
004E877B   8955EC                 mov     [ebp-$14], edx
004E877E   DF6DE8                 fild    qword ptr [ebp-$18]
004E8781   DD1E                   fstp    qword ptr [esi]
004E8783   9B                     wait
004E8784   E9D20A0000             jmp     004E925B
004E8789   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E878B   E834A4F1FF             call    00402BC4
004E8790   81E004000000           and     eax, $00000004
004E8796   33D2                   xor     edx, edx
004E8798   0FACD002               shrd    eax, edx, $02
004E879C   C1EA02                 shr     edx, $02
004E879F   8945E8                 mov     [ebp-$18], eax
004E87A2   8955EC                 mov     [ebp-$14], edx
004E87A5   DF6DE8                 fild    qword ptr [ebp-$18]
004E87A8   DD1E                   fstp    qword ptr [esi]
004E87AA   9B                     wait
004E87AB   E9AB0A0000             jmp     004E925B
004E87B0   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E87B2   E80DA4F1FF             call    00402BC4
004E87B7   81E008000000           and     eax, $00000008
004E87BD   33D2                   xor     edx, edx
004E87BF   0FACD003               shrd    eax, edx, $03
004E87C3   C1EA03                 shr     edx, $03
004E87C6   8945E8                 mov     [ebp-$18], eax
004E87C9   8955EC                 mov     [ebp-$14], edx
004E87CC   DF6DE8                 fild    qword ptr [ebp-$18]
004E87CF   DD1E                   fstp    qword ptr [esi]
004E87D1   9B                     wait
004E87D2   E9840A0000             jmp     004E925B
004E87D7   DD06                   fld     qword ptr [esi]
004E87D9   D81DF8934E00           fcomp   dword ptr [$004E93F8]
004E87DF   DFE0                   fstsw   ax
004E87E1   9E                     sahf
004E87E2   740D                   jz      004E87F1
004E87E4   DD06                   fld     qword ptr [esi]
004E87E6   D81DC0944E00           fcomp   dword ptr [$004E94C0]
004E87EC   DFE0                   fstsw   ax
004E87EE   9E                     sahf
004E87EF   751A                   jnz     004E880B
004E87F1   DD06                   fld     qword ptr [esi]
004E87F3   D9FA                   fsqrt

* Reference to: System.@ROUND;
|
004E87F5   E8CAA3F1FF             call    00402BC4
004E87FA   8945E8                 mov     [ebp-$18], eax
004E87FD   8955EC                 mov     [ebp-$14], edx
004E8800   DF6DE8                 fild    qword ptr [ebp-$18]
004E8803   DD1E                   fstp    qword ptr [esi]
004E8805   9B                     wait
004E8806   E9500A0000             jmp     004E925B
004E880B   DD06                   fld     qword ptr [esi]
004E880D   D9FA                   fsqrt

* Reference to: System.@ROUND;
|
004E880F   E8B0A3F1FF             call    00402BC4
004E8814   83C001                 add     eax, +$01
004E8817   83D200                 adc     edx, +$00
004E881A   8945E8                 mov     [ebp-$18], eax
004E881D   8955EC                 mov     [ebp-$14], edx
004E8820   DF6DE8                 fild    qword ptr [ebp-$18]
004E8823   DD1E                   fstp    qword ptr [esi]
004E8825   9B                     wait
004E8826   E9300A0000             jmp     004E925B
004E882B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E882D   E892A3F1FF             call    00402BC4
004E8832   81E001000000           and     eax, $00000001
004E8838   33D2                   xor     edx, edx
004E883A   0FACD000               shrd    eax, edx, $00
004E883E   C1EA00                 shr     edx, $00
004E8841   8945E8                 mov     [ebp-$18], eax
004E8844   8955EC                 mov     [ebp-$14], edx
004E8847   DF6DE8                 fild    qword ptr [ebp-$18]
004E884A   DD1E                   fstp    qword ptr [esi]
004E884C   9B                     wait
004E884D   E9090A0000             jmp     004E925B
004E8852   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8854   E86BA3F1FF             call    00402BC4
004E8859   81E001000000           and     eax, $00000001
004E885F   33D2                   xor     edx, edx
004E8861   0FACD000               shrd    eax, edx, $00
004E8865   C1EA00                 shr     edx, $00
004E8868   8945E8                 mov     [ebp-$18], eax
004E886B   8955EC                 mov     [ebp-$14], edx
004E886E   DF6DE8                 fild    qword ptr [ebp-$18]
004E8871   DD1E                   fstp    qword ptr [esi]
004E8873   9B                     wait
004E8874   E9E2090000             jmp     004E925B
004E8879   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E887B   E844A3F1FF             call    00402BC4
004E8880   81E002000000           and     eax, $00000002
004E8886   33D2                   xor     edx, edx
004E8888   0FACD001               shrd    eax, edx, $01
004E888C   D1EA                   shr     edx, 1
004E888E   8945E8                 mov     [ebp-$18], eax
004E8891   8955EC                 mov     [ebp-$14], edx
004E8894   DF6DE8                 fild    qword ptr [ebp-$18]
004E8897   DD1E                   fstp    qword ptr [esi]
004E8899   9B                     wait
004E889A   E9BC090000             jmp     004E925B
004E889F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88A1   E81EA3F1FF             call    00402BC4
004E88A6   81E001000000           and     eax, $00000001
004E88AC   33D2                   xor     edx, edx
004E88AE   0FACD000               shrd    eax, edx, $00
004E88B2   C1EA00                 shr     edx, $00
004E88B5   8945E8                 mov     [ebp-$18], eax
004E88B8   8955EC                 mov     [ebp-$14], edx
004E88BB   DF6DE8                 fild    qword ptr [ebp-$18]
004E88BE   DD1E                   fstp    qword ptr [esi]
004E88C0   9B                     wait
004E88C1   E995090000             jmp     004E925B
004E88C6   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88C8   E8F7A2F1FF             call    00402BC4
004E88CD   81E002000000           and     eax, $00000002
004E88D3   33D2                   xor     edx, edx
004E88D5   0FACD001               shrd    eax, edx, $01
004E88D9   D1EA                   shr     edx, 1
004E88DB   8945E8                 mov     [ebp-$18], eax
004E88DE   8955EC                 mov     [ebp-$14], edx
004E88E1   DF6DE8                 fild    qword ptr [ebp-$18]
004E88E4   DD1E                   fstp    qword ptr [esi]
004E88E6   9B                     wait
004E88E7   E96F090000             jmp     004E925B
004E88EC   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88EE   E8D1A2F1FF             call    00402BC4
004E88F3   81E004000000           and     eax, $00000004
004E88F9   33D2                   xor     edx, edx
004E88FB   0FACD002               shrd    eax, edx, $02
004E88FF   C1EA02                 shr     edx, $02
004E8902   8945E8                 mov     [ebp-$18], eax
004E8905   8955EC                 mov     [ebp-$14], edx
004E8908   DF6DE8                 fild    qword ptr [ebp-$18]
004E890B   DD1E                   fstp    qword ptr [esi]
004E890D   9B                     wait
004E890E   E948090000             jmp     004E925B
004E8913   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8915   E8AAA2F1FF             call    00402BC4
004E891A   81E008000000           and     eax, $00000008
004E8920   33D2                   xor     edx, edx
004E8922   0FACD003               shrd    eax, edx, $03
004E8926   C1EA03                 shr     edx, $03
004E8929   8945E8                 mov     [ebp-$18], eax
004E892C   8955EC                 mov     [ebp-$14], edx
004E892F   DF6DE8                 fild    qword ptr [ebp-$18]
004E8932   DD1E                   fstp    qword ptr [esi]
004E8934   9B                     wait
004E8935   E921090000             jmp     004E925B
004E893A   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E893C   E883A2F1FF             call    00402BC4
004E8941   81E010000000           and     eax, $00000010
004E8947   33D2                   xor     edx, edx
004E8949   0FACD004               shrd    eax, edx, $04
004E894D   C1EA04                 shr     edx, $04
004E8950   8945E8                 mov     [ebp-$18], eax
004E8953   8955EC                 mov     [ebp-$14], edx
004E8956   DF6DE8                 fild    qword ptr [ebp-$18]
004E8959   DD1E                   fstp    qword ptr [esi]
004E895B   9B                     wait
004E895C   E9FA080000             jmp     004E925B
004E8961   83FF1E                 cmp     edi, +$1E
004E8964   0F87F1080000           jnbe    004E925B
004E896A   FF24BD71894E00         jmp     dword ptr [$4E8971+edi*4]
004E8971   5B                     pop     ebx
004E8972   92                     xchg    eax, edx
004E8973   4E                     dec     esi
004E8974   00ED                   add     ch, ch
004E8976   894E00                 mov     [esi+$00], ecx
004E8979   198A4E00408A           sbb     [edx+$8A40004E], ecx
004E897F   4E                     dec     esi
004E8980   00668A                 add     [esi-$76], ah
004E8983   4E                     dec     esi
004E8984   008D8A4E009C           add     [ebp+$9C004E8A], cl
004E898A   8A4E00                 mov     cl, byte ptr [esi+$00]
004E898D   AC                     lodsb
004E898E   8A4E00                 mov     cl, byte ptr [esi+$00]
004E8991   CD8A                   int     $8A
004E8993   4E                     dec     esi
004E8994   00DD                   add     ch, bl
004E8996   8A4E00                 mov     cl, byte ptr [esi+$00]
004E8999   EC                     in      al, dx
004E899A   8A4E00                 mov     cl, byte ptr [esi+$00]
004E899D   FB                     sti
004E899E   8A4E00                 mov     cl, byte ptr [esi+$00]
004E89A1   1C8B                   sbb     al, $8B
004E89A3   4E                     dec     esi
004E89A4   002B                   add     [ebx], ch
004E89A6   8B4E00                 mov     ecx, [esi+$00]
004E89A9   3A8B4E004A8B           cmp     cl, byte ptr [ebx+$8B4A004E]
004E89AF   4E                     dec     esi
004E89B0   006B8B                 add     [ebx-$75], ch
004E89B3   4E                     dec     esi
004E89B4   007A8B                 add     [edx-$75], bh
004E89B7   4E                     dec     esi
004E89B8   009B8B4E00C2           add     [ebx+$C2004E8B], bl
004E89BE   8B4E00                 mov     ecx, [esi+$00]
004E89C1   E88B4E00E8             call    E84ED851
004E89C6   8B4E00                 mov     ecx, [esi+$00]
004E89C9   E88B4E00E8             call    E84ED859
004E89CE   8B4E00                 mov     ecx, [esi+$00]
004E89D1   E88B4E00E8             call    E84ED861
004E89D6   8B4E00                 mov     ecx, [esi+$00]
004E89D9   E88B4E00E8             call    E84ED869
004E89DE   8B4E00                 mov     ecx, [esi+$00]
004E89E1   F8                     clc
004E89E2   8B4E00                 mov     ecx, [esi+$00]
004E89E5   248C                   and     al, $8C
004E89E7   4E                     dec     esi
004E89E8   00348C                 add     [esp+ecx*4], dh
004E89EB   4E                     dec     esi
004E89EC   00DD                   add     ch, bl
004E89EE   06                     push    es
004E89EF   D81DCC944E00           fcomp   dword ptr [$004E94CC]
004E89F5   DFE0                   fstsw   ax
004E89F7   9E                     sahf
004E89F8   7610                   jbe     004E8A0A
004E89FA   33C0                   xor     eax, eax
004E89FC   8906                   mov     [esi], eax
004E89FE   C7460400002040         mov     dword ptr [esi+$04], $40200000
004E8A05   E951080000             jmp     004E925B
004E8A0A   8B06                   mov     eax, [esi]
004E8A0C   8906                   mov     [esi], eax
004E8A0E   8B4604                 mov     eax, [esi+$04]
004E8A11   894604                 mov     [esi+$04], eax
004E8A14   E942080000             jmp     004E925B
004E8A19   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A1B   E8A4A1F1FF             call    00402BC4
004E8A20   81E001000000           and     eax, $00000001
004E8A26   33D2                   xor     edx, edx
004E8A28   0FACD000               shrd    eax, edx, $00
004E8A2C   C1EA00                 shr     edx, $00
004E8A2F   8945E8                 mov     [ebp-$18], eax
004E8A32   8955EC                 mov     [ebp-$14], edx
004E8A35   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A38   DD1E                   fstp    qword ptr [esi]
004E8A3A   9B                     wait
004E8A3B   E91B080000             jmp     004E925B
004E8A40   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A42   E87DA1F1FF             call    00402BC4
004E8A47   81E002000000           and     eax, $00000002
004E8A4D   33D2                   xor     edx, edx
004E8A4F   0FACD001               shrd    eax, edx, $01
004E8A53   D1EA                   shr     edx, 1
004E8A55   8945E8                 mov     [ebp-$18], eax
004E8A58   8955EC                 mov     [ebp-$14], edx
004E8A5B   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A5E   DD1E                   fstp    qword ptr [esi]
004E8A60   9B                     wait
004E8A61   E9F5070000             jmp     004E925B
004E8A66   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A68   E857A1F1FF             call    00402BC4
004E8A6D   81E004000000           and     eax, $00000004
004E8A73   33D2                   xor     edx, edx
004E8A75   0FACD002               shrd    eax, edx, $02
004E8A79   C1EA02                 shr     edx, $02
004E8A7C   8945E8                 mov     [ebp-$18], eax
004E8A7F   8955EC                 mov     [ebp-$14], edx
004E8A82   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A85   DD1E                   fstp    qword ptr [esi]
004E8A87   9B                     wait
004E8A88   E9CE070000             jmp     004E925B
004E8A8D   8B06                   mov     eax, [esi]
004E8A8F   8906                   mov     [esi], eax
004E8A91   8B4604                 mov     eax, [esi+$04]
004E8A94   894604                 mov     [esi+$04], eax
004E8A97   E9BF070000             jmp     004E925B
004E8A9C   DD06                   fld     qword ptr [esi]
004E8A9E   D83598934E00           fdiv    dword ptr [$004E9398]
004E8AA4   DD1E                   fstp    qword ptr [esi]
004E8AA6   9B                     wait
004E8AA7   E9AF070000             jmp     004E925B
004E8AAC   DD06                   fld     qword ptr [esi]
004E8AAE   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E8AB4   DFE0                   fstsw   ax
004E8AB6   9E                     sahf
004E8AB7   0F869E070000           jbe     004E925B
004E8ABD   D905D0944E00           fld     dword ptr [$004E94D0]
004E8AC3   DC06                   fadd    qword ptr [esi]
004E8AC5   DD1E                   fstp    qword ptr [esi]
004E8AC7   9B                     wait
004E8AC8   E98E070000             jmp     004E925B
004E8ACD   DD06                   fld     qword ptr [esi]
004E8ACF   D82518944E00           fsub    dword ptr [$004E9418]
004E8AD5   DD1E                   fstp    qword ptr [esi]
004E8AD7   9B                     wait
004E8AD8   E97E070000             jmp     004E925B
004E8ADD   8B06                   mov     eax, [esi]
004E8ADF   8906                   mov     [esi], eax
004E8AE1   8B4604                 mov     eax, [esi+$04]
004E8AE4   894604                 mov     [esi+$04], eax
004E8AE7   E96F070000             jmp     004E925B
004E8AEC   8B06                   mov     eax, [esi]
004E8AEE   8906                   mov     [esi], eax
004E8AF0   8B4604                 mov     eax, [esi+$04]
004E8AF3   894604                 mov     [esi+$04], eax
004E8AF6   E960070000             jmp     004E925B
004E8AFB   DD06                   fld     qword ptr [esi]
004E8AFD   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E8B03   DFE0                   fstsw   ax
004E8B05   9E                     sahf
004E8B06   0F864F070000           jbe     004E925B
004E8B0C   D905D0944E00           fld     dword ptr [$004E94D0]
004E8B12   DC06                   fadd    qword ptr [esi]
004E8B14   DD1E                   fstp    qword ptr [esi]
004E8B16   9B                     wait
004E8B17   E93F070000             jmp     004E925B
004E8B1C   8B06                   mov     eax, [esi]
004E8B1E   8906                   mov     [esi], eax
004E8B20   8B4604                 mov     eax, [esi+$04]
004E8B23   894604                 mov     [esi+$04], eax
004E8B26   E930070000             jmp     004E925B
004E8B2B   8B06                   mov     eax, [esi]
004E8B2D   8906                   mov     [esi], eax
004E8B2F   8B4604                 mov     eax, [esi+$04]
004E8B32   894604                 mov     [esi+$04], eax
004E8B35   E921070000             jmp     004E925B
004E8B3A   DB2D84934E00           fld     tbyte ptr [$004E9384]
004E8B40   DC3E                   fdivr   qword ptr [esi]
004E8B42   DD1E                   fstp    qword ptr [esi]
004E8B44   9B                     wait
004E8B45   E911070000             jmp     004E925B
004E8B4A   DD06                   fld     qword ptr [esi]
004E8B4C   D81DC0934E00           fcomp   dword ptr [$004E93C0]
004E8B52   DFE0                   fstsw   ax
004E8B54   9E                     sahf
004E8B55   0F8600070000           jbe     004E925B
004E8B5B   D905D0944E00           fld     dword ptr [$004E94D0]
004E8B61   DC06                   fadd    qword ptr [esi]
004E8B63   DD1E                   fstp    qword ptr [esi]
004E8B65   9B                     wait
004E8B66   E9F0060000             jmp     004E925B
004E8B6B   8B06                   mov     eax, [esi]
004E8B6D   8906                   mov     [esi], eax
004E8B6F   8B4604                 mov     eax, [esi+$04]
004E8B72   894604                 mov     [esi+$04], eax
004E8B75   E9E1060000             jmp     004E925B
004E8B7A   DD06                   fld     qword ptr [esi]
004E8B7C   D81DD4944E00           fcomp   dword ptr [$004E94D4]
004E8B82   DFE0                   fstsw   ax
004E8B84   9E                     sahf
004E8B85   0F86D0060000           jbe     004E925B
004E8B8B   D905D8944E00           fld     dword ptr [$004E94D8]
004E8B91   DC06                   fadd    qword ptr [esi]
004E8B93   DD1E                   fstp    qword ptr [esi]
004E8B95   9B                     wait
004E8B96   E9C0060000             jmp     004E925B
004E8B9B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8B9D   E822A0F1FF             call    00402BC4
004E8BA2   81E001000000           and     eax, $00000001
004E8BA8   33D2                   xor     edx, edx
004E8BAA   0FACD000               shrd    eax, edx, $00
004E8BAE   C1EA00                 shr     edx, $00
004E8BB1   8945E8                 mov     [ebp-$18], eax
004E8BB4   8955EC                 mov     [ebp-$14], edx
004E8BB7   DF6DE8                 fild    qword ptr [ebp-$18]
004E8BBA   DD1E                   fstp    qword ptr [esi]
004E8BBC   9B                     wait
004E8BBD   E999060000             jmp     004E925B
004E8BC2   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8BC4   E8FB9FF1FF             call    00402BC4
004E8BC9   81E002000000           and     eax, $00000002
004E8BCF   33D2                   xor     edx, edx
004E8BD1   0FACD001               shrd    eax, edx, $01
004E8BD5   D1EA                   shr     edx, 1
004E8BD7   8945E8                 mov     [ebp-$18], eax
004E8BDA   8955EC                 mov     [ebp-$14], edx
004E8BDD   DF6DE8                 fild    qword ptr [ebp-$18]
004E8BE0   DD1E                   fstp    qword ptr [esi]
004E8BE2   9B                     wait
004E8BE3   E973060000             jmp     004E925B
004E8BE8   DD06                   fld     qword ptr [esi]
004E8BEA   D83598934E00           fdiv    dword ptr [$004E9398]
004E8BF0   DD1E                   fstp    qword ptr [esi]
004E8BF2   9B                     wait
004E8BF3   E963060000             jmp     004E925B
004E8BF8   DD06                   fld     qword ptr [esi]
004E8BFA   D825F8934E00           fsub    dword ptr [$004E93F8]
004E8C00   DD1E                   fstp    qword ptr [esi]
004E8C02   9B                     wait
004E8C03   DD06                   fld     qword ptr [esi]
004E8C05   D81DDC944E00           fcomp   dword ptr [$004E94DC]
004E8C0B   DFE0                   fstsw   ax
004E8C0D   9E                     sahf
004E8C0E   0F8547060000           jnz     004E925B
004E8C14   33C0                   xor     eax, eax
004E8C16   8906                   mov     [esi], eax
004E8C18   C7460400001040         mov     dword ptr [esi+$04], $40100000
004E8C1F   E937060000             jmp     004E925B
004E8C24   DD06                   fld     qword ptr [esi]
004E8C26   D825F8934E00           fsub    dword ptr [$004E93F8]
004E8C2C   DD1E                   fstp    qword ptr [esi]
004E8C2E   9B                     wait
004E8C2F   E927060000             jmp     004E925B
004E8C34   8B06                   mov     eax, [esi]
004E8C36   8906                   mov     [esi], eax
004E8C38   8B4604                 mov     eax, [esi+$04]
004E8C3B   894604                 mov     [esi+$04], eax
004E8C3E   E918060000             jmp     004E925B
004E8C43   83FF11                 cmp     edi, +$11
004E8C46   0F870F060000           jnbe    004E925B
004E8C4C   0FB6BF5A8C4E00         movzx   edi, byte ptr [edi+$4E8C5A]
004E8C53   FF24BD6C8C4E00         jmp     dword ptr [$4E8C6C+edi*4]
004E8C5A   0001                   add     [ecx], al
004E8C5C   0203                   add     al, byte ptr [ebx]
004E8C5E   0303                   add     eax, [ebx]
004E8C60   0303                   add     eax, [ebx]
004E8C62   0303                   add     eax, [ebx]
004E8C64   0303                   add     eax, [ebx]
004E8C66   030404                 add     eax, [esp+eax]
004E8C69   0405                   add     al, +$05
004E8C6B   06                     push    es
004E8C6C   5B                     pop     ebx
004E8C6D   92                     xchg    eax, edx
004E8C6E   4E                     dec     esi
004E8C6F   00888C4E0098           add     [eax+$98004E8C], cl
004E8C75   8C4E00                 mov     word ptr [esi+$00], cs
004E8C78   A7                     cmpsd
004E8C79   8C4E00                 mov     word ptr [esi+$00], cs
004E8C7C   B78C                   mov     bh, $8C
004E8C7E   4E                     dec     esi
004E8C7F   00D8                   add     al, bl
004E8C81   8C4E00                 mov     word ptr [esi+$00], cs
004E8C84   F9                     stc
004E8C85   8C4E00                 mov     word ptr [esi+$00], cs
004E8C88   DB2DE0944E00           fld     tbyte ptr [$004E94E0]
004E8C8E   DC3E                   fdivr   qword ptr [esi]
004E8C90   DD1E                   fstp    qword ptr [esi]
004E8C92   9B                     wait
004E8C93   E9C3050000             jmp     004E925B
004E8C98   8B06                   mov     eax, [esi]
004E8C9A   8906                   mov     [esi], eax
004E8C9C   8B4604                 mov     eax, [esi+$04]
004E8C9F   894604                 mov     [esi+$04], eax
004E8CA2   E9B4050000             jmp     004E925B
004E8CA7   DD06                   fld     qword ptr [esi]
004E8CA9   D835EC944E00           fdiv    dword ptr [$004E94EC]
004E8CAF   DD1E                   fstp    qword ptr [esi]
004E8CB1   9B                     wait
004E8CB2   E9A4050000             jmp     004E925B
004E8CB7   DD06                   fld     qword ptr [esi]
004E8CB9   D81DFC934E00           fcomp   dword ptr [$004E93FC]
004E8CBF   DFE0                   fstsw   ax
004E8CC1   9E                     sahf
004E8CC2   0F8693050000           jbe     004E925B
004E8CC8   33C0                   xor     eax, eax
004E8CCA   8906                   mov     [esi], eax
004E8CCC   C7460400000840         mov     dword ptr [esi+$04], $40080000
004E8CD3   E983050000             jmp     004E925B
004E8CD8   DD06                   fld     qword ptr [esi]
004E8CDA   D81DC8934E00           fcomp   dword ptr [$004E93C8]
004E8CE0   DFE0                   fstsw   ax
004E8CE2   9E                     sahf
004E8CE3   0F8672050000           jbe     004E925B
004E8CE9   33C0                   xor     eax, eax
004E8CEB   8906                   mov     [esi], eax
004E8CED   C7460400001040         mov     dword ptr [esi+$04], $40100000
004E8CF4   E962050000             jmp     004E925B
004E8CF9   DD06                   fld     qword ptr [esi]
004E8CFB   D81D94934E00           fcomp   dword ptr [$004E9394]
004E8D01   DFE0                   fstsw   ax
004E8D03   9E                     sahf
004E8D04   0F8651050000           jbe     004E925B
004E8D0A   33C0                   xor     eax, eax
004E8D0C   8906                   mov     [esi], eax
004E8D0E   C7460400002040         mov     dword ptr [esi+$04], $40200000
004E8D15   E941050000             jmp     004E925B
004E8D1A   83FF08                 cmp     edi, +$08
004E8D1D   0F8738050000           jnbe    004E925B
004E8D23   FF24BD2A8D4E00         jmp     dword ptr [$4E8D2A+edi*4]
004E8D2A   5B                     pop     ebx
004E8D2B   92                     xchg    eax, edx
004E8D2C   4E                     dec     esi
004E8D2D   004E8D                 add     [esi-$73], cl
004E8D30   4E                     dec     esi
004E8D31   005D8D                 add     [ebp-$73], bl
004E8D34   4E                     dec     esi
004E8D35   005D8D                 add     [ebp-$73], bl
004E8D38   4E                     dec     esi
004E8D39   005D8D                 add     [ebp-$73], bl
004E8D3C   4E                     dec     esi
004E8D3D   005D8D                 add     [ebp-$73], bl
004E8D40   4E                     dec     esi
004E8D41   006D8D                 add     [ebp-$73], ch
004E8D44   4E                     dec     esi
004E8D45   00948D4E00A48D         add     [ebp+ecx*4+$8DA4004E], dl
004E8D4C   4E                     dec     esi
004E8D4D   008B0689068B           add     [ebx+$8B068906], cl
004E8D53   46                     inc     esi
004E8D54   0489                   add     al, -$77
004E8D56   46                     inc     esi
004E8D57   04E9                   add     al, -$17
004E8D59   FE0400                 inc     byte ptr [eax+eax]
004E8D5C   00DD                   add     ch, bl
004E8D5E   06                     push    es
004E8D5F   D835F0944E00           fdiv    dword ptr [$004E94F0]
004E8D65   DD1E                   fstp    qword ptr [esi]
004E8D67   9B                     wait
004E8D68   E9EE040000             jmp     004E925B
004E8D6D   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8D6F   E8509EF1FF             call    00402BC4
004E8D74   81E004000000           and     eax, $00000004
004E8D7A   33D2                   xor     edx, edx
004E8D7C   0FACD002               shrd    eax, edx, $02
004E8D80   C1EA02                 shr     edx, $02
004E8D83   8945E8                 mov     [ebp-$18], eax
004E8D86   8955EC                 mov     [ebp-$14], edx
004E8D89   DF6DE8                 fild    qword ptr [ebp-$18]
004E8D8C   DD1E                   fstp    qword ptr [esi]
004E8D8E   9B                     wait
004E8D8F   E9C7040000             jmp     004E925B
004E8D94   DD06                   fld     qword ptr [esi]
004E8D96   D83538944E00           fdiv    dword ptr [$004E9438]
004E8D9C   DD1E                   fstp    qword ptr [esi]
004E8D9E   9B                     wait
004E8D9F   E9B7040000             jmp     004E925B
004E8DA4   DB2DF4944E00           fld     tbyte ptr [$004E94F4]
004E8DAA   DC3E                   fdivr   qword ptr [esi]
004E8DAC   DD1E                   fstp    qword ptr [esi]
004E8DAE   9B                     wait
004E8DAF   E9A7040000             jmp     004E925B
004E8DB4   83FF09                 cmp     edi, +$09
004E8DB7   0F879E040000           jnbe    004E925B
004E8DBD   FF24BDC48D4E00         jmp     dword ptr [$4E8DC4+edi*4]
004E8DC4   5B                     pop     ebx
004E8DC5   92                     xchg    eax, edx
004E8DC6   4E                     dec     esi
004E8DC7   00EC                   add     ah, ch
004E8DC9   8D4E00                 lea     ecx, [esi+$00]
004E8DCC   EC                     in      al, dx
004E8DCD   8D4E00                 lea     ecx, [esi+$00]
004E8DD0   EC                     in      al, dx
004E8DD1   8D4E00                 lea     ecx, [esi+$00]
004E8DD4   EC                     in      al, dx
004E8DD5   8D4E00                 lea     ecx, [esi+$00]
004E8DD8   EC                     in      al, dx
004E8DD9   8D4E00                 lea     ecx, [esi+$00]
004E8DDC   FC                     cld
004E8DDD   8D4E00                 lea     ecx, [esi+$00]
004E8DE0   238E4E00498E           and     ecx, [esi+$8E49004E]
004E8DE6   4E                     dec     esi
004E8DE7   00708E                 add     [eax-$72], dh
004E8DEA   4E                     dec     esi
004E8DEB   00DD                   add     ch, bl
004E8DED   06                     push    es
004E8DEE   D83598934E00           fdiv    dword ptr [$004E9398]
004E8DF4   DD1E                   fstp    qword ptr [esi]
004E8DF6   9B                     wait
004E8DF7   E95F040000             jmp     004E925B
004E8DFC   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8DFE   E8C19DF1FF             call    00402BC4
004E8E03   81E001000000           and     eax, $00000001
004E8E09   33D2                   xor     edx, edx
004E8E0B   0FACD000               shrd    eax, edx, $00
004E8E0F   C1EA00                 shr     edx, $00
004E8E12   8945E8                 mov     [ebp-$18], eax
004E8E15   8955EC                 mov     [ebp-$14], edx
004E8E18   DF6DE8                 fild    qword ptr [ebp-$18]
004E8E1B   DD1E                   fstp    qword ptr [esi]
004E8E1D   9B                     wait
004E8E1E   E938040000             jmp     004E925B
004E8E23   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8E25   E89A9DF1FF             call    00402BC4
004E8E2A   81E002000000           and     eax, $00000002
004E8E30   33D2                   xor     edx, edx
004E8E32   0FACD001               shrd    eax, edx, $01
004E8E36   D1EA                   shr     edx, 1
004E8E38   8945E8                 mov     [ebp-$18], eax
004E8E3B   8955EC                 mov     [ebp-$14], edx
004E8E3E   DF6DE8                 fild    qword ptr [ebp-$18]
004E8E41   DD1E                   fstp    qword ptr [esi]
004E8E43   9B                     wait
004E8E44   E912040000             jmp     004E925B
004E8E49   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8E4B   E8749DF1FF             call    00402BC4
004E8E50   81E004000000           and     eax, $00000004
004E8E56   33D2                   xor     edx, edx
004E8E58   0FACD002               shrd    eax, edx, $02
004E8E5C   C1EA02                 shr     edx, $02
004E8E5F   8945E8                 mov     [ebp-$18], eax
004E8E62   8955EC                 mov     [ebp-$14], edx
004E8E65   DF6DE8                 fild    qword ptr [ebp-$18]
004E8E68   DD1E                   fstp    qword ptr [esi]
004E8E6A   9B                     wait
004E8E6B   E9EB030000             jmp     004E925B
004E8E70   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8E72   E84D9DF1FF             call    00402BC4
004E8E77   81E008000000           and     eax, $00000008
004E8E7D   33D2                   xor     edx, edx
004E8E7F   0FACD003               shrd    eax, edx, $03
004E8E83   C1EA03                 shr     edx, $03
004E8E86   8945E8                 mov     [ebp-$18], eax
004E8E89   8955EC                 mov     [ebp-$14], edx
004E8E8C   DF6DE8                 fild    qword ptr [ebp-$18]
004E8E8F   DD1E                   fstp    qword ptr [esi]
004E8E91   9B                     wait
004E8E92   E9C4030000             jmp     004E925B
004E8E97   83FF1E                 cmp     edi, +$1E
004E8E9A   0F87BB030000           jnbe    004E925B
004E8EA0   0FB6BFAE8E4E00         movzx   edi, byte ptr [edi+$4E8EAE]
004E8EA7   FF24BDCD8E4E00         jmp     dword ptr [$4E8ECD+edi*4]
004E8EAE   0001                   add     [ecx], al
004E8EB0   0101                   add     [ecx], eax
004E8EB2   0102                   add     [edx], eax
004E8EB4   03040506070809         add     eax, [$9080706+eax]
004E8EBB   0A0B                   or      cl, byte ptr [ebx]
004E8EBD   0D0B0A0709             or      eax, $09070A0B
004E8EC2   0C08                   or      al, $08
004E8EC4   0907                   or      [edi], eax
004E8EC6   0A0B                   or      cl, byte ptr [ebx]
004E8EC8   0D0C0E0E0C             or      eax, $0C0E0E0C
004E8ECD   5B                     pop     ebx
004E8ECE   92                     xchg    eax, edx
004E8ECF   4E                     dec     esi
004E8ED0   0009                   add     [ecx], cl
004E8ED2   8F4E00                 pop     dword ptr [esi+$00]
004E8ED5   188F4E00288F           sbb     [edi+$8F28004E], cl
004E8EDB   4E                     dec     esi
004E8EDC   0038                   add     [eax], bh
004E8EDE   8F4E00                 pop     dword ptr [esi+$00]
004E8EE1   48                     dec     eax
004E8EE2   8F4E00                 pop     dword ptr [esi+$00]
004E8EE5   5E                     pop     esi
004E8EE6   8F4E00                 pop     dword ptr [esi+$00]
004E8EE9   748F                   jz      004E8E7A
004E8EEB   4E                     dec     esi
004E8EEC   009B8F4E00C2           add     [ebx+$C2004E8F], bl
004E8EF2   8F4E00                 pop     dword ptr [esi+$00]
004E8EF5   E88F4E000F             call    0F4EDD89
004E8EFA   90                     nop
004E8EFB   4E                     dec     esi
004E8EFC   0036                   add     [esi], dh
004E8EFE   90                     nop
004E8EFF   4E                     dec     esi
004E8F00   005D90                 add     [ebp-$70], bl
004E8F03   4E                     dec     esi
004E8F04   0084904E008B06         add     [eax+edx*4+$68B004E], al
004E8F0B   8906                   mov     [esi], eax
004E8F0D   8B4604                 mov     eax, [esi+$04]
004E8F10   894604                 mov     [esi+$04], eax
004E8F13   E943030000             jmp     004E925B
004E8F18   DD06                   fld     qword ptr [esi]
004E8F1A   D80DCC934E00           fmul    dword ptr [$004E93CC]
004E8F20   DD1E                   fstp    qword ptr [esi]
004E8F22   9B                     wait
004E8F23   E933030000             jmp     004E925B
004E8F28   DD06                   fld     qword ptr [esi]
004E8F2A   D83500954E00           fdiv    dword ptr [$004E9500]
004E8F30   DD1E                   fstp    qword ptr [esi]
004E8F32   9B                     wait
004E8F33   E923030000             jmp     004E925B
004E8F38   DD06                   fld     qword ptr [esi]
004E8F3A   D835C8934E00           fdiv    dword ptr [$004E93C8]
004E8F40   DD1E                   fstp    qword ptr [esi]
004E8F42   9B                     wait
004E8F43   E913030000             jmp     004E925B
004E8F48   DB2D04954E00           fld     tbyte ptr [$004E9504]
004E8F4E   DC0E                   fmul    qword ptr [esi]
004E8F50   D80510954E00           fadd    dword ptr [$004E9510]
004E8F56   DD1E                   fstp    qword ptr [esi]
004E8F58   9B                     wait
004E8F59   E9FD020000             jmp     004E925B
004E8F5E   DB2D04954E00           fld     tbyte ptr [$004E9504]
004E8F64   DC0E                   fmul    qword ptr [esi]
004E8F66   D80510954E00           fadd    dword ptr [$004E9510]
004E8F6C   DD1E                   fstp    qword ptr [esi]
004E8F6E   9B                     wait
004E8F6F   E9E7020000             jmp     004E925B
004E8F74   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8F76   E8499CF1FF             call    00402BC4
004E8F7B   81E004000000           and     eax, $00000004
004E8F81   33D2                   xor     edx, edx
004E8F83   0FACD002               shrd    eax, edx, $02
004E8F87   C1EA02                 shr     edx, $02
004E8F8A   8945E8                 mov     [ebp-$18], eax
004E8F8D   8955EC                 mov     [ebp-$14], edx
004E8F90   DF6DE8                 fild    qword ptr [ebp-$18]
004E8F93   DD1E                   fstp    qword ptr [esi]
004E8F95   9B                     wait
004E8F96   E9C0020000             jmp     004E925B
004E8F9B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8F9D   E8229CF1FF             call    00402BC4
004E8FA2   81E001000000           and     eax, $00000001
004E8FA8   33D2                   xor     edx, edx
004E8FAA   0FACD000               shrd    eax, edx, $00
004E8FAE   C1EA00                 shr     edx, $00
004E8FB1   8945E8                 mov     [ebp-$18], eax
004E8FB4   8955EC                 mov     [ebp-$14], edx
004E8FB7   DF6DE8                 fild    qword ptr [ebp-$18]
004E8FBA   DD1E                   fstp    qword ptr [esi]
004E8FBC   9B                     wait
004E8FBD   E999020000             jmp     004E925B
004E8FC2   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8FC4   E8FB9BF1FF             call    00402BC4
004E8FC9   81E002000000           and     eax, $00000002
004E8FCF   33D2                   xor     edx, edx
004E8FD1   0FACD001               shrd    eax, edx, $01
004E8FD5   D1EA                   shr     edx, 1
004E8FD7   8945E8                 mov     [ebp-$18], eax
004E8FDA   8955EC                 mov     [ebp-$14], edx
004E8FDD   DF6DE8                 fild    qword ptr [ebp-$18]
004E8FE0   DD1E                   fstp    qword ptr [esi]
004E8FE2   9B                     wait
004E8FE3   E973020000             jmp     004E925B
004E8FE8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8FEA   E8D59BF1FF             call    00402BC4
004E8FEF   81E008000000           and     eax, $00000008
004E8FF5   33D2                   xor     edx, edx
004E8FF7   0FACD003               shrd    eax, edx, $03
004E8FFB   C1EA03                 shr     edx, $03
004E8FFE   8945E8                 mov     [ebp-$18], eax
004E9001   8955EC                 mov     [ebp-$14], edx
004E9004   DF6DE8                 fild    qword ptr [ebp-$18]
004E9007   DD1E                   fstp    qword ptr [esi]
004E9009   9B                     wait
004E900A   E94C020000             jmp     004E925B
004E900F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9011   E8AE9BF1FF             call    00402BC4
004E9016   81E010000000           and     eax, $00000010
004E901C   33D2                   xor     edx, edx
004E901E   0FACD004               shrd    eax, edx, $04
004E9022   C1EA04                 shr     edx, $04
004E9025   8945E8                 mov     [ebp-$18], eax
004E9028   8955EC                 mov     [ebp-$14], edx
004E902B   DF6DE8                 fild    qword ptr [ebp-$18]
004E902E   DD1E                   fstp    qword ptr [esi]
004E9030   9B                     wait
004E9031   E925020000             jmp     004E925B
004E9036   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9038   E8879BF1FF             call    00402BC4
004E903D   81E040000000           and     eax, $00000040
004E9043   33D2                   xor     edx, edx
004E9045   0FACD006               shrd    eax, edx, $06
004E9049   C1EA06                 shr     edx, $06
004E904C   8945E8                 mov     [ebp-$18], eax
004E904F   8955EC                 mov     [ebp-$14], edx
004E9052   DF6DE8                 fild    qword ptr [ebp-$18]
004E9055   DD1E                   fstp    qword ptr [esi]
004E9057   9B                     wait
004E9058   E9FE010000             jmp     004E925B
004E905D   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E905F   E8609BF1FF             call    00402BC4
004E9064   81E020000000           and     eax, $00000020
004E906A   33D2                   xor     edx, edx
004E906C   0FACD005               shrd    eax, edx, $05
004E9070   C1EA05                 shr     edx, $05
004E9073   8945E8                 mov     [ebp-$18], eax
004E9076   8955EC                 mov     [ebp-$14], edx
004E9079   DF6DE8                 fild    qword ptr [ebp-$18]
004E907C   DD1E                   fstp    qword ptr [esi]
004E907E   9B                     wait
004E907F   E9D7010000             jmp     004E925B
004E9084   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9086   E8399BF1FF             call    00402BC4
004E908B   81E080000000           and     eax, $00000080
004E9091   33D2                   xor     edx, edx
004E9093   0FACD007               shrd    eax, edx, $07
004E9097   C1EA07                 shr     edx, $07
004E909A   8945E8                 mov     [ebp-$18], eax
004E909D   8955EC                 mov     [ebp-$14], edx
004E90A0   DF6DE8                 fild    qword ptr [ebp-$18]
004E90A3   DD1E                   fstp    qword ptr [esi]
004E90A5   9B                     wait
004E90A6   E9B0010000             jmp     004E925B
004E90AB   83FF10                 cmp     edi, +$10
004E90AE   0F87A7010000           jnbe    004E925B
004E90B4   0FB6BFC2904E00         movzx   edi, byte ptr [edi+$4E90C2]
004E90BB   FF24BDD3904E00         jmp     dword ptr [$4E90D3+edi*4]
004E90C2   0001                   add     [ecx], al
004E90C4   0101                   add     [ecx], eax
004E90C6   0102                   add     [edx], eax
004E90C8   030401                 add     eax, [ecx+eax]
004E90CB   0404                   add     al, +$04
004E90CD   0404                   add     al, +$04
004E90CF   0403                   add     al, +$03
004E90D1   05065B924E             add     eax, +$4E925B06
004E90D6   00EF                   add     bh, ch
004E90D8   90                     nop
004E90D9   4E                     dec     esi
004E90DA   00FE                   add     dh, bh
004E90DC   90                     nop
004E90DD   4E                     dec     esi
004E90DE   000E                   add     [esi], cl
004E90E0   91                     xchg    eax, ecx
004E90E1   4E                     dec     esi
004E90E2   006591                 add     [ebp-$6F], ah
004E90E5   4E                     dec     esi
004E90E6   00BB914E000C           add     [ebx+$C004E91], bh
004E90EC   92                     xchg    eax, edx
004E90ED   4E                     dec     esi
004E90EE   008B0689068B           add     [ebx+$8B068906], cl
004E90F4   46                     inc     esi
004E90F5   0489                   add     al, -$77
004E90F7   46                     inc     esi
004E90F8   04E9                   add     al, -$17
004E90FA   5D                     pop     ebp
004E90FB   0100                   add     [eax], eax
004E90FD   00DD                   add     ch, bl
004E90FF   06                     push    es
004E9100   D83514954E00           fdiv    dword ptr [$004E9514]
004E9106   DD1E                   fstp    qword ptr [esi]
004E9108   9B                     wait
004E9109   E94D010000             jmp     004E925B
004E910E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9110   E8AF9AF1FF             call    00402BC4
004E9115   81E008000000           and     eax, $00000008
004E911B   33D2                   xor     edx, edx
004E911D   0FACD003               shrd    eax, edx, $03
004E9121   C1EA03                 shr     edx, $03
004E9124   83FA00                 cmp     edx, +$00
004E9127   7515                   jnz     004E913E
004E9129   83F801                 cmp     eax, +$01
004E912C   7510                   jnz     004E913E
004E912E   33C0                   xor     eax, eax
004E9130   8906                   mov     [esi], eax
004E9132   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E9139   E91D010000             jmp     004E925B
004E913E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9140   E87F9AF1FF             call    00402BC4
004E9145   81E004000000           and     eax, $00000004
004E914B   33D2                   xor     edx, edx
004E914D   0FACD002               shrd    eax, edx, $02
004E9151   C1EA02                 shr     edx, $02
004E9154   8945E8                 mov     [ebp-$18], eax
004E9157   8955EC                 mov     [ebp-$14], edx
004E915A   DF6DE8                 fild    qword ptr [ebp-$18]
004E915D   DD1E                   fstp    qword ptr [esi]
004E915F   9B                     wait
004E9160   E9F6000000             jmp     004E925B
004E9165   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9167   E8589AF1FF             call    00402BC4
004E916C   81E002000000           and     eax, $00000002
004E9172   33D2                   xor     edx, edx
004E9174   0FACD001               shrd    eax, edx, $01
004E9178   D1EA                   shr     edx, 1
004E917A   83FA00                 cmp     edx, +$00
004E917D   7515                   jnz     004E9194
004E917F   83F801                 cmp     eax, +$01
004E9182   7510                   jnz     004E9194
004E9184   33C0                   xor     eax, eax
004E9186   8906                   mov     [esi], eax
004E9188   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E918F   E9C7000000             jmp     004E925B
004E9194   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9196   E8299AF1FF             call    00402BC4
004E919B   81E001000000           and     eax, $00000001
004E91A1   33D2                   xor     edx, edx
004E91A3   0FACD000               shrd    eax, edx, $00
004E91A7   C1EA00                 shr     edx, $00
004E91AA   8945E8                 mov     [ebp-$18], eax
004E91AD   8955EC                 mov     [ebp-$14], edx
004E91B0   DF6DE8                 fild    qword ptr [ebp-$18]
004E91B3   DD1E                   fstp    qword ptr [esi]
004E91B5   9B                     wait
004E91B6   E9A0000000             jmp     004E925B
004E91BB   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E91BD   E8029AF1FF             call    00402BC4
004E91C2   81E020000000           and     eax, $00000020
004E91C8   33D2                   xor     edx, edx
004E91CA   0FACD005               shrd    eax, edx, $05
004E91CE   C1EA05                 shr     edx, $05
004E91D1   83FA00                 cmp     edx, +$00
004E91D4   7512                   jnz     004E91E8
004E91D6   83F801                 cmp     eax, +$01
004E91D9   750D                   jnz     004E91E8
004E91DB   33C0                   xor     eax, eax
004E91DD   8906                   mov     [esi], eax
004E91DF   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E91E6   EB73                   jmp     004E925B
004E91E8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E91EA   E8D599F1FF             call    00402BC4
004E91EF   81E010000000           and     eax, $00000010
004E91F5   33D2                   xor     edx, edx
004E91F7   0FACD004               shrd    eax, edx, $04
004E91FB   C1EA04                 shr     edx, $04
004E91FE   8945E8                 mov     [ebp-$18], eax
004E9201   8955EC                 mov     [ebp-$14], edx
004E9204   DF6DE8                 fild    qword ptr [ebp-$18]
004E9207   DD1E                   fstp    qword ptr [esi]
004E9209   9B                     wait
004E920A   EB4F                   jmp     004E925B
004E920C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E920E   E8B199F1FF             call    00402BC4
004E9213   81E080000000           and     eax, $00000080
004E9219   33D2                   xor     edx, edx
004E921B   0FACD007               shrd    eax, edx, $07
004E921F   C1EA07                 shr     edx, $07
004E9222   83FA00                 cmp     edx, +$00
004E9225   7512                   jnz     004E9239
004E9227   83F801                 cmp     eax, +$01
004E922A   750D                   jnz     004E9239
004E922C   33C0                   xor     eax, eax
004E922E   8906                   mov     [esi], eax
004E9230   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E9237   EB22                   jmp     004E925B
004E9239   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E923B   E88499F1FF             call    00402BC4
004E9240   81E040000000           and     eax, $00000040
004E9246   33D2                   xor     edx, edx
004E9248   0FACD006               shrd    eax, edx, $06
004E924C   C1EA06                 shr     edx, $06
004E924F   8945E8                 mov     [ebp-$18], eax
004E9252   8955EC                 mov     [ebp-$14], edx
004E9255   DF6DE8                 fild    qword ptr [ebp-$18]
004E9258   DD1E                   fstp    qword ptr [esi]
004E925A   9B                     wait
004E925B   8B4508                 mov     eax, [ebp+$08]
004E925E   8B38                   mov     edi, [eax]
004E9260   8D3CFF                 lea     edi, [edi+edi*8]
004E9263   833CBDA0224F0000       cmp     dword ptr [$4F22A0+edi*4], +$00
004E926B   0F8581000000           jnz     004E92F2
004E9271   8B450C                 mov     eax, [ebp+$0C]
004E9274   8B5508                 mov     edx, [ebp+$08]
004E9277   8B14BDB4224F00         mov     edx, [$4F22B4+edi*4]

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E927E   E8FDB7F1FF             call    00404A80
004E9283   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9285   E83A99F1FF             call    00402BC4
004E928A   8BD8                   mov     ebx, eax
004E928C   85DB                   test    ebx, ebx
004E928E   7E28                   jle     004E92B8
004E9290   8B450C                 mov     eax, [ebp+$0C]
004E9293   50                     push    eax
004E9294   8B550C                 mov     edx, [ebp+$0C]
004E9297   8B12                   mov     edx, [edx]
004E9299   B820954E00             mov     eax, $004E9520

* Reference to: System.@LStrPos;
|
004E929E   E88DBDF1FF             call    00405030
004E92A3   8BD0                   mov     edx, eax
004E92A5   42                     inc     edx
004E92A6   8B450C                 mov     eax, [ebp+$0C]
004E92A9   8B00                   mov     eax, [eax]
004E92AB   B964000000             mov     ecx, $00000064

* Reference to: System.@LStrCopy;
|
004E92B0   E897BCF1FF             call    00404F4C
004E92B5   4B                     dec     ebx
004E92B6   75D8                   jnz     004E9290
004E92B8   8B550C                 mov     edx, [ebp+$0C]
004E92BB   8B12                   mov     edx, [edx]
004E92BD   B820954E00             mov     eax, $004E9520

* Reference to: System.@LStrPos;
|
004E92C2   E869BDF1FF             call    00405030
004E92C7   85C0                   test    eax, eax
004E92C9   7E7A                   jle     004E9345
004E92CB   8B450C                 mov     eax, [ebp+$0C]
004E92CE   50                     push    eax
004E92CF   8B550C                 mov     edx, [ebp+$0C]
004E92D2   8B12                   mov     edx, [edx]
004E92D4   B820954E00             mov     eax, $004E9520

* Reference to: System.@LStrPos;
|
004E92D9   E852BDF1FF             call    00405030
004E92DE   8BC8                   mov     ecx, eax
004E92E0   49                     dec     ecx
004E92E1   8B450C                 mov     eax, [ebp+$0C]
004E92E4   8B00                   mov     eax, [eax]
004E92E6   BA01000000             mov     edx, $00000001

* Reference to: System.@LStrCopy;
|
004E92EB   E85CBCF1FF             call    00404F4C
004E92F0   EB53                   jmp     004E9345
004E92F2   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E92F9   751C                   jnz     004E9317
004E92FB   DD06                   fld     qword ptr [esi]
004E92FD   D81D00954E00           fcomp   dword ptr [$004E9500]
004E9303   DFE0                   fstsw   ax
004E9305   9E                     sahf
004E9306   750F                   jnz     004E9317
004E9308   8B450C                 mov     eax, [ebp+$0C]
004E930B   BA2C954E00             mov     edx, $004E952C

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E9310   E86BB7F1FF             call    00404A80
004E9315   EB2E                   jmp     004E9345
004E9317   DD06                   fld     qword ptr [esi]
004E9319   83C4F4                 add     esp, -$0C
004E931C   DB3C24                 fstp    tbyte ptr [esp]
004E931F   9B                     wait
004E9320   8D45E0                 lea     eax, [ebp-$20]
004E9323   50                     push    eax
004E9324   8D04DB                 lea     eax, [ebx+ebx*8]
004E9327   8B0C85B0224F00         mov     ecx, [$4F22B0+eax*4]
004E932E   BA14000000             mov     edx, $00000014
004E9333   B002                   mov     al, $02

* Reference to: SysUtils.FloatToStrF(Extended;TFloatFormat;Integer;Integer):AnsiString;overload;
|
004E9335   E84A16F2FF             call    0040A984
004E933A   8B55E0                 mov     edx, [ebp-$20]
004E933D   8B450C                 mov     eax, [ebp+$0C]

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E9340   E83BB7F1FF             call    00404A80
004E9345   33C0                   xor     eax, eax
004E9347   5A                     pop     edx
004E9348   59                     pop     ecx
004E9349   59                     pop     ecx
004E934A   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E934D   6872934E00             push    $004E9372
004E9352   8D45E0                 lea     eax, [ebp-$20]

* Reference to: System.@LStrClr(void;void);
|
004E9355   E8D2B6F1FF             call    00404A2C
004E935A   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E935D   E8CAB6F1FF             call    00404A2C
004E9362   8D45F0                 lea     eax, [ebp-$10]

* Reference to: System.@LStrClr(void;void);
|
004E9365   E8C2B6F1FF             call    00404A2C
004E936A   C3                     ret


* Reference to: System.@HandleFinally;
|
004E936B   E93CB0F1FF             jmp     004043AC
004E9370   EBE0                   jmp     004E9352

****** END
|
004E9372   5F                     pop     edi
004E9373   5E                     pop     esi
004E9374   5B                     pop     ebx
004E9375   8BE5                   mov     esp, ebp
004E9377   5D                     pop     ebp
004E9378   C20C00                 ret     $000C

*)
end;

procedure TForm1.MenuItem_LoadClick(Sender : TObject);
begin
(*
004E96EC   55                     push    ebp
004E96ED   8BEC                   mov     ebp, esp
004E96EF   83C4E0                 add     esp, -$20
004E96F2   53                     push    ebx
004E96F3   56                     push    esi
004E96F4   57                     push    edi
004E96F5   33C9                   xor     ecx, ecx
004E96F7   894DE4                 mov     [ebp-$1C], ecx
004E96FA   894DE0                 mov     [ebp-$20], ecx
004E96FD   894DE8                 mov     [ebp-$18], ecx
004E9700   894DEC                 mov     [ebp-$14], ecx
004E9703   8BD8                   mov     ebx, eax
004E9705   33C0                   xor     eax, eax
004E9707   55                     push    ebp

* Possible String Reference to: 'ÈÙ§ÒˇÎ€_^[ãÂ]√'
|
004E9708   68B39E4E00             push    $004E9EB3

***** TRY
|
004E970D   64FF30                 push    dword ptr fs:[eax]
004E9710   648920                 mov     fs:[eax], esp
004E9713   C60534724F0000         mov     byte ptr [$004F7234], $00

* Reference to TGrafForm instance
|
004E971A   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004E971F   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.DriveIM : TMenuItem
|
004E9721   8B80EC030000           mov     eax, [eax+$03EC]
004E9727   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E9729   E87695F8FF             call    00472CA4
004E972E   803D27724F0001         cmp     byte ptr [$004F7227], $01
004E9735   7509                   jnz     004E9740
004E9737   C60527724F0000         mov     byte ptr [$004F7227], $00
004E973E   EB2E                   jmp     004E976E

* Reference to control TForm1.OpenDialog : TOpenDialog
|
004E9740   8B833C030000           mov     eax, [ebx+$033C]
004E9746   8B10                   mov     edx, [eax]

* Reference to method TOpenDialog.Execute()
|
004E9748   FF523C                 call    dword ptr [edx+$3C]
004E974B   84C0                   test    al, al
004E974D   0F8435070000           jz      004E9E88
004E9753   8D55E8                 lea     edx, [ebp-$18]

* Reference to control TForm1.OpenDialog : TOpenDialog
|
004E9756   8B833C030000           mov     eax, [ebx+$033C]

* Reference to: Dialogs.TOpenDialog.GetFileName(TOpenDialog):TFileName;
|
004E975C   E8838AF4FF             call    004321E4
004E9761   8B55E8                 mov     edx, [ebp-$18]
004E9764   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E9769   E85E97F1FF             call    00402ECC
004E976E   BA01000000             mov     edx, $00000001
004E9773   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004E9778   E8939CF1FF             call    00403410

|
004E977D   E83291F1FF             call    004028B4
004E9782   68CC6D4F00             push    $004F6DCC
004E9787   BAF86D4F00             mov     edx, $004F6DF8
004E978C   B901000000             mov     ecx, $00000001
004E9791   B8006F4F00             mov     eax, $004F6F00

|
004E9796   E89598F1FF             call    00403030

|
004E979B   E81491F1FF             call    004028B4
004E97A0   A0F86D4F00             mov     al, byte ptr [$004F6DF8]

* Reference to GlobalVar_004F6DA7
|
004E97A5   A2A76D4F00             mov     byte ptr [$004F6DA7], al
004E97AA   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E97B1   750C                   jnz     004E97BF
004E97B3   C705D86D4F0080000000   mov     dword ptr [$004F6DD8], $00000080
004E97BD   EB0A                   jmp     004E97C9
004E97BF   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E97C9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E97CE   E8AD9AF1FF             call    00403280

|
004E97D3   E8DC90F1FF             call    004028B4
004E97D8   3D80000000             cmp     eax, $00000080
004E97DD   7C1F                   jl      004E97FE
004E97DF   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E97E4   E8979AF1FF             call    00403280

|
004E97E9   E8C690F1FF             call    004028B4
004E97EE   253F000080             and     eax, $8000003F
004E97F3   7905                   jns     004E97FA
004E97F5   48                     dec     eax
004E97F6   83C8C0                 or      eax, -$40
004E97F9   40                     inc     eax
004E97FA   85C0                   test    eax, eax
004E97FC   742A                   jz      004E9828
004E97FE   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004E9803   E86898F1FF             call    00403070

|
004E9808   E8A790F1FF             call    004028B4
004E980D   6810100000             push    $00001010
004E9812   68785B5400             push    $00545B78
004E9817   68645E5400             push    $00545E64
004E981C   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E981E   E845E0F1FF             call    00407868
004E9823   E960060000             jmp     004E9E88
004E9828   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E982D   E84E9AF1FF             call    00403280

|
004E9832   E87D90F1FF             call    004028B4
004E9837   3D00010000             cmp     eax, $00000100
004E983C   0F8EDA000000           jle     004E991C
004E9842   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9847   E8349AF1FF             call    00403280

|
004E984C   E86390F1FF             call    004028B4
004E9851   8BD0                   mov     edx, eax
004E9853   2B15D86D4F00           sub     edx, dword ptr [$004F6DD8]
004E9859   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E985E   E8D59BF1FF             call    00403438

|
004E9863   E84C90F1FF             call    004028B4
004E9868   68CC6D4F00             push    $004F6DCC
004E986D   BAF86D4F00             mov     edx, $004F6DF8
004E9872   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9878   B8006F4F00             mov     eax, $004F6F00

|
004E987D   E8AE97F1FF             call    00403030

|
004E9882   E82D90F1FF             call    004028B4
004E9887   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E988C   2C11                   sub     al, $11
004E988E   7404                   jz      004E9894
004E9890   2C02                   sub     al, $02
004E9892   7509                   jnz     004E989D
004E9894   803D026E4F0002         cmp     byte ptr [$004F6E02], $02
004E989B   7436                   jz      004E98D3
004E989D   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004E98A4   7509                   jnz     004E98AF
004E98A6   803D026E4F00F0         cmp     byte ptr [$004F6E02], $F0
004E98AD   7424                   jz      004E98D3
004E98AF   803DA76D4F0043         cmp     byte ptr [$004F6DA7], $43
004E98B6   7509                   jnz     004E98C1
004E98B8   803D026E4F0001         cmp     byte ptr [$004F6E02], $01
004E98BF   7412                   jz      004E98D3
004E98C1   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E98C8   753E                   jnz     004E9908
004E98CA   803D036E4F0001         cmp     byte ptr [$004F6E03], $01
004E98D1   7535                   jnz     004E9908
004E98D3   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E98D8   E8A399F1FF             call    00403280

|
004E98DD   E8D28FF1FF             call    004028B4
004E98E2   8BD0                   mov     edx, eax
004E98E4   2B15D86D4F00           sub     edx, dword ptr [$004F6DD8]
004E98EA   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E98EF   E8449BF1FF             call    00403438

|
004E98F4   E8BB8FF1FF             call    004028B4
004E98F9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Truncate(TFileRec;TFileRec);
|
004E98FE   E8699BF1FF             call    0040346C

|
004E9903   E8AC8FF1FF             call    004028B4
004E9908   BA01000000             mov     edx, $00000001
004E990D   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004E9912   E8F99AF1FF             call    00403410

|
004E9917   E8988FF1FF             call    004028B4
004E991C   68CC6D4F00             push    $004F6DCC
004E9921   BAF86D4F00             mov     edx, $004F6DF8
004E9926   B980000000             mov     ecx, $00000080
004E992B   B8006F4F00             mov     eax, $004F6F00

|
004E9930   E8FB96F1FF             call    00403030

|
004E9935   E87A8FF1FF             call    004028B4
004E993A   A03B6E4F00             mov     al, byte ptr [$004F6E3B]
004E993F   2C13                   sub     al, $13
004E9941   7418                   jz      004E995B
004E9943   04FB                   add     al, -$05
004E9945   2C02                   sub     al, $02
004E9947   7212                   jb      004E995B
004E9949   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E9950   7518                   jnz     004E996A
004E9952   803D3C6E4F0018         cmp     byte ptr [$004F6E3C], $18
004E9959   750F                   jnz     004E996A
004E995B   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E995D   8B8340030000           mov     eax, [ebx+$0340]
004E9963   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9965   FF5164                 call    dword ptr [ecx+$64]
004E9968   EB0D                   jmp     004E9977
004E996A   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E996C   8B8340030000           mov     eax, [ebx+$0340]
004E9972   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9974   FF5164                 call    dword ptr [ecx+$64]
004E9977   33FF                   xor     edi, edi
004E9979   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DC8
|
004E997B   A3C86D4F00             mov     dword ptr [$004F6DC8], eax
004E9980   33C0                   xor     eax, eax
004E9982   8905E46D4F00           mov     [$004F6DE4], eax
004E9988   8905E86D4F00           mov     [$004F6DE8], eax
004E998E   33C0                   xor     eax, eax
004E9990   8905DC6D4F00           mov     [$004F6DDC], eax
004E9996   8905E06D4F00           mov     [$004F6DE0], eax

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E999C   8B8334030000           mov     eax, [ebx+$0334]
004E99A2   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004E99A6   E869A4F1FF             call    00403E14
004E99AB   803D386E4F00FF         cmp     byte ptr [$004F6E38], $FF
004E99B2   7507                   jnz     004E99BB
004E99B4   C60534724F0001         mov     byte ptr [$004F7234], $01
004E99BB   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E99C0   E8BB98F1FF             call    00403280

|
004E99C5   E8EA8EF1FF             call    004028B4
004E99CA   3D80000000             cmp     eax, $00000080
004E99CF   0F8EE8030000           jle     004E9DBD
004E99D5   8BD7                   mov     edx, edi
004E99D7   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E99DC   E8579AF1FF             call    00403438

|
004E99E1   E8CE8EF1FF             call    004028B4
004E99E6   68CC6D4F00             push    $004F6DCC
004E99EB   BAF86D4F00             mov     edx, $004F6DF8
004E99F0   B940000000             mov     ecx, $00000040
004E99F5   B8006F4F00             mov     eax, $004F6F00

|
004E99FA   E83196F1FF             call    00403030

|
004E99FF   E8B08EF1FF             call    004028B4
004E9A04   8BC3                   mov     eax, ebx

* Reference to : TForm1.VichMaxNomParam()
|
004E9A06   E8559BFFFF             call    004E3560
004E9A0B   8D4DE0                 lea     ecx, [ebp-$20]
004E9A0E   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004E9A14   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004E9A16   E8B195FFFF             call    004E2FCC
004E9A1B   8B4DE0                 mov     ecx, [ebp-$20]
004E9A1E   8D45E4                 lea     eax, [ebp-$1C]
004E9A21   BA94585400             mov     edx, $00545894

* Reference to: System.@LStrCat3;
|
004E9A26   E80DB3F1FF             call    00404D38
004E9A2B   8B45E4                 mov     eax, [ebp-$1C]
004E9A2E   50                     push    eax

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E9A2F   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E9A35   8B8008020000           mov     eax, [eax+$0208]
004E9A3B   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E9A40   E85361F5FF             call    0043FB98
004E9A45   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E9A46   E8A960F5FF             call    0043FAF4
004E9A4B   EB21                   jmp     004E9A6E
004E9A4D   68CC6D4F00             push    $004F6DCC
004E9A52   BAF86D4F00             mov     edx, $004F6DF8
004E9A57   B940000000             mov     ecx, $00000040
004E9A5C   B8006F4F00             mov     eax, $004F6F00

|
004E9A61   E8CA95F1FF             call    00403030

|
004E9A66   E8498EF1FF             call    004028B4
004E9A6B   83C740                 add     edi, +$40
004E9A6E   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9A73   2C11                   sub     al, $11
004E9A75   7404                   jz      004E9A7B
004E9A77   2C02                   sub     al, $02
004E9A79   751B                   jnz     004E9A96
004E9A7B   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9A82   7512                   jnz     004E9A96
004E9A84   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9A8B   75C0                   jnz     004E9A4D
004E9A8D   803D026E4F0002         cmp     byte ptr [$004F6E02], $02
004E9A94   75B7                   jnz     004E9A4D
004E9A96   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9A9B   2C12                   sub     al, $12
004E9A9D   7404                   jz      004E9AA3
004E9A9F   2C10                   sub     al, $10
004E9AA1   7512                   jnz     004E9AB5
004E9AA3   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9AAA   75A1                   jnz     004E9A4D
004E9AAC   803D026E4F00F0         cmp     byte ptr [$004F6E02], $F0
004E9AB3   7598                   jnz     004E9A4D
004E9AB5   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9ABA   2C21                   sub     al, $21
004E9ABC   7408                   jz      004E9AC6
004E9ABE   2C20                   sub     al, $20
004E9AC0   7404                   jz      004E9AC6
004E9AC2   2C02                   sub     al, $02
004E9AC4   751A                   jnz     004E9AE0
004E9AC6   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9ACD   0F857AFFFFFF           jnz     004E9A4D
004E9AD3   803D026E4F0001         cmp     byte ptr [$004F6E02], $01
004E9ADA   0F856DFFFFFF           jnz     004E9A4D
004E9AE0   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E9AE7   751A                   jnz     004E9B03
004E9AE9   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9AF0   0F8557FFFFFF           jnz     004E9A4D
004E9AF6   803D046E4F0001         cmp     byte ptr [$004F6E04], $01
004E9AFD   0F854AFFFFFF           jnz     004E9A4D
004E9B03   803DA76D4F0044         cmp     byte ptr [$004F6DA7], $44
004E9B0A   751A                   jnz     004E9B26
004E9B0C   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9B13   0F8534FFFFFF           jnz     004E9A4D
004E9B19   803D026E4F0020         cmp     byte ptr [$004F6E02], $20
004E9B20   0F8527FFFFFF           jnz     004E9A4D
004E9B26   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004E9B2D   750D                   jnz     004E9B3C
004E9B2F   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9B36   0F8511FFFFFF           jnz     004E9A4D
004E9B3C   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E9B43   750D                   jnz     004E9B52
004E9B45   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9B4C   0F85FBFEFFFF           jnz     004E9A4D
004E9B52   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9B59   750D                   jnz     004E9B68
004E9B5B   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9B62   0F85E5FEFFFF           jnz     004E9A4D
004E9B68   8BD7                   mov     edx, edi
004E9B6A   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E9B6F   E8C498F1FF             call    00403438

|
004E9B74   E83B8DF1FF             call    004028B4
004E9B79   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9B7E   04EF                   add     al, -$11
004E9B80   2C04                   sub     al, $04
004E9B82   7204                   jb      004E9B88
004E9B84   2C2E                   sub     al, $2E
004E9B86   7545                   jnz     004E9BCD
004E9B88   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9B8F   753C                   jnz     004E9BCD
004E9B91   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9B96   E8E596F1FF             call    00403280

|
004E9B9B   E8148DF1FF             call    004028B4
004E9BA0   2BC7                   sub     eax, edi
004E9BA2   8B15D86D4F00           mov     edx, [$004F6DD8]
004E9BA8   03D2                   add     edx, edx
004E9BAA   8BCA                   mov     ecx, edx
004E9BAC   99                     cdq
004E9BAD   F7F9                   idiv    ecx 
004E9BAF   50                     push    eax
004E9BB0   B8F86E4F00             mov     eax, $004F6EF8
004E9BB5   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E9BBA   8B15DCFA4D00           mov     edx, [$004DFADC]

* Reference to: System.@DynArraySetLength;
|
004E9BC0   E86FC1F1FF             call    00405D34
004E9BC5   83C404                 add     esp, +$04
004E9BC8   E9CC010000             jmp     004E9D99
004E9BCD   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9BD2   E8A996F1FF             call    00403280

|
004E9BD7   E8D88CF1FF             call    004028B4
004E9BDC   2BC7                   sub     eax, edi
004E9BDE   85C0                   test    eax, eax
004E9BE0   7903                   jns     004E9BE5
004E9BE2   83C03F                 add     eax, +$3F
004E9BE5   C1F806                 sar     eax, $06
004E9BE8   50                     push    eax
004E9BE9   B8F86E4F00             mov     eax, $004F6EF8
004E9BEE   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E9BF3   8B15DCFA4D00           mov     edx, [$004DFADC]

* Reference to: System.@DynArraySetLength;
|
004E9BF9   E836C1F1FF             call    00405D34
004E9BFE   83C404                 add     esp, +$04
004E9C01   E993010000             jmp     004E9D99
004E9C06   68CC6D4F00             push    $004F6DCC
004E9C0B   BAF86D4F00             mov     edx, $004F6DF8
004E9C10   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9C16   B8006F4F00             mov     eax, $004F6F00

|
004E9C1B   E81094F1FF             call    00403030

|
004E9C20   E88F8CF1FF             call    004028B4
004E9C25   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9C2A   0FB680F76D4F00         movzx   eax, byte ptr [eax+$4F6DF7]
004E9C31   03C0                   add     eax, eax
004E9C33   8D0480                 lea     eax, [eax+eax*4]
004E9C36   50                     push    eax
004E9C37   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9C3C   33C9                   xor     ecx, ecx
004E9C3E   8A88F66D4F00           mov     cl, byte ptr [eax+$4F6DF6]
004E9C44   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9C49   33D2                   xor     edx, edx
004E9C4B   8A90F56D4F00           mov     dl, byte ptr [eax+$4F6DF5]
004E9C51   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9C56   0FB680F46D4F00         movzx   eax, byte ptr [eax+$4F6DF4]

* Reference to: SysUtils.EncodeTime(Word;Word;Word;Word):TDateTime;
|
004E9C5D   E8320FF2FF             call    0040AB94
004E9C62   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9C69   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9C6F   DD1CC2                 fstp    qword ptr [edx+eax*8]
004E9C72   9B                     wait
004E9C73   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9C7A   7416                   jz      004E9C92
004E9C7C   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9C83   755F                   jnz     004E9CE4
004E9C85   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9C8A   2C12                   sub     al, $12
004E9C8C   7404                   jz      004E9C92
004E9C8E   2C02                   sub     al, $02
004E9C90   7552                   jnz     004E9CE4
004E9C92   8B3DD06D4F00           mov     edi, [$004F6DD0]
004E9C98   85FF                   test    edi, edi
004E9C9A   7E48                   jle     004E9CE4
004E9C9C   BE01000000             mov     esi, $00000001
004E9CA1   8D45F0                 lea     eax, [ebp-$10]
004E9CA4   50                     push    eax
004E9CA5   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004E9CA8   E87FADF1FF             call    00404A2C
004E9CAD   50                     push    eax
004E9CAE   8D45FC                 lea     eax, [ebp-$04]
004E9CB1   50                     push    eax
004E9CB2   33C9                   xor     ecx, ecx
004E9CB4   8BD6                   mov     edx, esi
004E9CB6   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E9CB8   E8F7CCFFFF             call    004E69B4
004E9CBD   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E9CC1   7E1D                   jle     004E9CE0
004E9CC3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9CCA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9CD0   8D04C2                 lea     eax, [edx+eax*8]
004E9CD3   8B55F0                 mov     edx, [ebp-$10]
004E9CD6   8914F0                 mov     [eax+esi*8], edx
004E9CD9   8B55F4                 mov     edx, [ebp-$0C]
004E9CDC   8954F004               mov     [eax+esi*8+$04], edx
004E9CE0   46                     inc     esi
004E9CE1   4F                     dec     edi
004E9CE2   75BD                   jnz     004E9CA1
004E9CE4   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9CE9   04EF                   add     al, -$11
004E9CEB   2C04                   sub     al, $04
004E9CED   7204                   jb      004E9CF3
004E9CEF   2C2E                   sub     al, $2E
004E9CF1   7509                   jnz     004E9CFC
004E9CF3   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9CFA   741A                   jz      004E9D16
004E9CFC   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9D03   0F858A000000           jnz     004E9D93
004E9D09   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9D0E   2C11                   sub     al, $11
004E9D10   7404                   jz      004E9D16
004E9D12   2C02                   sub     al, $02
004E9D14   757D                   jnz     004E9D93
004E9D16   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9D1D   751F                   jnz     004E9D3E
004E9D1F   68CC6D4F00             push    $004F6DCC
004E9D24   BAF86D4F00             mov     edx, $004F6DF8
004E9D29   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9D2F   B8006F4F00             mov     eax, $004F6F00

|
004E9D34   E8F792F1FF             call    00403030

|
004E9D39   E8768BF1FF             call    004028B4
004E9D3E   8B35D06D4F00           mov     esi, [$004F6DD0]
004E9D44   46                     inc     esi
004E9D45   8B3DD46D4F00           mov     edi, [$004F6DD4]
004E9D4B   2BFE                   sub     edi, esi
004E9D4D   7C44                   jl      004E9D93
004E9D4F   47                     inc     edi
004E9D50   8D45F0                 lea     eax, [ebp-$10]
004E9D53   50                     push    eax
004E9D54   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004E9D57   E8D0ACF1FF             call    00404A2C
004E9D5C   50                     push    eax
004E9D5D   8D45FC                 lea     eax, [ebp-$04]
004E9D60   50                     push    eax
004E9D61   33C9                   xor     ecx, ecx
004E9D63   8BD6                   mov     edx, esi
004E9D65   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E9D67   E848CCFFFF             call    004E69B4
004E9D6C   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E9D70   7E1D                   jle     004E9D8F
004E9D72   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9D79   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9D7F   8D04C2                 lea     eax, [edx+eax*8]
004E9D82   8B55F0                 mov     edx, [ebp-$10]
004E9D85   8914F0                 mov     [eax+esi*8], edx
004E9D88   8B55F4                 mov     edx, [ebp-$0C]
004E9D8B   8954F004               mov     [eax+esi*8+$04], edx
004E9D8F   46                     inc     esi
004E9D90   4F                     dec     edi
004E9D91   75BD                   jnz     004E9D50
004E9D93   FF05C86D4F00           inc     dword ptr [$004F6DC8]
004E9D99   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@EofFile(TFileRec;TFileRec):Boolean;
|
004E9D9E   E87194F1FF             call    00403214

|
004E9DA3   E80C8BF1FF             call    004028B4
004E9DA8   84C0                   test    al, al
004E9DAA   0F8456FEFFFF           jz      004E9C06
004E9DB0   B201                   mov     dl, $01

* Reference to control TForm1.Button_Graf : TButton
|
004E9DB2   8B8348030000           mov     eax, [ebx+$0348]
004E9DB8   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9DBA   FF5164                 call    dword ptr [ecx+$64]
004E9DBD   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004E9DC2   E8A992F1FF             call    00403070

|
004E9DC7   E8E88AF1FF             call    004028B4
004E9DCC   33C9                   xor     ecx, ecx
004E9DCE   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E9DD0   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E9DD3   E83051F7FF             call    0045EF08
004E9DD8   33C9                   xor     ecx, ecx
004E9DDA   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E9DDF   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E9DE2   E82151F7FF             call    0045EF08
004E9DE7   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Dvig : TLabel
|
004E9DE9   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9DEF   E89063F7FF             call    00460184
004E9DF4   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AKPP : TLabel
|
004E9DF6   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9DFC   E88363F7FF             call    00460184
004E9E01   33D2                   xor     edx, edx

* Reference to control TForm1.Label_ABS : TLabel
|
004E9E03   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9E09   E87663F7FF             call    00460184
004E9E0E   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004E9E10   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9E16   E86963F7FF             call    00460184
004E9E1B   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Load : TLabel
|
004E9E1D   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9E23   E85C63F7FF             call    00460184
004E9E28   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E9E2A   8B8328030000           mov     eax, [ebx+$0328]
004E9E30   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9E32   FF5164                 call    dword ptr [ecx+$64]
004E9E35   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E9E37   8B8334030000           mov     eax, [ebx+$0334]
004E9E3D   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9E3F   FF5164                 call    dword ptr [ecx+$64]
004E9E42   C60519724F0001         mov     byte ptr [$004F7219], $01
004E9E49   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E9E50   7529                   jnz     004E9E7B
004E9E52   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E9E54   8B8340030000           mov     eax, [ebx+$0340]
004E9E5A   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9E5C   FF5164                 call    dword ptr [ecx+$64]
004E9E5F   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E9E61   8B8348030000           mov     eax, [ebx+$0348]
004E9E67   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9E69   FF5164                 call    dword ptr [ecx+$64]
004E9E6C   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E9E6E   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E9E74   E80F8DF8FF             call    00472B88
004E9E79   EB0D                   jmp     004E9E88
004E9E7B   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E9E7D   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E9E83   E8008DF8FF             call    00472B88
004E9E88   33C0                   xor     eax, eax
004E9E8A   5A                     pop     edx
004E9E8B   59                     pop     ecx
004E9E8C   59                     pop     ecx
004E9E8D   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[ãÂ]√'
|
004E9E90   68BA9E4E00             push    $004E9EBA
004E9E95   8D45E0                 lea     eax, [ebp-$20]
004E9E98   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E9E9D   E8AEABF1FF             call    00404A50
004E9EA2   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004E9EA5   E882ABF1FF             call    00404A2C
004E9EAA   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004E9EAD   E87AABF1FF             call    00404A2C
004E9EB2   C3                     ret


* Reference to: System.@HandleFinally;
|
004E9EB3   E9F4A4F1FF             jmp     004043AC
004E9EB8   EBDB                   jmp     004E9E95

****** END
|
004E9EBA   5F                     pop     edi
004E9EBB   5E                     pop     esi
004E9EBC   5B                     pop     ebx
004E9EBD   8BE5                   mov     esp, ebp
004E9EBF   5D                     pop     ebp
004E9EC0   C3                     ret

*)
end;

procedure TForm1.MenuItem_ExitClick(Sender : TObject);
begin
(*

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004EC3B4   E8970EF9FF             call    0047D250
004EC3B9   C3                     ret

*)
end;

procedure TForm1.MenuItem_TestClick(Sender : TObject);
begin
(*
004EBB24   55                     push    ebp
004EBB25   8BEC                   mov     ebp, esp
004EBB27   83C4E8                 add     esp, -$18
004EBB2A   53                     push    ebx
004EBB2B   33C9                   xor     ecx, ecx
004EBB2D   894DE8                 mov     [ebp-$18], ecx
004EBB30   8BD8                   mov     ebx, eax
004EBB32   33C0                   xor     eax, eax
004EBB34   55                     push    ebp

* Possible String Reference to: 'ÈŒÜÒˇÎ[ãÂ]√'
|
004EBB35   68D9BC4E00             push    $004EBCD9

***** TRY
|
004EBB3A   64FF30                 push    dword ptr fs:[eax]
004EBB3D   648920                 mov     fs:[eax], esp
004EBB40   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EBB42   E80D71FAFF             call    00492C54
004EBB47   8BC3                   mov     eax, ebx

* Reference to : TForm1.PortInit()
|
004EBB49   E8A26CFFFF             call    004E27F0
004EBB4E   84C0                   test    al, al
004EBB50   0F846D010000           jz      004EBCC3
004EBB56   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBB5B   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EBB5C   E8AFB5F1FF             call    00407110
004EBB61   6A19                   push    $19

* Reference to: kernel32.Sleep()
|
004EBB63   E81428F2FF             call    0040E37C
004EBB68   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBB6D   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EBB6E   E84DB3F1FF             call    00406EC0
004EBB73   6A19                   push    $19

* Reference to: kernel32.Sleep()
|
004EBB75   E80228F2FF             call    0040E37C
004EBB7A   6A12                   push    $12
004EBB7C   C645EC11               mov     byte ptr [ebp-$14], $11
004EBB80   C645ED18               mov     byte ptr [ebp-$13], $18
004EBB84   C645EE81               mov     byte ptr [ebp-$12], $81
004EBB88   C645EF22               mov     byte ptr [ebp-$11], $22
004EBB8C   C645F033               mov     byte ptr [ebp-$10], $33
004EBB90   C645F144               mov     byte ptr [ebp-$0F], $44
004EBB94   C645F255               mov     byte ptr [ebp-$0E], $55
004EBB98   C645F366               mov     byte ptr [ebp-$0D], $66
004EBB9C   C645F477               mov     byte ptr [ebp-$0C], $77
004EBBA0   C645F588               mov     byte ptr [ebp-$0B], $88
004EBBA4   C645F699               mov     byte ptr [ebp-$0A], $99
004EBBA8   C645F7AA               mov     byte ptr [ebp-$09], $AA
004EBBAC   C645F8BB               mov     byte ptr [ebp-$08], $BB
004EBBB0   C645F9CC               mov     byte ptr [ebp-$07], $CC
004EBBB4   C645FADD               mov     byte ptr [ebp-$06], $DD
004EBBB8   C645FBEE               mov     byte ptr [ebp-$05], $EE
004EBBBC   C645FCF1               mov     byte ptr [ebp-$04], $F1
004EBBC0   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EBBC5   8845FD                 mov     [ebp-$03], al
004EBBC8   8D55EC                 lea     edx, [ebp-$14]
004EBBCB   B911000000             mov     ecx, $00000011
004EBBD0   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EBBD2   E86972FFFF             call    004E2E40
004EBBD7   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004EBBD9   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EBBDF   E8C097F4FF             call    004353A4
004EBBE4   8D45E8                 lea     eax, [ebp-$18]

* Possible String Reference to: 'temp.tmp'
|
004EBBE7   B9F0BC4E00             mov     ecx, $004EBCF0
004EBBEC   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EBBF2   E84191F1FF             call    00404D38
004EBBF7   8B55E8                 mov     edx, [ebp-$18]
004EBBFA   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004EBBFF   E8C872F1FF             call    00402ECC
004EBC04   BA01000000             mov     edx, $00000001
004EBC09   B8006F4F00             mov     eax, $004F6F00

* Reference to: CommCtrl.TreeView_GetChild(HWND;HTREEITEM):HTREEITEM;
|
004EBC0E   E81978F1FF             call    0040342C

|
004EBC13   E89C6CF1FF             call    004028B4
004EBC18   C6051D724F0001         mov     byte ptr [$004F721D], $01
004EBC1F   68CC6D4F00             push    $004F6DCC
004EBC24   BAF86D4F00             mov     edx, $004F6DF8
004EBC29   B940000000             mov     ecx, $00000040
004EBC2E   B8006F4F00             mov     eax, $004F6F00

|
004EBC33   E81874F1FF             call    00403050

|
004EBC38   E8776CF1FF             call    004028B4
004EBC3D   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EBC42   E82974F1FF             call    00403070

|
004EBC47   E8686CF1FF             call    004028B4
004EBC4C   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBC51   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EBC52   E871B2F1FF             call    00406EC8
004EBC57   C6051D724F0000         mov     byte ptr [$004F721D], $00
004EBC5E   833DA06D4F0000         cmp     dword ptr [$004F6DA0], +$00
004EBC65   750C                   jnz     004EBC73
004EBC67   B87C595400             mov     eax, $0054597C

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBC6C   E89F73F4FF             call    00433010
004EBC71   EB49                   jmp     004EBCBC
004EBC73   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBC78   8A80F76D4F00           mov     al, byte ptr [eax+$4F6DF7]
004EBC7E   3A05A66D4F00           cmp     al, byte ptr [$004F6DA6]
004EBC84   740C                   jz      004EBC92
004EBC86   B8CC595400             mov     eax, $005459CC

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBC8B   E88073F4FF             call    00433010
004EBC90   EB2A                   jmp     004EBCBC
004EBC92   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBC97   3B059C6D4F00           cmp     eax, [$004F6D9C]
004EBC9D   751D                   jnz     004EBCBC
004EBC9F   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBCA4   8A80F76D4F00           mov     al, byte ptr [eax+$4F6DF7]
004EBCAA   3A05A66D4F00           cmp     al, byte ptr [$004F6DA6]
004EBCB0   750A                   jnz     004EBCBC
004EBCB2   B8885A5400             mov     eax, $00545A88

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBCB7   E85473F4FF             call    00433010
004EBCBC   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EBCBE   E8996FFAFF             call    00492C5C
004EBCC3   33C0                   xor     eax, eax
004EBCC5   5A                     pop     edx
004EBCC6   59                     pop     ecx
004EBCC7   59                     pop     ecx
004EBCC8   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[ãÂ]√'
|
004EBCCB   68E0BC4E00             push    $004EBCE0
004EBCD0   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004EBCD3   E8548DF1FF             call    00404A2C
004EBCD8   C3                     ret


* Reference to: System.@HandleFinally;
|
004EBCD9   E9CE86F1FF             jmp     004043AC
004EBCDE   EBF0                   jmp     004EBCD0

****** END
|
004EBCE0   5B                     pop     ebx
004EBCE1   8BE5                   mov     esp, ebp
004EBCE3   5D                     pop     ebp
004EBCE4   C3                     ret

*)
end;

procedure TForm1.MenuItem_SaveToXLSClick(Sender : TObject);
begin
(*
004EC3BC   55                     push    ebp
004EC3BD   8BEC                   mov     ebp, esp
004EC3BF   B91C000000             mov     ecx, $0000001C
004EC3C4   6A00                   push    $00
004EC3C6   6A00                   push    $00
004EC3C8   49                     dec     ecx
004EC3C9   75F9                   jnz     004EC3C4
004EC3CB   51                     push    ecx
004EC3CC   53                     push    ebx
004EC3CD   56                     push    esi
004EC3CE   57                     push    edi
004EC3CF   8945FC                 mov     [ebp-$04], eax
004EC3D2   33C0                   xor     eax, eax
004EC3D4   55                     push    ebp

* Possible String Reference to: 'È|{ÒˇÎ¢_^[ãÂ]√'
|
004EC3D5   682BC84E00             push    $004EC82B

***** TRY
|
004EC3DA   64FF30                 push    dword ptr fs:[eax]
004EC3DD   648920                 mov     fs:[eax], esp
004EC3E0   C6051E724F0000         mov     byte ptr [$004F721E], $00

* Reference to TFormProgress instance
|
004EC3E7   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004EC3EC   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004EC3EE   8B80FC020000           mov     eax, [eax+$02FC]
004EC3F4   33D2                   xor     edx, edx

* Reference to: ComCtrls.TProgressBar.SetPosition(TProgressBar;Integer);
|
004EC3F6   E8799DF5FF             call    00446174

* Reference to TFormProgress instance
|
004EC3FB   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004EC400   8B00                   mov     eax, [eax]
004EC402   B201                   mov     dl, $01

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004EC404   E8DBDAF8FF             call    00479EE4

* Reference to TFormProgress instance
|
004EC409   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004EC40E   8B00                   mov     eax, [eax]

* Reference to: Controls.TControl.Refresh(TControl);
|
004EC410   E88B43F7FF             call    004607A0
004EC415   8D55CC                 lea     edx, [ebp-$34]

* Possible String Reference to: 'Excel.Application'
|
004EC418   B844C84E00             mov     eax, $004EC844

* Reference to: ComObj.CreateOleObject(AnsiString):IDispatch;
|
004EC41D   E8FE3DFDFF             call    004C0220
004EC422   8B55CC                 mov     edx, [ebp-$34]
004EC425   8D45D0                 lea     eax, [ebp-$30]

* Reference to: Variants.@VarFromDisp(TVarData;TVarData;IDispatch);
|
004EC428   E8F386F2FF             call    00414B20
004EC42D   6858C84E00             push    $004EC858
004EC432   6860C84E00             push    $004EC860
004EC437   8D45D0                 lea     eax, [ebp-$30]
004EC43A   50                     push    eax
004EC43B   8D45BC                 lea     eax, [ebp-$44]
004EC43E   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC43F   E8A041F2FF             call    004105E4
004EC444   83C40C                 add     esp, +$0C
004EC447   8D45BC                 lea     eax, [ebp-$44]
004EC44A   50                     push    eax
004EC44B   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC44D   E89241F2FF             call    004105E4
004EC452   83C40C                 add     esp, +$0C
004EC455   8D4DB4                 lea     ecx, [ebp-$4C]
004EC458   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]

* Reference to Form1
|
004EC45E   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.PreobrTipECU()
|
004EC461   E8666BFFFF             call    004E2FCC
004EC466   8B4DB4                 mov     ecx, [ebp-$4C]
004EC469   8D45B8                 lea     eax, [ebp-$48]
004EC46C   BADC5A5400             mov     edx, $00545ADC

* Reference to: System.@LStrCat3;
|
004EC471   E8C288F1FF             call    00404D38
004EC476   8B45B8                 mov     eax, [ebp-$48]
004EC479   50                     push    eax

* Possible String Reference to: 'A1'
|
004EC47A   6888C84E00             push    $004EC888
004EC47F   688CC84E00             push    $004EC88C
004EC484   8D45D0                 lea     eax, [ebp-$30]
004EC487   50                     push    eax
004EC488   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC48A   E85541F2FF             call    004105E4
004EC48F   83C414                 add     esp, +$14
004EC492   6898C84E00             push    $004EC898

* Possible String Reference to: 'A5'
|
004EC497   68ACC84E00             push    $004EC8AC
004EC49C   68B0C84E00             push    $004EC8B0
004EC4A1   8D45D0                 lea     eax, [ebp-$30]
004EC4A4   50                     push    eax
004EC4A5   8D45A4                 lea     eax, [ebp-$5C]
004EC4A8   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC4A9   E83641F2FF             call    004105E4
004EC4AE   83C410                 add     esp, +$10
004EC4B1   8D45A4                 lea     eax, [ebp-$5C]
004EC4B4   50                     push    eax
004EC4B5   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC4B7   E82841F2FF             call    004105E4
004EC4BC   83C40C                 add     esp, +$0C
004EC4BF   6AFF                   push    $FF
004EC4C1   68BCC84E00             push    $004EC8BC
004EC4C6   68CCC84E00             push    $004EC8CC
004EC4CB   8D45D0                 lea     eax, [ebp-$30]
004EC4CE   50                     push    eax
004EC4CF   8D4594                 lea     eax, [ebp-$6C]
004EC4D2   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC4D3   E80C41F2FF             call    004105E4
004EC4D8   83C40C                 add     esp, +$0C
004EC4DB   8D4594                 lea     eax, [ebp-$6C]
004EC4DE   50                     push    eax
004EC4DF   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC4E1   E8FE40F2FF             call    004105E4
004EC4E6   83C410                 add     esp, +$10
004EC4E9   833DD46D4F0000         cmp     dword ptr [$004F6DD4], +$00
004EC4F0   750A                   jnz     004EC4FC
004EC4F2   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004EC4F7   8945F0                 mov     [ebp-$10], eax
004EC4FA   EB08                   jmp     004EC504
004EC4FC   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004EC501   8945F0                 mov     [ebp-$10], eax
004EC504   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]

* Reference to: System.@LStrLen(String):Integer;
|
004EC509   E86A96F1FF             call    00405B78
004EC50E   85C0                   test    eax, eax
004EC510   0F8E8E020000           jle     004EC7A4
004EC516   8945E0                 mov     [ebp-$20], eax
004EC519   BB01000000             mov     ebx, $00000001

* Reference to TApplication instance
|
004EC51E   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004EC523   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EC525   E8BA42F9FF             call    004807E4
004EC52A   803D1E724F0001         cmp     byte ptr [$004F721E], $01
004EC531   0F846D020000           jz      004EC7A4
004EC537   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]

* Reference to: System.@LStrLen(String):Integer;
|
004EC53C   E83796F1FF             call    00405B78
004EC541   894590                 mov     [ebp-$70], eax
004EC544   DB4590                 fild    dword ptr [ebp-$70]
004EC547   895D8C                 mov     [ebp-$74], ebx
004EC54A   DB458C                 fild    dword ptr [ebp-$74]
004EC54D   DEF1                   fdivrp  st(1), st(0)
004EC54F   D80DDCC84E00           fmul    dword ptr [$004EC8DC]

* Reference to: System.@ROUND;
|
004EC555   E86A66F1FF             call    00402BC4
004EC55A   8BD0                   mov     edx, eax

* Reference to TFormProgress instance
|
004EC55C   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004EC561   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004EC563   8B80FC020000           mov     eax, [eax+$02FC]

* Reference to: ComCtrls.TProgressBar.SetPosition(TProgressBar;Integer);
|
004EC569   E8069CF5FF             call    00446174
004EC56E   C745F802000000         mov     dword ptr [ebp-$08], $00000002
004EC575   8B7DF0                 mov     edi, [ebp-$10]
004EC578   85FF                   test    edi, edi
004EC57A   0F8E5A010000           jle     004EC6DA
004EC580   BE01000000             mov     esi, $00000001
004EC585   6BC34C                 imul    eax, ebx, $4C
004EC588   8B15F86E4F00           mov     edx, [$004F6EF8]
004EC58E   8D04C2                 lea     eax, [edx+eax*8]
004EC591   8B94F0A0FDFFFF         mov     edx, [eax+esi*8+$FFFFFDA0]
004EC598   8955E8                 mov     [ebp-$18], edx
004EC59B   8B94F0A4FDFFFF         mov     edx, [eax+esi*8+$FFFFFDA4]
004EC5A2   8955EC                 mov     [ebp-$14], edx
004EC5A5   8D45E8                 lea     eax, [ebp-$18]
004EC5A8   50                     push    eax
004EC5A9   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004EC5AC   E87B84F1FF             call    00404A2C
004EC5B1   50                     push    eax
004EC5B2   8D45F4                 lea     eax, [ebp-$0C]
004EC5B5   50                     push    eax
004EC5B6   B901000000             mov     ecx, $00000001
004EC5BB   8BD6                   mov     edx, esi

* Reference to Form1
|
004EC5BD   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.RaschetParam()
|
004EC5C0   E8EFA3FFFF             call    004E69B4
004EC5C5   837DF4FF               cmp     dword ptr [ebp-$0C], -$01
004EC5C9   0F8E03010000           jle     004EC6D2
004EC5CF   83FB01                 cmp     ebx, +$01
004EC5D2   0F85BD000000           jnz     004EC695
004EC5D8   8B45F8                 mov     eax, [ebp-$08]
004EC5DB   48                     dec     eax
004EC5DC   50                     push    eax
004EC5DD   8D45F8                 lea     eax, [ebp-$08]
004EC5E0   50                     push    eax
004EC5E1   6A02                   push    $02
004EC5E3   68E0C84E00             push    $004EC8E0
004EC5E8   68ECC84E00             push    $004EC8EC
004EC5ED   8D45D0                 lea     eax, [ebp-$30]
004EC5F0   50                     push    eax
004EC5F1   8D857CFFFFFF           lea     eax, [ebp+$FFFFFF7C]
004EC5F7   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC5F8   E8E73FF2FF             call    004105E4
004EC5FD   83C40C                 add     esp, +$0C
004EC600   8D857CFFFFFF           lea     eax, [ebp+$FFFFFF7C]
004EC606   50                     push    eax
004EC607   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC609   E8D63FF2FF             call    004105E4
004EC60E   83C418                 add     esp, +$18
004EC611   8B45F4                 mov     eax, [ebp-$0C]
004EC614   8D04C0                 lea     eax, [eax+eax*8]
004EC617   8B04859C224F00         mov     eax, [$4F229C+eax*4]
004EC61E   50                     push    eax
004EC61F   8D45F8                 lea     eax, [ebp-$08]
004EC622   50                     push    eax
004EC623   6A03                   push    $03
004EC625   68F8C84E00             push    $004EC8F8
004EC62A   68ECC84E00             push    $004EC8EC
004EC62F   8D45D0                 lea     eax, [ebp-$30]
004EC632   50                     push    eax
004EC633   8D856CFFFFFF           lea     eax, [ebp+$FFFFFF6C]
004EC639   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC63A   E8A53FF2FF             call    004105E4
004EC63F   83C40C                 add     esp, +$0C
004EC642   8D856CFFFFFF           lea     eax, [ebp+$FFFFFF6C]
004EC648   50                     push    eax
004EC649   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC64B   E8943FF2FF             call    004105E4
004EC650   83C418                 add     esp, +$18
004EC653   8B45F4                 mov     eax, [ebp-$0C]
004EC656   8D04C0                 lea     eax, [eax+eax*8]
004EC659   8B0485A0224F00         mov     eax, [$4F22A0+eax*4]
004EC660   50                     push    eax
004EC661   8D45F8                 lea     eax, [ebp-$08]
004EC664   50                     push    eax
004EC665   6A04                   push    $04
004EC667   68F8C84E00             push    $004EC8F8
004EC66C   68ECC84E00             push    $004EC8EC
004EC671   8D45D0                 lea     eax, [ebp-$30]
004EC674   50                     push    eax
004EC675   8D855CFFFFFF           lea     eax, [ebp+$FFFFFF5C]
004EC67B   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC67C   E8633FF2FF             call    004105E4
004EC681   83C40C                 add     esp, +$0C
004EC684   8D855CFFFFFF           lea     eax, [ebp+$FFFFFF5C]
004EC68A   50                     push    eax
004EC68B   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC68D   E8523FF2FF             call    004105E4
004EC692   83C418                 add     esp, +$18
004EC695   8D45E4                 lea     eax, [ebp-$1C]
004EC698   50                     push    eax
004EC699   8D45F8                 lea     eax, [ebp-$08]
004EC69C   50                     push    eax
004EC69D   8D4304                 lea     eax, [ebx+$04]
004EC6A0   50                     push    eax
004EC6A1   6804C94E00             push    $004EC904
004EC6A6   68ECC84E00             push    $004EC8EC
004EC6AB   8D45D0                 lea     eax, [ebp-$30]
004EC6AE   50                     push    eax
004EC6AF   8D854CFFFFFF           lea     eax, [ebp+$FFFFFF4C]
004EC6B5   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC6B6   E8293FF2FF             call    004105E4
004EC6BB   83C40C                 add     esp, +$0C
004EC6BE   8D854CFFFFFF           lea     eax, [ebp+$FFFFFF4C]
004EC6C4   50                     push    eax
004EC6C5   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC6C7   E8183FF2FF             call    004105E4
004EC6CC   83C418                 add     esp, +$18
004EC6CF   FF45F8                 inc     dword ptr [ebp-$08]
004EC6D2   46                     inc     esi
004EC6D3   4F                     dec     edi
004EC6D4   0F85ABFEFFFF           jnz     004EC585
004EC6DA   6BC34C                 imul    eax, ebx, $4C
004EC6DD   8B15F86E4F00           mov     edx, [$004F6EF8]
004EC6E3   FFB4C2A4FDFFFF         push    dword ptr [edx+eax*8+$FFFFFDA4]
004EC6EA   FFB4C2A0FDFFFF         push    dword ptr [edx+eax*8+$FFFFFDA0]
004EC6F1   8D45E4                 lea     eax, [ebp-$1C]

* Possible String Reference to: 'hh:nn:ss.zzz'
|
004EC6F4   BA18C94E00             mov     edx, $004EC918

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004EC6F9   E836F4F1FF             call    0040BB34
004EC6FE   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: System.@LStrLen(String):Integer;
|
004EC701   E8E685F1FF             call    00404CEC
004EC706   8BD0                   mov     edx, eax
004EC708   4A                     dec     edx
004EC709   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrSetLength;
|
004EC70C   E86789F1FF             call    00405078
004EC711   6830C94E00             push    $004EC930
004EC716   6834C94E00             push    $004EC934
004EC71B   6A01                   push    $01
004EC71D   8D7304                 lea     esi, [ebx+$04]
004EC720   56                     push    esi
004EC721   6848C94E00             push    $004EC948
004EC726   68ECC84E00             push    $004EC8EC
004EC72B   8D45D0                 lea     eax, [ebp-$30]
004EC72E   50                     push    eax
004EC72F   8D852CFFFFFF           lea     eax, [ebp+$FFFFFF2C]
004EC735   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC736   E8A93EF2FF             call    004105E4
004EC73B   83C40C                 add     esp, +$0C
004EC73E   8D852CFFFFFF           lea     eax, [ebp+$FFFFFF2C]
004EC744   50                     push    eax
004EC745   8D853CFFFFFF           lea     eax, [ebp+$FFFFFF3C]
004EC74B   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC74C   E8933EF2FF             call    004105E4
004EC751   83C414                 add     esp, +$14
004EC754   8D853CFFFFFF           lea     eax, [ebp+$FFFFFF3C]
004EC75A   50                     push    eax
004EC75B   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC75D   E8823EF2FF             call    004105E4
004EC762   83C410                 add     esp, +$10
004EC765   8D45E4                 lea     eax, [ebp-$1C]
004EC768   50                     push    eax
004EC769   6A01                   push    $01
004EC76B   56                     push    esi
004EC76C   6854C94E00             push    $004EC954
004EC771   68ECC84E00             push    $004EC8EC
004EC776   8D45D0                 lea     eax, [ebp-$30]
004EC779   50                     push    eax
004EC77A   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]
004EC780   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC781   E85E3EF2FF             call    004105E4
004EC786   83C40C                 add     esp, +$0C
004EC789   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]
004EC78F   50                     push    eax
004EC790   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC792   E84D3EF2FF             call    004105E4
004EC797   83C418                 add     esp, +$18
004EC79A   43                     inc     ebx
004EC79B   FF4DE0                 dec     dword ptr [ebp-$20]
004EC79E   0F857AFDFFFF           jnz     004EC51E

* Reference to TFormProgress instance
|
004EC7A4   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004EC7A9   8B00                   mov     eax, [eax]
004EC7AB   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004EC7AD   E832D7F8FF             call    00479EE4
004EC7B2   6AFF                   push    $FF
004EC7B4   6860C94E00             push    $004EC960
004EC7B9   8D45D0                 lea     eax, [ebp-$30]
004EC7BC   50                     push    eax
004EC7BD   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC7BF   E8203EF2FF             call    004105E4
004EC7C4   83C410                 add     esp, +$10
004EC7C7   33C0                   xor     eax, eax
004EC7C9   5A                     pop     edx
004EC7CA   59                     pop     ecx
004EC7CB   59                     pop     ecx
004EC7CC   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[ãÂ]√'
|
004EC7CF   6832C84E00             push    $004EC832
004EC7D4   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]

* Reference to object Variant
|
004EC7DA   8B15C0104000           mov     edx, [$004010C0]
004EC7E0   B907000000             mov     ecx, $00000007

* Reference to: System.@FinalizeArray(Pointer;Pointer;Cardinal);
|
004EC7E5   E81E8DF1FF             call    00405508
004EC7EA   8D4594                 lea     eax, [ebp-$6C]

* Reference to object Variant
|
004EC7ED   8B15C0104000           mov     edx, [$004010C0]
004EC7F3   B902000000             mov     ecx, $00000002

* Reference to: System.@FinalizeArray(Pointer;Pointer;Cardinal);
|
004EC7F8   E80B8DF1FF             call    00405508
004EC7FD   8D45B4                 lea     eax, [ebp-$4C]
004EC800   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC805   E84682F1FF             call    00404A50
004EC80A   8D45BC                 lea     eax, [ebp-$44]

* Reference to: Variants.@VarClr(TVarData;TVarData);
|
004EC80D   E8CA3DF2FF             call    004105DC
004EC812   8D45CC                 lea     eax, [ebp-$34]

* Reference to: System.@IntfClear(IInterface;IInterface):Pointer;
|
004EC815   E8F69CF1FF             call    00406510
004EC81A   8D45D0                 lea     eax, [ebp-$30]

* Reference to: Variants.@VarClr(TVarData;TVarData);
|
004EC81D   E8BA3DF2FF             call    004105DC
004EC822   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004EC825   E80282F1FF             call    00404A2C
004EC82A   C3                     ret


* Reference to: System.@HandleFinally;
|
004EC82B   E97C7BF1FF             jmp     004043AC
004EC830   EBA2                   jmp     004EC7D4

****** END
|
004EC832   5F                     pop     edi
004EC833   5E                     pop     esi
004EC834   5B                     pop     ebx
004EC835   8BE5                   mov     esp, ebp
004EC837   5D                     pop     ebp
004EC838   C3                     ret

*)
end;

procedure TForm1.N_MR140Click(Sender : TObject);
begin
(*
004E39B8   53                     push    ebx
004E39B9   56                     push    esi
004E39BA   8BD8                   mov     ebx, eax
004E39BC   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E39C3   7507                   jnz     004E39CC
004E39C5   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E39C7   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E39CC   C605A76D4F0012         mov     byte ptr [$004F6DA7], $12
004E39D3   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E39DA   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E39E1   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E39EB   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E39ED   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E39F3   E8ACF2F8FF             call    00472CA4
004E39F8   B201                   mov     dl, $01

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E39FA   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3A00   E89FF2F8FF             call    00472CA4
004E3A05   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3A07   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3A0D   E892F2F8FF             call    00472CA4
004E3A12   6A02                   push    $02

* Possible String Reference to: 'Dvig'
|
004E3A14   B9443A4E00             mov     ecx, $004E3A44

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3A19   BA543A4E00             mov     edx, $004E3A54
004E3A1E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3A23   8B30                   mov     esi, [eax]
004E3A25   FF560C                 call    dword ptr [esi+$0C]
004E3A28   B201                   mov     dl, $01
004E3A2A   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3A2C   E807F8FFFF             call    004E3238
004E3A31   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3A33   E860050000             call    004E3F98
004E3A38   5E                     pop     esi
004E3A39   5B                     pop     ebx
004E3A3A   C3                     ret

*)
end;

procedure TForm1.N_SiriusClick(Sender : TObject);
begin
(*
004E3910   53                     push    ebx
004E3911   56                     push    esi
004E3912   8BD8                   mov     ebx, eax
004E3914   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E391B   7507                   jnz     004E3924
004E391D   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E391F   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3924   C605A76D4F0011         mov     byte ptr [$004F6DA7], $11
004E392B   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E3932   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3939   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3943   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3945   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E394B   E854F3F8FF             call    00472CA4
004E3950   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3952   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3958   E847F3F8FF             call    00472CA4
004E395D   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E395F   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3965   E83AF3F8FF             call    00472CA4
004E396A   6A01                   push    $01

* Possible String Reference to: 'Dvig'
|
004E396C   B99C394E00             mov     ecx, $004E399C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3971   BAAC394E00             mov     edx, $004E39AC
004E3976   A120724F00             mov     eax, dword ptr [$004F7220]
004E397B   8B30                   mov     esi, [eax]
004E397D   FF560C                 call    dword ptr [esi+$0C]
004E3980   B201                   mov     dl, $01
004E3982   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3984   E8AFF8FFFF             call    004E3238
004E3989   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E398B   E808060000             call    004E3F98
004E3990   5E                     pop     esi
004E3991   5B                     pop     ebx
004E3992   C3                     ret

*)
end;

procedure TForm1.N_AisinClick(Sender : TObject);
begin
(*
004E3B08   53                     push    ebx
004E3B09   56                     push    esi
004E3B0A   8BD8                   mov     ebx, eax
004E3B0C   C605A76D4F0021         mov     byte ptr [$004F6DA7], $21
004E3B13   C605A86D4F0018         mov     byte ptr [$004F6DA8], $18
004E3B1A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3B21   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3B2B   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3B2D   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3B33   E86CF1F8FF             call    00472CA4
004E3B38   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3B3A   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3B40   E85FF1F8FF             call    00472CA4
004E3B45   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3B47   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3B4D   E852F1F8FF             call    00472CA4
004E3B52   6A01                   push    $01

* Possible String Reference to: 'AKPP'
|
004E3B54   B9843B4E00             mov     ecx, $004E3B84

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3B59   BA943B4E00             mov     edx, $004E3B94
004E3B5E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3B63   8B30                   mov     esi, [eax]
004E3B65   FF560C                 call    dword ptr [esi+$0C]
004E3B68   B202                   mov     dl, $02
004E3B6A   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3B6C   E8C7F6FFFF             call    004E3238
004E3B71   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3B73   E820040000             call    004E3F98
004E3B78   5E                     pop     esi
004E3B79   5B                     pop     ebx
004E3B7A   C3                     ret

*)
end;

procedure TForm1.N_ZFClick(Sender : TObject);
begin
(*
004E3BA0   53                     push    ebx
004E3BA1   56                     push    esi
004E3BA2   8BD8                   mov     ebx, eax
004E3BA4   C605A76D4F0022         mov     byte ptr [$004F6DA7], $22
004E3BAB   C605A86D4F0018         mov     byte ptr [$004F6DA8], $18
004E3BB2   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3BB9   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3BC3   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3BC5   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BCB   E8D4F0F8FF             call    00472CA4
004E3BD0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3BD2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BD8   E8C7F0F8FF             call    00472CA4
004E3BDD   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3BDF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BE5   E8BAF0F8FF             call    00472CA4
004E3BEA   6A02                   push    $02

* Possible String Reference to: 'AKPP'
|
004E3BEC   B91C3C4E00             mov     ecx, $004E3C1C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3BF1   BA2C3C4E00             mov     edx, $004E3C2C
004E3BF6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3BFB   8B30                   mov     esi, [eax]
004E3BFD   FF560C                 call    dword ptr [esi+$0C]
004E3C00   B202                   mov     dl, $02
004E3C02   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3C04   E82FF6FFFF             call    004E3238
004E3C09   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3C0B   E888030000             call    004E3F98
004E3C10   5E                     pop     esi
004E3C11   5B                     pop     ebx
004E3C12   C3                     ret

*)
end;

procedure TForm1.N5Click(Sender : TObject);
begin
(*
004EC96C   6A40                   push    $40
004EC96E   689C5E5400             push    $00545E9C
004EC973   68AC5E5400             push    $00545EAC
004EC978   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EC97A   E8E9AEF1FF             call    00407868
004EC97F   C3                     ret

*)
end;

procedure TForm1.TimerParamTimer(Sender : TObject);
begin
(*
004E60FC   55                     push    ebp
004E60FD   8BEC                   mov     ebp, esp
004E60FF   83C4F8                 add     esp, -$08
004E6102   53                     push    ebx
004E6103   56                     push    esi
004E6104   57                     push    edi
004E6105   33C9                   xor     ecx, ecx
004E6107   894DF8                 mov     [ebp-$08], ecx
004E610A   8BD8                   mov     ebx, eax
004E610C   33C0                   xor     eax, eax
004E610E   55                     push    ebp

* Possible String Reference to: 'È«‹ÒˇÎ_^[YY]√'
|
004E610F   68E0664E00             push    $004E66E0

***** TRY
|
004E6114   64FF30                 push    dword ptr fs:[eax]
004E6117   648920                 mov     fs:[eax], esp
004E611A   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004E611C   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E6122   E87DF2F4FF             call    004353A4
004E6127   C60525724F0001         mov     byte ptr [$004F7225], $01

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E612E   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E6134   83780C02               cmp     dword ptr [eax+$0C], +$02
004E6138   7419                   jz      004E6153
004E613A   B201                   mov     dl, $01

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E613C   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E6142   E83DA0F7FF             call    00460184
004E6147   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E614E   E977050000             jmp     004E66CA
004E6153   B201                   mov     dl, $01

* Reference to control TForm1.List_Param : TValueListEditor
|
004E6155   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E615B   E824A0F7FF             call    00460184
004E6160   33D2                   xor     edx, edx

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E6162   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E6168   E817A0F7FF             call    00460184
004E616D   33D2                   xor     edx, edx

* Reference to control TForm1.Panel_DTC : TPanel
|
004E616F   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E6175   E80AA0F7FF             call    00460184

* Reference to TOptionsForm instance
|
004E617A   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004E617F   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.ModGodGroup : TRadioGroup
|
004E6181   8B801C030000           mov     eax, [eax+$031C]

* Reference to field TRadioGroup.ItemIndex : Integer
|
004E6187   83B81802000000         cmp     dword ptr [eax+$0218], +$00
004E618E   7507                   jnz     004E6197
004E6190   BE27000000             mov     esi, $00000027
004E6195   EB05                   jmp     004E619C
004E6197   BE28000000             mov     esi, $00000028
004E619C   33C0                   xor     eax, eax
004E619E   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E61A3   83C0EF                 add     eax, -$11
004E61A6   83F833                 cmp     eax, +$33
004E61A9   0F87FC030000           jnbe    004E65AB
004E61AF   8A80BC614E00           mov     al, byte ptr [eax+$4E61BC]
004E61B5   FF2485F0614E00         jmp     dword ptr [$4E61F0+eax*4]
004E61BC   0102                   add     [edx], eax
004E61BE   030400                 add     eax, [eax+eax]
004E61C1   0000                   add     [eax], al
004E61C3   0000                   add     [eax], al
004E61C5   0000                   add     [eax], al
004E61C7   0000                   add     [eax], al
004E61C9   0000                   add     [eax], al
004E61CB   000506000000           add     [$00000006], al
004E61D1   0000                   add     [eax], al
004E61D3   0000                   add     [eax], al
004E61D5   0000                   add     [eax], al
004E61D7   0000                   add     [eax], al
004E61D9   0000                   add     [eax], al
004E61DB   0000                   add     [eax], al
004E61DD   07                     pop     es
004E61DE   0000                   add     [eax], al
004E61E0   0000                   add     [eax], al
004E61E2   0000                   add     [eax], al
004E61E4   0000                   add     [eax], al
004E61E6   0000                   add     [eax], al
004E61E8   0000                   add     [eax], al
004E61EA   0000                   add     [eax], al
004E61EC   0809                   or      [ecx], cl
004E61EE   0A0B                   or      cl, byte ptr [ebx]
004E61F0   AB                     stosd
004E61F1   654E                   dec     esi
004E61F3   0020                   add     [eax], ah
004E61F5   624E00                 bound   ecx, qword ptr [esi+$00]
004E61F8   A3624E002A             mov     dword ptr [$2A004E62], eax
004E61FD   634E00                 arpl    [esi+$00], cx
004E6200   AD                     lodsd
004E6201   634E00                 arpl    [esi+$00], cx
004E6204   3464                   xor     al, $64
004E6206   4E                     dec     esi
004E6207   005D64                 add     [ebp+$64], bl
004E620A   4E                     dec     esi
004E620B   0089644E00B5           add     [ecx+$B5004E64], cl
004E6211   644E                   dec     esi
004E6213   00E1                   add     cl, ah
004E6215   644E                   dec     esi
004E6217   000D654E0084           add     [$84004E65], cl
004E621D   654E                   dec     esi
004E621F   00833DAC6D4F           add     [ebx+$4F6DAC3D], al
004E6225   0001                   add     [ecx], al
004E6227   743F                   jz      004E6268
004E6229   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E6230   7436                   jz      004E6268
004E6232   6A01                   push    $01
004E6234   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6239   50                     push    eax
004E623A   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E623F   50                     push    eax
004E6240   B92C000000             mov     ecx, $0000002C
004E6245   BA02000000             mov     edx, $00000002
004E624A   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E624C   E8C3040000             call    004E6714
004E6251   84C0                   test    al, al
004E6253   0F8471040000           jz      004E66CA
004E6259   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E6263   E955040000             jmp     004E66BD
004E6268   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E626D   40                     inc     eax
004E626E   50                     push    eax
004E626F   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E6274   50                     push    eax
004E6275   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E627A   50                     push    eax
004E627B   B939000000             mov     ecx, $00000039
004E6280   BAF0000000             mov     edx, $000000F0
004E6285   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6287   E888040000             call    004E6714
004E628C   84C0                   test    al, al
004E628E   0F8436040000           jz      004E66CA
004E6294   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E629E   E908030000             jmp     004E65AB
004E62A3   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E62AA   7443                   jz      004E62EF
004E62AC   6A01                   push    $01
004E62AE   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E62B3   50                     push    eax
004E62B4   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E62B9   50                     push    eax
004E62BA   B929000000             mov     ecx, $00000029
004E62BF   BAF0000000             mov     edx, $000000F0
004E62C4   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E62C6   E849040000             call    004E6714
004E62CB   84C0                   test    al, al
004E62CD   0F84F7030000           jz      004E66CA
004E62D3   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E62DA   0F85CB020000           jnz     004E65AB
004E62E0   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E62EA   E9CE030000             jmp     004E66BD
004E62EF   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E62F4   40                     inc     eax
004E62F5   50                     push    eax
004E62F6   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E62FB   50                     push    eax
004E62FC   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6301   50                     push    eax
004E6302   B931000000             mov     ecx, $00000031
004E6307   BAF1000000             mov     edx, $000000F1
004E630C   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E630E   E801040000             call    004E6714
004E6313   84C0                   test    al, al
004E6315   0F84AF030000           jz      004E66CA
004E631B   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E6325   E981020000             jmp     004E65AB
004E632A   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E6331   743F                   jz      004E6372
004E6333   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E633A   7436                   jz      004E6372
004E633C   6A01                   push    $01
004E633E   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6343   50                     push    eax
004E6344   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6349   50                     push    eax
004E634A   B92C000000             mov     ecx, $0000002C
004E634F   BA02000000             mov     edx, $00000002
004E6354   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6356   E8B9030000             call    004E6714
004E635B   84C0                   test    al, al
004E635D   0F8467030000           jz      004E66CA
004E6363   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E636D   E94B030000             jmp     004E66BD
004E6372   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6377   40                     inc     eax
004E6378   50                     push    eax
004E6379   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E637E   50                     push    eax
004E637F   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6384   50                     push    eax
004E6385   B936000000             mov     ecx, $00000036
004E638A   BAF0000000             mov     edx, $000000F0
004E638F   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6391   E87E030000             call    004E6714
004E6396   84C0                   test    al, al
004E6398   0F842C030000           jz      004E66CA
004E639E   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E63A8   E9FE010000             jmp     004E65AB
004E63AD   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E63B4   7443                   jz      004E63F9
004E63B6   6A01                   push    $01
004E63B8   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E63BD   50                     push    eax
004E63BE   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E63C3   50                     push    eax
004E63C4   B96B000000             mov     ecx, $0000006B
004E63C9   BA01000000             mov     edx, $00000001
004E63CE   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E63D0   E83F030000             call    004E6714
004E63D5   84C0                   test    al, al
004E63D7   0F84ED020000           jz      004E66CA
004E63DD   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E63E4   0F85C1010000           jnz     004E65AB
004E63EA   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E63F4   E9C4020000             jmp     004E66BD
004E63F9   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E63FE   40                     inc     eax
004E63FF   50                     push    eax
004E6400   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E6405   50                     push    eax
004E6406   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E640B   50                     push    eax
004E640C   B927000000             mov     ecx, $00000027
004E6411   BA03000000             mov     edx, $00000003
004E6416   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6418   E8F7020000             call    004E6714
004E641D   84C0                   test    al, al
004E641F   0F84A5020000           jz      004E66CA
004E6425   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E642F   E977010000             jmp     004E65AB
004E6434   6A01                   push    $01
004E6436   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E643B   50                     push    eax
004E643C   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6441   50                     push    eax
004E6442   8BCE                   mov     ecx, esi
004E6444   BA01000000             mov     edx, $00000001
004E6449   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E644B   E8C4020000             call    004E6714
004E6450   84C0                   test    al, al
004E6452   0F8472020000           jz      004E66CA
004E6458   E94E010000             jmp     004E65AB
004E645D   6A01                   push    $01
004E645F   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6464   50                     push    eax
004E6465   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E646A   50                     push    eax
004E646B   B935000000             mov     ecx, $00000035
004E6470   BAF0000000             mov     edx, $000000F0
004E6475   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6477   E898020000             call    004E6714
004E647C   84C0                   test    al, al
004E647E   0F8446020000           jz      004E66CA
004E6484   E922010000             jmp     004E65AB
004E6489   6A01                   push    $01
004E648B   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6490   50                     push    eax
004E6491   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6496   50                     push    eax
004E6497   B922000000             mov     ecx, $00000022
004E649C   BAFB000000             mov     edx, $000000FB
004E64A1   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E64A3   E86C020000             call    004E6714
004E64A8   84C0                   test    al, al
004E64AA   0F841A020000           jz      004E66CA
004E64B0   E9F6000000             jmp     004E65AB
004E64B5   6A01                   push    $01
004E64B7   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E64BC   50                     push    eax
004E64BD   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E64C2   50                     push    eax
004E64C3   B930000000             mov     ecx, $00000030
004E64C8   BA01000000             mov     edx, $00000001
004E64CD   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E64CF   E840020000             call    004E6714
004E64D4   84C0                   test    al, al
004E64D6   0F84EE010000           jz      004E66CA
004E64DC   E9CA000000             jmp     004E65AB
004E64E1   6A01                   push    $01
004E64E3   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E64E8   50                     push    eax
004E64E9   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E64EE   50                     push    eax
004E64EF   B917000000             mov     ecx, $00000017
004E64F4   BA01000000             mov     edx, $00000001
004E64F9   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E64FB   E814020000             call    004E6714
004E6500   84C0                   test    al, al
004E6502   0F84C2010000           jz      004E66CA
004E6508   E99E000000             jmp     004E65AB
004E650D   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E6514   7436                   jz      004E654C
004E6516   6A01                   push    $01
004E6518   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E651D   50                     push    eax
004E651E   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6523   50                     push    eax
004E6524   B92A000000             mov     ecx, $0000002A
004E6529   BA01000000             mov     edx, $00000001
004E652E   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6530   E8DF010000             call    004E6714
004E6535   84C0                   test    al, al
004E6537   0F848D010000           jz      004E66CA
004E653D   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E6547   E971010000             jmp     004E66BD
004E654C   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6551   40                     inc     eax
004E6552   50                     push    eax
004E6553   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E6558   50                     push    eax
004E6559   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E655E   50                     push    eax
004E655F   B932000000             mov     ecx, $00000032
004E6564   BA03000000             mov     edx, $00000003
004E6569   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E656B   E8A4010000             call    004E6714
004E6570   84C0                   test    al, al
004E6572   0F8452010000           jz      004E66CA
004E6578   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E6582   EB27                   jmp     004E65AB
004E6584   6A01                   push    $01
004E6586   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E658B   50                     push    eax
004E658C   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6591   50                     push    eax
004E6592   B929000000             mov     ecx, $00000029
004E6597   BA20000000             mov     edx, $00000020
004E659C   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E659E   E871010000             call    004E6714
004E65A3   84C0                   test    al, al
004E65A5   0F841F010000           jz      004E66CA
004E65AB   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004E65B0   E8C3F5F1FF             call    00405B78
004E65B5   8BF8                   mov     edi, eax
004E65B7   4F                     dec     edi
004E65B8   85FF                   test    edi, edi
004E65BA   0F8CBA000000           jl      004E667A
004E65C0   47                     inc     edi
004E65C1   33F6                   xor     esi, esi
004E65C3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E65CA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E65D0   8D04C2                 lea     eax, [edx+eax*8]
004E65D3   8B15FC6E4F00           mov     edx, [$004F6EFC]
004E65D9   8B14B2                 mov     edx, [edx+esi*4]
004E65DC   8D04D0                 lea     eax, [eax+edx*8]
004E65DF   50                     push    eax
004E65E0   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E65E3   E844E4F1FF             call    00404A2C
004E65E8   50                     push    eax
004E65E9   8D45FC                 lea     eax, [ebp-$04]
004E65EC   50                     push    eax
004E65ED   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]
004E65F2   8B14B0                 mov     edx, [eax+esi*4]
004E65F5   B901000000             mov     ecx, $00000001
004E65FA   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E65FC   E8B3030000             call    004E69B4
004E6601   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E6605   7E6B                   jle     004E6672
004E6607   8B45FC                 mov     eax, [ebp-$04]
004E660A   8D04C0                 lea     eax, [eax+eax*8]
004E660D   833C85A0224F0000       cmp     dword ptr [$4F22A0+eax*4], +$00
004E6615   7440                   jz      004E6657
004E6617   8B45FC                 mov     eax, [ebp-$04]
004E661A   8D04C0                 lea     eax, [eax+eax*8]
004E661D   8B0485A0224F00         mov     eax, [$4F22A0+eax*4]
004E6624   BAF8664E00             mov     edx, $004E66F8

* Reference to: System.@LStrCmp;
|
004E6629   E80AE8F1FF             call    00404E38
004E662E   7427                   jz      004E6657
004E6630   FF75F8                 push    dword ptr [ebp-$08]

* Possible String Reference to: '  ('
|
004E6633   6804674E00             push    $004E6704
004E6638   8B45FC                 mov     eax, [ebp-$04]
004E663B   8D04C0                 lea     eax, [eax+eax*8]
004E663E   FF3485A0224F00         push    dword ptr [$4F22A0+eax*4]
004E6645   6810674E00             push    $004E6710
004E664A   8D45F8                 lea     eax, [ebp-$08]
004E664D   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004E6652   E855E7F1FF             call    00404DAC
004E6657   8B45FC                 mov     eax, [ebp-$04]
004E665A   8D04C0                 lea     eax, [eax+eax*8]
004E665D   8B14859C224F00         mov     edx, [$4F229C+eax*4]
004E6664   8B4DF8                 mov     ecx, [ebp-$08]
004E6667   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.SetValue(TValueListEditor;AnsiString;AnsiString);
|
004E666D   E8AEA9FAFF             call    00491020
004E6672   46                     inc     esi
004E6673   4F                     dec     edi
004E6674   0F8549FFFFFF           jnz     004E65C3
004E667A   FF05C86D4F00           inc     dword ptr [$004F6DC8]
004E6680   B201                   mov     dl, $01
004E6682   8B8348030000           mov     eax, [ebx+$0348]
004E6688   8B08                   mov     ecx, [eax]
004E668A   FF5164                 call    dword ptr [ecx+$64]
004E668D   C60519724F0000         mov     byte ptr [$004F7219], $00
004E6694   803D18724F0001         cmp     byte ptr [$004F7218], $01
004E669B   7507                   jnz     004E66A4
004E669D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Driver()
|
004E669F   E8C4780000             call    004EDF68

* Reference to TGrafForm instance
|
004E66A4   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004E66A9   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004E66AB   80785701               cmp     byte ptr [eax+$57], $01
004E66AF   750C                   jnz     004E66BD

* Reference to TGrafForm instance
|
004E66B1   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004E66B6   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004E66B8   E8CB54FFFF             call    004DBB88
004E66BD   B201                   mov     dl, $01
004E66BF   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E66C5   E8DAECF4FF             call    004353A4
004E66CA   33C0                   xor     eax, eax
004E66CC   5A                     pop     edx
004E66CD   59                     pop     ecx
004E66CE   59                     pop     ecx
004E66CF   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[YY]√'
|
004E66D2   68E7664E00             push    $004E66E7
004E66D7   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E66DA   E84DE3F1FF             call    00404A2C
004E66DF   C3                     ret


* Reference to: System.@HandleFinally;
|
004E66E0   E9C7DCF1FF             jmp     004043AC
004E66E5   EBF0                   jmp     004E66D7

****** END
|
004E66E7   5F                     pop     edi
004E66E8   5E                     pop     esi
004E66E9   5B                     pop     ebx
004E66EA   59                     pop     ecx
004E66EB   59                     pop     ecx
004E66EC   5D                     pop     ebp
004E66ED   C3                     ret

*)
end;

procedure TForm1.VspomRaschetParam(Sender : TObject);
begin
(*
004E6714   55                     push    ebp
004E6715   8BEC                   mov     ebp, esp
004E6717   83C4C4                 add     esp, -$3C
004E671A   53                     push    ebx
004E671B   56                     push    esi
004E671C   57                     push    edi
004E671D   33DB                   xor     ebx, ebx
004E671F   895DE4                 mov     [ebp-$1C], ebx
004E6722   894DFC                 mov     [ebp-$04], ecx
004E6725   8BDA                   mov     ebx, edx
004E6727   8BF8                   mov     edi, eax
004E6729   BEF86D4F00             mov     esi, $004F6DF8
004E672E   33C0                   xor     eax, eax
004E6730   55                     push    ebp
004E6731   68A1694E00             push    $004E69A1

***** TRY
|
004E6736   64FF30                 push    dword ptr fs:[eax]
004E6739   648920                 mov     fs:[eax], esp
004E673C   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004E6743   7541                   jnz     004E6786
004E6745   8B45FC                 mov     eax, [ebp-$04]
004E6748   50                     push    eax
004E6749   C645D484               mov     byte ptr [ebp-$2C], $84
004E674D   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E6752   8845D5                 mov     [ebp-$2B], al
004E6755   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E675A   8845D6                 mov     [ebp-$2A], al
004E675D   C645D721               mov     byte ptr [ebp-$29], $21
004E6761   C645D801               mov     byte ptr [ebp-$28], $01
004E6765   C645D901               mov     byte ptr [ebp-$27], $01
004E6769   C645DA01               mov     byte ptr [ebp-$26], $01
004E676D   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E6772   8845DB                 mov     [ebp-$25], al
004E6775   8D55D4                 lea     edx, [ebp-$2C]
004E6778   B907000000             mov     ecx, $00000007
004E677D   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004E677F   E8BCC6FFFF             call    004E2E40
004E6784   EB7F                   jmp     004E6805
004E6786   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E678B   2C14                   sub     al, $14
004E678D   7404                   jz      004E6793
004E678F   2C1E                   sub     al, $1E
004E6791   753C                   jnz     004E67CF
004E6793   8B45FC                 mov     eax, [ebp-$04]
004E6796   50                     push    eax
004E6797   C645CC80               mov     byte ptr [ebp-$34], $80
004E679B   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E67A0   8845CD                 mov     [ebp-$33], al
004E67A3   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E67A8   8845CE                 mov     [ebp-$32], al
004E67AB   C645CF02               mov     byte ptr [ebp-$31], $02
004E67AF   C645D021               mov     byte ptr [ebp-$30], $21
004E67B3   885DD1                 mov     [ebp-$2F], bl
004E67B6   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E67BB   8845D2                 mov     [ebp-$2E], al
004E67BE   8D55CC                 lea     edx, [ebp-$34]
004E67C1   B906000000             mov     ecx, $00000006
004E67C6   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004E67C8   E873C6FFFF             call    004E2E40
004E67CD   EB36                   jmp     004E6805
004E67CF   8B45FC                 mov     eax, [ebp-$04]
004E67D2   50                     push    eax
004E67D3   C645C482               mov     byte ptr [ebp-$3C], $82
004E67D7   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E67DC   8845C5                 mov     [ebp-$3B], al
004E67DF   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E67E4   8845C6                 mov     [ebp-$3A], al
004E67E7   C645C721               mov     byte ptr [ebp-$39], $21
004E67EB   885DC8                 mov     [ebp-$38], bl
004E67EE   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E67F3   8845C9                 mov     [ebp-$37], al
004E67F6   8D55C4                 lea     edx, [ebp-$3C]
004E67F9   B905000000             mov     ecx, $00000005
004E67FE   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004E6800   E83BC6FFFF             call    004E2E40
004E6805   807E0B61               cmp     byte ptr [esi+$0B], $61
004E6809   7506                   jnz     004E6811
004E680B   807E0A28               cmp     byte ptr [esi+$0A], $28
004E680F   7435                   jz      004E6846
004E6811   807E0961               cmp     byte ptr [esi+$09], $61
004E6815   7509                   jnz     004E6820
004E6817   33C0                   xor     eax, eax
004E6819   8A460A                 mov     al, byte ptr [esi+$0A]
004E681C   3BD8                   cmp     ebx, eax
004E681E   7426                   jz      004E6846
004E6820   807E0B61               cmp     byte ptr [esi+$0B], $61
004E6824   7509                   jnz     004E682F
004E6826   33C0                   xor     eax, eax
004E6828   8A460C                 mov     al, byte ptr [esi+$0C]
004E682B   3BD8                   cmp     ebx, eax
004E682D   7417                   jz      004E6846
004E682F   807E0A61               cmp     byte ptr [esi+$0A], $61
004E6833   0F8514010000           jnz     004E694D
004E6839   33C0                   xor     eax, eax
004E683B   8A460B                 mov     al, byte ptr [esi+$0B]
004E683E   3BD8                   cmp     ebx, eax
004E6840   0F8507010000           jnz     004E694D
004E6846   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DB0
|
004E6848   A3B06D4F00             mov     dword ptr [$004F6DB0], eax
004E684D   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E6854   C645FB01               mov     byte ptr [ebp-$05], $01

* Reference to: SysUtils.Time:TDateTime;
|
004E6858   E8C746F2FF             call    0040AF24
004E685D   83C4F8                 add     esp, -$08
004E6860   DD1C24                 fstp    qword ptr [esp]
004E6863   9B                     wait
004E6864   8D45DC                 lea     eax, [ebp-$24]
004E6867   50                     push    eax
004E6868   8D4DDE                 lea     ecx, [ebp-$22]
004E686B   8D55E0                 lea     edx, [ebp-$20]
004E686E   8D45E2                 lea     eax, [ebp-$1E]

* Reference to: SysUtils.DecodeTime(TDateTime;Word;Word;Word;Word;Word;Word;Word;Word);
|
004E6871   E85E43F2FF             call    0040ABD4
004E6876   8A45E2                 mov     al, byte ptr [ebp-$1E]
004E6879   8B15D86D4F00           mov     edx, [$004F6DD8]
004E687F   884416FC               mov     [esi+edx-$04], al
004E6883   8A45E0                 mov     al, byte ptr [ebp-$20]
004E6886   8B15D86D4F00           mov     edx, [$004F6DD8]
004E688C   884416FD               mov     [esi+edx-$03], al
004E6890   8A45DE                 mov     al, byte ptr [ebp-$22]
004E6893   8B15D86D4F00           mov     edx, [$004F6DD8]
004E6899   884416FE               mov     [esi+edx-$02], al
004E689D   0FB745DC               movzx   eax, word ptr [ebp-$24]
004E68A1   B90A000000             mov     ecx, $0000000A
004E68A6   33D2                   xor     edx, edx
004E68A8   F7F1                   div     ecx 
004E68AA   8B15D86D4F00           mov     edx, [$004F6DD8]
004E68B0   884416FF               mov     [esi+edx-$01], al
004E68B4   68CC6D4F00             push    $004F6DCC
004E68B9   8BD6                   mov     edx, esi
004E68BB   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E68C1   B8006F4F00             mov     eax, $004F6F00

|
004E68C6   E885C7F1FF             call    00403050

|
004E68CB   E8E4BFF1FF             call    004028B4
004E68D0   8B4508                 mov     eax, [ebp+$08]
004E68D3   40                     inc     eax
004E68D4   50                     push    eax
004E68D5   B8F86E4F00             mov     eax, $004F6EF8
004E68DA   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E68DF   8B15DCFA4D00           mov     edx, [$004DFADC]

* Reference to: System.@DynArraySetLength;
|
004E68E5   E84AF4F1FF             call    00405D34
004E68EA   83C404                 add     esp, +$04
004E68ED   8B5D10                 mov     ebx, [ebp+$10]
004E68F0   8B750C                 mov     esi, [ebp+$0C]
004E68F3   2BF3                   sub     esi, ebx
004E68F5   7C41                   jl      004E6938
004E68F7   46                     inc     esi
004E68F8   8D45E8                 lea     eax, [ebp-$18]
004E68FB   50                     push    eax
004E68FC   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E68FF   E828E1F1FF             call    00404A2C
004E6904   50                     push    eax
004E6905   8D45F4                 lea     eax, [ebp-$0C]
004E6908   50                     push    eax
004E6909   33C9                   xor     ecx, ecx
004E690B   8BD3                   mov     edx, ebx
004E690D   8BC7                   mov     eax, edi

* Reference to : TForm1.RaschetParam()
|
004E690F   E8A0000000             call    004E69B4
004E6914   837DF4FF               cmp     dword ptr [ebp-$0C], -$01
004E6918   7E1A                   jle     004E6934
004E691A   6B45084C               imul    eax, [ebp+$08], $4C
004E691E   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6924   8D04C2                 lea     eax, [edx+eax*8]
004E6927   8B55E8                 mov     edx, [ebp-$18]
004E692A   8914D8                 mov     [eax+ebx*8], edx
004E692D   8B55EC                 mov     edx, [ebp-$14]
004E6930   8954D804               mov     [eax+ebx*8+$04], edx
004E6934   43                     inc     ebx
004E6935   4E                     dec     esi
004E6936   75C0                   jnz     004E68F8

* Reference to: SysUtils.Time:TDateTime;
|
004E6938   E8E745F2FF             call    0040AF24
004E693D   6B45084C               imul    eax, [ebp+$08], $4C
004E6941   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6947   DD1CC2                 fstp    qword ptr [edx+eax*8]
004E694A   9B                     wait
004E694B   EB17                   jmp     004E6964
004E694D   FF05B06D4F00           inc     dword ptr [$004F6DB0]
004E6953   C645FB00               mov     byte ptr [ebp-$05], $00
004E6957   8B8730030000           mov     eax, [edi+$0330]
004E695D   B201                   mov     dl, $01

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E695F   E840EAF4FF             call    004353A4
004E6964   833DB06D4F0005         cmp     dword ptr [$004F6DB0], +$05
004E696B   7E1E                   jle     004E698B
004E696D   C6051A724F0001         mov     byte ptr [$004F721A], $01

* Reference to TGrafForm instance
|
004E6974   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004E6979   8B00                   mov     eax, [eax]

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004E697B   E8D068F9FF             call    0047D250
004E6980   8B871C030000           mov     eax, [edi+$031C]
004E6986   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.GetClientRect()
|
004E6988   FF5244                 call    dword ptr [edx+$44]
004E698B   33C0                   xor     eax, eax
004E698D   5A                     pop     edx
004E698E   59                     pop     ecx
004E698F   59                     pop     ecx
004E6990   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E6993   68A8694E00             push    $004E69A8
004E6998   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E699B   E88CE0F1FF             call    00404A2C
004E69A0   C3                     ret


* Reference to: System.@HandleFinally;
|
004E69A1   E906DAF1FF             jmp     004043AC
004E69A6   EBF0                   jmp     004E6998

****** END
|
004E69A8   8A45FB                 mov     al, byte ptr [ebp-$05]
004E69AB   5F                     pop     edi
004E69AC   5E                     pop     esi
004E69AD   5B                     pop     ebx
004E69AE   8BE5                   mov     esp, ebp
004E69B0   5D                     pop     ebp
004E69B1   C20C00                 ret     $000C

*)
end;

procedure TForm1.N4Click(Sender : TObject);
begin
(*
004ECB18   55                     push    ebp
004ECB19   8BEC                   mov     ebp, esp
004ECB1B   6A00                   push    $00
004ECB1D   53                     push    ebx
004ECB1E   8BD8                   mov     ebx, eax
004ECB20   33C0                   xor     eax, eax
004ECB22   55                     push    ebp

* Possible String Reference to: 'È/xÒˇÎ[Y]√'
|
004ECB23   6878CB4E00             push    $004ECB78

***** TRY
|
004ECB28   64FF30                 push    dword ptr fs:[eax]
004ECB2B   648920                 mov     fs:[eax], esp
004ECB2E   6A05                   push    $05
004ECB30   6A00                   push    $00
004ECB32   6A00                   push    $00
004ECB34   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: 'CheviExplorer.chm'
|
004ECB37   B98CCB4E00             mov     ecx, $004ECB8C
004ECB3C   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004ECB42   E8F181F1FF             call    00404D38
004ECB47   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004ECB4A   E89D83F1FF             call    00404EEC
004ECB4F   50                     push    eax

* Possible String Reference to: 'open'
|
004ECB50   68A0CB4E00             push    $004ECBA0
004ECB55   8BC3                   mov     eax, ebx

* Reference to: QForms.TCustomForm.GetClientHandle(TCustomForm):QWorkspaceH;
|
004ECB57   E8A0A0F7FF             call    00466BFC
004ECB5C   50                     push    eax

* Reference to: shell32.ShellExecuteA()
|
004ECB5D   E8FA3FF4FF             call    00430B5C
004ECB62   33C0                   xor     eax, eax
004ECB64   5A                     pop     edx
004ECB65   59                     pop     ecx
004ECB66   59                     pop     ecx
004ECB67   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[Y]√'
|
004ECB6A   687FCB4E00             push    $004ECB7F
004ECB6F   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004ECB72   E8B57EF1FF             call    00404A2C
004ECB77   C3                     ret


* Reference to: System.@HandleFinally;
|
004ECB78   E92F78F1FF             jmp     004043AC
004ECB7D   EBF0                   jmp     004ECB6F

****** END
|
004ECB7F   5B                     pop     ebx
004ECB80   59                     pop     ecx
004ECB81   5D                     pop     ebp
004ECB82   C3                     ret

*)
end;

procedure TForm1.Previous_NaborExecute(Sender : TObject);
begin
(*
004EB960   53                     push    ebx
004EB961   8BD8                   mov     ebx, eax
004EB963   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EB96A   7522                   jnz     004EB98E

* Reference to TGrafForm instance
|
004EB96C   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EB971   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Previous_Nabor : TMenuItem
|
004EB973   8B8040030000           mov     eax, [eax+$0340]
004EB979   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EB97B   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EB97E   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EB984   E89B57FAFF             call    00491124
004EB989   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EB98B   FF5244                 call    dword ptr [edx+$44]
004EB98E   5B                     pop     ebx
004EB98F   C3                     ret

*)
end;

procedure TForm1.Next_NaborExecute(Sender : TObject);
begin
(*
004EB990   53                     push    ebx
004EB991   8BD8                   mov     ebx, eax
004EB993   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EB99A   7522                   jnz     004EB9BE

* Reference to TGrafForm instance
|
004EB99C   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EB9A1   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Next_Nabor : TMenuItem
|
004EB9A3   8B8044030000           mov     eax, [eax+$0344]
004EB9A9   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EB9AB   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EB9AE   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EB9B4   E86B57FAFF             call    00491124
004EB9B9   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EB9BB   FF5244                 call    dword ptr [edx+$44]
004EB9BE   5B                     pop     ebx
004EB9BF   C3                     ret

*)
end;

procedure TForm1.Edit_NaborExecute(Sender : TObject);
begin
(*
004EB9C0   53                     push    ebx
004EB9C1   8BD8                   mov     ebx, eax
004EB9C3   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EB9CA   7522                   jnz     004EB9EE

* Reference to TGrafForm instance
|
004EB9CC   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EB9D1   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Edit_Nabor : TMenuItem
|
004EB9D3   8B8048030000           mov     eax, [eax+$0348]
004EB9D9   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EB9DB   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EB9DE   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EB9E4   E83B57FAFF             call    00491124
004EB9E9   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EB9EB   FF5244                 call    dword ptr [edx+$44]
004EB9EE   5B                     pop     ebx
004EB9EF   C3                     ret

*)
end;

procedure TForm1.N_Airbag_SRS0Click(Sender : TObject);
begin
(*
004E3E88   53                     push    ebx
004E3E89   56                     push    esi
004E3E8A   8BD8                   mov     ebx, eax
004E3E8C   C605A76D4F0031         mov     byte ptr [$004F6DA7], $31
004E3E93   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3E95   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E9B   E804EEF8FF             call    00472CA4
004E3EA0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3EA2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3EA8   E8F7EDF8FF             call    00472CA4
004E3EAD   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3EAF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3EB5   E8EAEDF8FF             call    00472CA4
004E3EBA   6A01                   push    $01

* Possible String Reference to: 'SRS'
|
004E3EBC   B9EC3E4E00             mov     ecx, $004E3EEC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3EC1   BAF83E4E00             mov     edx, $004E3EF8
004E3EC6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3ECB   8B30                   mov     esi, [eax]
004E3ECD   FF560C                 call    dword ptr [esi+$0C]
004E3ED0   B204                   mov     dl, $04
004E3ED2   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3ED4   E85FF3FFFF             call    004E3238
004E3ED9   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3EDB   E8B8000000             call    004E3F98
004E3EE0   5E                     pop     esi
004E3EE1   5B                     pop     ebx
004E3EE2   C3                     ret

*)
end;

procedure TForm1.FormResize(Sender : TObject);
begin
(*
004ECBE4   53                     push    ebx
004ECBE5   56                     push    esi
004ECBE6   8BD8                   mov     ebx, eax
004ECBE8   33D2                   xor     edx, edx

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004ECBEA   8BB3B0030000           mov     esi, [ebx+$03B0]
004ECBF0   8BC6                   mov     eax, esi

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004ECBF2   E8DDF4F9FF             call    0048C0D4

* Reference to field TStringGrid.Width : Integer
|
004ECBF7   8B5648                 mov     edx, [esi+$48]
004ECBFA   2BD0                   sub     edx, eax
004ECBFC   52                     push    edx
004ECBFD   BA01000000             mov     edx, $00000001

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004ECC02   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004ECC08   E8C7F4F9FF             call    0048C0D4
004ECC0D   59                     pop     ecx
004ECC0E   2BC8                   sub     ecx, eax
004ECC10   83E907                 sub     ecx, +$07
004ECC13   BA02000000             mov     edx, $00000002
004ECC18   8BC6                   mov     eax, esi

* Reference to: Grids.TCustomGrid.SetColWidths(TCustomGrid;Longint;Integer);
|
004ECC1A   E8EDF5F9FF             call    0048C20C
004ECC1F   5E                     pop     esi
004ECC20   5B                     pop     ebx
004ECC21   C3                     ret

*)
end;

procedure TForm1.N_ABS_BoshClick(Sender : TObject);
begin
(*
004E3C38   53                     push    ebx
004E3C39   56                     push    esi
004E3C3A   8BD8                   mov     ebx, eax
004E3C3C   C605A76D4F0041         mov     byte ptr [$004F6DA7], $41
004E3C43   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3C4A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3C51   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3C5B   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3C5D   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C63   E83CF0F8FF             call    00472CA4
004E3C68   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3C6A   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C70   E82FF0F8FF             call    00472CA4
004E3C75   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3C77   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C7D   E822F0F8FF             call    00472CA4
004E3C82   6A01                   push    $01

* Possible String Reference to: 'ABS'
|
004E3C84   B9B43C4E00             mov     ecx, $004E3CB4

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3C89   BAC03C4E00             mov     edx, $004E3CC0
004E3C8E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3C93   8B30                   mov     esi, [eax]
004E3C95   FF560C                 call    dword ptr [esi+$0C]
004E3C98   B203                   mov     dl, $03
004E3C9A   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3C9C   E897F5FFFF             call    004E3238
004E3CA1   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3CA3   E8F0020000             call    004E3F98
004E3CA8   5E                     pop     esi
004E3CA9   5B                     pop     ebx
004E3CAA   C3                     ret

*)
end;

procedure TForm1.N_ABS_TevesClick(Sender : TObject);
begin
(*
004E3CCC   53                     push    ebx
004E3CCD   56                     push    esi
004E3CCE   8BD8                   mov     ebx, eax
004E3CD0   C605A76D4F0042         mov     byte ptr [$004F6DA7], $42
004E3CD7   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3CDE   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3CE5   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3CEF   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3CF1   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3CF7   E8A8EFF8FF             call    00472CA4
004E3CFC   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3CFE   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D04   E89BEFF8FF             call    00472CA4
004E3D09   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3D0B   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D11   E88EEFF8FF             call    00472CA4
004E3D16   6A02                   push    $02

* Possible String Reference to: 'ABS'
|
004E3D18   B9483D4E00             mov     ecx, $004E3D48

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3D1D   BA543D4E00             mov     edx, $004E3D54
004E3D22   A120724F00             mov     eax, dword ptr [$004F7220]
004E3D27   8B30                   mov     esi, [eax]
004E3D29   FF560C                 call    dword ptr [esi+$0C]
004E3D2C   B203                   mov     dl, $03
004E3D2E   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3D30   E803F5FFFF             call    004E3238
004E3D35   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3D37   E85C020000             call    004E3F98
004E3D3C   5E                     pop     esi
004E3D3D   5B                     pop     ebx
004E3D3E   C3                     ret

*)
end;

procedure TForm1.N_ABS_AVEO1Click(Sender : TObject);
begin
(*
004E3D60   53                     push    ebx
004E3D61   56                     push    esi
004E3D62   8BD8                   mov     ebx, eax
004E3D64   C605A76D4F0043         mov     byte ptr [$004F6DA7], $43
004E3D6B   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3D72   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3D79   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3D83   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3D85   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D8B   E814EFF8FF             call    00472CA4
004E3D90   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3D92   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D98   E807EFF8FF             call    00472CA4
004E3D9D   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3D9F   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3DA5   E8FAEEF8FF             call    00472CA4
004E3DAA   6A03                   push    $03

* Possible String Reference to: 'ABS'
|
004E3DAC   B9DC3D4E00             mov     ecx, $004E3DDC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3DB1   BAE83D4E00             mov     edx, $004E3DE8
004E3DB6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3DBB   8B30                   mov     esi, [eax]
004E3DBD   FF560C                 call    dword ptr [esi+$0C]
004E3DC0   B203                   mov     dl, $03
004E3DC2   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3DC4   E86FF4FFFF             call    004E3238
004E3DC9   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3DCB   E8C8010000             call    004E3F98
004E3DD0   5E                     pop     esi
004E3DD1   5B                     pop     ebx
004E3DD2   C3                     ret

*)
end;

procedure TForm1.N_ABS_AVEO3Click(Sender : TObject);
begin
(*
004E3DF4   53                     push    ebx
004E3DF5   56                     push    esi
004E3DF6   8BD8                   mov     ebx, eax
004E3DF8   C605A76D4F0044         mov     byte ptr [$004F6DA7], $44
004E3DFF   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3E06   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3E0D   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3E17   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3E19   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E1F   E880EEF8FF             call    00472CA4
004E3E24   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3E26   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E2C   E873EEF8FF             call    00472CA4
004E3E31   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3E33   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E39   E866EEF8FF             call    00472CA4
004E3E3E   6A04                   push    $04

* Possible String Reference to: 'ABS'
|
004E3E40   B9703E4E00             mov     ecx, $004E3E70

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3E45   BA7C3E4E00             mov     edx, $004E3E7C
004E3E4A   A120724F00             mov     eax, dword ptr [$004F7220]
004E3E4F   8B30                   mov     esi, [eax]
004E3E51   FF560C                 call    dword ptr [esi+$0C]
004E3E54   B203                   mov     dl, $03
004E3E56   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3E58   E8DBF3FFFF             call    004E3238
004E3E5D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3E5F   E834010000             call    004E3F98
004E3E64   5E                     pop     esi
004E3E65   5B                     pop     ebx
004E3E66   C3                     ret

*)
end;

procedure TForm1.Label_DvigClick(Sender : TObject);
begin
(*
004E35C0   53                     push    ebx
004E35C1   56                     push    esi
004E35C2   83C4F0                 add     esp, -$10
004E35C5   8BD8                   mov     ebx, eax
004E35C7   6A00                   push    $00

* Possible String Reference to: 'Dvig'
|
004E35C9   B960364E00             mov     ecx, $004E3660

* Possible String Reference to: 'Vib_tip_ECU'
|
004E35CE   BA70364E00             mov     edx, $004E3670
004E35D3   A120724F00             mov     eax, dword ptr [$004F7220]
004E35D8   8B30                   mov     esi, [eax]
004E35DA   FF5608                 call    dword ptr [esi+$08]
004E35DD   48                     dec     eax
004E35DE   740B                   jz      004E35EB
004E35E0   48                     dec     eax
004E35E1   7415                   jz      004E35F8
004E35E3   48                     dec     eax
004E35E4   741F                   jz      004E3605
004E35E6   48                     dec     eax
004E35E7   7429                   jz      004E3612
004E35E9   EB34                   jmp     004E361F

* Reference to control TForm1.N_Sirius : TMenuItem
|
004E35EB   8B8360030000           mov     eax, [ebx+$0360]
004E35F1   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E35F3   FF5244                 call    dword ptr [edx+$44]
004E35F6   EB5A                   jmp     004E3652

* Reference to control TForm1.N_MR140 : TMenuItem
|
004E35F8   8B8364030000           mov     eax, [ebx+$0364]
004E35FE   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3600   FF5244                 call    dword ptr [edx+$44]
004E3603   EB4D                   jmp     004E3652

* Reference to control TForm1.N_SiriusD32 : TMenuItem
|
004E3605   8B832C040000           mov     eax, [ebx+$042C]
004E360B   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E360D   FF5244                 call    dword ptr [edx+$44]
004E3610   EB40                   jmp     004E3652

* Reference to control TForm1.N_Bosch : TMenuItem
|
004E3612   8B8334040000           mov     eax, [ebx+$0434]
004E3618   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E361A   FF5244                 call    dword ptr [edx+$44]
004E361D   EB33                   jmp     004E3652
004E361F   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E3621   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E3626   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3628   E8DF7EF8FF             call    0046B50C
004E362D   8B442404               mov     eax, [esp+$04]
004E3631   50                     push    eax
004E3632   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E3636   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E363B   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E363D   E8CA7EF8FF             call    0046B50C
004E3642   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_Dvig : TPopupMenu
|
004E3646   8B83BC030000           mov     eax, [ebx+$03BC]
004E364C   59                     pop     ecx
004E364D   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E364F   FF5340                 call    dword ptr [ebx+$40]
004E3652   83C410                 add     esp, +$10
004E3655   5E                     pop     esi
004E3656   5B                     pop     ebx
004E3657   C3                     ret

*)
end;

procedure TForm1.Label_AKPPClick(Sender : TObject);
begin
(*
004E367C   53                     push    ebx
004E367D   56                     push    esi
004E367E   83C4F0                 add     esp, -$10
004E3681   8BD8                   mov     ebx, eax
004E3683   6A00                   push    $00

* Possible String Reference to: 'AKPP'
|
004E3685   B9FC364E00             mov     ecx, $004E36FC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E368A   BA0C374E00             mov     edx, $004E370C
004E368F   A120724F00             mov     eax, dword ptr [$004F7220]
004E3694   8B30                   mov     esi, [eax]
004E3696   FF5608                 call    dword ptr [esi+$08]
004E3699   48                     dec     eax
004E369A   7405                   jz      004E36A1
004E369C   48                     dec     eax
004E369D   740F                   jz      004E36AE
004E369F   EB1A                   jmp     004E36BB

* Reference to control TForm1.N_Aisin : TMenuItem
|
004E36A1   8B836C030000           mov     eax, [ebx+$036C]
004E36A7   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E36A9   FF5244                 call    dword ptr [edx+$44]
004E36AC   EB40                   jmp     004E36EE

* Reference to control TForm1.N_ZF : TMenuItem
|
004E36AE   8B8368030000           mov     eax, [ebx+$0368]
004E36B4   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E36B6   FF5244                 call    dword ptr [edx+$44]
004E36B9   EB33                   jmp     004E36EE
004E36BB   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E36BD   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E36C2   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E36C4   E8437EF8FF             call    0046B50C
004E36C9   8B442404               mov     eax, [esp+$04]
004E36CD   50                     push    eax
004E36CE   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E36D2   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E36D7   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E36D9   E82E7EF8FF             call    0046B50C
004E36DE   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_AKPP : TPopupMenu
|
004E36E2   8B83C8030000           mov     eax, [ebx+$03C8]
004E36E8   59                     pop     ecx
004E36E9   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E36EB   FF5340                 call    dword ptr [ebx+$40]
004E36EE   83C410                 add     esp, +$10
004E36F1   5E                     pop     esi
004E36F2   5B                     pop     ebx
004E36F3   C3                     ret

*)
end;

procedure TForm1.Label_ABSClick(Sender : TObject);
begin
(*
004E3718   53                     push    ebx
004E3719   56                     push    esi
004E371A   83C4F0                 add     esp, -$10
004E371D   8BD8                   mov     ebx, eax
004E371F   6A00                   push    $00

* Possible String Reference to: 'ABS'
|
004E3721   B9B8374E00             mov     ecx, $004E37B8

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3726   BAC4374E00             mov     edx, $004E37C4
004E372B   A120724F00             mov     eax, dword ptr [$004F7220]
004E3730   8B30                   mov     esi, [eax]
004E3732   FF5608                 call    dword ptr [esi+$08]
004E3735   48                     dec     eax
004E3736   740B                   jz      004E3743
004E3738   48                     dec     eax
004E3739   7415                   jz      004E3750
004E373B   48                     dec     eax
004E373C   741F                   jz      004E375D
004E373E   48                     dec     eax
004E373F   7429                   jz      004E376A
004E3741   EB34                   jmp     004E3777

* Reference to control TForm1.N_ABS_Bosh : TMenuItem
|
004E3743   8B83B4030000           mov     eax, [ebx+$03B4]
004E3749   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E374B   FF5244                 call    dword ptr [edx+$44]
004E374E   EB5A                   jmp     004E37AA

* Reference to control TForm1.N_ABS_Teves : TMenuItem
|
004E3750   8B83B8030000           mov     eax, [ebx+$03B8]
004E3756   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3758   FF5244                 call    dword ptr [edx+$44]
004E375B   EB4D                   jmp     004E37AA

* Reference to control TForm1.N_ABS_AVEO1 : TMenuItem
|
004E375D   8B83F4030000           mov     eax, [ebx+$03F4]
004E3763   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3765   FF5244                 call    dword ptr [edx+$44]
004E3768   EB40                   jmp     004E37AA

* Reference to control TForm1.N_ABS_AVEO3 : TMenuItem
|
004E376A   8B83F8030000           mov     eax, [ebx+$03F8]
004E3770   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3772   FF5244                 call    dword ptr [edx+$44]
004E3775   EB33                   jmp     004E37AA
004E3777   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E3779   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E377E   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3780   E8877DF8FF             call    0046B50C
004E3785   8B442404               mov     eax, [esp+$04]
004E3789   50                     push    eax
004E378A   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E378E   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E3793   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3795   E8727DF8FF             call    0046B50C
004E379A   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_ABS : TPopupMenu
|
004E379E   8B83D4030000           mov     eax, [ebx+$03D4]
004E37A4   59                     pop     ecx
004E37A5   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E37A7   FF5340                 call    dword ptr [ebx+$40]
004E37AA   83C410                 add     esp, +$10
004E37AD   5E                     pop     esi
004E37AE   5B                     pop     ebx
004E37AF   C3                     ret

*)
end;

procedure TForm1.SecurityAccess(Sender : TObject);
begin
(*
004ECC24   53                     push    ebx
004ECC25   56                     push    esi
004ECC26   57                     push    edi
004ECC27   55                     push    ebp
004ECC28   83C4EC                 add     esp, -$14
004ECC2B   8BF0                   mov     esi, eax
004ECC2D   33DB                   xor     ebx, ebx
004ECC2F   33FF                   xor     edi, edi

* Reference to: kernel32.GetTickCount()
|
004ECC31   E81AA4F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004ECC36   A3986D4F00             mov     dword ptr [$004F6D98], eax
004ECC3B   EB0C                   jmp     004ECC49

* Reference to TApplication instance
|
004ECC3D   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004ECC42   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ECC44   E89B3BF9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004ECC49   E802A4F1FF             call    00407050
004ECC4E   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004ECC54   83F864                 cmp     eax, +$64
004ECC57   72E4                   jb      004ECC3D
004ECC59   6A12                   push    $12
004ECC5B   C644240882             mov     byte ptr [esp+$08], $82
004ECC60   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ECC65   88442409               mov     [esp+$09], al
004ECC69   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ECC6E   8844240A               mov     [esp+$0A], al
004ECC72   C644240B27             mov     byte ptr [esp+$0B], $27
004ECC77   C644240C01             mov     byte ptr [esp+$0C], $01
004ECC7C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ECC81   8844240D               mov     [esp+$0D], al
004ECC85   8D542408               lea     edx, [esp+$08]
004ECC89   B905000000             mov     ecx, $00000005
004ECC8E   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004ECC90   E8AB61FFFF             call    004E2E40
004ECC95   0FB62D036E4F00         movzx   ebp, byte ptr [$004F6E03]
004ECC9C   33C0                   xor     eax, eax
004ECC9E   A0046E4F00             mov     al, byte ptr [$004F6E04]
004ECCA3   47                     inc     edi
004ECCA4   83FF14                 cmp     edi, +$14
004ECCA7   0F8F00050000           jnle    004ED1AD
004ECCAD   8BD5                   mov     edx, ebp
004ECCAF   85D2                   test    edx, edx
004ECCB1   7903                   jns     004ECCB6
004ECCB3   83C20F                 add     edx, +$0F
004ECCB6   C1FA04                 sar     edx, $04
004ECCB9   83C2FE                 add     edx, -$02
004ECCBC   83EA02                 sub     edx, +$02
004ECCBF   0F826CFFFFFF           jb      004ECC31
004ECCC5   83C2FE                 add     edx, -$02
004ECCC8   83EA02                 sub     edx, +$02
004ECCCB   0F8260FFFFFF           jb      004ECC31
004ECCD1   83C2FE                 add     edx, -$02
004ECCD4   83EA02                 sub     edx, +$02
004ECCD7   0F8254FFFFFF           jb      004ECC31
004ECCDD   83C2FE                 add     edx, -$02
004ECCE0   83EA02                 sub     edx, +$02
004ECCE3   0F8248FFFFFF           jb      004ECC31
004ECCE9   8BD5                   mov     edx, ebp
004ECCEB   81E201000080           and     edx, $80000001
004ECCF1   7905                   jns     004ECCF8
004ECCF3   4A                     dec     edx
004ECCF4   83CAFE                 or      edx, -$02
004ECCF7   42                     inc     edx
004ECCF8   85D2                   test    edx, edx
004ECCFA   0F8F31FFFFFF           jnle    004ECC31
004ECD00   8BD5                   mov     edx, ebp
004ECD02   85D2                   test    edx, edx
004ECD04   7903                   jns     004ECD09
004ECD06   83C20F                 add     edx, +$0F
004ECD09   C1FA04                 sar     edx, $04
004ECD0C   83FA07                 cmp     edx, +$07
004ECD0F   7E07                   jle     004ECD18
004ECD11   BA02000000             mov     edx, $00000002
004ECD16   EB02                   jmp     004ECD1A
004ECD18   33D2                   xor     edx, edx
004ECD1A   8BCD                   mov     ecx, ebp
004ECD1C   81E10F000080           and     ecx, $8000000F
004ECD22   7905                   jns     004ECD29
004ECD24   49                     dec     ecx
004ECD25   83C9F0                 or      ecx, -$10
004ECD28   41                     inc     ecx
004ECD29   83F907                 cmp     ecx, +$07
004ECD2C   7E07                   jle     004ECD35
004ECD2E   B901000000             mov     ecx, $00000001
004ECD33   EB02                   jmp     004ECD37
004ECD35   33C9                   xor     ecx, ecx
004ECD37   8BD8                   mov     ebx, eax
004ECD39   81E30F000080           and     ebx, $8000000F
004ECD3F   7905                   jns     004ECD46
004ECD41   4B                     dec     ebx
004ECD42   83CBF0                 or      ebx, -$10
004ECD45   43                     inc     ebx
004ECD46   83FB07                 cmp     ebx, +$07
004ECD49   7E11                   jle     004ECD5C
004ECD4B   8BD8                   mov     ebx, eax
004ECD4D   85DB                   test    ebx, ebx
004ECD4F   7903                   jns     004ECD54
004ECD51   83C30F                 add     ebx, +$0F
004ECD54   C1FB04                 sar     ebx, $04
004ECD57   83FB08                 cmp     ebx, +$08
004ECD5A   7C25                   jl      004ECD81
004ECD5C   8BD8                   mov     ebx, eax
004ECD5E   81E30F000080           and     ebx, $8000000F
004ECD64   7905                   jns     004ECD6B
004ECD66   4B                     dec     ebx
004ECD67   83CBF0                 or      ebx, -$10
004ECD6A   43                     inc     ebx
004ECD6B   83FB08                 cmp     ebx, +$08
004ECD6E   7D18                   jnl     004ECD88
004ECD70   8BD8                   mov     ebx, eax
004ECD72   85DB                   test    ebx, ebx
004ECD74   7903                   jns     004ECD79
004ECD76   83C30F                 add     ebx, +$0F
004ECD79   C1FB04                 sar     ebx, $04
004ECD7C   83FB07                 cmp     ebx, +$07
004ECD7F   7E07                   jle     004ECD88
004ECD81   BF01000000             mov     edi, $00000001
004ECD86   EB02                   jmp     004ECD8A
004ECD88   33FF                   xor     edi, edi
004ECD8A   8BDD                   mov     ebx, ebp
004ECD8C   81E30F000080           and     ebx, $8000000F
004ECD92   7905                   jns     004ECD99
004ECD94   4B                     dec     ebx
004ECD95   83CBF0                 or      ebx, -$10
004ECD98   43                     inc     ebx
004ECD99   83FB07                 cmp     ebx, +$07
004ECD9C   7E25                   jle     004ECDC3
004ECD9E   8BD8                   mov     ebx, eax
004ECDA0   85DB                   test    ebx, ebx
004ECDA2   7903                   jns     004ECDA7
004ECDA4   83C30F                 add     ebx, +$0F
004ECDA7   C1FB04                 sar     ebx, $04
004ECDAA   83FB07                 cmp     ebx, +$07
004ECDAD   7E14                   jle     004ECDC3
004ECDAF   8BD8                   mov     ebx, eax
004ECDB1   81E30F000080           and     ebx, $8000000F
004ECDB7   7905                   jns     004ECDBE
004ECDB9   4B                     dec     ebx
004ECDBA   83CBF0                 or      ebx, -$10
004ECDBD   43                     inc     ebx
004ECDBE   83FB08                 cmp     ebx, +$08
004ECDC1   7C39                   jl      004ECDFC
004ECDC3   8BDD                   mov     ebx, ebp
004ECDC5   81E30F000080           and     ebx, $8000000F
004ECDCB   7905                   jns     004ECDD2
004ECDCD   4B                     dec     ebx
004ECDCE   83CBF0                 or      ebx, -$10
004ECDD1   43                     inc     ebx
004ECDD2   83FB07                 cmp     ebx, +$07
004ECDD5   7E2E                   jle     004ECE05
004ECDD7   8BD8                   mov     ebx, eax
004ECDD9   85DB                   test    ebx, ebx
004ECDDB   7903                   jns     004ECDE0
004ECDDD   83C30F                 add     ebx, +$0F
004ECDE0   C1FB04                 sar     ebx, $04
004ECDE3   83FB08                 cmp     ebx, +$08
004ECDE6   7D1D                   jnl     004ECE05
004ECDE8   8BD8                   mov     ebx, eax
004ECDEA   81E30F000080           and     ebx, $8000000F
004ECDF0   7905                   jns     004ECDF7
004ECDF2   4B                     dec     ebx
004ECDF3   83CBF0                 or      ebx, -$10
004ECDF6   43                     inc     ebx
004ECDF7   83FB07                 cmp     ebx, +$07
004ECDFA   7E09                   jle     004ECE05
004ECDFC   C70424FEFFFFFF         mov     dword ptr [esp], $FFFFFFFE
004ECE03   EB05                   jmp     004ECE0A
004ECE05   33DB                   xor     ebx, ebx
004ECE07   891C24                 mov     [esp], ebx
004ECE0A   8BDD                   mov     ebx, ebp
004ECE0C   C1E302                 shl     ebx, $02
004ECE0F   03D3                   add     edx, ebx
004ECE11   03CA                   add     ecx, edx
004ECE13   03F9                   add     edi, ecx
004ECE15   033C24                 add     edi, [esp]
004ECE18   33DB                   xor     ebx, ebx
004ECE1A   8BD5                   mov     edx, ebp
004ECE1C   85D2                   test    edx, edx
004ECE1E   7903                   jns     004ECE23
004ECE20   83C20F                 add     edx, +$0F
004ECE23   C1FA04                 sar     edx, $04
004ECE26   81E201000080           and     edx, $80000001
004ECE2C   7905                   jns     004ECE33
004ECE2E   4A                     dec     edx
004ECE2F   83CAFE                 or      edx, -$02
004ECE32   42                     inc     edx
004ECE33   85D2                   test    edx, edx
004ECE35   7523                   jnz     004ECE5A
004ECE37   8BD5                   mov     edx, ebp
004ECE39   81E20F000080           and     edx, $8000000F
004ECE3F   7905                   jns     004ECE46
004ECE41   4A                     dec     edx
004ECE42   83CAF0                 or      edx, -$10
004ECE45   42                     inc     edx
004ECE46   83EA04                 sub     edx, +$04
004ECE49   7456                   jz      004ECEA1
004ECE4B   83EA02                 sub     edx, +$02
004ECE4E   7451                   jz      004ECEA1
004ECE50   83EA02                 sub     edx, +$02
004ECE53   744C                   jz      004ECEA1
004ECE55   83EA02                 sub     edx, +$02
004ECE58   7447                   jz      004ECEA1
004ECE5A   8BD5                   mov     edx, ebp
004ECE5C   85D2                   test    edx, edx
004ECE5E   7903                   jns     004ECE63
004ECE60   83C20F                 add     edx, +$0F
004ECE63   C1FA04                 sar     edx, $04
004ECE66   81E201000080           and     edx, $80000001
004ECE6C   7905                   jns     004ECE73
004ECE6E   4A                     dec     edx
004ECE6F   83CAFE                 or      edx, -$02
004ECE72   42                     inc     edx
004ECE73   85D2                   test    edx, edx
004ECE75   0F8E32010000           jle     004ECFAD
004ECE7B   8BD5                   mov     edx, ebp
004ECE7D   81E20F000080           and     edx, $8000000F
004ECE83   7905                   jns     004ECE8A
004ECE85   4A                     dec     edx
004ECE86   83CAF0                 or      edx, -$10
004ECE89   42                     inc     edx
004ECE8A   85D2                   test    edx, edx
004ECE8C   7413                   jz      004ECEA1
004ECE8E   83EA02                 sub     edx, +$02
004ECE91   740E                   jz      004ECEA1
004ECE93   83EA0A                 sub     edx, +$0A
004ECE96   7409                   jz      004ECEA1
004ECE98   83EA02                 sub     edx, +$02
004ECE9B   0F850C010000           jnz     004ECFAD
004ECEA1   8BD0                   mov     edx, eax
004ECEA3   81E201000080           and     edx, $80000001
004ECEA9   7905                   jns     004ECEB0
004ECEAB   4A                     dec     edx
004ECEAC   83CAFE                 or      edx, -$02
004ECEAF   42                     inc     edx
004ECEB0   85D2                   test    edx, edx
004ECEB2   7E1C                   jle     004ECED0
004ECEB4   8BD0                   mov     edx, eax
004ECEB6   85D2                   test    edx, edx
004ECEB8   7903                   jns     004ECEBD
004ECEBA   83C20F                 add     edx, +$0F
004ECEBD   C1FA04                 sar     edx, $04
004ECEC0   83C2FA                 add     edx, -$06
004ECEC3   83EA02                 sub     edx, +$02
004ECEC6   7237                   jb      004ECEFF
004ECEC8   83C2FA                 add     edx, -$06
004ECECB   83EA02                 sub     edx, +$02
004ECECE   722F                   jb      004ECEFF
004ECED0   8BD0                   mov     edx, eax
004ECED2   81E201000080           and     edx, $80000001
004ECED8   7905                   jns     004ECEDF
004ECEDA   4A                     dec     edx
004ECEDB   83CAFE                 or      edx, -$02
004ECEDE   42                     inc     edx
004ECEDF   85D2                   test    edx, edx
004ECEE1   7538                   jnz     004ECF1B
004ECEE3   8BD0                   mov     edx, eax
004ECEE5   85D2                   test    edx, edx
004ECEE7   7903                   jns     004ECEEC
004ECEE9   83C20F                 add     edx, +$0F
004ECEEC   C1FA04                 sar     edx, $04
004ECEEF   83C2FE                 add     edx, -$02
004ECEF2   83EA02                 sub     edx, +$02
004ECEF5   7208                   jb      004ECEFF
004ECEF7   83C2FA                 add     edx, -$06
004ECEFA   83EA02                 sub     edx, +$02
004ECEFD   731C                   jnb     004ECF1B
004ECEFF   8BD0                   mov     edx, eax
004ECF01   C1E203                 shl     edx, $03
004ECF04   8BDA                   mov     ebx, edx
004ECF06   85D2                   test    edx, edx
004ECF08   7906                   jns     004ECF10
004ECF0A   81C2FF000000           add     edx, $000000FF
004ECF10   C1FA08                 sar     edx, $08
004ECF13   03DA                   add     ebx, edx
004ECF15   4B                     dec     ebx
004ECF16   E91B020000             jmp     004ED136
004ECF1B   8BD0                   mov     edx, eax
004ECF1D   81E201000080           and     edx, $80000001
004ECF23   7905                   jns     004ECF2A
004ECF25   4A                     dec     edx
004ECF26   83CAFE                 or      edx, -$02
004ECF29   42                     inc     edx
004ECF2A   85D2                   test    edx, edx
004ECF2C   7519                   jnz     004ECF47
004ECF2E   8BD0                   mov     edx, eax
004ECF30   85D2                   test    edx, edx
004ECF32   7903                   jns     004ECF37
004ECF34   83C20F                 add     edx, +$0F
004ECF37   C1FA04                 sar     edx, $04
004ECF3A   83EA02                 sub     edx, +$02
004ECF3D   7237                   jb      004ECF76
004ECF3F   83C2FA                 add     edx, -$06
004ECF42   83EA02                 sub     edx, +$02
004ECF45   722F                   jb      004ECF76
004ECF47   8BD0                   mov     edx, eax
004ECF49   81E201000080           and     edx, $80000001
004ECF4F   7905                   jns     004ECF56
004ECF51   4A                     dec     edx
004ECF52   83CAFE                 or      edx, -$02
004ECF55   42                     inc     edx
004ECF56   85D2                   test    edx, edx
004ECF58   7E38                   jle     004ECF92
004ECF5A   8BD0                   mov     edx, eax
004ECF5C   85D2                   test    edx, edx
004ECF5E   7903                   jns     004ECF63
004ECF60   83C20F                 add     edx, +$0F
004ECF63   C1FA04                 sar     edx, $04
004ECF66   83C2FC                 add     edx, -$04
004ECF69   83EA02                 sub     edx, +$02
004ECF6C   7208                   jb      004ECF76
004ECF6E   83C2FA                 add     edx, -$06
004ECF71   83EA02                 sub     edx, +$02
004ECF74   731C                   jnb     004ECF92
004ECF76   8BD0                   mov     edx, eax
004ECF78   C1E203                 shl     edx, $03
004ECF7B   8BDA                   mov     ebx, edx
004ECF7D   85D2                   test    edx, edx
004ECF7F   7906                   jns     004ECF87
004ECF81   81C2FF000000           add     edx, $000000FF
004ECF87   C1FA08                 sar     edx, $08
004ECF8A   03DA                   add     ebx, edx
004ECF8C   43                     inc     ebx
004ECF8D   E9A4010000             jmp     004ED136
004ECF92   8BD0                   mov     edx, eax
004ECF94   C1E203                 shl     edx, $03
004ECF97   8BDA                   mov     ebx, edx
004ECF99   85D2                   test    edx, edx
004ECF9B   7906                   jns     004ECFA3
004ECF9D   81C2FF000000           add     edx, $000000FF
004ECFA3   C1FA08                 sar     edx, $08
004ECFA6   03DA                   add     ebx, edx
004ECFA8   E989010000             jmp     004ED136
004ECFAD   8BD5                   mov     edx, ebp
004ECFAF   85D2                   test    edx, edx
004ECFB1   7903                   jns     004ECFB6
004ECFB3   83C20F                 add     edx, +$0F
004ECFB6   C1FA04                 sar     edx, $04
004ECFB9   81E201000080           and     edx, $80000001
004ECFBF   7905                   jns     004ECFC6
004ECFC1   4A                     dec     edx
004ECFC2   83CAFE                 or      edx, -$02
004ECFC5   42                     inc     edx
004ECFC6   85D2                   test    edx, edx
004ECFC8   7522                   jnz     004ECFEC
004ECFCA   8BD5                   mov     edx, ebp
004ECFCC   81E20F000080           and     edx, $8000000F
004ECFD2   7905                   jns     004ECFD9
004ECFD4   4A                     dec     edx
004ECFD5   83CAF0                 or      edx, -$10
004ECFD8   42                     inc     edx
004ECFD9   85D2                   test    edx, edx
004ECFDB   7455                   jz      004ED032
004ECFDD   83EA02                 sub     edx, +$02
004ECFE0   7450                   jz      004ED032
004ECFE2   83EA0A                 sub     edx, +$0A
004ECFE5   744B                   jz      004ED032
004ECFE7   83EA02                 sub     edx, +$02
004ECFEA   7446                   jz      004ED032
004ECFEC   8BD5                   mov     edx, ebp
004ECFEE   85D2                   test    edx, edx
004ECFF0   7903                   jns     004ECFF5
004ECFF2   83C20F                 add     edx, +$0F
004ECFF5   C1FA04                 sar     edx, $04
004ECFF8   81E201000080           and     edx, $80000001
004ECFFE   7905                   jns     004ED005
004ED000   4A                     dec     edx
004ED001   83CAFE                 or      edx, -$02
004ED004   42                     inc     edx
004ED005   85D2                   test    edx, edx
004ED007   0F8E29010000           jle     004ED136
004ED00D   81E50F000080           and     ebp, $8000000F
004ED013   7905                   jns     004ED01A
004ED015   4D                     dec     ebp
004ED016   83CDF0                 or      ebp, -$10
004ED019   45                     inc     ebp
004ED01A   83ED04                 sub     ebp, +$04
004ED01D   7413                   jz      004ED032
004ED01F   83ED02                 sub     ebp, +$02
004ED022   740E                   jz      004ED032
004ED024   83ED02                 sub     ebp, +$02
004ED027   7409                   jz      004ED032
004ED029   83ED02                 sub     ebp, +$02
004ED02C   0F8504010000           jnz     004ED136
004ED032   8BD0                   mov     edx, eax
004ED034   81E201000080           and     edx, $80000001
004ED03A   7905                   jns     004ED041
004ED03C   4A                     dec     edx
004ED03D   83CAFE                 or      edx, -$02
004ED040   42                     inc     edx
004ED041   85D2                   test    edx, edx
004ED043   751C                   jnz     004ED061
004ED045   8BD0                   mov     edx, eax
004ED047   85D2                   test    edx, edx
004ED049   7903                   jns     004ED04E
004ED04B   83C20F                 add     edx, +$0F
004ED04E   C1FA04                 sar     edx, $04
004ED051   83C2FA                 add     edx, -$06
004ED054   83EA02                 sub     edx, +$02
004ED057   7237                   jb      004ED090
004ED059   83C2FA                 add     edx, -$06
004ED05C   83EA02                 sub     edx, +$02
004ED05F   722F                   jb      004ED090
004ED061   8BD0                   mov     edx, eax
004ED063   81E201000080           and     edx, $80000001
004ED069   7905                   jns     004ED070
004ED06B   4A                     dec     edx
004ED06C   83CAFE                 or      edx, -$02
004ED06F   42                     inc     edx
004ED070   85D2                   test    edx, edx
004ED072   7E38                   jle     004ED0AC
004ED074   8BD0                   mov     edx, eax
004ED076   85D2                   test    edx, edx
004ED078   7903                   jns     004ED07D
004ED07A   83C20F                 add     edx, +$0F
004ED07D   C1FA04                 sar     edx, $04
004ED080   83C2FE                 add     edx, -$02
004ED083   83EA02                 sub     edx, +$02
004ED086   7208                   jb      004ED090
004ED088   83C2FA                 add     edx, -$06
004ED08B   83EA02                 sub     edx, +$02
004ED08E   731C                   jnb     004ED0AC
004ED090   8BD0                   mov     edx, eax
004ED092   C1E203                 shl     edx, $03
004ED095   8BDA                   mov     ebx, edx
004ED097   85D2                   test    edx, edx
004ED099   7906                   jns     004ED0A1
004ED09B   81C2FF000000           add     edx, $000000FF
004ED0A1   C1FA08                 sar     edx, $08
004ED0A4   03DA                   add     ebx, edx
004ED0A6   4B                     dec     ebx
004ED0A7   E98A000000             jmp     004ED136
004ED0AC   8BD0                   mov     edx, eax
004ED0AE   81E201000080           and     edx, $80000001
004ED0B4   7905                   jns     004ED0BB
004ED0B6   4A                     dec     edx
004ED0B7   83CAFE                 or      edx, -$02
004ED0BA   42                     inc     edx
004ED0BB   85D2                   test    edx, edx
004ED0BD   7E19                   jle     004ED0D8
004ED0BF   8BD0                   mov     edx, eax
004ED0C1   85D2                   test    edx, edx
004ED0C3   7903                   jns     004ED0C8
004ED0C5   83C20F                 add     edx, +$0F
004ED0C8   C1FA04                 sar     edx, $04
004ED0CB   83EA02                 sub     edx, +$02
004ED0CE   7237                   jb      004ED107
004ED0D0   83C2FA                 add     edx, -$06
004ED0D3   83EA02                 sub     edx, +$02
004ED0D6   722F                   jb      004ED107
004ED0D8   8BD0                   mov     edx, eax
004ED0DA   81E201000080           and     edx, $80000001
004ED0E0   7905                   jns     004ED0E7
004ED0E2   4A                     dec     edx
004ED0E3   83CAFE                 or      edx, -$02
004ED0E6   42                     inc     edx
004ED0E7   85D2                   test    edx, edx
004ED0E9   7535                   jnz     004ED120
004ED0EB   8BD0                   mov     edx, eax
004ED0ED   85D2                   test    edx, edx
004ED0EF   7903                   jns     004ED0F4
004ED0F1   83C20F                 add     edx, +$0F
004ED0F4   C1FA04                 sar     edx, $04
004ED0F7   83C2FC                 add     edx, -$04
004ED0FA   83EA02                 sub     edx, +$02
004ED0FD   7208                   jb      004ED107
004ED0FF   83C2FA                 add     edx, -$06
004ED102   83EA02                 sub     edx, +$02
004ED105   7319                   jnb     004ED120
004ED107   8BD0                   mov     edx, eax
004ED109   C1E203                 shl     edx, $03
004ED10C   8BDA                   mov     ebx, edx
004ED10E   85D2                   test    edx, edx
004ED110   7906                   jns     004ED118
004ED112   81C2FF000000           add     edx, $000000FF
004ED118   C1FA08                 sar     edx, $08
004ED11B   03DA                   add     ebx, edx
004ED11D   43                     inc     ebx
004ED11E   EB16                   jmp     004ED136
004ED120   8BD0                   mov     edx, eax
004ED122   C1E203                 shl     edx, $03
004ED125   8BDA                   mov     ebx, edx
004ED127   85D2                   test    edx, edx
004ED129   7906                   jns     004ED131
004ED12B   81C2FF000000           add     edx, $000000FF
004ED131   C1FA08                 sar     edx, $08
004ED134   03DA                   add     ebx, edx

* Reference to: kernel32.GetTickCount()
|
004ED136   E8159FF1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004ED13B   A3986D4F00             mov     dword ptr [$004F6D98], eax
004ED140   EB0C                   jmp     004ED14E

* Reference to TApplication instance
|
004ED142   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004ED147   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ED149   E89636F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004ED14E   E8FD9EF1FF             call    00407050
004ED153   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004ED159   83F864                 cmp     eax, +$64
004ED15C   72E4                   jb      004ED142
004ED15E   6A12                   push    $12
004ED160   C644241084             mov     byte ptr [esp+$10], $84
004ED165   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED16A   88442411               mov     [esp+$11], al
004ED16E   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED173   88442412               mov     [esp+$12], al
004ED177   C644241327             mov     byte ptr [esp+$13], $27
004ED17C   C644241402             mov     byte ptr [esp+$14], $02
004ED181   8BC7                   mov     eax, edi
004ED183   88442415               mov     [esp+$15], al
004ED187   885C2416               mov     [esp+$16], bl
004ED18B   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED190   88442417               mov     [esp+$17], al
004ED194   8D542410               lea     edx, [esp+$10]
004ED198   B907000000             mov     ecx, $00000007
004ED19D   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004ED19F   E89C5CFFFF             call    004E2E40
004ED1A4   B301                   mov     bl, $01
004ED1A6   C60524724F0001         mov     byte ptr [$004F7224], $01
004ED1AD   8BC3                   mov     eax, ebx
004ED1AF   83C414                 add     esp, +$14
004ED1B2   5D                     pop     ebp
004ED1B3   5F                     pop     edi
004ED1B4   5E                     pop     esi
004ED1B5   5B                     pop     ebx
004ED1B6   C3                     ret

*)
end;

procedure TForm1.Button_SbrosClick(Sender : TObject);
begin
(*
004ED1B8   53                     push    ebx
004ED1B9   83C4F0                 add     esp, -$10
004ED1BC   8BD8                   mov     ebx, eax
004ED1BE   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004ED1C3   2C11                   sub     al, $11
004ED1C5   7408                   jz      004ED1CF
004ED1C7   2C02                   sub     al, $02
004ED1C9   0F859A000000           jnz     004ED269
004ED1CF   6834000400             push    $00040034
004ED1D4   6838605400             push    $00546038
004ED1D9   6844605400             push    $00546044
004ED1DE   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED1E0   E883A6F1FF             call    00407868
004ED1E5   83F806                 cmp     eax, +$06
004ED1E8   0F852C010000           jnz     004ED31A
004ED1EE   803D24724F0001         cmp     byte ptr [$004F7224], $01
004ED1F5   7414                   jz      004ED20B
004ED1F7   803D24724F0000         cmp     byte ptr [$004F7224], $00
004ED1FE   754E                   jnz     004ED24E
004ED200   8BC3                   mov     eax, ebx

* Reference to : TForm1.SecurityAccess()
|
004ED202   E81DFAFFFF             call    004ECC24
004ED207   84C0                   test    al, al
004ED209   7443                   jz      004ED24E
004ED20B   6A0E                   push    $0E
004ED20D   C644240483             mov     byte ptr [esp+$04], $83
004ED212   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED217   88442405               mov     [esp+$05], al
004ED21B   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED220   88442406               mov     [esp+$06], al
004ED224   C644240730             mov     byte ptr [esp+$07], $30
004ED229   C644240850             mov     byte ptr [esp+$08], $50
004ED22E   C644240904             mov     byte ptr [esp+$09], $04
004ED233   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED238   8844240A               mov     [esp+$0A], al
004ED23C   8D542404               lea     edx, [esp+$04]
004ED240   B906000000             mov     ecx, $00000006
004ED245   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED247   E8F45BFFFF             call    004E2E40
004ED24C   EB76                   jmp     004ED2C4
004ED24E   6810000400             push    $00040010
004ED253   68785B5400             push    $00545B78
004ED258   68B85B5400             push    $00545BB8
004ED25D   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED25F   E804A6F1FF             call    00407868
004ED264   E9B1000000             jmp     004ED31A
004ED269   6834000400             push    $00040034
004ED26E   6838605400             push    $00546038
004ED273   6890605400             push    $00546090
004ED278   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED27A   E8E9A5F1FF             call    00407868
004ED27F   83F806                 cmp     eax, +$06
004ED282   0F8592000000           jnz     004ED31A
004ED288   6A0C                   push    $0C
004ED28A   C644240C82             mov     byte ptr [esp+$0C], $82
004ED28F   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED294   8844240D               mov     [esp+$0D], al
004ED298   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED29D   8844240E               mov     [esp+$0E], al
004ED2A1   C644240F11             mov     byte ptr [esp+$0F], $11
004ED2A6   C644241001             mov     byte ptr [esp+$10], $01
004ED2AB   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED2B0   88442411               mov     [esp+$11], al
004ED2B4   8D54240C               lea     edx, [esp+$0C]
004ED2B8   B905000000             mov     ecx, $00000005
004ED2BD   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED2BF   E87C5BFFFF             call    004E2E40
004ED2C4   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004ED2C9   2C11                   sub     al, $11
004ED2CB   7404                   jz      004ED2D1
004ED2CD   2C02                   sub     al, $02
004ED2CF   7509                   jnz     004ED2DA
004ED2D1   803D026E4F0070         cmp     byte ptr [$004F6E02], $70
004ED2D8   7512                   jnz     004ED2EC
004ED2DA   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004ED2E1   7521                   jnz     004ED304
004ED2E3   803D016E4F0051         cmp     byte ptr [$004F6E01], $51
004ED2EA   7418                   jz      004ED304
004ED2EC   6810000400             push    $00040010
004ED2F1   68785B5400             push    $00545B78
004ED2F6   68F4605400             push    $005460F4
004ED2FB   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED2FD   E866A5F1FF             call    00407868
004ED302   EB16                   jmp     004ED31A
004ED304   6840000400             push    $00040040
004ED309   682C615400             push    $0054612C
004ED30E   6838615400             push    $00546138
004ED313   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED315   E84EA5F1FF             call    00407868
004ED31A   83C410                 add     esp, +$10
004ED31D   5B                     pop     ebx
004ED31E   C3                     ret

*)
end;

procedure TForm1.Button_ObuchenieClick(Sender : TObject);
begin
(*
004ED454   53                     push    ebx
004ED455   56                     push    esi
004ED456   83C4F8                 add     esp, -$08
004ED459   8BD8                   mov     ebx, eax
004ED45B   BEC86D4F00             mov     esi, $004F6DC8
004ED460   6834000400             push    $00040034
004ED465   6838605400             push    $00546038
004ED46A   6854615400             push    $00546154
004ED46F   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED471   E8F2A3F1FF             call    00407868
004ED476   83F806                 cmp     eax, +$06
004ED479   0F8576020000           jnz     004ED6F5
004ED47F   6A10                   push    $10
004ED481   C644240484             mov     byte ptr [esp+$04], $84
004ED486   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED48B   88442405               mov     [esp+$05], al
004ED48F   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED494   88442406               mov     [esp+$06], al
004ED498   C644240730             mov     byte ptr [esp+$07], $30
004ED49D   C64424082C             mov     byte ptr [esp+$08], $2C
004ED4A2   C644240907             mov     byte ptr [esp+$09], $07
004ED4A7   C644240AFF             mov     byte ptr [esp+$0A], $FF
004ED4AC   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED4B1   8844240B               mov     [esp+$0B], al
004ED4B5   8D542404               lea     edx, [esp+$04]
004ED4B9   B907000000             mov     ecx, $00000007
004ED4BE   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED4C0   E87B59FFFF             call    004E2E40
004ED4C5   803D036E4F0070         cmp     byte ptr [$004F6E03], $70
004ED4CC   740C                   jz      004ED4DA
004ED4CE   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED4D0   E8F3C0FFFF             call    004E95C8
004ED4D5   E91B020000             jmp     004ED6F5
004ED4DA   6A01                   push    $01
004ED4DC   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004ED4E1   50                     push    eax
004ED4E2   8B06                   mov     eax, [esi]
004ED4E4   50                     push    eax
004ED4E5   B929000000             mov     ecx, $00000029
004ED4EA   BAF0000000             mov     edx, $000000F0
004ED4EF   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004ED4F1   E81E92FFFF             call    004E6714
004ED4F6   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004ED4FD   740C                   jz      004ED50B
004ED4FF   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED501   E8C2C0FFFF             call    004E95C8
004ED506   E9EA010000             jmp     004ED6F5
004ED50B   6B064C                 imul    eax, [esi], $4C
004ED50E   8B15F86E4F00           mov     edx, [$004F6EF8]
004ED514   DD44C248               fld     qword ptr [edx+eax*8+$48]
004ED518   D81DDCD74E00           fcomp   dword ptr [$004ED7DC]
004ED51E   DFE0                   fstsw   ax
004ED520   9E                     sahf
004ED521   731B                   jnb     004ED53E
004ED523   6840000400             push    $00040040
004ED528   68785B5400             push    $00545B78
004ED52D   682C625400             push    $0054622C
004ED532   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED534   E82FA3F1FF             call    00407868
004ED539   E9B7010000             jmp     004ED6F5
004ED53E   33C0                   xor     eax, eax

* Reference to GlobalVar_004F7230
|
004ED540   A330724F00             mov     dword ptr [$004F7230], eax

* Reference to TFormProgress instance
|
004ED545   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED54A   8B00                   mov     eax, [eax]
004ED54C   BAE85A5400             mov     edx, $00545AE8

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED551   E83E2DF7FF             call    00460294

* Reference to TFormProgress instance
|
004ED556   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED55B   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004ED55D   8B80FC020000           mov     eax, [eax+$02FC]
004ED563   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED565   E81A2CF7FF             call    00460184

* Reference to TFormProgress instance
|
004ED56A   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED56F   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED571   8B8000030000           mov     eax, [eax+$0300]
004ED577   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED579   E8062CF7FF             call    00460184

* Reference to TFormProgress instance
|
004ED57E   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED583   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED585   8B8000030000           mov     eax, [eax+$0300]
004ED58B   BA085B5400             mov     edx, $00545B08

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED590   E8FF2CF7FF             call    00460294

* Reference to TFormProgress instance
|
004ED595   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED59A   8B00                   mov     eax, [eax]
004ED59C   B201                   mov     dl, $01

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED59E   E841C9F8FF             call    00479EE4

* Reference to TApplication instance
|
004ED5A3   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004ED5A8   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ED5AA   E83532F9FF             call    004807E4
004ED5AF   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004ED5B1   E8C60DF2FF             call    0040E37C
004ED5B6   803D1E724F0001         cmp     byte ptr [$004F721E], $01
004ED5BD   7513                   jnz     004ED5D2

* Reference to TFormProgress instance
|
004ED5BF   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED5C4   8B00                   mov     eax, [eax]
004ED5C6   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED5C8   E817C9F8FF             call    00479EE4
004ED5CD   E9DB000000             jmp     004ED6AD
004ED5D2   6A01                   push    $01
004ED5D4   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004ED5D9   50                     push    eax
004ED5DA   8B06                   mov     eax, [esi]
004ED5DC   50                     push    eax
004ED5DD   B929000000             mov     ecx, $00000029
004ED5E2   BAF0000000             mov     edx, $000000F0
004ED5E7   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004ED5E9   E82691FFFF             call    004E6714
004ED5EE   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004ED5F5   740C                   jz      004ED603
004ED5F7   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED5F9   E8CABFFFFF             call    004E95C8
004ED5FE   E9F2000000             jmp     004ED6F5
004ED603   FF06                   inc     dword ptr [esi]
004ED605   6B164C                 imul    edx, [esi], $4C
004ED608   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED60D   DD84D0E8FDFFFF         fld     qword ptr [eax+edx*8+$FFFFFDE8]
004ED614   D81D80D84E00           fcomp   dword ptr [$004ED880]
004ED61A   DFE0                   fstsw   ax
004ED61C   9E                     sahf
004ED61D   763E                   jbe     004ED65D
004ED61F   6B064C                 imul    eax, [esi], $4C
004ED622   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004ED628   DD84C1E8FDFFFF         fld     qword ptr [ecx+eax*8+$FFFFFDE8]
004ED62F   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED634   DC9CD088FBFFFF         fcomp   qword ptr [eax+edx*8+$FFFFFB88]
004ED63B   DFE0                   fstsw   ax
004ED63D   9E                     sahf
004ED63E   761D                   jbe     004ED65D
004ED640   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED645   DD84D0A8FDFFFF         fld     qword ptr [eax+edx*8+$FFFFFDA8]
004ED64C   D81D84D84E00           fcomp   dword ptr [$004ED884]
004ED652   DFE0                   fstsw   ax
004ED654   9E                     sahf
004ED655   7606                   jbe     004ED65D
004ED657   FF0530724F00           inc     dword ptr [$004F7230]
004ED65D   833D30724F0001         cmp     dword ptr [$004F7230], +$01
004ED664   0F8E39FFFFFF           jle     004ED5A3
004ED66A   6B064C                 imul    eax, [esi], $4C
004ED66D   8B15F86E4F00           mov     edx, [$004F6EF8]
004ED673   DD84C2E8FDFFFF         fld     qword ptr [edx+eax*8+$FFFFFDE8]
004ED67A   D81D88D84E00           fcomp   dword ptr [$004ED888]
004ED680   DFE0                   fstsw   ax
004ED682   9E                     sahf
004ED683   0F831AFFFFFF           jnb     004ED5A3

* Reference to TFormProgress instance
|
004ED689   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED68E   8B00                   mov     eax, [eax]
004ED690   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED692   E84DC8F8FF             call    00479EE4
004ED697   6840000400             push    $00040040
004ED69C   684C625400             push    $0054624C
004ED6A1   6854625400             push    $00546254
004ED6A6   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED6A8   E8BBA1F1FF             call    00407868
004ED6AD   33C0                   xor     eax, eax
004ED6AF   8906                   mov     [esi], eax

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004ED6B1   8B831C030000           mov     eax, [ebx+$031C]
004ED6B7   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004ED6B9   FF5244                 call    dword ptr [edx+$44]

* Reference to TFormProgress instance
|
004ED6BC   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED6C1   8B00                   mov     eax, [eax]
004ED6C3   BA645B5400             mov     edx, $00545B64

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED6C8   E8C72BF7FF             call    00460294

* Reference to TFormProgress instance
|
004ED6CD   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED6D2   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004ED6D4   8B80FC020000           mov     eax, [eax+$02FC]
004ED6DA   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED6DC   E8A32AF7FF             call    00460184

* Reference to TFormProgress instance
|
004ED6E1   A1E4594F00             mov     eax, dword ptr [$004F59E4]
004ED6E6   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED6E8   8B8000030000           mov     eax, [eax+$0300]
004ED6EE   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED6F0   E88F2AF7FF             call    00460184
004ED6F5   59                     pop     ecx
004ED6F6   5A                     pop     edx
004ED6F7   5E                     pop     esi
004ED6F8   5B                     pop     ebx
004ED6F9   C3                     ret

*)
end;

procedure TForm1.ZapProtokol(Sender : TObject);
begin
(*
004E2AD8   55                     push    ebp
004E2AD9   8BEC                   mov     ebp, esp
004E2ADB   51                     push    ecx
004E2ADC   B904000000             mov     ecx, $00000004
004E2AE1   6A00                   push    $00
004E2AE3   6A00                   push    $00
004E2AE5   49                     dec     ecx
004E2AE6   75F9                   jnz     004E2AE1
004E2AE8   874DFC                 xchg    [ebp-$04], ecx
004E2AEB   53                     push    ebx
004E2AEC   56                     push    esi
004E2AED   57                     push    edi
004E2AEE   8BD9                   mov     ebx, ecx
004E2AF0   85DB                   test    ebx, ebx
004E2AF2   780A                   js      004E2AFE
004E2AF4   C1EB02                 shr     ebx, $02
004E2AF7   8B349A                 mov     esi, [edx+ebx*4]
004E2AFA   4B                     dec     ebx
004E2AFB   56                     push    esi
004E2AFC   79F9                   jns     004E2AF7
004E2AFE   8BD4                   mov     edx, esp
004E2B00   8BDA                   mov     ebx, edx
004E2B02   8B450C                 mov     eax, [ebp+$0C]

* Reference to: System.@LStrAddRef(void;void):Pointer;
|
004E2B05   E8D223F2FF             call    00404EDC
004E2B0A   8B4508                 mov     eax, [ebp+$08]

* Reference to: System.@LStrAddRef(void;void):Pointer;
|
004E2B0D   E8CA23F2FF             call    00404EDC
004E2B12   33C0                   xor     eax, eax
004E2B14   55                     push    ebp
004E2B15   682D2D4E00             push    $004E2D2D

***** TRY
|
004E2B1A   64FF30                 push    dword ptr fs:[eax]
004E2B1D   648920                 mov     fs:[eax], esp
004E2B20   803D1C724F0001         cmp     byte ptr [$004F721C], $01
004E2B27   0F85D8010000           jnz     004E2D05

* Reference to: SysUtils.Time:TDateTime;
|
004E2B2D   E8F283F2FF             call    0040AF24
004E2B32   83C4F8                 add     esp, -$08
004E2B35   DD1C24                 fstp    qword ptr [esp]
004E2B38   9B                     wait
004E2B39   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: 'hh:mm:ss.zzz'
|
004E2B3C   BA4C2D4E00             mov     edx, $004E2D4C

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004E2B41   E8EE8FF2FF             call    0040BB34

* Reference to: SysUtils.Time:TDateTime;
|
004E2B46   E8D983F2FF             call    0040AF24
004E2B4B   DC2528724F00           fsub    qword ptr [$004F7228]
004E2B51   83C4F8                 add     esp, -$08
004E2B54   DD1C24                 fstp    qword ptr [esp]
004E2B57   9B                     wait
004E2B58   8D45F8                 lea     eax, [ebp-$08]

* Possible String Reference to: 's.zzz'
|
004E2B5B   BA642D4E00             mov     edx, $004E2D64

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004E2B60   E8CF8FF2FF             call    0040BB34

* Possible String Reference to: '<P><FONT face="MS Shell Dlg" color=
|                                "#000000"><B>'
|
004E2B65   68742D4E00             push    $004E2D74
004E2B6A   FF750C                 push    dword ptr [ebp+$0C]

* Possible String Reference to: ': '
|
004E2B6D   68B02D4E00             push    $004E2DB0
004E2B72   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: '  (+'
|
004E2B75   68BC2D4E00             push    $004E2DBC
004E2B7A   FF75F8                 push    dword ptr [ebp-$08]
004E2B7D   68B4565400             push    $005456B4
004E2B82   8D45F4                 lea     eax, [ebp-$0C]
004E2B85   BA07000000             mov     edx, $00000007

* Reference to: System.@LStrCatN;
|
004E2B8A   E81D22F2FF             call    00404DAC
004E2B8F   8B55F4                 mov     edx, [ebp-$0C]
004E2B92   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2B97   E86C25F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2B9C   E8DF0AF2FF             call    00403680

|
004E2BA1   E80EFDF1FF             call    004028B4

* Reference to: SysUtils.Time:TDateTime;
|
004E2BA6   E87983F2FF             call    0040AF24
004E2BAB   DD1D28724F00           fstp    qword ptr [$004F7228]
004E2BB1   9B                     wait

* Possible String Reference to: '<FONT face="Courier New" color="#'
|
004E2BB2   68E82D4E00             push    $004E2DE8
004E2BB7   FF7508                 push    dword ptr [ebp+$08]

* Possible String Reference to: '">'
|
004E2BBA   68142E4E00             push    $004E2E14
004E2BBF   8D45F0                 lea     eax, [ebp-$10]
004E2BC2   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004E2BC7   E8E021F2FF             call    00404DAC
004E2BCC   8B55F0                 mov     edx, [ebp-$10]
004E2BCF   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2BD4   E82F25F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2BD9   E8A20AF2FF             call    00403680

|
004E2BDE   E8D1FCF1FF             call    004028B4
004E2BE3   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2BE6   E8411EF2FF             call    00404A2C
004E2BEB   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E2BEE   E8391EF2FF             call    00404A2C
004E2BF3   8B7510                 mov     esi, [ebp+$10]
004E2BF6   4E                     dec     esi
004E2BF7   85F6                   test    esi, esi
004E2BF9   0F8CB6000000           jl      004E2CB5
004E2BFF   46                     inc     esi
004E2C00   33FF                   xor     edi, edi
004E2C02   FF75FC                 push    dword ptr [ebp-$04]
004E2C05   8D4DEC                 lea     ecx, [ebp-$14]
004E2C08   33C0                   xor     eax, eax
004E2C0A   8A03                   mov     al, byte ptr [ebx]
004E2C0C   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004E2C11   E8BE65F2FF             call    004091D4
004E2C16   FF75EC                 push    dword ptr [ebp-$14]
004E2C19   68202E4E00             push    $004E2E20
004E2C1E   8D45FC                 lea     eax, [ebp-$04]
004E2C21   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004E2C26   E88121F2FF             call    00404DAC
004E2C2B   8A03                   mov     al, byte ptr [ebx]
004E2C2D   2C0E                   sub     al, $0E
004E2C2F   730F                   jnb     004E2C40
004E2C31   8D45F8                 lea     eax, [ebp-$08]
004E2C34   BA2C2E4E00             mov     edx, $004E2E2C

* Reference to: System.@LStrCat;
|
004E2C39   E8B620F2FF             call    00404CF4
004E2C3E   EB15                   jmp     004E2C55
004E2C40   8D45E8                 lea     eax, [ebp-$18]
004E2C43   8A13                   mov     dl, byte ptr [ebx]

* Reference to: System.@LStrFromChar(String;String;Char);
|
004E2C45   E8CA1FF2FF             call    00404C14
004E2C4A   8B55E8                 mov     edx, [ebp-$18]
004E2C4D   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrCat;
|
004E2C50   E89F20F2FF             call    00404CF4
004E2C55   8BC7                   mov     eax, edi
004E2C57   250F000080             and     eax, $8000000F
004E2C5C   7905                   jns     004E2C63
004E2C5E   48                     dec     eax
004E2C5F   83C8F0                 or      eax, -$10
004E2C62   40                     inc     eax
004E2C63   83F80F                 cmp     eax, +$0F
004E2C66   7544                   jnz     004E2CAC
004E2C68   68202E4E00             push    $004E2E20
004E2C6D   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: '     '
|
004E2C70   68382E4E00             push    $004E2E38
004E2C75   FF75F8                 push    dword ptr [ebp-$08]
004E2C78   8D45E4                 lea     eax, [ebp-$1C]
004E2C7B   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004E2C80   E82721F2FF             call    00404DAC
004E2C85   8B55E4                 mov     edx, [ebp-$1C]
004E2C88   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2C8D   E87624F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2C92   E8E909F2FF             call    00403680

|
004E2C97   E818FCF1FF             call    004028B4
004E2C9C   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2C9F   E8881DF2FF             call    00404A2C
004E2CA4   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E2CA7   E8801DF2FF             call    00404A2C
004E2CAC   47                     inc     edi
004E2CAD   43                     inc     ebx
004E2CAE   4E                     dec     esi
004E2CAF   0F854DFFFFFF           jnz     004E2C02
004E2CB5   68202E4E00             push    $004E2E20
004E2CBA   FF75FC                 push    dword ptr [ebp-$04]
004E2CBD   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrLen(String):Integer;
|
004E2CC0   E82720F2FF             call    00404CEC
004E2CC5   BA30000000             mov     edx, $00000030
004E2CCA   2BD0                   sub     edx, eax
004E2CCC   8D4DDC                 lea     ecx, [ebp-$24]
004E2CCF   B020                   mov     al, $20

* Reference to: System.@LStrOfChar;
|
004E2CD1   E80624F2FF             call    004050DC
004E2CD6   FF75DC                 push    dword ptr [ebp-$24]

* Possible String Reference to: '     '
|
004E2CD9   68382E4E00             push    $004E2E38
004E2CDE   FF75F8                 push    dword ptr [ebp-$08]
004E2CE1   8D45E0                 lea     eax, [ebp-$20]
004E2CE4   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCatN;
|
004E2CE9   E8BE20F2FF             call    00404DAC
004E2CEE   8B55E0                 mov     edx, [ebp-$20]
004E2CF1   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2CF6   E80D24F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2CFB   E88009F2FF             call    00403680

|
004E2D00   E8AFFBF1FF             call    004028B4
004E2D05   33C0                   xor     eax, eax
004E2D07   5A                     pop     edx
004E2D08   59                     pop     ecx
004E2D09   59                     pop     ecx
004E2D0A   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E2D0D   68342D4E00             push    $004E2D34
004E2D12   8D45DC                 lea     eax, [ebp-$24]
004E2D15   BA09000000             mov     edx, $00000009

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E2D1A   E8311DF2FF             call    00404A50
004E2D1F   8D4508                 lea     eax, [ebp+$08]
004E2D22   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E2D27   E8241DF2FF             call    00404A50
004E2D2C   C3                     ret


* Reference to: System.@HandleFinally;
|
004E2D2D   E97A16F2FF             jmp     004043AC
004E2D32   EBDE                   jmp     004E2D12

****** END
|
004E2D34   8B7DD0                 mov     edi, [ebp-$30]
004E2D37   8B75D4                 mov     esi, [ebp-$2C]
004E2D3A   8B5DD8                 mov     ebx, [ebp-$28]
004E2D3D   8BE5                   mov     esp, ebp
004E2D3F   5D                     pop     ebp
004E2D40   C20C00                 ret     $000C

*)
end;

procedure TForm1.PL23xxClick(Sender : TObject);
begin
(*
004ED924   53                     push    ebx
004ED925   6834000400             push    $00040034
004ED92A   68E0625400             push    $005462E0
004ED92F   68EC625400             push    $005462EC
004ED934   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED936   E82D9FF1FF             call    00407868
004ED93B   83F806                 cmp     eax, +$06
004ED93E   0F855D010000           jnz     004EDAA1
004ED944   B201                   mov     dl, $01

* Reference to class TRegistry
|
004ED946   A1B8A54300             mov     eax, dword ptr [$0043A5B8]

* Reference to: Registry.TRegistry.Create(TRegistry;boolean);overload;
|
004ED94B   E814CDF4FF             call    0043A664
004ED950   8BD8                   mov     ebx, eax
004ED952   BA02000080             mov     edx, $80000002
004ED957   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.SetRootKey(TRegistry;HKEY);
|
004ED959   E8A6CDF4FF             call    0043A704

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl'
|
004ED95E   BA08DB4E00             mov     edx, $004EDB08
004ED963   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004ED965   E8FECDF4FF             call    0043A768
004ED96A   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl'
|
004ED96C   BA08DB4E00             mov     edx, $004EDB08
004ED971   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004ED973   E8CCCEF4FF             call    0043A844
004ED978   84C0                   test    al, al
004ED97A   0F848F000000           jz      004EDA0F
004ED980   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'Type'
|
004ED985   BA3CDB4E00             mov     edx, $004EDB3C
004ED98A   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004ED98C   E82FD0F4FF             call    0043A9C0
004ED991   B903000000             mov     ecx, $00000003

* Possible String Reference to: 'Start'
|
004ED996   BA4CDB4E00             mov     edx, $004EDB4C
004ED99B   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004ED99D   E81ED0F4FF             call    0043A9C0
004ED9A2   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'ErrorControl'
|
004ED9A7   BA5CDB4E00             mov     edx, $004EDB5C
004ED9AC   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004ED9AE   E80DD0F4FF             call    0043A9C0
004ED9B3   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'Tag'
|
004ED9B8   BA74DB4E00             mov     edx, $004EDB74
004ED9BD   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004ED9BF   E8FCCFF4FF             call    0043A9C0

* Possible String Reference to: 'system32\DRIVERS\ser2pl.sys'
|
004ED9C4   B980DB4E00             mov     ecx, $004EDB80

* Possible String Reference to: 'ImagePath'
|
004ED9C9   BAA4DB4E00             mov     edx, $004EDBA4
004ED9CE   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteExpandString(TRegistry;AnsiString;AnsiString);
|
004ED9D0   E8BFCFF4FF             call    0043A994

* Possible String Reference to: 'Prolific2 Serial port driver'
|
004ED9D5   B9B8DB4E00             mov     ecx, $004EDBB8

* Possible String Reference to: 'DisplayName'
|
004ED9DA   BAE0DB4E00             mov     edx, $004EDBE0
004ED9DF   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004ED9E1   E882CFF4FF             call    0043A968

* Possible String Reference to: 'Base'
|
004ED9E6   B9F4DB4E00             mov     ecx, $004EDBF4

* Possible String Reference to: 'Group'
|
004ED9EB   BA04DC4E00             mov     edx, $004EDC04
004ED9F0   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004ED9F2   E871CFF4FF             call    0043A968

* Possible String Reference to: '46,2147487743 200,2147487349 10400,
|                                2147485840 10472,2147485839'
|
004ED9F7   B914DC4E00             mov     ecx, $004EDC14

* Possible String Reference to: 'ExtBaudrate'
|
004ED9FC   BA5CDC4E00             mov     edx, $004EDC5C
004EDA01   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004EDA03   E860CFF4FF             call    0043A968
004EDA08   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CloseKey(TRegistry);
|
004EDA0A   E8C5CCF4FF             call    0043A6D4

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Enum'
|
004EDA0F   BA70DC4E00             mov     edx, $004EDC70
004EDA14   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004EDA16   E84DCDF4FF             call    0043A768
004EDA1B   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Enum'
|
004EDA1D   BA70DC4E00             mov     edx, $004EDC70
004EDA22   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004EDA24   E81BCEF4FF             call    0043A844
004EDA29   84C0                   test    al, al
004EDA2B   7423                   jz      004EDA50
004EDA2D   33C9                   xor     ecx, ecx

* Possible String Reference to: 'Count'
|
004EDA2F   BAA8DC4E00             mov     edx, $004EDCA8
004EDA34   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDA36   E885CFF4FF             call    0043A9C0
004EDA3B   33C9                   xor     ecx, ecx

* Possible String Reference to: 'NextInstance'
|
004EDA3D   BAB8DC4E00             mov     edx, $004EDCB8
004EDA42   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDA44   E877CFF4FF             call    0043A9C0
004EDA49   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CloseKey(TRegistry);
|
004EDA4B   E884CCF4FF             call    0043A6D4

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Security'
|
004EDA50   BAD0DC4E00             mov     edx, $004EDCD0
004EDA55   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004EDA57   E80CCDF4FF             call    0043A768
004EDA5C   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Security'
|
004EDA5E   BAD0DC4E00             mov     edx, $004EDCD0
004EDA63   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004EDA65   E8DACDF4FF             call    0043A844
004EDA6A   84C0                   test    al, al
004EDA6C   741D                   jz      004EDA8B
004EDA6E   68A8000000             push    $000000A8
004EDA73   B9241D4F00             mov     ecx, $004F1D24

* Possible String Reference to: 'Security'
|
004EDA78   BA0CDD4E00             mov     edx, $004EDD0C
004EDA7D   8BC3                   mov     eax, ebx

|
004EDA7F   E850CFF4FF             call    0043A9D4
004EDA84   8BC3                   mov     eax, ebx

* Reference to: System.TObject.Free(TObject);
|
004EDA86   E88D61F1FF             call    00403C18
004EDA8B   6840000400             push    $00040040
004EDA90   6844635400             push    $00546344
004EDA95   6868635400             push    $00546368
004EDA9A   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EDA9C   E8C79DF1FF             call    00407868
004EDAA1   5B                     pop     ebx
004EDAA2   C3                     ret

*)
end;

procedure TForm1.StringGrid_DTCSelectCell(Sender : TObject);
begin
(*
004EDD48   55                     push    ebp
004EDD49   8BEC                   mov     ebp, esp
004EDD4B   83C4D0                 add     esp, -$30
004EDD4E   53                     push    ebx
004EDD4F   56                     push    esi
004EDD50   57                     push    edi
004EDD51   33DB                   xor     ebx, ebx
004EDD53   895DEC                 mov     [ebp-$14], ebx
004EDD56   895DE8                 mov     [ebp-$18], ebx
004EDD59   895DE4                 mov     [ebp-$1C], ebx
004EDD5C   895DF8                 mov     [ebp-$08], ebx
004EDD5F   895DF4                 mov     [ebp-$0C], ebx
004EDD62   895DF0                 mov     [ebp-$10], ebx
004EDD65   8BF8                   mov     edi, eax
004EDD67   8B750C                 mov     esi, [ebp+$0C]
004EDD6A   33C0                   xor     eax, eax
004EDD6C   55                     push    ebp
004EDD6D   68EFDE4E00             push    $004EDEEF

***** TRY
|
004EDD72   64FF30                 push    dword ptr fs:[eax]
004EDD75   648920                 mov     fs:[eax], esp
004EDD78   83FE08                 cmp     esi, +$08
004EDD7B   7E1B                   jle     004EDD98
004EDD7D   6840000400             push    $00040040
004EDD82   68785B5400             push    $00545B78
004EDD87   687C635400             push    $0054637C
004EDD8C   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EDD8E   E8D59AF1FF             call    00407868
004EDD93   E93C010000             jmp     004EDED4
004EDD98   8D45F4                 lea     eax, [ebp-$0C]
004EDD9B   50                     push    eax
004EDD9C   8D45F0                 lea     eax, [ebp-$10]
004EDD9F   50                     push    eax
004EDDA0   8BCE                   mov     ecx, esi
004EDDA2   33D2                   xor     edx, edx
004EDDA4   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EDDAA   E89D08FAFF             call    0048E64C
004EDDAF   8B45F0                 mov     eax, [ebp-$10]
004EDDB2   B902000000             mov     ecx, $00000002
004EDDB7   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCopy;
|
004EDDBC   E88B71F1FF             call    00404F4C
004EDDC1   8B4DF4                 mov     ecx, [ebp-$0C]
004EDDC4   8D45F8                 lea     eax, [ebp-$08]
004EDDC7   BA34DF4E00             mov     edx, $004EDF34

* Reference to: System.@LStrCat3;
|
004EDDCC   E8676FF1FF             call    00404D38
004EDDD1   8B45F8                 mov     eax, [ebp-$08]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004EDDD4   E823B4F1FF             call    004091FC
004EDDD9   8BD8                   mov     ebx, eax
004EDDDB   8D45E8                 lea     eax, [ebp-$18]
004EDDDE   50                     push    eax
004EDDDF   8D45E4                 lea     eax, [ebp-$1C]
004EDDE2   50                     push    eax
004EDDE3   8BCE                   mov     ecx, esi
004EDDE5   33D2                   xor     edx, edx
004EDDE7   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EDDED   E85A08FAFF             call    0048E64C
004EDDF2   8B45E4                 mov     eax, [ebp-$1C]
004EDDF5   B902000000             mov     ecx, $00000002
004EDDFA   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCopy;
|
004EDDFF   E84871F1FF             call    00404F4C
004EDE04   8B4DE8                 mov     ecx, [ebp-$18]
004EDE07   8D45EC                 lea     eax, [ebp-$14]
004EDE0A   BA34DF4E00             mov     edx, $004EDF34

* Reference to: System.@LStrCat3;
|
004EDE0F   E8246FF1FF             call    00404D38
004EDE14   8B45EC                 mov     eax, [ebp-$14]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004EDE17   E8E0B3F1FF             call    004091FC
004EDE1C   8845FF                 mov     [ebp-$01], al
004EDE1F   68C8000000             push    $000000C8
004EDE24   C645DC82               mov     byte ptr [ebp-$24], $82
004EDE28   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EDE2D   8845DD                 mov     [ebp-$23], al
004EDE30   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EDE35   8845DE                 mov     [ebp-$22], al
004EDE38   C645DF21               mov     byte ptr [ebp-$21], $21
004EDE3C   C645E002               mov     byte ptr [ebp-$20], $02
004EDE40   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EDE45   8845E1                 mov     [ebp-$1F], al
004EDE48   8D55DC                 lea     edx, [ebp-$24]
004EDE4B   B905000000             mov     ecx, $00000005
004EDE50   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EDE52   E8E94FFFFF             call    004E2E40
004EDE57   68C8000000             push    $000000C8
004EDE5C   C645DC82               mov     byte ptr [ebp-$24], $82
004EDE60   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EDE65   8845DD                 mov     [ebp-$23], al
004EDE68   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EDE6D   8845DE                 mov     [ebp-$22], al
004EDE70   C645DF21               mov     byte ptr [ebp-$21], $21
004EDE74   C645E0F0               mov     byte ptr [ebp-$20], $F0
004EDE78   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EDE7D   8845E1                 mov     [ebp-$1F], al
004EDE80   8D55DC                 lea     edx, [ebp-$24]
004EDE83   B905000000             mov     ecx, $00000005
004EDE88   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EDE8A   E8B14FFFFF             call    004E2E40
004EDE8F   68C8000000             push    $000000C8
004EDE94   C645D085               mov     byte ptr [ebp-$30], $85
004EDE98   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EDE9D   8845D1                 mov     [ebp-$2F], al
004EDEA0   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EDEA5   8845D2                 mov     [ebp-$2E], al
004EDEA8   C645D312               mov     byte ptr [ebp-$2D], $12
004EDEAC   C645D400               mov     byte ptr [ebp-$2C], $00
004EDEB0   C645D504               mov     byte ptr [ebp-$2B], $04
004EDEB4   885DD6                 mov     [ebp-$2A], bl
004EDEB7   8A45FF                 mov     al, byte ptr [ebp-$01]
004EDEBA   8845D7                 mov     [ebp-$29], al
004EDEBD   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EDEC2   8845D8                 mov     [ebp-$28], al
004EDEC5   8D55D0                 lea     edx, [ebp-$30]
004EDEC8   B908000000             mov     ecx, $00000008
004EDECD   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EDECF   E86C4FFFFF             call    004E2E40
004EDED4   33C0                   xor     eax, eax
004EDED6   5A                     pop     edx
004EDED7   59                     pop     ecx
004EDED8   59                     pop     ecx
004EDED9   648910                 mov     fs:[eax], edx

****** FINALLY
|
004EDEDC   68F6DE4E00             push    $004EDEF6
004EDEE1   8D45E4                 lea     eax, [ebp-$1C]
004EDEE4   BA06000000             mov     edx, $00000006

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EDEE9   E8626BF1FF             call    00404A50
004EDEEE   C3                     ret


* Reference to: System.@HandleFinally;
|
004EDEEF   E9B864F1FF             jmp     004043AC
004EDEF4   EBEB                   jmp     004EDEE1

****** END
|
004EDEF6   5F                     pop     edi
004EDEF7   5E                     pop     esi
004EDEF8   5B                     pop     ebx
004EDEF9   8BE5                   mov     esp, ebp
004EDEFB   5D                     pop     ebp
004EDEFC   C20800                 ret     $0008

*)
end;

procedure TForm1.N8Click(Sender : TObject);
begin
(*
004ECBA8   53                     push    ebx
004ECBA9   8BD8                   mov     ebx, eax
004ECBAB   6A05                   push    $05
004ECBAD   6A00                   push    $00
004ECBAF   6A00                   push    $00

* Possible String Reference to: 'http://www.samdiagnost.ru'
|
004ECBB1   68C8CB4E00             push    $004ECBC8
004ECBB6   6A00                   push    $00
004ECBB8   8BC3                   mov     eax, ebx

* Reference to: QForms.TCustomForm.GetClientHandle(TCustomForm):QWorkspaceH;
|
004ECBBA   E83DA0F7FF             call    00466BFC
004ECBBF   50                     push    eax

* Reference to: shell32.ShellExecuteA()
|
004ECBC0   E8973FF4FF             call    00430B5C
004ECBC5   5B                     pop     ebx
004ECBC6   C3                     ret

*)
end;

procedure TForm1.N_Airbag_SRS1Click(Sender : TObject);
begin
(*
004E3F04   53                     push    ebx
004E3F05   56                     push    esi
004E3F06   8BD8                   mov     ebx, eax
004E3F08   C605A76D4F0032         mov     byte ptr [$004F6DA7], $32
004E3F0F   C605A86D4F0059         mov     byte ptr [$004F6DA8], $59
004E3F16   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3F1D   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3F27   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3F29   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F2F   E870EDF8FF             call    00472CA4
004E3F34   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3F36   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F3C   E863EDF8FF             call    00472CA4
004E3F41   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3F43   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F49   E856EDF8FF             call    00472CA4
004E3F4E   6A02                   push    $02

* Possible String Reference to: 'SRS'
|
004E3F50   B9803F4E00             mov     ecx, $004E3F80

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3F55   BA8C3F4E00             mov     edx, $004E3F8C
004E3F5A   A120724F00             mov     eax, dword ptr [$004F7220]
004E3F5F   8B30                   mov     esi, [eax]
004E3F61   FF560C                 call    dword ptr [esi+$0C]
004E3F64   B204                   mov     dl, $04
004E3F66   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3F68   E8CBF2FFFF             call    004E3238
004E3F6D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3F6F   E824000000             call    004E3F98
004E3F74   5E                     pop     esi
004E3F75   5B                     pop     ebx
004E3F76   C3                     ret

*)
end;

procedure TForm1.Label_AIRBAGClick(Sender : TObject);
begin
(*
004E37D0   53                     push    ebx
004E37D1   56                     push    esi
004E37D2   83C4F0                 add     esp, -$10
004E37D5   8BD8                   mov     ebx, eax
004E37D7   6A00                   push    $00

* Possible String Reference to: 'SRS'
|
004E37D9   B950384E00             mov     ecx, $004E3850

* Possible String Reference to: 'Vib_tip_ECU'
|
004E37DE   BA5C384E00             mov     edx, $004E385C
004E37E3   A120724F00             mov     eax, dword ptr [$004F7220]
004E37E8   8B30                   mov     esi, [eax]
004E37EA   FF5608                 call    dword ptr [esi+$08]
004E37ED   48                     dec     eax
004E37EE   7405                   jz      004E37F5
004E37F0   48                     dec     eax
004E37F1   740F                   jz      004E3802
004E37F3   EB1A                   jmp     004E380F

* Reference to control TForm1.N_Airbag_SRS0 : TMenuItem
|
004E37F5   8B83AC030000           mov     eax, [ebx+$03AC]
004E37FB   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E37FD   FF5244                 call    dword ptr [edx+$44]
004E3800   EB40                   jmp     004E3842

* Reference to control TForm1.N_Airbag_SRS1 : TMenuItem
|
004E3802   8B83FC030000           mov     eax, [ebx+$03FC]
004E3808   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E380A   FF5244                 call    dword ptr [edx+$44]
004E380D   EB33                   jmp     004E3842
004E380F   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E3811   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E3816   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3818   E8EF7CF8FF             call    0046B50C
004E381D   8B442404               mov     eax, [esp+$04]
004E3821   50                     push    eax
004E3822   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E3826   A1105D4F00             mov     eax, dword ptr [$004F5D10]
004E382B   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E382D   E8DA7CF8FF             call    0046B50C
004E3832   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_SRS : TPopupMenu
|
004E3836   8B8300040000           mov     eax, [ebx+$0400]
004E383C   59                     pop     ecx
004E383D   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E383F   FF5340                 call    dword ptr [ebx+$40]
004E3842   83C410                 add     esp, +$10
004E3845   5E                     pop     esi
004E3846   5B                     pop     ebx
004E3847   C3                     ret

*)
end;

procedure TForm1.FormActivate(Sender : TObject);
begin
(*
004E277C   55                     push    ebp
004E277D   8BEC                   mov     ebp, esp
004E277F   6A00                   push    $00
004E2781   33C0                   xor     eax, eax
004E2783   55                     push    ebp
004E2784   68E6274E00             push    $004E27E6

***** TRY
|
004E2789   64FF30                 push    dword ptr fs:[eax]
004E278C   648920                 mov     fs:[eax], esp
004E278F   C60527724F0000         mov     byte ptr [$004F7227], $00

* Reference to: System.ParamCount:Integer;
|
004E2796   E8E502F2FF             call    00402A80
004E279B   85C0                   test    eax, eax
004E279D   7431                   jz      004E27D0
004E279F   8D55FC                 lea     edx, [ebp-$04]
004E27A2   B801000000             mov     eax, $00000001

* Reference to: System.ParamStr(Integer):String;
|
004E27A7   E83403F2FF             call    00402AE0
004E27AC   8B55FC                 mov     edx, [ebp-$04]
004E27AF   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E27B4   E81307F2FF             call    00402ECC
004E27B9   C60527724F0001         mov     byte ptr [$004F7227], $01

* Reference to Form1
|
004E27C0   A1646D4F00             mov     eax, dword ptr [$004F6D64]

* Reference to field Form1.OFFS_030C
|
004E27C5   8B800C030000           mov     eax, [eax+$030C]
004E27CB   8B10                   mov     edx, [eax]
004E27CD   FF5244                 call    dword ptr [edx+$44]
004E27D0   33C0                   xor     eax, eax
004E27D2   5A                     pop     edx
004E27D3   59                     pop     ecx
004E27D4   59                     pop     ecx
004E27D5   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: 'Y]√UãÏj'
|
004E27D8   68ED274E00             push    $004E27ED
004E27DD   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E27E0   E84722F2FF             call    00404A2C
004E27E5   C3                     ret


* Reference to: System.@HandleFinally;
|
004E27E6   E9C11BF2FF             jmp     004043AC
004E27EB   EBF0                   jmp     004E27DD

****** END
|
004E27ED   59                     pop     ecx
004E27EE   5D                     pop     ebp
004E27EF   C3                     ret

*)
end;

procedure TForm1.Driver(Sender : TObject);
begin
(*
004EDF68   53                     push    ebx
004EDF69   83C4F8                 add     esp, -$08
004EDF6C   8BD8                   mov     ebx, eax

* Reference to TGrafForm instance
|
004EDF6E   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF73   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.test_ON : TButton
|
004EDF75   8B80E0030000           mov     eax, [eax+$03E0]
004EDF7B   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EDF7D   E80222F7FF             call    00460184

* Reference to TGrafForm instance
|
004EDF82   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF87   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.test_OFF : TButton
|
004EDF89   8B80DC030000           mov     eax, [eax+$03DC]
004EDF8F   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EDF91   E8EE21F7FF             call    00460184

* Reference to TGrafForm instance
|
004EDF96   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF9B   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.IMTrack : TTrackBar
|
004EDF9D   8B80E8030000           mov     eax, [eax+$03E8]
004EDFA3   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EDFA5   E8DA21F7FF             call    00460184
004EDFAA   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EDFB1   7527                   jnz     004EDFDA
004EDFB3   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EDFBA   0F85F7000000           jnz     004EE0B7
004EDFC0   803DA46D4F0020         cmp     byte ptr [$004F6DA4], $20
004EDFC7   0F84EA000000           jz      004EE0B7
004EDFCD   803DA46D4F0022         cmp     byte ptr [$004F6DA4], $22
004EDFD4   0F84DD000000           jz      004EE0B7

* Reference to: kernel32.GetTickCount()
|
004EDFDA   E87190F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004EDFDF   A3986D4F00             mov     dword ptr [$004F6D98], eax
004EDFE4   EB0C                   jmp     004EDFF2

* Reference to TApplication instance
|
004EDFE6   A1285B4F00             mov     eax, dword ptr [$004F5B28]
004EDFEB   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EDFED   E8F227F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EDFF2   E85990F1FF             call    00407050
004EDFF7   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EDFFD   83F864                 cmp     eax, +$64
004EE000   72E4                   jb      004EDFE6
004EE002   6A0F                   push    $0F
004EE004   C644240483             mov     byte ptr [esp+$04], $83
004EE009   C644240511             mov     byte ptr [esp+$05], $11
004EE00E   C6442406F1             mov     byte ptr [esp+$06], $F1
004EE013   C644240730             mov     byte ptr [esp+$07], $30
004EE018   A0A46D4F00             mov     al, byte ptr [$004F6DA4]
004EE01D   88442408               mov     [esp+$08], al
004EE021   C644240901             mov     byte ptr [esp+$09], $01
004EE026   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EE02B   8844240A               mov     [esp+$0A], al
004EE02F   8D542404               lea     edx, [esp+$04]
004EE033   B906000000             mov     ecx, $00000006
004EE038   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EE03A   E8014EFFFF             call    004E2E40
004EE03F   803D026E4F0070         cmp     byte ptr [$004F6E02], $70
004EE046   7558                   jnz     004EE0A0
004EE048   803D056E4F0000         cmp     byte ptr [$004F6E05], $00
004EE04F   741D                   jz      004EE06E
004EE051   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EE058   752D                   jnz     004EE087
004EE05A   A0A46D4F00             mov     al, byte ptr [$004F6DA4]
004EE05F   04ED                   add     al, -$13
004EE061   2C02                   sub     al, $02
004EE063   7322                   jnb     004EE087
004EE065   803D056E4F00FF         cmp     byte ptr [$004F6E05], $FF
004EE06C   7519                   jnz     004EE087

* Reference to TGrafForm instance
|
004EE06E   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE073   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE075   8B80E4030000           mov     eax, [eax+$03E4]
004EE07B   BA002F5400             mov     edx, $00542F00

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE080   E80F22F7FF             call    00460294
004EE085   EB30                   jmp     004EE0B7

* Reference to TGrafForm instance
|
004EE087   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE08C   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE08E   8B80E4030000           mov     eax, [eax+$03E4]
004EE094   BA0C2F5400             mov     edx, $00542F0C

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE099   E8F621F7FF             call    00460294
004EE09E   EB17                   jmp     004EE0B7

* Reference to TGrafForm instance
|
004EE0A0   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE0A5   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE0A7   8B80E4030000           mov     eax, [eax+$03E4]
004EE0AD   BAE4E04E00             mov     edx, $004EE0E4

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE0B2   E8DD21F7FF             call    00460294
004EE0B7   59                     pop     ecx
004EE0B8   5A                     pop     edx
004EE0B9   5B                     pop     ebx
004EE0BA   C3                     ret

*)
end;

procedure TForm1.Test_DKClick(Sender : TObject);
begin
(*
004EE0E8   53                     push    ebx
004EE0E9   56                     push    esi
004EE0EA   57                     push    edi
004EE0EB   55                     push    ebp
004EE0EC   8BF8                   mov     edi, eax
004EE0EE   BD94224F00             mov     ebp, $004F2294
004EE0F3   8B8728030000           mov     eax, [edi+$0328]
004EE0F9   33D2                   xor     edx, edx
004EE0FB   8B08                   mov     ecx, [eax]

* Reference to method TForm1.SetEnabled(Boolean)
|
004EE0FD   FF5164                 call    dword ptr [ecx+$64]
004EE100   8B8740030000           mov     eax, [edi+$0340]
004EE106   33D2                   xor     edx, edx
004EE108   8B08                   mov     ecx, [eax]

* Reference to method TForm1.SetEnabled(Boolean)
|
004EE10A   FF5164                 call    dword ptr [ecx+$64]
004EE10D   8B8718040000           mov     eax, [edi+$0418]
004EE113   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EE115   E86E4AF8FF             call    00472B88

* Reference to TGrafForm instance
|
004EE11A   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE11F   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.DriveIM : TMenuItem
|
004EE121   8B80EC030000           mov     eax, [eax+$03EC]
004EE127   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EE129   E85A4AF8FF             call    00472B88
004EE12E   33DB                   xor     ebx, ebx
004EE130   6A02                   push    $02
004EE132   B8FC6E4F00             mov     eax, $004F6EFC
004EE137   B901000000             mov     ecx, $00000001

* Reference to class main
|
004EE13C   8B15FCFA4D00           mov     edx, [$004DFAFC]

* Reference to: System.@DynArraySetLength;
|
004EE142   E8ED7BF1FF             call    00405D34
004EE147   83C404                 add     esp, +$04
004EE14A   EB01                   jmp     004EE14D
004EE14C   43                     inc     ebx
004EE14D   8D34DB                 lea     esi, [ebx+ebx*8]
004EE150   8A44B500               mov     al, byte ptr [ebp+esi*4+$00]
004EE154   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EE15A   75F0                   jnz     004EE14C
004EE15C   8B44B508               mov     eax, [ebp+esi*4+$08]
004EE160   BA8C2B5400             mov     edx, $00542B8C

* Reference to: System.@LStrCmp;
|
004EE165   E8CE6CF1FF             call    00404E38
004EE16A   75E0                   jnz     004EE14C
004EE16C   8D04DB                 lea     eax, [ebx+ebx*8]
004EE16F   8B448504               mov     eax, [ebp+eax*4+$04]
004EE173   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EE179   8902                   mov     [edx], eax
004EE17B   33DB                   xor     ebx, ebx
004EE17D   EB01                   jmp     004EE180
004EE17F   43                     inc     ebx
004EE180   8D34DB                 lea     esi, [ebx+ebx*8]
004EE183   8A44B500               mov     al, byte ptr [ebp+esi*4+$00]
004EE187   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EE18D   75F0                   jnz     004EE17F
004EE18F   8B44B508               mov     eax, [ebp+esi*4+$08]
004EE193   BAA02B5400             mov     edx, $00542BA0

* Reference to: System.@LStrCmp;
|
004EE198   E89B6CF1FF             call    00404E38
004EE19D   75E0                   jnz     004EE17F
004EE19F   8D04DB                 lea     eax, [ebx+ebx*8]
004EE1A2   8B448504               mov     eax, [ebp+eax*4+$04]
004EE1A6   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EE1AC   894204                 mov     [edx+$04], eax
004EE1AF   C60534724F0001         mov     byte ptr [$004F7234], $01

* Reference to TOptionsForm instance
|
004EE1B6   A19C5A4F00             mov     eax, dword ptr [$004F5A9C]
004EE1BB   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.InquireInterval : TSpinEdit
|
004EE1BD   8B800C030000           mov     eax, [eax+$030C]

* Reference to : TTimerSpeedButton._PROC_004C2644()
|
004EE1C3   E87C44FDFF             call    004C2644
004EE1C8   8BD0                   mov     edx, eax
004EE1CA   8B8730030000           mov     eax, [edi+$0330]

* Reference to: ExtCtrls.TTimer.SetInterval(TTimer;Cardinal);
|
004EE1D0   E8DF71F4FF             call    004353B4
004EE1D5   8B87FC020000           mov     eax, [edi+$02FC]

* Reference to field TSpinEdit.OFFS_000C
|
004EE1DB   C7400C02000000         mov     dword ptr [eax+$0C], $00000002
004EE1E2   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EE1E9   7510                   jnz     004EE1FB
004EE1EB   8B8730030000           mov     eax, [edi+$0330]
004EE1F1   8BD8                   mov     ebx, eax
004EE1F3   8BD0                   mov     edx, eax

* Reference to field TSpinEdit.OFFS_003C
|
004EE1F5   8B433C                 mov     eax, [ebx+$3C]

* Possible reference to virtual method TSpinEdit.OFFS_38
|
004EE1F8   FF5338                 call    dword ptr [ebx+$38]

* Reference to TGrafForm instance
|
004EE1FB   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE200   8B00                   mov     eax, [eax]
004EE202   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EE204   FF92EC000000           call    dword ptr [edx+$00EC]

* Reference to TGrafForm instance
|
004EE20A   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE20F   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004EE211   80785701               cmp     byte ptr [eax+$57], $01
004EE215   750C                   jnz     004EE223

* Reference to TGrafForm instance
|
004EE217   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EE21C   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004EE21E   E865D9FEFF             call    004DBB88
004EE223   5D                     pop     ebp
004EE224   5F                     pop     edi
004EE225   5E                     pop     esi
004EE226   5B                     pop     ebx
004EE227   C3                     ret

*)
end;

procedure TForm1.DriverIMClick(Sender : TObject);
begin
(*
004EDF38   C60535724F0001         mov     byte ptr [$004F7235], $01

* Reference to TGrafForm instance
|
004EDF3F   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF44   8B00                   mov     eax, [eax]
004EDF46   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EDF48   FF92EC000000           call    dword ptr [edx+$00EC]

* Reference to TGrafForm instance
|
004EDF4E   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF53   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004EDF55   80785701               cmp     byte ptr [eax+$57], $01
004EDF59   750C                   jnz     004EDF67

* Reference to TGrafForm instance
|
004EDF5B   A1485A4F00             mov     eax, dword ptr [$004F5A48]
004EDF60   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004EDF62   E821DCFEFF             call    004DBB88
004EDF67   C3                     ret

*)
end;

procedure TForm1.N_SiriusD32Click(Sender : TObject);
begin
(*
004E3868   53                     push    ebx
004E3869   56                     push    esi
004E386A   8BD8                   mov     ebx, eax
004E386C   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E3873   7507                   jnz     004E387C
004E3875   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E3877   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E387C   C605A76D4F0013         mov     byte ptr [$004F6DA7], $13
004E3883   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E388A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3891   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E389B   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E389D   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E38A3   E8FCF3F8FF             call    00472CA4
004E38A8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E38AA   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E38B0   E8EFF3F8FF             call    00472CA4
004E38B5   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E38B7   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E38BD   E8E2F3F8FF             call    00472CA4
004E38C2   6A03                   push    $03

* Possible String Reference to: 'Dvig'
|
004E38C4   B9F4384E00             mov     ecx, $004E38F4

* Possible String Reference to: 'Vib_tip_ECU'
|
004E38C9   BA04394E00             mov     edx, $004E3904
004E38CE   A120724F00             mov     eax, dword ptr [$004F7220]
004E38D3   8B30                   mov     esi, [eax]
004E38D5   FF560C                 call    dword ptr [esi+$0C]
004E38D8   B201                   mov     dl, $01
004E38DA   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E38DC   E857F9FFFF             call    004E3238
004E38E1   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E38E3   E8B0060000             call    004E3F98
004E38E8   5E                     pop     esi
004E38E9   5B                     pop     ebx
004E38EA   C3                     ret

*)
end;

procedure TForm1.N_BoschClick(Sender : TObject);
begin
(*
004E3A60   53                     push    ebx
004E3A61   56                     push    esi
004E3A62   8BD8                   mov     ebx, eax
004E3A64   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E3A6B   7507                   jnz     004E3A74
004E3A6D   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E3A6F   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3A74   C605A76D4F0014         mov     byte ptr [$004F6DA7], $14
004E3A7B   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E3A82   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3A89   C705D86D4F0080000000   mov     dword ptr [$004F6DD8], $00000080
004E3A93   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3A95   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3A9B   E804F2F8FF             call    00472CA4
004E3AA0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3AA2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3AA8   E8F7F1F8FF             call    00472CA4
004E3AAD   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3AAF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3AB5   E8EAF1F8FF             call    00472CA4
004E3ABA   6A04                   push    $04

* Possible String Reference to: 'Dvig'
|
004E3ABC   B9EC3A4E00             mov     ecx, $004E3AEC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3AC1   BAFC3A4E00             mov     edx, $004E3AFC
004E3AC6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3ACB   8B30                   mov     esi, [eax]
004E3ACD   FF560C                 call    dword ptr [esi+$0C]
004E3AD0   B201                   mov     dl, $01
004E3AD2   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3AD4   E85FF7FFFF             call    004E3238
004E3AD9   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3ADB   E8B8040000             call    004E3F98
004E3AE0   5E                     pop     esi
004E3AE1   5B                     pop     ebx
004E3AE2   C3                     ret

*)
end;

end.