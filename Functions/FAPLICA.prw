#Include "RwMake.CH"
#Include "Protheus.ch"
#Include "Apwizard.ch"
#Include "Ap5mail.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณFSTTST    บAutor  ณCarlos A. Gomes Jr. บ Data ณ  11/08/04   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcoes genericas:                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function RunAplica(cInternet)

Local oBar
// Local cMenuBmp := GetMenuBmp()

If Type("OMAINWND") != "O"

	//Variaveis para tela Principal
	Private oShortList, oMainWnd, oFont
	Private lLeft     := .F.     
	Private cVersao   := GetVersao()
	Private dDataBase := MsDate()
	Private cUsuario  := "RAMOS"
	
	DEFINE FONT oFont NAME "MS Sans Serif" SIZE 0, -9
	
	DEFINE WINDOW oMainWnd FROM 0,0 TO 800, 600  TITLE  "Tela principal RunAplica."
	oMainWnd:oFont := oFont
	oMainWnd:SetColor(CLR_BLACK,CLR_WHITE)
	oMainWnd:Cargo := oShortList
	oMainWnd:oFont := oFont
	oMainWnd:nClrText := 0
	oMainWnd:lEscClose := .F.
	
	MainToolBar(@oBar)
	
	SET MESSAGE OF oMainWnd TO oEmToAnsi(cVersao)  NOINSET FONT oFont
	DEFINE MSGITEM oMsgItem0 OF oMainWnd:oMsgBar PROMPT '     '               SIZE 50
	DEFINE MSGITEM oMsgItem1 OF oMainWnd:oMsgBar PROMPT dDataBase             SIZE 100
	DEFINE MSGITEM oMsgItem2 OF oMainWnd:oMsgBar PROMPT Substr(cUsuario,1,6)  SIZE 100
	DEFINE MSGITEM oMsgItem3 OF oMainWnd:oMsgBar PROMPT 'Microsiga / Matriz'  SIZE 180
	DEFINE MSGITEM oMsgItem4 OF oMainWnd:oMsgBar PROMPT 'Ambiente'            SIZE 180
	
	oMainWnd:ReadClientCoors()
	
	ACTIVATE WINDOW oMainWnd MAXIMIZED ON INIT ( AuxRunAplica(.T.) , oMainWnd:End())

Else
	AuxRunAplica()
EndIf

Return


//DEFINICOES HTML
#Define HTMO ' <B><font size="4"> '
#Define HTMC ' </B></font> '

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRunaplica บAutor  ณCarlos A. Gomes Jr. บ Data ณ  04/12/05   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFun็ใo para executar funcoes.                               บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AuxRunAplica(lRunEnv)

Local bGet,oBkpDlg,oDlgRun,oResult,cResult
Local cGet      := Space(255)
Local cEmpRun   := "01"
Local cFilRun   := "01"
Local cUsuRun   := Space(15)
Local cPasRun   := Space(6)
Local lComAmb   := .F.
Local lProtErro := .F.

DEFAULT lRunEnv := .T.

Private xRet := Space(255)

oDlgRun := MSDialog():New(0,0,480,590,"Executa fun็ใo",,,,,,,,,.T.,,,)

TSay():New(05,02, {|| "Empresa:" },oDlgRun,,,,,,.T.,,,30,10,,,,,,.T.)
TGet():New(03,25, bSETGET(cEmpRun),oDlgRun,15,10,,,,,,,,.T.,,,{|| lRunEnv .And. !lComAmb },,,,,,)
TSay():New(05,45, {|| "Filial:" },oDlgRun,,,,,,.T.,,,30,10,,,,,,.T.)
TGet():New(03,65, bSETGET(cFilRun),oDlgRun,15,10,,,,,,,,.T.,,,{|| lRunEnv .And. !lComAmb },,,,,,)

TSay():New(05,85, {|| "Usuario:" },oDlgRun,,,,,,.T.,,,30,10,,,,,,.T.)
TGet():New(03,105, bSETGET(cUsuRun),oDlgRun,30,10,,,,,,,,.T.,,,{|| lRunEnv .And. !lComAmb },,,,,,)
TSay():New(05,145, {|| "Senha:" },oDlgRun,,,,,,.T.,,,30,10,,,,,,.T.)
TGet():New(03,165, bSETGET(cPasRun),oDlgRun,30,10,,,,,,,,.T.,,,{|| lRunEnv .And. !lComAmb },,,,,.T.,)

