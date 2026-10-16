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
    procedure N_EFIClick(Sender : TObject);
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
004E2598   55                     push    ebp
004E2599   8BEC                   mov     ebp, esp
004E259B   6A00                   push    $00
004E259D   6A00                   push    $00
004E259F   6A00                   push    $00
004E25A1   53                     push    ebx
004E25A2   8BD8                   mov     ebx, eax
004E25A4   33C0                   xor     eax, eax
004E25A6   55                     push    ebp
004E25A7   6848274E00             push    $004E2748

***** TRY
|
004E25AC   64FF30                 push    dword ptr fs:[eax]
004E25AF   648920                 mov     fs:[eax], esp
004E25B2   B205                   mov     dl, $05

* Reference to control TForm1.List_Param : TValueListEditor
|
004E25B4   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E25BA   E8B9D1F7FF             call    0045F778
004E25BF   B205                   mov     dl, $05

* Reference to control TForm1.Panel_DTC : TPanel
|
004E25C1   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E25C7   E8ACD1F7FF             call    0045F778
004E25CC   B205                   mov     dl, $05

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E25CE   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetAlign(TControl;TAlign);
|
004E25D4   E89FD1F7FF             call    0045F778

* Possible String Reference to: '   Код'
|
004E25D9   685C274E00             push    $004E275C
004E25DE   33C9                   xor     ecx, ecx
004E25E0   33D2                   xor     edx, edx

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E25E2   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E25E8   E8CFC0FAFF             call    0048E6BC

* Possible String Reference to: '   Статус'
|
004E25ED   686C274E00             push    $004E276C
004E25F2   33C9                   xor     ecx, ecx
004E25F4   BA01000000             mov     edx, $00000001

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E25F9   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E25FF   E8B8C0FAFF             call    0048E6BC

* Possible String Reference to: '   Описание'
|
004E2604   6880274E00             push    $004E2780
004E2609   33C9                   xor     ecx, ecx
004E260B   BA02000000             mov     edx, $00000002

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004E2610   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004E2616   E8A1C0FAFF             call    0048E6BC
004E261B   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E261D   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E2623   E86005F9FF             call    00472B88
004E2628   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E262A   8B8328030000           mov     eax, [ebx+$0328]
004E2630   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E2632   FF5164                 call    dword ptr [ecx+$64]
004E2635   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E2637   8B8334030000           mov     eax, [ebx+$0334]
004E263D   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E263F   FF5164                 call    dword ptr [ecx+$64]
004E2642   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E2644   8B8340030000           mov     eax, [ebx+$0340]
004E264A   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E264C   FF5164                 call    dword ptr [ecx+$64]
004E264F   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E2651   8B8348030000           mov     eax, [ebx+$0348]
004E2657   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E2659   FF5164                 call    dword ptr [ecx+$64]
004E265C   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E265E   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E2664   E81F05F9FF             call    00472B88
004E2669   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E266B   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E2671   E81205F9FF             call    00472B88
004E2676   C6051D724F0000         mov     byte ptr [$004F721D], $00
004E267D   8D55F8                 lea     edx, [ebp-$08]

* Reference to TApplication instance
|
004E2680   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004E2685   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.GetExeName(TApplication):AnsiString;
|
004E2687   E814E9F9FF             call    00480FA0
004E268C   8B45F8                 mov     eax, [ebp-$08]
004E268F   8D55FC                 lea     edx, [ebp-$04]

* Reference to: SysUtils.ExtractFilePath(AnsiString):AnsiString;
|
004E2692   E8C16FF2FF             call    00409658
004E2697   8B55FC                 mov     edx, [ebp-$04]
004E269A   B8F46D4F00             mov     eax, $004F6DF4

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E269F   E8DC23F2FF             call    00404A80
004E26A4   8D45F4                 lea     eax, [ebp-$0C]

* Possible String Reference to: 'CE.ini'
|
004E26A7   B994274E00             mov     ecx, $004E2794
004E26AC   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E26B2   E88126F2FF             call    00404D38
004E26B7   8B4DF4                 mov     ecx, [ebp-$0C]
004E26BA   B201                   mov     dl, $01

* Reference to class TIniFile
|
004E26BC   A16C964300             mov     eax, dword ptr [$0043966C]

* Reference to: IniFiles.TCustomIniFile.Create(TCustomIniFile;boolean;AnsiString);
|
004E26C1   E85670F5FF             call    0043971C

* Reference to GlobalVar_004F7220
|
004E26C6   A320724F00             mov     dword ptr [$004F7220], eax
004E26CB   B201                   mov     dl, $01
004E26CD   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26CF   E8B00B0000             call    004E3284
004E26D4   B202                   mov     dl, $02
004E26D6   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26D8   E8A70B0000             call    004E3284
004E26DD   B203                   mov     dl, $03
004E26DF   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26E1   E89E0B0000             call    004E3284
004E26E6   B204                   mov     dl, $04
004E26E8   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E26EA   E8950B0000             call    004E3284

* Possible String Reference to: 'Справка'
|
004E26EF   689C274E00             push    $004E279C

* Reference to control TForm1.N3 : TMenuItem
|
004E26F4   8B8370030000           mov     eax, [ebx+$0370]

* Reference to: Menus.TMenuItem.GetHandle(TMenuItem):HMENU;
|
004E26FA   E8F1EAF8FF             call    004711F0
004E26FF   50                     push    eax
004E2700   6810440000             push    $00004410
004E2705   6A04                   push    $04

* Reference to control TForm1.MainMenu : TMainMenu
|
004E2707   8B8300030000           mov     eax, [ebx+$0300]
004E270D   8B10                   mov     edx, [eax]

* Reference to method TMainMenu.GetHandle()
|
004E270F   FF5234                 call    dword ptr [edx+$34]
004E2712   50                     push    eax

* Reference to: user32.ModifyMenuA()
|
004E2713   E85851F2FF             call    00407870
004E2718   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E271F   C60525724F0000         mov     byte ptr [$004F7225], $00
004E2726   C60518724F0000         mov     byte ptr [$004F7218], $00
004E272D   33C0                   xor     eax, eax
004E272F   5A                     pop     edx
004E2730   59                     pop     ecx
004E2731   59                     pop     ecx
004E2732   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E2735   684F274E00             push    $004E274F
004E273A   8D45F4                 lea     eax, [ebp-$0C]
004E273D   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E2742   E80923F2FF             call    00404A50
004E2747   C3                     ret


* Reference to: System.@HandleFinally;
|
004E2748   E95F1CF2FF             jmp     004043AC
004E274D   EBEB                   jmp     004E273A

****** END
|
004E274F   5B                     pop     ebx
004E2750   8BE5                   mov     esp, ebp
004E2752   5D                     pop     ebp
004E2753   C3                     ret

*)
end;

procedure TForm1.FormClose(Sender : TObject);
begin
(*
004EC4F0   55                     push    ebp
004EC4F1   8BEC                   mov     ebp, esp
004EC4F3   6A00                   push    $00
004EC4F5   6A00                   push    $00
004EC4F7   53                     push    ebx
004EC4F8   8BD8                   mov     ebx, eax
004EC4FA   33C0                   xor     eax, eax
004EC4FC   55                     push    ebp

* Possible String Reference to: 'йЅ}сялл[YY]Г'
|
004EC4FD   68EAC54E00             push    $004EC5EA

***** TRY
|
004EC502   64FF30                 push    dword ptr fs:[eax]
004EC505   648920                 mov     fs:[eax], esp

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EC508   8B831C030000           mov     eax, [ebx+$031C]
004EC50E   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EC510   FF5244                 call    dword ptr [edx+$44]
004EC513   A120724F00             mov     eax, dword ptr [$004F7220]

* Reference to: System.TObject.Free(TObject);
|
004EC518   E8FB76F1FF             call    00403C18

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EC51D   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EC523   8B8008020000           mov     eax, [eax+$0208]
004EC529   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EC52E   E86536F5FF             call    0043FB98

* Reference to field TStatusPanels.UpdateCount : Integer
|
004EC533   8B400C                 mov     eax, [eax+$0C]
004EC536   50                     push    eax
004EC537   8D4DF8                 lea     ecx, [ebp-$08]
004EC53A   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004EC540   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EC542   E8AD6AFFFF             call    004E2FF4
004EC547   8B4DF8                 mov     ecx, [ebp-$08]
004EC54A   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: '  ЭБУ '
|
004EC54D   BA00C64E00             mov     edx, $004EC600

* Reference to: System.@LStrCat3;
|
004EC552   E8E187F1FF             call    00404D38
004EC557   8B55FC                 mov     edx, [ebp-$04]
004EC55A   58                     pop     eax

* Reference to: System.@LStrCmp;
|
004EC55B   E8D888F1FF             call    00404E38
004EC560   744E                   jz      004EC5B0
004EC562   803D19724F0000         cmp     byte ptr [$004F7219], $00
004EC569   7545                   jnz     004EC5B0
004EC56B   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004EC572   7E3C                   jle     004EC5B0

* Reference to TOptionsForm instance
|
004EC574   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004EC579   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.AutoSave : TCheckBox
|
004EC57B   8B8024030000           mov     eax, [eax+$0324]
004EC581   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004EC583   FF92C8000000           call    dword ptr [edx+$00C8]
004EC589   84C0                   test    al, al
004EC58B   7523                   jnz     004EC5B0
004EC58D   6A34                   push    $34

* Possible String Reference to: 'Внимание, отчет не сохранялся!'
|
004EC58F   6808C64E00             push    $004EC608

* Possible String Reference to: 'Сохранить файл отчета?'
|
004EC594   6828C64E00             push    $004EC628
004EC599   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EC59B   E8C8B2F1FF             call    00407868
004EC5A0   83F806                 cmp     eax, +$06
004EC5A3   750B                   jnz     004EC5B0

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EC5A5   8B8308030000           mov     eax, [ebx+$0308]
004EC5AB   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EC5AD   FF5244                 call    dword ptr [edx+$44]
004EC5B0   803D1C724F0001         cmp     byte ptr [$004F721C], $01
004EC5B7   7516                   jnz     004EC5CF
004EC5B9   C6051C724F0000         mov     byte ptr [$004F721C], $00
004EC5C0   B84C704F00             mov     eax, $004F704C

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EC5C5   E8A66AF1FF             call    00403070

|
004EC5CA   E8E562F1FF             call    004028B4
004EC5CF   33C0                   xor     eax, eax
004EC5D1   5A                     pop     edx
004EC5D2   59                     pop     ecx
004EC5D3   59                     pop     ecx
004EC5D4   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[YY]Г'
|
004EC5D7   68F1C54E00             push    $004EC5F1
004EC5DC   8D45F8                 lea     eax, [ebp-$08]
004EC5DF   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC5E4   E86784F1FF             call    00404A50
004EC5E9   C3                     ret


* Reference to: System.@HandleFinally;
|
004EC5EA   E9BD7DF1FF             jmp     004043AC
004EC5EF   EBEB                   jmp     004EC5DC

****** END
|
004EC5F1   5B                     pop     ebx
004EC5F2   59                     pop     ecx
004EC5F3   59                     pop     ecx
004EC5F4   5D                     pop     ebp
004EC5F5   C3                     ret

*)
end;

procedure TForm1.PortInit(Sender : TObject);
begin
(*
004E2818   55                     push    ebp
004E2819   8BEC                   mov     ebp, esp
004E281B   6A00                   push    $00
004E281D   6A00                   push    $00
004E281F   6A00                   push    $00
004E2821   53                     push    ebx
004E2822   56                     push    esi
004E2823   57                     push    edi
004E2824   8BF0                   mov     esi, eax
004E2826   BF7C6D4F00             mov     edi, $004F6D7C
004E282B   33C0                   xor     eax, eax
004E282D   55                     push    ebp
004E282E   68262A4E00             push    $004E2A26

***** TRY
|
004E2833   64FF30                 push    dword ptr fs:[eax]
004E2836   648920                 mov     fs:[eax], esp
004E2839   33DB                   xor     ebx, ebx
004E283B   6A00                   push    $00
004E283D   6A00                   push    $00
004E283F   6A03                   push    $03
004E2841   6A00                   push    $00
004E2843   6A00                   push    $00
004E2845   68000000C0             push    $C0000000
004E284A   8D55F8                 lea     edx, [ebp-$08]

* Reference to TOptionsForm instance
|
004E284D   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E2852   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.ComboBox_PortName : TComboBox
|
004E2854   8B8004030000           mov     eax, [eax+$0304]

* Reference to: Controls.TControl.GetText(TControl):TCaption;
|
004E285A   E805DAF7FF             call    00460264
004E285F   8B4DF8                 mov     ecx, [ebp-$08]
004E2862   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: '\\.\'
|
004E2865   BA402A4E00             mov     edx, $004E2A40

* Reference to: System.@LStrCat3;
|
004E286A   E8C924F2FF             call    00404D38
004E286F   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004E2872   E87526F2FF             call    00404EEC
004E2877   50                     push    eax

* Reference to: kernel32.CreateFileA()
|
004E2878   E86B46F2FF             call    00406EE8

* Reference to GlobalVar_004F6DC4
|
004E287D   A3C46D4F00             mov     dword ptr [$004F6DC4], eax
004E2882   833DC46D4F0000         cmp     dword ptr [$004F6DC4], +$00
004E2889   7D38                   jnl     004E28C3

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E288B   8B86F8020000           mov     eax, [esi+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E2891   8B8008020000           mov     eax, [eax+$0208]
004E2897   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E289C   E8F7D2F5FF             call    0043FB98
004E28A1   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E28A3   E84CD2F5FF             call    0043FAF4
004E28A8   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004E28AD   68482A4E00             push    $004E2A48

* Possible String Reference to: 'Порт недоступен'
|
004E28B2   68502A4E00             push    $004E2A50
004E28B7   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E28B9   E8AA4FF2FF             call    00407868
004E28BE   E93D010000             jmp     004E2A00
004E28C3   6800020000             push    $00000200
004E28C8   6800020000             push    $00000200
004E28CD   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28D2   50                     push    eax

* Reference to: kernel32.SetupComm()
|
004E28D3   E88048F2FF             call    00407158
004E28D8   6A0F                   push    $0F
004E28DA   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28DF   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004E28E0   E80348F2FF             call    004070E8
004E28E5   57                     push    edi
004E28E6   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E28EB   50                     push    eax

* Reference to: kernel32.GetCommState()
|
004E28EC   E8C746F2FF             call    00406FB8
004E28F1   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E28F8   7509                   jnz     004E2903
004E28FA   C7470480250000         mov     dword ptr [edi+$04], $00002580
004E2901   EB07                   jmp     004E290A
004E2903   C74704A0280000         mov     dword ptr [edi+$04], $000028A0
004E290A   C6471300               mov     byte ptr [edi+$13], $00
004E290E   C6471208               mov     byte ptr [edi+$12], $08
004E2912   C6471400               mov     byte ptr [edi+$14], $00
004E2916   33C0                   xor     eax, eax
004E2918   894708                 mov     [edi+$08], eax
004E291B   57                     push    edi
004E291C   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2921   50                     push    eax

* Reference to: kernel32.SetCommState()
|
004E2922   E8F147F2FF             call    00407118
004E2927   C705686D4F00DC050000   mov     dword ptr [$004F6D68], $000005DC
004E2931   C7056C6D4F000F000000   mov     dword ptr [$004F6D6C], $0000000F
004E293B   C705706D4F000F000000   mov     dword ptr [$004F6D70], $0000000F
004E2945   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6D74
|
004E2947   A3746D4F00             mov     dword ptr [$004F6D74], eax
004E294C   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6D78
|
004E294E   A3786D4F00             mov     dword ptr [$004F6D78], eax
004E2953   68686D4F00             push    $004F6D68
004E2958   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E295D   50                     push    eax

* Reference to: kernel32.SetCommTimeouts()
|
004E295E   E8BD47F2FF             call    00407120
004E2963   803D26724F0001         cmp     byte ptr [$004F7226], $01
004E296A   0F858E000000           jnz     004E29FE
004E2970   803D1C724F0000         cmp     byte ptr [$004F721C], $00
004E2977   0F8581000000           jnz     004E29FE
004E297D   8D45F4                 lea     eax, [ebp-$0C]

* Possible String Reference to: 'protokol.htm'
|
004E2980   B9682A4E00             mov     ecx, $004E2A68
004E2985   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E298B   E8A823F2FF             call    00404D38
004E2990   8B55F4                 mov     edx, [ebp-$0C]
004E2993   B84C704F00             mov     eax, $004F704C

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E2998   E82F05F2FF             call    00402ECC
004E299D   B84C704F00             mov     eax, $004F704C

* Reference to: System.@RewritText(TTextRec;TTextRec):Integer;
|
004E29A2   E8C102F2FF             call    00402C68

|
004E29A7   E808FFF1FF             call    004028B4
004E29AC   C6051C724F0001         mov     byte ptr [$004F721C], $01

* Possible String Reference to: '<html><head>'
|
004E29B3   BA802A4E00             mov     edx, $004E2A80
004E29B8   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E29BD   E84627F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E29C2   E8B90CF2FF             call    00403680

|
004E29C7   E8E8FEF1FF             call    004028B4

* Possible String Reference to: '<meta HTTP-EQUIV="Content-Type" CON
|                                TENT="text/html; CHARSET=windows-12
|                                51"></head>'
|
004E29CC   BA982A4E00             mov     edx, $004E2A98
004E29D1   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E29D6   E82D27F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E29DB   E8A00CF2FF             call    00403680

|
004E29E0   E8CFFEF1FF             call    004028B4

* Possible String Reference to: '<PRE><CODE>'
|
004E29E5   BAF42A4E00             mov     edx, $004E2AF4
004E29EA   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E29EF   E81427F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E29F4   E8870CF2FF             call    00403680

|
004E29F9   E8B6FEF1FF             call    004028B4
004E29FE   B301                   mov     bl, $01
004E2A00   33C0                   xor     eax, eax
004E2A02   5A                     pop     edx
004E2A03   59                     pop     ecx
004E2A04   59                     pop     ecx
004E2A05   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '‹Г_^[‹е]Г'
|
004E2A08   682D2A4E00             push    $004E2A2D
004E2A0D   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004E2A10   E81720F2FF             call    00404A2C
004E2A15   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E2A18   E80F20F2FF             call    00404A2C
004E2A1D   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2A20   E80720F2FF             call    00404A2C
004E2A25   C3                     ret


* Reference to: System.@HandleFinally;
|
004E2A26   E98119F2FF             jmp     004043AC
004E2A2B   EBE0                   jmp     004E2A0D

****** END
|
004E2A2D   8BC3                   mov     eax, ebx
004E2A2F   5F                     pop     edi
004E2A30   5E                     pop     esi
004E2A31   5B                     pop     ebx
004E2A32   8BE5                   mov     esp, ebp
004E2A34   5D                     pop     ebp
004E2A35   C3                     ret

*)
end;

procedure TForm1.WriteReadComm(Sender : TObject);
begin
(*
004E2E68   55                     push    ebp
004E2E69   8BEC                   mov     ebp, esp
004E2E6B   51                     push    ecx
004E2E6C   53                     push    ebx
004E2E6D   56                     push    esi
004E2E6E   57                     push    edi
004E2E6F   8BD9                   mov     ebx, ecx
004E2E71   85DB                   test    ebx, ebx
004E2E73   780A                   js      004E2E7F
004E2E75   C1EB02                 shr     ebx, $02
004E2E78   8B349A                 mov     esi, [edx+ebx*4]
004E2E7B   4B                     dec     ebx
004E2E7C   56                     push    esi
004E2E7D   79F9                   jns     004E2E78
004E2E7F   8BD4                   mov     edx, esp
004E2E81   8BF1                   mov     esi, ecx
004E2E83   8BFA                   mov     edi, edx
004E2E85   8945FC                 mov     [ebp-$04], eax
004E2E88   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E2E8F   742D                   jz      004E2EBE
004E2E91   C605A66D4F0000         mov     byte ptr [$004F6DA6], $00
004E2E98   8D5E01                 lea     ebx, [esi+$01]
004E2E9B   83EB02                 sub     ebx, +$02
004E2E9E   85DB                   test    ebx, ebx
004E2EA0   7C0F                   jl      004E2EB1
004E2EA2   43                     inc     ebx
004E2EA3   8BC7                   mov     eax, edi
004E2EA5   8A10                   mov     dl, byte ptr [eax]
004E2EA7   0015A66D4F00           add     [$004F6DA6], dl
004E2EAD   40                     inc     eax
004E2EAE   4B                     dec     ebx
004E2EAF   75F4                   jnz     004E2EA5
004E2EB1   8D4601                 lea     eax, [esi+$01]
004E2EB4   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E2EBA   885407FF               mov     [edi+eax-$01], dl
004E2EBE   6A0F                   push    $0F
004E2EC0   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2EC5   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004E2EC6   E81D42F2FF             call    004070E8
004E2ECB   8D5E01                 lea     ebx, [esi+$01]
004E2ECE   53                     push    ebx

* Possible String Reference to: 'Запрос'
|
004E2ECF   68BC2F4E00             push    $004E2FBC

* Possible String Reference to: 'FF0000'
|
004E2ED4   68CC2F4E00             push    $004E2FCC
004E2ED9   8BD7                   mov     edx, edi
004E2EDB   8BCE                   mov     ecx, esi

* Reference to Form1
|
004E2EDD   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.ZapProtokol()
|
004E2EE0   E81BFCFFFF             call    004E2B00
004E2EE5   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E2EEC   752A                   jnz     004E2F18
004E2EEE   4B                     dec     ebx
004E2EEF   85DB                   test    ebx, ebx
004E2EF1   7C39                   jl      004E2F2C
004E2EF3   43                     inc     ebx
004E2EF4   8BF7                   mov     esi, edi
004E2EF6   6A00                   push    $00
004E2EF8   689C6D4F00             push    $004F6D9C
004E2EFD   6A01                   push    $01
004E2EFF   56                     push    esi
004E2F00   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2F05   50                     push    eax

* Reference to: kernel32.WriteFile()
|
004E2F06   E88542F2FF             call    00407190
004E2F0B   6A05                   push    $05

* Reference to: kernel32.Sleep()
|
004E2F0D   E86AB4F2FF             call    0040E37C
004E2F12   46                     inc     esi
004E2F13   4B                     dec     ebx
004E2F14   75E0                   jnz     004E2EF6
004E2F16   EB14                   jmp     004E2F2C
004E2F18   6A00                   push    $00
004E2F1A   689C6D4F00             push    $004F6D9C
004E2F1F   53                     push    ebx
004E2F20   57                     push    edi
004E2F21   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2F26   50                     push    eax

* Reference to: kernel32.WriteFile()
|
004E2F27   E86442F2FF             call    00407190
004E2F2C   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E2F33   7420                   jz      004E2F55

* Reference to Form1
|
004E2F35   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E2F38   8B802C030000           mov     eax, [eax+$032C]
004E2F3E   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E2F40   E85F24F5FF             call    004353A4

* Reference to Form1
|
004E2F45   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E2F48   8B802C030000           mov     eax, [eax+$032C]
004E2F4E   B201                   mov     dl, $01

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E2F50   E84F24F5FF             call    004353A4
004E2F55   BA00010000             mov     edx, $00000100
004E2F5A   B8F86D4F00             mov     eax, $004F6DF8
004E2F5F   C60000                 mov     byte ptr [eax], $00
004E2F62   40                     inc     eax
004E2F63   4A                     dec     edx
004E2F64   75F9                   jnz     004E2F5F
004E2F66   6A00                   push    $00
004E2F68   68A06D4F00             push    $004F6DA0
004E2F6D   8B4508                 mov     eax, [ebp+$08]
004E2F70   50                     push    eax
004E2F71   68F86D4F00             push    $004F6DF8
004E2F76   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E2F7B   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004E2F7C   E86F41F2FF             call    004070F0
004E2F81   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004E2F86   50                     push    eax

* Possible String Reference to: 'Ответ'
|
004E2F87   68DC2F4E00             push    $004E2FDC

* Possible String Reference to: '0000FF'
|
004E2F8C   68EC2F4E00             push    $004E2FEC
004E2F91   BAF86D4F00             mov     edx, $004F6DF8
004E2F96   B9FF000000             mov     ecx, $000000FF

* Reference to Form1
|
004E2F9B   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.ZapProtokol()
|
004E2F9E   E85DFBFFFF             call    004E2B00
004E2FA3   8B7DF0                 mov     edi, [ebp-$10]
004E2FA6   8B75F4                 mov     esi, [ebp-$0C]
004E2FA9   8B5DF8                 mov     ebx, [ebp-$08]
004E2FAC   8BE5                   mov     esp, ebp
004E2FAE   5D                     pop     ebp
004E2FAF   C20400                 ret     $0004

*)
end;

procedure TForm1.PreobrTipECU(Sender : TObject);
begin
(*
004E2FF4   53                     push    ebx
004E2FF5   8BD9                   mov     ebx, ecx
004E2FF7   C6051B724F0000         mov     byte ptr [$004F721B], $00
004E2FFE   33C0                   xor     eax, eax
004E3000   8AC2                   mov     al, dl
004E3002   83C0EF                 add     eax, -$11
004E3005   83F833                 cmp     eax, +$33
004E3008   0F872F010000           jnbe    004E313D
004E300E   8A801B304E00           mov     al, byte ptr [eax+$4E301B]
004E3014   FF24854F304E00         jmp     dword ptr [$4E304F+eax*4]
004E301B   0102                   add     [edx], eax
004E301D   03040500000000         add     eax, [$0000+eax]
004E3024   0000                   add     [eax], al

*)
end;

procedure TForm1.TipECU_for_button(Sender : TObject);
begin
(*
004E3284   53                     push    ebx
004E3285   56                     push    esi
004E3286   8BD8                   mov     ebx, eax
004E3288   FECA                   dec     dl
004E328A   741D                   jz      004E32A9
004E328C   FECA                   dec     dl
004E328E   0F84BA000000           jz      004E334E
004E3294   FECA                   dec     dl
004E3296   0F84FB000000           jz      004E3397
004E329C   FECA                   dec     dl
004E329E   0F8463010000           jz      004E3407
004E32A4   E99E010000             jmp     004E3447
004E32A9   6A00                   push    $00

* Possible String Reference to: 'Dvig'
|
004E32AB   B954344E00             mov     ecx, $004E3454

* Possible String Reference to: 'Vib_tip_ECU'
|
004E32B0   BA64344E00             mov     edx, $004E3464
004E32B5   A120724F00             mov     eax, dword ptr [$004F7220]
004E32BA   8B30                   mov     esi, [eax]
004E32BC   FF5608                 call    dword ptr [esi+$08]
004E32BF   83F805                 cmp     eax, +$05
004E32C2   0F877F010000           jnbe    004E3447
004E32C8   FF2485CF324E00         jmp     dword ptr [$4E32CF+eax*4]
004E32CF   47                     inc     edi
004E32D0   344E                   xor     al, $4E
004E32D2   00E7                   add     bh, ah
004E32D4   324E00                 xor     cl, byte ptr [esi+$00]
004E32D7   FC                     cld
004E32D8   324E00                 xor     cl, byte ptr [esi+$00]
004E32DB   1133                   adc     [ebx], esi
004E32DD   4E                     dec     esi
004E32DE   0026                   add     [esi], ah
004E32E0   334E00                 xor     ecx, [esi+$00]
004E32E3   3B33                   cmp     esi, [ebx]
004E32E5   4E                     dec     esi
004E32E6   00BA78344E00           add     [edx+$4E3478], bh
004E32EC   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E32F2   E89DCFF7FF             call    00460294
004E32F7   E94B010000             jmp     004E3447

* Possible String Reference to: 'Двигатель (MR-140)'
|
004E32FC   BA98344E00             mov     edx, $004E3498
004E3301   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E3307   E888CFF7FF             call    00460294
004E330C   E936010000             jmp     004E3447

* Possible String Reference to: 'Двигатель (Sirius D32)'
|
004E3311   BAB4344E00             mov     edx, $004E34B4
004E3316   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E331C   E873CFF7FF             call    00460294
004E3321   E921010000             jmp     004E3447

* Possible String Reference to: 'Двигатель (Bosch M7.9.7.1)'
|
004E3326   BAD4344E00             mov     edx, $004E34D4
004E332B   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E3331   E85ECFF7FF             call    00460294
004E3336   E90C010000             jmp     004E3447

* Possible String Reference to: 'Двигатель (Nissan EFI)'
|
004E333B   BAF8344E00             mov     edx, $004E34F8
004E3340   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004E3346   E849CFF7FF             call    00460294
004E334B   5E                     pop     esi
004E334C   5B                     pop     ebx
004E334D   C3                     ret

*)
end;

procedure TForm1.VichMaxNomParam(Sender : TObject);
begin
(*
004E35F8   53                     push    ebx
004E35F9   56                     push    esi
004E35FA   57                     push    edi
004E35FB   B9A76D4F00             mov     ecx, $004F6DA7
004E3600   BED06D4F00             mov     esi, $004F6DD0
004E3605   BFD46D4F00             mov     edi, $004F6DD4
004E360A   33C0                   xor     eax, eax
004E360C   8906                   mov     [esi], eax
004E360E   33C0                   xor     eax, eax
004E3610   8907                   mov     [edi], eax
004E3612   BA77010000             mov     edx, $00000177
004E3617   B8AC224F00             mov     eax, $004F22AC
004E361C   8A18                   mov     bl, byte ptr [eax]
004E361E   3A19                   cmp     bl, byte ptr [ecx]
004E3620   7512                   jnz     004E3634
004E3622   83781001               cmp     dword ptr [eax+$10], +$01
004E3626   750C                   jnz     004E3634
004E3628   8B5804                 mov     ebx, [eax+$04]
004E362B   3B1E                   cmp     ebx, [esi]
004E362D   7E05                   jle     004E3634
004E362F   8B5804                 mov     ebx, [eax+$04]
004E3632   891E                   mov     [esi], ebx
004E3634   8A18                   mov     bl, byte ptr [eax]
004E3636   3A19                   cmp     bl, byte ptr [ecx]
004E3638   7512                   jnz     004E364C
004E363A   83781002               cmp     dword ptr [eax+$10], +$02
004E363E   750C                   jnz     004E364C
004E3640   8B5804                 mov     ebx, [eax+$04]
004E3643   3B1F                   cmp     ebx, [edi]
004E3645   7E05                   jle     004E364C
004E3647   8B5804                 mov     ebx, [eax+$04]
004E364A   891F                   mov     [edi], ebx
004E364C   83C024                 add     eax, +$24
004E364F   4A                     dec     edx
004E3650   75CA                   jnz     004E361C
004E3652   5F                     pop     edi
004E3653   5E                     pop     esi
004E3654   5B                     pop     ebx
004E3655   C3                     ret

*)
end;

procedure TForm1.Start(Sender : TObject);
begin
(*
004E40D8   55                     push    ebp
004E40D9   8BEC                   mov     ebp, esp
004E40DB   81C408FDFFFF           add     esp, $FFFFFD08
004E40E1   53                     push    ebx
004E40E2   56                     push    esi
004E40E3   33D2                   xor     edx, edx
004E40E5   8955E8                 mov     [ebp-$18], edx
004E40E8   8955F0                 mov     [ebp-$10], edx
004E40EB   8955EC                 mov     [ebp-$14], edx
004E40EE   8BD8                   mov     ebx, eax
004E40F0   33C0                   xor     eax, eax
004E40F2   55                     push    ebp

* Possible String Reference to: 'йЂдсялл^[‹е]ГВнимание, отчет не сох
|                                ранялся!'
|
004E40F3   68275F4E00             push    $004E5F27

***** TRY
|
004E40F8   64FF30                 push    dword ptr fs:[eax]
004E40FB   648920                 mov     fs:[eax], esp
004E40FE   833DC86D4F0001         cmp     dword ptr [$004F6DC8], +$01
004E4105   7D0A                   jnl     004E4111
004E4107   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DA5
|
004E410C   A2A56D4F00             mov     byte ptr [$004F6DA5], al
004E4111   A0A56D4F00             mov     al, byte ptr [$004F6DA5]
004E4116   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004E411C   743F                   jz      004E415D
004E411E   803D19724F0000         cmp     byte ptr [$004F7219], $00
004E4125   7536                   jnz     004E415D
004E4127   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E412E   7E2D                   jle     004E415D
004E4130   6834000400             push    $00040034

* Possible String Reference to: 'Внимание, отчет не сохранялся!'
|
004E4135   68345F4E00             push    $004E5F34

* Possible String Reference to: 'Вы выбрали новый тип блока...Сохран
|                                ить предыдущий файл отчета?'
|
004E413A   68545F4E00             push    $004E5F54
004E413F   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4141   E82237F2FF             call    00407868
004E4146   83F806                 cmp     eax, +$06
004E4149   750B                   jnz     004E4156

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E414B   8B8308030000           mov     eax, [ebx+$0308]
004E4151   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E4153   FF5244                 call    dword ptr [edx+$44]
004E4156   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E415D   A0A56D4F00             mov     al, byte ptr [$004F6DA5]
004E4162   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004E4168   7541                   jnz     004E41AB
004E416A   803D19724F0000         cmp     byte ptr [$004F7219], $00
004E4171   7538                   jnz     004E41AB
004E4173   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E417A   7E2F                   jle     004E41AB
004E417C   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E4183   7526                   jnz     004E41AB
004E4185   6834000400             push    $00040034

* Possible String Reference to: 'Внимание, отчет не сохранялся!'
|
004E418A   68345F4E00             push    $004E5F34

* Possible String Reference to: 'Сохранить файл отчета?'
|
004E418F   68985F4E00             push    $004E5F98
004E4194   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4196   E8CD36F2FF             call    00407868
004E419B   83F806                 cmp     eax, +$06
004E419E   750B                   jnz     004E41AB

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E41A0   8B8308030000           mov     eax, [ebx+$0308]
004E41A6   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E41A8   FF5244                 call    dword ptr [edx+$44]
004E41AB   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E41B2   7537                   jnz     004E41EB
004E41B4   33C0                   xor     eax, eax
004E41B6   8905E46D4F00           mov     [$004F6DE4], eax
004E41BC   8905E86D4F00           mov     [$004F6DE8], eax
004E41C2   33C0                   xor     eax, eax
004E41C4   8905DC6D4F00           mov     [$004F6DDC], eax
004E41CA   8905E06D4F00           mov     [$004F6DE0], eax
004E41D0   8BC3                   mov     eax, ebx

* Reference to : TForm1.VichMaxNomParam()
|
004E41D2   E821F4FFFF             call    004E35F8
004E41D7   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DC8
|
004E41D9   A3C86D4F00             mov     dword ptr [$004F6DC8], eax
004E41DE   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E41E0   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E41E6   E89DE9F8FF             call    00472B88
004E41EB   C6051F724F0000         mov     byte ptr [$004F721F], $00
004E41F2   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DB0
|
004E41F4   A3B06D4F00             mov     dword ptr [$004F6DB0], eax
004E41F9   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E41FB   8B8334030000           mov     eax, [ebx+$0334]
004E4201   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E4203   FF5164                 call    dword ptr [ecx+$64]
004E4206   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E4208   8B8328030000           mov     eax, [ebx+$0328]
004E420E   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E4210   FF5164                 call    dword ptr [ecx+$64]
004E4213   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E4215   8B8340030000           mov     eax, [ebx+$0340]
004E421B   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E421D   FF5164                 call    dword ptr [ecx+$64]
004E4220   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E4222   8B8348030000           mov     eax, [ebx+$0348]
004E4228   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E422A   FF5164                 call    dword ptr [ecx+$64]
004E422D   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E422F   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4235   E84EE9F8FF             call    00472B88
004E423A   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E423C   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4242   E841E9F8FF             call    00472B88
004E4247   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E4249   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E424F   E834E9F8FF             call    00472B88
004E4254   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004E4256   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E425C   E827E9F8FF             call    00472B88
004E4261   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E4263   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4269   E81AE9F8FF             call    00472B88

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E426E   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E4274   8B8008020000           mov     eax, [eax+$0208]
004E427A   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E427F   E814B9F5FF             call    0043FB98

* Possible String Reference to: '  Соединение...'
|
004E4284   BAB85F4E00             mov     edx, $004E5FB8

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E4289   E866B8F5FF             call    0043FAF4
004E428E   8BC3                   mov     eax, ebx

* Reference to : TForm1.PortInit()
|
004E4290   E883E5FFFF             call    004E2818
004E4295   84C0                   test    al, al
004E4297   0F846F1C0000           jz      004E5F0C

* Reference to TOptionsForm instance
|
004E429D   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E42A2   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.Altinit : TCheckBox
|
004E42A4   8B8020030000           mov     eax, [eax+$0320]
004E42AA   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004E42AC   FF92C8000000           call    dword ptr [edx+$00C8]
004E42B2   3C01                   cmp     al, $01
004E42B4   750C                   jnz     004E42C2
004E42B6   C705C06D4F0014000000   mov     dword ptr [$004F6DC0], $00000014
004E42C0   EB0A                   jmp     004E42CC
004E42C2   C705C06D4F0017000000   mov     dword ptr [$004F6DC0], $00000017
004E42CC   FF05C06D4F00           inc     dword ptr [$004F6DC0]
004E42D2   33F6                   xor     esi, esi
004E42D4   46                     inc     esi
004E42D5   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004E42D7   E878E9FAFF             call    00492C54
004E42DC   682C010000             push    $0000012C

* Reference to: kernel32.Sleep()
|
004E42E1   E896A0F2FF             call    0040E37C

* Reference to: SysUtils.Time:TDateTime;
|
004E42E6   E8396CF2FF             call    0040AF24
004E42EB   DD1D28724F00           fstp    qword ptr [$004F7228]
004E42F1   9B                     wait
004E42F2   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E42F9   0F858F000000           jnz     004E438E

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E42FF   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to: Controls.TControl.Refresh(TControl);
|
004E4305   E896C4F7FF             call    004607A0
004E430A   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E430F   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E4310   E8FB2DF2FF             call    00407110
004E4315   6820030000             push    $00000320

* Reference to: kernel32.Sleep()
|
004E431A   E85DA0F2FF             call    0040E37C
004E431F   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4324   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E4325   E8962BF2FF             call    00406EC0
004E432A   68C8000000             push    $000000C8

* Reference to: kernel32.Sleep()
|
004E432F   E848A0F2FF             call    0040E37C
004E4334   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4339   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E433A   E8D12DF2FF             call    00407110
004E433F   6890010000             push    $00000190

* Reference to: kernel32.Sleep()
|
004E4344   E833A0F2FF             call    0040E37C
004E4349   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E434E   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E434F   E86C2BF2FF             call    00406EC0
004E4354   68C8000000             push    $000000C8

* Reference to: kernel32.Sleep()
|
004E4359   E81EA0F2FF             call    0040E37C
004E435E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4363   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E4364   E8572BF2FF             call    00406EC0
004E4369   6820030000             push    $00000320

* Reference to: kernel32.Sleep()
|
004E436E   E809A0F2FF             call    0040E37C
004E4373   6A00                   push    $00
004E4375   68A06D4F00             push    $004F6DA0
004E437A   6A05                   push    $05
004E437C   68F86D4F00             push    $004F6DF8
004E4381   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4386   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004E4387   E8642DF2FF             call    004070F0
004E438C   EB7E                   jmp     004E440C

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E438E   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to: Controls.TControl.Refresh(TControl);
|
004E4394   E807C4F7FF             call    004607A0
004E4399   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E439E   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E439F   E81C2BF2FF             call    00406EC0
004E43A4   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E43A9   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E43AA   E8CD9FF2FF             call    0040E37C
004E43AF   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E43B4   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004E43B5   E8562DF2FF             call    00407110
004E43BA   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E43BF   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E43C0   E8B79FF2FF             call    0040E37C
004E43C5   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E43CA   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004E43CB   E8F02AF2FF             call    00406EC0
004E43D0   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004E43D5   50                     push    eax

* Reference to: kernel32.Sleep()
|
004E43D6   E8A19FF2FF             call    0040E37C
004E43DB   6A0C                   push    $0C
004E43DD   C645F881               mov     byte ptr [ebp-$08], $81
004E43E1   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E43E6   8845F9                 mov     [ebp-$07], al
004E43E9   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E43EE   8845FA                 mov     [ebp-$06], al
004E43F1   C645FB81               mov     byte ptr [ebp-$05], $81
004E43F5   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E43FA   8845FC                 mov     [ebp-$04], al
004E43FD   8D55F8                 lea     edx, [ebp-$08]
004E4400   B904000000             mov     ecx, $00000004
004E4405   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4407   E85CEAFFFF             call    004E2E68
004E440C   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E4413   7460                   jz      004E4475
004E4415   A0FA6D4F00             mov     al, byte ptr [$004F6DFA]
004E441A   3A05A96D4F00           cmp     al, byte ptr [$004F6DA9]
004E4420   7453                   jz      004E4475

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E4422   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E4428   8B8008020000           mov     eax, [eax+$0208]
004E442E   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E4433   E860B7F5FF             call    0043FB98

* Possible String Reference to: '  Проверьте адаптер'
|
004E4438   BAD05F4E00             mov     edx, $004E5FD0

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E443D   E8B2B6F5FF             call    0043FAF4
004E4442   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4447   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E4448   E87B2AF2FF             call    00406EC8
004E444D   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E444F   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E4455   E84A0FF5FF             call    004353A4
004E445A   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004E445F   68E45F4E00             push    $004E5FE4

* Possible String Reference to: 'Проверьте К-Line адаптер. Возможно 
|                                на него не подано напряжение.'
|
004E4464   68EC5F4E00             push    $004E5FEC
004E4469   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E446B   E8F833F2FF             call    00407868
004E4470   E9971A0000             jmp     004E5F0C
004E4475   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E447C   0F8488000000           jz      004E450A
004E4482   A0FF6D4F00             mov     al, byte ptr [$004F6DFF]
004E4487   3A05A86D4F00           cmp     al, byte ptr [$004F6DA8]
004E448D   7512                   jnz     004E44A1
004E448F   803D006E4F00C1         cmp     byte ptr [$004F6E00], $C1
004E4496   7472                   jz      004E450A
004E4498   803D016E4F00C1         cmp     byte ptr [$004F6E01], $C1
004E449F   7469                   jz      004E450A
004E44A1   83FE03                 cmp     esi, +$03
004E44A4   0F8C2AFEFFFF           jl      004E42D4
004E44AA   833DC06D4F001A         cmp     dword ptr [$004F6DC0], +$1A
004E44B1   0F8C15FEFFFF           jl      004E42CC

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E44B7   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E44BD   8B8008020000           mov     eax, [eax+$0208]
004E44C3   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E44C8   E8CBB6F5FF             call    0043FB98

* Possible String Reference to: '  ЭБУ не отвечает'
|
004E44CD   BA38604E00             mov     edx, $004E6038

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E44D2   E81DB6F5FF             call    0043FAF4
004E44D7   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E44DC   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E44DD   E8E629F2FF             call    00406EC8
004E44E2   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E44E4   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E44EA   E8B50EF5FF             call    004353A4
004E44EF   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004E44F4   68E45F4E00             push    $004E5FE4

* Possible String Reference to: 'ЭБУ не отвечает. Проверьте подключе
|                                ние линии диагностики.Для диагности
|                                ки некоторых систем требуетсяпереко
|                                ммутация диагностической линии.'
|
004E44F9   684C604E00             push    $004E604C
004E44FE   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4500   E86333F2FF             call    00407868
004E4505   E9021A0000             jmp     004E5F0C
004E450A   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E4511   7577                   jnz     004E458A
004E4513   6A11                   push    $11
004E4515   C645F47F               mov     byte ptr [ebp-$0C], $7F
004E4519   8D55F4                 lea     edx, [ebp-$0C]
004E451C   33C9                   xor     ecx, ecx
004E451E   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4520   E843E9FFFF             call    004E2E68
004E4525   803DF86D4F007F         cmp     byte ptr [$004F6DF8], $7F
004E452C   0F85F0FEFFFF           jnz     004E4422
004E4532   803DF96D4F000E         cmp     byte ptr [$004F6DF9], $0E
004E4539   7509                   jnz     004E4544
004E453B   803DFA6D4F00A0         cmp     byte ptr [$004F6DFA], $A0
004E4542   7446                   jz      004E458A

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E4544   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E454A   8B8008020000           mov     eax, [eax+$0208]
004E4550   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E4555   E83EB6F5FF             call    0043FB98

* Possible String Reference to: '  ЭБУ не отвечает'
|
004E455A   BA38604E00             mov     edx, $004E6038

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E455F   E890B5F5FF             call    0043FAF4
004E4564   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004E4569   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004E456A   E85929F2FF             call    00406EC8
004E456F   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004E4574   68E45F4E00             push    $004E5FE4

* Possible String Reference to: 'ЭБУ не отвечает. Возможно адаптер н
|                                е подключенк 13-му контакту разъема
|                                 диагностики.'
|
004E4579   68D8604E00             push    $004E60D8
004E457E   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E4580   E8E332F2FF             call    00407868
004E4585   E982190000             jmp     004E5F0C
004E458A   8D4DEC                 lea     ecx, [ebp-$14]
004E458D   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004E4593   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004E4595   E85AEAFFFF             call    004E2FF4
004E459A   8B4DEC                 mov     ecx, [ebp-$14]
004E459D   8D45F0                 lea     eax, [ebp-$10]

* Possible String Reference to: '  Подключен ЭБУ: '
|
004E45A0   BA38614E00             mov     edx, $004E6138

* Reference to: System.@LStrCat3;
|
004E45A5   E88E07F2FF             call    00404D38
004E45AA   8B45F0                 mov     eax, [ebp-$10]
004E45AD   50                     push    eax

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E45AE   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E45B4   8B8008020000           mov     eax, [eax+$0208]
004E45BA   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E45BF   E8D4B5F5FF             call    0043FB98
004E45C4   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E45C5   E82AB5F5FF             call    0043FAF4
004E45CA   C6051F724F0001         mov     byte ptr [$004F721F], $01
004E45D1   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E45D8   753B                   jnz     004E4615
004E45DA   8D45E8                 lea     eax, [ebp-$18]

* Possible String Reference to: 'temp.tmp'
|
004E45DD   B954614E00             mov     ecx, $004E6154
004E45E2   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004E45E8   E84B07F2FF             call    00404D38
004E45ED   8B55E8                 mov     edx, [ebp-$18]
004E45F0   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E45F5   E8D2E8F1FF             call    00402ECC
004E45FA   BA01000000             mov     edx, $00000001
004E45FF   B8006F4F00             mov     eax, $004F6F00

* Reference to: CommCtrl.TreeView_GetChild(HWND;HTREEITEM):HTREEITEM;
|
004E4604   E823EEF1FF             call    0040342C

|
004E4609   E8A6E2F1FF             call    004028B4
004E460E   C6051D724F0001         mov     byte ptr [$004F721D], $01
004E4615   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E4617   8B8334030000           mov     eax, [ebx+$0334]
004E461D   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E461F   FF5164                 call    dword ptr [ecx+$64]
004E4622   B201                   mov     dl, $01

* Reference to control TForm1.Button_Parameters : TButton
|
004E4624   8B8328030000           mov     eax, [ebx+$0328]
004E462A   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E462C   FF5164                 call    dword ptr [ecx+$64]
004E462F   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E4631   8B8340030000           mov     eax, [ebx+$0340]
004E4637   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E4639   FF5164                 call    dword ptr [ecx+$64]
004E463C   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004E463E   8B8348030000           mov     eax, [ebx+$0348]
004E4644   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E4646   FF5164                 call    dword ptr [ecx+$64]
004E4649   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E464B   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4651   E832E5F8FF             call    00472B88
004E4656   B201                   mov     dl, $01

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E4658   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E465E   E825E5F8FF             call    00472B88
004E4663   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E4665   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E466B   E818E5F8FF             call    00472B88
004E4670   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Test : TMenuItem
|
004E4672   8B8350030000           mov     eax, [ebx+$0350]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4678   E80BE5F8FF             call    00472B88
004E467D   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Start : TMenuItem
|
004E467F   8B8318030000           mov     eax, [ebx+$0318]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4685   E8FEE4F8FF             call    00472B88
004E468A   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E468C   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E4692   E8F1E4F8FF             call    00472B88
004E4697   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Setting : TMenuItem
|
004E4699   8B8354030000           mov     eax, [ebx+$0354]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E469F   E8E4E4F8FF             call    00472B88
004E46A4   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Load : TMenuItem
|
004E46A6   8B830C030000           mov     eax, [ebx+$030C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E46AC   E8D7E4F8FF             call    00472B88
004E46B1   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004E46B8   7414                   jz      004E46CE
004E46BA   33F6                   xor     esi, esi
004E46BC   B8F86D4F00             mov     eax, $004F6DF8
004E46C1   C60000                 mov     byte ptr [eax], $00
004E46C4   46                     inc     esi
004E46C5   40                     inc     eax
004E46C6   81FE80000000           cmp     esi, $00000080
004E46CC   75F3                   jnz     004E46C1
004E46CE   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DF8
|
004E46D3   A2F86D4F00             mov     byte ptr [$004F6DF8], al
004E46D8   A0A76D4F00             mov     al, byte ptr [$004F6DA7]

* Reference to GlobalVar_004F6DA5
|
004E46DD   A2A56D4F00             mov     byte ptr [$004F6DA5], al
004E46E2   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E46E9   7536                   jnz     004E4721
004E46EB   68CC6D4F00             push    $004F6DCC
004E46F0   BAF86D4F00             mov     edx, $004F6DF8
004E46F5   B980000000             mov     ecx, $00000080
004E46FA   B8006F4F00             mov     eax, $004F6F00

|
004E46FF   E84CE9F1FF             call    00403050

|
004E4704   E8ABE1F1FF             call    004028B4
004E4709   C60525724F0000         mov     byte ptr [$004F7225], $00

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E4710   8B8334030000           mov     eax, [ebx+$0334]
004E4716   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004E471A   E8F5F6F1FF             call    00403E14
004E471F   EB0D                   jmp     004E472E
004E4721   B201                   mov     dl, $01

* Reference to control TForm1.TimerParam : TTimer
|
004E4723   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E4729   E8760CF5FF             call    004353A4
004E472E   6A4B                   push    $4B

* Reference to: kernel32.Sleep()
|
004E4730   E8479CF2FF             call    0040E37C
004E4735   33C0                   xor     eax, eax
004E4737   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E473C   83F822                 cmp     eax, +$22
004E473F   7F1E                   jnle    004E475F
004E4741   0F84B9100000           jz      004E5800
004E4747   83E811                 sub     eax, +$11
004E474A   742A                   jz      004E4776
004E474C   48                     dec     eax
004E474D   0F8414030000           jz      004E4A67
004E4753   48                     dec     eax
004E4754   0F84C90C0000           jz      004E5423
004E475A   E945170000             jmp     004E5EA4
004E475F   83E831                 sub     eax, +$31
004E4762   0F8489130000           jz      004E5AF1
004E4768   83E810                 sub     eax, +$10
004E476B   0F84C6130000           jz      004E5B37
004E4771   E92E170000             jmp     004E5EA4
004E4776   68FF000000             push    $000000FF
004E477B   C68558FFFFFF80         mov     byte ptr [ebp+$FFFFFF58], $80
004E4782   C68559FFFFFF11         mov     byte ptr [ebp+$FFFFFF59], $11
004E4789   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E478E   88855AFFFFFF           mov     [ebp+$FFFFFF5A], al
004E4794   C6855BFFFFFF89         mov     byte ptr [ebp+$FFFFFF5B], $89
004E479B   C6855CFFFFFF2C         mov     byte ptr [ebp+$FFFFFF5C], $2C
004E47A2   C6855DFFFFFFF0         mov     byte ptr [ebp+$FFFFFF5D], $F0
004E47A9   C6855EFFFFFF01         mov     byte ptr [ebp+$FFFFFF5E], $01
004E47B0   C6855FFFFFFF01         mov     byte ptr [ebp+$FFFFFF5F], $01
004E47B7   C68560FFFFFF01         mov     byte ptr [ebp+$FFFFFF60], $01
004E47BE   C68561FFFFFF0C         mov     byte ptr [ebp+$FFFFFF61], $0C
004E47C5   C68562FFFFFF01         mov     byte ptr [ebp+$FFFFFF62], $01
004E47CC   C68563FFFFFF01         mov     byte ptr [ebp+$FFFFFF63], $01
004E47D3   C68564FFFFFF02         mov     byte ptr [ebp+$FFFFFF64], $02
004E47DA   C68565FFFFFF01         mov     byte ptr [ebp+$FFFFFF65], $01
004E47E1   C68566FFFFFF0C         mov     byte ptr [ebp+$FFFFFF66], $0C
004E47E8   C68567FFFFFF20         mov     byte ptr [ebp+$FFFFFF67], $20
004E47EF   C68568FFFFFF01         mov     byte ptr [ebp+$FFFFFF68], $01
004E47F6   C68569FFFFFF03         mov     byte ptr [ebp+$FFFFFF69], $03
004E47FD   C6856AFFFFFF01         mov     byte ptr [ebp+$FFFFFF6A], $01
004E4804   C6856BFFFFFF0B         mov     byte ptr [ebp+$FFFFFF6B], $0B
004E480B   C6856CFFFFFF01         mov     byte ptr [ebp+$FFFFFF6C], $01
004E4812   C6856DFFFFFF01         mov     byte ptr [ebp+$FFFFFF6D], $01
004E4819   C6856EFFFFFF04         mov     byte ptr [ebp+$FFFFFF6E], $04
004E4820   C6856FFFFFFF01         mov     byte ptr [ebp+$FFFFFF6F], $01
004E4827   C68570FFFFFF0B         mov     byte ptr [ebp+$FFFFFF70], $0B
004E482E   C68571FFFFFF08         mov     byte ptr [ebp+$FFFFFF71], $08
004E4835   C68572FFFFFF01         mov     byte ptr [ebp+$FFFFFF72], $01
004E483C   C68573FFFFFF05         mov     byte ptr [ebp+$FFFFFF73], $05
004E4843   C68574FFFFFF01         mov     byte ptr [ebp+$FFFFFF74], $01
004E484A   C68575FFFFFF0B         mov     byte ptr [ebp+$FFFFFF75], $0B
004E4851   C68576FFFFFF09         mov     byte ptr [ebp+$FFFFFF76], $09
004E4858   C68577FFFFFF01         mov     byte ptr [ebp+$FFFFFF77], $01
004E485F   C68578FFFFFF06         mov     byte ptr [ebp+$FFFFFF78], $06
004E4866   C68579FFFFFF05         mov     byte ptr [ebp+$FFFFFF79], $05
004E486D   C6857AFFFFFF0B         mov     byte ptr [ebp+$FFFFFF7A], $0B
004E4874   C6857BFFFFFF11         mov     byte ptr [ebp+$FFFFFF7B], $11
004E487B   C6857CFFFFFF01         mov     byte ptr [ebp+$FFFFFF7C], $01
004E4882   C6857DFFFFFF0B         mov     byte ptr [ebp+$FFFFFF7D], $0B
004E4889   C6857EFFFFFF02         mov     byte ptr [ebp+$FFFFFF7E], $02
004E4890   C6857FFFFFFF06         mov     byte ptr [ebp+$FFFFFF7F], $06
004E4897   C6458002               mov     byte ptr [ebp-$80], $02
004E489B   C6458101               mov     byte ptr [ebp-$7F], $01
004E489F   C645820D               mov     byte ptr [ebp-$7E], $0D
004E48A3   C6458301               mov     byte ptr [ebp-$7D], $01
004E48A7   C6458405               mov     byte ptr [ebp-$7C], $05
004E48AB   C6458506               mov     byte ptr [ebp-$7B], $06
004E48AF   C6458601               mov     byte ptr [ebp-$7A], $01
004E48B3   C645870E               mov     byte ptr [ebp-$79], $0E
004E48B7   C6458801               mov     byte ptr [ebp-$78], $01
004E48BB   C6458905               mov     byte ptr [ebp-$77], $05
004E48BF   C6458A07               mov     byte ptr [ebp-$76], $07
004E48C3   C6458B01               mov     byte ptr [ebp-$75], $01
004E48C7   C6458C0F               mov     byte ptr [ebp-$74], $0F
004E48CB   C6458D02               mov     byte ptr [ebp-$73], $02
004E48CF   C6458E04               mov     byte ptr [ebp-$72], $04
004E48D3   C6458F02               mov     byte ptr [ebp-$71], $02
004E48D7   C6459001               mov     byte ptr [ebp-$70], $01
004E48DB   C6459111               mov     byte ptr [ebp-$6F], $11
004E48DF   C6459202               mov     byte ptr [ebp-$6E], $02
004E48E3   C6459304               mov     byte ptr [ebp-$6D], $04
004E48E7   C6459406               mov     byte ptr [ebp-$6C], $06
004E48EB   C6459501               mov     byte ptr [ebp-$6B], $01
004E48EF   C6459613               mov     byte ptr [ebp-$6A], $13
004E48F3   C6459702               mov     byte ptr [ebp-$69], $02
004E48F7   C6459804               mov     byte ptr [ebp-$68], $04
004E48FB   C6459912               mov     byte ptr [ebp-$67], $12
004E48FF   C6459A01               mov     byte ptr [ebp-$66], $01
004E4903   C6459B15               mov     byte ptr [ebp-$65], $15
004E4907   C6459C02               mov     byte ptr [ebp-$64], $02
004E490B   C6459D04               mov     byte ptr [ebp-$63], $04
004E490F   C6459E16               mov     byte ptr [ebp-$62], $16
004E4913   C6459F01               mov     byte ptr [ebp-$61], $01
004E4917   C645A017               mov     byte ptr [ebp-$60], $17
004E491B   C645A104               mov     byte ptr [ebp-$5F], $04
004E491F   C645A203               mov     byte ptr [ebp-$5E], $03
004E4923   C645A301               mov     byte ptr [ebp-$5D], $01
004E4927   C645A401               mov     byte ptr [ebp-$5C], $01
004E492B   C645A51B               mov     byte ptr [ebp-$5B], $1B
004E492F   C645A601               mov     byte ptr [ebp-$5A], $01
004E4933   C645A703               mov     byte ptr [ebp-$59], $03
004E4937   C645A807               mov     byte ptr [ebp-$58], $07
004E493B   C645A901               mov     byte ptr [ebp-$57], $01
004E493F   C645AA1C               mov     byte ptr [ebp-$56], $1C
004E4943   C645AB01               mov     byte ptr [ebp-$55], $01
004E4947   C645AC01               mov     byte ptr [ebp-$54], $01
004E494B   C645AD07               mov     byte ptr [ebp-$53], $07
004E494F   C645AE01               mov     byte ptr [ebp-$52], $01
004E4953   C645AF1D               mov     byte ptr [ebp-$51], $1D
004E4957   C645B001               mov     byte ptr [ebp-$50], $01
004E495B   C645B101               mov     byte ptr [ebp-$4F], $01
004E495F   C645B208               mov     byte ptr [ebp-$4E], $08
004E4963   C645B301               mov     byte ptr [ebp-$4D], $01
004E4967   C645B41E               mov     byte ptr [ebp-$4C], $1E
004E496B   C645B501               mov     byte ptr [ebp-$4B], $01
004E496F   C645B604               mov     byte ptr [ebp-$4A], $04
004E4973   C645B709               mov     byte ptr [ebp-$49], $09
004E4977   C645B801               mov     byte ptr [ebp-$48], $01
004E497B   C645B91F               mov     byte ptr [ebp-$47], $1F
004E497F   C645BA01               mov     byte ptr [ebp-$46], $01
004E4983   C645BB04               mov     byte ptr [ebp-$45], $04
004E4987   C645BC0D               mov     byte ptr [ebp-$44], $0D
004E498B   C645BD01               mov     byte ptr [ebp-$43], $01
004E498F   C645BE20               mov     byte ptr [ebp-$42], $20
004E4993   C645BF01               mov     byte ptr [ebp-$41], $01
004E4997   C645C00C               mov     byte ptr [ebp-$40], $0C
004E499B   C645C104               mov     byte ptr [ebp-$3F], $04
004E499F   C645C201               mov     byte ptr [ebp-$3E], $01
004E49A3   C645C321               mov     byte ptr [ebp-$3D], $21
004E49A7   C645C401               mov     byte ptr [ebp-$3C], $01
004E49AB   C645C514               mov     byte ptr [ebp-$3B], $14
004E49AF   C645C609               mov     byte ptr [ebp-$3A], $09
004E49B3   C645C701               mov     byte ptr [ebp-$39], $01
004E49B7   C645C822               mov     byte ptr [ebp-$38], $22
004E49BB   C645C902               mov     byte ptr [ebp-$37], $02
004E49BF   C645CA01               mov     byte ptr [ebp-$36], $01
004E49C3   C645CB02               mov     byte ptr [ebp-$35], $02
004E49C7   C645CC01               mov     byte ptr [ebp-$34], $01
004E49CB   C645CD24               mov     byte ptr [ebp-$33], $24
004E49CF   C645CE02               mov     byte ptr [ebp-$32], $02
004E49D3   C645CF01               mov     byte ptr [ebp-$31], $01
004E49D7   C645D004               mov     byte ptr [ebp-$30], $04
004E49DB   C645D101               mov     byte ptr [ebp-$2F], $01
004E49DF   C645D226               mov     byte ptr [ebp-$2E], $26
004E49E3   C645D302               mov     byte ptr [ebp-$2D], $02
004E49E7   C645D401               mov     byte ptr [ebp-$2C], $01
004E49EB   C645D506               mov     byte ptr [ebp-$2B], $06
004E49EF   C645D601               mov     byte ptr [ebp-$2A], $01
004E49F3   C645D728               mov     byte ptr [ebp-$29], $28
004E49F7   C645D802               mov     byte ptr [ebp-$28], $02
004E49FB   C645D901               mov     byte ptr [ebp-$27], $01
004E49FF   C645DA1C               mov     byte ptr [ebp-$26], $1C
004E4A03   C645DB01               mov     byte ptr [ebp-$25], $01
004E4A07   C645DC2A               mov     byte ptr [ebp-$24], $2A
004E4A0B   C645DD02               mov     byte ptr [ebp-$23], $02
004E4A0F   C645DE01               mov     byte ptr [ebp-$22], $01
004E4A13   C645DF20               mov     byte ptr [ebp-$21], $20
004E4A17   C645E001               mov     byte ptr [ebp-$20], $01
004E4A1B   C645E12C               mov     byte ptr [ebp-$1F], $2C
004E4A1F   C645E202               mov     byte ptr [ebp-$1E], $02
004E4A23   C645E301               mov     byte ptr [ebp-$1D], $01
004E4A27   C645E416               mov     byte ptr [ebp-$1C], $16
004E4A2B   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E4A30   8845E5                 mov     [ebp-$1B], al
004E4A33   8D9558FFFFFF           lea     edx, [ebp+$FFFFFF58]
004E4A39   B98D000000             mov     ecx, $0000008D
004E4A3E   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4A40   E823E4FFFF             call    004E2E68
004E4A45   803D896E4F006C         cmp     byte ptr [$004F6E89], $6C
004E4A4C   750D                   jnz     004E4A5B
004E4A4E   803D8A6E4F00F0         cmp     byte ptr [$004F6E8A], $F0
004E4A55   0F8449140000           jz      004E5EA4
004E4A5B   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E4A5D   E8224D0000             call    004E9784
004E4A62   E9A5140000             jmp     004E5F0C
004E4A67   68FF000000             push    $000000FF
004E4A6C   C685B4FEFFFF80         mov     byte ptr [ebp+$FFFFFEB4], $80
004E4A73   C685B5FEFFFF11         mov     byte ptr [ebp+$FFFFFEB5], $11
004E4A7A   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E4A7F   8885B6FEFFFF           mov     [ebp+$FFFFFEB6], al
004E4A85   C685B7FEFFFF9E         mov     byte ptr [ebp+$FFFFFEB7], $9E
004E4A8C   C685B8FEFFFF2C         mov     byte ptr [ebp+$FFFFFEB8], $2C
004E4A93   C685B9FEFFFFF0         mov     byte ptr [ebp+$FFFFFEB9], $F0
004E4A9A   C685BAFEFFFF02         mov     byte ptr [ebp+$FFFFFEBA], $02
004E4AA1   C685BBFEFFFF01         mov     byte ptr [ebp+$FFFFFEBB], $01
004E4AA8   C685BCFEFFFF01         mov     byte ptr [ebp+$FFFFFEBC], $01
004E4AAF   C685BDFEFFFF00         mov     byte ptr [ebp+$FFFFFEBD], $00
004E4AB6   C685BEFEFFFF0B         mov     byte ptr [ebp+$FFFFFEBE], $0B
004E4ABD   C685BFFEFFFF01         mov     byte ptr [ebp+$FFFFFEBF], $01
004E4AC4   C685C0FEFFFF02         mov     byte ptr [ebp+$FFFFFEC0], $02
004E4ACB   C685C1FEFFFF02         mov     byte ptr [ebp+$FFFFFEC1], $02
004E4AD2   C685C2FEFFFF01         mov     byte ptr [ebp+$FFFFFEC2], $01
004E4AD9   C685C3FEFFFF00         mov     byte ptr [ebp+$FFFFFEC3], $00
004E4AE0   C685C4FEFFFF0D         mov     byte ptr [ebp+$FFFFFEC4], $0D
004E4AE7   C685C5FEFFFF01         mov     byte ptr [ebp+$FFFFFEC5], $01
004E4AEE   C685C6FEFFFF02         mov     byte ptr [ebp+$FFFFFEC6], $02
004E4AF5   C685C7FEFFFF03         mov     byte ptr [ebp+$FFFFFEC7], $03
004E4AFC   C685C8FEFFFF01         mov     byte ptr [ebp+$FFFFFEC8], $01
004E4B03   C685C9FEFFFF00         mov     byte ptr [ebp+$FFFFFEC9], $00
004E4B0A   C685CAFEFFFF0E         mov     byte ptr [ebp+$FFFFFECA], $0E
004E4B11   C685CBFEFFFF01         mov     byte ptr [ebp+$FFFFFECB], $01
004E4B18   C685CCFEFFFF02         mov     byte ptr [ebp+$FFFFFECC], $02
004E4B1F   C685CDFEFFFF04         mov     byte ptr [ebp+$FFFFFECD], $04
004E4B26   C685CEFEFFFF01         mov     byte ptr [ebp+$FFFFFECE], $01
004E4B2D   C685CFFEFFFF00         mov     byte ptr [ebp+$FFFFFECF], $00
004E4B34   C685D0FEFFFF0F         mov     byte ptr [ebp+$FFFFFED0], $0F
004E4B3B   C685D1FEFFFF01         mov     byte ptr [ebp+$FFFFFED1], $01
004E4B42   C685D2FEFFFF02         mov     byte ptr [ebp+$FFFFFED2], $02
004E4B49   C685D3FEFFFF05         mov     byte ptr [ebp+$FFFFFED3], $05
004E4B50   C685D4FEFFFF01         mov     byte ptr [ebp+$FFFFFED4], $01
004E4B57   C685D5FEFFFF00         mov     byte ptr [ebp+$FFFFFED5], $00
004E4B5E   C685D6FEFFFF11         mov     byte ptr [ebp+$FFFFFED6], $11
004E4B65   C685D7FEFFFF01         mov     byte ptr [ebp+$FFFFFED7], $01
004E4B6C   C685D8FEFFFF02         mov     byte ptr [ebp+$FFFFFED8], $02
004E4B73   C685D9FEFFFF06         mov     byte ptr [ebp+$FFFFFED9], $06
004E4B7A   C685DAFEFFFF02         mov     byte ptr [ebp+$FFFFFEDA], $02
004E4B81   C685DBFEFFFF11         mov     byte ptr [ebp+$FFFFFEDB], $11
004E4B88   C685DCFEFFFFAC         mov     byte ptr [ebp+$FFFFFEDC], $AC
004E4B8F   C685DDFEFFFF01         mov     byte ptr [ebp+$FFFFFEDD], $01
004E4B96   C685DEFEFFFF02         mov     byte ptr [ebp+$FFFFFEDE], $02
004E4B9D   C685DFFEFFFF08         mov     byte ptr [ebp+$FFFFFEDF], $08
004E4BA4   C685E0FEFFFF01         mov     byte ptr [ebp+$FFFFFEE0], $01
004E4BAB   C685E1FEFFFF00         mov     byte ptr [ebp+$FFFFFEE1], $00
004E4BB2   C685E2FEFFFF04         mov     byte ptr [ebp+$FFFFFEE2], $04
004E4BB9   C685E3FEFFFF01         mov     byte ptr [ebp+$FFFFFEE3], $01
004E4BC0   C685E4FEFFFF02         mov     byte ptr [ebp+$FFFFFEE4], $02
004E4BC7   C685E5FEFFFF09         mov     byte ptr [ebp+$FFFFFEE5], $09
004E4BCE   C685E6FEFFFF01         mov     byte ptr [ebp+$FFFFFEE6], $01
004E4BD5   C685E7FEFFFF11         mov     byte ptr [ebp+$FFFFFEE7], $11
004E4BDC   C685E8FEFFFF92         mov     byte ptr [ebp+$FFFFFEE8], $92
004E4BE3   C685E9FEFFFF01         mov     byte ptr [ebp+$FFFFFEE9], $01
004E4BEA   C685EAFEFFFF02         mov     byte ptr [ebp+$FFFFFEEA], $02
004E4BF1   C685EBFEFFFF0A         mov     byte ptr [ebp+$FFFFFEEB], $0A
004E4BF8   C685ECFEFFFF02         mov     byte ptr [ebp+$FFFFFEEC], $02
004E4BFF   C685EDFEFFFF00         mov     byte ptr [ebp+$FFFFFEED], $00
004E4C06   C685EEFEFFFF0C         mov     byte ptr [ebp+$FFFFFEEE], $0C
004E4C0D   C685EFFEFFFF01         mov     byte ptr [ebp+$FFFFFEEF], $01
004E4C14   C685F0FEFFFF02         mov     byte ptr [ebp+$FFFFFEF0], $02
004E4C1B   C685F1FEFFFF0C         mov     byte ptr [ebp+$FFFFFEF1], $0C
004E4C22   C685F2FEFFFF02         mov     byte ptr [ebp+$FFFFFEF2], $02
004E4C29   C685F3FEFFFF12         mov     byte ptr [ebp+$FFFFFEF3], $12
004E4C30   C685F4FEFFFFE3         mov     byte ptr [ebp+$FFFFFEF4], $E3
004E4C37   C685F5FEFFFF01         mov     byte ptr [ebp+$FFFFFEF5], $01
004E4C3E   C685F6FEFFFF02         mov     byte ptr [ebp+$FFFFFEF6], $02
004E4C45   C685F7FEFFFF0E         mov     byte ptr [ebp+$FFFFFEF7], $0E
004E4C4C   C685F8FEFFFF01         mov     byte ptr [ebp+$FFFFFEF8], $01
004E4C53   C685F9FEFFFF11         mov     byte ptr [ebp+$FFFFFEF9], $11
004E4C5A   C685FAFEFFFF41         mov     byte ptr [ebp+$FFFFFEFA], $41
004E4C61   C685FBFEFFFF01         mov     byte ptr [ebp+$FFFFFEFB], $01
004E4C68   C685FCFEFFFF02         mov     byte ptr [ebp+$FFFFFEFC], $02
004E4C6F   C685FDFEFFFF0F         mov     byte ptr [ebp+$FFFFFEFD], $0F
004E4C76   C685FEFEFFFF01         mov     byte ptr [ebp+$FFFFFEFE], $01
004E4C7D   C685FFFEFFFF11         mov     byte ptr [ebp+$FFFFFEFF], $11
004E4C84   C68500FFFFFF43         mov     byte ptr [ebp+$FFFFFF00], $43
004E4C8B   C68501FFFFFF01         mov     byte ptr [ebp+$FFFFFF01], $01
004E4C92   C68502FFFFFF02         mov     byte ptr [ebp+$FFFFFF02], $02
004E4C99   C68503FFFFFF10         mov     byte ptr [ebp+$FFFFFF03], $10
004E4CA0   C68504FFFFFF01         mov     byte ptr [ebp+$FFFFFF04], $01
004E4CA7   C68505FFFFFF11         mov     byte ptr [ebp+$FFFFFF05], $11
004E4CAE   C68506FFFFFF45         mov     byte ptr [ebp+$FFFFFF06], $45
004E4CB5   C68507FFFFFF01         mov     byte ptr [ebp+$FFFFFF07], $01
004E4CBC   C68508FFFFFF02         mov     byte ptr [ebp+$FFFFFF08], $02
004E4CC3   C68509FFFFFF11         mov     byte ptr [ebp+$FFFFFF09], $11
004E4CCA   C6850AFFFFFF01         mov     byte ptr [ebp+$FFFFFF0A], $01
004E4CD1   C6850BFFFFFF11         mov     byte ptr [ebp+$FFFFFF0B], $11
004E4CD8   C6850CFFFFFF46         mov     byte ptr [ebp+$FFFFFF0C], $46
004E4CDF   C6850DFFFFFF01         mov     byte ptr [ebp+$FFFFFF0D], $01
004E4CE6   C6850EFFFFFF02         mov     byte ptr [ebp+$FFFFFF0E], $02
004E4CED   C6850FFFFFFF12         mov     byte ptr [ebp+$FFFFFF0F], $12
004E4CF4   C68510FFFFFF01         mov     byte ptr [ebp+$FFFFFF10], $01
004E4CFB   C68511FFFFFF00         mov     byte ptr [ebp+$FFFFFF11], $00
004E4D02   C68512FFFFFF07         mov     byte ptr [ebp+$FFFFFF12], $07
004E4D09   C68513FFFFFF01         mov     byte ptr [ebp+$FFFFFF13], $01
004E4D10   C68514FFFFFF02         mov     byte ptr [ebp+$FFFFFF14], $02
004E4D17   C68515FFFFFF13         mov     byte ptr [ebp+$FFFFFF15], $13
004E4D1E   C68516FFFFFF01         mov     byte ptr [ebp+$FFFFFF16], $01
004E4D25   C68517FFFFFF11         mov     byte ptr [ebp+$FFFFFF17], $11
004E4D2C   C68518FFFFFF4E         mov     byte ptr [ebp+$FFFFFF18], $4E
004E4D33   C68519FFFFFF01         mov     byte ptr [ebp+$FFFFFF19], $01
004E4D3A   C6851AFFFFFF02         mov     byte ptr [ebp+$FFFFFF1A], $02
004E4D41   C6851BFFFFFF14         mov     byte ptr [ebp+$FFFFFF1B], $14
004E4D48   C6851CFFFFFF01         mov     byte ptr [ebp+$FFFFFF1C], $01
004E4D4F   C6851DFFFFFF11         mov     byte ptr [ebp+$FFFFFF1D], $11
004E4D56   C6851EFFFFFF55         mov     byte ptr [ebp+$FFFFFF1E], $55
004E4D5D   C6851FFFFFFF01         mov     byte ptr [ebp+$FFFFFF1F], $01
004E4D64   C68520FFFFFF02         mov     byte ptr [ebp+$FFFFFF20], $02
004E4D6B   C68521FFFFFF15         mov     byte ptr [ebp+$FFFFFF21], $15
004E4D72   C68522FFFFFF01         mov     byte ptr [ebp+$FFFFFF22], $01
004E4D79   C68523FFFFFF11         mov     byte ptr [ebp+$FFFFFF23], $11
004E4D80   C68524FFFFFF01         mov     byte ptr [ebp+$FFFFFF24], $01
004E4D87   C68525FFFFFF01         mov     byte ptr [ebp+$FFFFFF25], $01
004E4D8E   C68526FFFFFF02         mov     byte ptr [ebp+$FFFFFF26], $02
004E4D95   C68527FFFFFF16         mov     byte ptr [ebp+$FFFFFF27], $16
004E4D9C   C68528FFFFFF01         mov     byte ptr [ebp+$FFFFFF28], $01
004E4DA3   C68529FFFFFF11         mov     byte ptr [ebp+$FFFFFF29], $11
004E4DAA   C6852AFFFFFF70         mov     byte ptr [ebp+$FFFFFF2A], $70
004E4DB1   C6852BFFFFFF01         mov     byte ptr [ebp+$FFFFFF2B], $01
004E4DB8   C6852CFFFFFF02         mov     byte ptr [ebp+$FFFFFF2C], $02
004E4DBF   C6852DFFFFFF17         mov     byte ptr [ebp+$FFFFFF2D], $17
004E4DC6   C6852EFFFFFF01         mov     byte ptr [ebp+$FFFFFF2E], $01
004E4DCD   C6852FFFFFFF11         mov     byte ptr [ebp+$FFFFFF2F], $11
004E4DD4   C68530FFFFFF4B         mov     byte ptr [ebp+$FFFFFF30], $4B
004E4DDB   C68531FFFFFF01         mov     byte ptr [ebp+$FFFFFF31], $01
004E4DE2   C68532FFFFFF02         mov     byte ptr [ebp+$FFFFFF32], $02
004E4DE9   C68533FFFFFF18         mov     byte ptr [ebp+$FFFFFF33], $18
004E4DF0   C68534FFFFFF01         mov     byte ptr [ebp+$FFFFFF34], $01
004E4DF7   C68535FFFFFF11         mov     byte ptr [ebp+$FFFFFF35], $11
004E4DFE   C68536FFFFFF72         mov     byte ptr [ebp+$FFFFFF36], $72
004E4E05   C68537FFFFFF01         mov     byte ptr [ebp+$FFFFFF37], $01
004E4E0C   C68538FFFFFF02         mov     byte ptr [ebp+$FFFFFF38], $02
004E4E13   C68539FFFFFF19         mov     byte ptr [ebp+$FFFFFF39], $19
004E4E1A   C6853AFFFFFF01         mov     byte ptr [ebp+$FFFFFF3A], $01
004E4E21   C6853BFFFFFF11         mov     byte ptr [ebp+$FFFFFF3B], $11
004E4E28   C6853CFFFFFF90         mov     byte ptr [ebp+$FFFFFF3C], $90
004E4E2F   C6853DFFFFFF01         mov     byte ptr [ebp+$FFFFFF3D], $01
004E4E36   C6853EFFFFFF02         mov     byte ptr [ebp+$FFFFFF3E], $02
004E4E3D   C6853FFFFFFF1A         mov     byte ptr [ebp+$FFFFFF3F], $1A
004E4E44   C68540FFFFFF01         mov     byte ptr [ebp+$FFFFFF40], $01
004E4E4B   C68541FFFFFF00         mov     byte ptr [ebp+$FFFFFF41], $00
004E4E52   C68542FFFFFF05         mov     byte ptr [ebp+$FFFFFF42], $05
004E4E59   C68543FFFFFF01         mov     byte ptr [ebp+$FFFFFF43], $01
004E4E60   C68544FFFFFF02         mov     byte ptr [ebp+$FFFFFF44], $02
004E4E67   C68545FFFFFF1B         mov     byte ptr [ebp+$FFFFFF45], $1B
004E4E6E   C68546FFFFFF01         mov     byte ptr [ebp+$FFFFFF46], $01
004E4E75   C68547FFFFFF00         mov     byte ptr [ebp+$FFFFFF47], $00
004E4E7C   C68548FFFFFF06         mov     byte ptr [ebp+$FFFFFF48], $06
004E4E83   C68549FFFFFF01         mov     byte ptr [ebp+$FFFFFF49], $01
004E4E8A   C6854AFFFFFF02         mov     byte ptr [ebp+$FFFFFF4A], $02
004E4E91   C6854BFFFFFF1C         mov     byte ptr [ebp+$FFFFFF4B], $1C
004E4E98   C6854CFFFFFF01         mov     byte ptr [ebp+$FFFFFF4C], $01
004E4E9F   C6854DFFFFFF11         mov     byte ptr [ebp+$FFFFFF4D], $11
004E4EA6   C6854EFFFFFF9D         mov     byte ptr [ebp+$FFFFFF4E], $9D
004E4EAD   C6854FFFFFFF01         mov     byte ptr [ebp+$FFFFFF4F], $01
004E4EB4   C68550FFFFFF02         mov     byte ptr [ebp+$FFFFFF50], $02
004E4EBB   C68551FFFFFF1D         mov     byte ptr [ebp+$FFFFFF51], $1D
004E4EC2   C68552FFFFFF01         mov     byte ptr [ebp+$FFFFFF52], $01
004E4EC9   C68553FFFFFF11         mov     byte ptr [ebp+$FFFFFF53], $11
004E4ED0   C68554FFFFFF9E         mov     byte ptr [ebp+$FFFFFF54], $9E
004E4ED7   C68555FFFFFF01         mov     byte ptr [ebp+$FFFFFF55], $01
004E4EDE   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E4EE3   888556FFFFFF           mov     [ebp+$FFFFFF56], al
004E4EE9   8D95B4FEFFFF           lea     edx, [ebp+$FFFFFEB4]
004E4EEF   B9A2000000             mov     ecx, $000000A2
004E4EF4   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E4EF6   E86DDFFFFF             call    004E2E68
004E4EFB   803D9E6E4F006C         cmp     byte ptr [$004F6E9E], $6C
004E4F02   7509                   jnz     004E4F0D
004E4F04   803D9F6E4F00F0         cmp     byte ptr [$004F6E9F], $F0
004E4F0B   740C                   jz      004E4F19
004E4F0D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E4F0F   E870480000             call    004E9784
004E4F14   E9F30F0000             jmp     004E5F0C
004E4F19   68FF000000             push    $000000FF
004E4F1E   C68504FEFFFF80         mov     byte ptr [ebp+$FFFFFE04], $80
004E4F25   C68505FEFFFF11         mov     byte ptr [ebp+$FFFFFE05], $11
004E4F2C   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E4F31   888506FEFFFF           mov     [ebp+$FFFFFE06], al
004E4F37   C68507FEFFFFAA         mov     byte ptr [ebp+$FFFFFE07], $AA
004E4F3E   C68508FEFFFF2C         mov     byte ptr [ebp+$FFFFFE08], $2C
004E4F45   C68509FEFFFFF1         mov     byte ptr [ebp+$FFFFFE09], $F1
004E4F4C   C6850AFEFFFF02         mov     byte ptr [ebp+$FFFFFE0A], $02
004E4F53   C6850BFEFFFF01         mov     byte ptr [ebp+$FFFFFE0B], $01
004E4F5A   C6850CFEFFFF01         mov     byte ptr [ebp+$FFFFFE0C], $01
004E4F61   C6850DFEFFFF11         mov     byte ptr [ebp+$FFFFFE0D], $11
004E4F68   C6850EFEFFFF5E         mov     byte ptr [ebp+$FFFFFE0E], $5E
004E4F6F   C6850FFEFFFF01         mov     byte ptr [ebp+$FFFFFE0F], $01
004E4F76   C68510FEFFFF02         mov     byte ptr [ebp+$FFFFFE10], $02
004E4F7D   C68511FEFFFF02         mov     byte ptr [ebp+$FFFFFE11], $02
004E4F84   C68512FEFFFF02         mov     byte ptr [ebp+$FFFFFE12], $02
004E4F8B   C68513FEFFFF11         mov     byte ptr [ebp+$FFFFFE13], $11
004E4F92   C68514FEFFFFA1         mov     byte ptr [ebp+$FFFFFE14], $A1
004E4F99   C68515FEFFFF01         mov     byte ptr [ebp+$FFFFFE15], $01
004E4FA0   C68516FEFFFF02         mov     byte ptr [ebp+$FFFFFE16], $02
004E4FA7   C68517FEFFFF04         mov     byte ptr [ebp+$FFFFFE17], $04
004E4FAE   C68518FEFFFF01         mov     byte ptr [ebp+$FFFFFE18], $01
004E4FB5   C68519FEFFFF11         mov     byte ptr [ebp+$FFFFFE19], $11
004E4FBC   C6851AFEFFFFA6         mov     byte ptr [ebp+$FFFFFE1A], $A6
004E4FC3   C6851BFEFFFF01         mov     byte ptr [ebp+$FFFFFE1B], $01
004E4FCA   C6851CFEFFFF02         mov     byte ptr [ebp+$FFFFFE1C], $02
004E4FD1   C6851DFEFFFF05         mov     byte ptr [ebp+$FFFFFE1D], $05
004E4FD8   C6851EFEFFFF02         mov     byte ptr [ebp+$FFFFFE1E], $02
004E4FDF   C6851FFEFFFF11         mov     byte ptr [ebp+$FFFFFE1F], $11
004E4FE6   C68520FEFFFF93         mov     byte ptr [ebp+$FFFFFE20], $93
004E4FED   C68521FEFFFF01         mov     byte ptr [ebp+$FFFFFE21], $01
004E4FF4   C68522FEFFFF02         mov     byte ptr [ebp+$FFFFFE22], $02
004E4FFB   C68523FEFFFF07         mov     byte ptr [ebp+$FFFFFE23], $07
004E5002   C68524FEFFFF01         mov     byte ptr [ebp+$FFFFFE24], $01
004E5009   C68525FEFFFF11         mov     byte ptr [ebp+$FFFFFE25], $11
004E5010   C68526FEFFFF76         mov     byte ptr [ebp+$FFFFFE26], $76
004E5017   C68527FEFFFF01         mov     byte ptr [ebp+$FFFFFE27], $01
004E501E   C68528FEFFFF02         mov     byte ptr [ebp+$FFFFFE28], $02
004E5025   C68529FEFFFF08         mov     byte ptr [ebp+$FFFFFE29], $08
004E502C   C6852AFEFFFF01         mov     byte ptr [ebp+$FFFFFE2A], $01
004E5033   C6852BFEFFFF11         mov     byte ptr [ebp+$FFFFFE2B], $11
004E503A   C6852CFEFFFF00         mov     byte ptr [ebp+$FFFFFE2C], $00
004E5041   C6852DFEFFFF01         mov     byte ptr [ebp+$FFFFFE2D], $01
004E5048   C6852EFEFFFF02         mov     byte ptr [ebp+$FFFFFE2E], $02
004E504F   C6852FFEFFFF09         mov     byte ptr [ebp+$FFFFFE2F], $09
004E5056   C68530FEFFFF01         mov     byte ptr [ebp+$FFFFFE30], $01
004E505D   C68531FEFFFF11         mov     byte ptr [ebp+$FFFFFE31], $11
004E5064   C68532FEFFFF04         mov     byte ptr [ebp+$FFFFFE32], $04
004E506B   C68533FEFFFF01         mov     byte ptr [ebp+$FFFFFE33], $01
004E5072   C68534FEFFFF02         mov     byte ptr [ebp+$FFFFFE34], $02
004E5079   C68535FEFFFF0A         mov     byte ptr [ebp+$FFFFFE35], $0A
004E5080   C68536FEFFFF01         mov     byte ptr [ebp+$FFFFFE36], $01
004E5087   C68537FEFFFF11         mov     byte ptr [ebp+$FFFFFE37], $11
004E508E   C68538FEFFFF02         mov     byte ptr [ebp+$FFFFFE38], $02
004E5095   C68539FEFFFF01         mov     byte ptr [ebp+$FFFFFE39], $01
004E509C   C6853AFEFFFF02         mov     byte ptr [ebp+$FFFFFE3A], $02
004E50A3   C6853BFEFFFF0B         mov     byte ptr [ebp+$FFFFFE3B], $0B
004E50AA   C6853CFEFFFF01         mov     byte ptr [ebp+$FFFFFE3C], $01
004E50B1   C6853DFEFFFF11         mov     byte ptr [ebp+$FFFFFE3D], $11
004E50B8   C6853EFEFFFF03         mov     byte ptr [ebp+$FFFFFE3E], $03
004E50BF   C6853FFEFFFF01         mov     byte ptr [ebp+$FFFFFE3F], $01
004E50C6   C68540FEFFFF02         mov     byte ptr [ebp+$FFFFFE40], $02
004E50CD   C68541FEFFFF0C         mov     byte ptr [ebp+$FFFFFE41], $0C
004E50D4   C68542FEFFFF01         mov     byte ptr [ebp+$FFFFFE42], $01
004E50DB   C68543FEFFFF11         mov     byte ptr [ebp+$FFFFFE43], $11
004E50E2   C68544FEFFFFA0         mov     byte ptr [ebp+$FFFFFE44], $A0
004E50E9   C68545FEFFFF01         mov     byte ptr [ebp+$FFFFFE45], $01
004E50F0   C68546FEFFFF02         mov     byte ptr [ebp+$FFFFFE46], $02
004E50F7   C68547FEFFFF0D         mov     byte ptr [ebp+$FFFFFE47], $0D
004E50FE   C68548FEFFFF01         mov     byte ptr [ebp+$FFFFFE48], $01
004E5105   C68549FEFFFF16         mov     byte ptr [ebp+$FFFFFE49], $16
004E510C   C6854AFEFFFF16         mov     byte ptr [ebp+$FFFFFE4A], $16
004E5113   C6854BFEFFFF01         mov     byte ptr [ebp+$FFFFFE4B], $01
004E511A   C6854CFEFFFF02         mov     byte ptr [ebp+$FFFFFE4C], $02
004E5121   C6854DFEFFFF0E         mov     byte ptr [ebp+$FFFFFE4D], $0E
004E5128   C6854EFEFFFF01         mov     byte ptr [ebp+$FFFFFE4E], $01
004E512F   C6854FFEFFFF11         mov     byte ptr [ebp+$FFFFFE4F], $11
004E5136   C68550FEFFFF6F         mov     byte ptr [ebp+$FFFFFE50], $6F
004E513D   C68551FEFFFF01         mov     byte ptr [ebp+$FFFFFE51], $01
004E5144   C68552FEFFFF02         mov     byte ptr [ebp+$FFFFFE52], $02
004E514B   C68553FEFFFF0F         mov     byte ptr [ebp+$FFFFFE53], $0F
004E5152   C68554FEFFFF01         mov     byte ptr [ebp+$FFFFFE54], $01
004E5159   C68555FEFFFF12         mov     byte ptr [ebp+$FFFFFE55], $12
004E5160   C68556FEFFFFE2         mov     byte ptr [ebp+$FFFFFE56], $E2
004E5167   C68557FEFFFF01         mov     byte ptr [ebp+$FFFFFE57], $01
004E516E   C68558FEFFFF02         mov     byte ptr [ebp+$FFFFFE58], $02
004E5175   C68559FEFFFF10         mov     byte ptr [ebp+$FFFFFE59], $10
004E517C   C6855AFEFFFF01         mov     byte ptr [ebp+$FFFFFE5A], $01
004E5183   C6855BFEFFFF11         mov     byte ptr [ebp+$FFFFFE5B], $11
004E518A   C6855CFEFFFF44         mov     byte ptr [ebp+$FFFFFE5C], $44
004E5191   C6855DFEFFFF01         mov     byte ptr [ebp+$FFFFFE5D], $01
004E5198   C6855EFEFFFF02         mov     byte ptr [ebp+$FFFFFE5E], $02
004E519F   C6855FFEFFFF11         mov     byte ptr [ebp+$FFFFFE5F], $11
004E51A6   C68560FEFFFF01         mov     byte ptr [ebp+$FFFFFE60], $01
004E51AD   C68561FEFFFF12         mov     byte ptr [ebp+$FFFFFE61], $12
004E51B4   C68562FEFFFF00         mov     byte ptr [ebp+$FFFFFE62], $00
004E51BB   C68563FEFFFF01         mov     byte ptr [ebp+$FFFFFE63], $01
004E51C2   C68564FEFFFF02         mov     byte ptr [ebp+$FFFFFE64], $02
004E51C9   C68565FEFFFF12         mov     byte ptr [ebp+$FFFFFE65], $12
004E51D0   C68566FEFFFF02         mov     byte ptr [ebp+$FFFFFE66], $02
004E51D7   C68567FEFFFF12         mov     byte ptr [ebp+$FFFFFE67], $12
004E51DE   C68568FEFFFF01         mov     byte ptr [ebp+$FFFFFE68], $01
004E51E5   C68569FEFFFF01         mov     byte ptr [ebp+$FFFFFE69], $01
004E51EC   C6856AFEFFFF02         mov     byte ptr [ebp+$FFFFFE6A], $02
004E51F3   C6856BFEFFFF14         mov     byte ptr [ebp+$FFFFFE6B], $14
004E51FA   C6856CFEFFFF02         mov     byte ptr [ebp+$FFFFFE6C], $02
004E5201   C6856DFEFFFF12         mov     byte ptr [ebp+$FFFFFE6D], $12
004E5208   C6856EFEFFFF02         mov     byte ptr [ebp+$FFFFFE6E], $02
004E520F   C6856FFEFFFF01         mov     byte ptr [ebp+$FFFFFE6F], $01
004E5216   C68570FEFFFF02         mov     byte ptr [ebp+$FFFFFE70], $02
004E521D   C68571FEFFFF16         mov     byte ptr [ebp+$FFFFFE71], $16
004E5224   C68572FEFFFF02         mov     byte ptr [ebp+$FFFFFE72], $02
004E522B   C68573FEFFFF12         mov     byte ptr [ebp+$FFFFFE73], $12
004E5232   C68574FEFFFF03         mov     byte ptr [ebp+$FFFFFE74], $03
004E5239   C68575FEFFFF01         mov     byte ptr [ebp+$FFFFFE75], $01
004E5240   C68576FEFFFF02         mov     byte ptr [ebp+$FFFFFE76], $02
004E5247   C68577FEFFFF18         mov     byte ptr [ebp+$FFFFFE77], $18
004E524E   C68578FEFFFF02         mov     byte ptr [ebp+$FFFFFE78], $02
004E5255   C68579FEFFFF12         mov     byte ptr [ebp+$FFFFFE79], $12
004E525C   C6857AFEFFFF04         mov     byte ptr [ebp+$FFFFFE7A], $04
004E5263   C6857BFEFFFF01         mov     byte ptr [ebp+$FFFFFE7B], $01
004E526A   C6857CFEFFFF02         mov     byte ptr [ebp+$FFFFFE7C], $02
004E5271   C6857DFEFFFF1A         mov     byte ptr [ebp+$FFFFFE7D], $1A
004E5278   C6857EFEFFFF01         mov     byte ptr [ebp+$FFFFFE7E], $01
004E527F   C6857FFEFFFF11         mov     byte ptr [ebp+$FFFFFE7F], $11
004E5286   C68580FEFFFFA3         mov     byte ptr [ebp+$FFFFFE80], $A3
004E528D   C68581FEFFFF01         mov     byte ptr [ebp+$FFFFFE81], $01
004E5294   C68582FEFFFF02         mov     byte ptr [ebp+$FFFFFE82], $02
004E529B   C68583FEFFFF1B         mov     byte ptr [ebp+$FFFFFE83], $1B
004E52A2   C68584FEFFFF01         mov     byte ptr [ebp+$FFFFFE84], $01
004E52A9   C68585FEFFFF12         mov     byte ptr [ebp+$FFFFFE85], $12
004E52B0   C68586FEFFFFED         mov     byte ptr [ebp+$FFFFFE86], $ED
004E52B7   C68587FEFFFF01         mov     byte ptr [ebp+$FFFFFE87], $01
004E52BE   C68588FEFFFF02         mov     byte ptr [ebp+$FFFFFE88], $02
004E52C5   C68589FEFFFF1C         mov     byte ptr [ebp+$FFFFFE89], $1C
004E52CC   C6858AFEFFFF02         mov     byte ptr [ebp+$FFFFFE8A], $02
004E52D3   C6858BFEFFFF12         mov     byte ptr [ebp+$FFFFFE8B], $12
004E52DA   C6858CFEFFFF1A         mov     byte ptr [ebp+$FFFFFE8C], $1A
004E52E1   C6858DFEFFFF01         mov     byte ptr [ebp+$FFFFFE8D], $01
004E52E8   C6858EFEFFFF02         mov     byte ptr [ebp+$FFFFFE8E], $02
004E52EF   C6858FFEFFFF1E         mov     byte ptr [ebp+$FFFFFE8F], $1E
004E52F6   C68590FEFFFF01         mov     byte ptr [ebp+$FFFFFE90], $01
004E52FD   C68591FEFFFF11         mov     byte ptr [ebp+$FFFFFE91], $11
004E5304   C68592FEFFFF9B         mov     byte ptr [ebp+$FFFFFE92], $9B
004E530B   C68593FEFFFF01         mov     byte ptr [ebp+$FFFFFE93], $01
004E5312   C68594FEFFFF02         mov     byte ptr [ebp+$FFFFFE94], $02
004E5319   C68595FEFFFF1F         mov     byte ptr [ebp+$FFFFFE95], $1F
004E5320   C68596FEFFFF02         mov     byte ptr [ebp+$FFFFFE96], $02
004E5327   C68597FEFFFF11         mov     byte ptr [ebp+$FFFFFE97], $11
004E532E   C68598FEFFFFBB         mov     byte ptr [ebp+$FFFFFE98], $BB
004E5335   C68599FEFFFF01         mov     byte ptr [ebp+$FFFFFE99], $01
004E533C   C6859AFEFFFF02         mov     byte ptr [ebp+$FFFFFE9A], $02
004E5343   C6859BFEFFFF21         mov     byte ptr [ebp+$FFFFFE9B], $21
004E534A   C6859CFEFFFF01         mov     byte ptr [ebp+$FFFFFE9C], $01
004E5351   C6859DFEFFFF11         mov     byte ptr [ebp+$FFFFFE9D], $11
004E5358   C6859EFEFFFF71         mov     byte ptr [ebp+$FFFFFE9E], $71
004E535F   C6859FFEFFFF01         mov     byte ptr [ebp+$FFFFFE9F], $01
004E5366   C685A0FEFFFF02         mov     byte ptr [ebp+$FFFFFEA0], $02
004E536D   C685A1FEFFFF22         mov     byte ptr [ebp+$FFFFFEA1], $22
004E5374   C685A2FEFFFF02         mov     byte ptr [ebp+$FFFFFEA2], $02
004E537B   C685A3FEFFFF11         mov     byte ptr [ebp+$FFFFFEA3], $11
004E5382   C685A4FEFFFFC1         mov     byte ptr [ebp+$FFFFFEA4], $C1
004E5389   C685A5FEFFFF01         mov     byte ptr [ebp+$FFFFFEA5], $01
004E5390   C685A6FEFFFF02         mov     byte ptr [ebp+$FFFFFEA6], $02
004E5397   C685A7FEFFFF24         mov     byte ptr [ebp+$FFFFFEA7], $24
004E539E   C685A8FEFFFF01         mov     byte ptr [ebp+$FFFFFEA8], $01
004E53A5   C685A9FEFFFF11         mov     byte ptr [ebp+$FFFFFEA9], $11
004E53AC   C685AAFEFFFFBD         mov     byte ptr [ebp+$FFFFFEAA], $BD
004E53B3   C685ABFEFFFF01         mov     byte ptr [ebp+$FFFFFEAB], $01
004E53BA   C685ACFEFFFF02         mov     byte ptr [ebp+$FFFFFEAC], $02
004E53C1   C685ADFEFFFF25         mov     byte ptr [ebp+$FFFFFEAD], $25
004E53C8   C685AEFEFFFF01         mov     byte ptr [ebp+$FFFFFEAE], $01
004E53CF   C685AFFEFFFF12         mov     byte ptr [ebp+$FFFFFEAF], $12
004E53D6   C685B0FEFFFFF0         mov     byte ptr [ebp+$FFFFFEB0], $F0
004E53DD   C685B1FEFFFF01         mov     byte ptr [ebp+$FFFFFEB1], $01
004E53E4   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E53E9   8885B2FEFFFF           mov     [ebp+$FFFFFEB2], al
004E53EF   8D9504FEFFFF           lea     edx, [ebp+$FFFFFE04]
004E53F5   B9AE000000             mov     ecx, $000000AE
004E53FA   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E53FC   E867DAFFFF             call    004E2E68
004E5401   803DAA6E4F006C         cmp     byte ptr [$004F6EAA], $6C
004E5408   750D                   jnz     004E5417
004E540A   803DAB6E4F00F1         cmp     byte ptr [$004F6EAB], $F1
004E5411   0F848D0A0000           jz      004E5EA4
004E5417   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E5419   E866430000             call    004E9784
004E541E   E9E90A0000             jmp     004E5F0C
004E5423   68FF000000             push    $000000FF
004E5428   C68580FDFFFF80         mov     byte ptr [ebp+$FFFFFD80], $80
004E542F   C68581FDFFFF11         mov     byte ptr [ebp+$FFFFFD81], $11
004E5436   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E543B   888582FDFFFF           mov     [ebp+$FFFFFD82], al
004E5441   C68583FDFFFF7F         mov     byte ptr [ebp+$FFFFFD83], $7F
004E5448   C68584FDFFFF2C         mov     byte ptr [ebp+$FFFFFD84], $2C
004E544F   C68585FDFFFFF0         mov     byte ptr [ebp+$FFFFFD85], $F0
004E5456   C68586FDFFFF01         mov     byte ptr [ebp+$FFFFFD86], $01
004E545D   C68587FDFFFF01         mov     byte ptr [ebp+$FFFFFD87], $01
004E5464   C68588FDFFFF01         mov     byte ptr [ebp+$FFFFFD88], $01
004E546B   C68589FDFFFF0B         mov     byte ptr [ebp+$FFFFFD89], $0B
004E5472   C6858AFDFFFF01         mov     byte ptr [ebp+$FFFFFD8A], $01
004E5479   C6858BFDFFFF01         mov     byte ptr [ebp+$FFFFFD8B], $01
004E5480   C6858CFDFFFF02         mov     byte ptr [ebp+$FFFFFD8C], $02
004E5487   C6858DFDFFFF01         mov     byte ptr [ebp+$FFFFFD8D], $01
004E548E   C6858EFDFFFF0C         mov     byte ptr [ebp+$FFFFFD8E], $0C
004E5495   C6858FFDFFFF20         mov     byte ptr [ebp+$FFFFFD8F], $20
004E549C   C68590FDFFFF01         mov     byte ptr [ebp+$FFFFFD90], $01
004E54A3   C68591FDFFFF03         mov     byte ptr [ebp+$FFFFFD91], $03
004E54AA   C68592FDFFFF01         mov     byte ptr [ebp+$FFFFFD92], $01
004E54B1   C68593FDFFFF0B         mov     byte ptr [ebp+$FFFFFD93], $0B
004E54B8   C68594FDFFFF09         mov     byte ptr [ebp+$FFFFFD94], $09
004E54BF   C68595FDFFFF01         mov     byte ptr [ebp+$FFFFFD95], $01
004E54C6   C68596FDFFFF04         mov     byte ptr [ebp+$FFFFFD96], $04
004E54CD   C68597FDFFFF03         mov     byte ptr [ebp+$FFFFFD97], $03
004E54D4   C68598FDFFFF0B         mov     byte ptr [ebp+$FFFFFD98], $0B
004E54DB   C68599FDFFFF12         mov     byte ptr [ebp+$FFFFFD99], $12
004E54E2   C6859AFDFFFF01         mov     byte ptr [ebp+$FFFFFD9A], $01
004E54E9   C6859BFDFFFF07         mov     byte ptr [ebp+$FFFFFD9B], $07
004E54F0   C6859CFDFFFF01         mov     byte ptr [ebp+$FFFFFD9C], $01
004E54F7   C6859DFDFFFF15         mov     byte ptr [ebp+$FFFFFD9D], $15
004E54FE   C6859EFDFFFF13         mov     byte ptr [ebp+$FFFFFD9E], $13
004E5505   C6859FFDFFFF01         mov     byte ptr [ebp+$FFFFFD9F], $01
004E550C   C685A0FDFFFF08         mov     byte ptr [ebp+$FFFFFDA0], $08
004E5513   C685A1FDFFFF01         mov     byte ptr [ebp+$FFFFFDA1], $01
004E551A   C685A2FDFFFF15         mov     byte ptr [ebp+$FFFFFDA2], $15
004E5521   C685A3FDFFFF14         mov     byte ptr [ebp+$FFFFFDA3], $14
004E5528   C685A4FDFFFF01         mov     byte ptr [ebp+$FFFFFDA4], $01
004E552F   C685A5FDFFFF09         mov     byte ptr [ebp+$FFFFFDA5], $09
004E5536   C685A6FDFFFF02         mov     byte ptr [ebp+$FFFFFDA6], $02
004E553D   C685A7FDFFFF01         mov     byte ptr [ebp+$FFFFFDA7], $01
004E5544   C685A8FDFFFF16         mov     byte ptr [ebp+$FFFFFDA8], $16
004E554B   C685A9FDFFFF01         mov     byte ptr [ebp+$FFFFFDA9], $01
004E5552   C685AAFDFFFF0B         mov     byte ptr [ebp+$FFFFFDAA], $0B
004E5559   C685ABFDFFFF02         mov     byte ptr [ebp+$FFFFFDAB], $02
004E5560   C685ACFDFFFF04         mov     byte ptr [ebp+$FFFFFDAC], $04
004E5567   C685ADFDFFFF02         mov     byte ptr [ebp+$FFFFFDAD], $02
004E556E   C685AEFDFFFF01         mov     byte ptr [ebp+$FFFFFDAE], $01
004E5575   C685AFFDFFFF0D         mov     byte ptr [ebp+$FFFFFDAF], $0D
004E557C   C685B0FDFFFF02         mov     byte ptr [ebp+$FFFFFDB0], $02
004E5583   C685B1FDFFFF04         mov     byte ptr [ebp+$FFFFFDB1], $04
004E558A   C685B2FDFFFF06         mov     byte ptr [ebp+$FFFFFDB2], $06
004E5591   C685B3FDFFFF01         mov     byte ptr [ebp+$FFFFFDB3], $01
004E5598   C685B4FDFFFF0F         mov     byte ptr [ebp+$FFFFFDB4], $0F
004E559F   C685B5FDFFFF01         mov     byte ptr [ebp+$FFFFFDB5], $01
004E55A6   C685B6FDFFFF0C         mov     byte ptr [ebp+$FFFFFDB6], $0C
004E55AD   C685B7FDFFFF04         mov     byte ptr [ebp+$FFFFFDB7], $04
004E55B4   C685B8FDFFFF01         mov     byte ptr [ebp+$FFFFFDB8], $01
004E55BB   C685B9FDFFFF10         mov     byte ptr [ebp+$FFFFFDB9], $10
004E55C2   C685BAFDFFFF01         mov     byte ptr [ebp+$FFFFFDBA], $01
004E55C9   C685BBFDFFFF14         mov     byte ptr [ebp+$FFFFFDBB], $14
004E55D0   C685BCFDFFFF09         mov     byte ptr [ebp+$FFFFFDBC], $09
004E55D7   C685BDFDFFFF01         mov     byte ptr [ebp+$FFFFFDBD], $01
004E55DE   C685BEFDFFFF11         mov     byte ptr [ebp+$FFFFFDBE], $11
004E55E5   C685BFFDFFFF02         mov     byte ptr [ebp+$FFFFFDBF], $02
004E55EC   C685C0FDFFFF04         mov     byte ptr [ebp+$FFFFFDC0], $04
004E55F3   C685C1FDFFFF12         mov     byte ptr [ebp+$FFFFFDC1], $12
004E55FA   C685C2FDFFFF01         mov     byte ptr [ebp+$FFFFFDC2], $01
004E5601   C685C3FDFFFF13         mov     byte ptr [ebp+$FFFFFDC3], $13
004E5608   C685C4FDFFFF02         mov     byte ptr [ebp+$FFFFFDC4], $02
004E560F   C685C5FDFFFF04         mov     byte ptr [ebp+$FFFFFDC5], $04
004E5616   C685C6FDFFFF16         mov     byte ptr [ebp+$FFFFFDC6], $16
004E561D   C685C7FDFFFF01         mov     byte ptr [ebp+$FFFFFDC7], $01
004E5624   C685C8FDFFFF15         mov     byte ptr [ebp+$FFFFFDC8], $15
004E562B   C685C9FDFFFF02         mov     byte ptr [ebp+$FFFFFDC9], $02
004E5632   C685CAFDFFFF05         mov     byte ptr [ebp+$FFFFFDCA], $05
004E5639   C685CBFDFFFF02         mov     byte ptr [ebp+$FFFFFDCB], $02
004E5640   C685CCFDFFFF01         mov     byte ptr [ebp+$FFFFFDCC], $01
004E5647   C685CDFDFFFF17         mov     byte ptr [ebp+$FFFFFDCD], $17
004E564E   C685CEFDFFFF02         mov     byte ptr [ebp+$FFFFFDCE], $02
004E5655   C685CFFDFFFF05         mov     byte ptr [ebp+$FFFFFDCF], $05
004E565C   C685D0FDFFFF0A         mov     byte ptr [ebp+$FFFFFDD0], $0A
004E5663   C685D1FDFFFF01         mov     byte ptr [ebp+$FFFFFDD1], $01
004E566A   C685D2FDFFFF19         mov     byte ptr [ebp+$FFFFFDD2], $19
004E5671   C685D3FDFFFF03         mov     byte ptr [ebp+$FFFFFDD3], $03
004E5678   C685D4FDFFFF03         mov     byte ptr [ebp+$FFFFFDD4], $03
004E567F   C685D5FDFFFF01         mov     byte ptr [ebp+$FFFFFDD5], $01
004E5686   C685D6FDFFFF01         mov     byte ptr [ebp+$FFFFFDD6], $01
004E568D   C685D7FDFFFF1C         mov     byte ptr [ebp+$FFFFFDD7], $1C
004E5694   C685D8FDFFFF01         mov     byte ptr [ebp+$FFFFFDD8], $01
004E569B   C685D9FDFFFF03         mov     byte ptr [ebp+$FFFFFDD9], $03
004E56A2   C685DAFDFFFF07         mov     byte ptr [ebp+$FFFFFDDA], $07
004E56A9   C685DBFDFFFF01         mov     byte ptr [ebp+$FFFFFDDB], $01
004E56B0   C685DCFDFFFF1D         mov     byte ptr [ebp+$FFFFFDDC], $1D
004E56B7   C685DDFDFFFF01         mov     byte ptr [ebp+$FFFFFDDD], $01
004E56BE   C685DEFDFFFF04         mov     byte ptr [ebp+$FFFFFDDE], $04
004E56C5   C685DFFDFFFF09         mov     byte ptr [ebp+$FFFFFDDF], $09
004E56CC   C685E0FDFFFF01         mov     byte ptr [ebp+$FFFFFDE0], $01
004E56D3   C685E1FDFFFF1E         mov     byte ptr [ebp+$FFFFFDE1], $1E
004E56DA   C685E2FDFFFF01         mov     byte ptr [ebp+$FFFFFDE2], $01
004E56E1   C685E3FDFFFF04         mov     byte ptr [ebp+$FFFFFDE3], $04
004E56E8   C685E4FDFFFF0D         mov     byte ptr [ebp+$FFFFFDE4], $0D
004E56EF   C685E5FDFFFF01         mov     byte ptr [ebp+$FFFFFDE5], $01
004E56F6   C685E6FDFFFF1F         mov     byte ptr [ebp+$FFFFFDE6], $1F
004E56FD   C685E7FDFFFF02         mov     byte ptr [ebp+$FFFFFDE7], $02
004E5704   C685E8FDFFFF01         mov     byte ptr [ebp+$FFFFFDE8], $01
004E570B   C685E9FDFFFF02         mov     byte ptr [ebp+$FFFFFDE9], $02
004E5712   C685EAFDFFFF01         mov     byte ptr [ebp+$FFFFFDEA], $01
004E5719   C685EBFDFFFF21         mov     byte ptr [ebp+$FFFFFDEB], $21
004E5720   C685ECFDFFFF02         mov     byte ptr [ebp+$FFFFFDEC], $02
004E5727   C685EDFDFFFF01         mov     byte ptr [ebp+$FFFFFDED], $01
004E572E   C685EEFDFFFF04         mov     byte ptr [ebp+$FFFFFDEE], $04
004E5735   C685EFFDFFFF01         mov     byte ptr [ebp+$FFFFFDEF], $01
004E573C   C685F0FDFFFF23         mov     byte ptr [ebp+$FFFFFDF0], $23
004E5743   C685F1FDFFFF02         mov     byte ptr [ebp+$FFFFFDF1], $02
004E574A   C685F2FDFFFF01         mov     byte ptr [ebp+$FFFFFDF2], $01
004E5751   C685F3FDFFFF06         mov     byte ptr [ebp+$FFFFFDF3], $06
004E5758   C685F4FDFFFF01         mov     byte ptr [ebp+$FFFFFDF4], $01
004E575F   C685F5FDFFFF25         mov     byte ptr [ebp+$FFFFFDF5], $25
004E5766   C685F6FDFFFF02         mov     byte ptr [ebp+$FFFFFDF6], $02
004E576D   C685F7FDFFFF01         mov     byte ptr [ebp+$FFFFFDF7], $01
004E5774   C685F8FDFFFF08         mov     byte ptr [ebp+$FFFFFDF8], $08
004E577B   C685F9FDFFFF01         mov     byte ptr [ebp+$FFFFFDF9], $01
004E5782   C685FAFDFFFF27         mov     byte ptr [ebp+$FFFFFDFA], $27
004E5789   C685FBFDFFFF02         mov     byte ptr [ebp+$FFFFFDFB], $02
004E5790   C685FCFDFFFF01         mov     byte ptr [ebp+$FFFFFDFC], $01
004E5797   C685FDFDFFFF1C         mov     byte ptr [ebp+$FFFFFDFD], $1C
004E579E   C685FEFDFFFF01         mov     byte ptr [ebp+$FFFFFDFE], $01
004E57A5   C685FFFDFFFF29         mov     byte ptr [ebp+$FFFFFDFF], $29
004E57AC   C68500FEFFFF02         mov     byte ptr [ebp+$FFFFFE00], $02
004E57B3   C68501FEFFFF01         mov     byte ptr [ebp+$FFFFFE01], $01
004E57BA   C68502FEFFFF20         mov     byte ptr [ebp+$FFFFFE02], $20
004E57C1   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E57C6   888503FEFFFF           mov     [ebp+$FFFFFE03], al
004E57CC   8D9580FDFFFF           lea     edx, [ebp+$FFFFFD80]
004E57D2   B983000000             mov     ecx, $00000083
004E57D7   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E57D9   E88AD6FFFF             call    004E2E68
004E57DE   803D7F6E4F006C         cmp     byte ptr [$004F6E7F], $6C
004E57E5   750D                   jnz     004E57F4
004E57E7   803D806E4F00F0         cmp     byte ptr [$004F6E80], $F0
004E57EE   0F84B0060000           jz      004E5EA4
004E57F4   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E57F6   E8893F0000             call    004E9784
004E57FB   E90C070000             jmp     004E5F0C
004E5800   68FF000000             push    $000000FF
004E5805   C68558FFFFFF80         mov     byte ptr [ebp+$FFFFFF58], $80
004E580C   C68559FFFFFF18         mov     byte ptr [ebp+$FFFFFF59], $18
004E5813   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E5818   88855AFFFFFF           mov     [ebp+$FFFFFF5A], al
004E581E   C6855BFFFFFF89         mov     byte ptr [ebp+$FFFFFF5B], $89
004E5825   C6855CFFFFFF2C         mov     byte ptr [ebp+$FFFFFF5C], $2C
004E582C   C6855DFFFFFFF0         mov     byte ptr [ebp+$FFFFFF5D], $F0
004E5833   C6855EFFFFFF01         mov     byte ptr [ebp+$FFFFFF5E], $01
004E583A   C6855FFFFFFF01         mov     byte ptr [ebp+$FFFFFF5F], $01
004E5841   C68560FFFFFF01         mov     byte ptr [ebp+$FFFFFF60], $01
004E5848   C68561FFFFFF01         mov     byte ptr [ebp+$FFFFFF61], $01
004E584F   C68562FFFFFF01         mov     byte ptr [ebp+$FFFFFF62], $01
004E5856   C68563FFFFFF01         mov     byte ptr [ebp+$FFFFFF63], $01
004E585D   C68564FFFFFF02         mov     byte ptr [ebp+$FFFFFF64], $02
004E5864   C68565FFFFFF01         mov     byte ptr [ebp+$FFFFFF65], $01
004E586B   C68566FFFFFF01         mov     byte ptr [ebp+$FFFFFF66], $01
004E5872   C68567FFFFFF02         mov     byte ptr [ebp+$FFFFFF67], $02
004E5879   C68568FFFFFF01         mov     byte ptr [ebp+$FFFFFF68], $01
004E5880   C68569FFFFFF03         mov     byte ptr [ebp+$FFFFFF69], $03
004E5887   C6856AFFFFFF01         mov     byte ptr [ebp+$FFFFFF6A], $01
004E588E   C6856BFFFFFF01         mov     byte ptr [ebp+$FFFFFF6B], $01
004E5895   C6856CFFFFFF03         mov     byte ptr [ebp+$FFFFFF6C], $03
004E589C   C6856DFFFFFF01         mov     byte ptr [ebp+$FFFFFF6D], $01
004E58A3   C6856EFFFFFF04         mov     byte ptr [ebp+$FFFFFF6E], $04
004E58AA   C6856FFFFFFF01         mov     byte ptr [ebp+$FFFFFF6F], $01
004E58B1   C68570FFFFFF02         mov     byte ptr [ebp+$FFFFFF70], $02
004E58B8   C68571FFFFFF01         mov     byte ptr [ebp+$FFFFFF71], $01
004E58BF   C68572FFFFFF01         mov     byte ptr [ebp+$FFFFFF72], $01
004E58C6   C68573FFFFFF05         mov     byte ptr [ebp+$FFFFFF73], $05
004E58CD   C68574FFFFFF02         mov     byte ptr [ebp+$FFFFFF74], $02
004E58D4   C68575FFFFFF02         mov     byte ptr [ebp+$FFFFFF75], $02
004E58DB   C68576FFFFFF02         mov     byte ptr [ebp+$FFFFFF76], $02
004E58E2   C68577FFFFFF01         mov     byte ptr [ebp+$FFFFFF77], $01
004E58E9   C68578FFFFFF07         mov     byte ptr [ebp+$FFFFFF78], $07
004E58F0   C68579FFFFFF01         mov     byte ptr [ebp+$FFFFFF79], $01
004E58F7   C6857AFFFFFF02         mov     byte ptr [ebp+$FFFFFF7A], $02
004E58FE   C6857BFFFFFF04         mov     byte ptr [ebp+$FFFFFF7B], $04
004E5905   C6857CFFFFFF01         mov     byte ptr [ebp+$FFFFFF7C], $01
004E590C   C6857DFFFFFF08         mov     byte ptr [ebp+$FFFFFF7D], $08
004E5913   C6857EFFFFFF02         mov     byte ptr [ebp+$FFFFFF7E], $02
004E591A   C6857FFFFFFF03         mov     byte ptr [ebp+$FFFFFF7F], $03
004E5921   C6458001               mov     byte ptr [ebp-$80], $01
004E5925   C6458101               mov     byte ptr [ebp-$7F], $01
004E5929   C645820A               mov     byte ptr [ebp-$7E], $0A
004E592D   C6458302               mov     byte ptr [ebp-$7D], $02
004E5931   C6458403               mov     byte ptr [ebp-$7C], $03
004E5935   C6458503               mov     byte ptr [ebp-$7B], $03
004E5939   C6458601               mov     byte ptr [ebp-$7A], $01
004E593D   C645870C               mov     byte ptr [ebp-$79], $0C
004E5941   C6458802               mov     byte ptr [ebp-$78], $02
004E5945   C6458903               mov     byte ptr [ebp-$77], $03
004E5949   C6458A05               mov     byte ptr [ebp-$76], $05
004E594D   C6458B01               mov     byte ptr [ebp-$75], $01
004E5951   C6458C0E               mov     byte ptr [ebp-$74], $0E
004E5955   C6458D02               mov     byte ptr [ebp-$73], $02
004E5959   C6458E03               mov     byte ptr [ebp-$72], $03
004E595D   C6458F07               mov     byte ptr [ebp-$71], $07
004E5961   C6459001               mov     byte ptr [ebp-$70], $01
004E5965   C6459110               mov     byte ptr [ebp-$6F], $10
004E5969   C6459201               mov     byte ptr [ebp-$6E], $01
004E596D   C6459303               mov     byte ptr [ebp-$6D], $03
004E5971   C6459409               mov     byte ptr [ebp-$6C], $09
004E5975   C6459501               mov     byte ptr [ebp-$6B], $01
004E5979   C6459611               mov     byte ptr [ebp-$6A], $11
004E597D   C6459701               mov     byte ptr [ebp-$69], $01
004E5981   C6459803               mov     byte ptr [ebp-$68], $03
004E5985   C645990A               mov     byte ptr [ebp-$67], $0A
004E5989   C6459A01               mov     byte ptr [ebp-$66], $01
004E598D   C6459B12               mov     byte ptr [ebp-$65], $12
004E5991   C6459C02               mov     byte ptr [ebp-$64], $02
004E5995   C6459D03               mov     byte ptr [ebp-$63], $03
004E5999   C6459E0B               mov     byte ptr [ebp-$62], $0B
004E599D   C6459F01               mov     byte ptr [ebp-$61], $01
004E59A1   C645A014               mov     byte ptr [ebp-$60], $14
004E59A5   C645A101               mov     byte ptr [ebp-$5F], $01
004E59A9   C645A203               mov     byte ptr [ebp-$5E], $03
004E59AD   C645A30D               mov     byte ptr [ebp-$5D], $0D
004E59B1   C645A401               mov     byte ptr [ebp-$5C], $01
004E59B5   C645A515               mov     byte ptr [ebp-$5B], $15
004E59B9   C645A601               mov     byte ptr [ebp-$5A], $01
004E59BD   C645A703               mov     byte ptr [ebp-$59], $03
004E59C1   C645A80E               mov     byte ptr [ebp-$58], $0E
004E59C5   C645A901               mov     byte ptr [ebp-$57], $01
004E59C9   C645AA16               mov     byte ptr [ebp-$56], $16
004E59CD   C645AB01               mov     byte ptr [ebp-$55], $01
004E59D1   C645AC04               mov     byte ptr [ebp-$54], $04
004E59D5   C645AD01               mov     byte ptr [ebp-$53], $01
004E59D9   C645AE01               mov     byte ptr [ebp-$52], $01
004E59DD   C645AF17               mov     byte ptr [ebp-$51], $17
004E59E1   C645B002               mov     byte ptr [ebp-$50], $02
004E59E5   C645B104               mov     byte ptr [ebp-$4F], $04
004E59E9   C645B202               mov     byte ptr [ebp-$4E], $02
004E59ED   C645B301               mov     byte ptr [ebp-$4D], $01
004E59F1   C645B419               mov     byte ptr [ebp-$4C], $19
004E59F5   C645B502               mov     byte ptr [ebp-$4B], $02
004E59F9   C645B604               mov     byte ptr [ebp-$4A], $04
004E59FD   C645B704               mov     byte ptr [ebp-$49], $04
004E5A01   C645B801               mov     byte ptr [ebp-$48], $01
004E5A05   C645B91B               mov     byte ptr [ebp-$47], $1B
004E5A09   C645BA02               mov     byte ptr [ebp-$46], $02
004E5A0D   C645BB04               mov     byte ptr [ebp-$45], $04
004E5A11   C645BC06               mov     byte ptr [ebp-$44], $06
004E5A15   C645BD01               mov     byte ptr [ebp-$43], $01
004E5A19   C645BE1D               mov     byte ptr [ebp-$42], $1D
004E5A1D   C645BF02               mov     byte ptr [ebp-$41], $02
004E5A21   C645C004               mov     byte ptr [ebp-$40], $04
004E5A25   C645C108               mov     byte ptr [ebp-$3F], $08
004E5A29   C645C201               mov     byte ptr [ebp-$3E], $01
004E5A2D   C645C31F               mov     byte ptr [ebp-$3D], $1F
004E5A31   C645C402               mov     byte ptr [ebp-$3C], $02
004E5A35   C645C504               mov     byte ptr [ebp-$3B], $04
004E5A39   C645C60A               mov     byte ptr [ebp-$3A], $0A
004E5A3D   C645C701               mov     byte ptr [ebp-$39], $01
004E5A41   C645C821               mov     byte ptr [ebp-$38], $21
004E5A45   C645C902               mov     byte ptr [ebp-$37], $02
004E5A49   C645CA04               mov     byte ptr [ebp-$36], $04
004E5A4D   C645CB0C               mov     byte ptr [ebp-$35], $0C
004E5A51   C645CC01               mov     byte ptr [ebp-$34], $01
004E5A55   C645CD23               mov     byte ptr [ebp-$33], $23
004E5A59   C645CE02               mov     byte ptr [ebp-$32], $02
004E5A5D   C645CF04               mov     byte ptr [ebp-$31], $04
004E5A61   C645D00E               mov     byte ptr [ebp-$30], $0E
004E5A65   C645D101               mov     byte ptr [ebp-$2F], $01
004E5A69   C645D225               mov     byte ptr [ebp-$2E], $25
004E5A6D   C645D302               mov     byte ptr [ebp-$2D], $02
004E5A71   C645D404               mov     byte ptr [ebp-$2C], $04
004E5A75   C645D510               mov     byte ptr [ebp-$2B], $10
004E5A79   C645D601               mov     byte ptr [ebp-$2A], $01
004E5A7D   C645D727               mov     byte ptr [ebp-$29], $27
004E5A81   C645D801               mov     byte ptr [ebp-$28], $01
004E5A85   C645D906               mov     byte ptr [ebp-$27], $06
004E5A89   C645DA01               mov     byte ptr [ebp-$26], $01
004E5A8D   C645DB01               mov     byte ptr [ebp-$25], $01
004E5A91   C645DC28               mov     byte ptr [ebp-$24], $28
004E5A95   C645DD01               mov     byte ptr [ebp-$23], $01
004E5A99   C645DE06               mov     byte ptr [ebp-$22], $06
004E5A9D   C645DF03               mov     byte ptr [ebp-$21], $03
004E5AA1   C645E001               mov     byte ptr [ebp-$20], $01
004E5AA5   C645E129               mov     byte ptr [ebp-$1F], $29
004E5AA9   C645E201               mov     byte ptr [ebp-$1E], $01
004E5AAD   C645E306               mov     byte ptr [ebp-$1D], $06
004E5AB1   C645E404               mov     byte ptr [ebp-$1C], $04
004E5AB5   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E5ABA   8845E5                 mov     [ebp-$1B], al
004E5ABD   8D9558FFFFFF           lea     edx, [ebp+$FFFFFF58]
004E5AC3   B98D000000             mov     ecx, $0000008D
004E5AC8   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E5ACA   E899D3FFFF             call    004E2E68
004E5ACF   803D896E4F006C         cmp     byte ptr [$004F6E89], $6C
004E5AD6   750D                   jnz     004E5AE5
004E5AD8   803D8A6E4F00F0         cmp     byte ptr [$004F6E8A], $F0
004E5ADF   0F84BF030000           jz      004E5EA4
004E5AE5   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E5AE7   E8983C0000             call    004E9784
004E5AEC   E91B040000             jmp     004E5F0C
004E5AF1   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E5AF3   8B8334030000           mov     eax, [ebx+$0334]
004E5AF9   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E5AFB   FF5164                 call    dword ptr [ecx+$64]
004E5AFE   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E5B00   8B8328030000           mov     eax, [ebx+$0328]
004E5B06   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E5B08   FF5164                 call    dword ptr [ecx+$64]
004E5B0B   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E5B0D   8B8340030000           mov     eax, [ebx+$0340]
004E5B13   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E5B15   FF5164                 call    dword ptr [ecx+$64]
004E5B18   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E5B1A   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E5B20   E87FF8F4FF             call    004353A4
004E5B25   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004E5B27   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E5B2D   E856D0F8FF             call    00472B88
004E5B32   E96D030000             jmp     004E5EA4
004E5B37   68FF000000             push    $000000FF
004E5B3C   C68508FDFFFF80         mov     byte ptr [ebp+$FFFFFD08], $80
004E5B43   C68509FDFFFF28         mov     byte ptr [ebp+$FFFFFD09], $28
004E5B4A   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E5B4F   88850AFDFFFF           mov     [ebp+$FFFFFD0A], al
004E5B55   C6850BFDFFFF70         mov     byte ptr [ebp+$FFFFFD0B], $70
004E5B5C   C6850CFDFFFF3B         mov     byte ptr [ebp+$FFFFFD0C], $3B
004E5B63   C6850DFDFFFF01         mov     byte ptr [ebp+$FFFFFD0D], $01
004E5B6A   C6850EFDFFFF00         mov     byte ptr [ebp+$FFFFFD0E], $00
004E5B71   C6850FFDFFFFBB         mov     byte ptr [ebp+$FFFFFD0F], $BB
004E5B78   C68510FDFFFF07         mov     byte ptr [ebp+$FFFFFD10], $07
004E5B7F   C68511FDFFFF07         mov     byte ptr [ebp+$FFFFFD11], $07
004E5B86   C68512FDFFFF64         mov     byte ptr [ebp+$FFFFFD12], $64
004E5B8D   C68513FDFFFF07         mov     byte ptr [ebp+$FFFFFD13], $07
004E5B94   C68514FDFFFF00         mov     byte ptr [ebp+$FFFFFD14], $00
004E5B9B   C68515FDFFFFB1         mov     byte ptr [ebp+$FFFFFD15], $B1
004E5BA2   C68516FDFFFF02         mov     byte ptr [ebp+$FFFFFD16], $02
004E5BA9   C68517FDFFFF24         mov     byte ptr [ebp+$FFFFFD17], $24
004E5BB0   C68518FDFFFFA3         mov     byte ptr [ebp+$FFFFFD18], $A3
004E5BB7   C68519FDFFFF01         mov     byte ptr [ebp+$FFFFFD19], $01
004E5BBE   C6851AFDFFFFA2         mov     byte ptr [ebp+$FFFFFD1A], $A2
004E5BC5   C6851BFDFFFF20         mov     byte ptr [ebp+$FFFFFD1B], $20
004E5BCC   C6851CFDFFFF20         mov     byte ptr [ebp+$FFFFFD1C], $20
004E5BD3   C6851DFDFFFFA2         mov     byte ptr [ebp+$FFFFFD1D], $A2
004E5BDA   C6851EFDFFFF79         mov     byte ptr [ebp+$FFFFFD1E], $79
004E5BE1   C6851FFDFFFF22         mov     byte ptr [ebp+$FFFFFD1F], $22
004E5BE8   C68520FDFFFFA2         mov     byte ptr [ebp+$FFFFFD20], $A2
004E5BEF   C68521FDFFFF21         mov     byte ptr [ebp+$FFFFFD21], $21
004E5BF6   C68522FDFFFF1E         mov     byte ptr [ebp+$FFFFFD22], $1E
004E5BFD   C68523FDFFFF88         mov     byte ptr [ebp+$FFFFFD23], $88
004E5C04   C68524FDFFFF00         mov     byte ptr [ebp+$FFFFFD24], $00
004E5C0B   C68525FDFFFF1E         mov     byte ptr [ebp+$FFFFFD25], $1E
004E5C12   C68526FDFFFFDF         mov     byte ptr [ebp+$FFFFFD26], $DF
004E5C19   C68527FDFFFF34         mov     byte ptr [ebp+$FFFFFD27], $34
004E5C20   C68528FDFFFF51         mov     byte ptr [ebp+$FFFFFD28], $51
004E5C27   C68529FDFFFFFE         mov     byte ptr [ebp+$FFFFFD29], $FE
004E5C2E   C6852AFDFFFF1E         mov     byte ptr [ebp+$FFFFFD2A], $1E
004E5C35   C6852BFDFFFF1D         mov     byte ptr [ebp+$FFFFFD2B], $1D
004E5C3C   C6852CFDFFFF78         mov     byte ptr [ebp+$FFFFFD2C], $78
004E5C43   C6852DFDFFFF23         mov     byte ptr [ebp+$FFFFFD2D], $23
004E5C4A   C6852EFDFFFF1D         mov     byte ptr [ebp+$FFFFFD2E], $1D
004E5C51   C6852FFDFFFFD7         mov     byte ptr [ebp+$FFFFFD2F], $D7
004E5C58   C68530FDFFFFEF         mov     byte ptr [ebp+$FFFFFD30], $EF
004E5C5F   C68531FDFFFF51         mov     byte ptr [ebp+$FFFFFD31], $51
004E5C66   C68532FDFFFFF8         mov     byte ptr [ebp+$FFFFFD32], $F8
004E5C6D   C68533FDFFFF1F         mov     byte ptr [ebp+$FFFFFD33], $1F
004E5C74   C68534FDFFFF1C         mov     byte ptr [ebp+$FFFFFD34], $1C
004E5C7B   C68535FDFFFF08         mov     byte ptr [ebp+$FFFFFD35], $08
004E5C82   C68536FDFFFF02         mov     byte ptr [ebp+$FFFFFD36], $02
004E5C89   C68537FDFFFF1C         mov     byte ptr [ebp+$FFFFFD37], $1C
004E5C90   C68538FDFFFF67         mov     byte ptr [ebp+$FFFFFD38], $67
004E5C97   C68539FDFFFF01         mov     byte ptr [ebp+$FFFFFD39], $01
004E5C9E   C6853AFDFFFFAC         mov     byte ptr [ebp+$FFFFFD3A], $AC
004E5CA5   C6853BFDFFFF20         mov     byte ptr [ebp+$FFFFFD3B], $20
004E5CAC   C6853CFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3C], $1C
004E5CB3   C6853DFDFFFFA2         mov     byte ptr [ebp+$FFFFFD3D], $A2
004E5CBA   C6853EFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3E], $1C
004E5CC1   C6853FFDFFFF1C         mov     byte ptr [ebp+$FFFFFD3F], $1C
004E5CC8   C68540FDFFFF38         mov     byte ptr [ebp+$FFFFFD40], $38
004E5CCF   C68541FDFFFF1E         mov     byte ptr [ebp+$FFFFFD41], $1E
004E5CD6   C68542FDFFFF16         mov     byte ptr [ebp+$FFFFFD42], $16
004E5CDD   C68543FDFFFFA1         mov     byte ptr [ebp+$FFFFFD43], $A1
004E5CE4   C68544FDFFFF01         mov     byte ptr [ebp+$FFFFFD44], $01
004E5CEB   C68545FDFFFF01         mov     byte ptr [ebp+$FFFFFD45], $01
004E5CF2   C68546FDFFFF20         mov     byte ptr [ebp+$FFFFFD46], $20
004E5CF9   C68547FDFFFF71         mov     byte ptr [ebp+$FFFFFD47], $71
004E5D00   C68548FDFFFF07         mov     byte ptr [ebp+$FFFFFD48], $07
004E5D07   C68549FDFFFF1F         mov     byte ptr [ebp+$FFFFFD49], $1F
004E5D0E   C6854AFDFFFF09         mov     byte ptr [ebp+$FFFFFD4A], $09
004E5D15   C6854BFDFFFF1F         mov     byte ptr [ebp+$FFFFFD4B], $1F
004E5D1C   C6854CFDFFFF20         mov     byte ptr [ebp+$FFFFFD4C], $20
004E5D23   C6854DFDFFFF92         mov     byte ptr [ebp+$FFFFFD4D], $92
004E5D2A   C6854EFDFFFF1C         mov     byte ptr [ebp+$FFFFFD4E], $1C
004E5D31   C6854FFDFFFF20         mov     byte ptr [ebp+$FFFFFD4F], $20
004E5D38   C68550FDFFFF3A         mov     byte ptr [ebp+$FFFFFD50], $3A
004E5D3F   C68551FDFFFF22         mov     byte ptr [ebp+$FFFFFD51], $22
004E5D46   C68552FDFFFF03         mov     byte ptr [ebp+$FFFFFD52], $03
004E5D4D   C68553FDFFFF94         mov     byte ptr [ebp+$FFFFFD53], $94
004E5D54   C68554FDFFFF21         mov     byte ptr [ebp+$FFFFFD54], $21
004E5D5B   C68555FDFFFF20         mov     byte ptr [ebp+$FFFFFD55], $20
004E5D62   C68556FDFFFFB0         mov     byte ptr [ebp+$FFFFFD56], $B0
004E5D69   C68557FDFFFF20         mov     byte ptr [ebp+$FFFFFD57], $20
004E5D70   C68558FDFFFF22         mov     byte ptr [ebp+$FFFFFD58], $22
004E5D77   C68559FDFFFFC6         mov     byte ptr [ebp+$FFFFFD59], $C6
004E5D7E   C6855AFDFFFF1C         mov     byte ptr [ebp+$FFFFFD5A], $1C
004E5D85   C6855BFDFFFF22         mov     byte ptr [ebp+$FFFFFD5B], $22
004E5D8C   C6855CFDFFFFE0         mov     byte ptr [ebp+$FFFFFD5C], $E0
004E5D93   C6855DFDFFFF24         mov     byte ptr [ebp+$FFFFFD5D], $24
004E5D9A   C6855EFDFFFFB9         mov     byte ptr [ebp+$FFFFFD5E], $B9
004E5DA1   C6855FFDFFFF07         mov     byte ptr [ebp+$FFFFFD5F], $07
004E5DA8   C68560FDFFFF40         mov     byte ptr [ebp+$FFFFFD60], $40
004E5DAF   C68561FDFFFF9A         mov     byte ptr [ebp+$FFFFFD61], $9A
004E5DB6   C68562FDFFFF40         mov     byte ptr [ebp+$FFFFFD62], $40
004E5DBD   C68563FDFFFF00         mov     byte ptr [ebp+$FFFFFD63], $00
004E5DC4   C68564FDFFFFDF         mov     byte ptr [ebp+$FFFFFD64], $DF
004E5DCB   C68565FDFFFF15         mov     byte ptr [ebp+$FFFFFD65], $15
004E5DD2   C68566FDFFFFA2         mov     byte ptr [ebp+$FFFFFD66], $A2
004E5DD9   C68567FDFFFF79         mov     byte ptr [ebp+$FFFFFD67], $79
004E5DE0   C68568FDFFFF7C         mov     byte ptr [ebp+$FFFFFD68], $7C
004E5DE7   C68569FDFFFF88         mov     byte ptr [ebp+$FFFFFD69], $88
004E5DEE   C6856AFDFFFF00         mov     byte ptr [ebp+$FFFFFD6A], $00
004E5DF5   C6856BFDFFFF7C         mov     byte ptr [ebp+$FFFFFD6B], $7C
004E5DFC   C6856CFDFFFFD7         mov     byte ptr [ebp+$FFFFFD6C], $D7
004E5E03   C6856DFDFFFF04         mov     byte ptr [ebp+$FFFFFD6D], $04
004E5E0A   C6856EFDFFFF07         mov     byte ptr [ebp+$FFFFFD6E], $07
004E5E11   C6856FFDFFFF40         mov     byte ptr [ebp+$FFFFFD6F], $40
004E5E18   C68570FDFFFF27         mov     byte ptr [ebp+$FFFFFD70], $27
004E5E1F   C68571FDFFFFA3         mov     byte ptr [ebp+$FFFFFD71], $A3
004E5E26   C68572FDFFFF6B         mov     byte ptr [ebp+$FFFFFD72], $6B
004E5E2D   C68573FDFFFF01         mov     byte ptr [ebp+$FFFFFD73], $01
004E5E34   C68574FDFFFFA6         mov     byte ptr [ebp+$FFFFFD74], $A6
004E5E3B   C68575FDFFFF20         mov     byte ptr [ebp+$FFFFFD75], $20
004E5E42   C68576FDFFFF7C         mov     byte ptr [ebp+$FFFFFD76], $7C
004E5E49   C68577FDFFFFD9         mov     byte ptr [ebp+$FFFFFD77], $D9
004E5E50   C68578FDFFFF02         mov     byte ptr [ebp+$FFFFFD78], $02
004E5E57   C68579FDFFFF07         mov     byte ptr [ebp+$FFFFFD79], $07
004E5E5E   C6857AFDFFFF40         mov     byte ptr [ebp+$FFFFFD7A], $40
004E5E65   C6857BFDFFFFF0         mov     byte ptr [ebp+$FFFFFD7B], $F0
004E5E6C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E5E71   88857CFDFFFF           mov     [ebp+$FFFFFD7C], al
004E5E77   8D9508FDFFFF           lea     edx, [ebp+$FFFFFD08]
004E5E7D   B974000000             mov     ecx, $00000074
004E5E82   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004E5E84   E8DFCFFFFF             call    004E2E68
004E5E89   803D706E4F007B         cmp     byte ptr [$004F6E70], $7B
004E5E90   7509                   jnz     004E5E9B
004E5E92   803D716E4F0001         cmp     byte ptr [$004F6E71], $01
004E5E99   7409                   jz      004E5EA4
004E5E9B   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004E5E9D   E8E2380000             call    004E9784
004E5EA2   EB68                   jmp     004E5F0C

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E5EA4   8B831C030000           mov     eax, [ebx+$031C]

* Reference to field TMenuItem.Enabled : Boolean
|
004E5EAA   80783901               cmp     byte ptr [eax+$39], $01
004E5EAE   755C                   jnz     004E5F0C
004E5EB0   33C9                   xor     ecx, ecx
004E5EB2   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E5EB4   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E5EB7   E84C90F7FF             call    0045EF08
004E5EBC   33C9                   xor     ecx, ecx
004E5EBE   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E5EC3   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E5EC6   E83D90F7FF             call    0045EF08
004E5ECB   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Dvig : TLabel
|
004E5ECD   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5ED3   E8ACA2F7FF             call    00460184
004E5ED8   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AKPP : TLabel
|
004E5EDA   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5EE0   E89FA2F7FF             call    00460184
004E5EE5   33D2                   xor     edx, edx

* Reference to control TForm1.Label_ABS : TLabel
|
004E5EE7   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5EED   E892A2F7FF             call    00460184
004E5EF2   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Load : TLabel
|
004E5EF4   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5EFA   E885A2F7FF             call    00460184
004E5EFF   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004E5F01   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E5F07   E878A2F7FF             call    00460184
004E5F0C   33C0                   xor     eax, eax
004E5F0E   5A                     pop     edx
004E5F0F   59                     pop     ecx
004E5F10   59                     pop     ecx
004E5F11   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '^[‹е]ГВнимание, отчет не сохранялся
|                                !'
|
004E5F14   682E5F4E00             push    $004E5F2E
004E5F19   8D45E8                 lea     eax, [ebp-$18]
004E5F1C   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E5F21   E82AEBF1FF             call    00404A50
004E5F26   C3                     ret


* Reference to: System.@HandleFinally;
|
004E5F27   E980E4F1FF             jmp     004043AC
004E5F2C   EBEB                   jmp     004E5F19

****** END
|
004E5F2E   5E                     pop     esi
004E5F2F   5B                     pop     ebx
004E5F30   8BE5                   mov     esp, ebp
004E5F32   5D                     pop     ebp
004E5F33   C3                     ret

*)
end;

procedure TForm1.Button_ParametersClick(Sender : TObject);
begin
(*
004E6160   53                     push    ebx
004E6161   56                     push    esi
004E6162   8BD8                   mov     ebx, eax
004E6164   C60534724F0000         mov     byte ptr [$004F7234], $00

* Reference to TOptionsForm instance
|
004E616B   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E6170   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.InquireInterval : TSpinEdit
|
004E6172   8B800C030000           mov     eax, [eax+$030C]

* Reference to : TTimerSpeedButton._PROC_004C2644()
|
004E6178   E8C7C4FDFF             call    004C2644
004E617D   8BD0                   mov     edx, eax

* Reference to control TForm1.TimerParam : TTimer
|
004E617F   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetInterval(TTimer;Cardinal);
|
004E6185   E82AF2F4FF             call    004353B4
004E618A   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004E6191   741E                   jz      004E61B1
004E6193   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E619A   7524                   jnz     004E61C0
004E619C   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E61A3   740C                   jz      004E61B1

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E61A5   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E61AB   83780C02               cmp     dword ptr [eax+$0C], +$02
004E61AF   750F                   jnz     004E61C0

* Reference to TParamCaseForm instance
|
004E61B1   A13C594F00             mov     eax, dword ptr [$004F593C]
004E61B6   8B00                   mov     eax, [eax]
004E61B8   8B10                   mov     edx, [eax]

* Reference to method TParamCaseForm.ShowModal()
|
004E61BA   FF92EC000000           call    dword ptr [edx+$00EC]
004E61C0   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004E61C5   E8AEF9F1FF             call    00405B78
004E61CA   85C0                   test    eax, eax
004E61CC   7E6A                   jle     004E6238

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E61CE   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E61D4   C7400C02000000         mov     dword ptr [eax+$0C], $00000002

* Reference to control TForm1.List_Param : TValueListEditor
|
004E61DB   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004E61E1   E83EAFFAFF             call    00491124
004E61E6   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004E61E8   FF5244                 call    dword ptr [edx+$44]
004E61EB   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E61ED   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E61F3   E890C9F8FF             call    00472B88
004E61F8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E61FA   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E6200   E883C9F8FF             call    00472B88
004E6205   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E6207   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E620D   E876C9F8FF             call    00472B88
004E6212   B201                   mov     dl, $01

* Reference to control TForm1.DriverIM : TMenuItem
|
004E6214   8B8318040000           mov     eax, [ebx+$0418]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004E621A   E869C9F8FF             call    00472B88
004E621F   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004E6226   7510                   jnz     004E6238

* Reference to control TForm1.TimerParam : TTimer
|
004E6228   8B8330030000           mov     eax, [ebx+$0330]
004E622E   8BF0                   mov     esi, eax
004E6230   8BD0                   mov     edx, eax

* Reference to field TTimer.OFFS_003C
|
004E6232   8B463C                 mov     eax, [esi+$3C]

* Possible reference to virtual method TTimer.OFFS_38
|
004E6235   FF5638                 call    dword ptr [esi+$38]
004E6238   5E                     pop     esi
004E6239   5B                     pop     ebx
004E623A   C3                     ret

*)
end;

procedure TForm1.MenuItem_SettingClick(Sender : TObject);
begin
(*

* Reference to TOptionsForm instance
|
004E96EC   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E96F1   8B00                   mov     eax, [eax]
004E96F3   8B10                   mov     edx, [eax]

* Reference to method TOptionsForm.ShowModal()
|
004E96F5   FF92EC000000           call    dword ptr [edx+$00EC]
004E96FB   C3                     ret

*)
end;

procedure TForm1.TimerTesterPresentTimer(Sender : TObject);
begin
(*
004E96FC   83C4F0                 add     esp, -$10
004E96FF   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E9706   753F                   jnz     004E9747
004E9708   6A12                   push    $12
004E970A   C644240480             mov     byte ptr [esp+$04], $80
004E970F   8A15A86D4F00           mov     dl, byte ptr [$004F6DA8]
004E9715   88542405               mov     [esp+$05], dl
004E9719   8A15A96D4F00           mov     dl, byte ptr [$004F6DA9]
004E971F   88542406               mov     [esp+$06], dl
004E9723   C644240701             mov     byte ptr [esp+$07], $01
004E9728   C64424083E             mov     byte ptr [esp+$08], $3E
004E972D   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E9733   88542409               mov     [esp+$09], dl
004E9737   8D542404               lea     edx, [esp+$04]
004E973B   B905000000             mov     ecx, $00000005

* Reference to : TForm1.WriteReadComm()
|
004E9740   E82397FFFF             call    004E2E68
004E9745   EB38                   jmp     004E977F
004E9747   6A12                   push    $12
004E9749   C644240C81             mov     byte ptr [esp+$0C], $81
004E974E   8A15A86D4F00           mov     dl, byte ptr [$004F6DA8]
004E9754   8854240D               mov     [esp+$0D], dl
004E9758   8A15A96D4F00           mov     dl, byte ptr [$004F6DA9]
004E975E   8854240E               mov     [esp+$0E], dl
004E9762   C644240F3E             mov     byte ptr [esp+$0F], $3E
004E9767   8A15A66D4F00           mov     dl, byte ptr [$004F6DA6]
004E976D   88542410               mov     [esp+$10], dl
004E9771   8D54240C               lea     edx, [esp+$0C]
004E9775   B904000000             mov     ecx, $00000004

* Reference to : TForm1.WriteReadComm()
|
004E977A   E8E996FFFF             call    004E2E68
004E977F   83C410                 add     esp, +$10
004E9782   C3                     ret

*)
end;

procedure TForm1.Disconnect(Sender : TObject);
begin
(*
004E9784   53                     push    ebx
004E9785   8BD8                   mov     ebx, eax
004E9787   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004E978E   0F849F000000           jz      004E9833
004E9794   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004E9796   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E979C   E803BCF4FF             call    004353A4
004E97A1   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004E97A3   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E97A9   E8F6BBF4FF             call    004353A4
004E97AE   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004E97B3   3B059C6D4F00           cmp     eax, [$004F6D9C]
004E97B9   7409                   jz      004E97C4
004E97BB   833DA06D4F0000         cmp     dword ptr [$004F6DA0], +$00
004E97C2   752D                   jnz     004E97F1
004E97C4   6814000400             push    $00040014

* Possible String Reference to: 'Ошибка'
|
004E97C9   6838984E00             push    $004E9838

* Possible String Reference to: 'Нет ответа от ЭБУ.Повторить попытку
|                                 соединения?'
|
004E97CE   6840984E00             push    $004E9840
004E97D3   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E97D5   E88EE0F1FF             call    00407868
004E97DA   83F806                 cmp     eax, +$06
004E97DD   7509                   jnz     004E97E8
004E97DF   C6051A724F0001         mov     byte ptr [$004F721A], $01
004E97E6   EB34                   jmp     004E981C
004E97E8   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E97EF   EB2B                   jmp     004E981C
004E97F1   6814000400             push    $00040014

* Possible String Reference to: 'Ошибка'
|
004E97F6   6838984E00             push    $004E9838

* Possible String Reference to: 'Неверный ответ ЭБУПовторить попытку
|                                 соединения?'
|
004E97FB   6874984E00             push    $004E9874
004E9800   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E9802   E861E0F1FF             call    00407868
004E9807   83F806                 cmp     eax, +$06
004E980A   7509                   jnz     004E9815
004E980C   C6051A724F0001         mov     byte ptr [$004F721A], $01
004E9813   EB07                   jmp     004E981C
004E9815   C6051A724F0000         mov     byte ptr [$004F721A], $00

* Reference to TGrafForm instance
|
004E981C   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004E9821   8B00                   mov     eax, [eax]

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004E9823   E8283AF9FF             call    0047D250

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E9828   8B831C030000           mov     eax, [ebx+$031C]
004E982E   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E9830   FF5244                 call    dword ptr [edx+$44]
004E9833   5B                     pop     ebx
004E9834   C3                     ret

*)
end;

procedure TForm1.Button_ECUIdentClick(Sender : TObject);
begin
(*
004EA0B0   55                     push    ebp
004EA0B1   8BEC                   mov     ebp, esp
004EA0B3   83C4B4                 add     esp, -$4C
004EA0B6   53                     push    ebx
004EA0B7   56                     push    esi
004EA0B8   57                     push    edi
004EA0B9   33C9                   xor     ecx, ecx
004EA0BB   894DC0                 mov     [ebp-$40], ecx
004EA0BE   894DBC                 mov     [ebp-$44], ecx
004EA0C1   894DC8                 mov     [ebp-$38], ecx
004EA0C4   894DC4                 mov     [ebp-$3C], ecx
004EA0C7   894DD0                 mov     [ebp-$30], ecx
004EA0CA   894DD4                 mov     [ebp-$2C], ecx
004EA0CD   894DD8                 mov     [ebp-$28], ecx
004EA0D0   894DF4                 mov     [ebp-$0C], ecx
004EA0D3   8945FC                 mov     [ebp-$04], eax
004EA0D6   33C0                   xor     eax, eax
004EA0D8   55                     push    ebp

* Possible String Reference to: 'йє›сялЦ_^[‹е]Г'
|
004EA0D9   68EDA74E00             push    $004EA7ED

***** TRY
|
004EA0DE   64FF30                 push    dword ptr fs:[eax]
004EA0E1   648920                 mov     fs:[eax], esp

* Reference to Form1
|
004EA0E4   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA0E7   8B8020030000           mov     eax, [eax+$0320]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EA0ED   E83270FAFF             call    00491124
004EA0F2   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EA0F4   FF5244                 call    dword ptr [edx+$44]

* Reference to Form1
|
004EA0F7   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA0FA   8B8020030000           mov     eax, [eax+$0320]
004EA100   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA102   E87D60F7FF             call    00460184

* Reference to Form1
|
004EA107   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EA10A   8B8024030000           mov     eax, [eax+$0324]
004EA110   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA112   E86D60F7FF             call    00460184

* Reference to Form1
|
004EA117   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.Panel_DTC : TPanel
|
004EA11A   8B8044030000           mov     eax, [eax+$0344]
004EA120   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA122   E85D60F7FF             call    00460184

* Reference to Form1
|
004EA127   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.TimerParam : TTimer
|
004EA12A   8B8030030000           mov     eax, [eax+$0330]
004EA130   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EA132   E86DB2F4FF             call    004353A4
004EA137   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA13E   7527                   jnz     004EA167
004EA140   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA145   2C11                   sub     al, $11
004EA147   7404                   jz      004EA14D
004EA149   2C02                   sub     al, $02
004EA14B   751A                   jnz     004EA167
004EA14D   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004EA154   7511                   jnz     004EA167
004EA156   C60524724F0000         mov     byte ptr [$004F7224], $00

* Reference to Form1
|
004EA15D   A1646D4F00             mov     eax, dword ptr [$004F6D64]

* Reference to : TForm1.SecurityAccess()
|
004EA162   E8AD2D0000             call    004ECF14
004EA167   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA16E   0F85CD020000           jnz     004EA441
004EA174   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EA17B   0F84C0020000           jz      004EA441
004EA181   803D25724F0000         cmp     byte ptr [$004F7225], $00
004EA188   0F85B3020000           jnz     004EA441

* Reference to: kernel32.GetTickCount()
|
004EA18E   E8BDCEF1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004EA193   A3986D4F00             mov     dword ptr [$004F6D98], eax
004EA198   EB0C                   jmp     004EA1A6

* Reference to TApplication instance
|
004EA19A   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004EA19F   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EA1A1   E83E66F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EA1A6   E8A5CEF1FF             call    00407050
004EA1AB   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EA1B1   3DC8000000             cmp     eax, $000000C8
004EA1B6   72E2                   jb      004EA19A
004EA1B8   33C0                   xor     eax, eax
004EA1BA   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA1BF   83F841                 cmp     eax, +$41
004EA1C2   7F1C                   jnle    004EA1E0
004EA1C4   742D                   jz      004EA1F3
004EA1C6   83C0EF                 add     eax, -$11
004EA1C9   83E805                 sub     eax, +$05
004EA1CC   7225                   jb      004EA1F3
004EA1CE   83C0F5                 add     eax, -$0B
004EA1D1   83E802                 sub     eax, +$02
004EA1D4   721D                   jb      004EA1F3
004EA1D6   83E80F                 sub     eax, +$0F
004EA1D9   7456                   jz      004EA231
004EA1DB   E9D1000000             jmp     004EA2B1
004EA1E0   83E842                 sub     eax, +$42
004EA1E3   0F8487000000           jz      004EA270
004EA1E9   48                     dec     eax
004EA1EA   83E802                 sub     eax, +$02
004EA1ED   0F83BE000000           jnb     004EA2B1
004EA1F3   68FF000000             push    $000000FF
004EA1F8   C645EC82               mov     byte ptr [ebp-$14], $82
004EA1FC   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA201   8845ED                 mov     [ebp-$13], al
004EA204   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA209   8845EE                 mov     [ebp-$12], al
004EA20C   C645EF1A               mov     byte ptr [ebp-$11], $1A
004EA210   C645F080               mov     byte ptr [ebp-$10], $80
004EA214   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA219   8845F1                 mov     [ebp-$0F], al
004EA21C   8D55EC                 lea     edx, [ebp-$14]
004EA21F   B905000000             mov     ecx, $00000005

* Reference to Form1
|
004EA224   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA227   E83C8CFFFF             call    004E2E68
004EA22C   E980000000             jmp     004EA2B1
004EA231   68FF000000             push    $000000FF
004EA236   C645E480               mov     byte ptr [ebp-$1C], $80
004EA23A   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA23F   8845E5                 mov     [ebp-$1B], al
004EA242   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA247   8845E6                 mov     [ebp-$1A], al
004EA24A   C645E702               mov     byte ptr [ebp-$19], $02
004EA24E   C645E81A               mov     byte ptr [ebp-$18], $1A
004EA252   C645E991               mov     byte ptr [ebp-$17], $91
004EA256   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA25B   8845EA                 mov     [ebp-$16], al
004EA25E   8D55E4                 lea     edx, [ebp-$1C]
004EA261   B906000000             mov     ecx, $00000006

* Reference to Form1
|
004EA266   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA269   E8FA8BFFFF             call    004E2E68
004EA26E   EB41                   jmp     004EA2B1
004EA270   68FF000000             push    $000000FF
004EA275   C645DC84               mov     byte ptr [ebp-$24], $84
004EA279   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA27E   8845DD                 mov     [ebp-$23], al
004EA281   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA286   8845DE                 mov     [ebp-$22], al
004EA289   C645DFB1               mov     byte ptr [ebp-$21], $B1
004EA28D   C645E003               mov     byte ptr [ebp-$20], $03
004EA291   C645E100               mov     byte ptr [ebp-$1F], $00
004EA295   C645E200               mov     byte ptr [ebp-$1E], $00
004EA299   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA29E   8845E3                 mov     [ebp-$1D], al
004EA2A1   8D55DC                 lea     edx, [ebp-$24]
004EA2A4   B907000000             mov     ecx, $00000007

* Reference to Form1
|
004EA2A9   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA2AC   E8B78BFFFF             call    004E2E68
004EA2B1   33F6                   xor     esi, esi
004EA2B3   803DA76D4F0041         cmp     byte ptr [$004F6DA7], $41
004EA2BA   751D                   jnz     004EA2D9
004EA2BC   8D4609                 lea     eax, [esi+$09]
004EA2BF   80B8F86D4F007F         cmp     byte ptr [eax+$4F6DF8], $7F
004EA2C6   7511                   jnz     004EA2D9
004EA2C8   8D460B                 lea     eax, [esi+$0B]
004EA2CB   80B8F86D4F0078         cmp     byte ptr [eax+$4F6DF8], $78
004EA2D2   7505                   jnz     004EA2D9
004EA2D4   83C607                 add     esi, +$07
004EA2D7   EBDA                   jmp     004EA2B3
004EA2D9   803DA76D4F0011         cmp     byte ptr [$004F6DA7], $11
004EA2E0   750D                   jnz     004EA2EF
004EA2E2   803D016E4F00A5         cmp     byte ptr [$004F6E01], $A5
004EA2E9   0F85C3000000           jnz     004EA3B2
004EA2EF   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004EA2F6   750D                   jnz     004EA305
004EA2F8   803D016E4F0050         cmp     byte ptr [$004F6E01], $50
004EA2FF   0F85AD000000           jnz     004EA3B2
004EA305   803DA76D4F0013         cmp     byte ptr [$004F6DA7], $13
004EA30C   750D                   jnz     004EA31B
004EA30E   803D016E4F00A5         cmp     byte ptr [$004F6E01], $A5
004EA315   0F8597000000           jnz     004EA3B2
004EA31B   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EA322   750D                   jnz     004EA331
004EA324   803D016E4F0081         cmp     byte ptr [$004F6E01], $81
004EA32B   0F8581000000           jnz     004EA3B2
004EA331   803DA76D4F0021         cmp     byte ptr [$004F6DA7], $21
004EA338   7509                   jnz     004EA343
004EA33A   803D016E4F0063         cmp     byte ptr [$004F6E01], $63
004EA341   756F                   jnz     004EA3B2
004EA343   803DA76D4F0022         cmp     byte ptr [$004F6DA7], $22
004EA34A   7509                   jnz     004EA355
004EA34C   803D016E4F0076         cmp     byte ptr [$004F6E01], $76
004EA353   755D                   jnz     004EA3B2
004EA355   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EA35C   7509                   jnz     004EA367
004EA35E   803D026E4F0012         cmp     byte ptr [$004F6E02], $12
004EA365   754B                   jnz     004EA3B2
004EA367   803DA76D4F0041         cmp     byte ptr [$004F6DA7], $41
004EA36E   750C                   jnz     004EA37C
004EA370   8D4606                 lea     eax, [esi+$06]
004EA373   80B8F86D4F009E         cmp     byte ptr [eax+$4F6DF8], $9E
004EA37A   7536                   jnz     004EA3B2
004EA37C   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004EA383   7509                   jnz     004EA38E
004EA385   803D006E4F008D         cmp     byte ptr [$004F6E00], $8D
004EA38C   7524                   jnz     004EA3B2
004EA38E   803DA76D4F0043         cmp     byte ptr [$004F6DA7], $43
004EA395   7509                   jnz     004EA3A0
004EA397   803DFE6D4F00A3         cmp     byte ptr [$004F6DFE], $A3
004EA39E   7512                   jnz     004EA3B2
004EA3A0   803DA76D4F0044         cmp     byte ptr [$004F6DA7], $44
004EA3A7   7532                   jnz     004EA3DB
004EA3A9   803DFE6D4F009F         cmp     byte ptr [$004F6DFE], $9F
004EA3B0   7429                   jz      004EA3DB

* Reference to Form1
|
004EA3B2   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EA3B5   8B801C030000           mov     eax, [eax+$031C]
004EA3BB   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EA3BD   FF5244                 call    dword ptr [edx+$44]
004EA3C0   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004EA3C5   68FCA74E00             push    $004EA7FC

* Possible String Reference to: 'Неверный тип ЭБУ'
|
004EA3CA   6804A84E00             push    $004EA804
004EA3CF   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EA3D1   E892D4F1FF             call    00407868
004EA3D6   E9E2030000             jmp     004EA7BD
004EA3DB   C605FA6D4F0000         mov     byte ptr [$004F6DFA], $00
004EA3E2   BA01000000             mov     edx, $00000001
004EA3E7   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EA3EC   E84790F1FF             call    00403438

|
004EA3F1   E8BE84F1FF             call    004028B4
004EA3F6   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EA3FD   BBCC1D4F00             mov     ebx, $004F1DCC
004EA402   8A03                   mov     al, byte ptr [ebx]
004EA404   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EA40A   7522                   jnz     004EA42E
004EA40C   68CC6D4F00             push    $004F6DCC
004EA411   8B4B0C                 mov     ecx, [ebx+$0C]
004EA414   8B4308                 mov     eax, [ebx+$08]
004EA417   03C6                   add     eax, esi
004EA419   8D90F86D4F00           lea     edx, [eax+$4F6DF8]
004EA41F   B8006F4F00             mov     eax, $004F6F00

|
004EA424   E8278CF1FF             call    00403050

|
004EA429   E88684F1FF             call    004028B4
004EA42E   FF45F8                 inc     dword ptr [ebp-$08]
004EA431   83C318                 add     ebx, +$18
004EA434   837DF835               cmp     dword ptr [ebp-$08], +$35
004EA438   75C8                   jnz     004EA402
004EA43A   C60525724F0001         mov     byte ptr [$004F7225], $01
004EA441   BA01000000             mov     edx, $00000001
004EA446   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004EA44B   E8C08FF1FF             call    00403410

|
004EA450   E85F84F1FF             call    004028B4
004EA455   68CC6D4F00             push    $004F6DCC
004EA45A   BAF86D4F00             mov     edx, $004F6DF8
004EA45F   B980000000             mov     ecx, $00000080
004EA464   B8006F4F00             mov     eax, $004F6F00

|
004EA469   E8C28BF1FF             call    00403030

|
004EA46E   E84184F1FF             call    004028B4

* Reference to Form1
|
004EA473   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA476   8B8020030000           mov     eax, [eax+$0320]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EA47C   E8A36CFAFF             call    00491124
004EA481   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EA483   FF5244                 call    dword ptr [edx+$44]

* Reference to Form1
|
004EA486   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.Panel_Knopki : TPanel
|
004EA489   8B80FC020000           mov     eax, [eax+$02FC]

* Reference to field TPanel.Tag : Longint
|
004EA48F   C7400C01000000         mov     dword ptr [eax+$0C], $00000001
004EA496   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EA49D   BBCC1D4F00             mov     ebx, $004F1DCC
004EA4A2   8A03                   mov     al, byte ptr [ebx]
004EA4A4   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EA4AA   0F85B6000000           jnz     004EA566
004EA4B0   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EA4B3   E874A5F1FF             call    00404A2C
004EA4B8   8B4314                 mov     eax, [ebx+$14]
004EA4BB   8BF8                   mov     edi, eax
004EA4BD   037B0C                 add     edi, [ebx+$0C]
004EA4C0   4F                     dec     edi
004EA4C1   2BF8                   sub     edi, eax
004EA4C3   7C6F                   jl      004EA534
004EA4C5   47                     inc     edi
004EA4C6   8DB0F86D4F00           lea     esi, [eax+$4F6DF8]
004EA4CC   8B4310                 mov     eax, [ebx+$10]
004EA4CF   48                     dec     eax
004EA4D0   7408                   jz      004EA4DA
004EA4D2   48                     dec     eax
004EA4D3   741C                   jz      004EA4F1
004EA4D5   48                     dec     eax
004EA4D6   7437                   jz      004EA50F
004EA4D8   EB56                   jmp     004EA530
004EA4DA   8D45D8                 lea     eax, [ebp-$28]
004EA4DD   8A16                   mov     dl, byte ptr [esi]

* Reference to: System.@LStrFromChar(String;String;Char);
|
004EA4DF   E830A7F1FF             call    00404C14
004EA4E4   8B55D8                 mov     edx, [ebp-$28]
004EA4E7   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrCat;
|
004EA4EA   E805A8F1FF             call    00404CF4
004EA4EF   EB3F                   jmp     004EA530
004EA4F1   8D4DD4                 lea     ecx, [ebp-$2C]
004EA4F4   33C0                   xor     eax, eax
004EA4F6   8A06                   mov     al, byte ptr [esi]
004EA4F8   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EA4FD   E8D2ECF1FF             call    004091D4
004EA502   8B55D4                 mov     edx, [ebp-$2C]
004EA505   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrCat;
|
004EA508   E8E7A7F1FF             call    00404CF4
004EA50D   EB21                   jmp     004EA530
004EA50F   8B4314                 mov     eax, [ebx+$14]
004EA512   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004EA519   C1E008                 shl     eax, $08
004EA51C   8B5314                 mov     edx, [ebx+$14]
004EA51F   0FB692F96D4F00         movzx   edx, byte ptr [edx+$4F6DF9]
004EA526   03C2                   add     eax, edx
004EA528   8D55F4                 lea     edx, [ebp-$0C]

* Reference to: SysUtils.IntToStr(Integer):AnsiString;overload;
|
004EA52B   E890EBF1FF             call    004090C0
004EA530   46                     inc     esi
004EA531   4F                     dec     edi
004EA532   7598                   jnz     004EA4CC
004EA534   8B4314                 mov     eax, [ebx+$14]
004EA537   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EA53D   2C20                   sub     al, $20
004EA53F   7404                   jz      004EA545
004EA541   2CDF                   sub     al, $DF
004EA543   750D                   jnz     004EA552
004EA545   8D45F4                 lea     eax, [ebp-$0C]

* Possible String Reference to: 'Информация в ЭБУ не записана'
|
004EA548   BA20A84E00             mov     edx, $004EA820

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EA54D   E872A5F1FF             call    00404AC4

* Reference to Form1
|
004EA552   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA555   8B8020030000           mov     eax, [eax+$0320]
004EA55B   8B4DF4                 mov     ecx, [ebp-$0C]
004EA55E   8B5304                 mov     edx, [ebx+$04]

* Reference to: ValEdit.TValueListEditor.SetValue(TValueListEditor;AnsiString;AnsiString);
|
004EA561   E8BA6AFAFF             call    00491020
004EA566   FF45F8                 inc     dword ptr [ebp-$08]
004EA569   83C318                 add     ebx, +$18
004EA56C   837DF835               cmp     dword ptr [ebp-$08], +$35
004EA570   0F852CFFFFFF           jnz     004EA4A2
004EA576   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA57D   0F852D010000           jnz     004EA6B0
004EA583   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA588   2C11                   sub     al, $11
004EA58A   7408                   jz      004EA594
004EA58C   2C02                   sub     al, $02
004EA58E   0F8592000000           jnz     004EA626
004EA594   68FF000000             push    $000000FF
004EA599   C645EC82               mov     byte ptr [ebp-$14], $82
004EA59D   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA5A2   8845ED                 mov     [ebp-$13], al
004EA5A5   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA5AA   8845EE                 mov     [ebp-$12], al
004EA5AD   C645EF21               mov     byte ptr [ebp-$11], $21
004EA5B1   C645F005               mov     byte ptr [ebp-$10], $05
004EA5B5   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA5BA   8845F1                 mov     [ebp-$0F], al
004EA5BD   8D55EC                 lea     edx, [ebp-$14]
004EA5C0   B905000000             mov     ecx, $00000005

* Reference to Form1
|
004EA5C5   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA5C8   E89B88FFFF             call    004E2E68
004EA5CD   8B1DB81E4F00           mov     ebx, [$004F1EB8]
004EA5D3   33C0                   xor     eax, eax
004EA5D5   8A83F86D4F00           mov     al, byte ptr [ebx+$4F6DF8]
004EA5DB   C1E010                 shl     eax, $10
004EA5DE   33D2                   xor     edx, edx
004EA5E0   8A93F96D4F00           mov     dl, byte ptr [ebx+$4F6DF9]
004EA5E6   C1E208                 shl     edx, $08
004EA5E9   03C2                   add     eax, edx
004EA5EB   33D2                   xor     edx, edx
004EA5ED   8A93FA6D4F00           mov     dl, byte ptr [ebx+$4F6DFA]
004EA5F3   03C2                   add     eax, edx
004EA5F5   8945CC                 mov     [ebp-$34], eax
004EA5F8   DB45CC                 fild    dword ptr [ebp-$34]
004EA5FB   D83540A84E00           fdiv    dword ptr [$004EA840]
004EA601   83C4F4                 add     esp, -$0C
004EA604   DB3C24                 fstp    tbyte ptr [esp]
004EA607   9B                     wait
004EA608   8D45D0                 lea     eax, [ebp-$30]

|
004EA60B   E81403F2FF             call    0040A924
004EA610   8B4DD0                 mov     ecx, [ebp-$30]

* Reference to Form1
|
004EA613   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EA616   8B8020030000           mov     eax, [eax+$0320]

* Possible String Reference to: 'Пробег в ЭБУ'
|
004EA61C   BA4CA84E00             mov     edx, $004EA84C

* Reference to: ValEdit.TValueListEditor.SetValue(TValueListEditor;AnsiString;AnsiString);
|
004EA621   E8FA69FAFF             call    00491020
004EA626   A1806D4F00             mov     eax, dword ptr [$004F6D80]
004EA62B   33D2                   xor     edx, edx
004EA62D   52                     push    edx
004EA62E   50                     push    eax
004EA62F   8D45C4                 lea     eax, [ebp-$3C]

|
004EA632   E875EBF1FF             call    004091AC
004EA637   8B4DC4                 mov     ecx, [ebp-$3C]
004EA63A   8D45C8                 lea     eax, [ebp-$38]

* Possible String Reference to: '  Скорость: '
|
004EA63D   BA64A84E00             mov     edx, $004EA864

* Reference to: System.@LStrCat3;
|
004EA642   E8F1A6F1FF             call    00404D38
004EA647   8B45C8                 mov     eax, [ebp-$38]
004EA64A   50                     push    eax

* Reference to Form1
|
004EA64B   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA64E   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA654   8B8008020000           mov     eax, [eax+$0208]
004EA65A   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA65F   E83455F5FF             call    0043FB98
004EA664   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA665   E88A54F5FF             call    0043FAF4
004EA66A   8D4DBC                 lea     ecx, [ebp-$44]
004EA66D   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]

* Reference to Form1
|
004EA673   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.PreobrTipECU()
|
004EA676   E87989FFFF             call    004E2FF4
004EA67B   8B4DBC                 mov     ecx, [ebp-$44]
004EA67E   8D45C0                 lea     eax, [ebp-$40]

* Possible String Reference to: '  Подключен ЭБУ '
|
004EA681   BA7CA84E00             mov     edx, $004EA87C

* Reference to: System.@LStrCat3;
|
004EA686   E8ADA6F1FF             call    00404D38
004EA68B   8B45C0                 mov     eax, [ebp-$40]
004EA68E   50                     push    eax

* Reference to Form1
|
004EA68F   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA692   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA698   8B8008020000           mov     eax, [eax+$0208]
004EA69E   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA6A3   E8F054F5FF             call    0043FB98
004EA6A8   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA6A9   E84654F5FF             call    0043FAF4
004EA6AE   EB20                   jmp     004EA6D0

* Reference to Form1
|
004EA6B0   8B45FC                 mov     eax, [ebp-$04]

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EA6B3   8B80F8020000           mov     eax, [eax+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EA6B9   8B8008020000           mov     eax, [eax+$0208]
004EA6BF   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EA6C4   E8CF54F5FF             call    0043FB98
004EA6C9   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EA6CB   E82454F5FF             call    0043FAF4
004EA6D0   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA6D7   0F85E0000000           jnz     004EA7BD
004EA6DD   803DA76D4F0040         cmp     byte ptr [$004F6DA7], $40
004EA6E4   0F86D3000000           jbe     004EA7BD
004EA6EA   6A0F                   push    $0F
004EA6EC   C645B481               mov     byte ptr [ebp-$4C], $81
004EA6F0   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA6F5   8845B5                 mov     [ebp-$4B], al
004EA6F8   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA6FD   8845B6                 mov     [ebp-$4A], al
004EA700   C645B782               mov     byte ptr [ebp-$49], $82
004EA704   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA709   8845B8                 mov     [ebp-$48], al
004EA70C   8D55B4                 lea     edx, [ebp-$4C]
004EA70F   B904000000             mov     ecx, $00000004

* Reference to Form1
|
004EA714   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA717   E84C87FFFF             call    004E2E68
004EA71C   68F4010000             push    $000001F4

* Reference to: kernel32.Sleep()
|
004EA721   E8563CF2FF             call    0040E37C
004EA726   33C0                   xor     eax, eax
004EA728   8945F8                 mov     [ebp-$08], eax
004EA72B   FF45F8                 inc     dword ptr [ebp-$08]
004EA72E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA733   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EA734   E887C7F1FF             call    00406EC0
004EA739   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA73E   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA73F   E8383CF2FF             call    0040E37C
004EA744   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA749   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EA74A   E8C1C9F1FF             call    00407110
004EA74F   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA754   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA755   E8223CF2FF             call    0040E37C
004EA75A   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EA75F   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EA760   E85BC7F1FF             call    00406EC0
004EA765   A1C06D4F00             mov     eax, dword ptr [$004F6DC0]
004EA76A   50                     push    eax

* Reference to: kernel32.Sleep()
|
004EA76B   E80C3CF2FF             call    0040E37C
004EA770   6A0F                   push    $0F
004EA772   C645B481               mov     byte ptr [ebp-$4C], $81
004EA776   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EA77B   8845B5                 mov     [ebp-$4B], al
004EA77E   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EA783   8845B6                 mov     [ebp-$4A], al
004EA786   C645B781               mov     byte ptr [ebp-$49], $81
004EA78A   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EA78F   8845B8                 mov     [ebp-$48], al
004EA792   8D55B4                 lea     edx, [ebp-$4C]
004EA795   B904000000             mov     ecx, $00000004

* Reference to Form1
|
004EA79A   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.WriteReadComm()
|
004EA79D   E8C686FFFF             call    004E2E68
004EA7A2   803D006E4F00C1         cmp     byte ptr [$004F6E00], $C1
004EA7A9   7412                   jz      004EA7BD
004EA7AB   837DF802               cmp     dword ptr [ebp-$08], +$02
004EA7AF   0F8E76FFFFFF           jle     004EA72B

* Reference to Form1
|
004EA7B5   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.Disconnect()
|
004EA7B8   E8C7EFFFFF             call    004E9784
004EA7BD   33C0                   xor     eax, eax
004EA7BF   5A                     pop     edx
004EA7C0   59                     pop     ecx
004EA7C1   59                     pop     ecx
004EA7C2   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[‹е]Г'
|
004EA7C5   68F4A74E00             push    $004EA7F4
004EA7CA   8D45BC                 lea     eax, [ebp-$44]
004EA7CD   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EA7D2   E879A2F1FF             call    00404A50
004EA7D7   8D45D0                 lea     eax, [ebp-$30]
004EA7DA   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EA7DF   E86CA2F1FF             call    00404A50
004EA7E4   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EA7E7   E840A2F1FF             call    00404A2C
004EA7EC   C3                     ret


* Reference to: System.@HandleFinally;
|
004EA7ED   E9BA9BF1FF             jmp     004043AC
004EA7F2   EBD6                   jmp     004EA7CA

****** END
|
004EA7F4   5F                     pop     edi
004EA7F5   5E                     pop     esi
004EA7F6   5B                     pop     ebx
004EA7F7   8BE5                   mov     esp, ebp
004EA7F9   5D                     pop     ebp
004EA7FA   C3                     ret

*)
end;

procedure TForm1.MenuItem_StopClick(Sender : TObject);
begin
(*
004EC0A0   55                     push    ebp
004EC0A1   8BEC                   mov     ebp, esp
004EC0A3   B904000000             mov     ecx, $00000004
004EC0A8   6A00                   push    $00
004EC0AA   6A00                   push    $00
004EC0AC   49                     dec     ecx
004EC0AD   75F9                   jnz     004EC0A8
004EC0AF   51                     push    ecx
004EC0B0   53                     push    ebx
004EC0B1   8BD8                   mov     ebx, eax
004EC0B3   33C0                   xor     eax, eax
004EC0B5   55                     push    ebp

* Possible String Reference to: 'й&сялЮ[‹е]Г'
|
004EC0B6   6881C44E00             push    $004EC481

***** TRY
|
004EC0BB   64FF30                 push    dword ptr fs:[eax]
004EC0BE   648920                 mov     fs:[eax], esp
004EC0C1   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004EC0C3   8B831C030000           mov     eax, [ebx+$031C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC0C9   E8BA6AF8FF             call    00472B88
004EC0CE   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004EC0D0   8B8328030000           mov     eax, [ebx+$0328]
004EC0D6   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EC0D8   FF5164                 call    dword ptr [ecx+$64]
004EC0DB   33D2                   xor     edx, edx

* Reference to control TForm1.Button_ECUIdent : TButton
|
004EC0DD   8B8334030000           mov     eax, [ebx+$0334]
004EC0E3   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EC0E5   FF5164                 call    dword ptr [ecx+$64]
004EC0E8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004EC0EA   8B8340030000           mov     eax, [ebx+$0340]
004EC0F0   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EC0F2   FF5164                 call    dword ptr [ecx+$64]
004EC0F5   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004EC0F7   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004EC0FD   E8A26BF8FF             call    00472CA4
004EC102   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004EC104   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004EC10A   E8956BF8FF             call    00472CA4
004EC10F   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Start : TMenuItem
|
004EC111   8B8318030000           mov     eax, [ebx+$0318]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC117   E86C6AF8FF             call    00472B88
004EC11C   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Setting : TMenuItem
|
004EC11E   8B8354030000           mov     eax, [ebx+$0354]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC124   E85F6AF8FF             call    00472B88
004EC129   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Load : TMenuItem
|
004EC12B   8B830C030000           mov     eax, [ebx+$030C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC131   E8526AF8FF             call    00472B88
004EC136   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Test : TMenuItem
|
004EC138   8B8350030000           mov     eax, [ebx+$0350]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC13E   E8456AF8FF             call    00472B88
004EC143   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EC145   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC14B   E8386AF8FF             call    00472B88
004EC150   833DC86D4F0002         cmp     dword ptr [$004F6DC8], +$02
004EC157   7E0D                   jle     004EC166
004EC159   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004EC15B   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC161   E8226AF8FF             call    00472B88
004EC166   C6051F724F0000         mov     byte ptr [$004F721F], $00
004EC16D   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EC16F   E80822F2FF             call    0040E37C
004EC174   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EC179   04CF                   add     al, -$31
004EC17B   2C02                   sub     al, $02
004EC17D   7233                   jb      004EC1B2
004EC17F   6A0C                   push    $0C
004EC181   C645F881               mov     byte ptr [ebp-$08], $81
004EC185   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EC18A   8845F9                 mov     [ebp-$07], al
004EC18D   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EC192   8845FA                 mov     [ebp-$06], al
004EC195   C645FB82               mov     byte ptr [ebp-$05], $82
004EC199   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EC19E   8845FC                 mov     [ebp-$04], al
004EC1A1   8D55F8                 lea     edx, [ebp-$08]
004EC1A4   B904000000             mov     ecx, $00000004
004EC1A9   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EC1AB   E8B86CFFFF             call    004E2E68
004EC1B0   EB5D                   jmp     004EC20F
004EC1B2   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EC1B9   7537                   jnz     004EC1F2
004EC1BB   6A0C                   push    $0C
004EC1BD   C645F080               mov     byte ptr [ebp-$10], $80
004EC1C1   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EC1C6   8845F1                 mov     [ebp-$0F], al
004EC1C9   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EC1CE   8845F2                 mov     [ebp-$0E], al
004EC1D1   C645F301               mov     byte ptr [ebp-$0D], $01
004EC1D5   C645F482               mov     byte ptr [ebp-$0C], $82
004EC1D9   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EC1DE   8845F5                 mov     [ebp-$0B], al
004EC1E1   8D55F0                 lea     edx, [ebp-$10]
004EC1E4   B905000000             mov     ecx, $00000005
004EC1E9   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EC1EB   E8786CFFFF             call    004E2E68
004EC1F0   EB1D                   jmp     004EC20F
004EC1F2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC1F7   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EC1F8   E813AFF1FF             call    00407110
004EC1FD   6A32                   push    $32

* Reference to: kernel32.Sleep()
|
004EC1FF   E87821F2FF             call    0040E37C
004EC204   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC209   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EC20A   E8B1ACF1FF             call    00406EC0
004EC20F   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004EC211   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EC217   E88891F4FF             call    004353A4
004EC21C   33D2                   xor     edx, edx

* Reference to control TForm1.List_Ident : TValueListEditor
|
004EC21E   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC224   E85B3FF7FF             call    00460184
004EC229   33D2                   xor     edx, edx

* Reference to control TForm1.List_Param : TValueListEditor
|
004EC22B   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC231   E84E3FF7FF             call    00460184
004EC236   33D2                   xor     edx, edx

* Reference to control TForm1.Panel_DTC : TPanel
|
004EC238   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC23E   E8413FF7FF             call    00460184
004EC243   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004EC245   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EC24B   E85491F4FF             call    004353A4
004EC250   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EC252   E8056AFAFF             call    00492C5C

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EC257   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EC25D   8B8008020000           mov     eax, [eax+$0208]
004EC263   BA01000000             mov     edx, $00000001

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EC268   E82B39F5FF             call    0043FB98
004EC26D   33D2                   xor     edx, edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EC26F   E88038F5FF             call    0043FAF4

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004EC274   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004EC27A   8B8008020000           mov     eax, [eax+$0208]
004EC280   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004EC285   E80E39F5FF             call    0043FB98

* Possible String Reference to: '  Обмен закончен'
|
004EC28A   BA98C44E00             mov     edx, $004EC498

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004EC28F   E86038F5FF             call    0043FAF4
004EC294   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC299   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EC29A   E829ACF1FF             call    00406EC8
004EC29F   85C0                   test    eax, eax
004EC2A1   750B                   jnz     004EC2AE
004EC2A3   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EC2A8   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EC2A9   E81AACF1FF             call    00406EC8
004EC2AE   803D1D724F0001         cmp     byte ptr [$004F721D], $01
004EC2B5   7561                   jnz     004EC318
004EC2B7   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004EC2BE   7558                   jnz     004EC318
004EC2C0   803D34724F0001         cmp     byte ptr [$004F7234], $01
004EC2C7   7539                   jnz     004EC302
004EC2C9   BA40000000             mov     edx, $00000040
004EC2CE   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EC2D3   E86071F1FF             call    00403438

|
004EC2D8   E8D765F1FF             call    004028B4
004EC2DD   C605F86D4F00FF         mov     byte ptr [$004F6DF8], $FF
004EC2E4   68CC6D4F00             push    $004F6DCC
004EC2E9   BAF86D4F00             mov     edx, $004F6DF8
004EC2EE   B901000000             mov     ecx, $00000001
004EC2F3   B8006F4F00             mov     eax, $004F6F00

|
004EC2F8   E8536DF1FF             call    00403050

|
004EC2FD   E8B265F1FF             call    004028B4
004EC302   C6051D724F0000         mov     byte ptr [$004F721D], $00
004EC309   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EC30E   E85D6DF1FF             call    00403070

|
004EC313   E89C65F1FF             call    004028B4
004EC318   B922020000             mov     ecx, $00000222
004EC31D   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004EC31F   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004EC322   E8E12BF7FF             call    0045EF08
004EC327   B919030000             mov     ecx, $00000319
004EC32C   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004EC331   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004EC334   E8CF2BF7FF             call    0045EF08
004EC339   B201                   mov     dl, $01

* Reference to control TForm1.Label_Dvig : TLabel
|
004EC33B   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC341   E83E3EF7FF             call    00460184
004EC346   B201                   mov     dl, $01

* Reference to control TForm1.Label_AKPP : TLabel
|
004EC348   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC34E   E8313EF7FF             call    00460184
004EC353   B201                   mov     dl, $01

* Reference to control TForm1.Label_ABS : TLabel
|
004EC355   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC35B   E8243EF7FF             call    00460184
004EC360   B201                   mov     dl, $01

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004EC362   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC368   E8173EF7FF             call    00460184
004EC36D   B201                   mov     dl, $01

* Reference to control TForm1.Label_Load : TLabel
|
004EC36F   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EC375   E80A3EF7FF             call    00460184
004EC37A   C60525724F0000         mov     byte ptr [$004F7225], $00

* Reference to TOptionsForm instance
|
004EC381   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004EC386   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.AutoSave : TCheckBox
|
004EC388   8B8024030000           mov     eax, [eax+$0324]
004EC38E   8B10                   mov     edx, [eax]

* Reference to method TCheckBox.GetChecked()
|
004EC390   FF92C8000000           call    dword ptr [edx+$00C8]
004EC396   3C01                   cmp     al, $01
004EC398   0F85AB000000           jnz     004EC449
004EC39E   803D19724F0000         cmp     byte ptr [$004F7219], $00
004EC3A5   0F859E000000           jnz     004EC449
004EC3AB   6A00                   push    $00
004EC3AD   8D55E8                 lea     edx, [ebp-$18]

* Reference to TOptionsForm instance
|
004EC3B0   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004EC3B5   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.Label4 : TLabel
|
004EC3B7   8B8048030000           mov     eax, [eax+$0348]

* Reference to: Controls.TControl.GetText(TControl):TCaption;
|
004EC3BD   E8A23EF7FF             call    00460264
004EC3C2   FF75E8                 push    dword ptr [ebp-$18]

* Reference to: SysUtils.Now:TDateTime;
|
004EC3C5   E88EEBF1FF             call    0040AF58
004EC3CA   83C4F8                 add     esp, -$08
004EC3CD   DD1C24                 fstp    qword ptr [esp]
004EC3D0   9B                     wait
004EC3D1   8D55E4                 lea     edx, [ebp-$1C]

* Possible String Reference to: 'yymmddhhnn'
|
004EC3D4   B8B4C44E00             mov     eax, $004EC4B4

|
004EC3D9   E8F6F7F1FF             call    0040BBD4
004EC3DE   FF75E4                 push    dword ptr [ebp-$1C]
004EC3E1   68C8C44E00             push    $004EC4C8
004EC3E6   8D4DE0                 lea     ecx, [ebp-$20]
004EC3E9   8A15A56D4F00           mov     dl, byte ptr [$004F6DA5]
004EC3EF   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EC3F1   E8FE6BFFFF             call    004E2FF4
004EC3F6   FF75E0                 push    dword ptr [ebp-$20]

* Possible String Reference to: '.cedat'
|
004EC3F9   68D4C44E00             push    $004EC4D4
004EC3FE   8D45EC                 lea     eax, [ebp-$14]
004EC401   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCatN;
|
004EC406   E8A189F1FF             call    00404DAC
004EC40B   8B45EC                 mov     eax, [ebp-$14]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EC40E   E8D98AF1FF             call    00404EEC
004EC413   50                     push    eax
004EC414   8D45DC                 lea     eax, [ebp-$24]

* Possible String Reference to: 'temp.tmp'
|
004EC417   B9E4C44E00             mov     ecx, $004EC4E4
004EC41C   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EC422   E81189F1FF             call    00404D38
004EC427   8B45DC                 mov     eax, [ebp-$24]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EC42A   E8BD8AF1FF             call    00404EEC
004EC42F   50                     push    eax

* Reference to: kernel32.CopyFileA()
|
004EC430   E8A3AAF1FF             call    00406ED8
004EC435   C60519724F0001         mov     byte ptr [$004F7219], $01
004EC43C   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_Save : TMenuItem
|
004EC43E   8B8308030000           mov     eax, [ebx+$0308]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EC444   E83F67F8FF             call    00472B88
004EC449   803D1A724F0001         cmp     byte ptr [$004F721A], $01
004EC450   7507                   jnz     004EC459
004EC452   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004EC454   E87F7CFFFF             call    004E40D8
004EC459   33C0                   xor     eax, eax
004EC45B   5A                     pop     edx
004EC45C   59                     pop     ecx
004EC45D   59                     pop     ecx
004EC45E   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[‹е]Г'
|
004EC461   6888C44E00             push    $004EC488
004EC466   8D45DC                 lea     eax, [ebp-$24]
004EC469   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC46E   E8DD85F1FF             call    00404A50
004EC473   8D45E8                 lea     eax, [ebp-$18]
004EC476   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EC47B   E8D085F1FF             call    00404A50
004EC480   C3                     ret


* Reference to: System.@HandleFinally;
|
004EC481   E9267FF1FF             jmp     004043AC
004EC486   EBDE                   jmp     004EC466

****** END
|
004EC488   5B                     pop     ebx
004EC489   8BE5                   mov     esp, ebp
004EC48B   5D                     pop     ebp
004EC48C   C3                     ret

*)
end;

procedure TForm1.Button_DTCClick(Sender : TObject);
begin
(*
004EA890   55                     push    ebp
004EA891   8BEC                   mov     ebp, esp
004EA893   B90F000000             mov     ecx, $0000000F
004EA898   6A00                   push    $00
004EA89A   6A00                   push    $00
004EA89C   49                     dec     ecx
004EA89D   75F9                   jnz     004EA898
004EA89F   53                     push    ebx
004EA8A0   56                     push    esi
004EA8A1   57                     push    edi
004EA8A2   8955FC                 mov     [ebp-$04], edx
004EA8A5   8BF8                   mov     edi, eax
004EA8A7   33C0                   xor     eax, eax
004EA8A9   55                     push    ebp

* Possible String Reference to: 'й„ЌсялЦ_^[‹е]Г'
|
004EA8AA   6823B64E00             push    $004EB623

***** TRY
|
004EA8AF   64FF30                 push    dword ptr fs:[eax]
004EA8B2   648920                 mov     fs:[eax], esp
004EA8B5   8B8744030000           mov     eax, [edi+$0344]
004EA8BB   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA8BD   E8C258F7FF             call    00460184
004EA8C2   8B8720030000           mov     eax, [edi+$0320]
004EA8C8   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA8CA   E8B558F7FF             call    00460184
004EA8CF   8B8724030000           mov     eax, [edi+$0324]
004EA8D5   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EA8D7   E8A858F7FF             call    00460184
004EA8DC   8B8730030000           mov     eax, [edi+$0330]
004EA8E2   33D2                   xor     edx, edx

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EA8E4   E8BBAAF4FF             call    004353A4
004EA8E9   8B9FB0030000           mov     ebx, [edi+$03B0]
004EA8EF   8BC3                   mov     eax, ebx
004EA8F1   33D2                   xor     edx, edx

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004EA8F3   E8DC17FAFF             call    0048C0D4
004EA8F8   8B9744030000           mov     edx, [edi+$0344]
004EA8FE   8B5248                 mov     edx, [edx+$48]
004EA901   2BD0                   sub     edx, eax
004EA903   52                     push    edx
004EA904   8B87B0030000           mov     eax, [edi+$03B0]
004EA90A   BA01000000             mov     edx, $00000001

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004EA90F   E8C017FAFF             call    0048C0D4
004EA914   59                     pop     ecx
004EA915   2BC8                   sub     ecx, eax
004EA917   83E907                 sub     ecx, +$07
004EA91A   8BC3                   mov     eax, ebx
004EA91C   BA02000000             mov     edx, $00000002

* Reference to: Grids.TCustomGrid.SetColWidths(TCustomGrid;Longint;Integer);
|
004EA921   E8E618FAFF             call    0048C20C
004EA926   8B87B0030000           mov     eax, [edi+$03B0]
004EA92C   BA02000000             mov     edx, $00000002

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EA931   E80A1CFAFF             call    0048C540
004EA936   6A00                   push    $00
004EA938   8B87B0030000           mov     eax, [edi+$03B0]
004EA93E   B901000000             mov     ecx, $00000001
004EA943   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA945   E8723DFAFF             call    0048E6BC
004EA94A   6A00                   push    $00
004EA94C   8B87B0030000           mov     eax, [edi+$03B0]
004EA952   B901000000             mov     ecx, $00000001
004EA957   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA95C   E85B3DFAFF             call    0048E6BC
004EA961   6A00                   push    $00
004EA963   8B87B0030000           mov     eax, [edi+$03B0]
004EA969   B901000000             mov     ecx, $00000001
004EA96E   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EA973   E8443DFAFF             call    0048E6BC
004EA978   8B8744030000           mov     eax, [edi+$0344]

* Reference to: Controls.TControl.Refresh(TControl);
|
004EA97E   E81D5EF7FF             call    004607A0
004EA983   8B87FC020000           mov     eax, [edi+$02FC]
004EA989   C7400C03000000         mov     dword ptr [eax+$0C], $00000003
004EA990   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EA997   0F84F6060000           jz      004EB093

* Reference to: kernel32.GetTickCount()
|
004EA99D   E8AEC6F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004EA9A2   A3986D4F00             mov     dword ptr [$004F6D98], eax
004EA9A7   EB0C                   jmp     004EA9B5

* Reference to TApplication instance
|
004EA9A9   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004EA9AE   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EA9B0   E82F5EF9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EA9B5   E896C6F1FF             call    00407050
004EA9BA   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EA9C0   3DC8000000             cmp     eax, $000000C8
004EA9C5   72E2                   jb      004EA9A9
004EA9C7   803D1B724F0001         cmp     byte ptr [$004F721B], $01
004EA9CE   7509                   jnz     004EA9D9
004EA9D0   C745F030000000         mov     dword ptr [ebp-$10], $00000030
004EA9D7   EB05                   jmp     004EA9DE
004EA9D9   33C0                   xor     eax, eax
004EA9DB   8945F0                 mov     [ebp-$10], eax
004EA9DE   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EA9E5   0F85F9020000           jnz     004EACE4
004EA9EB   33C0                   xor     eax, eax
004EA9ED   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EA9F2   83F832                 cmp     eax, +$32
004EA9F5   7F61                   jnle    004EAA58
004EA9F7   0F8492010000           jz      004EAB8F
004EA9FD   83C0EF                 add     eax, -$11
004EAA00   83F811                 cmp     eax, +$11
004EAA03   0F8783020000           jnbe    004EAC8C
004EAA09   FF248510AA4E00         jmp     dword ptr [$4EAA10+eax*4]
004EAA10   7BAA                   jnp     004EA9BC
004EAA12   4E                     dec     esi
004EAA13   00C0                   add     al, al
004EAA15   AA                     stosb
004EAA16   4E                     dec     esi
004EAA17   007BAA                 add     [ebx-$56], bh
004EAA1A   4E                     dec     esi
004EAA1B   007BAA                 add     [ebx-$56], bh
004EAA1E   4E                     dec     esi
004EAA1F   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA26   4E                     dec     esi
004EAA27   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA2E   4E                     dec     esi
004EAA2F   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA36   4E                     dec     esi
004EAA37   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA3E   4E                     dec     esi
004EAA3F   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA46   4E                     dec     esi
004EAA47   008CAC4E008CAC         add     [esp+ebp*4+$AC8C004E], cl
004EAA4E   4E                     dec     esi
004EAA4F   0005AB4E004A           add     [$4A004EAB], al
004EAA55   AB                     stosd
004EAA56   4E                     dec     esi
004EAA57   0083E8410F84           add     [ebx+$840F41E8], al
004EAA5D   7701                   jnbe    004EAA60
004EAA5F   0000                   add     [eax], al
004EAA61   48                     dec     eax
004EAA62   0F84B2010000           jz      004EAC1A
004EAA68   48                     dec     eax
004EAA69   0F8469010000           jz      004EABD8
004EAA6F   48                     dec     eax
004EAA70   0F84DA010000           jz      004EAC50
004EAA76   E911020000             jmp     004EAC8C
004EAA7B   68FF000000             push    $000000FF
004EAA80   C645DC84               mov     byte ptr [ebp-$24], $84
004EAA84   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAA89   8845DD                 mov     [ebp-$23], al
004EAA8C   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAA91   8845DE                 mov     [ebp-$22], al
004EAA94   C645DF18               mov     byte ptr [ebp-$21], $18
004EAA98   C645E000               mov     byte ptr [ebp-$20], $00
004EAA9C   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EAAA0   C645E200               mov     byte ptr [ebp-$1E], $00
004EAAA4   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAAA9   8845E3                 mov     [ebp-$1D], al
004EAAAC   8D55DC                 lea     edx, [ebp-$24]
004EAAAF   B907000000             mov     ecx, $00000007
004EAAB4   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAAB6   E8AD83FFFF             call    004E2E68
004EAABB   E9CC010000             jmp     004EAC8C
004EAAC0   68FF000000             push    $000000FF
004EAAC5   C645DC84               mov     byte ptr [ebp-$24], $84
004EAAC9   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAACE   8845DD                 mov     [ebp-$23], al
004EAAD1   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAAD6   8845DE                 mov     [ebp-$22], al
004EAAD9   C645DF19               mov     byte ptr [ebp-$21], $19
004EAADD   C645E0DA               mov     byte ptr [ebp-$20], $DA
004EAAE1   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EAAE5   C645E200               mov     byte ptr [ebp-$1E], $00
004EAAE9   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAAEE   8845E3                 mov     [ebp-$1D], al
004EAAF1   8D55DC                 lea     edx, [ebp-$24]
004EAAF4   B907000000             mov     ecx, $00000007
004EAAF9   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAAFB   E86883FFFF             call    004E2E68
004EAB00   E987010000             jmp     004EAC8C
004EAB05   68FF000000             push    $000000FF
004EAB0A   C645DC84               mov     byte ptr [ebp-$24], $84
004EAB0E   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAB13   8845DD                 mov     [ebp-$23], al
004EAB16   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAB1B   8845DE                 mov     [ebp-$22], al
004EAB1E   C645DF18               mov     byte ptr [ebp-$21], $18
004EAB22   C645E000               mov     byte ptr [ebp-$20], $00
004EAB26   C645E1FF               mov     byte ptr [ebp-$1F], $FF
004EAB2A   C645E200               mov     byte ptr [ebp-$1E], $00
004EAB2E   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAB33   8845E3                 mov     [ebp-$1D], al
004EAB36   8D55DC                 lea     edx, [ebp-$24]
004EAB39   B907000000             mov     ecx, $00000007
004EAB3E   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAB40   E82383FFFF             call    004E2E68
004EAB45   E942010000             jmp     004EAC8C
004EAB4A   68FF000000             push    $000000FF
004EAB4F   C645DC84               mov     byte ptr [ebp-$24], $84
004EAB53   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAB58   8845DD                 mov     [ebp-$23], al
004EAB5B   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAB60   8845DE                 mov     [ebp-$22], al
004EAB63   C645DF18               mov     byte ptr [ebp-$21], $18
004EAB67   C645E000               mov     byte ptr [ebp-$20], $00
004EAB6B   C645E100               mov     byte ptr [ebp-$1F], $00
004EAB6F   C645E200               mov     byte ptr [ebp-$1E], $00
004EAB73   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAB78   8845E3                 mov     [ebp-$1D], al
004EAB7B   8D55DC                 lea     edx, [ebp-$24]
004EAB7E   B907000000             mov     ecx, $00000007
004EAB83   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAB85   E8DE82FFFF             call    004E2E68
004EAB8A   E9FD000000             jmp     004EAC8C
004EAB8F   68FF000000             push    $000000FF
004EAB94   C645D080               mov     byte ptr [ebp-$30], $80
004EAB98   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAB9D   8845D1                 mov     [ebp-$2F], al
004EABA0   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EABA5   8845D2                 mov     [ebp-$2E], al
004EABA8   C645D304               mov     byte ptr [ebp-$2D], $04
004EABAC   C645D418               mov     byte ptr [ebp-$2C], $18
004EABB0   C645D500               mov     byte ptr [ebp-$2B], $00
004EABB4   C645D680               mov     byte ptr [ebp-$2A], $80
004EABB8   C645D700               mov     byte ptr [ebp-$29], $00
004EABBC   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EABC1   8845D8                 mov     [ebp-$28], al
004EABC4   8D55D0                 lea     edx, [ebp-$30]
004EABC7   B908000000             mov     ecx, $00000008
004EABCC   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EABCE   E89582FFFF             call    004E2E68
004EABD3   E9B4000000             jmp     004EAC8C
004EABD8   68FF000000             push    $000000FF
004EABDD   C645DC84               mov     byte ptr [ebp-$24], $84
004EABE1   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EABE6   8845DD                 mov     [ebp-$23], al
004EABE9   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EABEE   8845DE                 mov     [ebp-$22], al
004EABF1   C645DF18               mov     byte ptr [ebp-$21], $18
004EABF5   C645E000               mov     byte ptr [ebp-$20], $00
004EABF9   C645E140               mov     byte ptr [ebp-$1F], $40
004EABFD   C645E200               mov     byte ptr [ebp-$1E], $00
004EAC01   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAC06   8845E3                 mov     [ebp-$1D], al
004EAC09   8D55DC                 lea     edx, [ebp-$24]
004EAC0C   B907000000             mov     ecx, $00000007
004EAC11   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAC13   E85082FFFF             call    004E2E68
004EAC18   EB72                   jmp     004EAC8C
004EAC1A   68FF000000             push    $000000FF
004EAC1F   C645C881               mov     byte ptr [ebp-$38], $81
004EAC23   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAC28   8845C9                 mov     [ebp-$37], al
004EAC2B   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAC30   8845CA                 mov     [ebp-$36], al
004EAC33   C645CB13               mov     byte ptr [ebp-$35], $13
004EAC37   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAC3C   8845CC                 mov     [ebp-$34], al
004EAC3F   8D55C8                 lea     edx, [ebp-$38]
004EAC42   B904000000             mov     ecx, $00000004
004EAC47   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAC49   E81A82FFFF             call    004E2E68
004EAC4E   EB3C                   jmp     004EAC8C
004EAC50   68FF000000             push    $000000FF
004EAC55   C645C083               mov     byte ptr [ebp-$40], $83
004EAC59   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EAC5E   8845C1                 mov     [ebp-$3F], al
004EAC61   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EAC66   8845C2                 mov     [ebp-$3E], al
004EAC69   C645C313               mov     byte ptr [ebp-$3D], $13
004EAC6D   C645C440               mov     byte ptr [ebp-$3C], $40
004EAC71   C645C500               mov     byte ptr [ebp-$3B], $00
004EAC75   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EAC7A   8845C6                 mov     [ebp-$3A], al
004EAC7D   8D55C0                 lea     edx, [ebp-$40]
004EAC80   B906000000             mov     ecx, $00000006
004EAC85   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EAC87   E8DC81FFFF             call    004E2E68

* Reference to Application
|
004EAC8C   8B55F0                 mov     edx, [ebp-$10]
004EAC8F   83C240                 add     edx, +$40
004EAC92   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAC97   E89C87F1FF             call    00403438

|
004EAC9C   E8137CF1FF             call    004028B4
004EACA1   68CC6D4F00             push    $004F6DCC
004EACA6   B940000000             mov     ecx, $00000040
004EACAB   2B4DF0                 sub     ecx, dword ptr [ebp-$10]
004EACAE   BAF86D4F00             mov     edx, $004F6DF8
004EACB3   B8006F4F00             mov     eax, $004F6F00

|
004EACB8   E89383F1FF             call    00403050

|
004EACBD   E8F27BF1FF             call    004028B4
004EACC2   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004EACC7   E8B485F1FF             call    00403280

|
004EACCC   E8E37BF1FF             call    004028B4
004EACD1   8BD0                   mov     edx, eax
004EACD3   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EACD8   E85B87F1FF             call    00403438

|
004EACDD   E8D27BF1FF             call    004028B4
004EACE2   EB46                   jmp     004EAD2A
004EACE4   BA01000000             mov     edx, $00000001
004EACE9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004EACEE   E81D87F1FF             call    00403410

|
004EACF3   E8BC7BF1FF             call    004028B4
004EACF8   BA40000000             mov     edx, $00000040
004EACFD   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EAD02   E83187F1FF             call    00403438

|
004EAD07   E8A87BF1FF             call    004028B4
004EAD0C   68CC6D4F00             push    $004F6DCC
004EAD11   BAF86D4F00             mov     edx, $004F6DF8
004EAD16   B940000000             mov     ecx, $00000040
004EAD1B   B8006F4F00             mov     eax, $004F6F00

|
004EAD20   E80B83F1FF             call    00403030

|
004EAD25   E88A7BF1FF             call    004028B4
004EAD2A   8A15F86D4F00           mov     dl, byte ptr [$004F6DF8]
004EAD30   8BCA                   mov     ecx, edx
004EAD32   80E10F                 and     cl, $0F
004EAD35   8BF1                   mov     esi, ecx
004EAD37   81E6FF000000           and     esi, $000000FF
004EAD3D   8A8EFF6D4F00           mov     cl, byte ptr [esi+$4F6DFF]
004EAD43   A0FB6D4F00             mov     al, byte ptr [$004F6DFB]
004EAD48   8BD8                   mov     ebx, eax
004EAD4A   80CB40                 or      bl, $40
004EAD4D   3ACB                   cmp     cl, bl
004EAD4F   7419                   jz      004EAD6A
004EAD51   8A0DFC6D4F00           mov     cl, byte ptr [$004F6DFC]
004EAD57   80C940                 or      cl, $40
004EAD5A   33DB                   xor     ebx, ebx
004EAD5C   8AD8                   mov     bl, al
004EAD5E   3A8B016E4F00           cmp     cl, byte ptr [ebx+$4F6E01]
004EAD64   0F851D030000           jnz     004EB087
004EAD6A   80FA80                 cmp     dl, $80
004EAD6D   760D                   jbe     004EAD7C
004EAD6F   33C0                   xor     eax, eax
004EAD71   8A86006E4F00           mov     al, byte ptr [esi+$4F6E00]
004EAD77   8945EC                 mov     [ebp-$14], eax
004EAD7A   EB0F                   jmp     004EAD8B
004EAD7C   25FF000000             and     eax, $000000FF
004EAD81   0FB680026E4F00         movzx   eax, byte ptr [eax+$4F6E02]
004EAD88   8945EC                 mov     [ebp-$14], eax
004EAD8B   837DEC00               cmp     dword ptr [ebp-$14], +$00
004EAD8F   0F8EC6020000           jle     004EB05B

* Reference to Application
|
004EAD95   8B45EC                 mov     eax, [ebp-$14]
004EAD98   85C0                   test    eax, eax
004EAD9A   0F8E8E020000           jle     004EB02E
004EADA0   8945E4                 mov     [ebp-$1C], eax
004EADA3   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004EADAA   837DF801               cmp     dword ptr [ebp-$08], +$01
004EADAE   7E12                   jle     004EADC2
004EADB0   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to field Application.OFFS_024C
|
004EADB6   8B904C020000           mov     edx, [eax+$024C]
004EADBC   42                     inc     edx

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EADBD   E87E17FAFF             call    0048C540
004EADC2   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004EADC9   751D                   jnz     004EADE8
004EADCB   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EADD0   240F                   and     al, $0F
004EADD2   25FF000000             and     eax, $000000FF
004EADD7   83C009                 add     eax, +$09
004EADDA   8B55F8                 mov     edx, [ebp-$08]
004EADDD   4A                     dec     edx
004EADDE   C1E202                 shl     edx, $02
004EADE1   03C2                   add     eax, edx
004EADE3   8945F4                 mov     [ebp-$0C], eax
004EADE6   EB65                   jmp     004EAE4D
004EADE8   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EADED   2C42                   sub     al, $42
004EADEF   7404                   jz      004EADF5
004EADF1   2C02                   sub     al, $02
004EADF3   751C                   jnz     004EAE11
004EADF5   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EADFA   240F                   and     al, $0F
004EADFC   25FF000000             and     eax, $000000FF
004EAE01   83C009                 add     eax, +$09
004EAE04   8B55F8                 mov     edx, [ebp-$08]
004EAE07   4A                     dec     edx
004EAE08   03D2                   add     edx, edx
004EAE0A   03C2                   add     eax, edx
004EAE0C   8945F4                 mov     [ebp-$0C], eax
004EAE0F   EB3C                   jmp     004EAE4D
004EAE11   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EAE18   7518                   jnz     004EAE32
004EAE1A   33C0                   xor     eax, eax
004EAE1C   A0FB6D4F00             mov     al, byte ptr [$004F6DFB]
004EAE21   83C00B                 add     eax, +$0B
004EAE24   8B55F8                 mov     edx, [ebp-$08]
004EAE27   4A                     dec     edx
004EAE28   8D1452                 lea     edx, [edx+edx*2]
004EAE2B   03C2                   add     eax, edx
004EAE2D   8945F4                 mov     [ebp-$0C], eax
004EAE30   EB1B                   jmp     004EAE4D
004EAE32   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EAE37   240F                   and     al, $0F
004EAE39   25FF000000             and     eax, $000000FF
004EAE3E   83C009                 add     eax, +$09
004EAE41   8B55F8                 mov     edx, [ebp-$08]
004EAE44   4A                     dec     edx
004EAE45   8D1452                 lea     edx, [edx+edx*2]
004EAE48   03C2                   add     eax, edx
004EAE4A   8945F4                 mov     [ebp-$0C], eax
004EAE4D   8B45F4                 mov     eax, [ebp-$0C]
004EAE50   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EAE56   24C0                   and     al, $C0
004EAE58   2C01                   sub     al, $01
004EAE5A   720E                   jb      004EAE6A
004EAE5C   2C3F                   sub     al, $3F
004EAE5E   7419                   jz      004EAE79
004EAE60   2C40                   sub     al, $40
004EAE62   7424                   jz      004EAE88
004EAE64   2C40                   sub     al, $40
004EAE66   742F                   jz      004EAE97
004EAE68   EB3A                   jmp     004EAEA4
004EAE6A   8D45E8                 lea     eax, [ebp-$18]
004EAE6D   BA3CB64E00             mov     edx, $004EB63C

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAE72   E84D9CF1FF             call    00404AC4
004EAE77   EB2B                   jmp     004EAEA4
004EAE79   8D45E8                 lea     eax, [ebp-$18]
004EAE7C   BA48B64E00             mov     edx, $004EB648

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAE81   E83E9CF1FF             call    00404AC4
004EAE86   EB1C                   jmp     004EAEA4
004EAE88   8D45E8                 lea     eax, [ebp-$18]
004EAE8B   BA54B64E00             mov     edx, $004EB654

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAE90   E82F9CF1FF             call    00404AC4
004EAE95   EB0D                   jmp     004EAEA4
004EAE97   8D45E8                 lea     eax, [ebp-$18]
004EAE9A   BA60B64E00             mov     edx, $004EB660

* Reference to: System.@LStrLAsg(void;void;void;void);
|
004EAE9F   E8209CF1FF             call    00404AC4
004EAEA4   FF75E8                 push    dword ptr [ebp-$18]
004EAEA7   8B45F4                 mov     eax, [ebp-$0C]
004EAEAA   8A80F86D4F00           mov     al, byte ptr [eax+$4F6DF8]
004EAEB0   243F                   and     al, $3F
004EAEB2   25FF000000             and     eax, $000000FF
004EAEB7   8D4DBC                 lea     ecx, [ebp-$44]
004EAEBA   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EAEBF   E810E3F1FF             call    004091D4
004EAEC4   FF75BC                 push    dword ptr [ebp-$44]
004EAEC7   8D4DB8                 lea     ecx, [ebp-$48]
004EAECA   8B45F4                 mov     eax, [ebp-$0C]
004EAECD   0FB680F96D4F00         movzx   eax, byte ptr [eax+$4F6DF9]
004EAED4   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004EAED9   E8F6E2F1FF             call    004091D4
004EAEDE   FF75B8                 push    dword ptr [ebp-$48]
004EAEE1   8D45E8                 lea     eax, [ebp-$18]
004EAEE4   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004EAEE9   E8BE9EF1FF             call    00404DAC
004EAEEE   8D45B4                 lea     eax, [ebp-$4C]
004EAEF1   8B4DE8                 mov     ecx, [ebp-$18]
004EAEF4   BA6CB64E00             mov     edx, $004EB66C

* Reference to: System.@LStrCat3;
|
004EAEF9   E83A9EF1FF             call    00404D38
004EAEFE   8B45B4                 mov     eax, [ebp-$4C]
004EAF01   50                     push    eax
004EAF02   8B87B0030000           mov     eax, [edi+$03B0]
004EAF08   8B4DF8                 mov     ecx, [ebp-$08]
004EAF0B   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAF0D   E8AA37FAFF             call    0048E6BC
004EAF12   BE01000000             mov     esi, $00000001
004EAF17   EB01                   jmp     004EAF1A
004EAF19   46                     inc     esi
004EAF1A   8D1C76                 lea     ebx, [esi+esi*2]
004EAF1D   A1D45D4F00             mov     eax, dword ptr [$004F5DD4]
004EAF22   8B4C98F8               mov     ecx, [eax+ebx*4-$08]
004EAF26   A1D45D4F00             mov     eax, dword ptr [$004F5DD4]
004EAF2B   8B5498F4               mov     edx, [eax+ebx*4-$0C]
004EAF2F   8D45B0                 lea     eax, [ebp-$50]

* Reference to: System.@LStrCat3;
|
004EAF32   E8019EF1FF             call    00404D38
004EAF37   8B45B0                 mov     eax, [ebp-$50]
004EAF3A   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EAF3D   E8F69EF1FF             call    00404E38
004EAF42   7408                   jz      004EAF4C
004EAF44   81FE43010000           cmp     esi, $00000143
004EAF4A   7CCD                   jl      004EAF19
004EAF4C   8D1C76                 lea     ebx, [esi+esi*2]
004EAF4F   A1D45D4F00             mov     eax, dword ptr [$004F5DD4]
004EAF54   8B4C98F8               mov     ecx, [eax+ebx*4-$08]
004EAF58   A1D45D4F00             mov     eax, dword ptr [$004F5DD4]
004EAF5D   8B5498F4               mov     edx, [eax+ebx*4-$0C]
004EAF61   8D45AC                 lea     eax, [ebp-$54]

* Reference to: System.@LStrCat3;
|
004EAF64   E8CF9DF1FF             call    00404D38
004EAF69   8B45AC                 mov     eax, [ebp-$54]
004EAF6C   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EAF6F   E8C49EF1FF             call    00404E38
004EAF74   752F                   jnz     004EAFA5
004EAF76   A1D45D4F00             mov     eax, dword ptr [$004F5DD4]
004EAF7B   8B4C98FC               mov     ecx, [eax+ebx*4-$04]
004EAF7F   8D45A8                 lea     eax, [ebp-$58]
004EAF82   BA6CB64E00             mov     edx, $004EB66C

* Reference to: System.@LStrCat3;
|
004EAF87   E8AC9DF1FF             call    00404D38
004EAF8C   8B45A8                 mov     eax, [ebp-$58]
004EAF8F   50                     push    eax
004EAF90   8B87B0030000           mov     eax, [edi+$03B0]
004EAF96   8B4DF8                 mov     ecx, [ebp-$08]
004EAF99   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAF9E   E81937FAFF             call    0048E6BC
004EAFA3   EB18                   jmp     004EAFBD

* Possible String Reference to: ' Описание ошибки не найдено'
|
004EAFA5   6878B64E00             push    $004EB678
004EAFAA   8B87B0030000           mov     eax, [edi+$03B0]
004EAFB0   8B4DF8                 mov     ecx, [ebp-$08]
004EAFB3   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAFB8   E8FF36FAFF             call    0048E6BC
004EAFBD   8B45F4                 mov     eax, [ebp-$0C]
004EAFC0   8A80FA6D4F00           mov     al, byte ptr [eax+$4F6DFA]
004EAFC6   2460                   and     al, $60
004EAFC8   2C20                   sub     al, $20
004EAFCA   740A                   jz      004EAFD6
004EAFCC   2C20                   sub     al, $20
004EAFCE   7420                   jz      004EAFF0
004EAFD0   2C20                   sub     al, $20
004EAFD2   7436                   jz      004EB00A
004EAFD4   EB4C                   jmp     004EB022

* Possible String Reference to: ' Сохр.'
|
004EAFD6   689CB64E00             push    $004EB69C
004EAFDB   8B87B0030000           mov     eax, [edi+$03B0]
004EAFE1   8B4DF8                 mov     ecx, [ebp-$08]
004EAFE4   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EAFE9   E8CE36FAFF             call    0048E6BC
004EAFEE   EB32                   jmp     004EB022

* Possible String Reference to: ' Текущая'
|
004EAFF0   68ACB64E00             push    $004EB6AC
004EAFF5   8B87B0030000           mov     eax, [edi+$03B0]
004EAFFB   8B4DF8                 mov     ecx, [ebp-$08]
004EAFFE   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB003   E8B436FAFF             call    0048E6BC
004EB008   EB18                   jmp     004EB022

* Possible String Reference to: ' Непост.'
|
004EB00A   68C0B64E00             push    $004EB6C0
004EB00F   8B87B0030000           mov     eax, [edi+$03B0]
004EB015   8B4DF8                 mov     ecx, [ebp-$08]
004EB018   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB01D   E89A36FAFF             call    0048E6BC
004EB022   FF45F8                 inc     dword ptr [ebp-$08]
004EB025   FF4DE4                 dec     dword ptr [ebp-$1C]
004EB028   0F857CFDFFFF           jnz     004EADAA
004EB02E   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EB035   7512                   jnz     004EB049
004EB037   8B877C030000           mov     eax, [edi+$037C]
004EB03D   B201                   mov     dl, $01
004EB03F   8B08                   mov     ecx, [eax]
004EB041   FF5164                 call    dword ptr [ecx+$64]
004EB044   E9AA050000             jmp     004EB5F3
004EB049   8B877C030000           mov     eax, [edi+$037C]
004EB04F   33D2                   xor     edx, edx
004EB051   8B08                   mov     ecx, [eax]
004EB053   FF5164                 call    dword ptr [ecx+$64]
004EB056   E998050000             jmp     004EB5F3

* Possible String Reference to: ' Ошибок нет'
|
004EB05B   68D4B64E00             push    $004EB6D4
004EB060   8B87B0030000           mov     eax, [edi+$03B0]
004EB066   B901000000             mov     ecx, $00000001
004EB06B   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB070   E84736FAFF             call    0048E6BC
004EB075   8B877C030000           mov     eax, [edi+$037C]
004EB07B   33D2                   xor     edx, edx
004EB07D   8B08                   mov     ecx, [eax]
004EB07F   FF5164                 call    dword ptr [ecx+$64]
004EB082   E96C050000             jmp     004EB5F3
004EB087   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB089   E8F6E6FFFF             call    004E9784
004EB08E   E960050000             jmp     004EB5F3
004EB093   803D1B724F0001         cmp     byte ptr [$004F721B], $01
004EB09A   7509                   jnz     004EB0A5
004EB09C   C745F080000000         mov     dword ptr [ebp-$10], $00000080
004EB0A3   EB05                   jmp     004EB0AA
004EB0A5   33C0                   xor     eax, eax
004EB0A7   8945F0                 mov     [ebp-$10], eax
004EB0AA   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EB0B1   0F85D3020000           jnz     004EB38A
004EB0B7   33DB                   xor     ebx, ebx
004EB0B9   43                     inc     ebx
004EB0BA   83FB05                 cmp     ebx, +$05
004EB0BD   7E0C                   jle     004EB0CB
004EB0BF   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB0C1   E8BEE6FFFF             call    004E9784
004EB0C6   E928050000             jmp     004EB5F3
004EB0CB   33C0                   xor     eax, eax
004EB0CD   8945F8                 mov     [ebp-$08], eax
004EB0D0   BAF86D4F00             mov     edx, $004F6DF8
004EB0D5   C60200                 mov     byte ptr [edx], $00
004EB0D8   FF45F8                 inc     dword ptr [ebp-$08]
004EB0DB   42                     inc     edx
004EB0DC   817DF800010000         cmp     dword ptr [ebp-$08], $00000100
004EB0E3   75F0                   jnz     004EB0D5
004EB0E5   6A0F                   push    $0F
004EB0E7   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB0EC   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004EB0ED   E8F6BFF1FF             call    004070E8
004EB0F2   33F6                   xor     esi, esi
004EB0F4   EB1F                   jmp     004EB115
004EB0F6   6A00                   push    $00
004EB0F8   68A06D4F00             push    $004F6DA0
004EB0FD   6A01                   push    $01
004EB0FF   68F86D4F00             push    $004F6DF8
004EB104   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB109   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB10A   E8E1BFF1FF             call    004070F0
004EB10F   46                     inc     esi
004EB110   83FE64                 cmp     esi, +$64
004EB113   7FA4                   jnle    004EB0B9
004EB115   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EB11A   2C06                   sub     al, $06
004EB11C   7408                   jz      004EB126
004EB11E   2C08                   sub     al, $08
004EB120   7404                   jz      004EB126
004EB122   2C02                   sub     al, $02
004EB124   75D0                   jnz     004EB0F6
004EB126   33C0                   xor     eax, eax
004EB128   A0F86D4F00             mov     al, byte ptr [$004F6DF8]
004EB12D   8945F8                 mov     [ebp-$08], eax
004EB130   6A00                   push    $00
004EB132   68A06D4F00             push    $004F6DA0
004EB137   6A01                   push    $01
004EB139   68F86D4F00             push    $004F6DF8
004EB13E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB143   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB144   E8A7BFF1FF             call    004070F0
004EB149   837DF810               cmp     dword ptr [ebp-$08], +$10
004EB14D   7509                   jnz     004EB158
004EB14F   803DF86D4F00A1         cmp     byte ptr [$004F6DF8], $A1
004EB156   75BD                   jnz     004EB115
004EB158   837DF806               cmp     dword ptr [ebp-$08], +$06
004EB15C   7509                   jnz     004EB167
004EB15E   803DF86D4F00F0         cmp     byte ptr [$004F6DF8], $F0
004EB165   75AE                   jnz     004EB115
004EB167   837DF80E               cmp     dword ptr [ebp-$08], +$0E
004EB16B   7509                   jnz     004EB176
004EB16D   803DF86D4F00A0         cmp     byte ptr [$004F6DF8], $A0
004EB174   759F                   jnz     004EB115
004EB176   6A00                   push    $00
004EB178   68A06D4F00             push    $004F6DA0
004EB17D   8B45F8                 mov     eax, [ebp-$08]
004EB180   50                     push    eax
004EB181   68F86D4F00             push    $004F6DF8
004EB186   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB18B   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB18C   E85FBFF1FF             call    004070F0
004EB191   83FB03                 cmp     ebx, +$03
004EB194   7D15                   jnl     004EB1AB
004EB196   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EB198   E8B77AFAFF             call    00492C54
004EB19D   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EB19F   E8D831F2FF             call    0040E37C
004EB1A4   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EB1A6   E8B17AFAFF             call    00492C5C
004EB1AB   6A04                   push    $04
004EB1AD   C645A402               mov     byte ptr [ebp-$5C], $02
004EB1B1   C645A511               mov     byte ptr [ebp-$5B], $11
004EB1B5   C645A600               mov     byte ptr [ebp-$5A], $00
004EB1B9   C645A713               mov     byte ptr [ebp-$59], $13
004EB1BD   8D55A4                 lea     edx, [ebp-$5C]
004EB1C0   B903000000             mov     ecx, $00000003
004EB1C5   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB1C7   E89C7CFFFF             call    004E2E68
004EB1CC   8B55F0                 mov     edx, [ebp-$10]
004EB1CF   83C240                 add     edx, +$40
004EB1D2   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB1D7   E85C82F1FF             call    00403438

|
004EB1DC   E8D376F1FF             call    004028B4
004EB1E1   68CC6D4F00             push    $004F6DCC
004EB1E6   BAF86D4F00             mov     edx, $004F6DF8
004EB1EB   B910000000             mov     ecx, $00000010
004EB1F0   B8006F4F00             mov     eax, $004F6F00

|
004EB1F5   E8567EF1FF             call    00403050

|
004EB1FA   E8B576F1FF             call    004028B4
004EB1FF   33F6                   xor     esi, esi
004EB201   EB23                   jmp     004EB226
004EB203   6A00                   push    $00
004EB205   68A06D4F00             push    $004F6DA0
004EB20A   6A01                   push    $01
004EB20C   68F86D4F00             push    $004F6DF8
004EB211   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB216   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB217   E8D4BEF1FF             call    004070F0
004EB21C   46                     inc     esi
004EB21D   83FE64                 cmp     esi, +$64
004EB220   0F8F93FEFFFF           jnle    004EB0B9
004EB226   803DF86D4F0010         cmp     byte ptr [$004F6DF8], $10
004EB22D   75D4                   jnz     004EB203
004EB22F   8B55F0                 mov     edx, [ebp-$10]
004EB232   83C250                 add     edx, +$50
004EB235   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB23A   E8F981F1FF             call    00403438

|
004EB23F   E87076F1FF             call    004028B4
004EB244   68CC6D4F00             push    $004F6DCC
004EB249   BAF86D4F00             mov     edx, $004F6DF8
004EB24E   B901000000             mov     ecx, $00000001
004EB253   B8006F4F00             mov     eax, $004F6F00

|
004EB258   E8F37DF1FF             call    00403050

|
004EB25D   E85276F1FF             call    004028B4
004EB262   6A00                   push    $00
004EB264   68A06D4F00             push    $004F6DA0
004EB269   6A01                   push    $01
004EB26B   68F86D4F00             push    $004F6DF8
004EB270   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB275   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB276   E875BEF1FF             call    004070F0
004EB27B   803DF86D4F00A1         cmp     byte ptr [$004F6DF8], $A1
004EB282   75A2                   jnz     004EB226
004EB284   8B55F0                 mov     edx, [ebp-$10]
004EB287   83C251                 add     edx, +$51
004EB28A   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB28F   E8A481F1FF             call    00403438

|
004EB294   E81B76F1FF             call    004028B4
004EB299   68CC6D4F00             push    $004F6DCC
004EB29E   BAF86D4F00             mov     edx, $004F6DF8
004EB2A3   B901000000             mov     ecx, $00000001
004EB2A8   B8006F4F00             mov     eax, $004F6F00

|
004EB2AD   E89E7DF1FF             call    00403050

|
004EB2B2   E8FD75F1FF             call    004028B4
004EB2B7   6A00                   push    $00
004EB2B9   68A06D4F00             push    $004F6DA0
004EB2BE   6A01                   push    $01
004EB2C0   68F86D4F00             push    $004F6DF8
004EB2C5   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB2CA   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB2CB   E820BEF1FF             call    004070F0
004EB2D0   803DF86D4F0004         cmp     byte ptr [$004F6DF8], $04
004EB2D7   0F8549FFFFFF           jnz     004EB226
004EB2DD   8B55F0                 mov     edx, [ebp-$10]
004EB2E0   83C252                 add     edx, +$52
004EB2E3   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB2E8   E84B81F1FF             call    00403438

|
004EB2ED   E8C275F1FF             call    004028B4
004EB2F2   68CC6D4F00             push    $004F6DCC
004EB2F7   BAF86D4F00             mov     edx, $004F6DF8
004EB2FC   B901000000             mov     ecx, $00000001
004EB301   B8006F4F00             mov     eax, $004F6F00

|
004EB306   E8457DF1FF             call    00403050

|
004EB30B   E8A475F1FF             call    004028B4
004EB310   6A00                   push    $00
004EB312   68A06D4F00             push    $004F6DA0
004EB317   6A0F                   push    $0F
004EB319   68F86D4F00             push    $004F6DF8
004EB31E   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB323   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB324   E8C7BDF1FF             call    004070F0
004EB329   68CC6D4F00             push    $004F6DCC
004EB32E   BAF86D4F00             mov     edx, $004F6DF8
004EB333   B92D000000             mov     ecx, $0000002D
004EB338   B8006F4F00             mov     eax, $004F6F00

|
004EB33D   E80E7DF1FF             call    00403050

|
004EB342   E86D75F1FF             call    004028B4
004EB347   B8B5000000             mov     eax, $000000B5
004EB34C   33D2                   xor     edx, edx
004EB34E   8955F8                 mov     [ebp-$08], edx
004EB351   BAF86D4F00             mov     edx, $004F6DF8
004EB356   33C9                   xor     ecx, ecx
004EB358   8A0A                   mov     cl, byte ptr [edx]
004EB35A   03C1                   add     eax, ecx
004EB35C   FF45F8                 inc     dword ptr [ebp-$08]
004EB35F   42                     inc     edx
004EB360   837DF80D               cmp     dword ptr [ebp-$08], +$0D
004EB364   75F0                   jnz     004EB356
004EB366   33D2                   xor     edx, edx
004EB368   8A15056E4F00           mov     dl, byte ptr [$004F6E05]
004EB36E   C1E208                 shl     edx, $08
004EB371   33C9                   xor     ecx, ecx
004EB373   8A0D066E4F00           mov     cl, byte ptr [$004F6E06]
004EB379   03D1                   add     edx, ecx
004EB37B   3BC2                   cmp     eax, edx
004EB37D   0F8536FDFFFF           jnz     004EB0B9
004EB383   33C0                   xor     eax, eax
004EB385   8945F4                 mov     [ebp-$0C], eax
004EB388   EB07                   jmp     004EB391
004EB38A   C745F453000000         mov     dword ptr [ebp-$0C], $00000053
004EB391   33C0                   xor     eax, eax
004EB393   8945F8                 mov     [ebp-$08], eax
004EB396   33F6                   xor     esi, esi
004EB398   8B5DF4                 mov     ebx, [ebp-$0C]
004EB39B   03DE                   add     ebx, esi
004EB39D   80BBF86D4F0000         cmp     byte ptr [ebx+$4F6DF8], $00
004EB3A4   0F86A8010000           jbe     004EB552
004EB3AA   8D45A0                 lea     eax, [ebp-$60]
004EB3AD   50                     push    eax
004EB3AE   8B87B0030000           mov     eax, [edi+$03B0]
004EB3B4   B901000000             mov     ecx, $00000001
004EB3B9   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB3BE   E88932FAFF             call    0048E64C
004EB3C3   837DA000               cmp     dword ptr [ebp-$60], +$00
004EB3C7   7412                   jz      004EB3DB
004EB3C9   8B87B0030000           mov     eax, [edi+$03B0]
004EB3CF   8B904C020000           mov     edx, [eax+$024C]
004EB3D5   42                     inc     edx

* Reference to: Grids.TCustomGrid.SetRowCount(TCustomGrid;Longint);
|
004EB3D6   E86511FAFF             call    0048C540
004EB3DB   8D55E8                 lea     edx, [ebp-$18]
004EB3DE   33C0                   xor     eax, eax
004EB3E0   8A83F86D4F00           mov     al, byte ptr [ebx+$4F6DF8]

* Reference to: SysUtils.IntToStr(Integer):AnsiString;overload;
|
004EB3E6   E8D5DCF1FF             call    004090C0
004EB3EB   8D459C                 lea     eax, [ebp-$64]
004EB3EE   8B4DE8                 mov     ecx, [ebp-$18]

* Possible String Reference to: '     '
|
004EB3F1   BAE8B64E00             mov     edx, $004EB6E8

* Reference to: System.@LStrCat3;
|
004EB3F6   E83D99F1FF             call    00404D38
004EB3FB   8B459C                 mov     eax, [ebp-$64]
004EB3FE   50                     push    eax
004EB3FF   8B9FB0030000           mov     ebx, [edi+$03B0]
004EB405   8B8B4C020000           mov     ecx, [ebx+$024C]
004EB40B   49                     dec     ecx
004EB40C   8BC3                   mov     eax, ebx
004EB40E   33D2                   xor     edx, edx

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB410   E8A732FAFF             call    0048E6BC
004EB415   BB01000000             mov     ebx, $00000001
004EB41A   EB01                   jmp     004EB41D
004EB41C   43                     inc     ebx
004EB41D   8D045B                 lea     eax, [ebx+ebx*2]
004EB420   8B15D45D4F00           mov     edx, [$004F5DD4]
004EB426   8B4C82F8               mov     ecx, [edx+eax*4-$08]
004EB42A   8D045B                 lea     eax, [ebx+ebx*2]
004EB42D   8B15D45D4F00           mov     edx, [$004F5DD4]
004EB433   8B5482F4               mov     edx, [edx+eax*4-$0C]
004EB437   8D4598                 lea     eax, [ebp-$68]

* Reference to: System.@LStrCat3;
|
004EB43A   E8F998F1FF             call    00404D38
004EB43F   8B4598                 mov     eax, [ebp-$68]
004EB442   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EB445   E8EE99F1FF             call    00404E38
004EB44A   7408                   jz      004EB454
004EB44C   81FB43010000           cmp     ebx, $00000143
004EB452   7CC8                   jl      004EB41C
004EB454   8D045B                 lea     eax, [ebx+ebx*2]
004EB457   8B15D45D4F00           mov     edx, [$004F5DD4]
004EB45D   8B4C82F8               mov     ecx, [edx+eax*4-$08]
004EB461   8D045B                 lea     eax, [ebx+ebx*2]
004EB464   8B15D45D4F00           mov     edx, [$004F5DD4]
004EB46A   8B5482F4               mov     edx, [edx+eax*4-$0C]
004EB46E   8D4594                 lea     eax, [ebp-$6C]

* Reference to: System.@LStrCat3;
|
004EB471   E8C298F1FF             call    00404D38
004EB476   8B4594                 mov     eax, [ebp-$6C]
004EB479   8B55E8                 mov     edx, [ebp-$18]

* Reference to: System.@LStrCmp;
|
004EB47C   E8B799F1FF             call    00404E38
004EB481   753D                   jnz     004EB4C0
004EB483   8D045B                 lea     eax, [ebx+ebx*2]
004EB486   8B15D45D4F00           mov     edx, [$004F5DD4]
004EB48C   8B4C82FC               mov     ecx, [edx+eax*4-$04]
004EB490   8D4590                 lea     eax, [ebp-$70]
004EB493   BA6CB64E00             mov     edx, $004EB66C

* Reference to: System.@LStrCat3;
|
004EB498   E89B98F1FF             call    00404D38
004EB49D   8B4590                 mov     eax, [ebp-$70]
004EB4A0   50                     push    eax
004EB4A1   8B87B0030000           mov     eax, [edi+$03B0]
004EB4A7   8B884C020000           mov     ecx, [eax+$024C]
004EB4AD   49                     dec     ecx
004EB4AE   8B87B0030000           mov     eax, [edi+$03B0]
004EB4B4   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB4B9   E8FE31FAFF             call    0048E6BC
004EB4BE   EB1C                   jmp     004EB4DC

* Possible String Reference to: ' Описание ошибки не найдено'
|
004EB4C0   6878B64E00             push    $004EB678
004EB4C5   8B87B0030000           mov     eax, [edi+$03B0]
004EB4CB   8B884C020000           mov     ecx, [eax+$024C]
004EB4D1   49                     dec     ecx
004EB4D2   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB4D7   E8E031FAFF             call    0048E6BC
004EB4DC   8BCE                   mov     ecx, esi
004EB4DE   03C9                   add     ecx, ecx
004EB4E0   8B45F4                 mov     eax, [ebp-$0C]
004EB4E3   0FB680FC6D4F00         movzx   eax, byte ptr [eax+$4F6DFC]
004EB4EA   D3E8                   shr     eax, cl
004EB4EC   83E003                 and     eax, +$03
004EB4EF   48                     dec     eax
004EB4F0   7408                   jz      004EB4FA
004EB4F2   48                     dec     eax
004EB4F3   7423                   jz      004EB518
004EB4F5   48                     dec     eax
004EB4F6   743E                   jz      004EB536
004EB4F8   EB58                   jmp     004EB552

* Possible String Reference to: ' Сохр.'
|
004EB4FA   689CB64E00             push    $004EB69C
004EB4FF   8B87B0030000           mov     eax, [edi+$03B0]
004EB505   8B884C020000           mov     ecx, [eax+$024C]
004EB50B   49                     dec     ecx
004EB50C   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB511   E8A631FAFF             call    0048E6BC
004EB516   EB3A                   jmp     004EB552

* Possible String Reference to: ' Непост.'
|
004EB518   68C0B64E00             push    $004EB6C0
004EB51D   8B87B0030000           mov     eax, [edi+$03B0]
004EB523   8B884C020000           mov     ecx, [eax+$024C]
004EB529   49                     dec     ecx
004EB52A   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB52F   E88831FAFF             call    0048E6BC
004EB534   EB1C                   jmp     004EB552

* Possible String Reference to: ' Текущая'
|
004EB536   68ACB64E00             push    $004EB6AC
004EB53B   8B87B0030000           mov     eax, [edi+$03B0]
004EB541   8B884C020000           mov     ecx, [eax+$024C]
004EB547   49                     dec     ecx
004EB548   BA01000000             mov     edx, $00000001

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB54D   E86A31FAFF             call    0048E6BC
004EB552   46                     inc     esi
004EB553   83FE04                 cmp     esi, +$04
004EB556   0F853CFEFFFF           jnz     004EB398
004EB55C   8345F405               add     dword ptr [ebp-$0C], +$05
004EB560   FF45F8                 inc     dword ptr [ebp-$08]
004EB563   837DF802               cmp     dword ptr [ebp-$08], +$02
004EB567   0F8529FEFFFF           jnz     004EB396
004EB56D   8D458C                 lea     eax, [ebp-$74]
004EB570   50                     push    eax
004EB571   8B87B0030000           mov     eax, [edi+$03B0]
004EB577   B901000000             mov     ecx, $00000001
004EB57C   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB581   E8C630FAFF             call    0048E64C
004EB586   837D8C00               cmp     dword ptr [ebp-$74], +$00
004EB58A   751A                   jnz     004EB5A6

* Possible String Reference to: ' Ошибок нет'
|
004EB58C   68D4B64E00             push    $004EB6D4
004EB591   8B87B0030000           mov     eax, [edi+$03B0]
004EB597   B901000000             mov     ecx, $00000001
004EB59C   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.SetCells(TStringGrid;Integer;Integer;AnsiString);
|
004EB5A1   E81631FAFF             call    0048E6BC
004EB5A6   8D4588                 lea     eax, [ebp-$78]
004EB5A9   50                     push    eax
004EB5AA   8B87B0030000           mov     eax, [edi+$03B0]
004EB5B0   B901000000             mov     ecx, $00000001
004EB5B5   BA02000000             mov     edx, $00000002

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EB5BA   E88D30FAFF             call    0048E64C
004EB5BF   8B4588                 mov     eax, [ebp-$78]

* Possible String Reference to: ' Ошибок нет'
|
004EB5C2   BAD4B64E00             mov     edx, $004EB6D4

* Reference to: System.@LStrCmp;
|
004EB5C7   E86C98F1FF             call    00404E38
004EB5CC   7409                   jz      004EB5D7
004EB5CE   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004EB5D5   750F                   jnz     004EB5E6
004EB5D7   8B877C030000           mov     eax, [edi+$037C]
004EB5DD   33D2                   xor     edx, edx
004EB5DF   8B08                   mov     ecx, [eax]
004EB5E1   FF5164                 call    dword ptr [ecx+$64]
004EB5E4   EB0D                   jmp     004EB5F3
004EB5E6   8B877C030000           mov     eax, [edi+$037C]
004EB5EC   B201                   mov     dl, $01
004EB5EE   8B08                   mov     ecx, [eax]
004EB5F0   FF5164                 call    dword ptr [ecx+$64]
004EB5F3   33C0                   xor     eax, eax
004EB5F5   5A                     pop     edx
004EB5F6   59                     pop     ecx
004EB5F7   59                     pop     ecx
004EB5F8   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[‹е]Г'
|
004EB5FB   682AB64E00             push    $004EB62A
004EB600   8D4588                 lea     eax, [ebp-$78]
004EB603   BA07000000             mov     edx, $00000007

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EB608   E84394F1FF             call    00404A50
004EB60D   8D45A8                 lea     eax, [ebp-$58]
004EB610   BA06000000             mov     edx, $00000006

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EB615   E83694F1FF             call    00404A50
004EB61A   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004EB61D   E80A94F1FF             call    00404A2C
004EB622   C3                     ret


* Reference to: System.@HandleFinally;
|
004EB623   E9848DF1FF             jmp     004043AC
004EB628   EBD6                   jmp     004EB600

****** END
|
004EB62A   5F                     pop     edi
004EB62B   5E                     pop     esi
004EB62C   5B                     pop     ebx
004EB62D   8BE5                   mov     esp, ebp
004EB62F   5D                     pop     ebp
004EB630   C3                     ret

*)
end;

procedure TForm1.MenuItem_SaveClick(Sender : TObject);
begin
(*
004EBC7C   55                     push    ebp
004EBC7D   8BEC                   mov     ebp, esp
004EBC7F   33C9                   xor     ecx, ecx
004EBC81   51                     push    ecx
004EBC82   51                     push    ecx
004EBC83   51                     push    ecx
004EBC84   51                     push    ecx
004EBC85   53                     push    ebx
004EBC86   8BD8                   mov     ebx, eax
004EBC88   33C0                   xor     eax, eax
004EBC8A   55                     push    ebp

* Possible String Reference to: 'йJ†сялЫ[‹е]Г'
|
004EBC8B   685DBD4E00             push    $004EBD5D

***** TRY
|
004EBC90   64FF30                 push    dword ptr fs:[eax]
004EBC93   648920                 mov     fs:[eax], esp

* Reference to: SysUtils.Now:TDateTime;
|
004EBC96   E8BDF2F1FF             call    0040AF58
004EBC9B   83C4F8                 add     esp, -$08
004EBC9E   DD1C24                 fstp    qword ptr [esp]
004EBCA1   9B                     wait
004EBCA2   8D55FC                 lea     edx, [ebp-$04]

* Possible String Reference to: 'yymmddhhnn'
|
004EBCA5   B874BD4E00             mov     eax, $004EBD74

|
004EBCAA   E825FFF1FF             call    0040BBD4
004EBCAF   FF75FC                 push    dword ptr [ebp-$04]
004EBCB2   6888BD4E00             push    $004EBD88
004EBCB7   8D4DF8                 lea     ecx, [ebp-$08]
004EBCBA   8A15A56D4F00           mov     dl, byte ptr [$004F6DA5]
004EBCC0   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004EBCC2   E82D73FFFF             call    004E2FF4
004EBCC7   FF75F8                 push    dword ptr [ebp-$08]

* Possible String Reference to: '.cedat'
|
004EBCCA   6894BD4E00             push    $004EBD94

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBCCF   8B8338030000           mov     eax, [ebx+$0338]
004EBCD5   83C078                 add     eax, +$78
004EBCD8   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004EBCDD   E8CA90F1FF             call    00404DAC

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBCE2   8B8338030000           mov     eax, [ebx+$0338]
004EBCE8   8B10                   mov     edx, [eax]

* Reference to method TSaveDialog.Execute()
|
004EBCEA   FF523C                 call    dword ptr [edx+$3C]
004EBCED   84C0                   test    al, al
004EBCEF   7441                   jz      004EBD32
004EBCF1   6A00                   push    $00
004EBCF3   8D55F4                 lea     edx, [ebp-$0C]

* Reference to control TForm1.SaveDialog : TSaveDialog
|
004EBCF6   8B8338030000           mov     eax, [ebx+$0338]

* Reference to: Dialogs.TOpenDialog.GetFileName(TOpenDialog):TFileName;
|
004EBCFC   E8E364F4FF             call    004321E4
004EBD01   8B45F4                 mov     eax, [ebp-$0C]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EBD04   E8E391F1FF             call    00404EEC
004EBD09   50                     push    eax
004EBD0A   8D45F0                 lea     eax, [ebp-$10]

* Possible String Reference to: 'temp.tmp'
|
004EBD0D   B9A4BD4E00             mov     ecx, $004EBDA4
004EBD12   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EBD18   E81B90F1FF             call    00404D38
004EBD1D   8B45F0                 mov     eax, [ebp-$10]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004EBD20   E8C791F1FF             call    00404EEC
004EBD25   50                     push    eax

* Reference to: kernel32.CopyFileA()
|
004EBD26   E8ADB1F1FF             call    00406ED8
004EBD2B   C60519724F0001         mov     byte ptr [$004F7219], $01
004EBD32   33C0                   xor     eax, eax
004EBD34   5A                     pop     edx
004EBD35   59                     pop     ecx
004EBD36   59                     pop     ecx
004EBD37   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[‹е]Г'
|
004EBD3A   6864BD4E00             push    $004EBD64
004EBD3F   8D45F0                 lea     eax, [ebp-$10]

* Reference to: System.@LStrClr(void;void);
|
004EBD42   E8E58CF1FF             call    00404A2C
004EBD47   8D45F4                 lea     eax, [ebp-$0C]

* Reference to: System.@LStrClr(void;void);
|
004EBD4A   E8DD8CF1FF             call    00404A2C
004EBD4F   8D45F8                 lea     eax, [ebp-$08]
004EBD52   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EBD57   E8F48CF1FF             call    00404A50
004EBD5C   C3                     ret


* Reference to: System.@HandleFinally;
|
004EBD5D   E94A86F1FF             jmp     004043AC
004EBD62   EBDB                   jmp     004EBD3F

****** END
|
004EBD64   5B                     pop     ebx
004EBD65   8BE5                   mov     esp, ebp
004EBD67   5D                     pop     ebp
004EBD68   C3                     ret

*)
end;

procedure TForm1.Button_ClearDTCClick(Sender : TObject);
begin
(*
004EB6F0   53                     push    ebx
004EB6F1   56                     push    esi
004EB6F2   57                     push    edi
004EB6F3   55                     push    ebp
004EB6F4   83C4E0                 add     esp, -$20
004EB6F7   8BF8                   mov     edi, eax
004EB6F9   BEF86D4F00             mov     esi, $004F6DF8
004EB6FE   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EB705   0F8454010000           jz      004EB85F
004EB70B   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004EB710   2C41                   sub     al, $41
004EB712   7406                   jz      004EB71A
004EB714   04FE                   add     al, -$02
004EB716   2C02                   sub     al, $02
004EB718   7349                   jnb     004EB763
004EB71A   68FF000000             push    $000000FF
004EB71F   C644240883             mov     byte ptr [esp+$08], $83
004EB724   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB729   88442409               mov     [esp+$09], al
004EB72D   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB732   8844240A               mov     [esp+$0A], al
004EB736   C644240B14             mov     byte ptr [esp+$0B], $14
004EB73B   C644240C40             mov     byte ptr [esp+$0C], $40
004EB740   C644240D00             mov     byte ptr [esp+$0D], $00
004EB745   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB74A   8844240E               mov     [esp+$0E], al
004EB74E   8D542408               lea     edx, [esp+$08]
004EB752   B906000000             mov     ecx, $00000006
004EB757   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB759   E80A77FFFF             call    004E2E68
004EB75E   E9E5000000             jmp     004EB848
004EB763   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004EB76A   754B                   jnz     004EB7B7
004EB76C   6A10                   push    $10
004EB76E   C644241080             mov     byte ptr [esp+$10], $80
004EB773   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB778   88442411               mov     [esp+$11], al
004EB77C   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB781   88442412               mov     [esp+$12], al
004EB785   C644241303             mov     byte ptr [esp+$13], $03
004EB78A   C644241414             mov     byte ptr [esp+$14], $14
004EB78F   C644241580             mov     byte ptr [esp+$15], $80
004EB794   C644241600             mov     byte ptr [esp+$16], $00
004EB799   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB79E   88442417               mov     [esp+$17], al
004EB7A2   8D542410               lea     edx, [esp+$10]
004EB7A6   B907000000             mov     ecx, $00000007
004EB7AB   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB7AD   E8B676FFFF             call    004E2E68
004EB7B2   E991000000             jmp     004EB848
004EB7B7   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004EB7BE   7539                   jnz     004EB7F9
004EB7C0   6A0F                   push    $0F
004EB7C2   C644241881             mov     byte ptr [esp+$18], $81
004EB7C7   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB7CC   88442419               mov     [esp+$19], al
004EB7D0   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB7D5   8844241A               mov     [esp+$1A], al
004EB7D9   C644241B14             mov     byte ptr [esp+$1B], $14
004EB7DE   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB7E3   8844241C               mov     [esp+$1C], al
004EB7E7   8D542418               lea     edx, [esp+$18]
004EB7EB   B904000000             mov     ecx, $00000004
004EB7F0   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB7F2   E87176FFFF             call    004E2E68
004EB7F7   EB4F                   jmp     004EB848
004EB7F9   6A0F                   push    $0F
004EB7FB   C644240883             mov     byte ptr [esp+$08], $83
004EB800   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EB805   88442409               mov     [esp+$09], al
004EB809   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EB80E   8844240A               mov     [esp+$0A], al
004EB812   C644240B14             mov     byte ptr [esp+$0B], $14
004EB817   C644240CFF             mov     byte ptr [esp+$0C], $FF
004EB81C   C644240D00             mov     byte ptr [esp+$0D], $00
004EB821   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EB826   8844240E               mov     [esp+$0E], al
004EB82A   8D542408               lea     edx, [esp+$08]
004EB82E   B906000000             mov     ecx, $00000006
004EB833   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB835   E82E76FFFF             call    004E2E68
004EB83A   EB0C                   jmp     004EB848

* Reference to TApplication instance
|
004EB83C   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004EB841   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EB843   E89C4FF9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EB848   E803B8F1FF             call    00407050
004EB84D   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EB853   3DD0070000             cmp     eax, $000007D0
004EB858   72E2                   jb      004EB83C
004EB85A   E956020000             jmp     004EBAB5
004EB85F   8B877C030000           mov     eax, [edi+$037C]
004EB865   33D2                   xor     edx, edx
004EB867   8B08                   mov     ecx, [eax]
004EB869   FF5164                 call    dword ptr [ecx+$64]
004EB86C   33C0                   xor     eax, eax
004EB86E   890424                 mov     [esp], eax
004EB871   FF0424                 inc     dword ptr [esp]
004EB874   833C2405               cmp     dword ptr [esp], +$05
004EB878   7E0C                   jle     004EB886
004EB87A   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB87C   E803DFFFFF             call    004E9784
004EB881   E945020000             jmp     004EBACB
004EB886   33DB                   xor     ebx, ebx
004EB888   8BC6                   mov     eax, esi
004EB88A   C60000                 mov     byte ptr [eax], $00
004EB88D   43                     inc     ebx
004EB88E   40                     inc     eax
004EB88F   81FB00010000           cmp     ebx, $00000100
004EB895   75F3                   jnz     004EB88A
004EB897   6A0F                   push    $0F
004EB899   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB89E   50                     push    eax

* Reference to: kernel32.PurgeComm()
|
004EB89F   E844B8F1FF             call    004070E8
004EB8A4   33ED                   xor     ebp, ebp
004EB8A6   EB27                   jmp     004EB8CF
004EB8A8   6A00                   push    $00
004EB8AA   68A06D4F00             push    $004F6DA0
004EB8AF   6A01                   push    $01
004EB8B1   56                     push    esi
004EB8B2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB8B7   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB8B8   E833B8F1FF             call    004070F0
004EB8BD   45                     inc     ebp
004EB8BE   83FD64                 cmp     ebp, +$64
004EB8C1   7E0C                   jle     004EB8CF
004EB8C3   8BC7                   mov     eax, edi

* Reference to : TForm1.Disconnect()
|
004EB8C5   E8BADEFFFF             call    004E9784
004EB8CA   E9FC010000             jmp     004EBACB
004EB8CF   8A06                   mov     al, byte ptr [esi]
004EB8D1   2C06                   sub     al, $06
004EB8D3   7408                   jz      004EB8DD
004EB8D5   2C08                   sub     al, $08
004EB8D7   7404                   jz      004EB8DD
004EB8D9   2C02                   sub     al, $02
004EB8DB   75CB                   jnz     004EB8A8
004EB8DD   33DB                   xor     ebx, ebx
004EB8DF   8A1E                   mov     bl, byte ptr [esi]
004EB8E1   6A00                   push    $00
004EB8E3   68A06D4F00             push    $004F6DA0
004EB8E8   6A01                   push    $01
004EB8EA   56                     push    esi
004EB8EB   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB8F0   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB8F1   E8FAB7F1FF             call    004070F0
004EB8F6   83FB10                 cmp     ebx, +$10
004EB8F9   7505                   jnz     004EB900
004EB8FB   803EA1                 cmp     byte ptr [esi], $A1
004EB8FE   75CF                   jnz     004EB8CF
004EB900   83FB06                 cmp     ebx, +$06
004EB903   7505                   jnz     004EB90A
004EB905   803EF0                 cmp     byte ptr [esi], $F0
004EB908   75C5                   jnz     004EB8CF
004EB90A   83FB0E                 cmp     ebx, +$0E
004EB90D   7505                   jnz     004EB914
004EB90F   803EA0                 cmp     byte ptr [esi], $A0
004EB912   75BB                   jnz     004EB8CF
004EB914   6A00                   push    $00
004EB916   68A06D4F00             push    $004F6DA0
004EB91B   53                     push    ebx
004EB91C   56                     push    esi
004EB91D   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB922   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB923   E8C8B7F1FF             call    004070F0
004EB928   833C2403               cmp     dword ptr [esp], +$03
004EB92C   7D15                   jnl     004EB943
004EB92E   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EB930   E81F73FAFF             call    00492C54
004EB935   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004EB937   E8402AF2FF             call    0040E37C
004EB93C   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EB93E   E81973FAFF             call    00492C5C
004EB943   6A04                   push    $04
004EB945   C644242002             mov     byte ptr [esp+$20], $02
004EB94A   C6442421B1             mov     byte ptr [esp+$21], $B1
004EB94F   C644242200             mov     byte ptr [esp+$22], $00
004EB954   C6442423B3             mov     byte ptr [esp+$23], $B3
004EB959   8D542420               lea     edx, [esp+$20]
004EB95D   B903000000             mov     ecx, $00000003
004EB962   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EB964   E8FF74FFFF             call    004E2E68
004EB969   BA80000000             mov     edx, $00000080
004EB96E   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB973   E8C07AF1FF             call    00403438

|
004EB978   E8376FF1FF             call    004028B4
004EB97D   68CC6D4F00             push    $004F6DCC
004EB982   8BD6                   mov     edx, esi
004EB984   B910000000             mov     ecx, $00000010
004EB989   B8006F4F00             mov     eax, $004F6F00

|
004EB98E   E8BD76F1FF             call    00403050

|
004EB993   E81C6FF1FF             call    004028B4
004EB998   33DB                   xor     ebx, ebx
004EB99A   EB1F                   jmp     004EB9BB
004EB99C   6A00                   push    $00
004EB99E   68A06D4F00             push    $004F6DA0
004EB9A3   6A01                   push    $01
004EB9A5   56                     push    esi
004EB9A6   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB9AB   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB9AC   E83FB7F1FF             call    004070F0
004EB9B1   43                     inc     ebx
004EB9B2   83FB64                 cmp     ebx, +$64
004EB9B5   0F8FB6FEFFFF           jnle    004EB871
004EB9BB   803E06                 cmp     byte ptr [esi], $06
004EB9BE   75DC                   jnz     004EB99C
004EB9C0   BA90000000             mov     edx, $00000090
004EB9C5   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EB9CA   E8697AF1FF             call    00403438

|
004EB9CF   E8E06EF1FF             call    004028B4
004EB9D4   68CC6D4F00             push    $004F6DCC
004EB9D9   8BD6                   mov     edx, esi
004EB9DB   B901000000             mov     ecx, $00000001
004EB9E0   B8006F4F00             mov     eax, $004F6F00

|
004EB9E5   E86676F1FF             call    00403050

|
004EB9EA   E8C56EF1FF             call    004028B4
004EB9EF   6A00                   push    $00
004EB9F1   68A06D4F00             push    $004F6DA0
004EB9F6   6A01                   push    $01
004EB9F8   56                     push    esi
004EB9F9   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EB9FE   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EB9FF   E8ECB6F1FF             call    004070F0
004EBA04   803EF0                 cmp     byte ptr [esi], $F0
004EBA07   75B2                   jnz     004EB9BB
004EBA09   BA91000000             mov     edx, $00000091
004EBA0E   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EBA13   E8207AF1FF             call    00403438

|
004EBA18   E8976EF1FF             call    004028B4
004EBA1D   68CC6D4F00             push    $004F6DCC
004EBA22   8BD6                   mov     edx, esi
004EBA24   B901000000             mov     ecx, $00000001
004EBA29   B8006F4F00             mov     eax, $004F6F00

|
004EBA2E   E81D76F1FF             call    00403050

|
004EBA33   E87C6EF1FF             call    004028B4
004EBA38   6A00                   push    $00
004EBA3A   68A06D4F00             push    $004F6DA0
004EBA3F   6A01                   push    $01
004EBA41   56                     push    esi
004EBA42   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBA47   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EBA48   E8A3B6F1FF             call    004070F0
004EBA4D   803EAA                 cmp     byte ptr [esi], $AA
004EBA50   0F8565FFFFFF           jnz     004EB9BB
004EBA56   BA92000000             mov     edx, $00000092
004EBA5B   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004EBA60   E8D379F1FF             call    00403438

|
004EBA65   E84A6EF1FF             call    004028B4
004EBA6A   68CC6D4F00             push    $004F6DCC
004EBA6F   8BD6                   mov     edx, esi
004EBA71   B901000000             mov     ecx, $00000001
004EBA76   B8006F4F00             mov     eax, $004F6F00

|
004EBA7B   E8D075F1FF             call    00403050

|
004EBA80   E82F6EF1FF             call    004028B4
004EBA85   6A00                   push    $00
004EBA87   68A06D4F00             push    $004F6DA0
004EBA8C   6A04                   push    $04
004EBA8E   56                     push    esi
004EBA8F   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBA94   50                     push    eax

* Reference to: kernel32.ReadFile()
|
004EBA95   E856B6F1FF             call    004070F0
004EBA9A   68CC6D4F00             push    $004F6DCC
004EBA9F   8BD6                   mov     edx, esi
004EBAA1   B92D000000             mov     ecx, $0000002D
004EBAA6   B8006F4F00             mov     eax, $004F6F00

|
004EBAAB   E8A075F1FF             call    00403050

|
004EBAB0   E8FF6DF1FF             call    004028B4
004EBAB5   C6051B724F0001         mov     byte ptr [$004F721B], $01
004EBABC   8B8740030000           mov     eax, [edi+$0340]
004EBAC2   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004EBAC6   E84983F1FF             call    00403E14
004EBACB   83C420                 add     esp, +$20
004EBACE   5D                     pop     ebp
004EBACF   5F                     pop     edi
004EBAD0   5E                     pop     esi
004EBAD1   5B                     pop     ebx
004EBAD2   C3                     ret

*)
end;

procedure TForm1.Button_GrafClick(Sender : TObject);
begin
(*
004EBAD4   53                     push    ebx
004EBAD5   56                     push    esi
004EBAD6   57                     push    edi
004EBAD7   BFAC224F00             mov     edi, $004F22AC
004EBADC   803D1F724F0000         cmp     byte ptr [$004F721F], $00
004EBAE3   7518                   jnz     004EBAFD
004EBAE5   803D34724F0000         cmp     byte ptr [$004F7234], $00
004EBAEC   750F                   jnz     004EBAFD

* Reference to TParamCaseForm instance
|
004EBAEE   A13C594F00             mov     eax, dword ptr [$004F593C]
004EBAF3   8B00                   mov     eax, [eax]
004EBAF5   8B10                   mov     edx, [eax]

* Reference to method TParamCaseForm.ShowModal()
|
004EBAF7   FF92EC000000           call    dword ptr [edx+$00EC]
004EBAFD   803D34724F0001         cmp     byte ptr [$004F7234], $01
004EBB04   757F                   jnz     004EBB85
004EBB06   6A02                   push    $02
004EBB08   B8FC6E4F00             mov     eax, $004F6EFC
004EBB0D   B901000000             mov     ecx, $00000001

* Reference to class main
|
004EBB12   8B150CFB4D00           mov     edx, [$004DFB0C]

* Reference to: System.@DynArraySetLength;
|
004EBB18   E817A2F1FF             call    00405D34
004EBB1D   83C404                 add     esp, +$04
004EBB20   33DB                   xor     ebx, ebx
004EBB22   EB01                   jmp     004EBB25
004EBB24   43                     inc     ebx
004EBB25   8D34DB                 lea     esi, [ebx+ebx*8]
004EBB28   8A04B7                 mov     al, byte ptr [edi+esi*4]
004EBB2B   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EBB31   75F1                   jnz     004EBB24
004EBB33   8B44B708               mov     eax, [edi+esi*4+$08]

* Possible String Reference to: 'Сигнал ДК1'
|
004EBB37   BAB0BB4E00             mov     edx, $004EBBB0

* Reference to: System.@LStrCmp;
|
004EBB3C   E8F792F1FF             call    00404E38
004EBB41   75E1                   jnz     004EBB24
004EBB43   8D04DB                 lea     eax, [ebx+ebx*8]
004EBB46   8B448704               mov     eax, [edi+eax*4+$04]
004EBB4A   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EBB50   8902                   mov     [edx], eax
004EBB52   33DB                   xor     ebx, ebx
004EBB54   EB01                   jmp     004EBB57
004EBB56   43                     inc     ebx
004EBB57   8D34DB                 lea     esi, [ebx+ebx*8]
004EBB5A   8A04B7                 mov     al, byte ptr [edi+esi*4]
004EBB5D   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EBB63   75F1                   jnz     004EBB56
004EBB65   8B44B708               mov     eax, [edi+esi*4+$08]

* Possible String Reference to: 'Кратковременная коррекция топливопо
|                                дачи'
|
004EBB69   BAC4BB4E00             mov     edx, $004EBBC4

* Reference to: System.@LStrCmp;
|
004EBB6E   E8C592F1FF             call    00404E38
004EBB73   75E1                   jnz     004EBB56
004EBB75   8D04DB                 lea     eax, [ebx+ebx*8]
004EBB78   8B448704               mov     eax, [edi+eax*4+$04]
004EBB7C   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EBB82   894204                 mov     [edx+$04], eax
004EBB85   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004EBB8A   E8E99FF1FF             call    00405B78
004EBB8F   85C0                   test    eax, eax
004EBB91   7E0F                   jle     004EBBA2

* Reference to TGrafForm instance
|
004EBB93   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EBB98   8B00                   mov     eax, [eax]
004EBB9A   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EBB9C   FF92EC000000           call    dword ptr [edx+$00EC]
004EBBA2   5F                     pop     edi
004EBBA3   5E                     pop     esi
004EBBA4   5B                     pop     ebx
004EBBA5   C3                     ret

*)
end;

procedure TForm1.RaschetParam(Sender : TObject);
begin
(*
004E6B70   55                     push    ebp
004E6B71   8BEC                   mov     ebp, esp
004E6B73   83C4E0                 add     esp, -$20
004E6B76   53                     push    ebx
004E6B77   56                     push    esi
004E6B78   57                     push    edi
004E6B79   33DB                   xor     ebx, ebx
004E6B7B   895DE0                 mov     [ebp-$20], ebx
004E6B7E   895DE4                 mov     [ebp-$1C], ebx
004E6B81   895DF0                 mov     [ebp-$10], ebx
004E6B84   894DFC                 mov     [ebp-$04], ecx
004E6B87   8BFA                   mov     edi, edx
004E6B89   8B7510                 mov     esi, [ebp+$10]
004E6B8C   8B450C                 mov     eax, [ebp+$0C]
004E6B8F   85C0                   test    eax, eax
004E6B91   7404                   jz      004E6B97
004E6B93   33D2                   xor     edx, edx
004E6B95   8910                   mov     [eax], edx
004E6B97   33C0                   xor     eax, eax
004E6B99   55                     push    ebp
004E6B9A   6827954E00             push    $004E9527

***** TRY
|
004E6B9F   64FF30                 push    dword ptr fs:[eax]
004E6BA2   648920                 mov     fs:[eax], esp
004E6BA5   33C0                   xor     eax, eax
004E6BA7   8945F8                 mov     [ebp-$08], eax
004E6BAA   8B4508                 mov     eax, [ebp+$08]
004E6BAD   C700FFFFFFFF           mov     dword ptr [eax], $FFFFFFFF
004E6BB3   33DB                   xor     ebx, ebx
004E6BB5   EB01                   jmp     004E6BB8
004E6BB7   43                     inc     ebx
004E6BB8   8D04DB                 lea     eax, [ebx+ebx*8]
004E6BBB   8A1485AC224F00         mov     dl, byte ptr [$4F22AC+eax*4]
004E6BC2   3A15A76D4F00           cmp     dl, byte ptr [$004F6DA7]
004E6BC8   7509                   jnz     004E6BD3
004E6BCA   3B3C85B0224F00         cmp     edi, [$4F22B0+eax*4]
004E6BD1   7408                   jz      004E6BDB
004E6BD3   81FB77010000           cmp     ebx, $00000177
004E6BD9   7EDC                   jle     004E6BB7
004E6BDB   81FB78010000           cmp     ebx, $00000178
004E6BE1   0F841A290000           jz      004E9501
004E6BE7   8B4508                 mov     eax, [ebp+$08]
004E6BEA   8918                   mov     [eax], ebx
004E6BEC   803DA76D4F0021         cmp     byte ptr [$004F6DA7], $21
004E6BF3   7537                   jnz     004E6C2C
004E6BF5   803DFE6D4F009D         cmp     byte ptr [$004F6DFE], $9D
004E6BFC   752E                   jnz     004E6C2C
004E6BFE   8D04DB                 lea     eax, [ebx+ebx*8]
004E6C01   8B0485C0224F00         mov     eax, [$4F22C0+eax*4]
004E6C08   83E818                 sub     eax, +$18
004E6C0B   7408                   jz      004E6C15
004E6C0D   48                     dec     eax
004E6C0E   83E80E                 sub     eax, +$0E
004E6C11   720B                   jb      004E6C1E
004E6C13   EB12                   jmp     004E6C27
004E6C15   C745F802000000         mov     dword ptr [ebp-$08], $00000002
004E6C1C   EB0E                   jmp     004E6C2C
004E6C1E   C745F801000000         mov     dword ptr [ebp-$08], $00000001
004E6C25   EB05                   jmp     004E6C2C
004E6C27   33C0                   xor     eax, eax
004E6C29   8945F8                 mov     [ebp-$08], eax
004E6C2C   837DFC01               cmp     dword ptr [ebp-$04], +$01
004E6C30   0F84E1270000           jz      004E9417
004E6C36   8D04DB                 lea     eax, [ebx+ebx*8]
004E6C39   8B1485C4224F00         mov     edx, [$4F22C4+eax*4]
004E6C40   83EA01                 sub     edx, +$01
004E6C43   720A                   jb      004E6C4F
004E6C45   743E                   jz      004E6C85
004E6C47   4A                     dec     edx
004E6C48   7457                   jz      004E6CA1
004E6C4A   E988000000             jmp     004E6CD7
004E6C4F   8B0485C0224F00         mov     eax, [$4F22C0+eax*4]
004E6C56   40                     inc     eax
004E6C57   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6C5A   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6C61   C1E008                 shl     eax, $08
004E6C64   8D14DB                 lea     edx, [ebx+ebx*8]
004E6C67   8B1495C0224F00         mov     edx, [$4F22C0+edx*4]
004E6C6E   2B55F8                 sub     edx, dword ptr [ebp-$08]
004E6C71   0FB692F86D4F00         movzx   edx, byte ptr [edx+$4F6DF8]
004E6C78   03C2                   add     eax, edx
004E6C7A   8945F4                 mov     [ebp-$0C], eax
004E6C7D   DB45F4                 fild    dword ptr [ebp-$0C]
004E6C80   DD1E                   fstp    qword ptr [esi]
004E6C82   9B                     wait
004E6C83   EB59                   jmp     004E6CDE
004E6C85   8B0485C0224F00         mov     eax, [$4F22C0+eax*4]
004E6C8C   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6C8F   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6C96   8945F4                 mov     [ebp-$0C], eax
004E6C99   DB45F4                 fild    dword ptr [ebp-$0C]
004E6C9C   DD1E                   fstp    qword ptr [esi]
004E6C9E   9B                     wait
004E6C9F   EB3D                   jmp     004E6CDE
004E6CA1   8B0485C0224F00         mov     eax, [$4F22C0+eax*4]
004E6CA8   2B45F8                 sub     eax, dword ptr [ebp-$08]
004E6CAB   0FB680F86D4F00         movzx   eax, byte ptr [eax+$4F6DF8]
004E6CB2   C1E008                 shl     eax, $08
004E6CB5   8D14DB                 lea     edx, [ebx+ebx*8]
004E6CB8   8B1495C0224F00         mov     edx, [$4F22C0+edx*4]
004E6CBF   42                     inc     edx
004E6CC0   2B55F8                 sub     edx, dword ptr [ebp-$08]
004E6CC3   0FB692F86D4F00         movzx   edx, byte ptr [edx+$4F6DF8]
004E6CCA   03C2                   add     eax, edx
004E6CCC   8945F4                 mov     [ebp-$0C], eax
004E6CCF   DB45F4                 fild    dword ptr [ebp-$0C]
004E6CD2   DD1E                   fstp    qword ptr [esi]
004E6CD4   9B                     wait
004E6CD5   EB07                   jmp     004E6CDE
004E6CD7   33C0                   xor     eax, eax
004E6CD9   8906                   mov     [esi], eax
004E6CDB   894604                 mov     [esi+$04], eax
004E6CDE   33C0                   xor     eax, eax
004E6CE0   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E6CE5   83C0EF                 add     eax, -$11
004E6CE8   83F833                 cmp     eax, +$33
004E6CEB   0F8726270000           jnbe    004E9417
004E6CF1   8A80FE6C4E00           mov     al, byte ptr [eax+$4E6CFE]
004E6CF7   FF2485326D4E00         jmp     dword ptr [$4E6D32+eax*4]
004E6CFE   0102                   add     [edx], eax
004E6D00   030400                 add     eax, [eax+eax]
004E6D03   0000                   add     [eax], al
004E6D05   0000                   add     [eax], al
004E6D07   0000                   add     [eax], al
004E6D09   0000                   add     [eax], al
004E6D0B   0000                   add     [eax], al
004E6D0D   000506000000           add     [$00000006], al
004E6D13   0000                   add     [eax], al
004E6D15   0000                   add     [eax], al
004E6D17   0000                   add     [eax], al
004E6D19   0000                   add     [eax], al
004E6D1B   0000                   add     [eax], al
004E6D1D   0000                   add     [eax], al
004E6D1F   07                     pop     es
004E6D20   0000                   add     [eax], al
004E6D22   0000                   add     [eax], al
004E6D24   0000                   add     [eax], al
004E6D26   0000                   add     [eax], al
004E6D28   0000                   add     [eax], al
004E6D2A   0000                   add     [eax], al
004E6D2C   0000                   add     [eax], al
004E6D2E   0809                   or      [ecx], cl
004E6D30   0A0B                   or      cl, byte ptr [ebx]
004E6D32   17                     pop     ss
004E6D33   94                     xchg    eax, esp
004E6D34   4E                     dec     esi
004E6D35   00626D                 add     [edx+$6D], ah
004E6D38   4E                     dec     esi
004E6D39   00B2724E004D           add     [edx+$4D004E72], dh
004E6D3F   7C4E                   jl      004E6D8F
004E6D41   0084814E001287         add     [ecx+eax*4+$8712004E], al
004E6D48   4E                     dec     esi
004E6D49   001D8B4E00FF           add     [$FF004E8B], bl
004E6D4F   8D4E00                 lea     ecx, [esi+$00]
004E6D52   D6                     DB  $D6  //
004E6D53   8E4E00                 mov     cs, word ptr [esi+$00]
004E6D56   708F                   jo      004E6CE7
004E6D58   4E                     dec     esi
004E6D59   005390                 add     [ebx-$70], dl
004E6D5C   4E                     dec     esi
004E6D5D   006792                 add     [edi-$6E], ah
004E6D60   4E                     dec     esi
004E6D61   0083FF380F87           add     [ebx+$870F38FF], al
004E6D67   AC                     lodsb
004E6D68   260000                 add     es:[eax], al
004E6D6B   0FB6BF796D4E00         movzx   edi, byte ptr [edi+$4E6D79]
004E6D72   FF24BDB26D4E00         jmp     dword ptr [$4E6DB2+edi*4]
004E6D79   0001                   add     [ecx], al
004E6D7B   0102                   add     [edx], eax
004E6D7D   030404                 add     eax, [esp+eax]
004E6D80   030506070809           add     eax, [$09080706]
004E6D86   0A03                   or      al, byte ptr [ebx]
004E6D88   0302                   add     eax, [edx]
004E6D8A   020B                   add     cl, byte ptr [ebx]
004E6D8C   0C0D                   or      al, $0D
004E6D8E   0E                     push    cs
004E6D8F   0F0F                   DB  $0F, $0F  //
004E6D91   0E                     push    cs
004E6D92   0E                     push    cs
004E6D93   1010                   adc     [eax], dl
004E6D95   1010                   adc     [eax], dl
004E6D97   1112                   adc     [edx], edx
004E6D99   0303                   add     eax, [ebx]
004E6D9B   0303                   add     eax, [ebx]
004E6D9D   0303                   add     eax, [ebx]
004E6D9F   0303                   add     eax, [ebx]
004E6DA1   0303                   add     eax, [ebx]
004E6DA3   0202                   add     al, byte ptr [edx]
004E6DA5   0303                   add     eax, [ebx]
004E6DA7   1212                   adc     dl, byte ptr [edx]
004E6DA9   1212                   adc     dl, byte ptr [edx]
004E6DAB   1212                   adc     dl, byte ptr [edx]
004E6DAD   13141516171794         adc     edx, [$94171716+edx]
004E6DB4   4E                     dec     esi
004E6DB5   0012                   add     [edx], dl
004E6DB7   6E                     outsb
004E6DB8   4E                     dec     esi
004E6DB9   0028                   add     [eax], ch
004E6DBB   6E                     outsb
004E6DBC   4E                     dec     esi
004E6DBD   0038                   add     [eax], bh
004E6DBF   6E                     outsb
004E6DC0   4E                     dec     esi
004E6DC1   00476E                 add     [edi+$6E], al
004E6DC4   4E                     dec     esi
004E6DC5   00576E                 add     [edi+$6E], dl
004E6DC8   4E                     dec     esi
004E6DC9   006F6E                 add     [edi+$6E], ch
004E6DCC   4E                     dec     esi
004E6DCD   007F6E                 add     [edi+$6E], bh
004E6DD0   4E                     dec     esi
004E6DD1   00A86E4E00D1           add     [eax+$D1004E6E], ch
004E6DD7   6E                     outsb
004E6DD8   4E                     dec     esi
004E6DD9   00E1                   add     cl, ah
004E6DDB   6E                     outsb
004E6DDC   4E                     dec     esi
004E6DDD   00146F                 add     [edi+ebp*2], dl
004E6DE0   4E                     dec     esi
004E6DE1   00406F                 add     [eax+$6F], al
004E6DE4   4E                     dec     esi
004E6DE5   007B6F                 add     [ebx+$6F], bh
004E6DE8   4E                     dec     esi
004E6DE9   008B6F4E00BE           add     [ebx+$BE004E6F], cl
004E6DEF   6F                     outsd
004E6DF0   4E                     dec     esi
004E6DF1   00CE                   add     dh, cl
004E6DF3   6F                     outsd
004E6DF4   4E                     dec     esi
004E6DF5   00E4                   add     ah, ah
004E6DF7   6F                     outsd
004E6DF8   4E                     dec     esi
004E6DF9   00FA                   add     dl, bh
004E6DFB   6F                     outsd
004E6DFC   4E                     dec     esi
004E6DFD   000A                   add     [edx], cl
004E6DFF   704E                   jo      004E6E4F
004E6E01   00A2704E002A           add     [edx+$2A004E70], ah
004E6E07   714E                   jno     004E6E57
004E6E09   001B                   add     [ebx], bl
004E6E0B   724E                   jb      004E6E5B
004E6E0D   006272                 add     [edx+$72], ah
004E6E10   4E                     dec     esi
004E6E11   00DD                   add     ch, bl
004E6E13   06                     push    es
004E6E14   D82538954E00           fsub    dword ptr [$004E9538]
004E6E1A   D80D3C954E00           fmul    dword ptr [$004E953C]
004E6E20   DD1E                   fstp    qword ptr [esi]
004E6E22   9B                     wait
004E6E23   E9EF250000             jmp     004E9417
004E6E28   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E6E2E   DC3E                   fdivr   qword ptr [esi]
004E6E30   DD1E                   fstp    qword ptr [esi]
004E6E32   9B                     wait
004E6E33   E9DF250000             jmp     004E9417
004E6E38   8B06                   mov     eax, [esi]
004E6E3A   8906                   mov     [esi], eax
004E6E3C   8B4604                 mov     eax, [esi+$04]
004E6E3F   894604                 mov     [esi+$04], eax
004E6E42   E9D0250000             jmp     004E9417
004E6E47   DD06                   fld     qword ptr [esi]
004E6E49   D8354C954E00           fdiv    dword ptr [$004E954C]
004E6E4F   DD1E                   fstp    qword ptr [esi]
004E6E51   9B                     wait
004E6E52   E9C0250000             jmp     004E9417
004E6E57   DD06                   fld     qword ptr [esi]
004E6E59   D83550954E00           fdiv    dword ptr [$004E9550]
004E6E5F   DC06                   fadd    qword ptr [esi]
004E6E61   D83554954E00           fdiv    dword ptr [$004E9554]
004E6E67   DD1E                   fstp    qword ptr [esi]
004E6E69   9B                     wait
004E6E6A   E9A8250000             jmp     004E9417
004E6E6F   DB2D58954E00           fld     tbyte ptr [$004E9558]
004E6E75   DC0E                   fmul    qword ptr [esi]
004E6E77   DD1E                   fstp    qword ptr [esi]
004E6E79   9B                     wait
004E6E7A   E998250000             jmp     004E9417
004E6E7F   DD06                   fld     qword ptr [esi]
004E6E81   D81D64954E00           fcomp   dword ptr [$004E9564]
004E6E87   DFE0                   fstsw   ax
004E6E89   9E                     sahf
004E6E8A   7610                   jbe     004E6E9C
004E6E8C   DB2D68954E00           fld     tbyte ptr [$004E9568]
004E6E92   DC3E                   fdivr   qword ptr [esi]
004E6E94   DD1E                   fstp    qword ptr [esi]
004E6E96   9B                     wait
004E6E97   E97B250000             jmp     004E9417
004E6E9C   33C0                   xor     eax, eax
004E6E9E   8906                   mov     [esi], eax
004E6EA0   894604                 mov     [esi+$04], eax
004E6EA3   E96F250000             jmp     004E9417
004E6EA8   DD06                   fld     qword ptr [esi]
004E6EAA   D81D64954E00           fcomp   dword ptr [$004E9564]
004E6EB0   DFE0                   fstsw   ax
004E6EB2   9E                     sahf
004E6EB3   7610                   jbe     004E6EC5
004E6EB5   DD06                   fld     qword ptr [esi]
004E6EB7   D83574954E00           fdiv    dword ptr [$004E9574]
004E6EBD   DD1E                   fstp    qword ptr [esi]
004E6EBF   9B                     wait
004E6EC0   E952250000             jmp     004E9417
004E6EC5   33C0                   xor     eax, eax
004E6EC7   8906                   mov     [esi], eax
004E6EC9   894604                 mov     [esi+$04], eax
004E6ECC   E946250000             jmp     004E9417
004E6ED1   DD06                   fld     qword ptr [esi]
004E6ED3   D83578954E00           fdiv    dword ptr [$004E9578]
004E6ED9   DD1E                   fstp    qword ptr [esi]
004E6EDB   9B                     wait
004E6EDC   E936250000             jmp     004E9417
004E6EE1   DD06                   fld     qword ptr [esi]
004E6EE3   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E6EE9   DFE0                   fstsw   ax
004E6EEB   9E                     sahf
004E6EEC   7310                   jnb     004E6EFE
004E6EEE   DD06                   fld     qword ptr [esi]
004E6EF0   D83574954E00           fdiv    dword ptr [$004E9574]
004E6EF6   DD1E                   fstp    qword ptr [esi]
004E6EF8   9B                     wait
004E6EF9   E919250000             jmp     004E9417
004E6EFE   DD06                   fld     qword ptr [esi]
004E6F00   D83574954E00           fdiv    dword ptr [$004E9574]
004E6F06   D82580954E00           fsub    dword ptr [$004E9580]
004E6F0C   DD1E                   fstp    qword ptr [esi]
004E6F0E   9B                     wait
004E6F0F   E903250000             jmp     004E9417
004E6F14   DD06                   fld     qword ptr [esi]
004E6F16   D81D84954E00           fcomp   dword ptr [$004E9584]
004E6F1C   DFE0                   fstsw   ax
004E6F1E   9E                     sahf
004E6F1F   7610                   jbe     004E6F31
004E6F21   DD06                   fld     qword ptr [esi]
004E6F23   D82588954E00           fsub    dword ptr [$004E9588]
004E6F29   DD1E                   fstp    qword ptr [esi]
004E6F2B   9B                     wait
004E6F2C   E9E6240000             jmp     004E9417
004E6F31   8B06                   mov     eax, [esi]
004E6F33   8906                   mov     [esi], eax
004E6F35   8B4604                 mov     eax, [esi+$04]
004E6F38   894604                 mov     [esi+$04], eax
004E6F3B   E9D7240000             jmp     004E9417
004E6F40   8D55F0                 lea     edx, [ebp-$10]

* Reference to TOptionsForm instance
|
004E6F43   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E6F48   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.MaskEdit : TMaskEdit
|
004E6F4A   8B8034030000           mov     eax, [eax+$0334]

* Reference to: Mask.TCustomMaskEdit.GetText(TCustomMaskEdit):TMaskedText;
|
004E6F50   E8C7C7F9FF             call    0048371C
004E6F55   8B45F0                 mov     eax, [ebp-$10]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004E6F58   E89F22F2FF             call    004091FC
004E6F5D   8945F4                 mov     [ebp-$0C], eax
004E6F60   DB45F4                 fild    dword ptr [ebp-$0C]
004E6F63   D8358C954E00           fdiv    dword ptr [$004E958C]
004E6F69   DC0E                   fmul    qword ptr [esi]
004E6F6B   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E6F71   DEF9                   fdivp   st(1), st(0)
004E6F73   DD1E                   fstp    qword ptr [esi]
004E6F75   9B                     wait
004E6F76   E99C240000             jmp     004E9417
004E6F7B   DD06                   fld     qword ptr [esi]
004E6F7D   D83590954E00           fdiv    dword ptr [$004E9590]
004E6F83   DD1E                   fstp    qword ptr [esi]
004E6F85   9B                     wait
004E6F86   E98C240000             jmp     004E9417
004E6F8B   DD06                   fld     qword ptr [esi]
004E6F8D   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E6F93   DFE0                   fstsw   ax
004E6F95   9E                     sahf
004E6F96   7310                   jnb     004E6FA8
004E6F98   DD06                   fld     qword ptr [esi]
004E6F9A   D83590954E00           fdiv    dword ptr [$004E9590]
004E6FA0   DD1E                   fstp    qword ptr [esi]
004E6FA2   9B                     wait
004E6FA3   E96F240000             jmp     004E9417
004E6FA8   DD06                   fld     qword ptr [esi]
004E6FAA   D83590954E00           fdiv    dword ptr [$004E9590]
004E6FB0   D8258C954E00           fsub    dword ptr [$004E958C]
004E6FB6   DD1E                   fstp    qword ptr [esi]
004E6FB8   9B                     wait
004E6FB9   E959240000             jmp     004E9417
004E6FBE   DB2D94954E00           fld     tbyte ptr [$004E9594]
004E6FC4   DC3E                   fdivr   qword ptr [esi]
004E6FC6   DD1E                   fstp    qword ptr [esi]
004E6FC8   9B                     wait
004E6FC9   E949240000             jmp     004E9417
004E6FCE   DD06                   fld     qword ptr [esi]
004E6FD0   D80DA0954E00           fmul    dword ptr [$004E95A0]
004E6FD6   D82DA4954E00           fsubr   dword ptr [$004E95A4]
004E6FDC   DD1E                   fstp    qword ptr [esi]
004E6FDE   9B                     wait
004E6FDF   E933240000             jmp     004E9417
004E6FE4   DD06                   fld     qword ptr [esi]
004E6FE6   D80DA0954E00           fmul    dword ptr [$004E95A0]
004E6FEC   D825A8954E00           fsub    dword ptr [$004E95A8]
004E6FF2   DD1E                   fstp    qword ptr [esi]
004E6FF4   9B                     wait
004E6FF5   E91D240000             jmp     004E9417
004E6FFA   DD06                   fld     qword ptr [esi]
004E6FFC   D835AC954E00           fdiv    dword ptr [$004E95AC]
004E7002   DD1E                   fstp    qword ptr [esi]
004E7004   9B                     wait
004E7005   E90D240000             jmp     004E9417
004E700A   6B3DC86D4F004C         imul    edi, [$004F6DC8], $4C
004E7011   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7016   DD84F808010000         fld     qword ptr [eax+edi*8+$0108]
004E701D   D81DB0954E00           fcomp   dword ptr [$004E95B0]
004E7023   DFE0                   fstsw   ax
004E7025   9E                     sahf
004E7026   746E                   jz      004E7096

* Reference to TOptionsForm instance
|
004E7028   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E702D   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E702F   8B8018030000           mov     eax, [eax+$0318]
004E7035   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E7037   FF92CC000000           call    dword ptr [edx+$00CC]
004E703D   8945F4                 mov     [ebp-$0C], eax
004E7040   DB45F4                 fild    dword ptr [ebp-$0C]
004E7043   D83554954E00           fdiv    dword ptr [$004E9554]
004E7049   D805B4954E00           fadd    dword ptr [$004E95B4]
004E704F   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7054   DD44F858               fld     qword ptr [eax+edi*8+$58]
004E7058   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E705D   DC44F868               fadd    qword ptr [eax+edi*8+$68]
004E7061   DEC9                   fmulp   st(1), st(0)
004E7063   D80DB8954E00           fmul    dword ptr [$004E95B8]
004E7069   D80DBC954E00           fmul    dword ptr [$004E95BC]
004E706F   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7076   8B15F86E4F00           mov     edx, [$004F6EF8]
004E707C   DD44C220               fld     qword ptr [edx+eax*8+$20]
004E7080   D83588954E00           fdiv    dword ptr [$004E9588]
004E7086   DEC9                   fmulp   st(1), st(0)
004E7088   D835C0954E00           fdiv    dword ptr [$004E95C0]
004E708E   DD1E                   fstp    qword ptr [esi]
004E7090   9B                     wait
004E7091   E981230000             jmp     004E9417
004E7096   33C0                   xor     eax, eax
004E7098   8906                   mov     [esi], eax
004E709A   894604                 mov     [esi+$04], eax
004E709D   E975230000             jmp     004E9417
004E70A2   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E70A9   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E70AE   DD44D038               fld     qword ptr [eax+edx*8+$38]
004E70B2   D81D64954E00           fcomp   dword ptr [$004E9564]
004E70B8   DFE0                   fstsw   ax
004E70BA   9E                     sahf
004E70BB   7661                   jbe     004E711E
004E70BD   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E70C4   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E70CA   DD44C138               fld     qword ptr [ecx+eax*8+$38]
004E70CE   D81DC4954E00           fcomp   dword ptr [$004E95C4]
004E70D4   DFE0                   fstsw   ax
004E70D6   9E                     sahf
004E70D7   731A                   jnb     004E70F3
004E70D9   D90554954E00           fld     dword ptr [$004E9554]
004E70DF   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E70E4   DC8CD0A0010000         fmul    qword ptr [eax+edx*8+$01A0]
004E70EB   DD1E                   fstp    qword ptr [esi]
004E70ED   9B                     wait
004E70EE   E924230000             jmp     004E9417
004E70F3   D9058C954E00           fld     dword ptr [$004E958C]
004E70F9   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E70FE   DC8CD0A0010000         fmul    qword ptr [eax+edx*8+$01A0]
004E7105   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E710C   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7112   DC74C238               fdiv    qword ptr [edx+eax*8+$38]
004E7116   DD1E                   fstp    qword ptr [esi]
004E7118   9B                     wait
004E7119   E9F9220000             jmp     004E9417
004E711E   33C0                   xor     eax, eax
004E7120   8906                   mov     [esi], eax
004E7122   894604                 mov     [esi+$04], eax
004E7125   E9ED220000             jmp     004E9417
004E712A   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E7131   7543                   jnz     004E7176
004E7133   33C0                   xor     eax, eax
004E7135   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E713A   69C080EE3600           imul    eax, eax, $0036EE80
004E7140   33D2                   xor     edx, edx
004E7142   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7148   69D260EA0000           imul    edx, edx, $0000EA60
004E714E   03C2                   add     eax, edx
004E7150   33D2                   xor     edx, edx
004E7152   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E7158   69D2E8030000           imul    edx, edx, $000003E8
004E715E   03C2                   add     eax, edx
004E7160   33D2                   xor     edx, edx
004E7162   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E7168   03D2                   add     edx, edx
004E716A   8D1492                 lea     edx, [edx+edx*4]
004E716D   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E716F   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7174   EB0A                   jmp     004E7180
004E7176   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E717B   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7180   33C0                   xor     eax, eax
004E7182   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E7187   69C080EE3600           imul    eax, eax, $0036EE80
004E718D   33D2                   xor     edx, edx
004E718F   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7195   69D260EA0000           imul    edx, edx, $0000EA60
004E719B   03C2                   add     eax, edx
004E719D   33D2                   xor     edx, edx
004E719F   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E71A5   69D2E8030000           imul    edx, edx, $000003E8
004E71AB   03C2                   add     eax, edx
004E71AD   33D2                   xor     edx, edx
004E71AF   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E71B5   03D2                   add     edx, edx
004E71B7   8D1492                 lea     edx, [edx+edx*4]
004E71BA   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E71BC   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E71C1   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E71C6   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E71CC   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E71D1   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E71D8   8B15F86E4F00           mov     edx, [$004F6EF8]
004E71DE   DD84C2A0010000         fld     qword ptr [edx+eax*8+$01A0]
004E71E5   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E71EB   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E71F1   DEC9                   fmulp   st(1), st(0)
004E71F3   DD1E                   fstp    qword ptr [esi]
004E71F5   9B                     wait
004E71F6   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E71FC   DC06                   fadd    qword ptr [esi]
004E71FE   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E7204   9B                     wait
004E7205   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E720B   8906                   mov     [esi], eax
004E720D   8B05E06D4F00           mov     eax, [$004F6DE0]
004E7213   894604                 mov     [esi+$04], eax
004E7216   E9FC210000             jmp     004E9417
004E721B   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7222   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7228   DD44C238               fld     qword ptr [edx+eax*8+$38]
004E722C   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E7232   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7238   DEC9                   fmulp   st(1), st(0)
004E723A   DD1E                   fstp    qword ptr [esi]
004E723C   9B                     wait
004E723D   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E7243   DC06                   fadd    qword ptr [esi]
004E7245   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E724B   9B                     wait
004E724C   8B05E46D4F00           mov     eax, [$004F6DE4]
004E7252   8906                   mov     [esi], eax
004E7254   8B05E86D4F00           mov     eax, [$004F6DE8]
004E725A   894604                 mov     [esi+$04], eax
004E725D   E9B5210000             jmp     004E9417
004E7262   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7269   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E726E   DD84D0B8010000         fld     qword ptr [eax+edx*8+$01B8]
004E7275   D81DCC954E00           fcomp   dword ptr [$004E95CC]
004E727B   DFE0                   fstsw   ax
004E727D   9E                     sahf
004E727E   0F8693210000           jbe     004E9417
004E7284   D9058C954E00           fld     dword ptr [$004E958C]
004E728A   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E728F   DC8CD0B0010000         fmul    qword ptr [eax+edx*8+$01B0]
004E7296   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E729D   8B15F86E4F00           mov     edx, [$004F6EF8]
004E72A3   DCB4C2B8010000         fdiv    qword ptr [edx+eax*8+$01B8]
004E72AA   DD1E                   fstp    qword ptr [esi]
004E72AC   9B                     wait
004E72AD   E965210000             jmp     004E9417
004E72B2   83FF47                 cmp     edi, +$47
004E72B5   0F875C210000           jnbe    004E9417
004E72BB   FF24BDC2724E00         jmp     dword ptr [$4E72C2+edi*4]
004E72C2   17                     pop     ss
004E72C3   94                     xchg    eax, esp
004E72C4   4E                     dec     esi
004E72C5   00E2                   add     dl, ah
004E72C7   734E                   jnb     004E7317
004E72C9   00F1                   add     cl, dh
004E72CB   734E                   jnb     004E731B
004E72CD   0000                   add     [eax], al
004E72CF   744E                   jz      004E731F
004E72D1   0016                   add     [esi], dl
004E72D3   744E                   jz      004E7323
004E72D5   0026                   add     [esi], ah
004E72D7   744E                   jz      004E7327
004E72D9   0036                   add     [esi], dh
004E72DB   744E                   jz      004E732B
004E72DD   004674                 add     [esi+$74], al
004E72E0   4E                     dec     esi
004E72E1   005674                 add     [esi+$74], dl
004E72E4   4E                     dec     esi
004E72E5   006674                 add     [esi+$74], ah
004E72E8   4E                     dec     esi
004E72E9   007674                 add     [esi+$74], dh
004E72EC   4E                     dec     esi
004E72ED   0092744E00A2           add     [edx+$A2004E74], dl
004E72F3   744E                   jz      004E7343
004E72F5   00B2744E00C2           add     [edx+$C2004E74], dh
004E72FB   744E                   jz      004E734B
004E72FD   00D2                   add     dl, dl
004E72FF   744E                   jz      004E734F
004E7301   00EE                   add     dh, ch
004E7303   744E                   jz      004E7353
004E7305   00FE                   add     dh, bh
004E7307   744E                   jz      004E7357
004E7309   000E                   add     [esi], cl
004E730B   754E                   jnz     004E735B
004E730D   0035754E005C           add     [$5C004E75], dh
004E7313   754E                   jnz     004E7363
004E7315   0082754E00A9           add     [edx+$A9004E75], al
004E731B   754E                   jnz     004E736B
004E731D   00B9754E00C9           add     [ecx+$C9004E75], bh
004E7323   754E                   jnz     004E7373
004E7325   00D8                   add     al, bl
004E7327   754E                   jnz     004E7377
004E7329   00E7                   add     bh, ah
004E732B   754E                   jnz     004E737B
004E732D   00F7                   add     bh, dh
004E732F   754E                   jnz     004E737F
004E7331   0013                   add     [ebx], dl
004E7333   764E                   jbe     004E7383
004E7335   002F                   add     [edi], ch
004E7337   764E                   jbe     004E7387
004E7339   003F                   add     [edi], bh
004E733B   764E                   jbe     004E738B
004E733D   004E76                 add     [esi+$76], cl
004E7340   4E                     dec     esi
004E7341   005D76                 add     [ebp+$76], bl
004E7344   4E                     dec     esi
004E7345   006D76                 add     [ebp+$76], ch
004E7348   4E                     dec     esi
004E7349   007D76                 add     [ebp+$76], bh
004E734C   4E                     dec     esi
004E734D   008C764E00B376         add     [esi+esi*2+$76B3004E], cl
004E7354   4E                     dec     esi
004E7355   00DA                   add     dl, bl
004E7357   764E                   jbe     004E73A7
004E7359   0001                   add     [ecx], al
004E735B   774E                   jnbe    004E73AB
004E735D   0028                   add     [eax], ch
004E735F   774E                   jnbe    004E73AF
004E7361   004F77                 add     [edi+$77], cl
004E7364   4E                     dec     esi
004E7365   006F77                 add     [edi+$77], ch
004E7368   4E                     dec     esi
004E7369   0095774E00BC           add     [ebp+$BC004E77], dl
004E736F   774E                   jnbe    004E73BF
004E7371   00E3                   add     bl, ah
004E7373   774E                   jnbe    004E73C3
004E7375   000A                   add     [edx], cl
004E7377   784E                   js      004E73C7
004E7379   0031                   add     [ecx], dh
004E737B   784E                   js      004E73CB
004E737D   005778                 add     [edi+$78], dl
004E7380   4E                     dec     esi
004E7381   007E78                 add     [esi+$78], bh
004E7384   4E                     dec     esi
004E7385   00A5784E00B4           add     [ebp+$B4004E78], ah
004E738B   784E                   js      004E73DB
004E738D   00C4                   add     ah, al
004E738F   784E                   js      004E73DF
004E7391   00D4                   add     ah, dl
004E7393   784E                   js      004E73E3
004E7395   00E4                   add     ah, ah
004E7397   784E                   js      004E73E7
004E7399   00F4                   add     ah, dh
004E739B   784E                   js      004E73EB
004E739D   0003                   add     [ebx], al
004E739F   794E                   jns     004E73EF
004E73A1   0012                   add     [edx], dl
004E73A3   794E                   jns     004E73F3
004E73A5   0021                   add     [ecx], ah
004E73A7   794E                   jns     004E73F7
004E73A9   0030                   add     [eax], dh
004E73AB   794E                   jns     004E73FB
004E73AD   003F                   add     [edi], bh
004E73AF   794E                   jns     004E73FF
004E73B1   005579                 add     [ebp+$79], dl
004E73B4   4E                     dec     esi
004E73B5   006579                 add     [ebp+$79], ah
004E73B8   4E                     dec     esi
004E73B9   0074794E               add     [ecx+edi*2+$4E], dh
004E73BD   0084794E009A79         add     [ecx+edi*2+$799A004E], al
004E73C4   4E                     dec     esi
004E73C5   00AA794E00C0           add     [edx+$C0004E79], ch
004E73CB   794E                   jns     004E741B
004E73CD   00CF                   add     bh, cl
004E73CF   794E                   jns     004E741F
004E73D1   003D7A4E00C5           add     [$C5004E7A], bh
004E73D7   7A4E                   jp      004E7427
004E73D9   00B67B4E00FD           add     [esi+$FD004E7B], dh
004E73DF   7B4E                   jnp     004E742F
004E73E1   008B0689068B           add     [ebx+$8B068906], cl
004E73E7   46                     inc     esi
004E73E8   0489                   add     al, -$77
004E73EA   46                     inc     esi
004E73EB   04E9                   add     al, -$17
004E73ED   262000                 and     es:[eax], al
004E73F0   008B0689068B           add     [ebx+$8B068906], cl
004E73F6   46                     inc     esi
004E73F7   0489                   add     al, -$77
004E73F9   46                     inc     esi
004E73FA   04E9                   add     al, -$17
004E73FC   17                     pop     ss
004E73FD   2000                   and     [eax], al
004E73FF   00DD                   add     ch, bl
004E7401   06                     push    es
004E7402   D83588954E00           fdiv    dword ptr [$004E9588]
004E7408   D825D0954E00           fsub    dword ptr [$004E95D0]
004E740E   DD1E                   fstp    qword ptr [esi]
004E7410   9B                     wait
004E7411   E901200000             jmp     004E9417
004E7416   DD06                   fld     qword ptr [esi]
004E7418   D825D4954E00           fsub    dword ptr [$004E95D4]
004E741E   DD1E                   fstp    qword ptr [esi]
004E7420   9B                     wait
004E7421   E9F11F0000             jmp     004E9417
004E7426   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E742C   DC3E                   fdivr   qword ptr [esi]
004E742E   DD1E                   fstp    qword ptr [esi]
004E7430   9B                     wait
004E7431   E9E11F0000             jmp     004E9417
004E7436   DD06                   fld     qword ptr [esi]
004E7438   D835E4954E00           fdiv    dword ptr [$004E95E4]
004E743E   DD1E                   fstp    qword ptr [esi]
004E7440   9B                     wait
004E7441   E9D11F0000             jmp     004E9417
004E7446   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E744C   DC3E                   fdivr   qword ptr [esi]
004E744E   DD1E                   fstp    qword ptr [esi]
004E7450   9B                     wait
004E7451   E9C11F0000             jmp     004E9417
004E7456   DD06                   fld     qword ptr [esi]
004E7458   D80DE8954E00           fmul    dword ptr [$004E95E8]
004E745E   DD1E                   fstp    qword ptr [esi]
004E7460   9B                     wait
004E7461   E9B11F0000             jmp     004E9417
004E7466   DD06                   fld     qword ptr [esi]
004E7468   D83584954E00           fdiv    dword ptr [$004E9584]
004E746E   DD1E                   fstp    qword ptr [esi]
004E7470   9B                     wait
004E7471   E9A11F0000             jmp     004E9417
004E7476   DD06                   fld     qword ptr [esi]
004E7478   D835EC954E00           fdiv    dword ptr [$004E95EC]
004E747E   D80DF0954E00           fmul    dword ptr [$004E95F0]
004E7484   D82DBC954E00           fsubr   dword ptr [$004E95BC]
004E748A   DD1E                   fstp    qword ptr [esi]
004E748C   9B                     wait
004E748D   E9851F0000             jmp     004E9417
004E7492   DD06                   fld     qword ptr [esi]
004E7494   D83554954E00           fdiv    dword ptr [$004E9554]
004E749A   DD1E                   fstp    qword ptr [esi]
004E749C   9B                     wait
004E749D   E9751F0000             jmp     004E9417
004E74A2   DD06                   fld     qword ptr [esi]
004E74A4   D835F4954E00           fdiv    dword ptr [$004E95F4]
004E74AA   DD1E                   fstp    qword ptr [esi]
004E74AC   9B                     wait
004E74AD   E9651F0000             jmp     004E9417
004E74B2   DD06                   fld     qword ptr [esi]
004E74B4   D835F8954E00           fdiv    dword ptr [$004E95F8]
004E74BA   DD1E                   fstp    qword ptr [esi]
004E74BC   9B                     wait
004E74BD   E9551F0000             jmp     004E9417
004E74C2   DD06                   fld     qword ptr [esi]
004E74C4   D835F8954E00           fdiv    dword ptr [$004E95F8]
004E74CA   DD1E                   fstp    qword ptr [esi]
004E74CC   9B                     wait
004E74CD   E9451F0000             jmp     004E9417
004E74D2   DD06                   fld     qword ptr [esi]
004E74D4   D80DFC954E00           fmul    dword ptr [$004E95FC]
004E74DA   D83500964E00           fdiv    dword ptr [$004E9600]
004E74E0   D8258C954E00           fsub    dword ptr [$004E958C]
004E74E6   DD1E                   fstp    qword ptr [esi]
004E74E8   9B                     wait
004E74E9   E9291F0000             jmp     004E9417
004E74EE   DD06                   fld     qword ptr [esi]
004E74F0   D835F4954E00           fdiv    dword ptr [$004E95F4]
004E74F6   DD1E                   fstp    qword ptr [esi]
004E74F8   9B                     wait
004E74F9   E9191F0000             jmp     004E9417
004E74FE   DD06                   fld     qword ptr [esi]
004E7500   D835F4954E00           fdiv    dword ptr [$004E95F4]
004E7506   DD1E                   fstp    qword ptr [esi]
004E7508   9B                     wait
004E7509   E9091F0000             jmp     004E9417
004E750E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7510   E8AFB6F1FF             call    00402BC4
004E7515   81E010000000           and     eax, $00000010
004E751B   33D2                   xor     edx, edx
004E751D   0FACD004               shrd    eax, edx, $04
004E7521   C1EA04                 shr     edx, $04
004E7524   8945E8                 mov     [ebp-$18], eax
004E7527   8955EC                 mov     [ebp-$14], edx
004E752A   DF6DE8                 fild    qword ptr [ebp-$18]
004E752D   DD1E                   fstp    qword ptr [esi]
004E752F   9B                     wait
004E7530   E9E21E0000             jmp     004E9417
004E7535   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7537   E888B6F1FF             call    00402BC4
004E753C   81E040000000           and     eax, $00000040
004E7542   33D2                   xor     edx, edx
004E7544   0FACD006               shrd    eax, edx, $06
004E7548   C1EA06                 shr     edx, $06
004E754B   8945E8                 mov     [ebp-$18], eax
004E754E   8955EC                 mov     [ebp-$14], edx
004E7551   DF6DE8                 fild    qword ptr [ebp-$18]
004E7554   DD1E                   fstp    qword ptr [esi]
004E7556   9B                     wait
004E7557   E9BB1E0000             jmp     004E9417
004E755C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E755E   E861B6F1FF             call    00402BC4
004E7563   81E002000000           and     eax, $00000002
004E7569   33D2                   xor     edx, edx
004E756B   0FACD001               shrd    eax, edx, $01
004E756F   D1EA                   shr     edx, 1
004E7571   8945E8                 mov     [ebp-$18], eax
004E7574   8955EC                 mov     [ebp-$14], edx
004E7577   DF6DE8                 fild    qword ptr [ebp-$18]
004E757A   DD1E                   fstp    qword ptr [esi]
004E757C   9B                     wait
004E757D   E9951E0000             jmp     004E9417
004E7582   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7584   E83BB6F1FF             call    00402BC4
004E7589   81E004000000           and     eax, $00000004
004E758F   33D2                   xor     edx, edx
004E7591   0FACD002               shrd    eax, edx, $02
004E7595   C1EA02                 shr     edx, $02
004E7598   8945E8                 mov     [ebp-$18], eax
004E759B   8955EC                 mov     [ebp-$14], edx
004E759E   DF6DE8                 fild    qword ptr [ebp-$18]
004E75A1   DD1E                   fstp    qword ptr [esi]
004E75A3   9B                     wait
004E75A4   E96E1E0000             jmp     004E9417
004E75A9   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E75AF   DC3E                   fdivr   qword ptr [esi]
004E75B1   DD1E                   fstp    qword ptr [esi]
004E75B3   9B                     wait
004E75B4   E95E1E0000             jmp     004E9417
004E75B9   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E75BF   DC3E                   fdivr   qword ptr [esi]
004E75C1   DD1E                   fstp    qword ptr [esi]
004E75C3   9B                     wait
004E75C4   E94E1E0000             jmp     004E9417
004E75C9   8B06                   mov     eax, [esi]
004E75CB   8906                   mov     [esi], eax
004E75CD   8B4604                 mov     eax, [esi+$04]
004E75D0   894604                 mov     [esi+$04], eax
004E75D3   E93F1E0000             jmp     004E9417
004E75D8   8B06                   mov     eax, [esi]
004E75DA   8906                   mov     [esi], eax
004E75DC   8B4604                 mov     eax, [esi+$04]
004E75DF   894604                 mov     [esi+$04], eax
004E75E2   E9301E0000             jmp     004E9417
004E75E7   DD06                   fld     qword ptr [esi]
004E75E9   D825D4954E00           fsub    dword ptr [$004E95D4]
004E75EF   DD1E                   fstp    qword ptr [esi]
004E75F1   9B                     wait
004E75F2   E9201E0000             jmp     004E9417
004E75F7   DD06                   fld     qword ptr [esi]
004E75F9   D80DFC954E00           fmul    dword ptr [$004E95FC]
004E75FF   D83500964E00           fdiv    dword ptr [$004E9600]
004E7605   D8258C954E00           fsub    dword ptr [$004E958C]
004E760B   DD1E                   fstp    qword ptr [esi]
004E760D   9B                     wait
004E760E   E9041E0000             jmp     004E9417
004E7613   DD06                   fld     qword ptr [esi]
004E7615   D80D04964E00           fmul    dword ptr [$004E9604]
004E761B   D83500964E00           fdiv    dword ptr [$004E9600]
004E7621   D80554954E00           fadd    dword ptr [$004E9554]
004E7627   DD1E                   fstp    qword ptr [esi]
004E7629   9B                     wait
004E762A   E9E81D0000             jmp     004E9417
004E762F   DD06                   fld     qword ptr [esi]
004E7631   D83554954E00           fdiv    dword ptr [$004E9554]
004E7637   DD1E                   fstp    qword ptr [esi]
004E7639   9B                     wait
004E763A   E9D81D0000             jmp     004E9417
004E763F   8B06                   mov     eax, [esi]
004E7641   8906                   mov     [esi], eax
004E7643   8B4604                 mov     eax, [esi+$04]
004E7646   894604                 mov     [esi+$04], eax
004E7649   E9C91D0000             jmp     004E9417
004E764E   8B06                   mov     eax, [esi]
004E7650   8906                   mov     [esi], eax
004E7652   8B4604                 mov     eax, [esi+$04]
004E7655   894604                 mov     [esi+$04], eax
004E7658   E9BA1D0000             jmp     004E9417
004E765D   DB2D08964E00           fld     tbyte ptr [$004E9608]
004E7663   DC3E                   fdivr   qword ptr [esi]
004E7665   DD1E                   fstp    qword ptr [esi]
004E7667   9B                     wait
004E7668   E9AA1D0000             jmp     004E9417
004E766D   DD06                   fld     qword ptr [esi]
004E766F   D83514964E00           fdiv    dword ptr [$004E9614]
004E7675   DD1E                   fstp    qword ptr [esi]
004E7677   9B                     wait
004E7678   E99A1D0000             jmp     004E9417
004E767D   8B06                   mov     eax, [esi]
004E767F   8906                   mov     [esi], eax
004E7681   8B4604                 mov     eax, [esi+$04]
004E7684   894604                 mov     [esi+$04], eax
004E7687   E98B1D0000             jmp     004E9417
004E768C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E768E   E831B5F1FF             call    00402BC4
004E7693   81E010000000           and     eax, $00000010
004E7699   33D2                   xor     edx, edx
004E769B   0FACD004               shrd    eax, edx, $04
004E769F   C1EA04                 shr     edx, $04
004E76A2   8945E8                 mov     [ebp-$18], eax
004E76A5   8955EC                 mov     [ebp-$14], edx
004E76A8   DF6DE8                 fild    qword ptr [ebp-$18]
004E76AB   DD1E                   fstp    qword ptr [esi]
004E76AD   9B                     wait
004E76AE   E9641D0000             jmp     004E9417
004E76B3   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E76B5   E80AB5F1FF             call    00402BC4
004E76BA   81E020000000           and     eax, $00000020
004E76C0   33D2                   xor     edx, edx
004E76C2   0FACD005               shrd    eax, edx, $05
004E76C6   C1EA05                 shr     edx, $05
004E76C9   8945E8                 mov     [ebp-$18], eax
004E76CC   8955EC                 mov     [ebp-$14], edx
004E76CF   DF6DE8                 fild    qword ptr [ebp-$18]
004E76D2   DD1E                   fstp    qword ptr [esi]
004E76D4   9B                     wait
004E76D5   E93D1D0000             jmp     004E9417
004E76DA   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E76DC   E8E3B4F1FF             call    00402BC4
004E76E1   81E040000000           and     eax, $00000040
004E76E7   33D2                   xor     edx, edx
004E76E9   0FACD006               shrd    eax, edx, $06
004E76ED   C1EA06                 shr     edx, $06
004E76F0   8945E8                 mov     [ebp-$18], eax
004E76F3   8955EC                 mov     [ebp-$14], edx
004E76F6   DF6DE8                 fild    qword ptr [ebp-$18]
004E76F9   DD1E                   fstp    qword ptr [esi]
004E76FB   9B                     wait
004E76FC   E9161D0000             jmp     004E9417
004E7701   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7703   E8BCB4F1FF             call    00402BC4
004E7708   81E080000000           and     eax, $00000080
004E770E   33D2                   xor     edx, edx
004E7710   0FACD007               shrd    eax, edx, $07
004E7714   C1EA07                 shr     edx, $07
004E7717   8945E8                 mov     [ebp-$18], eax
004E771A   8955EC                 mov     [ebp-$14], edx
004E771D   DF6DE8                 fild    qword ptr [ebp-$18]
004E7720   DD1E                   fstp    qword ptr [esi]
004E7722   9B                     wait
004E7723   E9EF1C0000             jmp     004E9417
004E7728   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E772A   E895B4F1FF             call    00402BC4
004E772F   81E010000000           and     eax, $00000010
004E7735   33D2                   xor     edx, edx
004E7737   0FACD004               shrd    eax, edx, $04
004E773B   C1EA04                 shr     edx, $04
004E773E   8945E8                 mov     [ebp-$18], eax
004E7741   8955EC                 mov     [ebp-$14], edx
004E7744   DF6DE8                 fild    qword ptr [ebp-$18]
004E7747   DD1E                   fstp    qword ptr [esi]
004E7749   9B                     wait
004E774A   E9C81C0000             jmp     004E9417
004E774F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7751   E86EB4F1FF             call    00402BC4
004E7756   81E001000000           and     eax, $00000001
004E775C   33D2                   xor     edx, edx
004E775E   8945E8                 mov     [ebp-$18], eax
004E7761   8955EC                 mov     [ebp-$14], edx
004E7764   DF6DE8                 fild    qword ptr [ebp-$18]
004E7767   DD1E                   fstp    qword ptr [esi]
004E7769   9B                     wait
004E776A   E9A81C0000             jmp     004E9417
004E776F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7771   E84EB4F1FF             call    00402BC4
004E7776   81E002000000           and     eax, $00000002
004E777C   33D2                   xor     edx, edx
004E777E   0FACD001               shrd    eax, edx, $01
004E7782   D1EA                   shr     edx, 1
004E7784   8945E8                 mov     [ebp-$18], eax
004E7787   8955EC                 mov     [ebp-$14], edx
004E778A   DF6DE8                 fild    qword ptr [ebp-$18]
004E778D   DD1E                   fstp    qword ptr [esi]
004E778F   9B                     wait
004E7790   E9821C0000             jmp     004E9417
004E7795   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7797   E828B4F1FF             call    00402BC4
004E779C   81E004000000           and     eax, $00000004
004E77A2   33D2                   xor     edx, edx
004E77A4   0FACD002               shrd    eax, edx, $02
004E77A8   C1EA02                 shr     edx, $02
004E77AB   8945E8                 mov     [ebp-$18], eax
004E77AE   8955EC                 mov     [ebp-$14], edx
004E77B1   DF6DE8                 fild    qword ptr [ebp-$18]
004E77B4   DD1E                   fstp    qword ptr [esi]
004E77B6   9B                     wait
004E77B7   E95B1C0000             jmp     004E9417
004E77BC   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E77BE   E801B4F1FF             call    00402BC4
004E77C3   81E008000000           and     eax, $00000008
004E77C9   33D2                   xor     edx, edx
004E77CB   0FACD003               shrd    eax, edx, $03
004E77CF   C1EA03                 shr     edx, $03
004E77D2   8945E8                 mov     [ebp-$18], eax
004E77D5   8955EC                 mov     [ebp-$14], edx
004E77D8   DF6DE8                 fild    qword ptr [ebp-$18]
004E77DB   DD1E                   fstp    qword ptr [esi]
004E77DD   9B                     wait
004E77DE   E9341C0000             jmp     004E9417
004E77E3   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E77E5   E8DAB3F1FF             call    00402BC4
004E77EA   81E010000000           and     eax, $00000010
004E77F0   33D2                   xor     edx, edx
004E77F2   0FACD004               shrd    eax, edx, $04
004E77F6   C1EA04                 shr     edx, $04
004E77F9   8945E8                 mov     [ebp-$18], eax
004E77FC   8955EC                 mov     [ebp-$14], edx
004E77FF   DF6DE8                 fild    qword ptr [ebp-$18]
004E7802   DD1E                   fstp    qword ptr [esi]
004E7804   9B                     wait
004E7805   E90D1C0000             jmp     004E9417
004E780A   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E780C   E8B3B3F1FF             call    00402BC4
004E7811   81E001000000           and     eax, $00000001
004E7817   33D2                   xor     edx, edx
004E7819   0FACD000               shrd    eax, edx, $00
004E781D   C1EA00                 shr     edx, $00
004E7820   8945E8                 mov     [ebp-$18], eax
004E7823   8955EC                 mov     [ebp-$14], edx
004E7826   DF6DE8                 fild    qword ptr [ebp-$18]
004E7829   DD1E                   fstp    qword ptr [esi]
004E782B   9B                     wait
004E782C   E9E61B0000             jmp     004E9417
004E7831   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7833   E88CB3F1FF             call    00402BC4
004E7838   81E002000000           and     eax, $00000002
004E783E   33D2                   xor     edx, edx
004E7840   0FACD001               shrd    eax, edx, $01
004E7844   D1EA                   shr     edx, 1
004E7846   8945E8                 mov     [ebp-$18], eax
004E7849   8955EC                 mov     [ebp-$14], edx
004E784C   DF6DE8                 fild    qword ptr [ebp-$18]
004E784F   DD1E                   fstp    qword ptr [esi]
004E7851   9B                     wait
004E7852   E9C01B0000             jmp     004E9417
004E7857   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7859   E866B3F1FF             call    00402BC4
004E785E   81E008000000           and     eax, $00000008
004E7864   33D2                   xor     edx, edx
004E7866   0FACD003               shrd    eax, edx, $03
004E786A   C1EA03                 shr     edx, $03
004E786D   8945E8                 mov     [ebp-$18], eax
004E7870   8955EC                 mov     [ebp-$14], edx
004E7873   DF6DE8                 fild    qword ptr [ebp-$18]
004E7876   DD1E                   fstp    qword ptr [esi]
004E7878   9B                     wait
004E7879   E9991B0000             jmp     004E9417
004E787E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E7880   E83FB3F1FF             call    00402BC4
004E7885   81E040000000           and     eax, $00000040
004E788B   33D2                   xor     edx, edx
004E788D   0FACD006               shrd    eax, edx, $06
004E7891   C1EA06                 shr     edx, $06
004E7894   8945E8                 mov     [ebp-$18], eax
004E7897   8955EC                 mov     [ebp-$14], edx
004E789A   DF6DE8                 fild    qword ptr [ebp-$18]
004E789D   DD1E                   fstp    qword ptr [esi]
004E789F   9B                     wait
004E78A0   E9721B0000             jmp     004E9417
004E78A5   8B06                   mov     eax, [esi]
004E78A7   8906                   mov     [esi], eax
004E78A9   8B4604                 mov     eax, [esi+$04]
004E78AC   894604                 mov     [esi+$04], eax
004E78AF   E9631B0000             jmp     004E9417
004E78B4   DB2D18964E00           fld     tbyte ptr [$004E9618]
004E78BA   DC3E                   fdivr   qword ptr [esi]
004E78BC   DD1E                   fstp    qword ptr [esi]
004E78BE   9B                     wait
004E78BF   E9531B0000             jmp     004E9417
004E78C4   DD06                   fld     qword ptr [esi]
004E78C6   D825D4954E00           fsub    dword ptr [$004E95D4]
004E78CC   DD1E                   fstp    qword ptr [esi]
004E78CE   9B                     wait
004E78CF   E9431B0000             jmp     004E9417
004E78D4   DD06                   fld     qword ptr [esi]
004E78D6   D825D4954E00           fsub    dword ptr [$004E95D4]
004E78DC   DD1E                   fstp    qword ptr [esi]
004E78DE   9B                     wait
004E78DF   E9331B0000             jmp     004E9417
004E78E4   DB2D18964E00           fld     tbyte ptr [$004E9618]
004E78EA   DC3E                   fdivr   qword ptr [esi]
004E78EC   DD1E                   fstp    qword ptr [esi]
004E78EE   9B                     wait
004E78EF   E9231B0000             jmp     004E9417
004E78F4   8B06                   mov     eax, [esi]
004E78F6   8906                   mov     [esi], eax
004E78F8   8B4604                 mov     eax, [esi+$04]
004E78FB   894604                 mov     [esi+$04], eax
004E78FE   E9141B0000             jmp     004E9417
004E7903   8B06                   mov     eax, [esi]
004E7905   8906                   mov     [esi], eax
004E7907   8B4604                 mov     eax, [esi+$04]
004E790A   894604                 mov     [esi+$04], eax
004E790D   E9051B0000             jmp     004E9417
004E7912   8B06                   mov     eax, [esi]
004E7914   8906                   mov     [esi], eax
004E7916   8B4604                 mov     eax, [esi+$04]
004E7919   894604                 mov     [esi+$04], eax
004E791C   E9F61A0000             jmp     004E9417
004E7921   8B06                   mov     eax, [esi]
004E7923   8906                   mov     [esi], eax
004E7925   8B4604                 mov     eax, [esi+$04]
004E7928   894604                 mov     [esi+$04], eax
004E792B   E9E71A0000             jmp     004E9417
004E7930   8B06                   mov     eax, [esi]
004E7932   8906                   mov     [esi], eax
004E7934   8B4604                 mov     eax, [esi+$04]
004E7937   894604                 mov     [esi+$04], eax
004E793A   E9D81A0000             jmp     004E9417
004E793F   DD06                   fld     qword ptr [esi]
004E7941   D80DB8954E00           fmul    dword ptr [$004E95B8]
004E7947   D80524964E00           fadd    dword ptr [$004E9624]
004E794D   DD1E                   fstp    qword ptr [esi]
004E794F   9B                     wait
004E7950   E9C21A0000             jmp     004E9417
004E7955   DB2D18964E00           fld     tbyte ptr [$004E9618]
004E795B   DC3E                   fdivr   qword ptr [esi]
004E795D   DD1E                   fstp    qword ptr [esi]
004E795F   9B                     wait
004E7960   E9B21A0000             jmp     004E9417
004E7965   8B06                   mov     eax, [esi]
004E7967   8906                   mov     [esi], eax
004E7969   8B4604                 mov     eax, [esi+$04]
004E796C   894604                 mov     [esi+$04], eax
004E796F   E9A31A0000             jmp     004E9417
004E7974   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E797A   DC3E                   fdivr   qword ptr [esi]
004E797C   DD1E                   fstp    qword ptr [esi]
004E797E   9B                     wait
004E797F   E9931A0000             jmp     004E9417
004E7984   DD06                   fld     qword ptr [esi]
004E7986   D83528964E00           fdiv    dword ptr [$004E9628]
004E798C   D80DB0954E00           fmul    dword ptr [$004E95B0]
004E7992   DD1E                   fstp    qword ptr [esi]
004E7994   9B                     wait
004E7995   E97D1A0000             jmp     004E9417
004E799A   DB2DD8954E00           fld     tbyte ptr [$004E95D8]
004E79A0   DC3E                   fdivr   qword ptr [esi]
004E79A2   DD1E                   fstp    qword ptr [esi]
004E79A4   9B                     wait
004E79A5   E96D1A0000             jmp     004E9417
004E79AA   DD06                   fld     qword ptr [esi]
004E79AC   D83528964E00           fdiv    dword ptr [$004E9628]
004E79B2   D80DB0954E00           fmul    dword ptr [$004E95B0]
004E79B8   DD1E                   fstp    qword ptr [esi]
004E79BA   9B                     wait
004E79BB   E9571A0000             jmp     004E9417
004E79C0   8B06                   mov     eax, [esi]
004E79C2   8906                   mov     [esi], eax
004E79C4   8B4604                 mov     eax, [esi+$04]
004E79C7   894604                 mov     [esi+$04], eax
004E79CA   E9481A0000             jmp     004E9417

* Reference to TOptionsForm instance
|
004E79CF   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E79D4   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E79D6   8B8018030000           mov     eax, [eax+$0318]
004E79DC   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E79DE   FF92CC000000           call    dword ptr [edx+$00CC]
004E79E4   8945F4                 mov     [ebp-$0C], eax
004E79E7   DB45F4                 fild    dword ptr [ebp-$0C]
004E79EA   D83554954E00           fdiv    dword ptr [$004E9554]
004E79F0   D805B4954E00           fadd    dword ptr [$004E95B4]
004E79F6   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E79FD   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7A03   DC8CC208010000         fmul    qword ptr [edx+eax*8+$0108]
004E7A0A   D80D84954E00           fmul    dword ptr [$004E9584]
004E7A10   D80DBC954E00           fmul    dword ptr [$004E95BC]
004E7A16   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7A1D   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7A23   DD44C248               fld     qword ptr [edx+eax*8+$48]
004E7A27   D83588954E00           fdiv    dword ptr [$004E9588]
004E7A2D   DEC9                   fmulp   st(1), st(0)
004E7A2F   D835C0954E00           fdiv    dword ptr [$004E95C0]
004E7A35   DD1E                   fstp    qword ptr [esi]
004E7A37   9B                     wait
004E7A38   E9DA190000             jmp     004E9417
004E7A3D   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7A44   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7A49   DD44D010               fld     qword ptr [eax+edx*8+$10]
004E7A4D   D81D64954E00           fcomp   dword ptr [$004E9564]
004E7A53   DFE0                   fstsw   ax
004E7A55   9E                     sahf
004E7A56   7661                   jbe     004E7AB9
004E7A58   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7A5F   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E7A65   DD44C110               fld     qword ptr [ecx+eax*8+$10]
004E7A69   D81DC4954E00           fcomp   dword ptr [$004E95C4]
004E7A6F   DFE0                   fstsw   ax
004E7A71   9E                     sahf
004E7A72   731A                   jnb     004E7A8E
004E7A74   D90554954E00           fld     dword ptr [$004E9554]
004E7A7A   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7A7F   DC8CD018020000         fmul    qword ptr [eax+edx*8+$0218]
004E7A86   DD1E                   fstp    qword ptr [esi]
004E7A88   9B                     wait
004E7A89   E989190000             jmp     004E9417
004E7A8E   D9058C954E00           fld     dword ptr [$004E958C]
004E7A94   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7A99   DC8CD018020000         fmul    qword ptr [eax+edx*8+$0218]
004E7AA0   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7AA7   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7AAD   DC74C210               fdiv    qword ptr [edx+eax*8+$10]
004E7AB1   DD1E                   fstp    qword ptr [esi]
004E7AB3   9B                     wait
004E7AB4   E95E190000             jmp     004E9417
004E7AB9   33C0                   xor     eax, eax
004E7ABB   8906                   mov     [esi], eax
004E7ABD   894604                 mov     [esi+$04], eax
004E7AC0   E952190000             jmp     004E9417
004E7AC5   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E7ACC   7543                   jnz     004E7B11
004E7ACE   33C0                   xor     eax, eax
004E7AD0   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E7AD5   69C080EE3600           imul    eax, eax, $0036EE80
004E7ADB   33D2                   xor     edx, edx
004E7ADD   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7AE3   69D260EA0000           imul    edx, edx, $0000EA60
004E7AE9   03C2                   add     eax, edx
004E7AEB   33D2                   xor     edx, edx
004E7AED   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E7AF3   69D2E8030000           imul    edx, edx, $000003E8
004E7AF9   03C2                   add     eax, edx
004E7AFB   33D2                   xor     edx, edx
004E7AFD   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E7B03   03D2                   add     edx, edx
004E7B05   8D1492                 lea     edx, [edx+edx*4]
004E7B08   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E7B0A   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7B0F   EB0A                   jmp     004E7B1B
004E7B11   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E7B16   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E7B1B   33C0                   xor     eax, eax
004E7B1D   A0346E4F00             mov     al, byte ptr [$004F6E34]
004E7B22   69C080EE3600           imul    eax, eax, $0036EE80
004E7B28   33D2                   xor     edx, edx
004E7B2A   8A15356E4F00           mov     dl, byte ptr [$004F6E35]
004E7B30   69D260EA0000           imul    edx, edx, $0000EA60
004E7B36   03C2                   add     eax, edx
004E7B38   33D2                   xor     edx, edx
004E7B3A   8A15366E4F00           mov     dl, byte ptr [$004F6E36]
004E7B40   69D2E8030000           imul    edx, edx, $000003E8
004E7B46   03C2                   add     eax, edx
004E7B48   33D2                   xor     edx, edx
004E7B4A   8A15376E4F00           mov     dl, byte ptr [$004F6E37]
004E7B50   03D2                   add     edx, edx
004E7B52   8D1492                 lea     edx, [edx+edx*4]
004E7B55   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E7B57   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E7B5C   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E7B61   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E7B67   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E7B6C   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7B73   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7B79   DD84C218020000         fld     qword ptr [edx+eax*8+$0218]
004E7B80   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E7B86   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7B8C   DEC9                   fmulp   st(1), st(0)
004E7B8E   DD1E                   fstp    qword ptr [esi]
004E7B90   9B                     wait
004E7B91   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E7B97   DC06                   fadd    qword ptr [esi]
004E7B99   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E7B9F   9B                     wait
004E7BA0   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E7BA6   8906                   mov     [esi], eax
004E7BA8   8B05E06D4F00           mov     eax, [$004F6DE0]
004E7BAE   894604                 mov     [esi+$04], eax
004E7BB1   E961180000             jmp     004E9417
004E7BB6   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7BBD   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7BC3   DD44C210               fld     qword ptr [edx+eax*8+$10]
004E7BC7   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E7BCD   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E7BD3   DEC9                   fmulp   st(1), st(0)
004E7BD5   DD1E                   fstp    qword ptr [esi]
004E7BD7   9B                     wait
004E7BD8   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E7BDE   DC06                   fadd    qword ptr [esi]
004E7BE0   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E7BE6   9B                     wait
004E7BE7   8B05E46D4F00           mov     eax, [$004F6DE4]
004E7BED   8906                   mov     [esi], eax
004E7BEF   8B05E86D4F00           mov     eax, [$004F6DE8]
004E7BF5   894604                 mov     [esi+$04], eax
004E7BF8   E91A180000             jmp     004E9417
004E7BFD   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7C04   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7C09   DD84D030020000         fld     qword ptr [eax+edx*8+$0230]
004E7C10   D81DCC954E00           fcomp   dword ptr [$004E95CC]
004E7C16   DFE0                   fstsw   ax
004E7C18   9E                     sahf
004E7C19   0F86F8170000           jbe     004E9417
004E7C1F   D9058C954E00           fld     dword ptr [$004E958C]
004E7C25   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7C2A   DC8CD028020000         fmul    qword ptr [eax+edx*8+$0228]
004E7C31   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7C38   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7C3E   DCB4C230020000         fdiv    qword ptr [edx+eax*8+$0230]
004E7C45   DD1E                   fstp    qword ptr [esi]
004E7C47   9B                     wait
004E7C48   E9CA170000             jmp     004E9417
004E7C4D   83FF33                 cmp     edi, +$33
004E7C50   0F87C1170000           jnbe    004E9417
004E7C56   0FB6BF647C4E00         movzx   edi, byte ptr [edi+$4E7C64]
004E7C5D   FF24BD987C4E00         jmp     dword ptr [$4E7C98+edi*4]
004E7C64   0001                   add     [ecx], al
004E7C66   0102                   add     [edx], eax
004E7C68   030404                 add     eax, [esp+eax]
004E7C6B   030506070809           add     eax, [$09080706]
004E7C71   0A02                   or      al, byte ptr [edx]
004E7C73   020B                   add     cl, byte ptr [ebx]
004E7C75   0C03                   or      al, $03
004E7C77   0303                   add     eax, [ebx]
004E7C79   0303                   add     eax, [ebx]
004E7C7B   0303                   add     eax, [ebx]
004E7C7D   0311                   add     edx, [ecx]
004E7C7F   0E                     push    cs
004E7C80   0E                     push    cs
004E7C81   0303                   add     eax, [ebx]
004E7C83   0D0D0D0D0F             or      eax, $0F0D0D0D
004E7C88   0F0F                   DB  $0F, $0F  //
004E7C8A   1002                   adc     [edx], al
004E7C8C   0211                   add     dl, byte ptr [ecx]
004E7C8E   1111                   adc     [ecx], edx
004E7C90   1111                   adc     [ecx], edx
004E7C92   1112                   adc     [edx], edx
004E7C94   1314151617944E         adc     edx, [$4E941716+edx]
004E7C9B   00F4                   add     ah, dh
004E7C9D   7C4E                   jl      004E7CED
004E7C9F   000A                   add     [edx], cl
004E7CA1   7D4E                   jnl     004E7CF1
004E7CA3   001A                   add     [edx], bl
004E7CA5   7D4E                   jnl     004E7CF5
004E7CA7   0029                   add     [ecx], ch
004E7CA9   7D4E                   jnl     004E7CF9
004E7CAB   0039                   add     [ecx], bh
004E7CAD   7D4E                   jnl     004E7CFD
004E7CAF   00517D                 add     [ecx+$7D], dl
004E7CB2   4E                     dec     esi
004E7CB3   00617D                 add     [ecx+$7D], ah
004E7CB6   4E                     dec     esi
004E7CB7   008A7D4E00B3           add     [edx+$B3004E7D], cl
004E7CBD   7D4E                   jnl     004E7D0D
004E7CBF   00C3                   add     bl, al
004E7CC1   7D4E                   jnl     004E7D11
004E7CC3   00F6                   add     dh, dh
004E7CC5   7D4E                   jnl     004E7D15
004E7CC7   0022                   add     [edx], ah
004E7CC9   7E4E                   jle     004E7D19
004E7CCB   005D7E                 add     [ebp+$7E], bl
004E7CCE   4E                     dec     esi
004E7CCF   00907E4E00A0           add     [eax+$A0004E7E], dl
004E7CD5   7E4E                   jle     004E7D25
004E7CD7   00B67E4E00CC           add     [esi+$CC004E7E], dh
004E7CDD   7E4E                   jle     004E7D2D
004E7CDF   00DC                   add     ah, bl
004E7CE1   7E4E                   jle     004E7D31
004E7CE3   00747F4E               add     [edi+edi*2+$4E], dh
004E7CE7   00FC                   add     ah, bh
004E7CE9   7F4E                   jnle    004E7D39
004E7CEB   00ED                   add     ch, ch
004E7CED   804E0034               or      byte ptr [esi+$00], $34
004E7CF1   814E00DD06D825         or      dword ptr [esi+$00], $25D806DD
004E7CF8   38954E00D80D           cmp     [ebp+$DD8004E], dl
004E7CFE   3C95                   cmp     al, $95
004E7D00   4E                     dec     esi
004E7D01   00DD                   add     ch, bl
004E7D03   1E                     push    ds
004E7D04   9B                     wait
004E7D05   E90D170000             jmp     004E9417
004E7D0A   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E7D10   DC3E                   fdivr   qword ptr [esi]
004E7D12   DD1E                   fstp    qword ptr [esi]
004E7D14   9B                     wait
004E7D15   E9FD160000             jmp     004E9417
004E7D1A   8B06                   mov     eax, [esi]
004E7D1C   8906                   mov     [esi], eax
004E7D1E   8B4604                 mov     eax, [esi+$04]
004E7D21   894604                 mov     [esi+$04], eax
004E7D24   E9EE160000             jmp     004E9417
004E7D29   DD06                   fld     qword ptr [esi]
004E7D2B   D8354C954E00           fdiv    dword ptr [$004E954C]
004E7D31   DD1E                   fstp    qword ptr [esi]
004E7D33   9B                     wait
004E7D34   E9DE160000             jmp     004E9417
004E7D39   DD06                   fld     qword ptr [esi]
004E7D3B   D83550954E00           fdiv    dword ptr [$004E9550]
004E7D41   DC06                   fadd    qword ptr [esi]
004E7D43   D83554954E00           fdiv    dword ptr [$004E9554]
004E7D49   DD1E                   fstp    qword ptr [esi]
004E7D4B   9B                     wait
004E7D4C   E9C6160000             jmp     004E9417
004E7D51   DB2D58954E00           fld     tbyte ptr [$004E9558]
004E7D57   DC0E                   fmul    qword ptr [esi]
004E7D59   DD1E                   fstp    qword ptr [esi]
004E7D5B   9B                     wait
004E7D5C   E9B6160000             jmp     004E9417
004E7D61   DD06                   fld     qword ptr [esi]
004E7D63   D81D64954E00           fcomp   dword ptr [$004E9564]
004E7D69   DFE0                   fstsw   ax
004E7D6B   9E                     sahf
004E7D6C   7610                   jbe     004E7D7E
004E7D6E   DB2D68954E00           fld     tbyte ptr [$004E9568]
004E7D74   DC3E                   fdivr   qword ptr [esi]
004E7D76   DD1E                   fstp    qword ptr [esi]
004E7D78   9B                     wait
004E7D79   E999160000             jmp     004E9417
004E7D7E   33C0                   xor     eax, eax
004E7D80   8906                   mov     [esi], eax
004E7D82   894604                 mov     [esi+$04], eax
004E7D85   E98D160000             jmp     004E9417
004E7D8A   DD06                   fld     qword ptr [esi]
004E7D8C   D81D64954E00           fcomp   dword ptr [$004E9564]
004E7D92   DFE0                   fstsw   ax
004E7D94   9E                     sahf
004E7D95   7610                   jbe     004E7DA7
004E7D97   DD06                   fld     qword ptr [esi]
004E7D99   D83574954E00           fdiv    dword ptr [$004E9574]
004E7D9F   DD1E                   fstp    qword ptr [esi]
004E7DA1   9B                     wait
004E7DA2   E970160000             jmp     004E9417
004E7DA7   33C0                   xor     eax, eax
004E7DA9   8906                   mov     [esi], eax
004E7DAB   894604                 mov     [esi+$04], eax
004E7DAE   E964160000             jmp     004E9417
004E7DB3   DD06                   fld     qword ptr [esi]
004E7DB5   D83578954E00           fdiv    dword ptr [$004E9578]
004E7DBB   DD1E                   fstp    qword ptr [esi]
004E7DBD   9B                     wait
004E7DBE   E954160000             jmp     004E9417
004E7DC3   DD06                   fld     qword ptr [esi]
004E7DC5   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E7DCB   DFE0                   fstsw   ax
004E7DCD   9E                     sahf
004E7DCE   7310                   jnb     004E7DE0
004E7DD0   DD06                   fld     qword ptr [esi]
004E7DD2   D83574954E00           fdiv    dword ptr [$004E9574]
004E7DD8   DD1E                   fstp    qword ptr [esi]
004E7DDA   9B                     wait
004E7DDB   E937160000             jmp     004E9417
004E7DE0   DD06                   fld     qword ptr [esi]
004E7DE2   D83574954E00           fdiv    dword ptr [$004E9574]
004E7DE8   D82580954E00           fsub    dword ptr [$004E9580]
004E7DEE   DD1E                   fstp    qword ptr [esi]
004E7DF0   9B                     wait
004E7DF1   E921160000             jmp     004E9417
004E7DF6   DD06                   fld     qword ptr [esi]
004E7DF8   D81D84954E00           fcomp   dword ptr [$004E9584]
004E7DFE   DFE0                   fstsw   ax
004E7E00   9E                     sahf
004E7E01   7610                   jbe     004E7E13
004E7E03   DD06                   fld     qword ptr [esi]
004E7E05   D82588954E00           fsub    dword ptr [$004E9588]
004E7E0B   DD1E                   fstp    qword ptr [esi]
004E7E0D   9B                     wait
004E7E0E   E904160000             jmp     004E9417
004E7E13   8B06                   mov     eax, [esi]
004E7E15   8906                   mov     [esi], eax
004E7E17   8B4604                 mov     eax, [esi+$04]
004E7E1A   894604                 mov     [esi+$04], eax
004E7E1D   E9F5150000             jmp     004E9417
004E7E22   8D55E4                 lea     edx, [ebp-$1C]

* Reference to TOptionsForm instance
|
004E7E25   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E7E2A   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.MaskEdit : TMaskEdit
|
004E7E2C   8B8034030000           mov     eax, [eax+$0334]

* Reference to: Mask.TCustomMaskEdit.GetText(TCustomMaskEdit):TMaskedText;
|
004E7E32   E8E5B8F9FF             call    0048371C
004E7E37   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004E7E3A   E8BD13F2FF             call    004091FC
004E7E3F   8945F4                 mov     [ebp-$0C], eax
004E7E42   DB45F4                 fild    dword ptr [ebp-$0C]
004E7E45   D8358C954E00           fdiv    dword ptr [$004E958C]
004E7E4B   DC0E                   fmul    qword ptr [esi]
004E7E4D   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E7E53   DEF9                   fdivp   st(1), st(0)
004E7E55   DD1E                   fstp    qword ptr [esi]
004E7E57   9B                     wait
004E7E58   E9BA150000             jmp     004E9417
004E7E5D   DD06                   fld     qword ptr [esi]
004E7E5F   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E7E65   DFE0                   fstsw   ax
004E7E67   9E                     sahf
004E7E68   7310                   jnb     004E7E7A
004E7E6A   DD06                   fld     qword ptr [esi]
004E7E6C   D83590954E00           fdiv    dword ptr [$004E9590]
004E7E72   DD1E                   fstp    qword ptr [esi]
004E7E74   9B                     wait
004E7E75   E99D150000             jmp     004E9417
004E7E7A   DD06                   fld     qword ptr [esi]
004E7E7C   D83590954E00           fdiv    dword ptr [$004E9590]
004E7E82   D8258C954E00           fsub    dword ptr [$004E958C]
004E7E88   DD1E                   fstp    qword ptr [esi]
004E7E8A   9B                     wait
004E7E8B   E987150000             jmp     004E9417
004E7E90   DB2D94954E00           fld     tbyte ptr [$004E9594]
004E7E96   DC3E                   fdivr   qword ptr [esi]
004E7E98   DD1E                   fstp    qword ptr [esi]
004E7E9A   9B                     wait
004E7E9B   E977150000             jmp     004E9417
004E7EA0   DD06                   fld     qword ptr [esi]
004E7EA2   D80DA0954E00           fmul    dword ptr [$004E95A0]
004E7EA8   D82DA4954E00           fsubr   dword ptr [$004E95A4]
004E7EAE   DD1E                   fstp    qword ptr [esi]
004E7EB0   9B                     wait
004E7EB1   E961150000             jmp     004E9417
004E7EB6   DD06                   fld     qword ptr [esi]
004E7EB8   D80DA0954E00           fmul    dword ptr [$004E95A0]
004E7EBE   D825A8954E00           fsub    dword ptr [$004E95A8]
004E7EC4   DD1E                   fstp    qword ptr [esi]
004E7EC6   9B                     wait
004E7EC7   E94B150000             jmp     004E9417
004E7ECC   DD06                   fld     qword ptr [esi]
004E7ECE   D835AC954E00           fdiv    dword ptr [$004E95AC]
004E7ED4   DD1E                   fstp    qword ptr [esi]
004E7ED6   9B                     wait
004E7ED7   E93B150000             jmp     004E9417
004E7EDC   6B3DC86D4F004C         imul    edi, [$004F6DC8], $4C
004E7EE3   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7EE8   DD84F898000000         fld     qword ptr [eax+edi*8+$0098]
004E7EEF   D81DB0954E00           fcomp   dword ptr [$004E95B0]
004E7EF5   DFE0                   fstsw   ax
004E7EF7   9E                     sahf
004E7EF8   746E                   jz      004E7F68

* Reference to TOptionsForm instance
|
004E7EFA   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E7EFF   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E7F01   8B8018030000           mov     eax, [eax+$0318]
004E7F07   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E7F09   FF92CC000000           call    dword ptr [edx+$00CC]
004E7F0F   8945F4                 mov     [ebp-$0C], eax
004E7F12   DB45F4                 fild    dword ptr [ebp-$0C]
004E7F15   D83554954E00           fdiv    dword ptr [$004E9554]
004E7F1B   D805B4954E00           fadd    dword ptr [$004E95B4]
004E7F21   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7F26   DD44F858               fld     qword ptr [eax+edi*8+$58]
004E7F2A   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7F2F   DC44F868               fadd    qword ptr [eax+edi*8+$68]
004E7F33   DEC9                   fmulp   st(1), st(0)
004E7F35   D80DB8954E00           fmul    dword ptr [$004E95B8]
004E7F3B   D80DBC954E00           fmul    dword ptr [$004E95BC]
004E7F41   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7F48   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7F4E   DD44C220               fld     qword ptr [edx+eax*8+$20]
004E7F52   D83588954E00           fdiv    dword ptr [$004E9588]
004E7F58   DEC9                   fmulp   st(1), st(0)
004E7F5A   D835C0954E00           fdiv    dword ptr [$004E95C0]
004E7F60   DD1E                   fstp    qword ptr [esi]
004E7F62   9B                     wait
004E7F63   E9AF140000             jmp     004E9417
004E7F68   33C0                   xor     eax, eax
004E7F6A   8906                   mov     [esi], eax
004E7F6C   894604                 mov     [esi+$04], eax
004E7F6F   E9A3140000             jmp     004E9417
004E7F74   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E7F7B   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7F80   DD44D038               fld     qword ptr [eax+edx*8+$38]
004E7F84   D81D64954E00           fcomp   dword ptr [$004E9564]
004E7F8A   DFE0                   fstsw   ax
004E7F8C   9E                     sahf
004E7F8D   7661                   jbe     004E7FF0
004E7F8F   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7F96   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E7F9C   DD44C138               fld     qword ptr [ecx+eax*8+$38]
004E7FA0   D81DC4954E00           fcomp   dword ptr [$004E95C4]
004E7FA6   DFE0                   fstsw   ax
004E7FA8   9E                     sahf
004E7FA9   731A                   jnb     004E7FC5
004E7FAB   D90554954E00           fld     dword ptr [$004E9554]
004E7FB1   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7FB6   DC8CD078010000         fmul    qword ptr [eax+edx*8+$0178]
004E7FBD   DD1E                   fstp    qword ptr [esi]
004E7FBF   9B                     wait
004E7FC0   E952140000             jmp     004E9417
004E7FC5   D9058C954E00           fld     dword ptr [$004E958C]
004E7FCB   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E7FD0   DC8CD078010000         fmul    qword ptr [eax+edx*8+$0178]
004E7FD7   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E7FDE   8B15F86E4F00           mov     edx, [$004F6EF8]
004E7FE4   DC74C238               fdiv    qword ptr [edx+eax*8+$38]
004E7FE8   DD1E                   fstp    qword ptr [esi]
004E7FEA   9B                     wait
004E7FEB   E927140000             jmp     004E9417
004E7FF0   33C0                   xor     eax, eax
004E7FF2   8906                   mov     [esi], eax
004E7FF4   894604                 mov     [esi+$04], eax
004E7FF7   E91B140000             jmp     004E9417
004E7FFC   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E8003   7543                   jnz     004E8048
004E8005   33C0                   xor     eax, eax
004E8007   A0486E4F00             mov     al, byte ptr [$004F6E48]
004E800C   69C080EE3600           imul    eax, eax, $0036EE80
004E8012   33D2                   xor     edx, edx
004E8014   8A15496E4F00           mov     dl, byte ptr [$004F6E49]
004E801A   69D260EA0000           imul    edx, edx, $0000EA60
004E8020   03C2                   add     eax, edx
004E8022   33D2                   xor     edx, edx
004E8024   8A154A6E4F00           mov     dl, byte ptr [$004F6E4A]
004E802A   69D2E8030000           imul    edx, edx, $000003E8
004E8030   03C2                   add     eax, edx
004E8032   33D2                   xor     edx, edx
004E8034   8A154B6E4F00           mov     dl, byte ptr [$004F6E4B]
004E803A   03D2                   add     edx, edx
004E803C   8D1492                 lea     edx, [edx+edx*4]
004E803F   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E8041   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E8046   EB0A                   jmp     004E8052
004E8048   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E804D   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E8052   33C0                   xor     eax, eax
004E8054   A0486E4F00             mov     al, byte ptr [$004F6E48]
004E8059   69C080EE3600           imul    eax, eax, $0036EE80
004E805F   33D2                   xor     edx, edx
004E8061   8A15496E4F00           mov     dl, byte ptr [$004F6E49]
004E8067   69D260EA0000           imul    edx, edx, $0000EA60
004E806D   03C2                   add     eax, edx
004E806F   33D2                   xor     edx, edx
004E8071   8A154A6E4F00           mov     dl, byte ptr [$004F6E4A]
004E8077   69D2E8030000           imul    edx, edx, $000003E8
004E807D   03C2                   add     eax, edx
004E807F   33D2                   xor     edx, edx
004E8081   8A154B6E4F00           mov     dl, byte ptr [$004F6E4B]
004E8087   03D2                   add     edx, edx
004E8089   8D1492                 lea     edx, [edx+edx*4]
004E808C   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E808E   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E8093   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E8098   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E809E   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E80A3   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E80AA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E80B0   DD84C278010000         fld     qword ptr [edx+eax*8+$0178]
004E80B7   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E80BD   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E80C3   DEC9                   fmulp   st(1), st(0)
004E80C5   DD1E                   fstp    qword ptr [esi]
004E80C7   9B                     wait
004E80C8   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E80CE   DC06                   fadd    qword ptr [esi]
004E80D0   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E80D6   9B                     wait
004E80D7   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E80DD   8906                   mov     [esi], eax
004E80DF   8B05E06D4F00           mov     eax, [$004F6DE0]
004E80E5   894604                 mov     [esi+$04], eax
004E80E8   E92A130000             jmp     004E9417
004E80ED   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E80F4   8B15F86E4F00           mov     edx, [$004F6EF8]
004E80FA   DD44C238               fld     qword ptr [edx+eax*8+$38]
004E80FE   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E8104   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E810A   DEC9                   fmulp   st(1), st(0)
004E810C   DD1E                   fstp    qword ptr [esi]
004E810E   9B                     wait
004E810F   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E8115   DC06                   fadd    qword ptr [esi]
004E8117   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E811D   9B                     wait
004E811E   8B05E46D4F00           mov     eax, [$004F6DE4]
004E8124   8906                   mov     [esi], eax
004E8126   8B05E86D4F00           mov     eax, [$004F6DE8]
004E812C   894604                 mov     [esi+$04], eax
004E812F   E9E3120000             jmp     004E9417
004E8134   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E813B   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8140   DD84D090010000         fld     qword ptr [eax+edx*8+$0190]
004E8147   D81DCC954E00           fcomp   dword ptr [$004E95CC]
004E814D   DFE0                   fstsw   ax
004E814F   9E                     sahf
004E8150   0F86C1120000           jbe     004E9417
004E8156   D9058C954E00           fld     dword ptr [$004E958C]
004E815C   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8161   DC8CD088010000         fmul    qword ptr [eax+edx*8+$0188]
004E8168   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E816F   8B15F86E4F00           mov     edx, [$004F6EF8]
004E8175   DCB4C290010000         fdiv    qword ptr [edx+eax*8+$0190]
004E817C   DD1E                   fstp    qword ptr [esi]
004E817E   9B                     wait
004E817F   E993120000             jmp     004E9417
004E8184   83FF3F                 cmp     edi, +$3F
004E8187   0F878A120000           jnbe    004E9417
004E818D   0FB6BF9B814E00         movzx   edi, byte ptr [edi+$4E819B]
004E8194   FF24BDDB814E00         jmp     dword ptr [$4E81DB+edi*4]
004E819B   0001                   add     [ecx], al
004E819D   0203                   add     al, byte ptr [ebx]
004E819F   03040506030407         add     eax, [$7040306+eax]
004E81A6   06                     push    es
004E81A7   07                     pop     es
004E81A8   0202                   add     al, byte ptr [edx]
004E81AA   0308                   add     ecx, [eax]
004E81AC   090A                   or      [edx], ecx
004E81AE   0B0C0D0D0D0E0C         or      ecx, [$C0E0D0D+ecx]
004E81B5   0F10                   DB  $0F, $10  //
004E81B7   1111                   adc     [ecx], edx
004E81B9   1213                   adc     dl, byte ptr [ebx]
004E81BB   1415                   adc     al, $15
004E81BD   1514141614             adc     eax, $14161414
004E81C2   1414                   adc     al, $14
004E81C4   0C17                   or      al, $17
004E81C6   17                     pop     ss
004E81C7   17                     pop     ss
004E81C8   1817                   sbb     [edi], dl
004E81CA   0C0C                   or      al, $0C
004E81CC   0C0C                   or      al, $0C
004E81CE   0C0C                   or      al, $0C
004E81D0   0C0C                   or      al, $0C
004E81D2   0C0C                   or      al, $0C
004E81D4   0C0C                   or      al, $0C
004E81D6   191A                   sbb     [edx], ebx
004E81D8   1B1C1D17944E00         sbb     ebx, [$4E9417+ebx]
004E81DF   53                     push    ebx
004E81E0   824E0062               or      dword ptr [esi+$00], $62
004E81E4   824E0089               or      dword ptr [esi+$00], $89
004E81E8   824E00AF               or      dword ptr [esi+$00], $AF
004E81EC   824E00D6               or      dword ptr [esi+$00], $D6
004E81F0   824E00FD               or      dword ptr [esi+$00], $FD
004E81F4   824E0024               or      dword ptr [esi+$00], $24
004E81F8   834E004B               or      dword ptr [esi+$00], +$4B
004E81FC   834E0072               or      dword ptr [esi+$00], +$72
004E8200   834E0082               or      dword ptr [esi+$00], -$7E
004E8204   834E0092               or      dword ptr [esi+$00], -$6E
004E8208   834E00A2               or      dword ptr [esi+$00], -$5E
004E820C   834E00B1               or      dword ptr [esi+$00], -$4F
004E8210   834E00C1               or      dword ptr [esi+$00], -$3F
004E8214   834E00D7               or      dword ptr [esi+$00], -$29
004E8218   834E00E7               or      dword ptr [esi+$00], -$19
004E821C   834E00F7               or      dword ptr [esi+$00], -$09
004E8220   834E000F               or      dword ptr [esi+$00], +$0F
004E8224   844E00                 test    [esi+$00], cl
004E8227   1F                     pop     ds
004E8228   844E00                 test    [esi+$00], cl
004E822B   35844E0045             xor     eax, $45004E84
004E8230   844E00                 test    [esi+$00], cl
004E8233   55                     push    ebp
004E8234   844E00                 test    [esi+$00], cl
004E8237   65844E00               test    gs:[esi+$00], cl
004E823B   7584                   jnz     004E81C1
004E823D   4E                     dec     esi
004E823E   0085844E00F6           add     [ebp+$F6004E84], al
004E8244   844E00                 test    [esi+$00], cl
004E8247   87854E007886           xchg    [ebp+$8678004E], eax
004E824D   4E                     dec     esi
004E824E   00C2                   add     dl, al
004E8250   864E00                 xchg    [esi+$00], cl
004E8253   8B06                   mov     eax, [esi]
004E8255   8906                   mov     [esi], eax
004E8257   8B4604                 mov     eax, [esi+$04]
004E825A   894604                 mov     [esi+$04], eax
004E825D   E9B5110000             jmp     004E9417
004E8262   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8264   E85BA9F1FF             call    00402BC4
004E8269   81E001000000           and     eax, $00000001
004E826F   33D2                   xor     edx, edx
004E8271   0FACD000               shrd    eax, edx, $00
004E8275   C1EA00                 shr     edx, $00
004E8278   8945E8                 mov     [ebp-$18], eax
004E827B   8955EC                 mov     [ebp-$14], edx
004E827E   DF6DE8                 fild    qword ptr [ebp-$18]
004E8281   DD1E                   fstp    qword ptr [esi]
004E8283   9B                     wait
004E8284   E98E110000             jmp     004E9417
004E8289   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E828B   E834A9F1FF             call    00402BC4
004E8290   81E002000000           and     eax, $00000002
004E8296   33D2                   xor     edx, edx
004E8298   0FACD001               shrd    eax, edx, $01
004E829C   D1EA                   shr     edx, 1
004E829E   8945E8                 mov     [ebp-$18], eax
004E82A1   8955EC                 mov     [ebp-$14], edx
004E82A4   DF6DE8                 fild    qword ptr [ebp-$18]
004E82A7   DD1E                   fstp    qword ptr [esi]
004E82A9   9B                     wait
004E82AA   E968110000             jmp     004E9417
004E82AF   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E82B1   E80EA9F1FF             call    00402BC4
004E82B6   81E004000000           and     eax, $00000004
004E82BC   33D2                   xor     edx, edx
004E82BE   0FACD002               shrd    eax, edx, $02
004E82C2   C1EA02                 shr     edx, $02
004E82C5   8945E8                 mov     [ebp-$18], eax
004E82C8   8955EC                 mov     [ebp-$14], edx
004E82CB   DF6DE8                 fild    qword ptr [ebp-$18]
004E82CE   DD1E                   fstp    qword ptr [esi]
004E82D0   9B                     wait
004E82D1   E941110000             jmp     004E9417
004E82D6   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E82D8   E8E7A8F1FF             call    00402BC4
004E82DD   81E008000000           and     eax, $00000008
004E82E3   33D2                   xor     edx, edx
004E82E5   0FACD003               shrd    eax, edx, $03
004E82E9   C1EA03                 shr     edx, $03
004E82EC   8945E8                 mov     [ebp-$18], eax
004E82EF   8955EC                 mov     [ebp-$14], edx
004E82F2   DF6DE8                 fild    qword ptr [ebp-$18]
004E82F5   DD1E                   fstp    qword ptr [esi]
004E82F7   9B                     wait
004E82F8   E91A110000             jmp     004E9417
004E82FD   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E82FF   E8C0A8F1FF             call    00402BC4
004E8304   81E010000000           and     eax, $00000010
004E830A   33D2                   xor     edx, edx
004E830C   0FACD004               shrd    eax, edx, $04
004E8310   C1EA04                 shr     edx, $04
004E8313   8945E8                 mov     [ebp-$18], eax
004E8316   8955EC                 mov     [ebp-$14], edx
004E8319   DF6DE8                 fild    qword ptr [ebp-$18]
004E831C   DD1E                   fstp    qword ptr [esi]
004E831E   9B                     wait
004E831F   E9F3100000             jmp     004E9417
004E8324   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8326   E899A8F1FF             call    00402BC4
004E832B   81E020000000           and     eax, $00000020
004E8331   33D2                   xor     edx, edx
004E8333   0FACD005               shrd    eax, edx, $05
004E8337   C1EA05                 shr     edx, $05
004E833A   8945E8                 mov     [ebp-$18], eax
004E833D   8955EC                 mov     [ebp-$14], edx
004E8340   DF6DE8                 fild    qword ptr [ebp-$18]
004E8343   DD1E                   fstp    qword ptr [esi]
004E8345   9B                     wait
004E8346   E9CC100000             jmp     004E9417
004E834B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E834D   E872A8F1FF             call    00402BC4
004E8352   81E040000000           and     eax, $00000040
004E8358   33D2                   xor     edx, edx
004E835A   0FACD006               shrd    eax, edx, $06
004E835E   C1EA06                 shr     edx, $06
004E8361   8945E8                 mov     [ebp-$18], eax
004E8364   8955EC                 mov     [ebp-$14], edx
004E8367   DF6DE8                 fild    qword ptr [ebp-$18]
004E836A   DD1E                   fstp    qword ptr [esi]
004E836C   9B                     wait
004E836D   E9A5100000             jmp     004E9417
004E8372   DB2D2C964E00           fld     tbyte ptr [$004E962C]
004E8378   DC3E                   fdivr   qword ptr [esi]
004E837A   DD1E                   fstp    qword ptr [esi]
004E837C   9B                     wait
004E837D   E995100000             jmp     004E9417
004E8382   DD06                   fld     qword ptr [esi]
004E8384   D83584954E00           fdiv    dword ptr [$004E9584]
004E838A   DD1E                   fstp    qword ptr [esi]
004E838C   9B                     wait
004E838D   E985100000             jmp     004E9417
004E8392   DD06                   fld     qword ptr [esi]
004E8394   D80D54954E00           fmul    dword ptr [$004E9554]
004E839A   DD1E                   fstp    qword ptr [esi]
004E839C   9B                     wait
004E839D   E975100000             jmp     004E9417
004E83A2   8B06                   mov     eax, [esi]
004E83A4   8906                   mov     [esi], eax
004E83A6   8B4604                 mov     eax, [esi+$04]
004E83A9   894604                 mov     [esi+$04], eax
004E83AC   E966100000             jmp     004E9417
004E83B1   DD06                   fld     qword ptr [esi]
004E83B3   D825D4954E00           fsub    dword ptr [$004E95D4]
004E83B9   DD1E                   fstp    qword ptr [esi]
004E83BB   9B                     wait
004E83BC   E956100000             jmp     004E9417
004E83C1   DD06                   fld     qword ptr [esi]
004E83C3   D80D3C954E00           fmul    dword ptr [$004E953C]
004E83C9   D82538964E00           fsub    dword ptr [$004E9638]
004E83CF   DD1E                   fstp    qword ptr [esi]
004E83D1   9B                     wait
004E83D2   E940100000             jmp     004E9417
004E83D7   DD06                   fld     qword ptr [esi]
004E83D9   D83588954E00           fdiv    dword ptr [$004E9588]
004E83DF   DD1E                   fstp    qword ptr [esi]
004E83E1   9B                     wait
004E83E2   E930100000             jmp     004E9417
004E83E7   DD06                   fld     qword ptr [esi]
004E83E9   D83554954E00           fdiv    dword ptr [$004E9554]
004E83EF   DD1E                   fstp    qword ptr [esi]
004E83F1   9B                     wait
004E83F2   E920100000             jmp     004E9417
004E83F7   DD06                   fld     qword ptr [esi]
004E83F9   D825E4954E00           fsub    dword ptr [$004E95E4]
004E83FF   DB2D3C964E00           fld     tbyte ptr [$004E963C]
004E8405   DEF9                   fdivp   st(1), st(0)
004E8407   DD1E                   fstp    qword ptr [esi]
004E8409   9B                     wait
004E840A   E908100000             jmp     004E9417
004E840F   DB2D48964E00           fld     tbyte ptr [$004E9648]
004E8415   DC3E                   fdivr   qword ptr [esi]
004E8417   DD1E                   fstp    qword ptr [esi]
004E8419   9B                     wait
004E841A   E9F80F0000             jmp     004E9417
004E841F   DD06                   fld     qword ptr [esi]
004E8421   D83588954E00           fdiv    dword ptr [$004E9588]
004E8427   D825D0954E00           fsub    dword ptr [$004E95D0]
004E842D   DD1E                   fstp    qword ptr [esi]
004E842F   9B                     wait
004E8430   E9E20F0000             jmp     004E9417
004E8435   DD06                   fld     qword ptr [esi]
004E8437   D835F4954E00           fdiv    dword ptr [$004E95F4]
004E843D   DD1E                   fstp    qword ptr [esi]
004E843F   9B                     wait
004E8440   E9D20F0000             jmp     004E9417
004E8445   DB2D54964E00           fld     tbyte ptr [$004E9654]
004E844B   DC0E                   fmul    qword ptr [esi]
004E844D   DD1E                   fstp    qword ptr [esi]
004E844F   9B                     wait
004E8450   E9C20F0000             jmp     004E9417
004E8455   DD06                   fld     qword ptr [esi]
004E8457   D83560964E00           fdiv    dword ptr [$004E9660]
004E845D   DD1E                   fstp    qword ptr [esi]
004E845F   9B                     wait
004E8460   E9B20F0000             jmp     004E9417
004E8465   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E846B   DC3E                   fdivr   qword ptr [esi]
004E846D   DD1E                   fstp    qword ptr [esi]
004E846F   9B                     wait
004E8470   E9A20F0000             jmp     004E9417
004E8475   DB2D64964E00           fld     tbyte ptr [$004E9664]
004E847B   DC3E                   fdivr   qword ptr [esi]
004E847D   DD1E                   fstp    qword ptr [esi]
004E847F   9B                     wait
004E8480   E9920F0000             jmp     004E9417

* Reference to TOptionsForm instance
|
004E8485   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E848A   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.koef : TComboBox
|
004E848C   8B8018030000           mov     eax, [eax+$0318]
004E8492   8B10                   mov     edx, [eax]

* Reference to method TComboBox.ItemIndex()
|
004E8494   FF92CC000000           call    dword ptr [edx+$00CC]
004E849A   8945F4                 mov     [ebp-$0C], eax
004E849D   DB45F4                 fild    dword ptr [ebp-$0C]
004E84A0   D83554954E00           fdiv    dword ptr [$004E9554]
004E84A6   D805B4954E00           fadd    dword ptr [$004E95B4]
004E84AC   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E84B3   8B15F86E4F00           mov     edx, [$004F6EF8]
004E84B9   DC8CC2D8000000         fmul    qword ptr [edx+eax*8+$00D8]
004E84C0   D80D84954E00           fmul    dword ptr [$004E9584]
004E84C6   D80DBC954E00           fmul    dword ptr [$004E95BC]
004E84CC   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E84D3   8B15F86E4F00           mov     edx, [$004F6EF8]
004E84D9   DD84C290000000         fld     qword ptr [edx+eax*8+$0090]
004E84E0   D83588954E00           fdiv    dword ptr [$004E9588]
004E84E6   DEC9                   fmulp   st(1), st(0)
004E84E8   D835C0954E00           fdiv    dword ptr [$004E95C0]
004E84EE   DD1E                   fstp    qword ptr [esi]
004E84F0   9B                     wait
004E84F1   E9210F0000             jmp     004E9417
004E84F6   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E84FD   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8502   DD84D0A0000000         fld     qword ptr [eax+edx*8+$00A0]
004E8509   D81D64954E00           fcomp   dword ptr [$004E9564]
004E850F   DFE0                   fstsw   ax
004E8511   9E                     sahf
004E8512   7667                   jbe     004E857B
004E8514   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E851B   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004E8521   DD84C1A0000000         fld     qword ptr [ecx+eax*8+$00A0]
004E8528   D81DC4954E00           fcomp   dword ptr [$004E95C4]
004E852E   DFE0                   fstsw   ax
004E8530   9E                     sahf
004E8531   731A                   jnb     004E854D
004E8533   D90554954E00           fld     dword ptr [$004E9554]
004E8539   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E853E   DC8CD0D8010000         fmul    qword ptr [eax+edx*8+$01D8]
004E8545   DD1E                   fstp    qword ptr [esi]
004E8547   9B                     wait
004E8548   E9CA0E0000             jmp     004E9417
004E854D   D9058C954E00           fld     dword ptr [$004E958C]
004E8553   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E8558   DC8CD0D8010000         fmul    qword ptr [eax+edx*8+$01D8]
004E855F   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E8566   8B15F86E4F00           mov     edx, [$004F6EF8]
004E856C   DCB4C2A0000000         fdiv    qword ptr [edx+eax*8+$00A0]
004E8573   DD1E                   fstp    qword ptr [esi]
004E8575   9B                     wait
004E8576   E99C0E0000             jmp     004E9417
004E857B   33C0                   xor     eax, eax
004E857D   8906                   mov     [esi], eax
004E857F   894604                 mov     [esi+$04], eax
004E8582   E9900E0000             jmp     004E9417
004E8587   833DC86D4F0000         cmp     dword ptr [$004F6DC8], +$00
004E858E   7543                   jnz     004E85D3
004E8590   33C0                   xor     eax, eax
004E8592   A0746E4F00             mov     al, byte ptr [$004F6E74]
004E8597   69C080EE3600           imul    eax, eax, $0036EE80
004E859D   33D2                   xor     edx, edx
004E859F   8A15756E4F00           mov     dl, byte ptr [$004F6E75]
004E85A5   69D260EA0000           imul    edx, edx, $0000EA60
004E85AB   03C2                   add     eax, edx
004E85AD   33D2                   xor     edx, edx
004E85AF   8A15766E4F00           mov     dl, byte ptr [$004F6E76]
004E85B5   69D2E8030000           imul    edx, edx, $000003E8
004E85BB   03C2                   add     eax, edx
004E85BD   33D2                   xor     edx, edx
004E85BF   8A15776E4F00           mov     dl, byte ptr [$004F6E77]
004E85C5   03D2                   add     edx, edx
004E85C7   8D1492                 lea     edx, [edx+edx*4]
004E85CA   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DBC
|
004E85CC   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E85D1   EB0A                   jmp     004E85DD
004E85D3   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]

* Reference to GlobalVar_004F6DBC
|
004E85D8   A3BC6D4F00             mov     dword ptr [$004F6DBC], eax
004E85DD   33C0                   xor     eax, eax
004E85DF   A0746E4F00             mov     al, byte ptr [$004F6E74]
004E85E4   69C080EE3600           imul    eax, eax, $0036EE80
004E85EA   33D2                   xor     edx, edx
004E85EC   8A15756E4F00           mov     dl, byte ptr [$004F6E75]
004E85F2   69D260EA0000           imul    edx, edx, $0000EA60
004E85F8   03C2                   add     eax, edx
004E85FA   33D2                   xor     edx, edx
004E85FC   8A15766E4F00           mov     dl, byte ptr [$004F6E76]
004E8602   69D2E8030000           imul    edx, edx, $000003E8
004E8608   03C2                   add     eax, edx
004E860A   33D2                   xor     edx, edx
004E860C   8A15776E4F00           mov     dl, byte ptr [$004F6E77]
004E8612   03D2                   add     edx, edx
004E8614   8D1492                 lea     edx, [edx+edx*4]
004E8617   03C2                   add     eax, edx

* Reference to GlobalVar_004F6DB8
|
004E8619   A3B86D4F00             mov     dword ptr [$004F6DB8], eax
004E861E   A1B86D4F00             mov     eax, dword ptr [$004F6DB8]
004E8623   2B05BC6D4F00           sub     eax, dword ptr [$004F6DBC]

* Reference to GlobalVar_004F6DB4
|
004E8629   A3B46D4F00             mov     dword ptr [$004F6DB4], eax
004E862E   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E8635   8B15F86E4F00           mov     edx, [$004F6EF8]
004E863B   DD84C2D8010000         fld     qword ptr [edx+eax*8+$01D8]
004E8642   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E8648   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E864E   DEC9                   fmulp   st(1), st(0)
004E8650   DD1E                   fstp    qword ptr [esi]
004E8652   9B                     wait
004E8653   DD05DC6D4F00           fld     qword ptr [$004F6DDC]
004E8659   DC06                   fadd    qword ptr [esi]
004E865B   DD1DDC6D4F00           fstp    qword ptr [$004F6DDC]
004E8661   9B                     wait
004E8662   8B05DC6D4F00           mov     eax, [$004F6DDC]
004E8668   8906                   mov     [esi], eax
004E866A   8B05E06D4F00           mov     eax, [$004F6DE0]
004E8670   894604                 mov     [esi+$04], eax
004E8673   E99F0D0000             jmp     004E9417
004E8678   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E867F   8B15F86E4F00           mov     edx, [$004F6EF8]
004E8685   DD84C2A0000000         fld     qword ptr [edx+eax*8+$00A0]
004E868C   D835C8954E00           fdiv    dword ptr [$004E95C8]
004E8692   DB05B46D4F00           fild    dword ptr [$004F6DB4]
004E8698   DEC9                   fmulp   st(1), st(0)
004E869A   DD1E                   fstp    qword ptr [esi]
004E869C   9B                     wait
004E869D   DD05E46D4F00           fld     qword ptr [$004F6DE4]
004E86A3   DC06                   fadd    qword ptr [esi]
004E86A5   DD1DE46D4F00           fstp    qword ptr [$004F6DE4]
004E86AB   9B                     wait
004E86AC   8B05E46D4F00           mov     eax, [$004F6DE4]
004E86B2   8906                   mov     [esi], eax
004E86B4   8B05E86D4F00           mov     eax, [$004F6DE8]
004E86BA   894604                 mov     [esi+$04], eax
004E86BD   E9550D0000             jmp     004E9417
004E86C2   6B15C86D4F004C         imul    edx, [$004F6DC8], $4C
004E86C9   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E86CE   DD84D0F0010000         fld     qword ptr [eax+edx*8+$01F0]
004E86D5   D81DCC954E00           fcomp   dword ptr [$004E95CC]
004E86DB   DFE0                   fstsw   ax
004E86DD   9E                     sahf
004E86DE   0F86330D0000           jbe     004E9417
004E86E4   D9058C954E00           fld     dword ptr [$004E958C]
004E86EA   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004E86EF   DC8CD0E8010000         fmul    qword ptr [eax+edx*8+$01E8]
004E86F6   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E86FD   8B15F86E4F00           mov     edx, [$004F6EF8]
004E8703   DCB4C2F0010000         fdiv    qword ptr [edx+eax*8+$01F0]
004E870A   DD1E                   fstp    qword ptr [esi]
004E870C   9B                     wait
004E870D   E9050D0000             jmp     004E9417
004E8712   83FF23                 cmp     edi, +$23
004E8715   0F87FC0C0000           jnbe    004E9417
004E871B   FF24BD22874E00         jmp     dword ptr [$4E8722+edi*4]
004E8722   17                     pop     ss
004E8723   94                     xchg    eax, esp
004E8724   4E                     dec     esi
004E8725   00B2874E00C2           add     [edx+$C2004E87], dh
004E872B   874E00                 xchg    [esi+$00], ecx
004E872E   B287                   mov     dl, $87
004E8730   4E                     dec     esi
004E8731   00B2874E00D1           add     [edx+$D1004E87], dh
004E8737   874E00                 xchg    [esi+$00], ecx
004E873A   D1874E00E187           rol     dword ptr [edi+$87E1004E], 1
004E8740   4E                     dec     esi
004E8741   00F1                   add     cl, dh
004E8743   874E00                 xchg    [esi+$00], ecx
004E8746   01884E001188           add     [eax+$8811004E], ecx
004E874C   4E                     dec     esi
004E874D   0001                   add     [ecx], al
004E874F   884E00                 mov     [esi+$00], cl
004E8752   21884E003188           and     [eax+$8831004E], ecx
004E8758   4E                     dec     esi
004E8759   004788                 add     [edi-$78], al
004E875C   4E                     dec     esi
004E875D   004788                 add     [edi-$78], al
004E8760   4E                     dec     esi
004E8761   004788                 add     [edi-$78], al
004E8764   4E                     dec     esi
004E8765   005D88                 add     [ebp-$78], bl
004E8768   4E                     dec     esi
004E8769   0084884E00AA88         add     [eax+ecx*4+$88AA004E], al
004E8770   4E                     dec     esi
004E8771   00D1                   add     cl, dl
004E8773   884E00                 mov     [esi+$00], cl
004E8776   F8                     clc
004E8777   884E00                 mov     [esi+$00], cl
004E877A   1F                     pop     ds
004E877B   894E00                 mov     [esi+$00], ecx
004E877E   45                     inc     ebp
004E877F   894E00                 mov     [esi+$00], ecx
004E8782   6C                     insb
004E8783   894E00                 mov     [esi+$00], ecx
004E8786   93                     xchg    eax, ebx
004E8787   894E00                 mov     [esi+$00], ecx
004E878A   C2874E                 ret     $4E87

004E878D   00E7                   add     bh, ah
004E878F   894E00                 mov     [esi+$00], ecx
004E8792   C2874E                 ret     $4E87

004E8795   000E                   add     [esi], cl
004E8797   8A4E00                 mov     cl, byte ptr [esi+$00]
004E879A   358A4E005B             xor     eax, $5B004E8A
004E879F   8A4E00                 mov     cl, byte ptr [esi+$00]
004E87A2   828A4E00A88A4E         or      dword ptr [edx+$8AA8004E], $4E
004E87A9   00CF                   add     bh, cl
004E87AB   8A4E00                 mov     cl, byte ptr [esi+$00]
004E87AE   F68A4E00DD06           DB  $F6, $8A, $4E, $00, $DD, $06  //      byte ptr [edx+$6DD004E]
004E87B4   D83584954E00           fdiv    dword ptr [$004E9584]
004E87BA   DD1E                   fstp    qword ptr [esi]
004E87BC   9B                     wait
004E87BD   E9550C0000             jmp     004E9417
004E87C2   8B06                   mov     eax, [esi]
004E87C4   8906                   mov     [esi], eax
004E87C6   8B4604                 mov     eax, [esi+$04]
004E87C9   894604                 mov     [esi+$04], eax
004E87CC   E9460C0000             jmp     004E9417
004E87D1   DD06                   fld     qword ptr [esi]
004E87D3   D825D4954E00           fsub    dword ptr [$004E95D4]
004E87D9   DD1E                   fstp    qword ptr [esi]
004E87DB   9B                     wait
004E87DC   E9360C0000             jmp     004E9417
004E87E1   DB2D70964E00           fld     tbyte ptr [$004E9670]
004E87E7   DC3E                   fdivr   qword ptr [esi]
004E87E9   DD1E                   fstp    qword ptr [esi]
004E87EB   9B                     wait
004E87EC   E9260C0000             jmp     004E9417
004E87F1   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E87F7   DC3E                   fdivr   qword ptr [esi]
004E87F9   DD1E                   fstp    qword ptr [esi]
004E87FB   9B                     wait
004E87FC   E9160C0000             jmp     004E9417
004E8801   DB2D18964E00           fld     tbyte ptr [$004E9618]
004E8807   DC3E                   fdivr   qword ptr [esi]
004E8809   DD1E                   fstp    qword ptr [esi]
004E880B   9B                     wait
004E880C   E9060C0000             jmp     004E9417
004E8811   DD06                   fld     qword ptr [esi]
004E8813   D80DB0954E00           fmul    dword ptr [$004E95B0]
004E8819   DD1E                   fstp    qword ptr [esi]
004E881B   9B                     wait
004E881C   E9F60B0000             jmp     004E9417
004E8821   DD06                   fld     qword ptr [esi]
004E8823   D8357C964E00           fdiv    dword ptr [$004E967C]
004E8829   DD1E                   fstp    qword ptr [esi]
004E882B   9B                     wait
004E882C   E9E60B0000             jmp     004E9417
004E8831   DD06                   fld     qword ptr [esi]
004E8833   D80D80964E00           fmul    dword ptr [$004E9680]
004E8839   D82584964E00           fsub    dword ptr [$004E9684]
004E883F   DD1E                   fstp    qword ptr [esi]
004E8841   9B                     wait
004E8842   E9D00B0000             jmp     004E9417
004E8847   DD06                   fld     qword ptr [esi]
004E8849   D80D88954E00           fmul    dword ptr [$004E9588]
004E884F   D8258C954E00           fsub    dword ptr [$004E958C]
004E8855   DD1E                   fstp    qword ptr [esi]
004E8857   9B                     wait
004E8858   E9BA0B0000             jmp     004E9417
004E885D   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E885F   E860A3F1FF             call    00402BC4
004E8864   81E001000000           and     eax, $00000001
004E886A   33D2                   xor     edx, edx
004E886C   0FACD000               shrd    eax, edx, $00
004E8870   C1EA00                 shr     edx, $00
004E8873   8945E8                 mov     [ebp-$18], eax
004E8876   8955EC                 mov     [ebp-$14], edx
004E8879   DF6DE8                 fild    qword ptr [ebp-$18]
004E887C   DD1E                   fstp    qword ptr [esi]
004E887E   9B                     wait
004E887F   E9930B0000             jmp     004E9417
004E8884   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8886   E839A3F1FF             call    00402BC4
004E888B   81E002000000           and     eax, $00000002
004E8891   33D2                   xor     edx, edx
004E8893   0FACD001               shrd    eax, edx, $01
004E8897   D1EA                   shr     edx, 1
004E8899   8945E8                 mov     [ebp-$18], eax
004E889C   8955EC                 mov     [ebp-$14], edx
004E889F   DF6DE8                 fild    qword ptr [ebp-$18]
004E88A2   DD1E                   fstp    qword ptr [esi]
004E88A4   9B                     wait
004E88A5   E96D0B0000             jmp     004E9417
004E88AA   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88AC   E813A3F1FF             call    00402BC4
004E88B1   81E004000000           and     eax, $00000004
004E88B7   33D2                   xor     edx, edx
004E88B9   0FACD002               shrd    eax, edx, $02
004E88BD   C1EA02                 shr     edx, $02
004E88C0   8945E8                 mov     [ebp-$18], eax
004E88C3   8955EC                 mov     [ebp-$14], edx
004E88C6   DF6DE8                 fild    qword ptr [ebp-$18]
004E88C9   DD1E                   fstp    qword ptr [esi]
004E88CB   9B                     wait
004E88CC   E9460B0000             jmp     004E9417
004E88D1   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88D3   E8ECA2F1FF             call    00402BC4
004E88D8   81E008000000           and     eax, $00000008
004E88DE   33D2                   xor     edx, edx
004E88E0   0FACD003               shrd    eax, edx, $03
004E88E4   C1EA03                 shr     edx, $03
004E88E7   8945E8                 mov     [ebp-$18], eax
004E88EA   8955EC                 mov     [ebp-$14], edx
004E88ED   DF6DE8                 fild    qword ptr [ebp-$18]
004E88F0   DD1E                   fstp    qword ptr [esi]
004E88F2   9B                     wait
004E88F3   E91F0B0000             jmp     004E9417
004E88F8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E88FA   E8C5A2F1FF             call    00402BC4
004E88FF   81E001000000           and     eax, $00000001
004E8905   33D2                   xor     edx, edx
004E8907   0FACD000               shrd    eax, edx, $00
004E890B   C1EA00                 shr     edx, $00
004E890E   8945E8                 mov     [ebp-$18], eax
004E8911   8955EC                 mov     [ebp-$14], edx
004E8914   DF6DE8                 fild    qword ptr [ebp-$18]
004E8917   DD1E                   fstp    qword ptr [esi]
004E8919   9B                     wait
004E891A   E9F80A0000             jmp     004E9417
004E891F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8921   E89EA2F1FF             call    00402BC4
004E8926   81E002000000           and     eax, $00000002
004E892C   33D2                   xor     edx, edx
004E892E   0FACD001               shrd    eax, edx, $01
004E8932   D1EA                   shr     edx, 1
004E8934   8945E8                 mov     [ebp-$18], eax
004E8937   8955EC                 mov     [ebp-$14], edx
004E893A   DF6DE8                 fild    qword ptr [ebp-$18]
004E893D   DD1E                   fstp    qword ptr [esi]
004E893F   9B                     wait
004E8940   E9D20A0000             jmp     004E9417
004E8945   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8947   E878A2F1FF             call    00402BC4
004E894C   81E004000000           and     eax, $00000004
004E8952   33D2                   xor     edx, edx
004E8954   0FACD002               shrd    eax, edx, $02
004E8958   C1EA02                 shr     edx, $02
004E895B   8945E8                 mov     [ebp-$18], eax
004E895E   8955EC                 mov     [ebp-$14], edx
004E8961   DF6DE8                 fild    qword ptr [ebp-$18]
004E8964   DD1E                   fstp    qword ptr [esi]
004E8966   9B                     wait
004E8967   E9AB0A0000             jmp     004E9417
004E896C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E896E   E851A2F1FF             call    00402BC4
004E8973   81E008000000           and     eax, $00000008
004E8979   33D2                   xor     edx, edx
004E897B   0FACD003               shrd    eax, edx, $03
004E897F   C1EA03                 shr     edx, $03
004E8982   8945E8                 mov     [ebp-$18], eax
004E8985   8955EC                 mov     [ebp-$14], edx
004E8988   DF6DE8                 fild    qword ptr [ebp-$18]
004E898B   DD1E                   fstp    qword ptr [esi]
004E898D   9B                     wait
004E898E   E9840A0000             jmp     004E9417
004E8993   DD06                   fld     qword ptr [esi]
004E8995   D81DB4954E00           fcomp   dword ptr [$004E95B4]
004E899B   DFE0                   fstsw   ax
004E899D   9E                     sahf
004E899E   740D                   jz      004E89AD
004E89A0   DD06                   fld     qword ptr [esi]
004E89A2   D81D7C964E00           fcomp   dword ptr [$004E967C]
004E89A8   DFE0                   fstsw   ax
004E89AA   9E                     sahf
004E89AB   751A                   jnz     004E89C7
004E89AD   DD06                   fld     qword ptr [esi]
004E89AF   D9FA                   fsqrt

* Reference to: System.@ROUND;
|
004E89B1   E80EA2F1FF             call    00402BC4
004E89B6   8945E8                 mov     [ebp-$18], eax
004E89B9   8955EC                 mov     [ebp-$14], edx
004E89BC   DF6DE8                 fild    qword ptr [ebp-$18]
004E89BF   DD1E                   fstp    qword ptr [esi]
004E89C1   9B                     wait
004E89C2   E9500A0000             jmp     004E9417
004E89C7   DD06                   fld     qword ptr [esi]
004E89C9   D9FA                   fsqrt

* Reference to: System.@ROUND;
|
004E89CB   E8F4A1F1FF             call    00402BC4
004E89D0   83C001                 add     eax, +$01
004E89D3   83D200                 adc     edx, +$00
004E89D6   8945E8                 mov     [ebp-$18], eax
004E89D9   8955EC                 mov     [ebp-$14], edx
004E89DC   DF6DE8                 fild    qword ptr [ebp-$18]
004E89DF   DD1E                   fstp    qword ptr [esi]
004E89E1   9B                     wait
004E89E2   E9300A0000             jmp     004E9417
004E89E7   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E89E9   E8D6A1F1FF             call    00402BC4
004E89EE   81E001000000           and     eax, $00000001
004E89F4   33D2                   xor     edx, edx
004E89F6   0FACD000               shrd    eax, edx, $00
004E89FA   C1EA00                 shr     edx, $00
004E89FD   8945E8                 mov     [ebp-$18], eax
004E8A00   8955EC                 mov     [ebp-$14], edx
004E8A03   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A06   DD1E                   fstp    qword ptr [esi]
004E8A08   9B                     wait
004E8A09   E9090A0000             jmp     004E9417
004E8A0E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A10   E8AFA1F1FF             call    00402BC4
004E8A15   81E001000000           and     eax, $00000001
004E8A1B   33D2                   xor     edx, edx
004E8A1D   0FACD000               shrd    eax, edx, $00
004E8A21   C1EA00                 shr     edx, $00
004E8A24   8945E8                 mov     [ebp-$18], eax
004E8A27   8955EC                 mov     [ebp-$14], edx
004E8A2A   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A2D   DD1E                   fstp    qword ptr [esi]
004E8A2F   9B                     wait
004E8A30   E9E2090000             jmp     004E9417
004E8A35   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A37   E888A1F1FF             call    00402BC4
004E8A3C   81E002000000           and     eax, $00000002
004E8A42   33D2                   xor     edx, edx
004E8A44   0FACD001               shrd    eax, edx, $01
004E8A48   D1EA                   shr     edx, 1
004E8A4A   8945E8                 mov     [ebp-$18], eax
004E8A4D   8955EC                 mov     [ebp-$14], edx
004E8A50   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A53   DD1E                   fstp    qword ptr [esi]
004E8A55   9B                     wait
004E8A56   E9BC090000             jmp     004E9417
004E8A5B   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A5D   E862A1F1FF             call    00402BC4
004E8A62   81E001000000           and     eax, $00000001
004E8A68   33D2                   xor     edx, edx
004E8A6A   0FACD000               shrd    eax, edx, $00
004E8A6E   C1EA00                 shr     edx, $00
004E8A71   8945E8                 mov     [ebp-$18], eax
004E8A74   8955EC                 mov     [ebp-$14], edx
004E8A77   DF6DE8                 fild    qword ptr [ebp-$18]
004E8A7A   DD1E                   fstp    qword ptr [esi]
004E8A7C   9B                     wait
004E8A7D   E995090000             jmp     004E9417
004E8A82   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8A84   E83BA1F1FF             call    00402BC4
004E8A89   81E002000000           and     eax, $00000002
004E8A8F   33D2                   xor     edx, edx
004E8A91   0FACD001               shrd    eax, edx, $01
004E8A95   D1EA                   shr     edx, 1
004E8A97   8945E8                 mov     [ebp-$18], eax
004E8A9A   8955EC                 mov     [ebp-$14], edx
004E8A9D   DF6DE8                 fild    qword ptr [ebp-$18]
004E8AA0   DD1E                   fstp    qword ptr [esi]
004E8AA2   9B                     wait
004E8AA3   E96F090000             jmp     004E9417
004E8AA8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8AAA   E815A1F1FF             call    00402BC4
004E8AAF   81E004000000           and     eax, $00000004
004E8AB5   33D2                   xor     edx, edx
004E8AB7   0FACD002               shrd    eax, edx, $02
004E8ABB   C1EA02                 shr     edx, $02
004E8ABE   8945E8                 mov     [ebp-$18], eax
004E8AC1   8955EC                 mov     [ebp-$14], edx
004E8AC4   DF6DE8                 fild    qword ptr [ebp-$18]
004E8AC7   DD1E                   fstp    qword ptr [esi]
004E8AC9   9B                     wait
004E8ACA   E948090000             jmp     004E9417
004E8ACF   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8AD1   E8EEA0F1FF             call    00402BC4
004E8AD6   81E008000000           and     eax, $00000008
004E8ADC   33D2                   xor     edx, edx
004E8ADE   0FACD003               shrd    eax, edx, $03
004E8AE2   C1EA03                 shr     edx, $03
004E8AE5   8945E8                 mov     [ebp-$18], eax
004E8AE8   8955EC                 mov     [ebp-$14], edx
004E8AEB   DF6DE8                 fild    qword ptr [ebp-$18]
004E8AEE   DD1E                   fstp    qword ptr [esi]
004E8AF0   9B                     wait
004E8AF1   E921090000             jmp     004E9417
004E8AF6   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8AF8   E8C7A0F1FF             call    00402BC4
004E8AFD   81E010000000           and     eax, $00000010
004E8B03   33D2                   xor     edx, edx
004E8B05   0FACD004               shrd    eax, edx, $04
004E8B09   C1EA04                 shr     edx, $04
004E8B0C   8945E8                 mov     [ebp-$18], eax
004E8B0F   8955EC                 mov     [ebp-$14], edx
004E8B12   DF6DE8                 fild    qword ptr [ebp-$18]
004E8B15   DD1E                   fstp    qword ptr [esi]
004E8B17   9B                     wait
004E8B18   E9FA080000             jmp     004E9417
004E8B1D   83FF1E                 cmp     edi, +$1E
004E8B20   0F87F1080000           jnbe    004E9417
004E8B26   FF24BD2D8B4E00         jmp     dword ptr [$4E8B2D+edi*4]
004E8B2D   17                     pop     ss
004E8B2E   94                     xchg    eax, esp
004E8B2F   4E                     dec     esi
004E8B30   00A98B4E00D5           add     [ecx+$D5004E8B], ch
004E8B36   8B4E00                 mov     ecx, [esi+$00]
004E8B39   FC                     cld
004E8B3A   8B4E00                 mov     ecx, [esi+$00]
004E8B3D   228C4E00498C4E         and     cl, byte ptr [esi+ecx*2+$4E8C4900]
004E8B44   00588C                 add     [eax-$74], bl
004E8B47   4E                     dec     esi
004E8B48   00688C                 add     [eax-$74], ch
004E8B4B   4E                     dec     esi
004E8B4C   00898C4E0099           add     [ecx+$99004E8C], cl
004E8B52   8C4E00                 mov     word ptr [esi+$00], cs
004E8B55   A88C                   test    al, $8C
004E8B57   4E                     dec     esi
004E8B58   00B78C4E00D8           add     [edi+$D8004E8C], dh
004E8B5E   8C4E00                 mov     word ptr [esi+$00], cs
004E8B61   E78C                   out     $8C, eax
004E8B63   4E                     dec     esi
004E8B64   00F6                   add     dh, dh
004E8B66   8C4E00                 mov     word ptr [esi+$00], cs
004E8B69   06                     push    es
004E8B6A   8D4E00                 lea     ecx, [esi+$00]
004E8B6D   27                     daa
004E8B6E   8D4E00                 lea     ecx, [esi+$00]
004E8B71   368D4E00               lea     ecx, ss:[esi+$00]
004E8B75   57                     push    edi
004E8B76   8D4E00                 lea     ecx, [esi+$00]
004E8B79   7E8D                   jle     004E8B08
004E8B7B   4E                     dec     esi
004E8B7C   00A48D4E00A48D         add     [ebp+ecx*4+$8DA4004E], ah
004E8B83   4E                     dec     esi
004E8B84   00A48D4E00A48D         add     [ebp+ecx*4+$8DA4004E], ah
004E8B8B   4E                     dec     esi
004E8B8C   00A48D4E00A48D         add     [ebp+ecx*4+$8DA4004E], ah
004E8B93   4E                     dec     esi
004E8B94   00A48D4E00A48D         add     [ebp+ecx*4+$8DA4004E], ah
004E8B9B   4E                     dec     esi
004E8B9C   00B48D4E00E08D         add     [ebp+ecx*4+$8DE0004E], dh
004E8BA3   4E                     dec     esi
004E8BA4   00F0                   add     al, dh
004E8BA6   8D4E00                 lea     ecx, [esi+$00]
004E8BA9   DD06                   fld     qword ptr [esi]
004E8BAB   D81D88964E00           fcomp   dword ptr [$004E9688]
004E8BB1   DFE0                   fstsw   ax
004E8BB3   9E                     sahf
004E8BB4   7610                   jbe     004E8BC6
004E8BB6   33C0                   xor     eax, eax
004E8BB8   8906                   mov     [esi], eax
004E8BBA   C7460400002040         mov     dword ptr [esi+$04], $40200000
004E8BC1   E951080000             jmp     004E9417
004E8BC6   8B06                   mov     eax, [esi]
004E8BC8   8906                   mov     [esi], eax
004E8BCA   8B4604                 mov     eax, [esi+$04]
004E8BCD   894604                 mov     [esi+$04], eax
004E8BD0   E942080000             jmp     004E9417
004E8BD5   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8BD7   E8E89FF1FF             call    00402BC4
004E8BDC   81E001000000           and     eax, $00000001
004E8BE2   33D2                   xor     edx, edx
004E8BE4   0FACD000               shrd    eax, edx, $00
004E8BE8   C1EA00                 shr     edx, $00
004E8BEB   8945E8                 mov     [ebp-$18], eax
004E8BEE   8955EC                 mov     [ebp-$14], edx
004E8BF1   DF6DE8                 fild    qword ptr [ebp-$18]
004E8BF4   DD1E                   fstp    qword ptr [esi]
004E8BF6   9B                     wait
004E8BF7   E91B080000             jmp     004E9417
004E8BFC   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8BFE   E8C19FF1FF             call    00402BC4
004E8C03   81E002000000           and     eax, $00000002
004E8C09   33D2                   xor     edx, edx
004E8C0B   0FACD001               shrd    eax, edx, $01
004E8C0F   D1EA                   shr     edx, 1
004E8C11   8945E8                 mov     [ebp-$18], eax
004E8C14   8955EC                 mov     [ebp-$14], edx
004E8C17   DF6DE8                 fild    qword ptr [ebp-$18]
004E8C1A   DD1E                   fstp    qword ptr [esi]
004E8C1C   9B                     wait
004E8C1D   E9F5070000             jmp     004E9417
004E8C22   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8C24   E89B9FF1FF             call    00402BC4
004E8C29   81E004000000           and     eax, $00000004
004E8C2F   33D2                   xor     edx, edx
004E8C31   0FACD002               shrd    eax, edx, $02
004E8C35   C1EA02                 shr     edx, $02
004E8C38   8945E8                 mov     [ebp-$18], eax
004E8C3B   8955EC                 mov     [ebp-$14], edx
004E8C3E   DF6DE8                 fild    qword ptr [ebp-$18]
004E8C41   DD1E                   fstp    qword ptr [esi]
004E8C43   9B                     wait
004E8C44   E9CE070000             jmp     004E9417
004E8C49   8B06                   mov     eax, [esi]
004E8C4B   8906                   mov     [esi], eax
004E8C4D   8B4604                 mov     eax, [esi+$04]
004E8C50   894604                 mov     [esi+$04], eax
004E8C53   E9BF070000             jmp     004E9417
004E8C58   DD06                   fld     qword ptr [esi]
004E8C5A   D83554954E00           fdiv    dword ptr [$004E9554]
004E8C60   DD1E                   fstp    qword ptr [esi]
004E8C62   9B                     wait
004E8C63   E9AF070000             jmp     004E9417
004E8C68   DD06                   fld     qword ptr [esi]
004E8C6A   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E8C70   DFE0                   fstsw   ax
004E8C72   9E                     sahf
004E8C73   0F869E070000           jbe     004E9417
004E8C79   D9058C964E00           fld     dword ptr [$004E968C]
004E8C7F   DC06                   fadd    qword ptr [esi]
004E8C81   DD1E                   fstp    qword ptr [esi]
004E8C83   9B                     wait
004E8C84   E98E070000             jmp     004E9417
004E8C89   DD06                   fld     qword ptr [esi]
004E8C8B   D825D4954E00           fsub    dword ptr [$004E95D4]
004E8C91   DD1E                   fstp    qword ptr [esi]
004E8C93   9B                     wait
004E8C94   E97E070000             jmp     004E9417
004E8C99   8B06                   mov     eax, [esi]
004E8C9B   8906                   mov     [esi], eax
004E8C9D   8B4604                 mov     eax, [esi+$04]
004E8CA0   894604                 mov     [esi+$04], eax
004E8CA3   E96F070000             jmp     004E9417
004E8CA8   8B06                   mov     eax, [esi]
004E8CAA   8906                   mov     [esi], eax
004E8CAC   8B4604                 mov     eax, [esi+$04]
004E8CAF   894604                 mov     [esi+$04], eax
004E8CB2   E960070000             jmp     004E9417
004E8CB7   DD06                   fld     qword ptr [esi]
004E8CB9   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E8CBF   DFE0                   fstsw   ax
004E8CC1   9E                     sahf
004E8CC2   0F864F070000           jbe     004E9417
004E8CC8   D9058C964E00           fld     dword ptr [$004E968C]
004E8CCE   DC06                   fadd    qword ptr [esi]
004E8CD0   DD1E                   fstp    qword ptr [esi]
004E8CD2   9B                     wait
004E8CD3   E93F070000             jmp     004E9417
004E8CD8   8B06                   mov     eax, [esi]
004E8CDA   8906                   mov     [esi], eax
004E8CDC   8B4604                 mov     eax, [esi+$04]
004E8CDF   894604                 mov     [esi+$04], eax
004E8CE2   E930070000             jmp     004E9417
004E8CE7   8B06                   mov     eax, [esi]
004E8CE9   8906                   mov     [esi], eax
004E8CEB   8B4604                 mov     eax, [esi+$04]
004E8CEE   894604                 mov     [esi+$04], eax
004E8CF1   E921070000             jmp     004E9417
004E8CF6   DB2D40954E00           fld     tbyte ptr [$004E9540]
004E8CFC   DC3E                   fdivr   qword ptr [esi]
004E8CFE   DD1E                   fstp    qword ptr [esi]
004E8D00   9B                     wait
004E8D01   E911070000             jmp     004E9417
004E8D06   DD06                   fld     qword ptr [esi]
004E8D08   D81D7C954E00           fcomp   dword ptr [$004E957C]
004E8D0E   DFE0                   fstsw   ax
004E8D10   9E                     sahf
004E8D11   0F8600070000           jbe     004E9417
004E8D17   D9058C964E00           fld     dword ptr [$004E968C]
004E8D1D   DC06                   fadd    qword ptr [esi]
004E8D1F   DD1E                   fstp    qword ptr [esi]
004E8D21   9B                     wait
004E8D22   E9F0060000             jmp     004E9417
004E8D27   8B06                   mov     eax, [esi]
004E8D29   8906                   mov     [esi], eax
004E8D2B   8B4604                 mov     eax, [esi+$04]
004E8D2E   894604                 mov     [esi+$04], eax
004E8D31   E9E1060000             jmp     004E9417
004E8D36   DD06                   fld     qword ptr [esi]
004E8D38   D81D90964E00           fcomp   dword ptr [$004E9690]
004E8D3E   DFE0                   fstsw   ax
004E8D40   9E                     sahf
004E8D41   0F86D0060000           jbe     004E9417
004E8D47   D90594964E00           fld     dword ptr [$004E9694]
004E8D4D   DC06                   fadd    qword ptr [esi]
004E8D4F   DD1E                   fstp    qword ptr [esi]
004E8D51   9B                     wait
004E8D52   E9C0060000             jmp     004E9417
004E8D57   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8D59   E8669EF1FF             call    00402BC4
004E8D5E   81E001000000           and     eax, $00000001
004E8D64   33D2                   xor     edx, edx
004E8D66   0FACD000               shrd    eax, edx, $00
004E8D6A   C1EA00                 shr     edx, $00
004E8D6D   8945E8                 mov     [ebp-$18], eax
004E8D70   8955EC                 mov     [ebp-$14], edx
004E8D73   DF6DE8                 fild    qword ptr [ebp-$18]
004E8D76   DD1E                   fstp    qword ptr [esi]
004E8D78   9B                     wait
004E8D79   E999060000             jmp     004E9417
004E8D7E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8D80   E83F9EF1FF             call    00402BC4
004E8D85   81E002000000           and     eax, $00000002
004E8D8B   33D2                   xor     edx, edx
004E8D8D   0FACD001               shrd    eax, edx, $01
004E8D91   D1EA                   shr     edx, 1
004E8D93   8945E8                 mov     [ebp-$18], eax
004E8D96   8955EC                 mov     [ebp-$14], edx
004E8D99   DF6DE8                 fild    qword ptr [ebp-$18]
004E8D9C   DD1E                   fstp    qword ptr [esi]
004E8D9E   9B                     wait
004E8D9F   E973060000             jmp     004E9417
004E8DA4   DD06                   fld     qword ptr [esi]
004E8DA6   D83554954E00           fdiv    dword ptr [$004E9554]
004E8DAC   DD1E                   fstp    qword ptr [esi]
004E8DAE   9B                     wait
004E8DAF   E963060000             jmp     004E9417
004E8DB4   DD06                   fld     qword ptr [esi]
004E8DB6   D825B4954E00           fsub    dword ptr [$004E95B4]
004E8DBC   DD1E                   fstp    qword ptr [esi]
004E8DBE   9B                     wait
004E8DBF   DD06                   fld     qword ptr [esi]
004E8DC1   D81D98964E00           fcomp   dword ptr [$004E9698]
004E8DC7   DFE0                   fstsw   ax
004E8DC9   9E                     sahf
004E8DCA   0F8547060000           jnz     004E9417
004E8DD0   33C0                   xor     eax, eax
004E8DD2   8906                   mov     [esi], eax
004E8DD4   C7460400001040         mov     dword ptr [esi+$04], $40100000
004E8DDB   E937060000             jmp     004E9417
004E8DE0   DD06                   fld     qword ptr [esi]
004E8DE2   D825B4954E00           fsub    dword ptr [$004E95B4]
004E8DE8   DD1E                   fstp    qword ptr [esi]
004E8DEA   9B                     wait
004E8DEB   E927060000             jmp     004E9417
004E8DF0   8B06                   mov     eax, [esi]
004E8DF2   8906                   mov     [esi], eax
004E8DF4   8B4604                 mov     eax, [esi+$04]
004E8DF7   894604                 mov     [esi+$04], eax
004E8DFA   E918060000             jmp     004E9417
004E8DFF   83FF11                 cmp     edi, +$11
004E8E02   0F870F060000           jnbe    004E9417
004E8E08   0FB6BF168E4E00         movzx   edi, byte ptr [edi+$4E8E16]
004E8E0F   FF24BD288E4E00         jmp     dword ptr [$4E8E28+edi*4]
004E8E16   0001                   add     [ecx], al
004E8E18   0203                   add     al, byte ptr [ebx]
004E8E1A   0303                   add     eax, [ebx]
004E8E1C   0303                   add     eax, [ebx]
004E8E1E   0303                   add     eax, [ebx]
004E8E20   0303                   add     eax, [ebx]
004E8E22   030404                 add     eax, [esp+eax]
004E8E25   0405                   add     al, +$05
004E8E27   06                     push    es
004E8E28   17                     pop     ss
004E8E29   94                     xchg    eax, esp
004E8E2A   4E                     dec     esi
004E8E2B   00448E4E               add     [esi+ecx*4+$4E], al
004E8E2F   00548E4E               add     [esi+ecx*4+$4E], dl
004E8E33   00638E                 add     [ebx-$72], ah
004E8E36   4E                     dec     esi
004E8E37   00738E                 add     [ebx-$72], dh
004E8E3A   4E                     dec     esi
004E8E3B   00948E4E00B58E         add     [esi+ecx*4+$8EB5004E], dl
004E8E42   4E                     dec     esi
004E8E43   00DB                   add     bl, bl
004E8E45   2D9C964E00             sub     eax, $004E969C
004E8E4A   DC3E                   fdivr   qword ptr [esi]
004E8E4C   DD1E                   fstp    qword ptr [esi]
004E8E4E   9B                     wait
004E8E4F   E9C3050000             jmp     004E9417
004E8E54   8B06                   mov     eax, [esi]
004E8E56   8906                   mov     [esi], eax
004E8E58   8B4604                 mov     eax, [esi+$04]
004E8E5B   894604                 mov     [esi+$04], eax
004E8E5E   E9B4050000             jmp     004E9417
004E8E63   DD06                   fld     qword ptr [esi]
004E8E65   D835A8964E00           fdiv    dword ptr [$004E96A8]
004E8E6B   DD1E                   fstp    qword ptr [esi]
004E8E6D   9B                     wait
004E8E6E   E9A4050000             jmp     004E9417
004E8E73   DD06                   fld     qword ptr [esi]
004E8E75   D81DB8954E00           fcomp   dword ptr [$004E95B8]
004E8E7B   DFE0                   fstsw   ax
004E8E7D   9E                     sahf
004E8E7E   0F8693050000           jbe     004E9417
004E8E84   33C0                   xor     eax, eax
004E8E86   8906                   mov     [esi], eax
004E8E88   C7460400000840         mov     dword ptr [esi+$04], $40080000
004E8E8F   E983050000             jmp     004E9417
004E8E94   DD06                   fld     qword ptr [esi]
004E8E96   D81D84954E00           fcomp   dword ptr [$004E9584]
004E8E9C   DFE0                   fstsw   ax
004E8E9E   9E                     sahf
004E8E9F   0F8672050000           jbe     004E9417
004E8EA5   33C0                   xor     eax, eax
004E8EA7   8906                   mov     [esi], eax
004E8EA9   C7460400001040         mov     dword ptr [esi+$04], $40100000
004E8EB0   E962050000             jmp     004E9417
004E8EB5   DD06                   fld     qword ptr [esi]
004E8EB7   D81D50954E00           fcomp   dword ptr [$004E9550]
004E8EBD   DFE0                   fstsw   ax
004E8EBF   9E                     sahf
004E8EC0   0F8651050000           jbe     004E9417
004E8EC6   33C0                   xor     eax, eax
004E8EC8   8906                   mov     [esi], eax
004E8ECA   C7460400002040         mov     dword ptr [esi+$04], $40200000
004E8ED1   E941050000             jmp     004E9417
004E8ED6   83FF08                 cmp     edi, +$08
004E8ED9   0F8738050000           jnbe    004E9417
004E8EDF   FF24BDE68E4E00         jmp     dword ptr [$4E8EE6+edi*4]
004E8EE6   17                     pop     ss
004E8EE7   94                     xchg    eax, esp
004E8EE8   4E                     dec     esi
004E8EE9   000A                   add     [edx], cl
004E8EEB   8F4E00                 pop     dword ptr [esi+$00]
004E8EEE   198F4E00198F           sbb     [edi+$8F19004E], ecx
004E8EF4   4E                     dec     esi
004E8EF5   0019                   add     [ecx], bl
004E8EF7   8F4E00                 pop     dword ptr [esi+$00]
004E8EFA   198F4E00298F           sbb     [edi+$8F29004E], ecx
004E8F00   4E                     dec     esi
004E8F01   00508F                 add     [eax-$71], dl
004E8F04   4E                     dec     esi
004E8F05   00608F                 add     [eax-$71], ah
004E8F08   4E                     dec     esi
004E8F09   008B0689068B           add     [ebx+$8B068906], cl
004E8F0F   46                     inc     esi
004E8F10   0489                   add     al, -$77
004E8F12   46                     inc     esi
004E8F13   04E9                   add     al, -$17
004E8F15   FE0400                 inc     byte ptr [eax+eax]
004E8F18   00DD                   add     ch, bl
004E8F1A   06                     push    es
004E8F1B   D835AC964E00           fdiv    dword ptr [$004E96AC]
004E8F21   DD1E                   fstp    qword ptr [esi]
004E8F23   9B                     wait
004E8F24   E9EE040000             jmp     004E9417
004E8F29   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8F2B   E8949CF1FF             call    00402BC4
004E8F30   81E004000000           and     eax, $00000004
004E8F36   33D2                   xor     edx, edx
004E8F38   0FACD002               shrd    eax, edx, $02
004E8F3C   C1EA02                 shr     edx, $02
004E8F3F   8945E8                 mov     [ebp-$18], eax
004E8F42   8955EC                 mov     [ebp-$14], edx
004E8F45   DF6DE8                 fild    qword ptr [ebp-$18]
004E8F48   DD1E                   fstp    qword ptr [esi]
004E8F4A   9B                     wait
004E8F4B   E9C7040000             jmp     004E9417
004E8F50   DD06                   fld     qword ptr [esi]
004E8F52   D835F4954E00           fdiv    dword ptr [$004E95F4]
004E8F58   DD1E                   fstp    qword ptr [esi]
004E8F5A   9B                     wait
004E8F5B   E9B7040000             jmp     004E9417
004E8F60   DB2DB0964E00           fld     tbyte ptr [$004E96B0]
004E8F66   DC3E                   fdivr   qword ptr [esi]
004E8F68   DD1E                   fstp    qword ptr [esi]
004E8F6A   9B                     wait
004E8F6B   E9A7040000             jmp     004E9417
004E8F70   83FF09                 cmp     edi, +$09
004E8F73   0F879E040000           jnbe    004E9417
004E8F79   FF24BD808F4E00         jmp     dword ptr [$4E8F80+edi*4]
004E8F80   17                     pop     ss
004E8F81   94                     xchg    eax, esp
004E8F82   4E                     dec     esi
004E8F83   00A88F4E00A8           add     [eax+$A8004E8F], ch
004E8F89   8F4E00                 pop     dword ptr [esi+$00]
004E8F8C   A88F                   test    al, $8F
004E8F8E   4E                     dec     esi
004E8F8F   00A88F4E00A8           add     [eax+$A8004E8F], ch
004E8F95   8F4E00                 pop     dword ptr [esi+$00]
004E8F98   B88F4E00DF             mov     eax, $DF004E8F
004E8F9D   8F4E00                 pop     dword ptr [esi+$00]
004E8FA0   05904E002C             add     eax, +$2C004E90
004E8FA5   90                     nop
004E8FA6   4E                     dec     esi
004E8FA7   00DD                   add     ch, bl
004E8FA9   06                     push    es
004E8FAA   D83554954E00           fdiv    dword ptr [$004E9554]
004E8FB0   DD1E                   fstp    qword ptr [esi]
004E8FB2   9B                     wait
004E8FB3   E95F040000             jmp     004E9417
004E8FB8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8FBA   E8059CF1FF             call    00402BC4
004E8FBF   81E001000000           and     eax, $00000001
004E8FC5   33D2                   xor     edx, edx
004E8FC7   0FACD000               shrd    eax, edx, $00
004E8FCB   C1EA00                 shr     edx, $00
004E8FCE   8945E8                 mov     [ebp-$18], eax
004E8FD1   8955EC                 mov     [ebp-$14], edx
004E8FD4   DF6DE8                 fild    qword ptr [ebp-$18]
004E8FD7   DD1E                   fstp    qword ptr [esi]
004E8FD9   9B                     wait
004E8FDA   E938040000             jmp     004E9417
004E8FDF   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E8FE1   E8DE9BF1FF             call    00402BC4
004E8FE6   81E002000000           and     eax, $00000002
004E8FEC   33D2                   xor     edx, edx
004E8FEE   0FACD001               shrd    eax, edx, $01
004E8FF2   D1EA                   shr     edx, 1
004E8FF4   8945E8                 mov     [ebp-$18], eax
004E8FF7   8955EC                 mov     [ebp-$14], edx
004E8FFA   DF6DE8                 fild    qword ptr [ebp-$18]
004E8FFD   DD1E                   fstp    qword ptr [esi]
004E8FFF   9B                     wait
004E9000   E912040000             jmp     004E9417
004E9005   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9007   E8B89BF1FF             call    00402BC4
004E900C   81E004000000           and     eax, $00000004
004E9012   33D2                   xor     edx, edx
004E9014   0FACD002               shrd    eax, edx, $02
004E9018   C1EA02                 shr     edx, $02
004E901B   8945E8                 mov     [ebp-$18], eax
004E901E   8955EC                 mov     [ebp-$14], edx
004E9021   DF6DE8                 fild    qword ptr [ebp-$18]
004E9024   DD1E                   fstp    qword ptr [esi]
004E9026   9B                     wait
004E9027   E9EB030000             jmp     004E9417
004E902C   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E902E   E8919BF1FF             call    00402BC4
004E9033   81E008000000           and     eax, $00000008
004E9039   33D2                   xor     edx, edx
004E903B   0FACD003               shrd    eax, edx, $03
004E903F   C1EA03                 shr     edx, $03
004E9042   8945E8                 mov     [ebp-$18], eax
004E9045   8955EC                 mov     [ebp-$14], edx
004E9048   DF6DE8                 fild    qword ptr [ebp-$18]
004E904B   DD1E                   fstp    qword ptr [esi]
004E904D   9B                     wait
004E904E   E9C4030000             jmp     004E9417
004E9053   83FF1E                 cmp     edi, +$1E
004E9056   0F87BB030000           jnbe    004E9417
004E905C   0FB6BF6A904E00         movzx   edi, byte ptr [edi+$4E906A]
004E9063   FF24BD89904E00         jmp     dword ptr [$4E9089+edi*4]
004E906A   0001                   add     [ecx], al
004E906C   0101                   add     [ecx], eax
004E906E   0102                   add     [edx], eax
004E9070   03040506070809         add     eax, [$9080706+eax]
004E9077   0A0B                   or      cl, byte ptr [ebx]
004E9079   0D0B0A0709             or      eax, $09070A0B
004E907E   0C08                   or      al, $08
004E9080   0907                   or      [edi], eax
004E9082   0A0B                   or      cl, byte ptr [ebx]
004E9084   0D0C0E0E0C             or      eax, $0C0E0E0C
004E9089   17                     pop     ss
004E908A   94                     xchg    eax, esp
004E908B   4E                     dec     esi
004E908C   00C5                   add     ch, al
004E908E   90                     nop
004E908F   4E                     dec     esi
004E9090   00D4                   add     ah, dl
004E9092   90                     nop
004E9093   4E                     dec     esi
004E9094   00E4                   add     ah, ah
004E9096   90                     nop
004E9097   4E                     dec     esi
004E9098   00F4                   add     ah, dh
004E909A   90                     nop
004E909B   4E                     dec     esi
004E909C   000491                 add     [ecx+edx*4], al
004E909F   4E                     dec     esi
004E90A0   001A                   add     [edx], bl
004E90A2   91                     xchg    eax, ecx
004E90A3   4E                     dec     esi
004E90A4   0030                   add     [eax], dh
004E90A6   91                     xchg    eax, ecx
004E90A7   4E                     dec     esi
004E90A8   005791                 add     [edi-$6F], dl
004E90AB   4E                     dec     esi
004E90AC   007E91                 add     [esi-$6F], bh
004E90AF   4E                     dec     esi
004E90B0   00A4914E00CB91         add     [ecx+edx*4+$91CB004E], ah
004E90B7   4E                     dec     esi
004E90B8   00F2                   add     dl, dh
004E90BA   91                     xchg    eax, ecx
004E90BB   4E                     dec     esi
004E90BC   0019                   add     [ecx], bl
004E90BE   92                     xchg    eax, edx
004E90BF   4E                     dec     esi
004E90C0   004092                 add     [eax-$6E], al
004E90C3   4E                     dec     esi
004E90C4   008B0689068B           add     [ebx+$8B068906], cl
004E90CA   46                     inc     esi
004E90CB   0489                   add     al, -$77
004E90CD   46                     inc     esi
004E90CE   04E9                   add     al, -$17
004E90D0   43                     inc     ebx
004E90D1   0300                   add     eax, [eax]
004E90D3   00DD                   add     ch, bl
004E90D5   06                     push    es
004E90D6   D80D88954E00           fmul    dword ptr [$004E9588]
004E90DC   DD1E                   fstp    qword ptr [esi]
004E90DE   9B                     wait
004E90DF   E933030000             jmp     004E9417
004E90E4   DD06                   fld     qword ptr [esi]
004E90E6   D835BC964E00           fdiv    dword ptr [$004E96BC]
004E90EC   DD1E                   fstp    qword ptr [esi]
004E90EE   9B                     wait
004E90EF   E923030000             jmp     004E9417
004E90F4   DD06                   fld     qword ptr [esi]
004E90F6   D83584954E00           fdiv    dword ptr [$004E9584]
004E90FC   DD1E                   fstp    qword ptr [esi]
004E90FE   9B                     wait
004E90FF   E913030000             jmp     004E9417
004E9104   DB2DC0964E00           fld     tbyte ptr [$004E96C0]
004E910A   DC0E                   fmul    qword ptr [esi]
004E910C   D805CC964E00           fadd    dword ptr [$004E96CC]
004E9112   DD1E                   fstp    qword ptr [esi]
004E9114   9B                     wait
004E9115   E9FD020000             jmp     004E9417
004E911A   DB2DC0964E00           fld     tbyte ptr [$004E96C0]
004E9120   DC0E                   fmul    qword ptr [esi]
004E9122   D805CC964E00           fadd    dword ptr [$004E96CC]
004E9128   DD1E                   fstp    qword ptr [esi]
004E912A   9B                     wait
004E912B   E9E7020000             jmp     004E9417
004E9130   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9132   E88D9AF1FF             call    00402BC4
004E9137   81E004000000           and     eax, $00000004
004E913D   33D2                   xor     edx, edx
004E913F   0FACD002               shrd    eax, edx, $02
004E9143   C1EA02                 shr     edx, $02
004E9146   8945E8                 mov     [ebp-$18], eax
004E9149   8955EC                 mov     [ebp-$14], edx
004E914C   DF6DE8                 fild    qword ptr [ebp-$18]
004E914F   DD1E                   fstp    qword ptr [esi]
004E9151   9B                     wait
004E9152   E9C0020000             jmp     004E9417
004E9157   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9159   E8669AF1FF             call    00402BC4
004E915E   81E001000000           and     eax, $00000001
004E9164   33D2                   xor     edx, edx
004E9166   0FACD000               shrd    eax, edx, $00
004E916A   C1EA00                 shr     edx, $00
004E916D   8945E8                 mov     [ebp-$18], eax
004E9170   8955EC                 mov     [ebp-$14], edx
004E9173   DF6DE8                 fild    qword ptr [ebp-$18]
004E9176   DD1E                   fstp    qword ptr [esi]
004E9178   9B                     wait
004E9179   E999020000             jmp     004E9417
004E917E   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9180   E83F9AF1FF             call    00402BC4
004E9185   81E002000000           and     eax, $00000002
004E918B   33D2                   xor     edx, edx
004E918D   0FACD001               shrd    eax, edx, $01
004E9191   D1EA                   shr     edx, 1
004E9193   8945E8                 mov     [ebp-$18], eax
004E9196   8955EC                 mov     [ebp-$14], edx
004E9199   DF6DE8                 fild    qword ptr [ebp-$18]
004E919C   DD1E                   fstp    qword ptr [esi]
004E919E   9B                     wait
004E919F   E973020000             jmp     004E9417
004E91A4   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E91A6   E8199AF1FF             call    00402BC4
004E91AB   81E008000000           and     eax, $00000008
004E91B1   33D2                   xor     edx, edx
004E91B3   0FACD003               shrd    eax, edx, $03
004E91B7   C1EA03                 shr     edx, $03
004E91BA   8945E8                 mov     [ebp-$18], eax
004E91BD   8955EC                 mov     [ebp-$14], edx
004E91C0   DF6DE8                 fild    qword ptr [ebp-$18]
004E91C3   DD1E                   fstp    qword ptr [esi]
004E91C5   9B                     wait
004E91C6   E94C020000             jmp     004E9417
004E91CB   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E91CD   E8F299F1FF             call    00402BC4
004E91D2   81E010000000           and     eax, $00000010
004E91D8   33D2                   xor     edx, edx
004E91DA   0FACD004               shrd    eax, edx, $04
004E91DE   C1EA04                 shr     edx, $04
004E91E1   8945E8                 mov     [ebp-$18], eax
004E91E4   8955EC                 mov     [ebp-$14], edx
004E91E7   DF6DE8                 fild    qword ptr [ebp-$18]
004E91EA   DD1E                   fstp    qword ptr [esi]
004E91EC   9B                     wait
004E91ED   E925020000             jmp     004E9417
004E91F2   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E91F4   E8CB99F1FF             call    00402BC4
004E91F9   81E040000000           and     eax, $00000040
004E91FF   33D2                   xor     edx, edx
004E9201   0FACD006               shrd    eax, edx, $06
004E9205   C1EA06                 shr     edx, $06
004E9208   8945E8                 mov     [ebp-$18], eax
004E920B   8955EC                 mov     [ebp-$14], edx
004E920E   DF6DE8                 fild    qword ptr [ebp-$18]
004E9211   DD1E                   fstp    qword ptr [esi]
004E9213   9B                     wait
004E9214   E9FE010000             jmp     004E9417
004E9219   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E921B   E8A499F1FF             call    00402BC4
004E9220   81E020000000           and     eax, $00000020
004E9226   33D2                   xor     edx, edx
004E9228   0FACD005               shrd    eax, edx, $05
004E922C   C1EA05                 shr     edx, $05
004E922F   8945E8                 mov     [ebp-$18], eax
004E9232   8955EC                 mov     [ebp-$14], edx
004E9235   DF6DE8                 fild    qword ptr [ebp-$18]
004E9238   DD1E                   fstp    qword ptr [esi]
004E923A   9B                     wait
004E923B   E9D7010000             jmp     004E9417
004E9240   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9242   E87D99F1FF             call    00402BC4
004E9247   81E080000000           and     eax, $00000080
004E924D   33D2                   xor     edx, edx
004E924F   0FACD007               shrd    eax, edx, $07
004E9253   C1EA07                 shr     edx, $07
004E9256   8945E8                 mov     [ebp-$18], eax
004E9259   8955EC                 mov     [ebp-$14], edx
004E925C   DF6DE8                 fild    qword ptr [ebp-$18]
004E925F   DD1E                   fstp    qword ptr [esi]
004E9261   9B                     wait
004E9262   E9B0010000             jmp     004E9417
004E9267   83FF10                 cmp     edi, +$10
004E926A   0F87A7010000           jnbe    004E9417
004E9270   0FB6BF7E924E00         movzx   edi, byte ptr [edi+$4E927E]
004E9277   FF24BD8F924E00         jmp     dword ptr [$4E928F+edi*4]
004E927E   0001                   add     [ecx], al
004E9280   0101                   add     [ecx], eax
004E9282   0102                   add     [edx], eax
004E9284   030401                 add     eax, [ecx+eax]
004E9287   0404                   add     al, +$04
004E9289   0404                   add     al, +$04
004E928B   0403                   add     al, +$03
004E928D   050617944E             add     eax, +$4E941706
004E9292   00AB924E00BA           add     [ebx+$BA004E92], ch
004E9298   92                     xchg    eax, edx
004E9299   4E                     dec     esi
004E929A   00CA                   add     dl, cl
004E929C   92                     xchg    eax, edx
004E929D   4E                     dec     esi
004E929E   0021                   add     [ecx], ah
004E92A0   93                     xchg    eax, ebx
004E92A1   4E                     dec     esi
004E92A2   007793                 add     [edi-$6D], dh
004E92A5   4E                     dec     esi
004E92A6   00C8                   add     al, cl
004E92A8   93                     xchg    eax, ebx
004E92A9   4E                     dec     esi
004E92AA   008B0689068B           add     [ebx+$8B068906], cl
004E92B0   46                     inc     esi
004E92B1   0489                   add     al, -$77
004E92B3   46                     inc     esi
004E92B4   04E9                   add     al, -$17
004E92B6   5D                     pop     ebp
004E92B7   0100                   add     [eax], eax
004E92B9   00DD                   add     ch, bl
004E92BB   06                     push    es
004E92BC   D835D0964E00           fdiv    dword ptr [$004E96D0]
004E92C2   DD1E                   fstp    qword ptr [esi]
004E92C4   9B                     wait
004E92C5   E94D010000             jmp     004E9417
004E92CA   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E92CC   E8F398F1FF             call    00402BC4
004E92D1   81E008000000           and     eax, $00000008
004E92D7   33D2                   xor     edx, edx
004E92D9   0FACD003               shrd    eax, edx, $03
004E92DD   C1EA03                 shr     edx, $03
004E92E0   83FA00                 cmp     edx, +$00
004E92E3   7515                   jnz     004E92FA
004E92E5   83F801                 cmp     eax, +$01
004E92E8   7510                   jnz     004E92FA
004E92EA   33C0                   xor     eax, eax
004E92EC   8906                   mov     [esi], eax
004E92EE   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E92F5   E91D010000             jmp     004E9417
004E92FA   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E92FC   E8C398F1FF             call    00402BC4
004E9301   81E004000000           and     eax, $00000004
004E9307   33D2                   xor     edx, edx
004E9309   0FACD002               shrd    eax, edx, $02
004E930D   C1EA02                 shr     edx, $02
004E9310   8945E8                 mov     [ebp-$18], eax
004E9313   8955EC                 mov     [ebp-$14], edx
004E9316   DF6DE8                 fild    qword ptr [ebp-$18]
004E9319   DD1E                   fstp    qword ptr [esi]
004E931B   9B                     wait
004E931C   E9F6000000             jmp     004E9417
004E9321   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9323   E89C98F1FF             call    00402BC4
004E9328   81E002000000           and     eax, $00000002
004E932E   33D2                   xor     edx, edx
004E9330   0FACD001               shrd    eax, edx, $01
004E9334   D1EA                   shr     edx, 1
004E9336   83FA00                 cmp     edx, +$00
004E9339   7515                   jnz     004E9350
004E933B   83F801                 cmp     eax, +$01
004E933E   7510                   jnz     004E9350
004E9340   33C0                   xor     eax, eax
004E9342   8906                   mov     [esi], eax
004E9344   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E934B   E9C7000000             jmp     004E9417
004E9350   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9352   E86D98F1FF             call    00402BC4
004E9357   81E001000000           and     eax, $00000001
004E935D   33D2                   xor     edx, edx
004E935F   0FACD000               shrd    eax, edx, $00
004E9363   C1EA00                 shr     edx, $00
004E9366   8945E8                 mov     [ebp-$18], eax
004E9369   8955EC                 mov     [ebp-$14], edx
004E936C   DF6DE8                 fild    qword ptr [ebp-$18]
004E936F   DD1E                   fstp    qword ptr [esi]
004E9371   9B                     wait
004E9372   E9A0000000             jmp     004E9417
004E9377   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9379   E84698F1FF             call    00402BC4
004E937E   81E020000000           and     eax, $00000020
004E9384   33D2                   xor     edx, edx
004E9386   0FACD005               shrd    eax, edx, $05
004E938A   C1EA05                 shr     edx, $05
004E938D   83FA00                 cmp     edx, +$00
004E9390   7512                   jnz     004E93A4
004E9392   83F801                 cmp     eax, +$01
004E9395   750D                   jnz     004E93A4
004E9397   33C0                   xor     eax, eax
004E9399   8906                   mov     [esi], eax
004E939B   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E93A2   EB73                   jmp     004E9417
004E93A4   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E93A6   E81998F1FF             call    00402BC4
004E93AB   81E010000000           and     eax, $00000010
004E93B1   33D2                   xor     edx, edx
004E93B3   0FACD004               shrd    eax, edx, $04
004E93B7   C1EA04                 shr     edx, $04
004E93BA   8945E8                 mov     [ebp-$18], eax
004E93BD   8955EC                 mov     [ebp-$14], edx
004E93C0   DF6DE8                 fild    qword ptr [ebp-$18]
004E93C3   DD1E                   fstp    qword ptr [esi]
004E93C5   9B                     wait
004E93C6   EB4F                   jmp     004E9417
004E93C8   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E93CA   E8F597F1FF             call    00402BC4
004E93CF   81E080000000           and     eax, $00000080
004E93D5   33D2                   xor     edx, edx
004E93D7   0FACD007               shrd    eax, edx, $07
004E93DB   C1EA07                 shr     edx, $07
004E93DE   83FA00                 cmp     edx, +$00
004E93E1   7512                   jnz     004E93F5
004E93E3   83F801                 cmp     eax, +$01
004E93E6   750D                   jnz     004E93F5
004E93E8   33C0                   xor     eax, eax
004E93EA   8906                   mov     [esi], eax
004E93EC   C7460400000040         mov     dword ptr [esi+$04], $40000000
004E93F3   EB22                   jmp     004E9417
004E93F5   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E93F7   E8C897F1FF             call    00402BC4
004E93FC   81E040000000           and     eax, $00000040
004E9402   33D2                   xor     edx, edx
004E9404   0FACD006               shrd    eax, edx, $06
004E9408   C1EA06                 shr     edx, $06
004E940B   8945E8                 mov     [ebp-$18], eax
004E940E   8955EC                 mov     [ebp-$14], edx
004E9411   DF6DE8                 fild    qword ptr [ebp-$18]
004E9414   DD1E                   fstp    qword ptr [esi]
004E9416   9B                     wait
004E9417   8B4508                 mov     eax, [ebp+$08]
004E941A   8B38                   mov     edi, [eax]
004E941C   8D3CFF                 lea     edi, [edi+edi*8]
004E941F   833CBDB8224F0000       cmp     dword ptr [$4F22B8+edi*4], +$00
004E9427   0F8581000000           jnz     004E94AE
004E942D   8B450C                 mov     eax, [ebp+$0C]
004E9430   8B5508                 mov     edx, [ebp+$08]
004E9433   8B14BDCC224F00         mov     edx, [$4F22CC+edi*4]

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E943A   E841B6F1FF             call    00404A80
004E943F   DD06                   fld     qword ptr [esi]

* Reference to: System.@ROUND;
|
004E9441   E87E97F1FF             call    00402BC4
004E9446   8BD8                   mov     ebx, eax
004E9448   85DB                   test    ebx, ebx
004E944A   7E28                   jle     004E9474
004E944C   8B450C                 mov     eax, [ebp+$0C]
004E944F   50                     push    eax
004E9450   8B550C                 mov     edx, [ebp+$0C]
004E9453   8B12                   mov     edx, [edx]
004E9455   B8DC964E00             mov     eax, $004E96DC

* Reference to: System.@LStrPos;
|
004E945A   E8D1BBF1FF             call    00405030
004E945F   8BD0                   mov     edx, eax
004E9461   42                     inc     edx
004E9462   8B450C                 mov     eax, [ebp+$0C]
004E9465   8B00                   mov     eax, [eax]
004E9467   B964000000             mov     ecx, $00000064

* Reference to: System.@LStrCopy;
|
004E946C   E8DBBAF1FF             call    00404F4C
004E9471   4B                     dec     ebx
004E9472   75D8                   jnz     004E944C
004E9474   8B550C                 mov     edx, [ebp+$0C]
004E9477   8B12                   mov     edx, [edx]
004E9479   B8DC964E00             mov     eax, $004E96DC

* Reference to: System.@LStrPos;
|
004E947E   E8ADBBF1FF             call    00405030
004E9483   85C0                   test    eax, eax
004E9485   7E7A                   jle     004E9501
004E9487   8B450C                 mov     eax, [ebp+$0C]
004E948A   50                     push    eax
004E948B   8B550C                 mov     edx, [ebp+$0C]
004E948E   8B12                   mov     edx, [edx]
004E9490   B8DC964E00             mov     eax, $004E96DC

* Reference to: System.@LStrPos;
|
004E9495   E896BBF1FF             call    00405030
004E949A   8BC8                   mov     ecx, eax
004E949C   49                     dec     ecx
004E949D   8B450C                 mov     eax, [ebp+$0C]
004E94A0   8B00                   mov     eax, [eax]
004E94A2   BA01000000             mov     edx, $00000001

* Reference to: System.@LStrCopy;
|
004E94A7   E8A0BAF1FF             call    00404F4C
004E94AC   EB53                   jmp     004E9501
004E94AE   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E94B5   751C                   jnz     004E94D3
004E94B7   DD06                   fld     qword ptr [esi]
004E94B9   D81DBC964E00           fcomp   dword ptr [$004E96BC]
004E94BF   DFE0                   fstsw   ax
004E94C1   9E                     sahf
004E94C2   750F                   jnz     004E94D3
004E94C4   8B450C                 mov     eax, [ebp+$0C]
004E94C7   BAE8964E00             mov     edx, $004E96E8

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E94CC   E8AFB5F1FF             call    00404A80
004E94D1   EB2E                   jmp     004E9501
004E94D3   DD06                   fld     qword ptr [esi]
004E94D5   83C4F4                 add     esp, -$0C
004E94D8   DB3C24                 fstp    tbyte ptr [esp]
004E94DB   9B                     wait
004E94DC   8D45E0                 lea     eax, [ebp-$20]
004E94DF   50                     push    eax
004E94E0   8D04DB                 lea     eax, [ebx+ebx*8]
004E94E3   8B0C85C8224F00         mov     ecx, [$4F22C8+eax*4]
004E94EA   BA14000000             mov     edx, $00000014
004E94EF   B002                   mov     al, $02

* Reference to: SysUtils.FloatToStrF(Extended;TFloatFormat;Integer;Integer):AnsiString;overload;
|
004E94F1   E88E14F2FF             call    0040A984
004E94F6   8B55E0                 mov     edx, [ebp-$20]
004E94F9   8B450C                 mov     eax, [ebp+$0C]

* Reference to: System.@LStrAsg(void;void;void;void);
|
004E94FC   E87FB5F1FF             call    00404A80
004E9501   33C0                   xor     eax, eax
004E9503   5A                     pop     edx
004E9504   59                     pop     ecx
004E9505   59                     pop     ecx
004E9506   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E9509   682E954E00             push    $004E952E
004E950E   8D45E0                 lea     eax, [ebp-$20]

* Reference to: System.@LStrClr(void;void);
|
004E9511   E816B5F1FF             call    00404A2C
004E9516   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E9519   E80EB5F1FF             call    00404A2C
004E951E   8D45F0                 lea     eax, [ebp-$10]

* Reference to: System.@LStrClr(void;void);
|
004E9521   E806B5F1FF             call    00404A2C
004E9526   C3                     ret

*)
end;

procedure TForm1.MenuItem_LoadClick(Sender : TObject);
begin
(*
004E98A8   55                     push    ebp
004E98A9   8BEC                   mov     ebp, esp
004E98AB   83C4E0                 add     esp, -$20
004E98AE   53                     push    ebx
004E98AF   56                     push    esi
004E98B0   57                     push    edi
004E98B1   33C9                   xor     ecx, ecx
004E98B3   894DE4                 mov     [ebp-$1C], ecx
004E98B6   894DE0                 mov     [ebp-$20], ecx
004E98B9   894DE8                 mov     [ebp-$18], ecx
004E98BC   894DEC                 mov     [ebp-$14], ecx
004E98BF   8BD8                   mov     ebx, eax
004E98C1   33C0                   xor     eax, eax
004E98C3   55                     push    ebp

* Possible String Reference to: 'й8ЈсялЫ_^[‹е]Г'
|
004E98C4   686FA04E00             push    $004EA06F

***** TRY
|
004E98C9   64FF30                 push    dword ptr fs:[eax]
004E98CC   648920                 mov     fs:[eax], esp
004E98CF   C60534724F0000         mov     byte ptr [$004F7234], $00

* Reference to TGrafForm instance
|
004E98D6   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004E98DB   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.DriveIM : TMenuItem
|
004E98DD   8B80EC030000           mov     eax, [eax+$03EC]
004E98E3   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E98E5   E8BA93F8FF             call    00472CA4
004E98EA   803D27724F0001         cmp     byte ptr [$004F7227], $01
004E98F1   7509                   jnz     004E98FC
004E98F3   C60527724F0000         mov     byte ptr [$004F7227], $00
004E98FA   EB2E                   jmp     004E992A

* Reference to control TForm1.OpenDialog : TOpenDialog
|
004E98FC   8B833C030000           mov     eax, [ebx+$033C]
004E9902   8B10                   mov     edx, [eax]

* Reference to method TOpenDialog.Execute()
|
004E9904   FF523C                 call    dword ptr [edx+$3C]
004E9907   84C0                   test    al, al
004E9909   0F8435070000           jz      004EA044
004E990F   8D55E8                 lea     edx, [ebp-$18]

* Reference to control TForm1.OpenDialog : TOpenDialog
|
004E9912   8B833C030000           mov     eax, [ebx+$033C]

* Reference to: Dialogs.TOpenDialog.GetFileName(TOpenDialog):TFileName;
|
004E9918   E8C788F4FF             call    004321E4
004E991D   8B55E8                 mov     edx, [ebp-$18]
004E9920   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E9925   E8A295F1FF             call    00402ECC
004E992A   BA01000000             mov     edx, $00000001
004E992F   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004E9934   E8D79AF1FF             call    00403410

|
004E9939   E8768FF1FF             call    004028B4
004E993E   68CC6D4F00             push    $004F6DCC
004E9943   BAF86D4F00             mov     edx, $004F6DF8
004E9948   B901000000             mov     ecx, $00000001
004E994D   B8006F4F00             mov     eax, $004F6F00

|
004E9952   E8D996F1FF             call    00403030

|
004E9957   E8588FF1FF             call    004028B4
004E995C   A0F86D4F00             mov     al, byte ptr [$004F6DF8]

* Reference to GlobalVar_004F6DA7
|
004E9961   A2A76D4F00             mov     byte ptr [$004F6DA7], al
004E9966   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E996D   750C                   jnz     004E997B
004E996F   C705D86D4F0080000000   mov     dword ptr [$004F6DD8], $00000080
004E9979   EB0A                   jmp     004E9985
004E997B   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E9985   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E998A   E8F198F1FF             call    00403280

|
004E998F   E8208FF1FF             call    004028B4
004E9994   3D80000000             cmp     eax, $00000080
004E9999   7C1F                   jl      004E99BA
004E999B   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E99A0   E8DB98F1FF             call    00403280

|
004E99A5   E80A8FF1FF             call    004028B4
004E99AA   253F000080             and     eax, $8000003F
004E99AF   7905                   jns     004E99B6
004E99B1   48                     dec     eax
004E99B2   83C8C0                 or      eax, -$40
004E99B5   40                     inc     eax
004E99B6   85C0                   test    eax, eax
004E99B8   742A                   jz      004E99E4
004E99BA   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004E99BF   E8AC96F1FF             call    00403070

|
004E99C4   E8EB8EF1FF             call    004028B4
004E99C9   6810100000             push    $00001010

* Possible String Reference to: 'Ошибка'
|
004E99CE   6880A04E00             push    $004EA080

* Possible String Reference to: 'Неверный размер файла.'
|
004E99D3   6888A04E00             push    $004EA088
004E99D8   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004E99DA   E889DEF1FF             call    00407868
004E99DF   E960060000             jmp     004EA044
004E99E4   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E99E9   E89298F1FF             call    00403280

|
004E99EE   E8C18EF1FF             call    004028B4
004E99F3   3D00010000             cmp     eax, $00000100
004E99F8   0F8EDA000000           jle     004E9AD8
004E99FE   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9A03   E87898F1FF             call    00403280

|
004E9A08   E8A78EF1FF             call    004028B4
004E9A0D   8BD0                   mov     edx, eax
004E9A0F   2B15D86D4F00           sub     edx, dword ptr [$004F6DD8]
004E9A15   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E9A1A   E8199AF1FF             call    00403438

|
004E9A1F   E8908EF1FF             call    004028B4
004E9A24   68CC6D4F00             push    $004F6DCC
004E9A29   BAF86D4F00             mov     edx, $004F6DF8
004E9A2E   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9A34   B8006F4F00             mov     eax, $004F6F00

|
004E9A39   E8F295F1FF             call    00403030

|
004E9A3E   E8718EF1FF             call    004028B4
004E9A43   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9A48   2C11                   sub     al, $11
004E9A4A   7404                   jz      004E9A50
004E9A4C   2C02                   sub     al, $02
004E9A4E   7509                   jnz     004E9A59
004E9A50   803D026E4F0002         cmp     byte ptr [$004F6E02], $02
004E9A57   7436                   jz      004E9A8F
004E9A59   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004E9A60   7509                   jnz     004E9A6B
004E9A62   803D026E4F00F0         cmp     byte ptr [$004F6E02], $F0
004E9A69   7424                   jz      004E9A8F
004E9A6B   803DA76D4F0043         cmp     byte ptr [$004F6DA7], $43
004E9A72   7509                   jnz     004E9A7D
004E9A74   803D026E4F0001         cmp     byte ptr [$004F6E02], $01
004E9A7B   7412                   jz      004E9A8F
004E9A7D   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E9A84   753E                   jnz     004E9AC4
004E9A86   803D036E4F0001         cmp     byte ptr [$004F6E03], $01
004E9A8D   7535                   jnz     004E9AC4
004E9A8F   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9A94   E8E797F1FF             call    00403280

|
004E9A99   E8168EF1FF             call    004028B4
004E9A9E   8BD0                   mov     edx, eax
004E9AA0   2B15D86D4F00           sub     edx, dword ptr [$004F6DD8]
004E9AA6   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E9AAB   E88899F1FF             call    00403438

|
004E9AB0   E8FF8DF1FF             call    004028B4
004E9AB5   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Truncate(TFileRec;TFileRec);
|
004E9ABA   E8AD99F1FF             call    0040346C

|
004E9ABF   E8F08DF1FF             call    004028B4
004E9AC4   BA01000000             mov     edx, $00000001
004E9AC9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@ResetFile(TFileRec;TFileRec;Integer):Integer;
|
004E9ACE   E83D99F1FF             call    00403410

|
004E9AD3   E8DC8DF1FF             call    004028B4
004E9AD8   68CC6D4F00             push    $004F6DCC
004E9ADD   BAF86D4F00             mov     edx, $004F6DF8
004E9AE2   B980000000             mov     ecx, $00000080
004E9AE7   B8006F4F00             mov     eax, $004F6F00

|
004E9AEC   E83F95F1FF             call    00403030

|
004E9AF1   E8BE8DF1FF             call    004028B4
004E9AF6   A03B6E4F00             mov     al, byte ptr [$004F6E3B]
004E9AFB   2C13                   sub     al, $13
004E9AFD   7418                   jz      004E9B17
004E9AFF   04FB                   add     al, -$05
004E9B01   2C02                   sub     al, $02
004E9B03   7212                   jb      004E9B17
004E9B05   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E9B0C   7518                   jnz     004E9B26
004E9B0E   803D3C6E4F0018         cmp     byte ptr [$004F6E3C], $18
004E9B15   750F                   jnz     004E9B26
004E9B17   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004E9B19   8B8340030000           mov     eax, [ebx+$0340]
004E9B1F   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9B21   FF5164                 call    dword ptr [ecx+$64]
004E9B24   EB0D                   jmp     004E9B33
004E9B26   33D2                   xor     edx, edx

* Reference to control TForm1.Button_DTC : TButton
|
004E9B28   8B8340030000           mov     eax, [ebx+$0340]
004E9B2E   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9B30   FF5164                 call    dword ptr [ecx+$64]
004E9B33   33FF                   xor     edi, edi
004E9B35   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DC8
|
004E9B37   A3C86D4F00             mov     dword ptr [$004F6DC8], eax
004E9B3C   33C0                   xor     eax, eax
004E9B3E   8905E46D4F00           mov     [$004F6DE4], eax
004E9B44   8905E86D4F00           mov     [$004F6DE8], eax
004E9B4A   33C0                   xor     eax, eax
004E9B4C   8905DC6D4F00           mov     [$004F6DDC], eax
004E9B52   8905E06D4F00           mov     [$004F6DE0], eax

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E9B58   8B8334030000           mov     eax, [ebx+$0334]
004E9B5E   66BEEBFF               mov     si, $FFEB

* Reference to: System.@CallDynaInst;
|
004E9B62   E8ADA2F1FF             call    00403E14
004E9B67   803D386E4F00FF         cmp     byte ptr [$004F6E38], $FF
004E9B6E   7507                   jnz     004E9B77
004E9B70   C60534724F0001         mov     byte ptr [$004F7234], $01
004E9B77   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9B7C   E8FF96F1FF             call    00403280

|
004E9B81   E82E8DF1FF             call    004028B4
004E9B86   3D80000000             cmp     eax, $00000080
004E9B8B   0F8EE8030000           jle     004E9F79
004E9B91   8BD7                   mov     edx, edi
004E9B93   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E9B98   E89B98F1FF             call    00403438

|
004E9B9D   E8128DF1FF             call    004028B4
004E9BA2   68CC6D4F00             push    $004F6DCC
004E9BA7   BAF86D4F00             mov     edx, $004F6DF8
004E9BAC   B940000000             mov     ecx, $00000040
004E9BB1   B8006F4F00             mov     eax, $004F6F00

|
004E9BB6   E87594F1FF             call    00403030

|
004E9BBB   E8F48CF1FF             call    004028B4
004E9BC0   8BC3                   mov     eax, ebx

* Reference to : TForm1.VichMaxNomParam()
|
004E9BC2   E8319AFFFF             call    004E35F8
004E9BC7   8D4DE0                 lea     ecx, [ebp-$20]
004E9BCA   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]
004E9BD0   8BC3                   mov     eax, ebx

* Reference to : TForm1.PreobrTipECU()
|
004E9BD2   E81D94FFFF             call    004E2FF4
004E9BD7   8B4DE0                 mov     ecx, [ebp-$20]
004E9BDA   8D45E4                 lea     eax, [ebp-$1C]

* Possible String Reference to: '  ЭБУ '
|
004E9BDD   BAA8A04E00             mov     edx, $004EA0A8

* Reference to: System.@LStrCat3;
|
004E9BE2   E851B1F1FF             call    00404D38
004E9BE7   8B45E4                 mov     eax, [ebp-$1C]
004E9BEA   50                     push    eax

* Reference to control TForm1.StatusBar1 : TStatusBar
|
004E9BEB   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to field TStatusBar.Panels : TStatusPanels
|
004E9BF1   8B8008020000           mov     eax, [eax+$0208]
004E9BF7   BA02000000             mov     edx, $00000002

* Reference to: ComCtrls.TStatusPanels.GetItem(TStatusPanels;Integer):TStatusPanel;
|
004E9BFC   E8975FF5FF             call    0043FB98
004E9C01   5A                     pop     edx

* Reference to: ComCtrls.TStatusPanel.SetText(TStatusPanel;AnsiString);
|
004E9C02   E8ED5EF5FF             call    0043FAF4
004E9C07   EB21                   jmp     004E9C2A
004E9C09   68CC6D4F00             push    $004F6DCC
004E9C0E   BAF86D4F00             mov     edx, $004F6DF8
004E9C13   B940000000             mov     ecx, $00000040
004E9C18   B8006F4F00             mov     eax, $004F6F00

|
004E9C1D   E80E94F1FF             call    00403030

|
004E9C22   E88D8CF1FF             call    004028B4
004E9C27   83C740                 add     edi, +$40
004E9C2A   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9C2F   2C11                   sub     al, $11
004E9C31   7404                   jz      004E9C37
004E9C33   2C02                   sub     al, $02
004E9C35   751B                   jnz     004E9C52
004E9C37   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9C3E   7512                   jnz     004E9C52
004E9C40   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9C47   75C0                   jnz     004E9C09
004E9C49   803D026E4F0002         cmp     byte ptr [$004F6E02], $02
004E9C50   75B7                   jnz     004E9C09
004E9C52   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9C57   2C12                   sub     al, $12
004E9C59   7404                   jz      004E9C5F
004E9C5B   2C10                   sub     al, $10
004E9C5D   7512                   jnz     004E9C71
004E9C5F   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9C66   75A1                   jnz     004E9C09
004E9C68   803D026E4F00F0         cmp     byte ptr [$004F6E02], $F0
004E9C6F   7598                   jnz     004E9C09
004E9C71   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9C76   2C21                   sub     al, $21
004E9C78   7408                   jz      004E9C82
004E9C7A   2C20                   sub     al, $20
004E9C7C   7404                   jz      004E9C82
004E9C7E   2C02                   sub     al, $02
004E9C80   751A                   jnz     004E9C9C
004E9C82   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9C89   0F857AFFFFFF           jnz     004E9C09
004E9C8F   803D026E4F0001         cmp     byte ptr [$004F6E02], $01
004E9C96   0F856DFFFFFF           jnz     004E9C09
004E9C9C   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004E9CA3   751A                   jnz     004E9CBF
004E9CA5   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9CAC   0F8557FFFFFF           jnz     004E9C09
004E9CB2   803D046E4F0001         cmp     byte ptr [$004F6E04], $01
004E9CB9   0F854AFFFFFF           jnz     004E9C09
004E9CBF   803DA76D4F0044         cmp     byte ptr [$004F6DA7], $44
004E9CC6   751A                   jnz     004E9CE2
004E9CC8   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9CCF   0F8534FFFFFF           jnz     004E9C09
004E9CD5   803D026E4F0020         cmp     byte ptr [$004F6E02], $20
004E9CDC   0F8527FFFFFF           jnz     004E9C09
004E9CE2   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004E9CE9   750D                   jnz     004E9CF8
004E9CEB   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9CF2   0F8511FFFFFF           jnz     004E9C09
004E9CF8   803DA76D4F0032         cmp     byte ptr [$004F6DA7], $32
004E9CFF   750D                   jnz     004E9D0E
004E9D01   803D036E4F0061         cmp     byte ptr [$004F6E03], $61
004E9D08   0F85FBFEFFFF           jnz     004E9C09
004E9D0E   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9D15   750D                   jnz     004E9D24
004E9D17   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004E9D1E   0F85E5FEFFFF           jnz     004E9C09
004E9D24   8BD7                   mov     edx, edi
004E9D26   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Seek(TFileRec;TFileRec;Cardinal);
|
004E9D2B   E80897F1FF             call    00403438

|
004E9D30   E87F8BF1FF             call    004028B4
004E9D35   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9D3A   04EF                   add     al, -$11
004E9D3C   2C04                   sub     al, $04
004E9D3E   7204                   jb      004E9D44
004E9D40   2C2E                   sub     al, $2E
004E9D42   7545                   jnz     004E9D89
004E9D44   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9D4B   753C                   jnz     004E9D89
004E9D4D   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9D52   E82995F1FF             call    00403280

|
004E9D57   E8588BF1FF             call    004028B4
004E9D5C   2BC7                   sub     eax, edi
004E9D5E   8B15D86D4F00           mov     edx, [$004F6DD8]
004E9D64   03D2                   add     edx, edx
004E9D66   8BCA                   mov     ecx, edx
004E9D68   99                     cdq
004E9D69   F7F9                   idiv    ecx 
004E9D6B   50                     push    eax
004E9D6C   B8F86E4F00             mov     eax, $004F6EF8
004E9D71   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E9D76   8B15ECFA4D00           mov     edx, [$004DFAEC]

* Reference to: System.@DynArraySetLength;
|
004E9D7C   E8B3BFF1FF             call    00405D34
004E9D81   83C404                 add     esp, +$04
004E9D84   E9CC010000             jmp     004E9F55
004E9D89   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@FileSize(TFileRec;TFileRec):Integer;
|
004E9D8E   E8ED94F1FF             call    00403280

|
004E9D93   E81C8BF1FF             call    004028B4
004E9D98   2BC7                   sub     eax, edi
004E9D9A   85C0                   test    eax, eax
004E9D9C   7903                   jns     004E9DA1
004E9D9E   83C03F                 add     eax, +$3F
004E9DA1   C1F806                 sar     eax, $06
004E9DA4   50                     push    eax
004E9DA5   B8F86E4F00             mov     eax, $004F6EF8
004E9DAA   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E9DAF   8B15ECFA4D00           mov     edx, [$004DFAEC]

* Reference to: System.@DynArraySetLength;
|
004E9DB5   E87ABFF1FF             call    00405D34
004E9DBA   83C404                 add     esp, +$04
004E9DBD   E993010000             jmp     004E9F55
004E9DC2   68CC6D4F00             push    $004F6DCC
004E9DC7   BAF86D4F00             mov     edx, $004F6DF8
004E9DCC   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9DD2   B8006F4F00             mov     eax, $004F6F00

|
004E9DD7   E85492F1FF             call    00403030

|
004E9DDC   E8D38AF1FF             call    004028B4
004E9DE1   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9DE6   0FB680F76D4F00         movzx   eax, byte ptr [eax+$4F6DF7]
004E9DED   03C0                   add     eax, eax
004E9DEF   8D0480                 lea     eax, [eax+eax*4]
004E9DF2   50                     push    eax
004E9DF3   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9DF8   33C9                   xor     ecx, ecx
004E9DFA   8A88F66D4F00           mov     cl, byte ptr [eax+$4F6DF6]
004E9E00   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9E05   33D2                   xor     edx, edx
004E9E07   8A90F56D4F00           mov     dl, byte ptr [eax+$4F6DF5]
004E9E0D   A1D86D4F00             mov     eax, dword ptr [$004F6DD8]
004E9E12   0FB680F46D4F00         movzx   eax, byte ptr [eax+$4F6DF4]

* Reference to: SysUtils.EncodeTime(Word;Word;Word;Word):TDateTime;
|
004E9E19   E8760DF2FF             call    0040AB94
004E9E1E   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9E25   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9E2B   DD1CC2                 fstp    qword ptr [edx+eax*8]
004E9E2E   9B                     wait
004E9E2F   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9E36   7416                   jz      004E9E4E
004E9E38   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9E3F   755F                   jnz     004E9EA0
004E9E41   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9E46   2C12                   sub     al, $12
004E9E48   7404                   jz      004E9E4E
004E9E4A   2C02                   sub     al, $02
004E9E4C   7552                   jnz     004E9EA0
004E9E4E   8B3DD06D4F00           mov     edi, [$004F6DD0]
004E9E54   85FF                   test    edi, edi
004E9E56   7E48                   jle     004E9EA0
004E9E58   BE01000000             mov     esi, $00000001
004E9E5D   8D45F0                 lea     eax, [ebp-$10]
004E9E60   50                     push    eax
004E9E61   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004E9E64   E8C3ABF1FF             call    00404A2C
004E9E69   50                     push    eax
004E9E6A   8D45FC                 lea     eax, [ebp-$04]
004E9E6D   50                     push    eax
004E9E6E   33C9                   xor     ecx, ecx
004E9E70   8BD6                   mov     edx, esi
004E9E72   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E9E74   E8F7CCFFFF             call    004E6B70
004E9E79   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E9E7D   7E1D                   jle     004E9E9C
004E9E7F   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9E86   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9E8C   8D04C2                 lea     eax, [edx+eax*8]
004E9E8F   8B55F0                 mov     edx, [ebp-$10]
004E9E92   8914F0                 mov     [eax+esi*8], edx
004E9E95   8B55F4                 mov     edx, [ebp-$0C]
004E9E98   8954F004               mov     [eax+esi*8+$04], edx
004E9E9C   46                     inc     esi
004E9E9D   4F                     dec     edi
004E9E9E   75BD                   jnz     004E9E5D
004E9EA0   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9EA5   04EF                   add     al, -$11
004E9EA7   2C04                   sub     al, $04
004E9EA9   7204                   jb      004E9EAF
004E9EAB   2C2E                   sub     al, $2E
004E9EAD   7509                   jnz     004E9EB8
004E9EAF   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9EB6   741A                   jz      004E9ED2
004E9EB8   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E9EBF   0F858A000000           jnz     004E9F4F
004E9EC5   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E9ECA   2C11                   sub     al, $11
004E9ECC   7404                   jz      004E9ED2
004E9ECE   2C02                   sub     al, $02
004E9ED0   757D                   jnz     004E9F4F
004E9ED2   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E9ED9   751F                   jnz     004E9EFA
004E9EDB   68CC6D4F00             push    $004F6DCC
004E9EE0   BAF86D4F00             mov     edx, $004F6DF8
004E9EE5   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E9EEB   B8006F4F00             mov     eax, $004F6F00

|
004E9EF0   E83B91F1FF             call    00403030

|
004E9EF5   E8BA89F1FF             call    004028B4
004E9EFA   8B35D06D4F00           mov     esi, [$004F6DD0]
004E9F00   46                     inc     esi
004E9F01   8B3DD46D4F00           mov     edi, [$004F6DD4]
004E9F07   2BFE                   sub     edi, esi
004E9F09   7C44                   jl      004E9F4F
004E9F0B   47                     inc     edi
004E9F0C   8D45F0                 lea     eax, [ebp-$10]
004E9F0F   50                     push    eax
004E9F10   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004E9F13   E814ABF1FF             call    00404A2C
004E9F18   50                     push    eax
004E9F19   8D45FC                 lea     eax, [ebp-$04]
004E9F1C   50                     push    eax
004E9F1D   33C9                   xor     ecx, ecx
004E9F1F   8BD6                   mov     edx, esi
004E9F21   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E9F23   E848CCFFFF             call    004E6B70
004E9F28   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E9F2C   7E1D                   jle     004E9F4B
004E9F2E   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E9F35   8B15F86E4F00           mov     edx, [$004F6EF8]
004E9F3B   8D04C2                 lea     eax, [edx+eax*8]
004E9F3E   8B55F0                 mov     edx, [ebp-$10]
004E9F41   8914F0                 mov     [eax+esi*8], edx
004E9F44   8B55F4                 mov     edx, [ebp-$0C]
004E9F47   8954F004               mov     [eax+esi*8+$04], edx
004E9F4B   46                     inc     esi
004E9F4C   4F                     dec     edi
004E9F4D   75BD                   jnz     004E9F0C
004E9F4F   FF05C86D4F00           inc     dword ptr [$004F6DC8]
004E9F55   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@EofFile(TFileRec;TFileRec):Boolean;
|
004E9F5A   E8B592F1FF             call    00403214

|
004E9F5F   E85089F1FF             call    004028B4
004E9F64   84C0                   test    al, al
004E9F66   0F8456FEFFFF           jz      004E9DC2
004E9F6C   B201                   mov     dl, $01

* Reference to control TForm1.Button_Graf : TButton
|
004E9F6E   8B8348030000           mov     eax, [ebx+$0348]
004E9F74   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9F76   FF5164                 call    dword ptr [ecx+$64]
004E9F79   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004E9F7E   E8ED90F1FF             call    00403070

|
004E9F83   E82C89F1FF             call    004028B4
004E9F88   33C9                   xor     ecx, ecx
004E9F8A   33D2                   xor     edx, edx

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E9F8C   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E9F8F   E8744FF7FF             call    0045EF08
004E9F94   33C9                   xor     ecx, ecx
004E9F96   BA01000000             mov     edx, $00000001

* Reference to field TForm1.Constraints : TSizeConstraints
|
004E9F9B   8B4374                 mov     eax, [ebx+$74]

* Reference to: Controls.TSizeConstraints.SetConstraints(TSizeConstraints;Integer;TConstraintSize);
|
004E9F9E   E8654FF7FF             call    0045EF08
004E9FA3   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Dvig : TLabel
|
004E9FA5   8B8384030000           mov     eax, [ebx+$0384]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9FAB   E8D461F7FF             call    00460184
004E9FB0   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AKPP : TLabel
|
004E9FB2   8B8388030000           mov     eax, [ebx+$0388]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9FB8   E8C761F7FF             call    00460184
004E9FBD   33D2                   xor     edx, edx

* Reference to control TForm1.Label_ABS : TLabel
|
004E9FBF   8B838C030000           mov     eax, [ebx+$038C]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9FC5   E8BA61F7FF             call    00460184
004E9FCA   33D2                   xor     edx, edx

* Reference to control TForm1.Label_AIRBAG : TLabel
|
004E9FCC   8B8394030000           mov     eax, [ebx+$0394]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9FD2   E8AD61F7FF             call    00460184
004E9FD7   33D2                   xor     edx, edx

* Reference to control TForm1.Label_Load : TLabel
|
004E9FD9   8B8390030000           mov     eax, [ebx+$0390]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E9FDF   E8A061F7FF             call    00460184
004E9FE4   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Parameters : TButton
|
004E9FE6   8B8328030000           mov     eax, [ebx+$0328]
004E9FEC   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9FEE   FF5164                 call    dword ptr [ecx+$64]
004E9FF1   B201                   mov     dl, $01

* Reference to control TForm1.Button_ECUIdent : TButton
|
004E9FF3   8B8334030000           mov     eax, [ebx+$0334]
004E9FF9   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004E9FFB   FF5164                 call    dword ptr [ecx+$64]
004E9FFE   C60519724F0001         mov     byte ptr [$004F7219], $01
004EA005   803DA76D4F0031         cmp     byte ptr [$004F6DA7], $31
004EA00C   7529                   jnz     004EA037
004EA00E   B201                   mov     dl, $01

* Reference to control TForm1.Button_DTC : TButton
|
004EA010   8B8340030000           mov     eax, [ebx+$0340]
004EA016   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EA018   FF5164                 call    dword ptr [ecx+$64]
004EA01B   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Graf : TButton
|
004EA01D   8B8348030000           mov     eax, [ebx+$0348]
004EA023   8B08                   mov     ecx, [eax]

* Reference to method TButton.SetEnabled(Boolean)
|
004EA025   FF5164                 call    dword ptr [ecx+$64]
004EA028   33D2                   xor     edx, edx

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004EA02A   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EA030   E8538BF8FF             call    00472B88
004EA035   EB0D                   jmp     004EA044
004EA037   B201                   mov     dl, $01

* Reference to control TForm1.MenuItem_SaveToXLS : TMenuItem
|
004EA039   8B835C030000           mov     eax, [ebx+$035C]

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EA03F   E8448BF8FF             call    00472B88
004EA044   33C0                   xor     eax, eax
004EA046   5A                     pop     edx
004EA047   59                     pop     ecx
004EA048   59                     pop     ecx
004EA049   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[‹е]Г'
|
004EA04C   6876A04E00             push    $004EA076
004EA051   8D45E0                 lea     eax, [ebp-$20]
004EA054   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EA059   E8F2A9F1FF             call    00404A50
004EA05E   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004EA061   E8C6A9F1FF             call    00404A2C
004EA066   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
004EA069   E8BEA9F1FF             call    00404A2C
004EA06E   C3                     ret


* Reference to: System.@HandleFinally;
|
004EA06F   E938A3F1FF             jmp     004043AC
004EA074   EBDB                   jmp     004EA051

****** END
|
004EA076   5F                     pop     edi
004EA077   5E                     pop     esi
004EA078   5B                     pop     ebx
004EA079   8BE5                   mov     esp, ebp
004EA07B   5D                     pop     ebp
004EA07C   C3                     ret

*)
end;

procedure TForm1.MenuItem_ExitClick(Sender : TObject);
begin
(*

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004EC640   E80B0CF9FF             call    0047D250
004EC645   C3                     ret

*)
end;

procedure TForm1.MenuItem_TestClick(Sender : TObject);
begin
(*
004EBDB0   55                     push    ebp
004EBDB1   8BEC                   mov     ebp, esp
004EBDB3   83C4E8                 add     esp, -$18
004EBDB6   53                     push    ebx
004EBDB7   33C9                   xor     ecx, ecx
004EBDB9   894DE8                 mov     [ebp-$18], ecx
004EBDBC   8BD8                   mov     ebx, eax
004EBDBE   33C0                   xor     eax, eax
004EBDC0   55                     push    ebp

* Possible String Reference to: 'йB„сялр[‹е]Г'
|
004EBDC1   6865BF4E00             push    $004EBF65

***** TRY
|
004EBDC6   64FF30                 push    dword ptr fs:[eax]
004EBDC9   648920                 mov     fs:[eax], esp
004EBDCC   6A01                   push    $01

* Reference to: winmm.timeBeginPeriod()
|
004EBDCE   E8816EFAFF             call    00492C54
004EBDD3   8BC3                   mov     eax, ebx

* Reference to : TForm1.PortInit()
|
004EBDD5   E83E6AFFFF             call    004E2818
004EBDDA   84C0                   test    al, al
004EBDDC   0F846D010000           jz      004EBF4F
004EBDE2   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBDE7   50                     push    eax

* Reference to: kernel32.SetCommBreak()
|
004EBDE8   E823B3F1FF             call    00407110
004EBDED   6A19                   push    $19

* Reference to: kernel32.Sleep()
|
004EBDEF   E88825F2FF             call    0040E37C
004EBDF4   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBDF9   50                     push    eax

* Reference to: kernel32.ClearCommBreak()
|
004EBDFA   E8C1B0F1FF             call    00406EC0
004EBDFF   6A19                   push    $19

* Reference to: kernel32.Sleep()
|
004EBE01   E87625F2FF             call    0040E37C
004EBE06   6A12                   push    $12
004EBE08   C645EC11               mov     byte ptr [ebp-$14], $11
004EBE0C   C645ED18               mov     byte ptr [ebp-$13], $18
004EBE10   C645EE81               mov     byte ptr [ebp-$12], $81
004EBE14   C645EF22               mov     byte ptr [ebp-$11], $22
004EBE18   C645F033               mov     byte ptr [ebp-$10], $33
004EBE1C   C645F144               mov     byte ptr [ebp-$0F], $44
004EBE20   C645F255               mov     byte ptr [ebp-$0E], $55
004EBE24   C645F366               mov     byte ptr [ebp-$0D], $66
004EBE28   C645F477               mov     byte ptr [ebp-$0C], $77
004EBE2C   C645F588               mov     byte ptr [ebp-$0B], $88
004EBE30   C645F699               mov     byte ptr [ebp-$0A], $99
004EBE34   C645F7AA               mov     byte ptr [ebp-$09], $AA
004EBE38   C645F8BB               mov     byte ptr [ebp-$08], $BB
004EBE3C   C645F9CC               mov     byte ptr [ebp-$07], $CC
004EBE40   C645FADD               mov     byte ptr [ebp-$06], $DD
004EBE44   C645FBEE               mov     byte ptr [ebp-$05], $EE
004EBE48   C645FCF1               mov     byte ptr [ebp-$04], $F1
004EBE4C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EBE51   8845FD                 mov     [ebp-$03], al
004EBE54   8D55EC                 lea     edx, [ebp-$14]
004EBE57   B911000000             mov     ecx, $00000011
004EBE5C   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EBE5E   E80570FFFF             call    004E2E68
004EBE63   33D2                   xor     edx, edx

* Reference to control TForm1.TimerTesterPresent : TTimer
|
004EBE65   8B832C030000           mov     eax, [ebx+$032C]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004EBE6B   E83495F4FF             call    004353A4
004EBE70   8D45E8                 lea     eax, [ebp-$18]

* Possible String Reference to: 'temp.tmp'
|
004EBE73   B97CBF4E00             mov     ecx, $004EBF7C
004EBE78   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004EBE7E   E8B58EF1FF             call    00404D38
004EBE83   8B55E8                 mov     edx, [ebp-$18]
004EBE86   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004EBE8B   E83C70F1FF             call    00402ECC
004EBE90   BA01000000             mov     edx, $00000001
004EBE95   B8006F4F00             mov     eax, $004F6F00

* Reference to: CommCtrl.TreeView_GetChild(HWND;HTREEITEM):HTREEITEM;
|
004EBE9A   E88D75F1FF             call    0040342C

|
004EBE9F   E8106AF1FF             call    004028B4
004EBEA4   C6051D724F0001         mov     byte ptr [$004F721D], $01
004EBEAB   68CC6D4F00             push    $004F6DCC
004EBEB0   BAF86D4F00             mov     edx, $004F6DF8
004EBEB5   B940000000             mov     ecx, $00000040
004EBEBA   B8006F4F00             mov     eax, $004F6F00

|
004EBEBF   E88C71F1FF             call    00403050

|
004EBEC4   E8EB69F1FF             call    004028B4
004EBEC9   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Close(TTextRec;TTextRec):Integer;
|
004EBECE   E89D71F1FF             call    00403070

|
004EBED3   E8DC69F1FF             call    004028B4
004EBED8   A1C46D4F00             mov     eax, dword ptr [$004F6DC4]
004EBEDD   50                     push    eax

* Reference to: kernel32.CloseHandle()
|
004EBEDE   E8E5AFF1FF             call    00406EC8
004EBEE3   C6051D724F0000         mov     byte ptr [$004F721D], $00
004EBEEA   833DA06D4F0000         cmp     dword ptr [$004F6DA0], +$00
004EBEF1   750C                   jnz     004EBEFF

* Possible String Reference to: 'Нет ответа от адаптера. Проверьте п
|                                итание и повторите тест.'
|
004EBEF3   B890BF4E00             mov     eax, $004EBF90

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBEF8   E81371F4FF             call    00433010
004EBEFD   EB49                   jmp     004EBF48
004EBEFF   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBF04   8A80F76D4F00           mov     al, byte ptr [eax+$4F6DF7]
004EBF0A   3A05A66D4F00           cmp     al, byte ptr [$004F6DA6]
004EBF10   740C                   jz      004EBF1E

* Possible String Reference to: 'Получен неверный ответ от адаптера.
|                                 Если подключение осуществляется че
|                                рез USB<->RS232 преобразователь, во
|                                зможно он не поддерживает заданную 
|                                скорость обмена.'
|
004EBF12   B8D4BF4E00             mov     eax, $004EBFD4

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBF17   E8F470F4FF             call    00433010
004EBF1C   EB2A                   jmp     004EBF48
004EBF1E   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBF23   3B059C6D4F00           cmp     eax, [$004F6D9C]
004EBF29   751D                   jnz     004EBF48
004EBF2B   A1A06D4F00             mov     eax, dword ptr [$004F6DA0]
004EBF30   8A80F76D4F00           mov     al, byte ptr [eax+$4F6DF7]
004EBF36   3A05A66D4F00           cmp     al, byte ptr [$004F6DA6]
004EBF3C   750A                   jnz     004EBF48

* Possible String Reference to: 'Адаптер функционирует нормально.'
|
004EBF3E   B87CC04E00             mov     eax, $004EC07C

* Reference to: Dialogs.ShowMessage(AnsiString);
|
004EBF43   E8C870F4FF             call    00433010
004EBF48   6A01                   push    $01

* Reference to: winmm.timeEndPeriod()
|
004EBF4A   E80D6DFAFF             call    00492C5C
004EBF4F   33C0                   xor     eax, eax
004EBF51   5A                     pop     edx
004EBF52   59                     pop     ecx
004EBF53   59                     pop     ecx
004EBF54   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[‹е]Г'
|
004EBF57   686CBF4E00             push    $004EBF6C
004EBF5C   8D45E8                 lea     eax, [ebp-$18]

* Reference to: System.@LStrClr(void;void);
|
004EBF5F   E8C88AF1FF             call    00404A2C
004EBF64   C3                     ret


* Reference to: System.@HandleFinally;
|
004EBF65   E94284F1FF             jmp     004043AC
004EBF6A   EBF0                   jmp     004EBF5C

****** END
|
004EBF6C   5B                     pop     ebx
004EBF6D   8BE5                   mov     esp, ebp
004EBF6F   5D                     pop     ebp
004EBF70   C3                     ret

*)
end;

procedure TForm1.MenuItem_SaveToXLSClick(Sender : TObject);
begin
(*
004EC648   55                     push    ebp
004EC649   8BEC                   mov     ebp, esp
004EC64B   B91C000000             mov     ecx, $0000001C
004EC650   6A00                   push    $00
004EC652   6A00                   push    $00
004EC654   49                     dec     ecx
004EC655   75F9                   jnz     004EC650
004EC657   51                     push    ecx
004EC658   53                     push    ebx
004EC659   56                     push    esi
004EC65A   57                     push    edi
004EC65B   8945FC                 mov     [ebp-$04], eax
004EC65E   33C0                   xor     eax, eax
004EC660   55                     push    ebp

* Possible String Reference to: 'йрxсялў_^[‹е]Г'
|
004EC661   68B7CA4E00             push    $004ECAB7

***** TRY
|
004EC666   64FF30                 push    dword ptr fs:[eax]
004EC669   648920                 mov     fs:[eax], esp
004EC66C   C6051E724F0000         mov     byte ptr [$004F721E], $00

* Reference to TFormProgress instance
|
004EC673   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004EC678   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004EC67A   8B80FC020000           mov     eax, [eax+$02FC]
004EC680   33D2                   xor     edx, edx

* Reference to: ComCtrls.TProgressBar.SetPosition(TProgressBar;Integer);
|
004EC682   E8ED9AF5FF             call    00446174

* Reference to TFormProgress instance
|
004EC687   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004EC68C   8B00                   mov     eax, [eax]
004EC68E   B201                   mov     dl, $01

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004EC690   E84FD8F8FF             call    00479EE4

* Reference to TFormProgress instance
|
004EC695   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004EC69A   8B00                   mov     eax, [eax]

* Reference to: Controls.TControl.Refresh(TControl);
|
004EC69C   E8FF40F7FF             call    004607A0
004EC6A1   8D55CC                 lea     edx, [ebp-$34]

* Possible String Reference to: 'Excel.Application'
|
004EC6A4   B8D0CA4E00             mov     eax, $004ECAD0

* Reference to: ComObj.CreateOleObject(AnsiString):IDispatch;
|
004EC6A9   E8723BFDFF             call    004C0220
004EC6AE   8B55CC                 mov     edx, [ebp-$34]
004EC6B1   8D45D0                 lea     eax, [ebp-$30]

* Reference to: Variants.@VarFromDisp(TVarData;TVarData;IDispatch);
|
004EC6B4   E86784F2FF             call    00414B20
004EC6B9   68E4CA4E00             push    $004ECAE4
004EC6BE   68ECCA4E00             push    $004ECAEC
004EC6C3   8D45D0                 lea     eax, [ebp-$30]
004EC6C6   50                     push    eax
004EC6C7   8D45BC                 lea     eax, [ebp-$44]
004EC6CA   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC6CB   E8143FF2FF             call    004105E4
004EC6D0   83C40C                 add     esp, +$0C
004EC6D3   8D45BC                 lea     eax, [ebp-$44]
004EC6D6   50                     push    eax
004EC6D7   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC6D9   E8063FF2FF             call    004105E4
004EC6DE   83C40C                 add     esp, +$0C
004EC6E1   8D4DB4                 lea     ecx, [ebp-$4C]
004EC6E4   8A15A76D4F00           mov     dl, byte ptr [$004F6DA7]

* Reference to Form1
|
004EC6EA   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.PreobrTipECU()
|
004EC6ED   E80269FFFF             call    004E2FF4
004EC6F2   8B4DB4                 mov     ecx, [ebp-$4C]
004EC6F5   8D45B8                 lea     eax, [ebp-$48]

* Possible String Reference to: 'ЭБУ '
|
004EC6F8   BA04CB4E00             mov     edx, $004ECB04

* Reference to: System.@LStrCat3;
|
004EC6FD   E83686F1FF             call    00404D38
004EC702   8B45B8                 mov     eax, [ebp-$48]
004EC705   50                     push    eax

* Possible String Reference to: 'A1'
|
004EC706   6814CB4E00             push    $004ECB14
004EC70B   6818CB4E00             push    $004ECB18
004EC710   8D45D0                 lea     eax, [ebp-$30]
004EC713   50                     push    eax
004EC714   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC716   E8C93EF2FF             call    004105E4
004EC71B   83C414                 add     esp, +$14
004EC71E   6824CB4E00             push    $004ECB24

* Possible String Reference to: 'A5'
|
004EC723   6838CB4E00             push    $004ECB38
004EC728   683CCB4E00             push    $004ECB3C
004EC72D   8D45D0                 lea     eax, [ebp-$30]
004EC730   50                     push    eax
004EC731   8D45A4                 lea     eax, [ebp-$5C]
004EC734   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC735   E8AA3EF2FF             call    004105E4
004EC73A   83C410                 add     esp, +$10
004EC73D   8D45A4                 lea     eax, [ebp-$5C]
004EC740   50                     push    eax
004EC741   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC743   E89C3EF2FF             call    004105E4
004EC748   83C40C                 add     esp, +$0C
004EC74B   6AFF                   push    $FF
004EC74D   6848CB4E00             push    $004ECB48
004EC752   6858CB4E00             push    $004ECB58
004EC757   8D45D0                 lea     eax, [ebp-$30]
004EC75A   50                     push    eax
004EC75B   8D4594                 lea     eax, [ebp-$6C]
004EC75E   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC75F   E8803EF2FF             call    004105E4
004EC764   83C40C                 add     esp, +$0C
004EC767   8D4594                 lea     eax, [ebp-$6C]
004EC76A   50                     push    eax
004EC76B   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC76D   E8723EF2FF             call    004105E4
004EC772   83C410                 add     esp, +$10
004EC775   833DD46D4F0000         cmp     dword ptr [$004F6DD4], +$00
004EC77C   750A                   jnz     004EC788
004EC77E   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004EC783   8945F0                 mov     [ebp-$10], eax
004EC786   EB08                   jmp     004EC790
004EC788   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004EC78D   8945F0                 mov     [ebp-$10], eax
004EC790   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]

* Reference to: System.@LStrLen(String):Integer;
|
004EC795   E8DE93F1FF             call    00405B78
004EC79A   85C0                   test    eax, eax
004EC79C   0F8E8E020000           jle     004ECA30
004EC7A2   8945E0                 mov     [ebp-$20], eax
004EC7A5   BB01000000             mov     ebx, $00000001

* Reference to TApplication instance
|
004EC7AA   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004EC7AF   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EC7B1   E82E40F9FF             call    004807E4
004EC7B6   803D1E724F0001         cmp     byte ptr [$004F721E], $01
004EC7BD   0F846D020000           jz      004ECA30
004EC7C3   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]

* Reference to: System.@LStrLen(String):Integer;
|
004EC7C8   E8AB93F1FF             call    00405B78
004EC7CD   894590                 mov     [ebp-$70], eax
004EC7D0   DB4590                 fild    dword ptr [ebp-$70]
004EC7D3   895D8C                 mov     [ebp-$74], ebx
004EC7D6   DB458C                 fild    dword ptr [ebp-$74]
004EC7D9   DEF1                   fdivrp  st(1), st(0)
004EC7DB   D80D68CB4E00           fmul    dword ptr [$004ECB68]

* Reference to: System.@ROUND;
|
004EC7E1   E8DE63F1FF             call    00402BC4
004EC7E6   8BD0                   mov     edx, eax

* Reference to TFormProgress instance
|
004EC7E8   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004EC7ED   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004EC7EF   8B80FC020000           mov     eax, [eax+$02FC]

* Reference to: ComCtrls.TProgressBar.SetPosition(TProgressBar;Integer);
|
004EC7F5   E87A99F5FF             call    00446174
004EC7FA   C745F802000000         mov     dword ptr [ebp-$08], $00000002
004EC801   8B7DF0                 mov     edi, [ebp-$10]
004EC804   85FF                   test    edi, edi
004EC806   0F8E5A010000           jle     004EC966
004EC80C   BE01000000             mov     esi, $00000001
004EC811   6BC34C                 imul    eax, ebx, $4C
004EC814   8B15F86E4F00           mov     edx, [$004F6EF8]
004EC81A   8D04C2                 lea     eax, [edx+eax*8]
004EC81D   8B94F0A0FDFFFF         mov     edx, [eax+esi*8+$FFFFFDA0]
004EC824   8955E8                 mov     [ebp-$18], edx
004EC827   8B94F0A4FDFFFF         mov     edx, [eax+esi*8+$FFFFFDA4]
004EC82E   8955EC                 mov     [ebp-$14], edx
004EC831   8D45E8                 lea     eax, [ebp-$18]
004EC834   50                     push    eax
004EC835   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004EC838   E8EF81F1FF             call    00404A2C
004EC83D   50                     push    eax
004EC83E   8D45F4                 lea     eax, [ebp-$0C]
004EC841   50                     push    eax
004EC842   B901000000             mov     ecx, $00000001
004EC847   8BD6                   mov     edx, esi

* Reference to Form1
|
004EC849   8B45FC                 mov     eax, [ebp-$04]

* Reference to : TForm1.RaschetParam()
|
004EC84C   E81FA3FFFF             call    004E6B70
004EC851   837DF4FF               cmp     dword ptr [ebp-$0C], -$01
004EC855   0F8E03010000           jle     004EC95E
004EC85B   83FB01                 cmp     ebx, +$01
004EC85E   0F85BD000000           jnz     004EC921
004EC864   8B45F8                 mov     eax, [ebp-$08]
004EC867   48                     dec     eax
004EC868   50                     push    eax
004EC869   8D45F8                 lea     eax, [ebp-$08]
004EC86C   50                     push    eax
004EC86D   6A02                   push    $02
004EC86F   686CCB4E00             push    $004ECB6C
004EC874   6878CB4E00             push    $004ECB78
004EC879   8D45D0                 lea     eax, [ebp-$30]
004EC87C   50                     push    eax
004EC87D   8D857CFFFFFF           lea     eax, [ebp+$FFFFFF7C]
004EC883   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC884   E85B3DF2FF             call    004105E4
004EC889   83C40C                 add     esp, +$0C
004EC88C   8D857CFFFFFF           lea     eax, [ebp+$FFFFFF7C]
004EC892   50                     push    eax
004EC893   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC895   E84A3DF2FF             call    004105E4
004EC89A   83C418                 add     esp, +$18
004EC89D   8B45F4                 mov     eax, [ebp-$0C]
004EC8A0   8D04C0                 lea     eax, [eax+eax*8]
004EC8A3   8B0485B4224F00         mov     eax, [$4F22B4+eax*4]
004EC8AA   50                     push    eax
004EC8AB   8D45F8                 lea     eax, [ebp-$08]
004EC8AE   50                     push    eax
004EC8AF   6A03                   push    $03
004EC8B1   6884CB4E00             push    $004ECB84
004EC8B6   6878CB4E00             push    $004ECB78
004EC8BB   8D45D0                 lea     eax, [ebp-$30]
004EC8BE   50                     push    eax
004EC8BF   8D856CFFFFFF           lea     eax, [ebp+$FFFFFF6C]
004EC8C5   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC8C6   E8193DF2FF             call    004105E4
004EC8CB   83C40C                 add     esp, +$0C
004EC8CE   8D856CFFFFFF           lea     eax, [ebp+$FFFFFF6C]
004EC8D4   50                     push    eax
004EC8D5   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC8D7   E8083DF2FF             call    004105E4
004EC8DC   83C418                 add     esp, +$18
004EC8DF   8B45F4                 mov     eax, [ebp-$0C]
004EC8E2   8D04C0                 lea     eax, [eax+eax*8]
004EC8E5   8B0485B8224F00         mov     eax, [$4F22B8+eax*4]
004EC8EC   50                     push    eax
004EC8ED   8D45F8                 lea     eax, [ebp-$08]
004EC8F0   50                     push    eax
004EC8F1   6A04                   push    $04
004EC8F3   6884CB4E00             push    $004ECB84
004EC8F8   6878CB4E00             push    $004ECB78
004EC8FD   8D45D0                 lea     eax, [ebp-$30]
004EC900   50                     push    eax
004EC901   8D855CFFFFFF           lea     eax, [ebp+$FFFFFF5C]
004EC907   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC908   E8D73CF2FF             call    004105E4
004EC90D   83C40C                 add     esp, +$0C
004EC910   8D855CFFFFFF           lea     eax, [ebp+$FFFFFF5C]
004EC916   50                     push    eax
004EC917   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC919   E8C63CF2FF             call    004105E4
004EC91E   83C418                 add     esp, +$18
004EC921   8D45E4                 lea     eax, [ebp-$1C]
004EC924   50                     push    eax
004EC925   8D45F8                 lea     eax, [ebp-$08]
004EC928   50                     push    eax
004EC929   8D4304                 lea     eax, [ebx+$04]
004EC92C   50                     push    eax
004EC92D   6890CB4E00             push    $004ECB90
004EC932   6878CB4E00             push    $004ECB78
004EC937   8D45D0                 lea     eax, [ebp-$30]
004EC93A   50                     push    eax
004EC93B   8D854CFFFFFF           lea     eax, [ebp+$FFFFFF4C]
004EC941   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC942   E89D3CF2FF             call    004105E4
004EC947   83C40C                 add     esp, +$0C
004EC94A   8D854CFFFFFF           lea     eax, [ebp+$FFFFFF4C]
004EC950   50                     push    eax
004EC951   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC953   E88C3CF2FF             call    004105E4
004EC958   83C418                 add     esp, +$18
004EC95B   FF45F8                 inc     dword ptr [ebp-$08]
004EC95E   46                     inc     esi
004EC95F   4F                     dec     edi
004EC960   0F85ABFEFFFF           jnz     004EC811
004EC966   6BC34C                 imul    eax, ebx, $4C
004EC969   8B15F86E4F00           mov     edx, [$004F6EF8]
004EC96F   FFB4C2A4FDFFFF         push    dword ptr [edx+eax*8+$FFFFFDA4]
004EC976   FFB4C2A0FDFFFF         push    dword ptr [edx+eax*8+$FFFFFDA0]
004EC97D   8D45E4                 lea     eax, [ebp-$1C]

* Possible String Reference to: 'hh:nn:ss.zzz'
|
004EC980   BAA4CB4E00             mov     edx, $004ECBA4

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004EC985   E8AAF1F1FF             call    0040BB34
004EC98A   8B45E4                 mov     eax, [ebp-$1C]

* Reference to: System.@LStrLen(String):Integer;
|
004EC98D   E85A83F1FF             call    00404CEC
004EC992   8BD0                   mov     edx, eax
004EC994   4A                     dec     edx
004EC995   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrSetLength;
|
004EC998   E8DB86F1FF             call    00405078
004EC99D   68BCCB4E00             push    $004ECBBC
004EC9A2   68C0CB4E00             push    $004ECBC0
004EC9A7   6A01                   push    $01
004EC9A9   8D7304                 lea     esi, [ebx+$04]
004EC9AC   56                     push    esi
004EC9AD   68D4CB4E00             push    $004ECBD4
004EC9B2   6878CB4E00             push    $004ECB78
004EC9B7   8D45D0                 lea     eax, [ebp-$30]
004EC9BA   50                     push    eax
004EC9BB   8D852CFFFFFF           lea     eax, [ebp+$FFFFFF2C]
004EC9C1   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC9C2   E81D3CF2FF             call    004105E4
004EC9C7   83C40C                 add     esp, +$0C
004EC9CA   8D852CFFFFFF           lea     eax, [ebp+$FFFFFF2C]
004EC9D0   50                     push    eax
004EC9D1   8D853CFFFFFF           lea     eax, [ebp+$FFFFFF3C]
004EC9D7   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC9D8   E8073CF2FF             call    004105E4
004EC9DD   83C414                 add     esp, +$14
004EC9E0   8D853CFFFFFF           lea     eax, [ebp+$FFFFFF3C]
004EC9E6   50                     push    eax
004EC9E7   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004EC9E9   E8F63BF2FF             call    004105E4
004EC9EE   83C410                 add     esp, +$10
004EC9F1   8D45E4                 lea     eax, [ebp-$1C]
004EC9F4   50                     push    eax
004EC9F5   6A01                   push    $01
004EC9F7   56                     push    esi
004EC9F8   68E0CB4E00             push    $004ECBE0
004EC9FD   6878CB4E00             push    $004ECB78
004ECA02   8D45D0                 lea     eax, [ebp-$30]
004ECA05   50                     push    eax
004ECA06   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]
004ECA0C   50                     push    eax

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004ECA0D   E8D23BF2FF             call    004105E4
004ECA12   83C40C                 add     esp, +$0C
004ECA15   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]
004ECA1B   50                     push    eax
004ECA1C   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004ECA1E   E8C13BF2FF             call    004105E4
004ECA23   83C418                 add     esp, +$18
004ECA26   43                     inc     ebx
004ECA27   FF4DE0                 dec     dword ptr [ebp-$20]
004ECA2A   0F857AFDFFFF           jnz     004EC7AA

* Reference to TFormProgress instance
|
004ECA30   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ECA35   8B00                   mov     eax, [eax]
004ECA37   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ECA39   E8A6D4F8FF             call    00479EE4
004ECA3E   6AFF                   push    $FF
004ECA40   68ECCB4E00             push    $004ECBEC
004ECA45   8D45D0                 lea     eax, [ebp-$30]
004ECA48   50                     push    eax
004ECA49   6A00                   push    $00

* Reference to: Variants.@DispInvoke(PVarData;TVarData;TVarData;PCallDesc;Pointer);cdecl;
|
004ECA4B   E8943BF2FF             call    004105E4
004ECA50   83C410                 add     esp, +$10
004ECA53   33C0                   xor     eax, eax
004ECA55   5A                     pop     edx
004ECA56   59                     pop     ecx
004ECA57   59                     pop     ecx
004ECA58   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[‹е]Г'
|
004ECA5B   68BECA4E00             push    $004ECABE
004ECA60   8D851CFFFFFF           lea     eax, [ebp+$FFFFFF1C]

* Reference to object Variant
|
004ECA66   8B15C0104000           mov     edx, [$004010C0]
004ECA6C   B907000000             mov     ecx, $00000007

* Reference to: System.@FinalizeArray(Pointer;Pointer;Cardinal);
|
004ECA71   E8928AF1FF             call    00405508
004ECA76   8D4594                 lea     eax, [ebp-$6C]

* Reference to object Variant
|
004ECA79   8B15C0104000           mov     edx, [$004010C0]
004ECA7F   B902000000             mov     ecx, $00000002

* Reference to: System.@FinalizeArray(Pointer;Pointer;Cardinal);
|
004ECA84   E87F8AF1FF             call    00405508
004ECA89   8D45B4                 lea     eax, [ebp-$4C]
004ECA8C   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004ECA91   E8BA7FF1FF             call    00404A50
004ECA96   8D45BC                 lea     eax, [ebp-$44]

* Reference to: Variants.@VarClr(TVarData;TVarData);
|
004ECA99   E83E3BF2FF             call    004105DC
004ECA9E   8D45CC                 lea     eax, [ebp-$34]

* Reference to: System.@IntfClear(IInterface;IInterface):Pointer;
|
004ECAA1   E86A9AF1FF             call    00406510
004ECAA6   8D45D0                 lea     eax, [ebp-$30]

* Reference to: Variants.@VarClr(TVarData;TVarData);
|
004ECAA9   E82E3BF2FF             call    004105DC
004ECAAE   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004ECAB1   E8767FF1FF             call    00404A2C
004ECAB6   C3                     ret


* Reference to: System.@HandleFinally;
|
004ECAB7   E9F078F1FF             jmp     004043AC
004ECABC   EBA2                   jmp     004ECA60

****** END
|
004ECABE   5F                     pop     edi
004ECABF   5E                     pop     esi
004ECAC0   5B                     pop     ebx
004ECAC1   8BE5                   mov     esp, ebp
004ECAC3   5D                     pop     ebp
004ECAC4   C3                     ret

*)
end;

procedure TForm1.N_MR140Click(Sender : TObject);
begin
(*
004E3A50   53                     push    ebx
004E3A51   56                     push    esi
004E3A52   8BD8                   mov     ebx, eax
004E3A54   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E3A5B   7507                   jnz     004E3A64
004E3A5D   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E3A5F   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3A64   C605A76D4F0012         mov     byte ptr [$004F6DA7], $12
004E3A6B   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E3A72   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3A79   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3A83   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3A85   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3A8B   E814F2F8FF             call    00472CA4
004E3A90   B201                   mov     dl, $01

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3A92   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3A98   E807F2F8FF             call    00472CA4
004E3A9D   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3A9F   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3AA5   E8FAF1F8FF             call    00472CA4
004E3AAA   6A02                   push    $02

* Possible String Reference to: 'Dvig'
|
004E3AAC   B9DC3A4E00             mov     ecx, $004E3ADC

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3AB1   BAEC3A4E00             mov     edx, $004E3AEC
004E3AB6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3ABB   8B30                   mov     esi, [eax]
004E3ABD   FF560C                 call    dword ptr [esi+$0C]
004E3AC0   B201                   mov     dl, $01
004E3AC2   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3AC4   E8BBF7FFFF             call    004E3284
004E3AC9   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3ACB   E808060000             call    004E40D8
004E3AD0   5E                     pop     esi
004E3AD1   5B                     pop     ebx
004E3AD2   C3                     ret

*)
end;

procedure TForm1.N_SiriusClick(Sender : TObject);
begin
(*
004E39A8   53                     push    ebx
004E39A9   56                     push    esi
004E39AA   8BD8                   mov     ebx, eax
004E39AC   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E39B3   7507                   jnz     004E39BC
004E39B5   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E39B7   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E39BC   C605A76D4F0011         mov     byte ptr [$004F6DA7], $11
004E39C3   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E39CA   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E39D1   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E39DB   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E39DD   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E39E3   E8BCF2F8FF             call    00472CA4
004E39E8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E39EA   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E39F0   E8AFF2F8FF             call    00472CA4
004E39F5   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E39F7   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E39FD   E8A2F2F8FF             call    00472CA4
004E3A02   6A01                   push    $01

* Possible String Reference to: 'Dvig'
|
004E3A04   B9343A4E00             mov     ecx, $004E3A34

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3A09   BA443A4E00             mov     edx, $004E3A44
004E3A0E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3A13   8B30                   mov     esi, [eax]
004E3A15   FF560C                 call    dword ptr [esi+$0C]
004E3A18   B201                   mov     dl, $01
004E3A1A   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3A1C   E863F8FFFF             call    004E3284
004E3A21   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3A23   E8B0060000             call    004E40D8
004E3A28   5E                     pop     esi
004E3A29   5B                     pop     ebx
004E3A2A   C3                     ret

*)
end;

procedure TForm1.N_AisinClick(Sender : TObject);
begin
(*
004E3C48   53                     push    ebx
004E3C49   56                     push    esi
004E3C4A   8BD8                   mov     ebx, eax
004E3C4C   C605A76D4F0021         mov     byte ptr [$004F6DA7], $21
004E3C53   C605A86D4F0018         mov     byte ptr [$004F6DA8], $18
004E3C5A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3C61   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3C6B   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3C6D   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C73   E82CF0F8FF             call    00472CA4
004E3C78   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3C7A   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C80   E81FF0F8FF             call    00472CA4
004E3C85   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3C87   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3C8D   E812F0F8FF             call    00472CA4
004E3C92   6A01                   push    $01

* Possible String Reference to: 'AKPP'
|
004E3C94   B9C43C4E00             mov     ecx, $004E3CC4

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3C99   BAD43C4E00             mov     edx, $004E3CD4
004E3C9E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3CA3   8B30                   mov     esi, [eax]
004E3CA5   FF560C                 call    dword ptr [esi+$0C]
004E3CA8   B202                   mov     dl, $02
004E3CAA   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3CAC   E8D3F5FFFF             call    004E3284
004E3CB1   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3CB3   E820040000             call    004E40D8
004E3CB8   5E                     pop     esi
004E3CB9   5B                     pop     ebx
004E3CBA   C3                     ret

*)
end;

procedure TForm1.N_ZFClick(Sender : TObject);
begin
(*
004E3CE0   53                     push    ebx
004E3CE1   56                     push    esi
004E3CE2   8BD8                   mov     ebx, eax
004E3CE4   C605A76D4F0022         mov     byte ptr [$004F6DA7], $22
004E3CEB   C605A86D4F0018         mov     byte ptr [$004F6DA8], $18
004E3CF2   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3CF9   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3D03   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3D05   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D0B   E894EFF8FF             call    00472CA4
004E3D10   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3D12   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D18   E887EFF8FF             call    00472CA4
004E3D1D   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3D1F   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3D25   E87AEFF8FF             call    00472CA4
004E3D2A   6A02                   push    $02

* Possible String Reference to: 'AKPP'
|
004E3D2C   B95C3D4E00             mov     ecx, $004E3D5C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3D31   BA6C3D4E00             mov     edx, $004E3D6C
004E3D36   A120724F00             mov     eax, dword ptr [$004F7220]
004E3D3B   8B30                   mov     esi, [eax]
004E3D3D   FF560C                 call    dword ptr [esi+$0C]
004E3D40   B202                   mov     dl, $02
004E3D42   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3D44   E83BF5FFFF             call    004E3284
004E3D49   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3D4B   E888030000             call    004E40D8
004E3D50   5E                     pop     esi
004E3D51   5B                     pop     ebx
004E3D52   C3                     ret

*)
end;

procedure TForm1.N5Click(Sender : TObject);
begin
(*
004ECBF8   6A40                   push    $40

* Possible String Reference to: '   О программе'
|
004ECBFA   680CCC4E00             push    $004ECC0C

* Possible String Reference to: 'Диагностика автомобилей Chevrolet v
|                                 1.8(C) CE lab 2008-2015Авторы прог
|                                раммы:        Юрий Ступин, aka Yura
|                                n66                            E-ma
|                                il:  yuran_st@mail.ru        Григор
|                                ий Смирнов, aka Gregory            
|                                                E-mail:  yg_sm@bk.r
|                                u__________________________________
|                                ____________Благодарности принимают
|                                ся на кошелькиЯндексДеньги: 4100153
|                                7060727       WebMoney: R3726536992
|                                44                            Z3451
|                                57791413                           
|                                 U130130955958'
|
004ECBFF   681CCC4E00             push    $004ECC1C
004ECC04   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ECC06   E85DACF1FF             call    00407868
004ECC0B   C3                     ret

*)
end;

procedure TForm1.TimerParamTimer(Sender : TObject);
begin
(*
004E623C   55                     push    ebp
004E623D   8BEC                   mov     ebp, esp
004E623F   83C4F8                 add     esp, -$08
004E6242   53                     push    ebx
004E6243   56                     push    esi
004E6244   57                     push    edi
004E6245   33C9                   xor     ecx, ecx
004E6247   894DF8                 mov     [ebp-$08], ecx
004E624A   8BD8                   mov     ebx, eax
004E624C   33C0                   xor     eax, eax
004E624E   55                     push    ebp

* Possible String Reference to: 'йWЫсялр_^[YY]Г'
|
004E624F   6850684E00             push    $004E6850

***** TRY
|
004E6254   64FF30                 push    dword ptr fs:[eax]
004E6257   648920                 mov     fs:[eax], esp
004E625A   33D2                   xor     edx, edx

* Reference to control TForm1.TimerParam : TTimer
|
004E625C   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E6262   E83DF1F4FF             call    004353A4
004E6267   C60525724F0001         mov     byte ptr [$004F7225], $01

* Reference to control TForm1.Panel_Knopki : TPanel
|
004E626E   8B83FC020000           mov     eax, [ebx+$02FC]

* Reference to field TPanel.Tag : Longint
|
004E6274   83780C02               cmp     dword ptr [eax+$0C], +$02
004E6278   7419                   jz      004E6293
004E627A   B201                   mov     dl, $01

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E627C   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E6282   E8FD9EF7FF             call    00460184
004E6287   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E628E   E9A7050000             jmp     004E683A
004E6293   B201                   mov     dl, $01

* Reference to control TForm1.List_Param : TValueListEditor
|
004E6295   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E629B   E8E49EF7FF             call    00460184
004E62A0   33D2                   xor     edx, edx

* Reference to control TForm1.List_Ident : TValueListEditor
|
004E62A2   8B8320030000           mov     eax, [ebx+$0320]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E62A8   E8D79EF7FF             call    00460184
004E62AD   33D2                   xor     edx, edx

* Reference to control TForm1.Panel_DTC : TPanel
|
004E62AF   8B8344030000           mov     eax, [ebx+$0344]

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004E62B5   E8CA9EF7FF             call    00460184

* Reference to TOptionsForm instance
|
004E62BA   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004E62BF   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.ModGodGroup : TRadioGroup
|
004E62C1   8B801C030000           mov     eax, [eax+$031C]

* Reference to field TRadioGroup.ItemIndex : Integer
|
004E62C7   83B81802000000         cmp     dword ptr [eax+$0218], +$00
004E62CE   7507                   jnz     004E62D7
004E62D0   BE27000000             mov     esi, $00000027
004E62D5   EB05                   jmp     004E62DC
004E62D7   BE28000000             mov     esi, $00000028
004E62DC   33C0                   xor     eax, eax
004E62DE   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E62E3   83C0EF                 add     eax, -$11
004E62E6   83F833                 cmp     eax, +$33
004E62E9   0F872C040000           jnbe    004E671B
004E62EF   8A80FC624E00           mov     al, byte ptr [eax+$4E62FC]
004E62F5   FF248530634E00         jmp     dword ptr [$4E6330+eax*4]
004E62FC   0102                   add     [edx], eax
004E62FE   03040500000000         add     eax, [$0000+eax]
004E6305   0000                   add     [eax], al
004E6307   0000                   add     [eax], al
004E6309   0000                   add     [eax], al
004E630B   0006                   add     [esi], al
004E630D   07                     pop     es
004E630E   0000                   add     [eax], al
004E6310   0000                   add     [eax], al
004E6312   0000                   add     [eax], al
004E6314   0000                   add     [eax], al
004E6316   0000                   add     [eax], al
004E6318   0000                   add     [eax], al
004E631A   0000                   add     [eax], al
004E631C   0008                   add     [eax], cl
004E631E   0000                   add     [eax], al
004E6320   0000                   add     [eax], al
004E6322   0000                   add     [eax], al
004E6324   0000                   add     [eax], al
004E6326   0000                   add     [eax], al
004E6328   0000                   add     [eax], al
004E632A   0000                   add     [eax], al
004E632C   090A                   or      [edx], ecx
004E632E   0B0C1B                 or      ecx, [ebx+ebx]
004E6331   674E                   dec     esi
004E6333   0064634E               add     [ebx+$4E], ah
004E6337   00E7                   add     bh, ah
004E6339   634E00                 arpl    [esi+$00], cx
004E633C   6E                     outsb
004E633D   644E                   dec     esi
004E633F   00F1                   add     cl, dh
004E6341   644E                   dec     esi
004E6343   007865                 add     [eax+$65], bh
004E6346   4E                     dec     esi
004E6347   00A4654E00CD65         add     [ebp+$65CD004E], ah
004E634E   4E                     dec     esi
004E634F   00F9                   add     cl, bh
004E6351   654E                   dec     esi
004E6353   0025664E0051           add     [$51004E66], ah
004E6359   664E                   dec     si
004E635B   007D66                 add     [ebp+$66], bh
004E635E   4E                     dec     esi
004E635F   00F4                   add     ah, dh
004E6361   664E                   dec     si
004E6363   00833DAC6D4F           add     [ebx+$4F6DAC3D], al
004E6369   0001                   add     [ecx], al
004E636B   743F                   jz      004E63AC
004E636D   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E6374   7436                   jz      004E63AC
004E6376   6A01                   push    $01
004E6378   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E637D   50                     push    eax
004E637E   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6383   50                     push    eax
004E6384   B92C000000             mov     ecx, $0000002C
004E6389   BA02000000             mov     edx, $00000002
004E638E   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6390   E8EF040000             call    004E6884
004E6395   84C0                   test    al, al
004E6397   0F849D040000           jz      004E683A
004E639D   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E63A7   E981040000             jmp     004E682D
004E63AC   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E63B1   40                     inc     eax
004E63B2   50                     push    eax
004E63B3   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E63B8   50                     push    eax
004E63B9   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E63BE   50                     push    eax
004E63BF   B939000000             mov     ecx, $00000039
004E63C4   BAF0000000             mov     edx, $000000F0
004E63C9   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E63CB   E8B4040000             call    004E6884
004E63D0   84C0                   test    al, al
004E63D2   0F8462040000           jz      004E683A
004E63D8   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E63E2   E934030000             jmp     004E671B
004E63E7   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E63EE   7443                   jz      004E6433
004E63F0   6A01                   push    $01
004E63F2   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E63F7   50                     push    eax
004E63F8   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E63FD   50                     push    eax
004E63FE   B929000000             mov     ecx, $00000029
004E6403   BAF0000000             mov     edx, $000000F0
004E6408   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E640A   E875040000             call    004E6884
004E640F   84C0                   test    al, al
004E6411   0F8423040000           jz      004E683A
004E6417   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E641E   0F85F7020000           jnz     004E671B
004E6424   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E642E   E9FA030000             jmp     004E682D
004E6433   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6438   40                     inc     eax
004E6439   50                     push    eax
004E643A   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E643F   50                     push    eax
004E6440   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6445   50                     push    eax
004E6446   B931000000             mov     ecx, $00000031
004E644B   BAF1000000             mov     edx, $000000F1
004E6450   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6452   E82D040000             call    004E6884
004E6457   84C0                   test    al, al
004E6459   0F84DB030000           jz      004E683A
004E645F   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E6469   E9AD020000             jmp     004E671B
004E646E   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E6475   743F                   jz      004E64B6
004E6477   803D34724F0001         cmp     byte ptr [$004F7234], $01
004E647E   7436                   jz      004E64B6
004E6480   6A01                   push    $01
004E6482   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6487   50                     push    eax
004E6488   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E648D   50                     push    eax
004E648E   B92C000000             mov     ecx, $0000002C
004E6493   BA02000000             mov     edx, $00000002
004E6498   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E649A   E8E5030000             call    004E6884
004E649F   84C0                   test    al, al
004E64A1   0F8493030000           jz      004E683A
004E64A7   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E64B1   E977030000             jmp     004E682D
004E64B6   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E64BB   40                     inc     eax
004E64BC   50                     push    eax
004E64BD   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E64C2   50                     push    eax
004E64C3   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E64C8   50                     push    eax
004E64C9   B936000000             mov     ecx, $00000036
004E64CE   BAF0000000             mov     edx, $000000F0
004E64D3   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E64D5   E8AA030000             call    004E6884
004E64DA   84C0                   test    al, al
004E64DC   0F8458030000           jz      004E683A
004E64E2   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E64EC   E92A020000             jmp     004E671B
004E64F1   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E64F8   7443                   jz      004E653D
004E64FA   6A01                   push    $01
004E64FC   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6501   50                     push    eax
004E6502   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6507   50                     push    eax
004E6508   B96B000000             mov     ecx, $0000006B
004E650D   BA01000000             mov     edx, $00000001
004E6512   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6514   E86B030000             call    004E6884
004E6519   84C0                   test    al, al
004E651B   0F8419030000           jz      004E683A
004E6521   803D34724F0000         cmp     byte ptr [$004F7234], $00
004E6528   0F85ED010000           jnz     004E671B
004E652E   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E6538   E9F0020000             jmp     004E682D
004E653D   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6542   40                     inc     eax
004E6543   50                     push    eax
004E6544   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E6549   50                     push    eax
004E654A   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E654F   50                     push    eax
004E6550   B927000000             mov     ecx, $00000027
004E6555   BA03000000             mov     edx, $00000003
004E655A   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E655C   E823030000             call    004E6884
004E6561   84C0                   test    al, al
004E6563   0F84D1020000           jz      004E683A
004E6569   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E6573   E9A3010000             jmp     004E671B
004E6578   6A01                   push    $01
004E657A   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E657F   50                     push    eax
004E6580   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6585   50                     push    eax
004E6586   B945000000             mov     ecx, $00000045
004E658B   BA11000000             mov     edx, $00000011
004E6590   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6592   E8ED020000             call    004E6884
004E6597   84C0                   test    al, al
004E6599   0F849B020000           jz      004E683A
004E659F   E977010000             jmp     004E671B
004E65A4   6A01                   push    $01
004E65A6   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E65AB   50                     push    eax
004E65AC   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E65B1   50                     push    eax
004E65B2   8BCE                   mov     ecx, esi
004E65B4   BA01000000             mov     edx, $00000001
004E65B9   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E65BB   E8C4020000             call    004E6884
004E65C0   84C0                   test    al, al
004E65C2   0F8472020000           jz      004E683A
004E65C8   E94E010000             jmp     004E671B
004E65CD   6A01                   push    $01
004E65CF   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E65D4   50                     push    eax
004E65D5   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E65DA   50                     push    eax
004E65DB   B935000000             mov     ecx, $00000035
004E65E0   BAF0000000             mov     edx, $000000F0
004E65E5   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E65E7   E898020000             call    004E6884
004E65EC   84C0                   test    al, al
004E65EE   0F8446020000           jz      004E683A
004E65F4   E922010000             jmp     004E671B
004E65F9   6A01                   push    $01
004E65FB   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6600   50                     push    eax
004E6601   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6606   50                     push    eax
004E6607   B922000000             mov     ecx, $00000022
004E660C   BAFB000000             mov     edx, $000000FB
004E6611   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E6613   E86C020000             call    004E6884
004E6618   84C0                   test    al, al
004E661A   0F841A020000           jz      004E683A
004E6620   E9F6000000             jmp     004E671B
004E6625   6A01                   push    $01
004E6627   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E662C   50                     push    eax
004E662D   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6632   50                     push    eax
004E6633   B930000000             mov     ecx, $00000030
004E6638   BA01000000             mov     edx, $00000001
004E663D   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E663F   E840020000             call    004E6884
004E6644   84C0                   test    al, al
004E6646   0F84EE010000           jz      004E683A
004E664C   E9CA000000             jmp     004E671B
004E6651   6A01                   push    $01
004E6653   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E6658   50                     push    eax
004E6659   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E665E   50                     push    eax
004E665F   B917000000             mov     ecx, $00000017
004E6664   BA01000000             mov     edx, $00000001
004E6669   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E666B   E814020000             call    004E6884
004E6670   84C0                   test    al, al
004E6672   0F84C2010000           jz      004E683A
004E6678   E99E000000             jmp     004E671B
004E667D   833DAC6D4F0001         cmp     dword ptr [$004F6DAC], +$01
004E6684   7436                   jz      004E66BC
004E6686   6A01                   push    $01
004E6688   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E668D   50                     push    eax
004E668E   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6693   50                     push    eax
004E6694   B92A000000             mov     ecx, $0000002A
004E6699   BA01000000             mov     edx, $00000001
004E669E   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E66A0   E8DF010000             call    004E6884
004E66A5   84C0                   test    al, al
004E66A7   0F848D010000           jz      004E683A
004E66AD   C705AC6D4F0001000000   mov     dword ptr [$004F6DAC], $00000001
004E66B7   E971010000             jmp     004E682D
004E66BC   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E66C1   40                     inc     eax
004E66C2   50                     push    eax
004E66C3   A1D46D4F00             mov     eax, dword ptr [$004F6DD4]
004E66C8   50                     push    eax
004E66C9   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E66CE   50                     push    eax
004E66CF   B932000000             mov     ecx, $00000032
004E66D4   BA03000000             mov     edx, $00000003
004E66D9   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E66DB   E8A4010000             call    004E6884
004E66E0   84C0                   test    al, al
004E66E2   0F8452010000           jz      004E683A
004E66E8   C705AC6D4F0002000000   mov     dword ptr [$004F6DAC], $00000002
004E66F2   EB27                   jmp     004E671B
004E66F4   6A01                   push    $01
004E66F6   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004E66FB   50                     push    eax
004E66FC   A1C86D4F00             mov     eax, dword ptr [$004F6DC8]
004E6701   50                     push    eax
004E6702   B929000000             mov     ecx, $00000029
004E6707   BA20000000             mov     edx, $00000020
004E670C   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004E670E   E871010000             call    004E6884
004E6713   84C0                   test    al, al
004E6715   0F841F010000           jz      004E683A
004E671B   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]

* Reference to: System.@LStrLen(String):Integer;
|
004E6720   E853F4F1FF             call    00405B78
004E6725   8BF8                   mov     edi, eax
004E6727   4F                     dec     edi
004E6728   85FF                   test    edi, edi
004E672A   0F8CBA000000           jl      004E67EA
004E6730   47                     inc     edi
004E6731   33F6                   xor     esi, esi
004E6733   6B05C86D4F004C         imul    eax, [$004F6DC8], $4C
004E673A   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6740   8D04C2                 lea     eax, [edx+eax*8]
004E6743   8B15FC6E4F00           mov     edx, [$004F6EFC]
004E6749   8B14B2                 mov     edx, [edx+esi*4]
004E674C   8D04D0                 lea     eax, [eax+edx*8]
004E674F   50                     push    eax
004E6750   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E6753   E8D4E2F1FF             call    00404A2C
004E6758   50                     push    eax
004E6759   8D45FC                 lea     eax, [ebp-$04]
004E675C   50                     push    eax
004E675D   A1FC6E4F00             mov     eax, dword ptr [$004F6EFC]
004E6762   8B14B0                 mov     edx, [eax+esi*4]
004E6765   B901000000             mov     ecx, $00000001
004E676A   8BC3                   mov     eax, ebx

* Reference to : TForm1.RaschetParam()
|
004E676C   E8FF030000             call    004E6B70
004E6771   837DFCFF               cmp     dword ptr [ebp-$04], -$01
004E6775   7E6B                   jle     004E67E2
004E6777   8B45FC                 mov     eax, [ebp-$04]
004E677A   8D04C0                 lea     eax, [eax+eax*8]
004E677D   833C85B8224F0000       cmp     dword ptr [$4F22B8+eax*4], +$00
004E6785   7440                   jz      004E67C7
004E6787   8B45FC                 mov     eax, [ebp-$04]
004E678A   8D04C0                 lea     eax, [eax+eax*8]
004E678D   8B0485B8224F00         mov     eax, [$4F22B8+eax*4]
004E6794   BA68684E00             mov     edx, $004E6868

* Reference to: System.@LStrCmp;
|
004E6799   E89AE6F1FF             call    00404E38
004E679E   7427                   jz      004E67C7
004E67A0   FF75F8                 push    dword ptr [ebp-$08]

* Possible String Reference to: '  ('
|
004E67A3   6874684E00             push    $004E6874
004E67A8   8B45FC                 mov     eax, [ebp-$04]
004E67AB   8D04C0                 lea     eax, [eax+eax*8]
004E67AE   FF3485B8224F00         push    dword ptr [$4F22B8+eax*4]
004E67B5   6880684E00             push    $004E6880
004E67BA   8D45F8                 lea     eax, [ebp-$08]
004E67BD   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004E67C2   E8E5E5F1FF             call    00404DAC
004E67C7   8B45FC                 mov     eax, [ebp-$04]
004E67CA   8D04C0                 lea     eax, [eax+eax*8]
004E67CD   8B1485B4224F00         mov     edx, [$4F22B4+eax*4]
004E67D4   8B4DF8                 mov     ecx, [ebp-$08]
004E67D7   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.SetValue(TValueListEditor;AnsiString;AnsiString);
|
004E67DD   E83EA8FAFF             call    00491020
004E67E2   46                     inc     esi
004E67E3   4F                     dec     edi
004E67E4   0F8549FFFFFF           jnz     004E6733
004E67EA   FF05C86D4F00           inc     dword ptr [$004F6DC8]
004E67F0   B201                   mov     dl, $01
004E67F2   8B8348030000           mov     eax, [ebx+$0348]
004E67F8   8B08                   mov     ecx, [eax]
004E67FA   FF5164                 call    dword ptr [ecx+$64]
004E67FD   C60519724F0000         mov     byte ptr [$004F7219], $00
004E6804   803D18724F0001         cmp     byte ptr [$004F7218], $01
004E680B   7507                   jnz     004E6814
004E680D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Driver()
|
004E680F   E8447A0000             call    004EE258

* Reference to TGrafForm instance
|
004E6814   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004E6819   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004E681B   80785701               cmp     byte ptr [eax+$57], $01
004E681F   750C                   jnz     004E682D

* Reference to TGrafForm instance
|
004E6821   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004E6826   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004E6828   E85B53FFFF             call    004DBB88
004E682D   B201                   mov     dl, $01
004E682F   8B8330030000           mov     eax, [ebx+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E6835   E86AEBF4FF             call    004353A4
004E683A   33C0                   xor     eax, eax
004E683C   5A                     pop     edx
004E683D   59                     pop     ecx
004E683E   59                     pop     ecx
004E683F   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '_^[YY]Г'
|
004E6842   6857684E00             push    $004E6857
004E6847   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E684A   E8DDE1F1FF             call    00404A2C
004E684F   C3                     ret


* Reference to: System.@HandleFinally;
|
004E6850   E957DBF1FF             jmp     004043AC
004E6855   EBF0                   jmp     004E6847

****** END
|
004E6857   5F                     pop     edi
004E6858   5E                     pop     esi
004E6859   5B                     pop     ebx
004E685A   59                     pop     ecx
004E685B   59                     pop     ecx
004E685C   5D                     pop     ebp
004E685D   C3                     ret

*)
end;

procedure TForm1.VspomRaschetParam(Sender : TObject);
begin
(*
004E6884   55                     push    ebp
004E6885   8BEC                   mov     ebp, esp
004E6887   83C4C4                 add     esp, -$3C
004E688A   53                     push    ebx
004E688B   56                     push    esi
004E688C   57                     push    edi
004E688D   33DB                   xor     ebx, ebx
004E688F   895DE4                 mov     [ebp-$1C], ebx
004E6892   894DFC                 mov     [ebp-$04], ecx
004E6895   8BDA                   mov     ebx, edx
004E6897   8BF0                   mov     esi, eax
004E6899   BFF86D4F00             mov     edi, $004F6DF8
004E689E   33C0                   xor     eax, eax
004E68A0   55                     push    ebp
004E68A1   685A6B4E00             push    $004E6B5A

***** TRY
|
004E68A6   64FF30                 push    dword ptr fs:[eax]
004E68A9   648920                 mov     fs:[eax], esp
004E68AC   803DA76D4F0015         cmp     byte ptr [$004F6DA7], $15
004E68B3   7540                   jnz     004E68F5
004E68B5   8B45FC                 mov     eax, [ebp-$04]
004E68B8   50                     push    eax
004E68B9   C645D483               mov     byte ptr [ebp-$2C], $83
004E68BD   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E68C2   8845D5                 mov     [ebp-$2B], al
004E68C5   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E68CA   8845D6                 mov     [ebp-$2A], al
004E68CD   C645D722               mov     byte ptr [ebp-$29], $22
004E68D1   C645D812               mov     byte ptr [ebp-$28], $12
004E68D5   C645D901               mov     byte ptr [ebp-$27], $01
004E68D9   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E68DE   8845DA                 mov     [ebp-$26], al
004E68E1   8D55D4                 lea     edx, [ebp-$2C]
004E68E4   B906000000             mov     ecx, $00000006
004E68E9   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004E68EB   E878C5FFFF             call    004E2E68
004E68F0   E9C9000000             jmp     004E69BE
004E68F5   803DA76D4F0042         cmp     byte ptr [$004F6DA7], $42
004E68FC   7541                   jnz     004E693F
004E68FE   8B45FC                 mov     eax, [ebp-$04]
004E6901   50                     push    eax
004E6902   C645CC84               mov     byte ptr [ebp-$34], $84
004E6906   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E690B   8845CD                 mov     [ebp-$33], al
004E690E   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E6913   8845CE                 mov     [ebp-$32], al
004E6916   C645CF21               mov     byte ptr [ebp-$31], $21
004E691A   C645D001               mov     byte ptr [ebp-$30], $01
004E691E   C645D101               mov     byte ptr [ebp-$2F], $01
004E6922   C645D201               mov     byte ptr [ebp-$2E], $01
004E6926   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E692B   8845D3                 mov     [ebp-$2D], al
004E692E   8D55CC                 lea     edx, [ebp-$34]
004E6931   B907000000             mov     ecx, $00000007
004E6936   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004E6938   E82BC5FFFF             call    004E2E68
004E693D   EB7F                   jmp     004E69BE
004E693F   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004E6944   2C14                   sub     al, $14
004E6946   7404                   jz      004E694C
004E6948   2C1E                   sub     al, $1E
004E694A   753C                   jnz     004E6988
004E694C   8B45FC                 mov     eax, [ebp-$04]
004E694F   50                     push    eax
004E6950   C645D480               mov     byte ptr [ebp-$2C], $80
004E6954   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E6959   8845D5                 mov     [ebp-$2B], al
004E695C   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E6961   8845D6                 mov     [ebp-$2A], al
004E6964   C645D702               mov     byte ptr [ebp-$29], $02
004E6968   C645D821               mov     byte ptr [ebp-$28], $21
004E696C   885DD9                 mov     [ebp-$27], bl
004E696F   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E6974   8845DA                 mov     [ebp-$26], al
004E6977   8D55D4                 lea     edx, [ebp-$2C]
004E697A   B906000000             mov     ecx, $00000006
004E697F   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004E6981   E8E2C4FFFF             call    004E2E68
004E6986   EB36                   jmp     004E69BE
004E6988   8B45FC                 mov     eax, [ebp-$04]
004E698B   50                     push    eax
004E698C   C645C482               mov     byte ptr [ebp-$3C], $82
004E6990   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004E6995   8845C5                 mov     [ebp-$3B], al
004E6998   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004E699D   8845C6                 mov     [ebp-$3A], al
004E69A0   C645C721               mov     byte ptr [ebp-$39], $21
004E69A4   885DC8                 mov     [ebp-$38], bl
004E69A7   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004E69AC   8845C9                 mov     [ebp-$37], al
004E69AF   8D55C4                 lea     edx, [ebp-$3C]
004E69B2   B905000000             mov     ecx, $00000005
004E69B7   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004E69B9   E8AAC4FFFF             call    004E2E68
004E69BE   807F0B61               cmp     byte ptr [edi+$0B], $61
004E69C2   7506                   jnz     004E69CA
004E69C4   807F0A28               cmp     byte ptr [edi+$0A], $28
004E69C8   7435                   jz      004E69FF
004E69CA   807F0961               cmp     byte ptr [edi+$09], $61
004E69CE   7509                   jnz     004E69D9
004E69D0   33C0                   xor     eax, eax
004E69D2   8A470A                 mov     al, byte ptr [edi+$0A]
004E69D5   3BD8                   cmp     ebx, eax
004E69D7   7426                   jz      004E69FF
004E69D9   807F0B61               cmp     byte ptr [edi+$0B], $61
004E69DD   7509                   jnz     004E69E8
004E69DF   33C0                   xor     eax, eax
004E69E1   8A470C                 mov     al, byte ptr [edi+$0C]
004E69E4   3BD8                   cmp     ebx, eax
004E69E6   7417                   jz      004E69FF
004E69E8   807F0A61               cmp     byte ptr [edi+$0A], $61
004E69EC   0F8514010000           jnz     004E6B06
004E69F2   33C0                   xor     eax, eax
004E69F4   8A470B                 mov     al, byte ptr [edi+$0B]
004E69F7   3BD8                   cmp     ebx, eax
004E69F9   0F8507010000           jnz     004E6B06
004E69FF   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DB0
|
004E6A01   A3B06D4F00             mov     dword ptr [$004F6DB0], eax
004E6A06   C6051A724F0000         mov     byte ptr [$004F721A], $00
004E6A0D   C645FB01               mov     byte ptr [ebp-$05], $01

* Reference to: SysUtils.Time:TDateTime;
|
004E6A11   E80E45F2FF             call    0040AF24
004E6A16   83C4F8                 add     esp, -$08
004E6A19   DD1C24                 fstp    qword ptr [esp]
004E6A1C   9B                     wait
004E6A1D   8D45DC                 lea     eax, [ebp-$24]
004E6A20   50                     push    eax
004E6A21   8D4DDE                 lea     ecx, [ebp-$22]
004E6A24   8D55E0                 lea     edx, [ebp-$20]
004E6A27   8D45E2                 lea     eax, [ebp-$1E]

* Reference to: SysUtils.DecodeTime(TDateTime;Word;Word;Word;Word;Word;Word;Word;Word);
|
004E6A2A   E8A541F2FF             call    0040ABD4
004E6A2F   8A45E2                 mov     al, byte ptr [ebp-$1E]
004E6A32   8B15D86D4F00           mov     edx, [$004F6DD8]
004E6A38   884417FC               mov     [edi+edx-$04], al
004E6A3C   8A45E0                 mov     al, byte ptr [ebp-$20]
004E6A3F   8B15D86D4F00           mov     edx, [$004F6DD8]
004E6A45   884417FD               mov     [edi+edx-$03], al
004E6A49   8A45DE                 mov     al, byte ptr [ebp-$22]
004E6A4C   8B15D86D4F00           mov     edx, [$004F6DD8]
004E6A52   884417FE               mov     [edi+edx-$02], al
004E6A56   0FB745DC               movzx   eax, word ptr [ebp-$24]
004E6A5A   B90A000000             mov     ecx, $0000000A
004E6A5F   33D2                   xor     edx, edx
004E6A61   F7F1                   div     ecx 
004E6A63   8B15D86D4F00           mov     edx, [$004F6DD8]
004E6A69   884417FF               mov     [edi+edx-$01], al
004E6A6D   68CC6D4F00             push    $004F6DCC
004E6A72   8BD7                   mov     edx, edi
004E6A74   8B0DD86D4F00           mov     ecx, [$004F6DD8]
004E6A7A   B8006F4F00             mov     eax, $004F6F00

|
004E6A7F   E8CCC5F1FF             call    00403050

|
004E6A84   E82BBEF1FF             call    004028B4
004E6A89   8B4508                 mov     eax, [ebp+$08]
004E6A8C   40                     inc     eax
004E6A8D   50                     push    eax
004E6A8E   B8F86E4F00             mov     eax, $004F6EF8
004E6A93   B901000000             mov     ecx, $00000001

* Reference to object .2
|
004E6A98   8B15ECFA4D00           mov     edx, [$004DFAEC]

* Reference to: System.@DynArraySetLength;
|
004E6A9E   E891F2F1FF             call    00405D34
004E6AA3   83C404                 add     esp, +$04
004E6AA6   8B5D10                 mov     ebx, [ebp+$10]
004E6AA9   8B7D0C                 mov     edi, [ebp+$0C]
004E6AAC   2BFB                   sub     edi, ebx
004E6AAE   7C41                   jl      004E6AF1
004E6AB0   47                     inc     edi
004E6AB1   8D45E8                 lea     eax, [ebp-$18]
004E6AB4   50                     push    eax
004E6AB5   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E6AB8   E86FDFF1FF             call    00404A2C
004E6ABD   50                     push    eax
004E6ABE   8D45F4                 lea     eax, [ebp-$0C]
004E6AC1   50                     push    eax
004E6AC2   33C9                   xor     ecx, ecx
004E6AC4   8BD3                   mov     edx, ebx
004E6AC6   8BC6                   mov     eax, esi

* Reference to : TForm1.RaschetParam()
|
004E6AC8   E8A3000000             call    004E6B70
004E6ACD   837DF4FF               cmp     dword ptr [ebp-$0C], -$01
004E6AD1   7E1A                   jle     004E6AED
004E6AD3   6B45084C               imul    eax, [ebp+$08], $4C
004E6AD7   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6ADD   8D04C2                 lea     eax, [edx+eax*8]
004E6AE0   8B55E8                 mov     edx, [ebp-$18]
004E6AE3   8914D8                 mov     [eax+ebx*8], edx
004E6AE6   8B55EC                 mov     edx, [ebp-$14]
004E6AE9   8954D804               mov     [eax+ebx*8+$04], edx
004E6AED   43                     inc     ebx
004E6AEE   4F                     dec     edi
004E6AEF   75C0                   jnz     004E6AB1

* Reference to: SysUtils.Time:TDateTime;
|
004E6AF1   E82E44F2FF             call    0040AF24
004E6AF6   6B45084C               imul    eax, [ebp+$08], $4C
004E6AFA   8B15F86E4F00           mov     edx, [$004F6EF8]
004E6B00   DD1CC2                 fstp    qword ptr [edx+eax*8]
004E6B03   9B                     wait
004E6B04   EB17                   jmp     004E6B1D
004E6B06   FF05B06D4F00           inc     dword ptr [$004F6DB0]
004E6B0C   C645FB00               mov     byte ptr [ebp-$05], $00
004E6B10   B201                   mov     dl, $01

* Reference to control TForm1.TimerParam : TTimer
|
004E6B12   8B8630030000           mov     eax, [esi+$0330]

* Reference to: ExtCtrls.TTimer.SetEnabled(TTimer;Boolean);
|
004E6B18   E887E8F4FF             call    004353A4
004E6B1D   833DB06D4F0005         cmp     dword ptr [$004F6DB0], +$05
004E6B24   7E1E                   jle     004E6B44
004E6B26   C6051A724F0001         mov     byte ptr [$004F721A], $01

* Reference to TGrafForm instance
|
004E6B2D   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004E6B32   8B00                   mov     eax, [eax]

* Reference to: Forms.TCustomForm.Close(TCustomForm);
|
004E6B34   E81767F9FF             call    0047D250

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004E6B39   8B861C030000           mov     eax, [esi+$031C]
004E6B3F   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E6B41   FF5244                 call    dword ptr [edx+$44]
004E6B44   33C0                   xor     eax, eax
004E6B46   5A                     pop     edx
004E6B47   59                     pop     ecx
004E6B48   59                     pop     ecx
004E6B49   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E6B4C   68616B4E00             push    $004E6B61
004E6B51   8D45E4                 lea     eax, [ebp-$1C]

* Reference to: System.@LStrClr(void;void);
|
004E6B54   E8D3DEF1FF             call    00404A2C
004E6B59   C3                     ret


* Reference to: System.@HandleFinally;
|
004E6B5A   E94DD8F1FF             jmp     004043AC
004E6B5F   EBF0                   jmp     004E6B51

****** END
|
004E6B61   8A45FB                 mov     al, byte ptr [ebp-$05]
004E6B64   5F                     pop     edi
004E6B65   5E                     pop     esi
004E6B66   5B                     pop     ebx
004E6B67   8BE5                   mov     esp, ebp
004E6B69   5D                     pop     ebp
004E6B6A   C20C00                 ret     $000C

*)
end;

procedure TForm1.N4Click(Sender : TObject);
begin
(*
004ECE04   55                     push    ebp
004ECE05   8BEC                   mov     ebp, esp
004ECE07   6A00                   push    $00
004ECE09   53                     push    ebx
004ECE0A   8BD8                   mov     ebx, eax
004ECE0C   33C0                   xor     eax, eax
004ECE0E   55                     push    ebp

* Possible String Reference to: 'йCuсялр[Y]Г'
|
004ECE0F   6864CE4E00             push    $004ECE64

***** TRY
|
004ECE14   64FF30                 push    dword ptr fs:[eax]
004ECE17   648920                 mov     fs:[eax], esp
004ECE1A   6A05                   push    $05
004ECE1C   6A00                   push    $00
004ECE1E   6A00                   push    $00
004ECE20   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: 'CheviExplorer.chm'
|
004ECE23   B978CE4E00             mov     ecx, $004ECE78
004ECE28   8B15F46D4F00           mov     edx, [$004F6DF4]

* Reference to: System.@LStrCat3;
|
004ECE2E   E8057FF1FF             call    00404D38
004ECE33   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrToPChar(String):PAnsiChar;
|
004ECE36   E8B180F1FF             call    00404EEC
004ECE3B   50                     push    eax

* Possible String Reference to: 'open'
|
004ECE3C   688CCE4E00             push    $004ECE8C
004ECE41   8BC3                   mov     eax, ebx

* Reference to: QForms.TCustomForm.GetClientHandle(TCustomForm):QWorkspaceH;
|
004ECE43   E8B49DF7FF             call    00466BFC
004ECE48   50                     push    eax

* Reference to: shell32.ShellExecuteA()
|
004ECE49   E80E3DF4FF             call    00430B5C
004ECE4E   33C0                   xor     eax, eax
004ECE50   5A                     pop     edx
004ECE51   59                     pop     ecx
004ECE52   59                     pop     ecx
004ECE53   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[Y]Г'
|
004ECE56   686BCE4E00             push    $004ECE6B
004ECE5B   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004ECE5E   E8C97BF1FF             call    00404A2C
004ECE63   C3                     ret


* Reference to: System.@HandleFinally;
|
004ECE64   E94375F1FF             jmp     004043AC
004ECE69   EBF0                   jmp     004ECE5B

****** END
|
004ECE6B   5B                     pop     ebx
004ECE6C   59                     pop     ecx
004ECE6D   5D                     pop     ebp
004ECE6E   C3                     ret

*)
end;

procedure TForm1.Previous_NaborExecute(Sender : TObject);
begin
(*
004EBBEC   53                     push    ebx
004EBBED   8BD8                   mov     ebx, eax
004EBBEF   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EBBF6   7522                   jnz     004EBC1A

* Reference to TGrafForm instance
|
004EBBF8   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EBBFD   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Previous_Nabor : TMenuItem
|
004EBBFF   8B8040030000           mov     eax, [eax+$0340]
004EBC05   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EBC07   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EBC0A   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EBC10   E80F55FAFF             call    00491124
004EBC15   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EBC17   FF5244                 call    dword ptr [edx+$44]
004EBC1A   5B                     pop     ebx
004EBC1B   C3                     ret

*)
end;

procedure TForm1.Next_NaborExecute(Sender : TObject);
begin
(*
004EBC1C   53                     push    ebx
004EBC1D   8BD8                   mov     ebx, eax
004EBC1F   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EBC26   7522                   jnz     004EBC4A

* Reference to TGrafForm instance
|
004EBC28   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EBC2D   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Next_Nabor : TMenuItem
|
004EBC2F   8B8044030000           mov     eax, [eax+$0344]
004EBC35   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EBC37   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EBC3A   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EBC40   E8DF54FAFF             call    00491124
004EBC45   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EBC47   FF5244                 call    dword ptr [edx+$44]
004EBC4A   5B                     pop     ebx
004EBC4B   C3                     ret

*)
end;

procedure TForm1.Edit_NaborExecute(Sender : TObject);
begin
(*
004EBC4C   53                     push    ebx
004EBC4D   8BD8                   mov     ebx, eax
004EBC4F   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EBC56   7522                   jnz     004EBC7A

* Reference to TGrafForm instance
|
004EBC58   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EBC5D   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.Edit_Nabor : TMenuItem
|
004EBC5F   8B8048030000           mov     eax, [eax+$0348]
004EBC65   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004EBC67   FF5244                 call    dword ptr [edx+$44]

* Reference to control TForm1.List_Param : TValueListEditor
|
004EBC6A   8B8324030000           mov     eax, [ebx+$0324]

* Reference to: ValEdit.TValueListEditor.GetColCount(TValueListEditor):Integer;
|
004EBC70   E8AF54FAFF             call    00491124
004EBC75   8B10                   mov     edx, [eax]

* Possible reference to virtual method TValueListEditor.OFFS_44
|
004EBC77   FF5244                 call    dword ptr [edx+$44]
004EBC7A   5B                     pop     ebx
004EBC7B   C3                     ret

*)
end;

procedure TForm1.N_Airbag_SRS0Click(Sender : TObject);
begin
(*
004E3FC8   53                     push    ebx
004E3FC9   56                     push    esi
004E3FCA   8BD8                   mov     ebx, eax
004E3FCC   C605A76D4F0031         mov     byte ptr [$004F6DA7], $31
004E3FD3   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3FD5   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3FDB   E8C4ECF8FF             call    00472CA4
004E3FE0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3FE2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3FE8   E8B7ECF8FF             call    00472CA4
004E3FED   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3FEF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3FF5   E8AAECF8FF             call    00472CA4
004E3FFA   6A01                   push    $01

* Possible String Reference to: 'SRS'
|
004E3FFC   B92C404E00             mov     ecx, $004E402C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E4001   BA38404E00             mov     edx, $004E4038
004E4006   A120724F00             mov     eax, dword ptr [$004F7220]
004E400B   8B30                   mov     esi, [eax]
004E400D   FF560C                 call    dword ptr [esi+$0C]
004E4010   B204                   mov     dl, $04
004E4012   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E4014   E86BF2FFFF             call    004E3284
004E4019   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E401B   E8B8000000             call    004E40D8
004E4020   5E                     pop     esi
004E4021   5B                     pop     ebx
004E4022   C3                     ret

*)
end;

procedure TForm1.FormResize(Sender : TObject);
begin
(*
004ECED4   53                     push    ebx
004ECED5   56                     push    esi
004ECED6   8BD8                   mov     ebx, eax
004ECED8   33D2                   xor     edx, edx

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004ECEDA   8BB3B0030000           mov     esi, [ebx+$03B0]
004ECEE0   8BC6                   mov     eax, esi

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004ECEE2   E8EDF1F9FF             call    0048C0D4

* Reference to field TStringGrid.Width : Integer
|
004ECEE7   8B5648                 mov     edx, [esi+$48]
004ECEEA   2BD0                   sub     edx, eax
004ECEEC   52                     push    edx
004ECEED   BA01000000             mov     edx, $00000001

* Reference to control TForm1.StringGrid_DTC : TStringGrid
|
004ECEF2   8B83B0030000           mov     eax, [ebx+$03B0]

* Reference to: Grids.TCustomGrid.GetColWidths(TCustomGrid;Longint):Integer;
|
004ECEF8   E8D7F1F9FF             call    0048C0D4
004ECEFD   59                     pop     ecx
004ECEFE   2BC8                   sub     ecx, eax
004ECF00   83E907                 sub     ecx, +$07
004ECF03   BA02000000             mov     edx, $00000002
004ECF08   8BC6                   mov     eax, esi

* Reference to: Grids.TCustomGrid.SetColWidths(TCustomGrid;Longint;Integer);
|
004ECF0A   E8FDF2F9FF             call    0048C20C
004ECF0F   5E                     pop     esi
004ECF10   5B                     pop     ebx
004ECF11   C3                     ret

*)
end;

procedure TForm1.N_ABS_BoshClick(Sender : TObject);
begin
(*
004E3D78   53                     push    ebx
004E3D79   56                     push    esi
004E3D7A   8BD8                   mov     ebx, eax
004E3D7C   C605A76D4F0041         mov     byte ptr [$004F6DA7], $41
004E3D83   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3D8A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3D91   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3D9B   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3D9D   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3DA3   E8FCEEF8FF             call    00472CA4
004E3DA8   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3DAA   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3DB0   E8EFEEF8FF             call    00472CA4
004E3DB5   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3DB7   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3DBD   E8E2EEF8FF             call    00472CA4
004E3DC2   6A01                   push    $01

* Possible String Reference to: 'ABS'
|
004E3DC4   B9F43D4E00             mov     ecx, $004E3DF4

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3DC9   BA003E4E00             mov     edx, $004E3E00
004E3DCE   A120724F00             mov     eax, dword ptr [$004F7220]
004E3DD3   8B30                   mov     esi, [eax]
004E3DD5   FF560C                 call    dword ptr [esi+$0C]
004E3DD8   B203                   mov     dl, $03
004E3DDA   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3DDC   E8A3F4FFFF             call    004E3284
004E3DE1   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3DE3   E8F0020000             call    004E40D8
004E3DE8   5E                     pop     esi
004E3DE9   5B                     pop     ebx
004E3DEA   C3                     ret

*)
end;

procedure TForm1.N_ABS_TevesClick(Sender : TObject);
begin
(*
004E3E0C   53                     push    ebx
004E3E0D   56                     push    esi
004E3E0E   8BD8                   mov     ebx, eax
004E3E10   C605A76D4F0042         mov     byte ptr [$004F6DA7], $42
004E3E17   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3E1E   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3E25   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3E2F   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3E31   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E37   E868EEF8FF             call    00472CA4
004E3E3C   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3E3E   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E44   E85BEEF8FF             call    00472CA4
004E3E49   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3E4B   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3E51   E84EEEF8FF             call    00472CA4
004E3E56   6A02                   push    $02

* Possible String Reference to: 'ABS'
|
004E3E58   B9883E4E00             mov     ecx, $004E3E88

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3E5D   BA943E4E00             mov     edx, $004E3E94
004E3E62   A120724F00             mov     eax, dword ptr [$004F7220]
004E3E67   8B30                   mov     esi, [eax]
004E3E69   FF560C                 call    dword ptr [esi+$0C]
004E3E6C   B203                   mov     dl, $03
004E3E6E   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3E70   E80FF4FFFF             call    004E3284
004E3E75   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3E77   E85C020000             call    004E40D8
004E3E7C   5E                     pop     esi
004E3E7D   5B                     pop     ebx
004E3E7E   C3                     ret

*)
end;

procedure TForm1.N_ABS_AVEO1Click(Sender : TObject);
begin
(*
004E3EA0   53                     push    ebx
004E3EA1   56                     push    esi
004E3EA2   8BD8                   mov     ebx, eax
004E3EA4   C605A76D4F0043         mov     byte ptr [$004F6DA7], $43
004E3EAB   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3EB2   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3EB9   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3EC3   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3EC5   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3ECB   E8D4EDF8FF             call    00472CA4
004E3ED0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3ED2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3ED8   E8C7EDF8FF             call    00472CA4
004E3EDD   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3EDF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3EE5   E8BAEDF8FF             call    00472CA4
004E3EEA   6A03                   push    $03

* Possible String Reference to: 'ABS'
|
004E3EEC   B91C3F4E00             mov     ecx, $004E3F1C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3EF1   BA283F4E00             mov     edx, $004E3F28
004E3EF6   A120724F00             mov     eax, dword ptr [$004F7220]
004E3EFB   8B30                   mov     esi, [eax]
004E3EFD   FF560C                 call    dword ptr [esi+$0C]
004E3F00   B203                   mov     dl, $03
004E3F02   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3F04   E87BF3FFFF             call    004E3284
004E3F09   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3F0B   E8C8010000             call    004E40D8
004E3F10   5E                     pop     esi
004E3F11   5B                     pop     ebx
004E3F12   C3                     ret

*)
end;

procedure TForm1.N_ABS_AVEO3Click(Sender : TObject);
begin
(*
004E3F34   53                     push    ebx
004E3F35   56                     push    esi
004E3F36   8BD8                   mov     ebx, eax
004E3F38   C605A76D4F0044         mov     byte ptr [$004F6DA7], $44
004E3F3F   C605A86D4F0028         mov     byte ptr [$004F6DA8], $28
004E3F46   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3F4D   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3F57   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3F59   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F5F   E840EDF8FF             call    00472CA4
004E3F64   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3F66   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F6C   E833EDF8FF             call    00472CA4
004E3F71   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3F73   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3F79   E826EDF8FF             call    00472CA4
004E3F7E   6A04                   push    $04

* Possible String Reference to: 'ABS'
|
004E3F80   B9B03F4E00             mov     ecx, $004E3FB0

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3F85   BABC3F4E00             mov     edx, $004E3FBC
004E3F8A   A120724F00             mov     eax, dword ptr [$004F7220]
004E3F8F   8B30                   mov     esi, [eax]
004E3F91   FF560C                 call    dword ptr [esi+$0C]
004E3F94   B203                   mov     dl, $03
004E3F96   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3F98   E8E7F2FFFF             call    004E3284
004E3F9D   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3F9F   E834010000             call    004E40D8
004E3FA4   5E                     pop     esi
004E3FA5   5B                     pop     ebx
004E3FA6   C3                     ret

*)
end;

procedure TForm1.Label_DvigClick(Sender : TObject);
begin
(*
004E3658   53                     push    ebx
004E3659   56                     push    esi
004E365A   83C4F0                 add     esp, -$10
004E365D   8BD8                   mov     ebx, eax
004E365F   6A00                   push    $00

* Possible String Reference to: 'Dvig'
|
004E3661   B9F8364E00             mov     ecx, $004E36F8

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3666   BA08374E00             mov     edx, $004E3708
004E366B   A120724F00             mov     eax, dword ptr [$004F7220]
004E3670   8B30                   mov     esi, [eax]
004E3672   FF5608                 call    dword ptr [esi+$08]
004E3675   48                     dec     eax
004E3676   740B                   jz      004E3683
004E3678   48                     dec     eax
004E3679   7415                   jz      004E3690
004E367B   48                     dec     eax
004E367C   741F                   jz      004E369D
004E367E   48                     dec     eax
004E367F   7429                   jz      004E36AA
004E3681   EB34                   jmp     004E36B7

* Reference to control TForm1.N_Sirius : TMenuItem
|
004E3683   8B8360030000           mov     eax, [ebx+$0360]
004E3689   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E368B   FF5244                 call    dword ptr [edx+$44]
004E368E   EB5A                   jmp     004E36EA

* Reference to control TForm1.N_MR140 : TMenuItem
|
004E3690   8B8364030000           mov     eax, [ebx+$0364]
004E3696   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3698   FF5244                 call    dword ptr [edx+$44]
004E369B   EB4D                   jmp     004E36EA

* Reference to control TForm1.N_SiriusD32 : TMenuItem
|
004E369D   8B832C040000           mov     eax, [ebx+$042C]
004E36A3   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E36A5   FF5244                 call    dword ptr [edx+$44]
004E36A8   EB40                   jmp     004E36EA

* Reference to control TForm1.N_Bosch : TMenuItem
|
004E36AA   8B8334040000           mov     eax, [ebx+$0434]
004E36B0   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E36B2   FF5244                 call    dword ptr [edx+$44]
004E36B5   EB33                   jmp     004E36EA
004E36B7   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E36B9   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E36BE   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E36C0   E8477EF8FF             call    0046B50C
004E36C5   8B442404               mov     eax, [esp+$04]
004E36C9   50                     push    eax
004E36CA   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E36CE   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E36D3   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E36D5   E8327EF8FF             call    0046B50C
004E36DA   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_Dvig : TPopupMenu
|
004E36DE   8B83BC030000           mov     eax, [ebx+$03BC]
004E36E4   59                     pop     ecx
004E36E5   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E36E7   FF5340                 call    dword ptr [ebx+$40]
004E36EA   83C410                 add     esp, +$10
004E36ED   5E                     pop     esi
004E36EE   5B                     pop     ebx
004E36EF   C3                     ret

*)
end;

procedure TForm1.Label_AKPPClick(Sender : TObject);
begin
(*
004E3714   53                     push    ebx
004E3715   56                     push    esi
004E3716   83C4F0                 add     esp, -$10
004E3719   8BD8                   mov     ebx, eax
004E371B   6A00                   push    $00

* Possible String Reference to: 'AKPP'
|
004E371D   B994374E00             mov     ecx, $004E3794

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3722   BAA4374E00             mov     edx, $004E37A4
004E3727   A120724F00             mov     eax, dword ptr [$004F7220]
004E372C   8B30                   mov     esi, [eax]
004E372E   FF5608                 call    dword ptr [esi+$08]
004E3731   48                     dec     eax
004E3732   7405                   jz      004E3739
004E3734   48                     dec     eax
004E3735   740F                   jz      004E3746
004E3737   EB1A                   jmp     004E3753

* Reference to control TForm1.N_Aisin : TMenuItem
|
004E3739   8B836C030000           mov     eax, [ebx+$036C]
004E373F   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3741   FF5244                 call    dword ptr [edx+$44]
004E3744   EB40                   jmp     004E3786

* Reference to control TForm1.N_ZF : TMenuItem
|
004E3746   8B8368030000           mov     eax, [ebx+$0368]
004E374C   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E374E   FF5244                 call    dword ptr [edx+$44]
004E3751   EB33                   jmp     004E3786
004E3753   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E3755   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E375A   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E375C   E8AB7DF8FF             call    0046B50C
004E3761   8B442404               mov     eax, [esp+$04]
004E3765   50                     push    eax
004E3766   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E376A   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E376F   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3771   E8967DF8FF             call    0046B50C
004E3776   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_AKPP : TPopupMenu
|
004E377A   8B83C8030000           mov     eax, [ebx+$03C8]
004E3780   59                     pop     ecx
004E3781   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E3783   FF5340                 call    dword ptr [ebx+$40]
004E3786   83C410                 add     esp, +$10
004E3789   5E                     pop     esi
004E378A   5B                     pop     ebx
004E378B   C3                     ret

*)
end;

procedure TForm1.Label_ABSClick(Sender : TObject);
begin
(*
004E37B0   53                     push    ebx
004E37B1   56                     push    esi
004E37B2   83C4F0                 add     esp, -$10
004E37B5   8BD8                   mov     ebx, eax
004E37B7   6A00                   push    $00

* Possible String Reference to: 'ABS'
|
004E37B9   B950384E00             mov     ecx, $004E3850

* Possible String Reference to: 'Vib_tip_ECU'
|
004E37BE   BA5C384E00             mov     edx, $004E385C
004E37C3   A120724F00             mov     eax, dword ptr [$004F7220]
004E37C8   8B30                   mov     esi, [eax]
004E37CA   FF5608                 call    dword ptr [esi+$08]
004E37CD   48                     dec     eax
004E37CE   740B                   jz      004E37DB
004E37D0   48                     dec     eax
004E37D1   7415                   jz      004E37E8
004E37D3   48                     dec     eax
004E37D4   741F                   jz      004E37F5
004E37D6   48                     dec     eax
004E37D7   7429                   jz      004E3802
004E37D9   EB34                   jmp     004E380F

* Reference to control TForm1.N_ABS_Bosh : TMenuItem
|
004E37DB   8B83B4030000           mov     eax, [ebx+$03B4]
004E37E1   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E37E3   FF5244                 call    dword ptr [edx+$44]
004E37E6   EB5A                   jmp     004E3842

* Reference to control TForm1.N_ABS_Teves : TMenuItem
|
004E37E8   8B83B8030000           mov     eax, [ebx+$03B8]
004E37EE   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E37F0   FF5244                 call    dword ptr [edx+$44]
004E37F3   EB4D                   jmp     004E3842

* Reference to control TForm1.N_ABS_AVEO1 : TMenuItem
|
004E37F5   8B83F4030000           mov     eax, [ebx+$03F4]
004E37FB   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E37FD   FF5244                 call    dword ptr [edx+$44]
004E3800   EB40                   jmp     004E3842

* Reference to control TForm1.N_ABS_AVEO3 : TMenuItem
|
004E3802   8B83F8030000           mov     eax, [ebx+$03F8]
004E3808   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E380A   FF5244                 call    dword ptr [edx+$44]
004E380D   EB33                   jmp     004E3842
004E380F   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E3811   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E3816   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E3818   E8EF7CF8FF             call    0046B50C
004E381D   8B442404               mov     eax, [esp+$04]
004E3821   50                     push    eax
004E3822   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E3826   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E382B   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E382D   E8DA7CF8FF             call    0046B50C
004E3832   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_ABS : TPopupMenu
|
004E3836   8B83D4030000           mov     eax, [ebx+$03D4]
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

procedure TForm1.SecurityAccess(Sender : TObject);
begin
(*
004ECF14   53                     push    ebx
004ECF15   56                     push    esi
004ECF16   57                     push    edi
004ECF17   55                     push    ebp
004ECF18   83C4EC                 add     esp, -$14
004ECF1B   8BF0                   mov     esi, eax
004ECF1D   33DB                   xor     ebx, ebx
004ECF1F   33FF                   xor     edi, edi

* Reference to: kernel32.GetTickCount()
|
004ECF21   E82AA1F1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004ECF26   A3986D4F00             mov     dword ptr [$004F6D98], eax
004ECF2B   EB0C                   jmp     004ECF39

* Reference to TApplication instance
|
004ECF2D   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004ECF32   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ECF34   E8AB38F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004ECF39   E812A1F1FF             call    00407050
004ECF3E   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004ECF44   83F864                 cmp     eax, +$64
004ECF47   72E4                   jb      004ECF2D
004ECF49   6A12                   push    $12
004ECF4B   C644240882             mov     byte ptr [esp+$08], $82
004ECF50   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ECF55   88442409               mov     [esp+$09], al
004ECF59   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ECF5E   8844240A               mov     [esp+$0A], al
004ECF62   C644240B27             mov     byte ptr [esp+$0B], $27
004ECF67   C644240C01             mov     byte ptr [esp+$0C], $01
004ECF6C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ECF71   8844240D               mov     [esp+$0D], al
004ECF75   8D542408               lea     edx, [esp+$08]
004ECF79   B905000000             mov     ecx, $00000005
004ECF7E   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004ECF80   E8E35EFFFF             call    004E2E68
004ECF85   0FB62D036E4F00         movzx   ebp, byte ptr [$004F6E03]
004ECF8C   33C0                   xor     eax, eax
004ECF8E   A0046E4F00             mov     al, byte ptr [$004F6E04]
004ECF93   47                     inc     edi
004ECF94   83FF14                 cmp     edi, +$14
004ECF97   0F8F00050000           jnle    004ED49D
004ECF9D   8BD5                   mov     edx, ebp
004ECF9F   85D2                   test    edx, edx
004ECFA1   7903                   jns     004ECFA6
004ECFA3   83C20F                 add     edx, +$0F
004ECFA6   C1FA04                 sar     edx, $04
004ECFA9   83C2FE                 add     edx, -$02
004ECFAC   83EA02                 sub     edx, +$02
004ECFAF   0F826CFFFFFF           jb      004ECF21
004ECFB5   83C2FE                 add     edx, -$02
004ECFB8   83EA02                 sub     edx, +$02
004ECFBB   0F8260FFFFFF           jb      004ECF21
004ECFC1   83C2FE                 add     edx, -$02
004ECFC4   83EA02                 sub     edx, +$02
004ECFC7   0F8254FFFFFF           jb      004ECF21
004ECFCD   83C2FE                 add     edx, -$02
004ECFD0   83EA02                 sub     edx, +$02
004ECFD3   0F8248FFFFFF           jb      004ECF21
004ECFD9   8BD5                   mov     edx, ebp
004ECFDB   81E201000080           and     edx, $80000001
004ECFE1   7905                   jns     004ECFE8
004ECFE3   4A                     dec     edx
004ECFE4   83CAFE                 or      edx, -$02
004ECFE7   42                     inc     edx
004ECFE8   85D2                   test    edx, edx
004ECFEA   0F8F31FFFFFF           jnle    004ECF21
004ECFF0   8BD5                   mov     edx, ebp
004ECFF2   85D2                   test    edx, edx
004ECFF4   7903                   jns     004ECFF9
004ECFF6   83C20F                 add     edx, +$0F
004ECFF9   C1FA04                 sar     edx, $04
004ECFFC   83FA07                 cmp     edx, +$07
004ECFFF   7E07                   jle     004ED008
004ED001   BA02000000             mov     edx, $00000002
004ED006   EB02                   jmp     004ED00A
004ED008   33D2                   xor     edx, edx
004ED00A   8BCD                   mov     ecx, ebp
004ED00C   81E10F000080           and     ecx, $8000000F
004ED012   7905                   jns     004ED019
004ED014   49                     dec     ecx
004ED015   83C9F0                 or      ecx, -$10
004ED018   41                     inc     ecx
004ED019   83F907                 cmp     ecx, +$07
004ED01C   7E07                   jle     004ED025
004ED01E   B901000000             mov     ecx, $00000001
004ED023   EB02                   jmp     004ED027
004ED025   33C9                   xor     ecx, ecx
004ED027   8BD8                   mov     ebx, eax
004ED029   81E30F000080           and     ebx, $8000000F
004ED02F   7905                   jns     004ED036
004ED031   4B                     dec     ebx
004ED032   83CBF0                 or      ebx, -$10
004ED035   43                     inc     ebx
004ED036   83FB07                 cmp     ebx, +$07
004ED039   7E11                   jle     004ED04C
004ED03B   8BD8                   mov     ebx, eax
004ED03D   85DB                   test    ebx, ebx
004ED03F   7903                   jns     004ED044
004ED041   83C30F                 add     ebx, +$0F
004ED044   C1FB04                 sar     ebx, $04
004ED047   83FB08                 cmp     ebx, +$08
004ED04A   7C25                   jl      004ED071
004ED04C   8BD8                   mov     ebx, eax
004ED04E   81E30F000080           and     ebx, $8000000F
004ED054   7905                   jns     004ED05B
004ED056   4B                     dec     ebx
004ED057   83CBF0                 or      ebx, -$10
004ED05A   43                     inc     ebx
004ED05B   83FB08                 cmp     ebx, +$08
004ED05E   7D18                   jnl     004ED078
004ED060   8BD8                   mov     ebx, eax
004ED062   85DB                   test    ebx, ebx
004ED064   7903                   jns     004ED069
004ED066   83C30F                 add     ebx, +$0F
004ED069   C1FB04                 sar     ebx, $04
004ED06C   83FB07                 cmp     ebx, +$07
004ED06F   7E07                   jle     004ED078
004ED071   BF01000000             mov     edi, $00000001
004ED076   EB02                   jmp     004ED07A
004ED078   33FF                   xor     edi, edi
004ED07A   8BDD                   mov     ebx, ebp
004ED07C   81E30F000080           and     ebx, $8000000F
004ED082   7905                   jns     004ED089
004ED084   4B                     dec     ebx
004ED085   83CBF0                 or      ebx, -$10
004ED088   43                     inc     ebx
004ED089   83FB07                 cmp     ebx, +$07
004ED08C   7E25                   jle     004ED0B3
004ED08E   8BD8                   mov     ebx, eax
004ED090   85DB                   test    ebx, ebx
004ED092   7903                   jns     004ED097
004ED094   83C30F                 add     ebx, +$0F
004ED097   C1FB04                 sar     ebx, $04
004ED09A   83FB07                 cmp     ebx, +$07
004ED09D   7E14                   jle     004ED0B3
004ED09F   8BD8                   mov     ebx, eax
004ED0A1   81E30F000080           and     ebx, $8000000F
004ED0A7   7905                   jns     004ED0AE
004ED0A9   4B                     dec     ebx
004ED0AA   83CBF0                 or      ebx, -$10
004ED0AD   43                     inc     ebx
004ED0AE   83FB08                 cmp     ebx, +$08
004ED0B1   7C39                   jl      004ED0EC
004ED0B3   8BDD                   mov     ebx, ebp
004ED0B5   81E30F000080           and     ebx, $8000000F
004ED0BB   7905                   jns     004ED0C2
004ED0BD   4B                     dec     ebx
004ED0BE   83CBF0                 or      ebx, -$10
004ED0C1   43                     inc     ebx
004ED0C2   83FB07                 cmp     ebx, +$07
004ED0C5   7E2E                   jle     004ED0F5
004ED0C7   8BD8                   mov     ebx, eax
004ED0C9   85DB                   test    ebx, ebx
004ED0CB   7903                   jns     004ED0D0
004ED0CD   83C30F                 add     ebx, +$0F
004ED0D0   C1FB04                 sar     ebx, $04
004ED0D3   83FB08                 cmp     ebx, +$08
004ED0D6   7D1D                   jnl     004ED0F5
004ED0D8   8BD8                   mov     ebx, eax
004ED0DA   81E30F000080           and     ebx, $8000000F
004ED0E0   7905                   jns     004ED0E7
004ED0E2   4B                     dec     ebx
004ED0E3   83CBF0                 or      ebx, -$10
004ED0E6   43                     inc     ebx
004ED0E7   83FB07                 cmp     ebx, +$07
004ED0EA   7E09                   jle     004ED0F5
004ED0EC   C70424FEFFFFFF         mov     dword ptr [esp], $FFFFFFFE
004ED0F3   EB05                   jmp     004ED0FA
004ED0F5   33DB                   xor     ebx, ebx
004ED0F7   891C24                 mov     [esp], ebx
004ED0FA   8BDD                   mov     ebx, ebp
004ED0FC   C1E302                 shl     ebx, $02
004ED0FF   03D3                   add     edx, ebx
004ED101   03CA                   add     ecx, edx
004ED103   03F9                   add     edi, ecx
004ED105   033C24                 add     edi, [esp]
004ED108   33DB                   xor     ebx, ebx
004ED10A   8BD5                   mov     edx, ebp
004ED10C   85D2                   test    edx, edx
004ED10E   7903                   jns     004ED113
004ED110   83C20F                 add     edx, +$0F
004ED113   C1FA04                 sar     edx, $04
004ED116   81E201000080           and     edx, $80000001
004ED11C   7905                   jns     004ED123
004ED11E   4A                     dec     edx
004ED11F   83CAFE                 or      edx, -$02
004ED122   42                     inc     edx
004ED123   85D2                   test    edx, edx
004ED125   7523                   jnz     004ED14A
004ED127   8BD5                   mov     edx, ebp
004ED129   81E20F000080           and     edx, $8000000F
004ED12F   7905                   jns     004ED136
004ED131   4A                     dec     edx
004ED132   83CAF0                 or      edx, -$10
004ED135   42                     inc     edx
004ED136   83EA04                 sub     edx, +$04
004ED139   7456                   jz      004ED191
004ED13B   83EA02                 sub     edx, +$02
004ED13E   7451                   jz      004ED191
004ED140   83EA02                 sub     edx, +$02
004ED143   744C                   jz      004ED191
004ED145   83EA02                 sub     edx, +$02
004ED148   7447                   jz      004ED191
004ED14A   8BD5                   mov     edx, ebp
004ED14C   85D2                   test    edx, edx
004ED14E   7903                   jns     004ED153
004ED150   83C20F                 add     edx, +$0F
004ED153   C1FA04                 sar     edx, $04
004ED156   81E201000080           and     edx, $80000001
004ED15C   7905                   jns     004ED163
004ED15E   4A                     dec     edx
004ED15F   83CAFE                 or      edx, -$02
004ED162   42                     inc     edx
004ED163   85D2                   test    edx, edx
004ED165   0F8E32010000           jle     004ED29D
004ED16B   8BD5                   mov     edx, ebp
004ED16D   81E20F000080           and     edx, $8000000F
004ED173   7905                   jns     004ED17A
004ED175   4A                     dec     edx
004ED176   83CAF0                 or      edx, -$10
004ED179   42                     inc     edx
004ED17A   85D2                   test    edx, edx
004ED17C   7413                   jz      004ED191
004ED17E   83EA02                 sub     edx, +$02
004ED181   740E                   jz      004ED191
004ED183   83EA0A                 sub     edx, +$0A
004ED186   7409                   jz      004ED191
004ED188   83EA02                 sub     edx, +$02
004ED18B   0F850C010000           jnz     004ED29D
004ED191   8BD0                   mov     edx, eax
004ED193   81E201000080           and     edx, $80000001
004ED199   7905                   jns     004ED1A0
004ED19B   4A                     dec     edx
004ED19C   83CAFE                 or      edx, -$02
004ED19F   42                     inc     edx
004ED1A0   85D2                   test    edx, edx
004ED1A2   7E1C                   jle     004ED1C0
004ED1A4   8BD0                   mov     edx, eax
004ED1A6   85D2                   test    edx, edx
004ED1A8   7903                   jns     004ED1AD
004ED1AA   83C20F                 add     edx, +$0F
004ED1AD   C1FA04                 sar     edx, $04
004ED1B0   83C2FA                 add     edx, -$06
004ED1B3   83EA02                 sub     edx, +$02
004ED1B6   7237                   jb      004ED1EF
004ED1B8   83C2FA                 add     edx, -$06
004ED1BB   83EA02                 sub     edx, +$02
004ED1BE   722F                   jb      004ED1EF
004ED1C0   8BD0                   mov     edx, eax
004ED1C2   81E201000080           and     edx, $80000001
004ED1C8   7905                   jns     004ED1CF
004ED1CA   4A                     dec     edx
004ED1CB   83CAFE                 or      edx, -$02
004ED1CE   42                     inc     edx
004ED1CF   85D2                   test    edx, edx
004ED1D1   7538                   jnz     004ED20B
004ED1D3   8BD0                   mov     edx, eax
004ED1D5   85D2                   test    edx, edx
004ED1D7   7903                   jns     004ED1DC
004ED1D9   83C20F                 add     edx, +$0F
004ED1DC   C1FA04                 sar     edx, $04
004ED1DF   83C2FE                 add     edx, -$02
004ED1E2   83EA02                 sub     edx, +$02
004ED1E5   7208                   jb      004ED1EF
004ED1E7   83C2FA                 add     edx, -$06
004ED1EA   83EA02                 sub     edx, +$02
004ED1ED   731C                   jnb     004ED20B
004ED1EF   8BD0                   mov     edx, eax
004ED1F1   C1E203                 shl     edx, $03
004ED1F4   8BDA                   mov     ebx, edx
004ED1F6   85D2                   test    edx, edx
004ED1F8   7906                   jns     004ED200
004ED1FA   81C2FF000000           add     edx, $000000FF
004ED200   C1FA08                 sar     edx, $08
004ED203   03DA                   add     ebx, edx
004ED205   4B                     dec     ebx
004ED206   E91B020000             jmp     004ED426
004ED20B   8BD0                   mov     edx, eax
004ED20D   81E201000080           and     edx, $80000001
004ED213   7905                   jns     004ED21A
004ED215   4A                     dec     edx
004ED216   83CAFE                 or      edx, -$02
004ED219   42                     inc     edx
004ED21A   85D2                   test    edx, edx
004ED21C   7519                   jnz     004ED237
004ED21E   8BD0                   mov     edx, eax
004ED220   85D2                   test    edx, edx
004ED222   7903                   jns     004ED227
004ED224   83C20F                 add     edx, +$0F
004ED227   C1FA04                 sar     edx, $04
004ED22A   83EA02                 sub     edx, +$02
004ED22D   7237                   jb      004ED266
004ED22F   83C2FA                 add     edx, -$06
004ED232   83EA02                 sub     edx, +$02
004ED235   722F                   jb      004ED266
004ED237   8BD0                   mov     edx, eax
004ED239   81E201000080           and     edx, $80000001
004ED23F   7905                   jns     004ED246
004ED241   4A                     dec     edx
004ED242   83CAFE                 or      edx, -$02
004ED245   42                     inc     edx
004ED246   85D2                   test    edx, edx
004ED248   7E38                   jle     004ED282
004ED24A   8BD0                   mov     edx, eax
004ED24C   85D2                   test    edx, edx
004ED24E   7903                   jns     004ED253
004ED250   83C20F                 add     edx, +$0F
004ED253   C1FA04                 sar     edx, $04
004ED256   83C2FC                 add     edx, -$04
004ED259   83EA02                 sub     edx, +$02
004ED25C   7208                   jb      004ED266
004ED25E   83C2FA                 add     edx, -$06
004ED261   83EA02                 sub     edx, +$02
004ED264   731C                   jnb     004ED282
004ED266   8BD0                   mov     edx, eax
004ED268   C1E203                 shl     edx, $03
004ED26B   8BDA                   mov     ebx, edx
004ED26D   85D2                   test    edx, edx
004ED26F   7906                   jns     004ED277
004ED271   81C2FF000000           add     edx, $000000FF
004ED277   C1FA08                 sar     edx, $08
004ED27A   03DA                   add     ebx, edx
004ED27C   43                     inc     ebx
004ED27D   E9A4010000             jmp     004ED426
004ED282   8BD0                   mov     edx, eax
004ED284   C1E203                 shl     edx, $03
004ED287   8BDA                   mov     ebx, edx
004ED289   85D2                   test    edx, edx
004ED28B   7906                   jns     004ED293
004ED28D   81C2FF000000           add     edx, $000000FF
004ED293   C1FA08                 sar     edx, $08
004ED296   03DA                   add     ebx, edx
004ED298   E989010000             jmp     004ED426
004ED29D   8BD5                   mov     edx, ebp
004ED29F   85D2                   test    edx, edx
004ED2A1   7903                   jns     004ED2A6
004ED2A3   83C20F                 add     edx, +$0F
004ED2A6   C1FA04                 sar     edx, $04
004ED2A9   81E201000080           and     edx, $80000001
004ED2AF   7905                   jns     004ED2B6
004ED2B1   4A                     dec     edx
004ED2B2   83CAFE                 or      edx, -$02
004ED2B5   42                     inc     edx
004ED2B6   85D2                   test    edx, edx
004ED2B8   7522                   jnz     004ED2DC
004ED2BA   8BD5                   mov     edx, ebp
004ED2BC   81E20F000080           and     edx, $8000000F
004ED2C2   7905                   jns     004ED2C9
004ED2C4   4A                     dec     edx
004ED2C5   83CAF0                 or      edx, -$10
004ED2C8   42                     inc     edx
004ED2C9   85D2                   test    edx, edx
004ED2CB   7455                   jz      004ED322
004ED2CD   83EA02                 sub     edx, +$02
004ED2D0   7450                   jz      004ED322
004ED2D2   83EA0A                 sub     edx, +$0A
004ED2D5   744B                   jz      004ED322
004ED2D7   83EA02                 sub     edx, +$02
004ED2DA   7446                   jz      004ED322
004ED2DC   8BD5                   mov     edx, ebp
004ED2DE   85D2                   test    edx, edx
004ED2E0   7903                   jns     004ED2E5
004ED2E2   83C20F                 add     edx, +$0F
004ED2E5   C1FA04                 sar     edx, $04
004ED2E8   81E201000080           and     edx, $80000001
004ED2EE   7905                   jns     004ED2F5
004ED2F0   4A                     dec     edx
004ED2F1   83CAFE                 or      edx, -$02
004ED2F4   42                     inc     edx
004ED2F5   85D2                   test    edx, edx
004ED2F7   0F8E29010000           jle     004ED426
004ED2FD   81E50F000080           and     ebp, $8000000F
004ED303   7905                   jns     004ED30A
004ED305   4D                     dec     ebp
004ED306   83CDF0                 or      ebp, -$10
004ED309   45                     inc     ebp
004ED30A   83ED04                 sub     ebp, +$04
004ED30D   7413                   jz      004ED322
004ED30F   83ED02                 sub     ebp, +$02
004ED312   740E                   jz      004ED322
004ED314   83ED02                 sub     ebp, +$02
004ED317   7409                   jz      004ED322
004ED319   83ED02                 sub     ebp, +$02
004ED31C   0F8504010000           jnz     004ED426
004ED322   8BD0                   mov     edx, eax
004ED324   81E201000080           and     edx, $80000001
004ED32A   7905                   jns     004ED331
004ED32C   4A                     dec     edx
004ED32D   83CAFE                 or      edx, -$02
004ED330   42                     inc     edx
004ED331   85D2                   test    edx, edx
004ED333   751C                   jnz     004ED351
004ED335   8BD0                   mov     edx, eax
004ED337   85D2                   test    edx, edx
004ED339   7903                   jns     004ED33E
004ED33B   83C20F                 add     edx, +$0F
004ED33E   C1FA04                 sar     edx, $04
004ED341   83C2FA                 add     edx, -$06
004ED344   83EA02                 sub     edx, +$02
004ED347   7237                   jb      004ED380
004ED349   83C2FA                 add     edx, -$06
004ED34C   83EA02                 sub     edx, +$02
004ED34F   722F                   jb      004ED380
004ED351   8BD0                   mov     edx, eax
004ED353   81E201000080           and     edx, $80000001
004ED359   7905                   jns     004ED360
004ED35B   4A                     dec     edx
004ED35C   83CAFE                 or      edx, -$02
004ED35F   42                     inc     edx
004ED360   85D2                   test    edx, edx
004ED362   7E38                   jle     004ED39C
004ED364   8BD0                   mov     edx, eax
004ED366   85D2                   test    edx, edx
004ED368   7903                   jns     004ED36D
004ED36A   83C20F                 add     edx, +$0F
004ED36D   C1FA04                 sar     edx, $04
004ED370   83C2FE                 add     edx, -$02
004ED373   83EA02                 sub     edx, +$02
004ED376   7208                   jb      004ED380
004ED378   83C2FA                 add     edx, -$06
004ED37B   83EA02                 sub     edx, +$02
004ED37E   731C                   jnb     004ED39C
004ED380   8BD0                   mov     edx, eax
004ED382   C1E203                 shl     edx, $03
004ED385   8BDA                   mov     ebx, edx
004ED387   85D2                   test    edx, edx
004ED389   7906                   jns     004ED391
004ED38B   81C2FF000000           add     edx, $000000FF
004ED391   C1FA08                 sar     edx, $08
004ED394   03DA                   add     ebx, edx
004ED396   4B                     dec     ebx
004ED397   E98A000000             jmp     004ED426
004ED39C   8BD0                   mov     edx, eax
004ED39E   81E201000080           and     edx, $80000001
004ED3A4   7905                   jns     004ED3AB
004ED3A6   4A                     dec     edx
004ED3A7   83CAFE                 or      edx, -$02
004ED3AA   42                     inc     edx
004ED3AB   85D2                   test    edx, edx
004ED3AD   7E19                   jle     004ED3C8
004ED3AF   8BD0                   mov     edx, eax
004ED3B1   85D2                   test    edx, edx
004ED3B3   7903                   jns     004ED3B8
004ED3B5   83C20F                 add     edx, +$0F
004ED3B8   C1FA04                 sar     edx, $04
004ED3BB   83EA02                 sub     edx, +$02
004ED3BE   7237                   jb      004ED3F7
004ED3C0   83C2FA                 add     edx, -$06
004ED3C3   83EA02                 sub     edx, +$02
004ED3C6   722F                   jb      004ED3F7
004ED3C8   8BD0                   mov     edx, eax
004ED3CA   81E201000080           and     edx, $80000001
004ED3D0   7905                   jns     004ED3D7
004ED3D2   4A                     dec     edx
004ED3D3   83CAFE                 or      edx, -$02
004ED3D6   42                     inc     edx
004ED3D7   85D2                   test    edx, edx
004ED3D9   7535                   jnz     004ED410
004ED3DB   8BD0                   mov     edx, eax
004ED3DD   85D2                   test    edx, edx
004ED3DF   7903                   jns     004ED3E4
004ED3E1   83C20F                 add     edx, +$0F
004ED3E4   C1FA04                 sar     edx, $04
004ED3E7   83C2FC                 add     edx, -$04
004ED3EA   83EA02                 sub     edx, +$02
004ED3ED   7208                   jb      004ED3F7
004ED3EF   83C2FA                 add     edx, -$06
004ED3F2   83EA02                 sub     edx, +$02
004ED3F5   7319                   jnb     004ED410
004ED3F7   8BD0                   mov     edx, eax
004ED3F9   C1E203                 shl     edx, $03
004ED3FC   8BDA                   mov     ebx, edx
004ED3FE   85D2                   test    edx, edx
004ED400   7906                   jns     004ED408
004ED402   81C2FF000000           add     edx, $000000FF
004ED408   C1FA08                 sar     edx, $08
004ED40B   03DA                   add     ebx, edx
004ED40D   43                     inc     ebx
004ED40E   EB16                   jmp     004ED426
004ED410   8BD0                   mov     edx, eax
004ED412   C1E203                 shl     edx, $03
004ED415   8BDA                   mov     ebx, edx
004ED417   85D2                   test    edx, edx
004ED419   7906                   jns     004ED421
004ED41B   81C2FF000000           add     edx, $000000FF
004ED421   C1FA08                 sar     edx, $08
004ED424   03DA                   add     ebx, edx

* Reference to: kernel32.GetTickCount()
|
004ED426   E8259CF1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004ED42B   A3986D4F00             mov     dword ptr [$004F6D98], eax
004ED430   EB0C                   jmp     004ED43E

* Reference to TApplication instance
|
004ED432   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004ED437   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ED439   E8A633F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004ED43E   E80D9CF1FF             call    00407050
004ED443   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004ED449   83F864                 cmp     eax, +$64
004ED44C   72E4                   jb      004ED432
004ED44E   6A12                   push    $12
004ED450   C644241084             mov     byte ptr [esp+$10], $84
004ED455   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED45A   88442411               mov     [esp+$11], al
004ED45E   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED463   88442412               mov     [esp+$12], al
004ED467   C644241327             mov     byte ptr [esp+$13], $27
004ED46C   C644241402             mov     byte ptr [esp+$14], $02
004ED471   8BC7                   mov     eax, edi
004ED473   88442415               mov     [esp+$15], al
004ED477   885C2416               mov     [esp+$16], bl
004ED47B   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED480   88442417               mov     [esp+$17], al
004ED484   8D542410               lea     edx, [esp+$10]
004ED488   B907000000             mov     ecx, $00000007
004ED48D   8BC6                   mov     eax, esi

* Reference to : TForm1.WriteReadComm()
|
004ED48F   E8D459FFFF             call    004E2E68
004ED494   B301                   mov     bl, $01
004ED496   C60524724F0001         mov     byte ptr [$004F7224], $01
004ED49D   8BC3                   mov     eax, ebx
004ED49F   83C414                 add     esp, +$14
004ED4A2   5D                     pop     ebp
004ED4A3   5F                     pop     edi
004ED4A4   5E                     pop     esi
004ED4A5   5B                     pop     ebx
004ED4A6   C3                     ret

*)
end;

procedure TForm1.Button_SbrosClick(Sender : TObject);
begin
(*
004ED4A8   53                     push    ebx
004ED4A9   83C4F0                 add     esp, -$10
004ED4AC   8BD8                   mov     ebx, eax
004ED4AE   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004ED4B3   2C11                   sub     al, $11
004ED4B5   7408                   jz      004ED4BF
004ED4B7   2C02                   sub     al, $02
004ED4B9   0F859A000000           jnz     004ED559
004ED4BF   6834000400             push    $00040034

* Possible String Reference to: 'Внимание'
|
004ED4C4   6810D64E00             push    $004ED610

* Possible String Reference to: 'Будет выполнен сброс всех видов обу
|                                чения (адаптаций)Продолжить?'
|
004ED4C9   681CD64E00             push    $004ED61C
004ED4CE   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED4D0   E893A3F1FF             call    00407868
004ED4D5   83F806                 cmp     eax, +$06
004ED4D8   0F852C010000           jnz     004ED60A
004ED4DE   803D24724F0001         cmp     byte ptr [$004F7224], $01
004ED4E5   7414                   jz      004ED4FB
004ED4E7   803D24724F0000         cmp     byte ptr [$004F7224], $00
004ED4EE   754E                   jnz     004ED53E
004ED4F0   8BC3                   mov     eax, ebx

* Reference to : TForm1.SecurityAccess()
|
004ED4F2   E81DFAFFFF             call    004ECF14
004ED4F7   84C0                   test    al, al
004ED4F9   7443                   jz      004ED53E
004ED4FB   6A0E                   push    $0E
004ED4FD   C644240483             mov     byte ptr [esp+$04], $83
004ED502   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED507   88442405               mov     [esp+$05], al
004ED50B   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED510   88442406               mov     [esp+$06], al
004ED514   C644240730             mov     byte ptr [esp+$07], $30
004ED519   C644240850             mov     byte ptr [esp+$08], $50
004ED51E   C644240904             mov     byte ptr [esp+$09], $04
004ED523   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED528   8844240A               mov     [esp+$0A], al
004ED52C   8D542404               lea     edx, [esp+$04]
004ED530   B906000000             mov     ecx, $00000006
004ED535   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED537   E82C59FFFF             call    004E2E68
004ED53C   EB76                   jmp     004ED5B4
004ED53E   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004ED543   6860D64E00             push    $004ED660

* Possible String Reference to: 'Не найден код доступа.Попробуйте в 
|                                другой раз.'
|
004ED548   6868D64E00             push    $004ED668
004ED54D   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED54F   E814A3F1FF             call    00407868
004ED554   E9B1000000             jmp     004ED60A
004ED559   6834000400             push    $00040034

* Possible String Reference to: 'Внимание'
|
004ED55E   6810D64E00             push    $004ED610

* Possible String Reference to: 'Будет выполнен сброс всех видов обу
|                                чения (адаптаций)с перезапуском ЭБУ
|                                .    Продолжить?'
|
004ED563   6898D64E00             push    $004ED698
004ED568   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED56A   E8F9A2F1FF             call    00407868
004ED56F   83F806                 cmp     eax, +$06
004ED572   0F8592000000           jnz     004ED60A
004ED578   6A0C                   push    $0C
004ED57A   C644240C82             mov     byte ptr [esp+$0C], $82
004ED57F   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED584   8844240D               mov     [esp+$0D], al
004ED588   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED58D   8844240E               mov     [esp+$0E], al
004ED591   C644240F11             mov     byte ptr [esp+$0F], $11
004ED596   C644241001             mov     byte ptr [esp+$10], $01
004ED59B   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED5A0   88442411               mov     [esp+$11], al
004ED5A4   8D54240C               lea     edx, [esp+$0C]
004ED5A8   B905000000             mov     ecx, $00000005
004ED5AD   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED5AF   E8B458FFFF             call    004E2E68
004ED5B4   A0A76D4F00             mov     al, byte ptr [$004F6DA7]
004ED5B9   2C11                   sub     al, $11
004ED5BB   7404                   jz      004ED5C1
004ED5BD   2C02                   sub     al, $02
004ED5BF   7509                   jnz     004ED5CA
004ED5C1   803D026E4F0070         cmp     byte ptr [$004F6E02], $70
004ED5C8   7512                   jnz     004ED5DC
004ED5CA   803DA76D4F0012         cmp     byte ptr [$004F6DA7], $12
004ED5D1   7521                   jnz     004ED5F4
004ED5D3   803D016E4F0051         cmp     byte ptr [$004F6E01], $51
004ED5DA   7418                   jz      004ED5F4
004ED5DC   6810000400             push    $00040010

* Possible String Reference to: 'Ошибка'
|
004ED5E1   6860D64E00             push    $004ED660

* Possible String Reference to: 'Сброс не выполнен...Попробуйте в др
|                                угой раз.'
|
004ED5E6   68F0D64E00             push    $004ED6F0
004ED5EB   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED5ED   E876A2F1FF             call    00407868
004ED5F2   EB16                   jmp     004ED60A
004ED5F4   6840000400             push    $00040040

* Possible String Reference to: 'Выполнено'
|
004ED5F9   6820D74E00             push    $004ED720

* Possible String Reference to: 'Сброс выполнен успешно'
|
004ED5FE   682CD74E00             push    $004ED72C
004ED603   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED605   E85EA2F1FF             call    00407868
004ED60A   83C410                 add     esp, +$10
004ED60D   5B                     pop     ebx
004ED60E   C3                     ret

*)
end;

procedure TForm1.Button_ObuchenieClick(Sender : TObject);
begin
(*
004ED744   53                     push    ebx
004ED745   56                     push    esi
004ED746   83C4F8                 add     esp, -$08
004ED749   8BD8                   mov     ebx, eax
004ED74B   BEC86D4F00             mov     esi, $004F6DC8
004ED750   6834000400             push    $00040034

* Possible String Reference to: 'Внимание'
|
004ED755   68ECD94E00             push    $004ED9EC

* Possible String Reference to: 'Перед проведением процедуры обучени
|                                я:- Поставьте автомобиль на ручной 
|                                тормоз- Выключите кондиционер- Уста
|                                новите рычаг переключения передач  
|                                в положение парковка/нейтраль- Запу
|                                стите двигательПродолжить?'
|
004ED75A   68F8D94E00             push    $004ED9F8
004ED75F   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED761   E802A1F1FF             call    00407868
004ED766   83F806                 cmp     eax, +$06
004ED769   0F8576020000           jnz     004ED9E5
004ED76F   6A10                   push    $10
004ED771   C644240484             mov     byte ptr [esp+$04], $84
004ED776   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004ED77B   88442405               mov     [esp+$05], al
004ED77F   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004ED784   88442406               mov     [esp+$06], al
004ED788   C644240730             mov     byte ptr [esp+$07], $30
004ED78D   C64424082C             mov     byte ptr [esp+$08], $2C
004ED792   C644240907             mov     byte ptr [esp+$09], $07
004ED797   C644240AFF             mov     byte ptr [esp+$0A], $FF
004ED79C   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004ED7A1   8844240B               mov     [esp+$0B], al
004ED7A5   8D542404               lea     edx, [esp+$04]
004ED7A9   B907000000             mov     ecx, $00000007
004ED7AE   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004ED7B0   E8B356FFFF             call    004E2E68
004ED7B5   803D036E4F0070         cmp     byte ptr [$004F6E03], $70
004ED7BC   740C                   jz      004ED7CA
004ED7BE   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED7C0   E8BFBFFFFF             call    004E9784
004ED7C5   E91B020000             jmp     004ED9E5
004ED7CA   6A01                   push    $01
004ED7CC   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004ED7D1   50                     push    eax
004ED7D2   8B06                   mov     eax, [esi]
004ED7D4   50                     push    eax
004ED7D5   B929000000             mov     ecx, $00000029
004ED7DA   BAF0000000             mov     edx, $000000F0
004ED7DF   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004ED7E1   E89E90FFFF             call    004E6884
004ED7E6   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004ED7ED   740C                   jz      004ED7FB
004ED7EF   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED7F1   E88EBFFFFF             call    004E9784
004ED7F6   E9EA010000             jmp     004ED9E5
004ED7FB   6B064C                 imul    eax, [esi], $4C
004ED7FE   8B15F86E4F00           mov     edx, [$004F6EF8]
004ED804   DD44C248               fld     qword ptr [edx+eax*8+$48]
004ED808   D81DCCDA4E00           fcomp   dword ptr [$004EDACC]
004ED80E   DFE0                   fstsw   ax
004ED810   9E                     sahf
004ED811   731B                   jnb     004ED82E
004ED813   6840000400             push    $00040040

* Possible String Reference to: 'Ошибка'
|
004ED818   68D0DA4E00             push    $004EDAD0

* Possible String Reference to: 'Двигатель должен быть запущен'
|
004ED81D   68D8DA4E00             push    $004EDAD8
004ED822   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED824   E83FA0F1FF             call    00407868
004ED829   E9B7010000             jmp     004ED9E5
004ED82E   33C0                   xor     eax, eax

* Reference to GlobalVar_004F7230
|
004ED830   A330724F00             mov     dword ptr [$004F7230], eax

* Reference to TFormProgress instance
|
004ED835   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED83A   8B00                   mov     eax, [eax]

* Possible String Reference to: 'Обучение выполняется...'
|
004ED83C   BA00DB4E00             mov     edx, $004EDB00

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED841   E84E2AF7FF             call    00460294

* Reference to TFormProgress instance
|
004ED846   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED84B   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004ED84D   8B80FC020000           mov     eax, [eax+$02FC]
004ED853   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED855   E82A29F7FF             call    00460184

* Reference to TFormProgress instance
|
004ED85A   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED85F   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED861   8B8000030000           mov     eax, [eax+$0300]
004ED867   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED869   E81629F7FF             call    00460184

* Reference to TFormProgress instance
|
004ED86E   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED873   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED875   8B8000030000           mov     eax, [eax+$0300]

* Possible String Reference to: '       Нажмите до упора и удерживай
|                                те                       педаль газ
|                                а...'
|
004ED87B   BA20DB4E00             mov     edx, $004EDB20

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED880   E80F2AF7FF             call    00460294

* Reference to TFormProgress instance
|
004ED885   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED88A   8B00                   mov     eax, [eax]
004ED88C   B201                   mov     dl, $01

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED88E   E851C6F8FF             call    00479EE4

* Reference to TApplication instance
|
004ED893   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004ED898   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004ED89A   E8452FF9FF             call    004807E4
004ED89F   6A64                   push    $64

* Reference to: kernel32.Sleep()
|
004ED8A1   E8D60AF2FF             call    0040E37C
004ED8A6   803D1E724F0001         cmp     byte ptr [$004F721E], $01
004ED8AD   7513                   jnz     004ED8C2

* Reference to TFormProgress instance
|
004ED8AF   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED8B4   8B00                   mov     eax, [eax]
004ED8B6   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED8B8   E827C6F8FF             call    00479EE4
004ED8BD   E9DB000000             jmp     004ED99D
004ED8C2   6A01                   push    $01
004ED8C4   A1D06D4F00             mov     eax, dword ptr [$004F6DD0]
004ED8C9   50                     push    eax
004ED8CA   8B06                   mov     eax, [esi]
004ED8CC   50                     push    eax
004ED8CD   B929000000             mov     ecx, $00000029
004ED8D2   BAF0000000             mov     edx, $000000F0
004ED8D7   8BC3                   mov     eax, ebx

* Reference to : TForm1.VspomRaschetParam()
|
004ED8D9   E8A68FFFFF             call    004E6884
004ED8DE   803D016E4F0061         cmp     byte ptr [$004F6E01], $61
004ED8E5   740C                   jz      004ED8F3
004ED8E7   8BC3                   mov     eax, ebx

* Reference to : TForm1.Disconnect()
|
004ED8E9   E896BEFFFF             call    004E9784
004ED8EE   E9F2000000             jmp     004ED9E5
004ED8F3   FF06                   inc     dword ptr [esi]
004ED8F5   6B164C                 imul    edx, [esi], $4C
004ED8F8   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED8FD   DD84D0E8FDFFFF         fld     qword ptr [eax+edx*8+$FFFFFDE8]
004ED904   D81D70DB4E00           fcomp   dword ptr [$004EDB70]
004ED90A   DFE0                   fstsw   ax
004ED90C   9E                     sahf
004ED90D   763E                   jbe     004ED94D
004ED90F   6B064C                 imul    eax, [esi], $4C
004ED912   8B0DF86E4F00           mov     ecx, [$004F6EF8]
004ED918   DD84C1E8FDFFFF         fld     qword ptr [ecx+eax*8+$FFFFFDE8]
004ED91F   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED924   DC9CD088FBFFFF         fcomp   qword ptr [eax+edx*8+$FFFFFB88]
004ED92B   DFE0                   fstsw   ax
004ED92D   9E                     sahf
004ED92E   761D                   jbe     004ED94D
004ED930   A1F86E4F00             mov     eax, dword ptr [$004F6EF8]
004ED935   DD84D0A8FDFFFF         fld     qword ptr [eax+edx*8+$FFFFFDA8]
004ED93C   D81D74DB4E00           fcomp   dword ptr [$004EDB74]
004ED942   DFE0                   fstsw   ax
004ED944   9E                     sahf
004ED945   7606                   jbe     004ED94D
004ED947   FF0530724F00           inc     dword ptr [$004F7230]
004ED94D   833D30724F0001         cmp     dword ptr [$004F7230], +$01
004ED954   0F8E39FFFFFF           jle     004ED893
004ED95A   6B064C                 imul    eax, [esi], $4C
004ED95D   8B15F86E4F00           mov     edx, [$004F6EF8]
004ED963   DD84C2E8FDFFFF         fld     qword ptr [edx+eax*8+$FFFFFDE8]
004ED96A   D81D78DB4E00           fcomp   dword ptr [$004EDB78]
004ED970   DFE0                   fstsw   ax
004ED972   9E                     sahf
004ED973   0F831AFFFFFF           jnb     004ED893

* Reference to TFormProgress instance
|
004ED979   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED97E   8B00                   mov     eax, [eax]
004ED980   33D2                   xor     edx, edx

* Reference to: Forms.TCustomForm.SetVisible(TCustomForm;Boolean);
|
004ED982   E85DC5F8FF             call    00479EE4
004ED987   6840000400             push    $00040040

* Possible String Reference to: 'Готово'
|
004ED98C   687CDB4E00             push    $004EDB7C

* Possible String Reference to: 'Обучение закончено.Отпустите педаль
|                                 газа, выключите зажигание на 10 се
|                                кунди включите вновь.Выполните сбро
|                                с ошибок.'
|
004ED991   6884DB4E00             push    $004EDB84
004ED996   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004ED998   E8CB9EF1FF             call    00407868
004ED99D   33C0                   xor     eax, eax
004ED99F   8906                   mov     [esi], eax

* Reference to control TForm1.MenuItem_Stop : TMenuItem
|
004ED9A1   8B831C030000           mov     eax, [ebx+$031C]
004ED9A7   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004ED9A9   FF5244                 call    dword ptr [edx+$44]

* Reference to TFormProgress instance
|
004ED9AC   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED9B1   8B00                   mov     eax, [eax]

* Possible String Reference to: 'Экспорт в Excel'
|
004ED9B3   BA04DC4E00             mov     edx, $004EDC04

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004ED9B8   E8D728F7FF             call    00460294

* Reference to TFormProgress instance
|
004ED9BD   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED9C2   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.ProgressBar1 : TProgressBar
|
004ED9C4   8B80FC020000           mov     eax, [eax+$02FC]
004ED9CA   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED9CC   E8B327F7FF             call    00460184

* Reference to TFormProgress instance
|
004ED9D1   A1445A4F00             mov     eax, dword ptr [$004F5A44]
004ED9D6   8B00                   mov     eax, [eax]

* Reference to control TFormProgress.Label1 : TLabel
|
004ED9D8   8B8000030000           mov     eax, [eax+$0300]
004ED9DE   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004ED9E0   E89F27F7FF             call    00460184
004ED9E5   59                     pop     ecx
004ED9E6   5A                     pop     edx
004ED9E7   5E                     pop     esi
004ED9E8   5B                     pop     ebx
004ED9E9   C3                     ret

*)
end;

procedure TForm1.ZapProtokol(Sender : TObject);
begin
(*
004E2B00   55                     push    ebp
004E2B01   8BEC                   mov     ebp, esp
004E2B03   51                     push    ecx
004E2B04   B904000000             mov     ecx, $00000004
004E2B09   6A00                   push    $00
004E2B0B   6A00                   push    $00
004E2B0D   49                     dec     ecx
004E2B0E   75F9                   jnz     004E2B09
004E2B10   874DFC                 xchg    [ebp-$04], ecx
004E2B13   53                     push    ebx
004E2B14   56                     push    esi
004E2B15   57                     push    edi
004E2B16   8BD9                   mov     ebx, ecx
004E2B18   85DB                   test    ebx, ebx
004E2B1A   780A                   js      004E2B26
004E2B1C   C1EB02                 shr     ebx, $02
004E2B1F   8B349A                 mov     esi, [edx+ebx*4]
004E2B22   4B                     dec     ebx
004E2B23   56                     push    esi
004E2B24   79F9                   jns     004E2B1F
004E2B26   8BD4                   mov     edx, esp
004E2B28   8BDA                   mov     ebx, edx
004E2B2A   8B450C                 mov     eax, [ebp+$0C]

* Reference to: System.@LStrAddRef(void;void):Pointer;
|
004E2B2D   E8AA23F2FF             call    00404EDC
004E2B32   8B4508                 mov     eax, [ebp+$08]

* Reference to: System.@LStrAddRef(void;void):Pointer;
|
004E2B35   E8A223F2FF             call    00404EDC
004E2B3A   33C0                   xor     eax, eax
004E2B3C   55                     push    ebp
004E2B3D   68552D4E00             push    $004E2D55

***** TRY
|
004E2B42   64FF30                 push    dword ptr fs:[eax]
004E2B45   648920                 mov     fs:[eax], esp
004E2B48   803D1C724F0001         cmp     byte ptr [$004F721C], $01
004E2B4F   0F85D8010000           jnz     004E2D2D

* Reference to: SysUtils.Time:TDateTime;
|
004E2B55   E8CA83F2FF             call    0040AF24
004E2B5A   83C4F8                 add     esp, -$08
004E2B5D   DD1C24                 fstp    qword ptr [esp]
004E2B60   9B                     wait
004E2B61   8D45FC                 lea     eax, [ebp-$04]

* Possible String Reference to: 'hh:mm:ss.zzz'
|
004E2B64   BA742D4E00             mov     edx, $004E2D74

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004E2B69   E8C68FF2FF             call    0040BB34

* Reference to: SysUtils.Time:TDateTime;
|
004E2B6E   E8B183F2FF             call    0040AF24
004E2B73   DC2528724F00           fsub    qword ptr [$004F7228]
004E2B79   83C4F8                 add     esp, -$08
004E2B7C   DD1C24                 fstp    qword ptr [esp]
004E2B7F   9B                     wait
004E2B80   8D45F8                 lea     eax, [ebp-$08]

* Possible String Reference to: 's.zzz'
|
004E2B83   BA8C2D4E00             mov     edx, $004E2D8C

* Reference to: SysUtils.DateTimeToString(AnsiString;AnsiString;AnsiString;TDateTime);overload;
|
004E2B88   E8A78FF2FF             call    0040BB34

* Possible String Reference to: '<P><FONT face="MS Shell Dlg" color=
|                                "#000000"><B>'
|
004E2B8D   689C2D4E00             push    $004E2D9C
004E2B92   FF750C                 push    dword ptr [ebp+$0C]

* Possible String Reference to: ': '
|
004E2B95   68D82D4E00             push    $004E2DD8
004E2B9A   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: '  (+'
|
004E2B9D   68E42D4E00             push    $004E2DE4
004E2BA2   FF75F8                 push    dword ptr [ebp-$08]

* Possible String Reference to: ' сек.)</B></FONT>'
|
004E2BA5   68F42D4E00             push    $004E2DF4
004E2BAA   8D45F4                 lea     eax, [ebp-$0C]
004E2BAD   BA07000000             mov     edx, $00000007

* Reference to: System.@LStrCatN;
|
004E2BB2   E8F521F2FF             call    00404DAC
004E2BB7   8B55F4                 mov     edx, [ebp-$0C]
004E2BBA   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2BBF   E84425F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2BC4   E8B70AF2FF             call    00403680

|
004E2BC9   E8E6FCF1FF             call    004028B4

* Reference to: SysUtils.Time:TDateTime;
|
004E2BCE   E85183F2FF             call    0040AF24
004E2BD3   DD1D28724F00           fstp    qword ptr [$004F7228]
004E2BD9   9B                     wait

* Possible String Reference to: '<FONT face="Courier New" color="#'
|
004E2BDA   68102E4E00             push    $004E2E10
004E2BDF   FF7508                 push    dword ptr [ebp+$08]

* Possible String Reference to: '">'
|
004E2BE2   683C2E4E00             push    $004E2E3C
004E2BE7   8D45F0                 lea     eax, [ebp-$10]
004E2BEA   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004E2BEF   E8B821F2FF             call    00404DAC
004E2BF4   8B55F0                 mov     edx, [ebp-$10]
004E2BF7   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2BFC   E80725F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2C01   E87A0AF2FF             call    00403680

|
004E2C06   E8A9FCF1FF             call    004028B4
004E2C0B   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2C0E   E8191EF2FF             call    00404A2C
004E2C13   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E2C16   E8111EF2FF             call    00404A2C
004E2C1B   8B7510                 mov     esi, [ebp+$10]
004E2C1E   4E                     dec     esi
004E2C1F   85F6                   test    esi, esi
004E2C21   0F8CB6000000           jl      004E2CDD
004E2C27   46                     inc     esi
004E2C28   33FF                   xor     edi, edi
004E2C2A   FF75FC                 push    dword ptr [ebp-$04]
004E2C2D   8D4DEC                 lea     ecx, [ebp-$14]
004E2C30   33C0                   xor     eax, eax
004E2C32   8A03                   mov     al, byte ptr [ebx]
004E2C34   BA02000000             mov     edx, $00000002

* Reference to: SysUtils.IntToHex(Integer;Integer):AnsiString;overload;
|
004E2C39   E89665F2FF             call    004091D4
004E2C3E   FF75EC                 push    dword ptr [ebp-$14]
004E2C41   68482E4E00             push    $004E2E48
004E2C46   8D45FC                 lea     eax, [ebp-$04]
004E2C49   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCatN;
|
004E2C4E   E85921F2FF             call    00404DAC
004E2C53   8A03                   mov     al, byte ptr [ebx]
004E2C55   2C0E                   sub     al, $0E
004E2C57   730F                   jnb     004E2C68
004E2C59   8D45F8                 lea     eax, [ebp-$08]
004E2C5C   BA542E4E00             mov     edx, $004E2E54

* Reference to: System.@LStrCat;
|
004E2C61   E88E20F2FF             call    00404CF4
004E2C66   EB15                   jmp     004E2C7D
004E2C68   8D45E8                 lea     eax, [ebp-$18]
004E2C6B   8A13                   mov     dl, byte ptr [ebx]

* Reference to: System.@LStrFromChar(String;String;Char);
|
004E2C6D   E8A21FF2FF             call    00404C14
004E2C72   8B55E8                 mov     edx, [ebp-$18]
004E2C75   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrCat;
|
004E2C78   E87720F2FF             call    00404CF4
004E2C7D   8BC7                   mov     eax, edi
004E2C7F   250F000080             and     eax, $8000000F
004E2C84   7905                   jns     004E2C8B
004E2C86   48                     dec     eax
004E2C87   83C8F0                 or      eax, -$10
004E2C8A   40                     inc     eax
004E2C8B   83F80F                 cmp     eax, +$0F
004E2C8E   7544                   jnz     004E2CD4
004E2C90   68482E4E00             push    $004E2E48
004E2C95   FF75FC                 push    dword ptr [ebp-$04]

* Possible String Reference to: '     '
|
004E2C98   68602E4E00             push    $004E2E60
004E2C9D   FF75F8                 push    dword ptr [ebp-$08]
004E2CA0   8D45E4                 lea     eax, [ebp-$1C]
004E2CA3   BA04000000             mov     edx, $00000004

* Reference to: System.@LStrCatN;
|
004E2CA8   E8FF20F2FF             call    00404DAC
004E2CAD   8B55E4                 mov     edx, [ebp-$1C]
004E2CB0   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2CB5   E84E24F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2CBA   E8C109F2FF             call    00403680

|
004E2CBF   E8F0FBF1FF             call    004028B4
004E2CC4   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2CC7   E8601DF2FF             call    00404A2C
004E2CCC   8D45F8                 lea     eax, [ebp-$08]

* Reference to: System.@LStrClr(void;void);
|
004E2CCF   E8581DF2FF             call    00404A2C
004E2CD4   47                     inc     edi
004E2CD5   43                     inc     ebx
004E2CD6   4E                     dec     esi
004E2CD7   0F854DFFFFFF           jnz     004E2C2A
004E2CDD   68482E4E00             push    $004E2E48
004E2CE2   FF75FC                 push    dword ptr [ebp-$04]
004E2CE5   8B45FC                 mov     eax, [ebp-$04]

* Reference to: System.@LStrLen(String):Integer;
|
004E2CE8   E8FF1FF2FF             call    00404CEC
004E2CED   BA30000000             mov     edx, $00000030
004E2CF2   2BD0                   sub     edx, eax
004E2CF4   8D4DDC                 lea     ecx, [ebp-$24]
004E2CF7   B020                   mov     al, $20

* Reference to: System.@LStrOfChar;
|
004E2CF9   E8DE23F2FF             call    004050DC
004E2CFE   FF75DC                 push    dword ptr [ebp-$24]

* Possible String Reference to: '     '
|
004E2D01   68602E4E00             push    $004E2E60
004E2D06   FF75F8                 push    dword ptr [ebp-$08]
004E2D09   8D45E0                 lea     eax, [ebp-$20]
004E2D0C   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCatN;
|
004E2D11   E89620F2FF             call    00404DAC
004E2D16   8B55E0                 mov     edx, [ebp-$20]
004E2D19   B84C704F00             mov     eax, $004F704C

* Reference to: Classes.TStream.WriteComponent(TStream;TComponent);
|
004E2D1E   E8E523F2FF             call    00405108

* Reference to: System.@WriteLn(TTextRec;TTextRec):Pointer;
|
004E2D23   E85809F2FF             call    00403680

|
004E2D28   E887FBF1FF             call    004028B4
004E2D2D   33C0                   xor     eax, eax
004E2D2F   5A                     pop     edx
004E2D30   59                     pop     ecx
004E2D31   59                     pop     ecx
004E2D32   648910                 mov     fs:[eax], edx

****** FINALLY
|
004E2D35   685C2D4E00             push    $004E2D5C
004E2D3A   8D45DC                 lea     eax, [ebp-$24]
004E2D3D   BA09000000             mov     edx, $00000009

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E2D42   E8091DF2FF             call    00404A50
004E2D47   8D4508                 lea     eax, [ebp+$08]
004E2D4A   BA02000000             mov     edx, $00000002

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004E2D4F   E8FC1CF2FF             call    00404A50
004E2D54   C3                     ret


* Reference to: System.@HandleFinally;
|
004E2D55   E95216F2FF             jmp     004043AC
004E2D5A   EBDE                   jmp     004E2D3A

****** END
|
004E2D5C   8B7DD0                 mov     edi, [ebp-$30]
004E2D5F   8B75D4                 mov     esi, [ebp-$2C]
004E2D62   8B5DD8                 mov     ebx, [ebp-$28]
004E2D65   8BE5                   mov     esp, ebp
004E2D67   5D                     pop     ebp
004E2D68   C20C00                 ret     $000C

*)
end;

procedure TForm1.PL23xxClick(Sender : TObject);
begin
(*
004EDC14   53                     push    ebx
004EDC15   6834000400             push    $00040034

* Possible String Reference to: 'Внимание!'
|
004EDC1A   6894DD4E00             push    $004EDD94

* Possible String Reference to: 'В драйвер PL23xx будут добавлены не
|                                стандартные скорости обмена.Продолж
|                                ить?'
|
004EDC1F   68A0DD4E00             push    $004EDDA0
004EDC24   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EDC26   E83D9CF1FF             call    00407868
004EDC2B   83F806                 cmp     eax, +$06
004EDC2E   0F855D010000           jnz     004EDD91
004EDC34   B201                   mov     dl, $01

* Reference to class TRegistry
|
004EDC36   A1B8A54300             mov     eax, dword ptr [$0043A5B8]

* Reference to: Registry.TRegistry.Create(TRegistry;boolean);overload;
|
004EDC3B   E824CAF4FF             call    0043A664
004EDC40   8BD8                   mov     ebx, eax
004EDC42   BA02000080             mov     edx, $80000002
004EDC47   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.SetRootKey(TRegistry;HKEY);
|
004EDC49   E8B6CAF4FF             call    0043A704

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl'
|
004EDC4E   BAF8DD4E00             mov     edx, $004EDDF8
004EDC53   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004EDC55   E80ECBF4FF             call    0043A768
004EDC5A   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl'
|
004EDC5C   BAF8DD4E00             mov     edx, $004EDDF8
004EDC61   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004EDC63   E8DCCBF4FF             call    0043A844
004EDC68   84C0                   test    al, al
004EDC6A   0F848F000000           jz      004EDCFF
004EDC70   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'Type'
|
004EDC75   BA2CDE4E00             mov     edx, $004EDE2C
004EDC7A   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDC7C   E83FCDF4FF             call    0043A9C0
004EDC81   B903000000             mov     ecx, $00000003

* Possible String Reference to: 'Start'
|
004EDC86   BA3CDE4E00             mov     edx, $004EDE3C
004EDC8B   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDC8D   E82ECDF4FF             call    0043A9C0
004EDC92   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'ErrorControl'
|
004EDC97   BA4CDE4E00             mov     edx, $004EDE4C
004EDC9C   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDC9E   E81DCDF4FF             call    0043A9C0
004EDCA3   B901000000             mov     ecx, $00000001

* Possible String Reference to: 'Tag'
|
004EDCA8   BA64DE4E00             mov     edx, $004EDE64
004EDCAD   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDCAF   E80CCDF4FF             call    0043A9C0

* Possible String Reference to: 'system32\DRIVERS\ser2pl.sys'
|
004EDCB4   B970DE4E00             mov     ecx, $004EDE70

* Possible String Reference to: 'ImagePath'
|
004EDCB9   BA94DE4E00             mov     edx, $004EDE94
004EDCBE   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteExpandString(TRegistry;AnsiString;AnsiString);
|
004EDCC0   E8CFCCF4FF             call    0043A994

* Possible String Reference to: 'Prolific2 Serial port driver'
|
004EDCC5   B9A8DE4E00             mov     ecx, $004EDEA8

* Possible String Reference to: 'DisplayName'
|
004EDCCA   BAD0DE4E00             mov     edx, $004EDED0
004EDCCF   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004EDCD1   E892CCF4FF             call    0043A968

* Possible String Reference to: 'Base'
|
004EDCD6   B9E4DE4E00             mov     ecx, $004EDEE4

* Possible String Reference to: 'Group'
|
004EDCDB   BAF4DE4E00             mov     edx, $004EDEF4
004EDCE0   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004EDCE2   E881CCF4FF             call    0043A968

* Possible String Reference to: '46,2147487743 200,2147487349 10400,
|                                2147485840 10472,2147485839'
|
004EDCE7   B904DF4E00             mov     ecx, $004EDF04

* Possible String Reference to: 'ExtBaudrate'
|
004EDCEC   BA4CDF4E00             mov     edx, $004EDF4C
004EDCF1   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteString(TRegistry;AnsiString;AnsiString);
|
004EDCF3   E870CCF4FF             call    0043A968
004EDCF8   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CloseKey(TRegistry);
|
004EDCFA   E8D5C9F4FF             call    0043A6D4

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Enum'
|
004EDCFF   BA60DF4E00             mov     edx, $004EDF60
004EDD04   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004EDD06   E85DCAF4FF             call    0043A768
004EDD0B   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Enum'
|
004EDD0D   BA60DF4E00             mov     edx, $004EDF60
004EDD12   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004EDD14   E82BCBF4FF             call    0043A844
004EDD19   84C0                   test    al, al
004EDD1B   7423                   jz      004EDD40
004EDD1D   33C9                   xor     ecx, ecx

* Possible String Reference to: 'Count'
|
004EDD1F   BA98DF4E00             mov     edx, $004EDF98
004EDD24   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDD26   E895CCF4FF             call    0043A9C0
004EDD2B   33C9                   xor     ecx, ecx

* Possible String Reference to: 'NextInstance'
|
004EDD2D   BAA8DF4E00             mov     edx, $004EDFA8
004EDD32   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.WriteInteger(TRegistry;AnsiString;Integer);
|
004EDD34   E887CCF4FF             call    0043A9C0
004EDD39   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CloseKey(TRegistry);
|
004EDD3B   E894C9F4FF             call    0043A6D4

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Security'
|
004EDD40   BAC0DF4E00             mov     edx, $004EDFC0
004EDD45   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.CreateKey(TRegistry;AnsiString):Boolean;
|
004EDD47   E81CCAF4FF             call    0043A768
004EDD4C   33C9                   xor     ecx, ecx

* Possible String Reference to: '\SYSTEM\CurrentControlSet\Services\
|                                Ser2pl\Security'
|
004EDD4E   BAC0DF4E00             mov     edx, $004EDFC0
004EDD53   8BC3                   mov     eax, ebx

* Reference to: Registry.TRegistry.OpenKey(TRegistry;AnsiString;Boolean):Boolean;
|
004EDD55   E8EACAF4FF             call    0043A844
004EDD5A   84C0                   test    al, al
004EDD5C   741D                   jz      004EDD7B
004EDD5E   68A8000000             push    $000000A8
004EDD63   B9241D4F00             mov     ecx, $004F1D24

* Possible String Reference to: 'Security'
|
004EDD68   BAFCDF4E00             mov     edx, $004EDFFC
004EDD6D   8BC3                   mov     eax, ebx

|
004EDD6F   E860CCF4FF             call    0043A9D4
004EDD74   8BC3                   mov     eax, ebx

* Reference to: System.TObject.Free(TObject);
|
004EDD76   E89D5EF1FF             call    00403C18
004EDD7B   6840000400             push    $00040040

* Possible String Reference to: 'Коррекция драйвера PL23xx'
|
004EDD80   6808E04E00             push    $004EE008

* Possible String Reference to: 'Изменения внесены.'
|
004EDD85   6824E04E00             push    $004EE024
004EDD8A   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EDD8C   E8D79AF1FF             call    00407868
004EDD91   5B                     pop     ebx
004EDD92   C3                     ret

*)
end;

procedure TForm1.StringGrid_DTCSelectCell(Sender : TObject);
begin
(*
004EE038   55                     push    ebp
004EE039   8BEC                   mov     ebp, esp
004EE03B   83C4D0                 add     esp, -$30
004EE03E   53                     push    ebx
004EE03F   56                     push    esi
004EE040   57                     push    edi
004EE041   33DB                   xor     ebx, ebx
004EE043   895DEC                 mov     [ebp-$14], ebx
004EE046   895DE8                 mov     [ebp-$18], ebx
004EE049   895DE4                 mov     [ebp-$1C], ebx
004EE04C   895DF8                 mov     [ebp-$08], ebx
004EE04F   895DF4                 mov     [ebp-$0C], ebx
004EE052   895DF0                 mov     [ebp-$10], ebx
004EE055   8BF8                   mov     edi, eax
004EE057   8B750C                 mov     esi, [ebp+$0C]
004EE05A   33C0                   xor     eax, eax
004EE05C   55                     push    ebp
004EE05D   68DFE14E00             push    $004EE1DF

***** TRY
|
004EE062   64FF30                 push    dword ptr fs:[eax]
004EE065   648920                 mov     fs:[eax], esp
004EE068   83FE08                 cmp     esi, +$08
004EE06B   7E1B                   jle     004EE088
004EE06D   6840000400             push    $00040040

* Possible String Reference to: 'Ошибка'
|
004EE072   68F0E14E00             push    $004EE1F0

* Possible String Reference to: 'ЭБУ сохраняет только 8 стоп кадров.'
|
004EE077   68F8E14E00             push    $004EE1F8
004EE07C   6A00                   push    $00

* Reference to: user32.MessageBoxA()
|
004EE07E   E8E597F1FF             call    00407868
004EE083   E93C010000             jmp     004EE1C4
004EE088   8D45F4                 lea     eax, [ebp-$0C]
004EE08B   50                     push    eax
004EE08C   8D45F0                 lea     eax, [ebp-$10]
004EE08F   50                     push    eax
004EE090   8BCE                   mov     ecx, esi
004EE092   33D2                   xor     edx, edx
004EE094   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EE09A   E8AD05FAFF             call    0048E64C
004EE09F   8B45F0                 mov     eax, [ebp-$10]
004EE0A2   B902000000             mov     ecx, $00000002
004EE0A7   BA03000000             mov     edx, $00000003

* Reference to: System.@LStrCopy;
|
004EE0AC   E89B6EF1FF             call    00404F4C
004EE0B1   8B4DF4                 mov     ecx, [ebp-$0C]
004EE0B4   8D45F8                 lea     eax, [ebp-$08]
004EE0B7   BA24E24E00             mov     edx, $004EE224

* Reference to: System.@LStrCat3;
|
004EE0BC   E8776CF1FF             call    00404D38
004EE0C1   8B45F8                 mov     eax, [ebp-$08]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004EE0C4   E833B1F1FF             call    004091FC
004EE0C9   8BD8                   mov     ebx, eax
004EE0CB   8D45E8                 lea     eax, [ebp-$18]
004EE0CE   50                     push    eax
004EE0CF   8D45E4                 lea     eax, [ebp-$1C]
004EE0D2   50                     push    eax
004EE0D3   8BCE                   mov     ecx, esi
004EE0D5   33D2                   xor     edx, edx
004EE0D7   8B87B0030000           mov     eax, [edi+$03B0]

* Reference to: Grids.TStringGrid.GetCells(TStringGrid;Integer;Integer):AnsiString;
|
004EE0DD   E86A05FAFF             call    0048E64C
004EE0E2   8B45E4                 mov     eax, [ebp-$1C]
004EE0E5   B902000000             mov     ecx, $00000002
004EE0EA   BA05000000             mov     edx, $00000005

* Reference to: System.@LStrCopy;
|
004EE0EF   E8586EF1FF             call    00404F4C
004EE0F4   8B4DE8                 mov     ecx, [ebp-$18]
004EE0F7   8D45EC                 lea     eax, [ebp-$14]
004EE0FA   BA24E24E00             mov     edx, $004EE224

* Reference to: System.@LStrCat3;
|
004EE0FF   E8346CF1FF             call    00404D38
004EE104   8B45EC                 mov     eax, [ebp-$14]

* Reference to: SysUtils.StrToInt(AnsiString):Integer;
|
004EE107   E8F0B0F1FF             call    004091FC
004EE10C   8845FF                 mov     [ebp-$01], al
004EE10F   68C8000000             push    $000000C8
004EE114   C645DC82               mov     byte ptr [ebp-$24], $82
004EE118   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EE11D   8845DD                 mov     [ebp-$23], al
004EE120   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EE125   8845DE                 mov     [ebp-$22], al
004EE128   C645DF21               mov     byte ptr [ebp-$21], $21
004EE12C   C645E002               mov     byte ptr [ebp-$20], $02
004EE130   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EE135   8845E1                 mov     [ebp-$1F], al
004EE138   8D55DC                 lea     edx, [ebp-$24]
004EE13B   B905000000             mov     ecx, $00000005
004EE140   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EE142   E8214DFFFF             call    004E2E68
004EE147   68C8000000             push    $000000C8
004EE14C   C645DC82               mov     byte ptr [ebp-$24], $82
004EE150   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EE155   8845DD                 mov     [ebp-$23], al
004EE158   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EE15D   8845DE                 mov     [ebp-$22], al
004EE160   C645DF21               mov     byte ptr [ebp-$21], $21
004EE164   C645E0F0               mov     byte ptr [ebp-$20], $F0
004EE168   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EE16D   8845E1                 mov     [ebp-$1F], al
004EE170   8D55DC                 lea     edx, [ebp-$24]
004EE173   B905000000             mov     ecx, $00000005
004EE178   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EE17A   E8E94CFFFF             call    004E2E68
004EE17F   68C8000000             push    $000000C8
004EE184   C645D085               mov     byte ptr [ebp-$30], $85
004EE188   A0A86D4F00             mov     al, byte ptr [$004F6DA8]
004EE18D   8845D1                 mov     [ebp-$2F], al
004EE190   A0A96D4F00             mov     al, byte ptr [$004F6DA9]
004EE195   8845D2                 mov     [ebp-$2E], al
004EE198   C645D312               mov     byte ptr [ebp-$2D], $12
004EE19C   C645D400               mov     byte ptr [ebp-$2C], $00
004EE1A0   C645D504               mov     byte ptr [ebp-$2B], $04
004EE1A4   885DD6                 mov     [ebp-$2A], bl
004EE1A7   8A45FF                 mov     al, byte ptr [ebp-$01]
004EE1AA   8845D7                 mov     [ebp-$29], al
004EE1AD   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EE1B2   8845D8                 mov     [ebp-$28], al
004EE1B5   8D55D0                 lea     edx, [ebp-$30]
004EE1B8   B908000000             mov     ecx, $00000008
004EE1BD   8BC7                   mov     eax, edi

* Reference to : TForm1.WriteReadComm()
|
004EE1BF   E8A44CFFFF             call    004E2E68
004EE1C4   33C0                   xor     eax, eax
004EE1C6   5A                     pop     edx
004EE1C7   59                     pop     ecx
004EE1C8   59                     pop     ecx
004EE1C9   648910                 mov     fs:[eax], edx

****** FINALLY
|
004EE1CC   68E6E14E00             push    $004EE1E6
004EE1D1   8D45E4                 lea     eax, [ebp-$1C]
004EE1D4   BA06000000             mov     edx, $00000006

* Reference to: System.@LStrArrayClr(void;void;Integer);
|
004EE1D9   E87268F1FF             call    00404A50
004EE1DE   C3                     ret


* Reference to: System.@HandleFinally;
|
004EE1DF   E9C861F1FF             jmp     004043AC
004EE1E4   EBEB                   jmp     004EE1D1

****** END
|
004EE1E6   5F                     pop     edi
004EE1E7   5E                     pop     esi
004EE1E8   5B                     pop     ebx
004EE1E9   8BE5                   mov     esp, ebp
004EE1EB   5D                     pop     ebp
004EE1EC   C20800                 ret     $0008

*)
end;

procedure TForm1.N8Click(Sender : TObject);
begin
(*
004ECE94   53                     push    ebx
004ECE95   8BD8                   mov     ebx, eax
004ECE97   6A05                   push    $05
004ECE99   6A00                   push    $00
004ECE9B   6A00                   push    $00

* Possible String Reference to: 'http://samdiagnost.carflood.ru'
|
004ECE9D   68B4CE4E00             push    $004ECEB4
004ECEA2   6A00                   push    $00
004ECEA4   8BC3                   mov     eax, ebx

* Reference to: QForms.TCustomForm.GetClientHandle(TCustomForm):QWorkspaceH;
|
004ECEA6   E8519DF7FF             call    00466BFC
004ECEAB   50                     push    eax

* Reference to: shell32.ShellExecuteA()
|
004ECEAC   E8AB3CF4FF             call    00430B5C
004ECEB1   5B                     pop     ebx
004ECEB2   C3                     ret

*)
end;

procedure TForm1.N_Airbag_SRS1Click(Sender : TObject);
begin
(*
004E4044   53                     push    ebx
004E4045   56                     push    esi
004E4046   8BD8                   mov     ebx, eax
004E4048   C605A76D4F0032         mov     byte ptr [$004F6DA7], $32
004E404F   C605A86D4F0059         mov     byte ptr [$004F6DA8], $59
004E4056   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E405D   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E4067   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E4069   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E406F   E830ECF8FF             call    00472CA4
004E4074   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E4076   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E407C   E823ECF8FF             call    00472CA4
004E4081   33D2                   xor     edx, edx

* Reference to control TForm1.Test_DK : TMenuItem
|
004E4083   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E4089   E816ECF8FF             call    00472CA4
004E408E   6A02                   push    $02

* Possible String Reference to: 'SRS'
|
004E4090   B9C0404E00             mov     ecx, $004E40C0

* Possible String Reference to: 'Vib_tip_ECU'
|
004E4095   BACC404E00             mov     edx, $004E40CC
004E409A   A120724F00             mov     eax, dword ptr [$004F7220]
004E409F   8B30                   mov     esi, [eax]
004E40A1   FF560C                 call    dword ptr [esi+$0C]
004E40A4   B204                   mov     dl, $04
004E40A6   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E40A8   E8D7F1FFFF             call    004E3284
004E40AD   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E40AF   E824000000             call    004E40D8
004E40B4   5E                     pop     esi
004E40B5   5B                     pop     ebx
004E40B6   C3                     ret

*)
end;

procedure TForm1.Label_AIRBAGClick(Sender : TObject);
begin
(*
004E3868   53                     push    ebx
004E3869   56                     push    esi
004E386A   83C4F0                 add     esp, -$10
004E386D   8BD8                   mov     ebx, eax
004E386F   6A00                   push    $00

* Possible String Reference to: 'SRS'
|
004E3871   B9E8384E00             mov     ecx, $004E38E8

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3876   BAF4384E00             mov     edx, $004E38F4
004E387B   A120724F00             mov     eax, dword ptr [$004F7220]
004E3880   8B30                   mov     esi, [eax]
004E3882   FF5608                 call    dword ptr [esi+$08]
004E3885   48                     dec     eax
004E3886   7405                   jz      004E388D
004E3888   48                     dec     eax
004E3889   740F                   jz      004E389A
004E388B   EB1A                   jmp     004E38A7

* Reference to control TForm1.N_Airbag_SRS0 : TMenuItem
|
004E388D   8B83AC030000           mov     eax, [ebx+$03AC]
004E3893   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E3895   FF5244                 call    dword ptr [edx+$44]
004E3898   EB40                   jmp     004E38DA

* Reference to control TForm1.N_Airbag_SRS1 : TMenuItem
|
004E389A   8B83FC030000           mov     eax, [ebx+$03FC]
004E38A0   8B10                   mov     edx, [eax]

* Reference to method TMenuItem.Click()
|
004E38A2   FF5244                 call    dword ptr [edx+$44]
004E38A5   EB33                   jmp     004E38DA
004E38A7   8BD4                   mov     edx, esp

* Reference to pointer to GlobalVar_004F6B54
|
004E38A9   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E38AE   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E38B0   E8577CF8FF             call    0046B50C
004E38B5   8B442404               mov     eax, [esp+$04]
004E38B9   50                     push    eax
004E38BA   8D54240C               lea     edx, [esp+$0C]

* Reference to pointer to GlobalVar_004F6B54
|
004E38BE   A1705D4F00             mov     eax, dword ptr [$004F5D70]
004E38C3   8B00                   mov     eax, [eax]

* Reference to: Controls.TMouse.GetCursorPos(TMouse):Windows.TPoint;
|
004E38C5   E8427CF8FF             call    0046B50C
004E38CA   8B54240C               mov     edx, [esp+$0C]

* Reference to control TForm1.PopupMenu_SRS : TPopupMenu
|
004E38CE   8B8300040000           mov     eax, [ebx+$0400]
004E38D4   59                     pop     ecx
004E38D5   8B18                   mov     ebx, [eax]

* Reference to method TPopupMenu.Popup(Integer,Integer)
|
004E38D7   FF5340                 call    dword ptr [ebx+$40]
004E38DA   83C410                 add     esp, +$10
004E38DD   5E                     pop     esi
004E38DE   5B                     pop     ebx
004E38DF   C3                     ret

*)
end;

procedure TForm1.FormActivate(Sender : TObject);
begin
(*
004E27A4   55                     push    ebp
004E27A5   8BEC                   mov     ebp, esp
004E27A7   6A00                   push    $00
004E27A9   33C0                   xor     eax, eax
004E27AB   55                     push    ebp
004E27AC   680E284E00             push    $004E280E

***** TRY
|
004E27B1   64FF30                 push    dword ptr fs:[eax]
004E27B4   648920                 mov     fs:[eax], esp
004E27B7   C60527724F0000         mov     byte ptr [$004F7227], $00

* Reference to: System.ParamCount:Integer;
|
004E27BE   E8BD02F2FF             call    00402A80
004E27C3   85C0                   test    eax, eax
004E27C5   7431                   jz      004E27F8
004E27C7   8D55FC                 lea     edx, [ebp-$04]
004E27CA   B801000000             mov     eax, $00000001

* Reference to: System.ParamStr(Integer):String;
|
004E27CF   E80C03F2FF             call    00402AE0
004E27D4   8B55FC                 mov     edx, [ebp-$04]
004E27D7   B8006F4F00             mov     eax, $004F6F00

* Reference to: System.@Assign(TTextRec;TTextRec;String):Integer;
|
004E27DC   E8EB06F2FF             call    00402ECC
004E27E1   C60527724F0001         mov     byte ptr [$004F7227], $01

* Reference to Form1
|
004E27E8   A1646D4F00             mov     eax, dword ptr [$004F6D64]

* Reference to field Form1.OFFS_030C
|
004E27ED   8B800C030000           mov     eax, [eax+$030C]
004E27F3   8B10                   mov     edx, [eax]
004E27F5   FF5244                 call    dword ptr [edx+$44]
004E27F8   33C0                   xor     eax, eax
004E27FA   5A                     pop     edx
004E27FB   59                     pop     ecx
004E27FC   59                     pop     ecx
004E27FD   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: 'Y]ГU‹мj'
|
004E2800   6815284E00             push    $004E2815
004E2805   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
004E2808   E81F22F2FF             call    00404A2C
004E280D   C3                     ret


* Reference to: System.@HandleFinally;
|
004E280E   E9991BF2FF             jmp     004043AC
004E2813   EBF0                   jmp     004E2805

****** END
|
004E2815   59                     pop     ecx
004E2816   5D                     pop     ebp
004E2817   C3                     ret

*)
end;

procedure TForm1.Driver(Sender : TObject);
begin
(*
004EE258   53                     push    ebx
004EE259   83C4F8                 add     esp, -$08
004EE25C   8BD8                   mov     ebx, eax

* Reference to TGrafForm instance
|
004EE25E   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE263   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.test_ON : TButton
|
004EE265   8B80E0030000           mov     eax, [eax+$03E0]
004EE26B   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EE26D   E8121FF7FF             call    00460184

* Reference to TGrafForm instance
|
004EE272   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE277   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.test_OFF : TButton
|
004EE279   8B80DC030000           mov     eax, [eax+$03DC]
004EE27F   B201                   mov     dl, $01

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EE281   E8FE1EF7FF             call    00460184

* Reference to TGrafForm instance
|
004EE286   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE28B   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.IMTrack : TTrackBar
|
004EE28D   8B80E8030000           mov     eax, [eax+$03E8]
004EE293   33D2                   xor     edx, edx

* Reference to: Controls.TControl.SetVisible(TControl;Boolean);
|
004EE295   E8EA1EF7FF             call    00460184
004EE29A   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EE2A1   7527                   jnz     004EE2CA
004EE2A3   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EE2AA   0F85F7000000           jnz     004EE3A7
004EE2B0   803DA46D4F0020         cmp     byte ptr [$004F6DA4], $20
004EE2B7   0F84EA000000           jz      004EE3A7
004EE2BD   803DA46D4F0022         cmp     byte ptr [$004F6DA4], $22
004EE2C4   0F84DD000000           jz      004EE3A7

* Reference to: kernel32.GetTickCount()
|
004EE2CA   E8818DF1FF             call    00407050

* Reference to GlobalVar_004F6D98
|
004EE2CF   A3986D4F00             mov     dword ptr [$004F6D98], eax
004EE2D4   EB0C                   jmp     004EE2E2

* Reference to TApplication instance
|
004EE2D6   A1885B4F00             mov     eax, dword ptr [$004F5B88]
004EE2DB   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.ProcessMessages(TApplication);
|
004EE2DD   E80225F9FF             call    004807E4

* Reference to: kernel32.GetTickCount()
|
004EE2E2   E8698DF1FF             call    00407050
004EE2E7   2B05986D4F00           sub     eax, dword ptr [$004F6D98]
004EE2ED   83F864                 cmp     eax, +$64
004EE2F0   72E4                   jb      004EE2D6
004EE2F2   6A0F                   push    $0F
004EE2F4   C644240483             mov     byte ptr [esp+$04], $83
004EE2F9   C644240511             mov     byte ptr [esp+$05], $11
004EE2FE   C6442406F1             mov     byte ptr [esp+$06], $F1
004EE303   C644240730             mov     byte ptr [esp+$07], $30
004EE308   A0A46D4F00             mov     al, byte ptr [$004F6DA4]
004EE30D   88442408               mov     [esp+$08], al
004EE311   C644240901             mov     byte ptr [esp+$09], $01
004EE316   A0A66D4F00             mov     al, byte ptr [$004F6DA6]
004EE31B   8844240A               mov     [esp+$0A], al
004EE31F   8D542404               lea     edx, [esp+$04]
004EE323   B906000000             mov     ecx, $00000006
004EE328   8BC3                   mov     eax, ebx

* Reference to : TForm1.WriteReadComm()
|
004EE32A   E8394BFFFF             call    004E2E68
004EE32F   803D026E4F0070         cmp     byte ptr [$004F6E02], $70
004EE336   7558                   jnz     004EE390
004EE338   803D056E4F0000         cmp     byte ptr [$004F6E05], $00
004EE33F   741D                   jz      004EE35E
004EE341   803DA76D4F0014         cmp     byte ptr [$004F6DA7], $14
004EE348   752D                   jnz     004EE377
004EE34A   A0A46D4F00             mov     al, byte ptr [$004F6DA4]
004EE34F   04ED                   add     al, -$13
004EE351   2C02                   sub     al, $02
004EE353   7322                   jnb     004EE377
004EE355   803D056E4F00FF         cmp     byte ptr [$004F6E05], $FF
004EE35C   7519                   jnz     004EE377

* Reference to TGrafForm instance
|
004EE35E   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE363   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE365   8B80E4030000           mov     eax, [eax+$03E4]

* Possible String Reference to: 'ВЫКЛ.'
|
004EE36B   BAB4E34E00             mov     edx, $004EE3B4

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE370   E81F1FF7FF             call    00460294
004EE375   EB30                   jmp     004EE3A7

* Reference to TGrafForm instance
|
004EE377   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE37C   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE37E   8B80E4030000           mov     eax, [eax+$03E4]

* Possible String Reference to: 'ВКЛ.'
|
004EE384   BAC4E34E00             mov     edx, $004EE3C4

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE389   E8061FF7FF             call    00460294
004EE38E   EB17                   jmp     004EE3A7

* Reference to TGrafForm instance
|
004EE390   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE395   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.stat : TPanel
|
004EE397   8B80E4030000           mov     eax, [eax+$03E4]
004EE39D   BAD4E34E00             mov     edx, $004EE3D4

* Reference to: Controls.TControl.SetText(TControl;TCaption);
|
004EE3A2   E8ED1EF7FF             call    00460294
004EE3A7   59                     pop     ecx
004EE3A8   5A                     pop     edx
004EE3A9   5B                     pop     ebx
004EE3AA   C3                     ret

*)
end;

procedure TForm1.Test_DKClick(Sender : TObject);
begin
(*
004EE3D8   53                     push    ebx
004EE3D9   56                     push    esi
004EE3DA   57                     push    edi
004EE3DB   55                     push    ebp
004EE3DC   8BF8                   mov     edi, eax
004EE3DE   BDAC224F00             mov     ebp, $004F22AC
004EE3E3   8B8728030000           mov     eax, [edi+$0328]
004EE3E9   33D2                   xor     edx, edx
004EE3EB   8B08                   mov     ecx, [eax]

* Reference to method TForm1.SetEnabled(Boolean)
|
004EE3ED   FF5164                 call    dword ptr [ecx+$64]
004EE3F0   8B8740030000           mov     eax, [edi+$0340]
004EE3F6   33D2                   xor     edx, edx
004EE3F8   8B08                   mov     ecx, [eax]

* Reference to method TForm1.SetEnabled(Boolean)
|
004EE3FA   FF5164                 call    dword ptr [ecx+$64]
004EE3FD   8B8718040000           mov     eax, [edi+$0418]
004EE403   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EE405   E87E47F8FF             call    00472B88

* Reference to TGrafForm instance
|
004EE40A   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE40F   8B00                   mov     eax, [eax]

* Reference to control TGrafForm.DriveIM : TMenuItem
|
004EE411   8B80EC030000           mov     eax, [eax+$03EC]
004EE417   33D2                   xor     edx, edx

* Reference to: Menus.TMenuItem.SetEnabled(TMenuItem;Boolean);
|
004EE419   E86A47F8FF             call    00472B88
004EE41E   33DB                   xor     ebx, ebx
004EE420   6A02                   push    $02
004EE422   B8FC6E4F00             mov     eax, $004F6EFC
004EE427   B901000000             mov     ecx, $00000001

* Reference to class main
|
004EE42C   8B150CFB4D00           mov     edx, [$004DFB0C]

* Reference to: System.@DynArraySetLength;
|
004EE432   E8FD78F1FF             call    00405D34
004EE437   83C404                 add     esp, +$04
004EE43A   EB01                   jmp     004EE43D
004EE43C   43                     inc     ebx
004EE43D   8D34DB                 lea     esi, [ebx+ebx*8]
004EE440   8A44B500               mov     al, byte ptr [ebp+esi*4+$00]
004EE444   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EE44A   75F0                   jnz     004EE43C
004EE44C   8B44B508               mov     eax, [ebp+esi*4+$08]

* Possible String Reference to: 'Сигнал ДК1'
|
004EE450   BA20E54E00             mov     edx, $004EE520

* Reference to: System.@LStrCmp;
|
004EE455   E8DE69F1FF             call    00404E38
004EE45A   75E0                   jnz     004EE43C
004EE45C   8D04DB                 lea     eax, [ebx+ebx*8]
004EE45F   8B448504               mov     eax, [ebp+eax*4+$04]
004EE463   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EE469   8902                   mov     [edx], eax
004EE46B   33DB                   xor     ebx, ebx
004EE46D   EB01                   jmp     004EE470
004EE46F   43                     inc     ebx
004EE470   8D34DB                 lea     esi, [ebx+ebx*8]
004EE473   8A44B500               mov     al, byte ptr [ebp+esi*4+$00]
004EE477   3A05A76D4F00           cmp     al, byte ptr [$004F6DA7]
004EE47D   75F0                   jnz     004EE46F
004EE47F   8B44B508               mov     eax, [ebp+esi*4+$08]

* Possible String Reference to: 'Кратковременная коррекция топливопо
|                                дачи'
|
004EE483   BA34E54E00             mov     edx, $004EE534

* Reference to: System.@LStrCmp;
|
004EE488   E8AB69F1FF             call    00404E38
004EE48D   75E0                   jnz     004EE46F
004EE48F   8D04DB                 lea     eax, [ebx+ebx*8]
004EE492   8B448504               mov     eax, [ebp+eax*4+$04]
004EE496   8B15FC6E4F00           mov     edx, [$004F6EFC]
004EE49C   894204                 mov     [edx+$04], eax
004EE49F   C60534724F0001         mov     byte ptr [$004F7234], $01

* Reference to TOptionsForm instance
|
004EE4A6   A1FC5A4F00             mov     eax, dword ptr [$004F5AFC]
004EE4AB   8B00                   mov     eax, [eax]

* Reference to control TOptionsForm.InquireInterval : TSpinEdit
|
004EE4AD   8B800C030000           mov     eax, [eax+$030C]

* Reference to : TTimerSpeedButton._PROC_004C2644()
|
004EE4B3   E88C41FDFF             call    004C2644
004EE4B8   8BD0                   mov     edx, eax
004EE4BA   8B8730030000           mov     eax, [edi+$0330]

* Reference to: ExtCtrls.TTimer.SetInterval(TTimer;Cardinal);
|
004EE4C0   E8EF6EF4FF             call    004353B4
004EE4C5   8B87FC020000           mov     eax, [edi+$02FC]

* Reference to field TSpinEdit.OFFS_000C
|
004EE4CB   C7400C02000000         mov     dword ptr [eax+$0C], $00000002
004EE4D2   803D1F724F0001         cmp     byte ptr [$004F721F], $01
004EE4D9   7510                   jnz     004EE4EB
004EE4DB   8B8730030000           mov     eax, [edi+$0330]
004EE4E1   8BD8                   mov     ebx, eax
004EE4E3   8BD0                   mov     edx, eax

* Reference to field TSpinEdit.OFFS_003C
|
004EE4E5   8B433C                 mov     eax, [ebx+$3C]

* Possible reference to virtual method TSpinEdit.OFFS_38
|
004EE4E8   FF5338                 call    dword ptr [ebx+$38]

* Reference to TGrafForm instance
|
004EE4EB   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE4F0   8B00                   mov     eax, [eax]
004EE4F2   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EE4F4   FF92EC000000           call    dword ptr [edx+$00EC]

* Reference to TGrafForm instance
|
004EE4FA   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE4FF   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004EE501   80785701               cmp     byte ptr [eax+$57], $01
004EE505   750C                   jnz     004EE513

* Reference to TGrafForm instance
|
004EE507   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE50C   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004EE50E   E875D6FEFF             call    004DBB88
004EE513   5D                     pop     ebp
004EE514   5F                     pop     edi
004EE515   5E                     pop     esi
004EE516   5B                     pop     ebx
004EE517   C3                     ret

*)
end;

procedure TForm1.DriverIMClick(Sender : TObject);
begin
(*
004EE228   C60535724F0001         mov     byte ptr [$004F7235], $01

* Reference to TGrafForm instance
|
004EE22F   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE234   8B00                   mov     eax, [eax]
004EE236   8B10                   mov     edx, [eax]

* Reference to method TGrafForm.ShowModal()
|
004EE238   FF92EC000000           call    dword ptr [edx+$00EC]

* Reference to TGrafForm instance
|
004EE23E   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE243   8B00                   mov     eax, [eax]

* Reference to field TGrafForm.Visible : Boolean
|
004EE245   80785701               cmp     byte ptr [eax+$57], $01
004EE249   750C                   jnz     004EE257

* Reference to TGrafForm instance
|
004EE24B   A1A85A4F00             mov     eax, dword ptr [$004F5AA8]
004EE250   8B00                   mov     eax, [eax]

* Reference to : TGrafForm.ChartPoint()
|
004EE252   E831D9FEFF             call    004DBB88
004EE257   C3                     ret

*)
end;

procedure TForm1.N_SiriusD32Click(Sender : TObject);
begin
(*
004E3900   53                     push    ebx
004E3901   56                     push    esi
004E3902   8BD8                   mov     ebx, eax
004E3904   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E390B   7507                   jnz     004E3914
004E390D   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E390F   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3914   C605A76D4F0013         mov     byte ptr [$004F6DA7], $13
004E391B   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E3922   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3929   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3933   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3935   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E393B   E864F3F8FF             call    00472CA4
004E3940   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3942   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3948   E857F3F8FF             call    00472CA4
004E394D   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E394F   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3955   E84AF3F8FF             call    00472CA4
004E395A   6A03                   push    $03

* Possible String Reference to: 'Dvig'
|
004E395C   B98C394E00             mov     ecx, $004E398C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3961   BA9C394E00             mov     edx, $004E399C
004E3966   A120724F00             mov     eax, dword ptr [$004F7220]
004E396B   8B30                   mov     esi, [eax]
004E396D   FF560C                 call    dword ptr [esi+$0C]
004E3970   B201                   mov     dl, $01
004E3972   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3974   E80BF9FFFF             call    004E3284
004E3979   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E397B   E858070000             call    004E40D8
004E3980   5E                     pop     esi
004E3981   5B                     pop     ebx
004E3982   C3                     ret

*)
end;

procedure TForm1.N_BoschClick(Sender : TObject);
begin
(*
004E3AF8   53                     push    ebx
004E3AF9   56                     push    esi
004E3AFA   8BD8                   mov     ebx, eax
004E3AFC   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E3B03   7507                   jnz     004E3B0C
004E3B05   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E3B07   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3B0C   C605A76D4F0014         mov     byte ptr [$004F6DA7], $14
004E3B13   C605A86D4F0011         mov     byte ptr [$004F6DA8], $11
004E3B1A   C605A96D4F00F1         mov     byte ptr [$004F6DA9], $F1
004E3B21   C705D86D4F0080000000   mov     dword ptr [$004F6DD8], $00000080
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
004E3B45   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3B47   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3B4D   E852F1F8FF             call    00472CA4
004E3B52   6A04                   push    $04

* Possible String Reference to: 'Dvig'
|
004E3B54   B9843B4E00             mov     ecx, $004E3B84

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3B59   BA943B4E00             mov     edx, $004E3B94
004E3B5E   A120724F00             mov     eax, dword ptr [$004F7220]
004E3B63   8B30                   mov     esi, [eax]
004E3B65   FF560C                 call    dword ptr [esi+$0C]
004E3B68   B201                   mov     dl, $01
004E3B6A   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3B6C   E813F7FFFF             call    004E3284
004E3B71   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3B73   E860050000             call    004E40D8
004E3B78   5E                     pop     esi
004E3B79   5B                     pop     ebx
004E3B7A   C3                     ret

*)
end;

procedure TForm1.N_EFIClick(Sender : TObject);
begin
(*
004E3BA0   53                     push    ebx
004E3BA1   56                     push    esi
004E3BA2   8BD8                   mov     ebx, eax
004E3BA4   803D1A724F0000         cmp     byte ptr [$004F721A], $00
004E3BAB   7507                   jnz     004E3BB4
004E3BAD   33C0                   xor     eax, eax

* Reference to GlobalVar_004F6DAC
|
004E3BAF   A3AC6D4F00             mov     dword ptr [$004F6DAC], eax
004E3BB4   C605A76D4F0015         mov     byte ptr [$004F6DA7], $15
004E3BBB   C605A86D4F0010         mov     byte ptr [$004F6DA8], $10
004E3BC2   C605A96D4F00FC         mov     byte ptr [$004F6DA9], $FC
004E3BC9   C705D86D4F0040000000   mov     dword ptr [$004F6DD8], $00000040
004E3BD3   B201                   mov     dl, $01

* Reference to control TForm1.Button_Sbros : TMenuItem
|
004E3BD5   8B8310040000           mov     eax, [ebx+$0410]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BDB   E8C4F0F8FF             call    00472CA4
004E3BE0   33D2                   xor     edx, edx

* Reference to control TForm1.Button_Obuchenie : TMenuItem
|
004E3BE2   8B8314040000           mov     eax, [ebx+$0414]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BE8   E8B7F0F8FF             call    00472CA4
004E3BED   B201                   mov     dl, $01

* Reference to control TForm1.Test_DK : TMenuItem
|
004E3BEF   8B8324040000           mov     eax, [ebx+$0424]

* Reference to: Menus.TMenuItem.SetVisible(TMenuItem;Boolean);
|
004E3BF5   E8AAF0F8FF             call    00472CA4
004E3BFA   6A05                   push    $05

* Possible String Reference to: 'Dvig'
|
004E3BFC   B92C3C4E00             mov     ecx, $004E3C2C

* Possible String Reference to: 'Vib_tip_ECU'
|
004E3C01   BA3C3C4E00             mov     edx, $004E3C3C
004E3C06   A120724F00             mov     eax, dword ptr [$004F7220]
004E3C0B   8B30                   mov     esi, [eax]
004E3C0D   FF560C                 call    dword ptr [esi+$0C]
004E3C10   B201                   mov     dl, $01
004E3C12   8BC3                   mov     eax, ebx

* Reference to : TForm1.TipECU_for_button()
|
004E3C14   E86BF6FFFF             call    004E3284
004E3C19   8BC3                   mov     eax, ebx

* Reference to : TForm1.Start()
|
004E3C1B   E8B8040000             call    004E40D8
004E3C20   5E                     pop     esi
004E3C21   5B                     pop     ebx
004E3C22   C3                     ret

*)
end;

end.