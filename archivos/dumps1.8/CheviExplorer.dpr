{Este archivo fue creado por DeDe Ver 3.50.02 Copyright (c) 1999-2001 DaFixer}

Project CheviExplorer;

Uses
  Options in 'Options.pas' {TOptionsForm},
  CaseParams in 'CaseParams.pas' {TParamCaseForm},
  Graf in 'Graf.pas' {TGrafForm},
  Progress in 'Progress.pas' {TFormProgress},
  main in 'main.pas' {TForm1};

{$R *.RES}

begin
{
004EE8CC   55                     push    ebp
004EE8CD   8BEC                   mov     ebp, esp
004EE8CF   83C4F0                 add     esp, -$10
004EE8D2   53                     push    ebx
004EE8D3   B824E64E00             mov     eax, $004EE624

* Reference to: SysInit.@InitExe(Pointer);
|
004EE8D8   E8AF83F1FF             call    00406C8C

* Reference to TApplication instance
|
004EE8DD   8B1D885B4F00           mov     ebx, [$004F5B88]
004EE8E3   8B03                   mov     eax, [ebx]

* Reference to: DBAdapt.TDataSetAdapterDataLink.RecordChanged(TDataSetAdapterDataLink;DB.TField);
|
004EE8E5   E80E20F9FF             call    004808F8
004EE8EA   8B03                   mov     eax, [ebx]
004EE8EC   83C050                 add     eax, +$50

* Reference to: System.@LStrClr(void;void);
|
004EE8EF   E83861F1FF             call    00404A2C

* Reference to TForm1 instance
|
004EE8F4   8B0D2C5D4F00           mov     ecx, [$004F5D2C]
004EE8FA   8B03                   mov     eax, [ebx]

* Reference to class TForm1
|
004EE8FC   8B1578EE4D00           mov     edx, [$004DEE78]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE902   E80920F9FF             call    00480910

* Reference to TOptionsForm instance
|
004EE907   8B0DFC5A4F00           mov     ecx, [$004F5AFC]
004EE90D   8B03                   mov     eax, [ebx]

* Reference to class TOptionsForm
|
004EE90F   8B15CC9F4C00           mov     edx, [$004C9FCC]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE915   E8F61FF9FF             call    00480910

* Reference to TGrafForm instance
|
004EE91A   8B0DA85A4F00           mov     ecx, [$004F5AA8]
004EE920   8B03                   mov     eax, [ebx]

* Reference to class TGrafForm
|
004EE922   8B1524AC4D00           mov     edx, [$004DAC24]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE928   E8E31FF9FF             call    00480910

* Reference to TParamCaseForm instance
|
004EE92D   8B0D3C594F00           mov     ecx, [$004F593C]
004EE933   8B03                   mov     eax, [ebx]

* Reference to class TParamCaseForm
|
004EE935   8B15CC9B4D00           mov     edx, [$004D9BCC]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE93B   E8D01FF9FF             call    00480910

* Reference to TFormProgress instance
|
004EE940   8B0D445A4F00           mov     ecx, [$004F5A44]
004EE946   8B03                   mov     eax, [ebx]

* Reference to class TFormProgress
|
004EE948   8B1564EC4D00           mov     edx, [$004DEC64]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE94E   E8BD1FF9FF             call    00480910
004EE953   8B03                   mov     eax, [ebx]

* Reference to: Forms.TApplication.Run(TApplication);
|
004EE955   E83620F9FF             call    00480990
004EE95A   5B                     pop     ebx

* Reference to: System.@Halt0;
|
004EE95B   E8585FF1FF             call    004048B8
004EE960   0000                   add     [eax], al

}
end.