TSay():New(20,02, {|| "Fun็ใo:" },oDlgRun,,,,,,.T.,,,30,10,,,,,,.T.)
TGet():New(18,25, bSETGET(cGet),oDlgRun,200,10,,,,,,,,.T.,,,,,,,,,)
TButton():New(02,200,"&Ambiente",oDlgRun,{|| AuxRunApl(cEmpRun,cFilRun,cUsuRun,cPasRun,,,,@lComAmb) },45,15,,,,.T.,,,,{|| lRunEnv .And. !lComAmb },,)
TButton():New(02,250,"&Sem Ambiente",oDlgRun,{|| RpcClearEnv(),lComAmb := .F. },45,15,,,,.T.,,,,{|| lRunEnv .And. lComAmb },,)
TButton():New(17,250,"&Executar",oDlgRun,{|| If(Empty(cGet),bGet:={|| .T. },bGet := &("{||xRet := "+cGet+" }")), MsgRun("Executando...","Aguarde.",{||TrataExec(bGet,lProtErro)}), cResult := VarInfo('xRet',xRet,,.F.), oResult:Refresh() },45,15,,,,.T.,,,,,,)
TSay():New(33,02, {|| '<B><I><font size="4">Resultado:</font></B></I>' },oDlgRun,,,,,,.T.,,,50,10,,,,,,.T.)
TCheckBox():New( 33, 240,'Protecao de erro:', bSETGET(lProtErro), oDlgRun, 50, 10,,,,,,,,.T.,,,)
oResult := TMultiGet():New(48,02, bSETGET(cResult),oDlgRun,293,190,,,,,,.T.,,,,,,,,,,,)
oDlgRun:Activate(,,,.T.,,,)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAuxRunApl บAutor  ณCarlos A. Gomes Jr. บ Data ณ  21/06/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณMonta ambiente.                                             บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function AuxRunApl(cEmpRun,cFilRun,cUsrRun,cPasRun,cModRun,cFunRun,cTabRun,lComAmb)

Local oBkpObj

DEFAULT cEmpRun := "01"
DEFAULT cFilRun := "01"

If Empty(cUsrRun)
	cUsrRun := Nil
Else
	cUsrRun := AllTrim(cUsrRun)
EndIf

If Empty(cPasRun)
	cPasRun := Nil
Else
	cPasRun := AllTrim(cPasRun)
EndIf

lComAmb := .T.

oBkpObj := oMainWnd
oMainWnd := Nil

RpcSetType(2)
MsgRun("Aguarde...","Montando Ambiente. Empresa ["+cEmpRun+"] Filial ["+cFilRun+"].",{|| RpcSetEnv( cEmpRun,cFilRun,cUsrRun,cPasRun,"TMS",/*FunName*/,/*{Tables}*/) } )

If ( !Empty(cUsrRun) .Or. !Empty(cPasRun) )
	PswOrder(2)
	If ( !PswSeek(cUsrRun) .Or. !PswName(cPasRun) )
		MsgStop("Usuario ou senha invalidos.["+cUsrRun+"]","RunAplica")
		RpcClearEnv()
		lComAmb := .F.
	EndIf
EndIf

oMainWnd := oBkpObj
oBkpObj := Nil

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTrataExec บAutor  ณCarlos A. Gomes Jr. บ Data ณ  04/12/05   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Executa fun็ใo tratando erro.                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function TrataExec(bBloco,lProtErro)

Local bErrBlock

DEFAULT lProtErro := .F.

If lProtErro
	bErrBlock := ErrorBlock()
	ErrorBlock( {|e| ExecErro(e) } )
EndIf

Begin Sequence
	EVAL(bBloco)
End Sequence

If lProtErro
	ErrorBlock( bErrBlock )
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณExecErro  บAutor  ณCarlos A. Gomes Jr. บ Data ณ  22/03/05   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณNovo tratamento de erro.                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ExecErro(e)
MsgStop(HTMO+"Existe um erro na fun็ใo:"+HTMC+"<BR><BR>Verifique a ocorr๊ncia :<BR><BR>"+e:description, "ERRO!")
xRet := CRLF+e:description+CRLF
Break
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTESTAEMAILบAutor  ณCarlos A. Gomes Jr. บ Data ณ  06/21/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao exmeplo de envio de email.                           บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function TESTAEMAIL(cServidor,cConta,cMailPsw,cTo,cBody,lAut,cFrom,lHelp)

