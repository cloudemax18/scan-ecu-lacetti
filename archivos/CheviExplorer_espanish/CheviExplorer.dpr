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
004EE5DC   55                     push    ebp
004EE5DD   8BEC                   mov     ebp, esp
004EE5DF   83C4F0                 add     esp, -$10
004EE5E2   53                     push    ebx
004EE5E3   B834E34E00             mov     eax, $004EE334

* Reference to: SysInit.@InitExe(Pointer);
|
004EE5E8   E89F86F1FF             call    00406C8C

* Reference to TApplication instance
|
004EE5ED   8B1D285B4F00           mov     ebx, [$004F5B28]
004EE5F3   8B03                   mov     eax, [ebx]

* Reference to: DBAdapt.TDataSetAdapterDataLink.RecordChanged(TDataSetAdapterDataLink;DB.TField);
|
004EE5F5   E8FE22F9FF             call    004808F8
004EE5FA   8B03                   mov     eax, [ebx]
004EE5FC   83C050                 add     eax, +$50

* Reference to: System.@LStrClr(void;void);
|
004EE5FF   E82864F1FF             call    00404A2C

* Reference to TForm1 instance
|
004EE604   8B0DCC5C4F00           mov     ecx, [$004F5CCC]
004EE60A   8B03                   mov     eax, [ebx]

* Reference to class TForm1
|
004EE60C   8B1578EE4D00           mov     edx, [$004DEE78]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE612   E8F922F9FF             call    00480910

* Reference to TOptionsForm instance
|
004EE617   8B0D9C5A4F00           mov     ecx, [$004F5A9C]
004EE61D   8B03                   mov     eax, [ebx]

* Reference to class TOptionsForm
|
004EE61F   8B15CC9F4C00           mov     edx, [$004C9FCC]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE625   E8E622F9FF             call    00480910

* Reference to TGrafForm instance
|
004EE62A   8B0D485A4F00           mov     ecx, [$004F5A48]
004EE630   8B03                   mov     eax, [ebx]

* Reference to class TGrafForm
|
004EE632   8B1524AC4D00           mov     edx, [$004DAC24]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE638   E8D322F9FF             call    00480910

* Reference to TParamCaseForm instance
|
004EE63D   8B0DDC584F00           mov     ecx, [$004F58DC]
004EE643   8B03                   mov     eax, [ebx]

* Reference to class TParamCaseForm
|
004EE645   8B15CC9B4D00           mov     edx, [$004D9BCC]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE64B   E8C022F9FF             call    00480910

* Reference to TFormProgress instance
|
004EE650   8B0DE4594F00           mov     ecx, [$004F59E4]
004EE656   8B03                   mov     eax, [ebx]

* Reference to class TFormProgress
|
004EE658   8B1564EC4D00           mov     edx, [$004DEC64]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
004EE65E   E8AD22F9FF             call    00480910
004EE663   8B03                   mov     eax, [ebx]

* Reference to: Forms.TApplication.Run(TApplication);
|
004EE665   E82623F9FF             call    00480990
004EE66A   5B                     pop     ebx

* Reference to: System.@Halt0;
|
004EE66B   E84862F1FF             call    004048B8
004EE670   0000                   add     [eax], al

}
end.