Local lOk      := .T.
Local lSendOk  := .F.
Local cError   := ""
Local cUserAut := ""

DEFAULT cServidor := SuperGetMV("MV_RELSERV",,"smtp.microsiga.com.br")
DEFAULT cConta    := SuperGetMV("MV_RELACNT",,"asf@ramos.srv.br")
DEFAULT cMailPsw  := SuperGetMV("MV_RELPSW" ,,"")
DEFAULT lAut      := SuperGetMV("MV_RELAUTH",,.F.)
DEFAULT cFrom     := cConta
DEFAULT cTo       := cConta
DEFAULT cBody     := "Enviado do email " + cConta
DEFAULT lHelp     := .T.

cUserAut  := cConta //Left(cConta,At("@",cConta)-1)

CONNECT SMTP SERVER cServidor ACCOUNT cConta PASSWORD cMailPsw TIMEOUT 120 RESULT lOk

If lOk .And. (!lAut .Or. (lOk := MailAuth(cUserAut,cMailPsw)) )
	SEND MAIL ;
	FROM cFrom ;
	TO cTo ;
	SUBJECT "E-Mail Protheus." ;
	BODY cBody ;
	RESULT lSendOk
EndIf

If lHelp
	If !lSendOk 
		GET MAIL ERROR cError
		MsgAlert("Envio de Cartas."+CRLF+cError,"Erro no E-mail:")
	Else
		MsgInfo("Envio Ok.","E-mail.")
	EndIf
EndIf
	
If lOk
	DISCONNECT SMTP SERVER RESULT lOk
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณTesteOle  บAutor  ณCarlos A. Gomes Jr. บ Data ณ  06/21/10   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao exemplo utilizacao objeto OLE.                       บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
#INCLUDE "OleCont.ch"
User Function TesteOle

Local oDlg, oScroll, oOle
Local cArquivo := "T:\Documentos\CARGOSCAN\firex.pdf"
Local cArq1 := "T:\Documentos\CARGOSCAN\firex.pdf"
Local cArq2 := "T:\Documentos\CARGOSCAN\Levantamento_Novo.doc"

DEFINE MSDIALOG oDlg TITLE "Teste" FROM 0,0 TO 480,640 PIXEL

@ 005,005 SCROLLBOX oScroll SIZE 220,310 OF oDlg VERTICAL HORIZONTAL BORDER
@ 005,005 OLECONTAINER oOle SIZE 300,400 OF oScroll FILENAME cArquivo PIXEL
@ 225,200 Button "&Abrir"  Size 030,012 PIXEL OF oDlg ACTION ShellExecute("open",cArquivo,"","",1)
@ 225,100 Button "&Trocar" Size 030,012 PIXEL OF oDlg ACTION ( cArquivo := Iif(cArquivo == cArq1,cArq2,cArq1) , oOle:OpenFromFile(cArquivo,.F.), oOle:Refresh() )

ACTIVATE MSDIALOG oDlg CENTERED

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณImpBaseEx บAutor  ณCarlos A. Gomes Jr. บ Data ณ  10/22/04   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de importacao de base exemplo                        บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ImpBaseEx
MsApp():New('SIGATST') 
oApp:CreateEnv() 
oApp:bMainInit:= {|| MsgRun("Configurando ambiente...","Aguarde...",{|| RpcSetEnv("01","01"), }),U_AuxImpBase(),Final("TERMINO NORMAL")} 
__lInternet := .T.
lMsFinalAuto := .F.
oApp:lMenu:= .F. 
oApp:lShortCut:= .F. 
oApp:lMessageBar:= .F. 
oApp:cModDesc:= 'SIGATST' 
oApp:RunApp()
Return

//Funcao auxiliar chamada pela principal.
User Function AuxImpBase

Local oWizard, oPanel, oGet1, oGet2, oMeter1, oMeter2
Local cDir    := Space(100)
Local cHist   := ""
Local lNaoFoi := .T.
Local cText :=	'Este programa irแ importar uma base de dados exemplo para a sua base atual'+;
				' da empresa 01 filial 01. Esta importa็ใo serแ por "APPEND" e portanto manterแ'+;
				'sua estrutura atual de arquivos, diferente da Fun็ใo Import do SDU'+;
				'.' + CRLF + CRLF + CRLF + ;
	  			'Para continuar clique em avan็ar.'

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณInicializacao do Wizardณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
DEFINE WIZARD oWizard TITLE 'Easy-Import de Base de Dados Exemplo.' ;
HEADER 'APPEND de Base de dados Exemplo:' ; 
MESSAGE 'Fun็ใo criada internamente na Microsiga.' TEXT cText ;
NEXT {|| lNaoFoi := .T. } FINISH {|| .T.} PANEL

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณSegundo Panel - Arquivo Lay Outณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
/*CREATE PANEL oWizard HEADER 'Easy-Import de Base de Dados Exemplo.' ;
MESSAGE 'APPEND de Base de dados Exemplo:' ;
BACK {|| .T. } NEXT {|| lNaoFoi } FINISH {|| !lNaoFoi } PANEL         
oPanel := oWizard:GetPanel(2)

TSay():New(01,02,{|| "Escolha o caminho do arquivo :"},oPanel,,,,,,.T.)
oGet1 := TGet():New(11,02, bSETGET(cDir),oPanel,180,10,,,,,,,,.T.,,,,,,,.T.,,,)
SButton():New(09,185,14,{|| cDir := cGetFile("Codebase|*.DBF|Todos Arquivos|*.*|","Escolha o caminho dos arquivos.",0,"SERVIDOR",.T.,GETF_ONLYSERVER+GETF_RETDIRECTORY)},oPanel,)
TButton():New(08,230,"&Processa", oPanel,{|| ProcImpEx(@oMeter1,@oMeter2,@cHist,cDir,@lNaoFoi,@oGet2) },45,15,,,,.T.,,,,{|| lNaoFoi },,)
TSay():New(25,02,{|| "Hist๓rico de processamento :"},oPanel,,,,,,.T.)
oGet2 := TMultiGet():New(35,02, bSETGET(cHist),oPanel,220,50,,,,,,.T.,,,,,,,,,,,)
TSay():New(92,02,{|| "Andamento do Processamento (TOTAL) :"},oPanel,,,,,,.T.)
oMeter1 := TMeter():New( 100,02, bSETGET(0),, oPanel, 270,10,,.T.,,,,,,,,)
TSay():New(114,02,{||"Andamento do Processamento (Por arquivo) :"},oPanel,,,,,,.T.)
oMeter2 := TMeter():New( 122,02, bSETGET(0),, oPanel, 270,10,,.T.,,,,,,,,)

ACTIVATE WIZARD oWizard CENTER

Return
*/
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณProcImpEx บAutor  ณCarlos A. Gomes Jr. บ Data ณ  10/22/04   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Processa importacao de base de dados exemplo.              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ProcImpEx(oMeter1,oMeter2,cHist,cDir,lNaoFoi,oGet2)

/* Local aDir    := aArqs := Directory(cDir+"*.DBF")
Local aArqs   := {}
Local aStru1  := {}
Local aStru2  := {}
Local nI      := 0
Local nII     := 0
Local lCont   := .T.
Local nPosFil := 0
Local uConteudo
Local cBases := "BASEX"

If Len(aDir) == 0
	MsgAlert("Nใo hแ arquivos no caminho selecionado.")
	cHist += "Nใo hแ arquivos no caminho selecionado." + CRLF + CRLF + "---------------------------"
	Return .F.
Else	
	cHist += "Iniciando Processamento..." + CRLF + "Filtrando arquivos..." + CRLF
	oGet2:Refresh()
	AEval(aDir,{|x,y| If(Len(AllTrim(x[1])) == 7 .And. Right(AllTrim(x[1]),4) == ".DBF", AAdd(aArqs, x[1] ) , .T. ) } )
EndIf

If Len(aArqs) == 0
	MsgAlert("Nใo hแ arquivos ap๓s aplica็ใo do filtro.")
	cHist += "Nใo hแ arquivos ap๓s aplica็ใo do filtro." + CRLF + CRLF + "---------------------------"
	Return .F.
EndIf

oMeter1:nTotal:=(Len(aArqs) * 10)

For nI := 1 To Len(aArqs)
	oMeter1:Set(nI * 10)
	cHist += "Appendando arquivo " + aArqs[nI] + CRLF
	oGet2:Refresh()
	DbUseArea(.T.,,cDir+aArqs[nI],cBases,.F.,.F.)
	aStru1 := BASEX->(DbStruct())
	aStru2 := {}
	AEval(aStru1,{|x,y| Aadd(aStru2,{x[1],"BASEX->"+x[1]}) })
	nPosFil := AScan(aStru2,{|x| "_FILIAL" $ UPPER(x[1]) })
	If nPosFil > 0 .And. !BASEX->(Eof())
		If SX2->(MSSeek(Left(aArqs[nI],3)))
			RecLock('SX2',.F.)
			SX2->X2_MODO := Iif(Empty(&(aStru2[nPosFil][2])),"C","E")
			MsUnLock()
		EndIf
	EndIf
	oMeter2:nTotal:=BASEX->(RecCount())
	lCont := .T.
	DbSelectArea(Left(aArqs[nI],3))
	If RecCount() > 0
		If .T. //MsgYesNo(Alias() + ' nใo estแ vasio! Deseja apagแ-lo antes?')
			DbGoTop()
			Do While !Eof()
				RecLock(Left(aArqs[nI],3),.F.)
				(Left(aArqs[nI],3))->(DbDelete())
				MsUnLock()
				DbSkip()
			EndDo
		Else
			lCont := MsgYesNo('Procede "APPENND mesmo assim?"')
		EndIf
	EndIf
	BASEX->(DbGoTop())
	nII := 0
	Do While lCont .And. !BASEX->(Eof())
		nII++
		oMeter2:Set(nII)
		RecLock(Left(aArqs[nI],3),.T.)
		AEval(aStru2,{|x,y| uConteudo := &(x[2]), FieldPut( FieldPos(x[1]), uConteudo ) })
		MsUnLock()
		BASEX->(DbSkip())
	EndDo
	BASEX->(DbCloseArea())
Next
cHist += CRLF + "Processo finalizado com Sucesso!!!!" + CRLF + "-------------------------"

lNaoFoi := .F. */ 
// comentado pois na nova versใo 2210 nใo funciona o reclok da sx2 e como nใo usamos esta fun็ใo foi comentado para nใo dar problemas na migra็ใo. 

Return .T.

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณFExplor   บAutor  ณTOTVS               บ Data ณ 07/Jul/2010 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFile Explorer em ADVPL. Facilita manipulacao de arquivos no บฑฑ
ฑฑบ          ณprotheus.                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function FExplor

Local oDlgExpl,oList01,oGet1,oGet2
Local oBmp01, oBmp02

Local cPatch01 := PadR("C:\",60)
Local cPatch02 := PadR("\",60)

Static oFolder  := LoadBitmap( GetResources(), "FOLDER5")
Static oFile    := LoadBitmap( GetResources(), "RPMNEW2")
Static cMaskArq := "*.*"

Private oMainWnd

DEFINE MSDIALOG oDlgExpl TITLE "Explorer." FROM 0,0 TO 600,800 PIXEL
oMainWnd := oDlgExpl

@ 002,002 MSGET oGet1 VAR cPatch01 PICTURE "@!" PIXEL SIZE 150,009 WHEN .F.
@ 003,160 BITMAP oBmp01 NAME "OPEN"      SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK ( cPatch01 := OpenBtn(cPatch01,"T") , LeDirect(@oList01,@oGet1,@cPatch01) )
@ 220,002 BITMAP oBmp01 NAME "BMPDEL"    SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK MsgRun("Apagando Arquivo...","Aguarde.",{|| FApaga(cPatch01,oList01) , LeDirect(@oList01,@oGet1,@cPatch01) })
@ 220,017 BITMAP oBmp01 NAME "SDUDRPTBL" SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK Processa({|| FApaga(cPatch01,oList01,.T.), LeDirect(@oList01,@oGet1,@cPatch01) },"Exclusใo de arquivos","Excluindo",.T.) 

@ 002,220 MSGET oGet2 VAR cPatch02 PICTURE "@!" PIXEL SIZE 150,009 WHEN .F.
@ 003,380 BITMAP oBmp02 NAME "OPEN"      SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK ( cPatch02 := OpenBtn(cPatch02,"S") , LeDirect(@oList02,@oGet2,@cPatch02) )
@ 220,220 BITMAP oBmp01 NAME "BMPDEL"    SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK MsgRun("Apagando Arquivo...","Aguarde.",{|| FApaga(cPatch02,oList02) , LeDirect(@oList02,@oGet2,@cPatch02) })
@ 220,235 BITMAP oBmp01 NAME "SDUDRPTBL" SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK Processa({|| FApaga(cPatch02,oList02,.T.), LeDirect(@oList02,@oGet2,@cPatch02) },"Exclusใo de arquivos","Excluindo",.T.)

@ 025,195 BITMAP oBmp01 NAME "RIGHT"   SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK MsgRun("Copiando Arquivo...","Aguarde.",{|| FCopia(cPatch01,cPatch02,oList01) , LeDirect(@oList01,@oGet1,@cPatch01),  LeDirect(@oList02,@oGet2,@cPatch02) })
@ 045,195 BITMAP oBmp01 NAME "LEFT"    SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK MsgRun("Copiando Arquivo...","Aguarde.",{|| FCopia(cPatch02,cPatch01,oList02) , LeDirect(@oList01,@oGet1,@cPatch01),  LeDirect(@oList02,@oGet2,@cPatch02) })
@ 065,195 BITMAP oBmp01 NAME "RIGHT_2" SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK Processa({|| FCopia(cPatch01,cPatch02,oList01,.T.), LeDirect(@oList01,@oGet1,@cPatch01), LeDirect(@oList02,@oGet2,@cPatch02) },"Copia de arquivos","Copiando",.T.)
@ 085,195 BITMAP oBmp01 NAME "LEFT2"   SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK Processa({|| FCopia(cPatch02,cPatch01,oList02,.T.), LeDirect(@oList01,@oGet1,@cPatch01), LeDirect(@oList02,@oGet2,@cPatch02) },"Copia de arquivos","Copiando",.T.)
@ 105,195 BITMAP oBmp01 NAME "FILTRO"  SIZE 015,015 OF oDlgExpl PIXEL NOBORDER ON CLICK ( MaskDir() , LeDirect(@oList01,@oGet1,@cPatch01), LeDirect(@oList02,@oGet2,@cPatch02) )

@ 015,002 LISTBOX oList01 FIELDS HEADER " "," " SIZE 180,200 OF oDlgExpl PIXEL COLSIZES 05,40 ON DBLCLICK LeDirect(@oList01,@oGet1,@cPatch01,.T.)
@ 015,220 LISTBOX oList02 FIELDS HEADER " "," " SIZE 180,200 OF oDlgExpl PIXEL COLSIZES 05,40 ON DBLCLICK LeDirect(@oList02,@oGet2,@cPatch02,.T.)
LeDirect(@oList01,@oGet1,@cPatch01)
LeDirect(@oList02,@oGet2,@cPatch02)

ACTIVATE MSDIALOG oDlgExpl CENTERED

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณLeDirect  บAutor  ณTOTVS               บ Data ณ  07/Jul/10  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao auxiliar leitura de diretorios no FExplorer.         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function LeDirect(oObjList,oGetInfo,cInfoPatch,lClick)

Local aRetList := {{"0",".."}}
Local aArqInfo := {}

DEFAULT lClick := .F.

cInfoPatch := AllTrim(cInfoPatch)

If lClick
	If oObjList:aArray[oObjList:nAt][1] == "0"
		cInfoPatch := Substr(cInfoPatch,1,RAT("\",Substr(cInfoPatch,1,Len(cInfoPatch)-1)))
	ElseIf oObjList:aArray[oObjList:nAt][1] == "1"
		cInfoPatch := cInfoPatch+AllTrim(oObjList:aArray[oObjList:nAt][2])+"\"
	Else
		Return
	EndIf
EndIf

aArqInfo := Directory(cInfoPatch+cMaskArq,"D")

If Len(aArqInfo) > 0
	AEval(aArqInfo,{|x,y| If(Left(AllTrim(x[1]),1)!=".",AAdd(aRetList,{Iif("D"$x[5],"1","2"),x[1]}),) })
	ASort(aRetList,,,{|x,y| x[1]+x[2] < y[1]+y[2] })
EndIf

oObjList:SetArray(aRetList)
oObjList:bLine := { || {Iif(aRetList[oObjList:nAt][1] == "2",oFile,oFolder),aRetList[oObjList:nAt][2]}}
oObjList:nAt := 1
oObjList:Refresh()
oGetInfo:Refresh()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณOpenBtn   บAutor  ณTOTVS               บ Data ณ  07/Jul/10  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao auxiliar botao de discos no FExplorer.               บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function OpenBtn(cAtual,cOnde)
Local cRetDir := ""
If cOnde == "T"
	cRetDir := cGetFile("Todos Arquivos|*.*|","Escolha o caminho dos arquivos.",0,cAtual,,GETF_RETDIRECTORY+GETF_LOCALHARD+GETF_LOCALFLOPPY+GETF_NETWORKDRIVE)
ElseIf cOnde == "S"
	cRetDir := cGetFile("Todos Arquivos|*.*|","Escolha o caminho dos arquivos.",0,cAtual,,GETF_RETDIRECTORY+GETF_ONLYSERVER)
EndIf
cRetDir := Iif(Empty(cRetDir),cAtual,cRetDir)
Return cRetDir

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณFCopia    บAutor  ณTOTVS               บ Data ณ  07/Jul/10  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao auxiliar de copia no FExplorer.                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FCopia(cPatchOri,cPatchDes,oObjList,lMultCpy)
Local aMultCopy := {}
Private lAbortPrint := .F.

DEFAULT lMultCpy := .F.

If lMultCpy
	AEval(oObjList:aArray,{|x,y| If(x[1] == "2",AAdd(aMultCopy,AllTrim(x[2])),) })
	ProcRegua(Len(aMultCopy))
	If ":" $ cPatchOri
		AEval(aMultCopy,{|x,y| If(!lAbortPrint, (CPYT2S(cPatchOri+x,cPatchDes,.T.), IncProc("Copiando "+Transform(y*100/Len(aMultCopy),"@E 99")+"% - "+x) ),) })
	Else
		AEval(aMultCopy,{|x,y| If(!lAbortPrint, (CPYS2T(cPatchOri+x,cPatchDes,.T.), IncProc("Copiando "+Transform(y*100/Len(aMultCopy),"@E 99")+"% - "+x) ),) })
	EndIf
ElseIf oObjList:aArray[oObjList:nAt][1] == "2"
	If ":" $ cPatchOri
		If !CPYT2S(cPatchOri+oObjList:aArray[oObjList:nAt][2],cPatchDes,.T.)
			MsgAlert("Erro ao copiar arquivo.")
		EndIf
	Else
		If !CPYS2T(cPatchOri+oObjList:aArray[oObjList:nAt][2],cPatchDes,.T.)
			MsgAlert("Erro ao copiar arquivo.")
		EndIf
	EndIf
Else
	MsgAlert("Nใo copia pastas.")
EndIf
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณFApaga    บAutor  ณTOTVS               บ Data ณ  07/Jul/10  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao auxiliar de delete no FExplorer.                     บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function FApaga(cPatchOri,oObjList,lEraseMult)

Local aMultErase := {}
Local cEraseFile := AllTrim(oObjList:aArray[oObjList:nAt][2])

Private lAbortPrint := .F.

DEFAULT lEraseMult := .F.

If lEraseMult
	AEval(oObjList:aArray,{|x,y| If(x[1] == "2",AAdd(aMultErase,AllTrim(x[2])),) })
	ProcRegua(Len(aMultErase))
	If MsgNoYes("Confirma a exclusao de "+AllTrim(Str(Len(aMultErase)))+" arquivos?")
		AEval(aMultErase,{|x,y| If(!lAbortPrint, (FErase(AllTrim(cPatchOri)+x), IncProc("Apagando "+Transform(y*100/Len(aMultErase),"@E 99")+"% - "+x) ),) })
	EndIf
ElseIf oObjList:aArray[oObjList:nAt][1] == "2"
	If MsgNoYes("Apagar o arquivo ["+cEraseFile+"]?")
		FErase(AllTrim(cPatchOri)+cEraseFile)
	EndIf
Else
	MsgAlert("Nใo apaga pastas.")
EndIf

Return

Static Function MaskDir

Local oDlMask,oGetMask

cMaskArq := Padr(cMaskArq,60)

DEFINE MSDIALOG oDlMask TITLE "Informe a mascara de arquivos." FROM 0,0 TO 30,230 PIXEL
@ 02,02 MSGET oGetMask VAR cMaskArq PICTURE "@!" PIXEL SIZE 70,009 VALID Len(AllTrim(cMaskArq)) >= 3 .And. "." $ cMaskArq
@ 02,75 BUTTON "Ok" SIZE 037,012 PIXEL OF oDlMask Action oDlMask:End()
ACTIVATE MSDIALOG oDlMask CENTERED VALID Len(AllTrim(cMaskArq)) >= 3 .And. "." $ cMaskArq

cMaskArq := AllTrim(cMaskArq)

Return


