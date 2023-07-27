#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'TOTVS.CH'
#include "rwmake.ch"
#Include "TopConn.ch"


/*/{Protheus.doc} fIMPORT
   @description: Funcao que importa um array ou um arquivo csv 
   @type: User Function
   @author: diogogaspdev
   @since: 25/07/2023
/*/
User Function fIMPORT(xDados, cAlias, lExclui)

    Local lRet := .T.

    If Select(cAlias) == 0
        MsgStop("Alias nao aberto!", "Atencao")
        lRet := .F.
    EndIf

    If ValType(xDados) == "A"
        If Len(xDados) == 0
            MsgStop("Array invalido!", "Atencao")
            lRet := .F.
        ElseIf lRet
            lRet := fArray(xDados, cAlias, lExclui)
        EndIf
    ElseIf ValType(xDados) == "C"
        If !File(xDados)
            MsgStop("Arquivo nao existe!", "Atencao")
            lRet := .F.
        ElseIf lRet
            lRet := fArq(xDados, cAlias, lExclui)
        EndIf
    Else
        MsgStop("Formato dos dados invalido!", "Atencao!")
        lRet := .F.
    EndIf

Return lRet

/*/{Protheus.doc} fArray
   @description: Realiza a importacao por um array
   @type: Static Function
   @author: diogogaspdev
   @since: 26/07/2023
/*/
Static Function fArray(aDados, cAlias, lExclui)
    
    Local nX := 0

    (cAlias)->(DbOrderInfo(7))

    For nX := 1 To Len(aDados)
        
        

    Next nX

Return

/*/{Protheus.doc} fArq
   @description: Realiza a importacao por um arquivo csv
   @type: Static Function
   @author: diogogaspdev
   @since: 26/07/2023
/*/
Static Function fArq(cDados, cAlias, lExclui)

    Local lRet := .T.

    (cAlias)->(DbOrderInfo(7))

    If Right(cArq, 4) != '.csv'
        MsgStop("Formato do documento invalido!", "Atencao!")
        lRet := .F.
    EndIf

    If lRet
        
    EndIf

Return lRet

    Private nOpc        := 0
    Private aEntrega    :=	{}

    //OS 63152
    U__fAtuZ59("TMIRA255")

    DEFINE MSDIALOG oDlg FROM 0,0 TO 200,400 PIXEL TITLE "IMPORTAR ARQUIVO"

    @ 010,010 SAY   "O objetivo desta rotina é efetuar a leitura de um arquivo tipo: *.csv" SIZE 200, 030 OF oDlg PIXEL
    @ 030,010 SAY   "Selecione uma opção : " SIZE 200, 030 OF oDlg PIXEL

    @ 070,45 BUTTON "INCLUIR" SIZE 40, 15 PIXEL OF oDlg ACTION (nOpc := 1, oDlg:End())
    @ 070,90 BUTTON "EXLUIR" SIZE 40, 15 PIXEL OF oDlg ACTION (nOpc := 2, oDlg:End())
    @ 070,135 BUTTON "CANCELAR" SIZE 40, 15 PIXEL OF oDlg ACTION (nOpc := 3, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

    If nOpc == 1 
        oProcess := MsNewProcess():New( { || Importa() } , "Inclusão de registros " , "Aguarde..." , .F. )
        oProcess:Activate()
    ElseIf nOpc == 2 
        oProcess := MsNewProcess():New( { || Exclui() } , "Excluir registros " , "Aguarde..." , .F. )
        oProcess:Activate()
    ElseIf nOpc == 3
        MsgStop("Operação Cancelada pelo usuário!")
    Endif

Return

//-------------------------------------------------------------------
/*/{Protheus.doc} TMIRA255
Importação de arquivo csv TDE.
@author  Patricia Negri
@since   15/09/2020
/*/
//-------------------------------------------------------------------

Static Function importa()

    Local cDiret    := ""
    Local cLinha    := ""
    Local lPrimlin  := .T.
    Local aCampos 	:= {}
    Local aDados  	:= {}
    Local i         := 0
    Local _lRet		:= .T.
    Local nCount    := 0 
    Local cCodCnpj  := ""   
    Local cUltObjeto := RIGHT(GetSXENum("ACB","ACB_CODOBJ"),6)	  
    Local _lErro    := .F.
    Local cAux      := ''
    Local cErro     := ''

    Private aErro := {}
 
    cDiret :=  cGetFile( 'Arquito CSV|*.csv| Arquivo TXT|*.txt| Arquivo XML|*.xml',; //[ cMascara],     
                         'Selecao de Arquivos',;                  //[ cTitulo], 
                         0,;                                      //[ nMascpadrao], 
                         'C:\',;                                  //[ cDirinicial], 
                         .F.,;                                    //[ lSalvar], 
                         GETF_LOCALHARD  + GETF_NETWORKDRIVE,;    //[ nOpcoes], 
                         .T.)         
    If !MSGYESNO( "Confirma o processamento do arquivo? ", "Confirmação de processo")
        MSGSTOP("processo cancelado pelo usuário!")
        Return
    EndIf
    If !File(cDiret)
        MsgStop("O arquivo " + cDiret + " não foi encontrado. A importação será abortada!","TMIRA255 - ATENÇÃO!")
        Return
    EndIf

    FT_FUSE(cDiret)
    ProcRegua(FT_FLASTREC())
    FT_FGOTOP()
    While !FT_FEOF()
        IncProc("Lendo arquivo texto...")
    
        cLinha := FT_FREADLN()
    
        If lPrimlin
            aCampos := Separa(cLinha,";",.T.)
            lPrimlin := .F.
        Else
            If !(Separa(cLinha, ';', .T.)[1] $ cAux)
                AADD(aDados,Separa(cLinha,";",.T.))
                cAux += aDados[Len(aDados)][1] + '/'
            EndIf
        EndIf
    
        FT_FSKIP()
    EndDo
    
    For i:=1 To Len(aCampos)
        If Alltrim(aCampos[1]) <> "CNPJ"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        ElseIf Alltrim(aCampos[2]) <> "NOME"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        ElseIf Alltrim(aCampos[3]) <> "MUN"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        ElseIf Alltrim(aCampos[4]) <> "EST"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        ElseIf Alltrim(aCampos[5]) <> "PESSOA"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        EndIf
    Next i

    If _lErro
        Return
    Endif        
 
    // Begin Transaction
        ProcRegua(Len(aDados))
        For i := 1 To Len(aDados)

            IncProc("Importando Arquivo...")
            
            DbSelectArea("Z09")
            Z09->(Dbsetorder (1))

            nCount := (aDados[i,1])

            If Alltrim(aDados[i,5]) == "J" 
                cCodCnpj := strzero(Val(aDados[i,1]),14)
                If !Z09->(MsSeek(xFilial() + Left(cCodCnpj,8) + Substr(cCodCnpj,9,4) ))
                    RecLock( "Z09", .T. )
                        Z09->Z09_FILIAL := ""
                        Z09->Z09_CODCLI := Left(cCodCnpj,8)
                        Z09->Z09_LOJCLI := Substr(cCodCnpj,9,4)
                        Z09->Z09_NOME   := Alltrim(aDados[i,2])
                        Z09->Z09_MUN    := Alltrim(aDados[i,3])
                        Z09->Z09_EST    := Alltrim(aDados[i,4])
                        Z09->Z09_VINC   := dDataBase
                        Z09->Z09_Z00001 := cUltObjeto
                    MsUnLock()
                Else
                    // MsgAlert("Cadastro de TDE já existente para o cliente "+ (aDados[i,1])+ "Arquivo não importado!")
                    cErro += "Linha: " + cValToChar(i+1) + " " + aDados[i,1] + CRLF
                    _lRet := .F. 
                    // _lErro := .T.
                    Exit
                EndIf
            ElseIf Alltrim(aDados[i,5]) == "F"
                cCodCnpj := strzero(Val(aDados[i,1]),11)
                If !Z09->(MsSeek(xFilial() + Left(cCodCnpj,8) + Substr(cCodCnpj,9,3) ))
                    RecLock( "Z09", .T. )
                        Z09->Z09_FILIAL := ""
                        Z09->Z09_CODCLI := Left(cCodCnpj,8)
                        Z09->Z09_LOJCLI := Substr(cCodCnpj,9,3)
                        Z09->Z09_NOME   := Alltrim(aDados[i,2])
                        Z09->Z09_MUN    := Alltrim(aDados[i,3])
                        Z09->Z09_EST    := Alltrim(aDados[i,4])
                        Z09->Z09_VINC   := dDataBase
                        Z09->Z09_Z00001 := cUltObjeto
                    MsUnLock()
                Else
                    // MsgAlert("Cadastro de TDE já existente para o cliente "+ (aDados[i,1])+ "Arquivo não importado!")
                    cErro += "Linha: " + cValToChar(i+1) + " " + aDados[i,1] + CRLF
                    _lRet := .F. 
                    // _lErro := .T.
                    Exit
                EndIf
            Else
                MsgStop("Erro! Formato do Arquivo invalido! A importação não foi realizada.")
                _lErro := .T.
                Exit
            Endif
        Next i

        Z09->(DBCloseArea())	
        nCount := 0

        If _lErro 
            // DisarmTransaction()
        Endif   

        If !_lRet
            // MsgAlert("Linhas nao importadas: " + CRLF + cErro, "")
            Help(NIL, NIL, "Linhas nao importadas", NIL, cErro, 1, 0, NIL, NIL, NIL, NIL, NIL, {"Verifique as linhas citadas!"})
        EndIf

        If _lRet .AND. !_lErro
            _fGravaArq(cDiret,"1")
            ApMsgInfo("Processo concluído com sucesso!","Sucesso!")
        EndIf
        
    // End Transaction

Return


//-------------------------------------------------------------------
/*/{Protheus.doc} TMIRA255
Exclui registros atraves de arquivo csv
@author  Patricia Negri
@since   15/09/2020
/*/
//-------------------------------------------------------------------

Static Function Exclui()

    Local cDiret    := ""
    Local cLinha    := ""
    Local lPrimlin  := .T.
    Local aCampos 	:= {}
    Local aDados  	:= {}
    Local i         := 0
    Local _lErro    := .F.

    Private aErro := {}

    cDiret :=  cGetFile( 'Arquito CSV|*.csv| Arquivo TXT|*.txt| Arquivo XML|*.xml',; //[ cMascara], 
                            'Selecao de Arquivos',;                  //[ cTitulo], 
                            0,;                                      //[ nMascpadrao], 
                            'C:\',;                                  //[ cDirinicial], 
                            .F.,;                                    //[ lSalvar], 
                            GETF_LOCALHARD  + GETF_NETWORKDRIVE,;    //[ nOpcoes], 
                            .T.)         
        If !MSGYESNO( "Confirma o processamento do arquivo? ", "Confirmação de processo")
            MSGSTOP("processo cancelado pelo usuário!")
            Return
        EndIf
            If !File(cDiret)
                MsgStop("O arquivo " + cDiret + " não foi encontrado. A importação será abortada!","TMIRA254 - ATENÇÃO!")
                Return
            EndIf
                    
    FT_FUSE(cDiret)
    ProcRegua(FT_FLASTREC())
    FT_FGOTOP()
    While !FT_FEOF()
    
        IncProc("Lendo arquivo texto...")
    
        cLinha := FT_FREADLN()
    
        If lPrimlin
            aCampos := Separa(cLinha,";",.T.)
            lPrimlin := .F.
        Else
            AADD(aDados,Separa(cLinha,";",.T.))
        EndIf
    
        FT_FSKIP()
    EndDo
    
    For i:=1 to Len(aCampos)
        If Alltrim(aCampos[1]) <> "CNPJ"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
           _lErro := .T.
           Exit
        ElseIf Alltrim(aCampos[2]) <> "NOME"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
           _lErro := .T.
           Exit
        ElseIf Alltrim(aCampos[3]) <> "MUN"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
           _lErro := .T.
           Exit
        ElseIf Alltrim(aCampos[4]) <> "EST"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
           _lErro := .T.
           Exit
        ElseIf Alltrim(aCampos[5]) <> "PESSOA"
            MsgStop("Erro! Arquivo selecionado fora do padrão!Verifique.")
            _lErro := .T.
            Exit
        Endif 
    Next i

    If _lErro
        Return
    EndIf   
 
    Begin Transaction
        ProcRegua(Len(aDados))
        For i:=1 to Len(aDados)
    
            IncProc("Importando Arquivo...")
            
            DbSelectArea("Z09")
            Z09->(Dbsetorder (1))
                
            If Alltrim(aDados[i,5]) == "J"
                If Z09->(MsSeek(xFilial() + Alltrim(Left(aDados[i,1],8)) + Alltrim(Substr(aDados[i,1],9,4)) ))
                    RecLock( "Z09", .F. )
                    dbDelete()
                    MsUnLock()
                Else
                    MsgAlert("Cliente "+ (aDados[i,1])+ " não possui TDE. Arquivo não importado!")
                    _lRet := .F. 
                    lErro    := .T.
                    Exit
                EndIf
                    DbSelectArea("SA1")
                    SA1->(Dbsetorder (1))
                    If SA1->(MsSeek(xFilial() + Alltrim(Left(aDados[i,1],8)) + Alltrim(Substr(aDados[i,1],9,4)) ))
                        RecLock("SA1",.F.)
                        SA1->A1_TDA     := "2"
                        MsUnLock()
                    EndIf
            ElseIf Alltrim(aDados[i,5]) == "F"
                If Z09->(MsSeek(xFilial() + Alltrim(Left(aDados[i,1],8)) + Alltrim(Substr(aDados[i,1],9,3)) ))
                    RecLock( "Z09", .F. )
                    dbDelete()
                    MsUnLock()
                EndIf
                DbSelectArea("SA1")
                SA1->(Dbsetorder (1))
                If SA1->(MsSeek(xFilial() + Alltrim(Left(aDados[i,1],8)) + Alltrim(Substr(aDados[i,1],9,3)) ))
                    RecLock("SA1",.F.)
                    SA1->A1_TDA     := "2"
                    MsUnLock()
                EndIf
            EndIf
        Next i

        If _lErro 
            DisarmTransaction()
        Endif   

        
    End Transaction

    If !_lErro
        _fGravaArq(cDiret,"2")
        ApMsgInfo("Clientes excluidos com sucesso!","Sucesso!")
    Endif

Return

//-------------------------------------------------------------------
/*/{Protheus.doc} _fGravaArq
Grava arquivo importado para o banco de conhecimento
@author  Patricia Negri
@since   15/09/2020
/*/
//-------------------------------------------------------------------

Static Function _fGravaArq(cDirfile,cTipImp)

    Local cFile      := cDirfile
    Local cUltObjeto := ""                   
    Local cUser      := UsrRetName(RetCodUsr())
    Local cNomeArq   := "" 
    Local cDirServ   := "\dirdoc\co01\shared\"

    If cFile == Nil .Or. cFile == ""
        Return Nil
    EndIf	

    If cTipImp == '1'
        cNomeArq := "ARQ_INC" + "_"+cUser + "_" + GRAVADATA(DDATABASE, .F., 5)+"_"+LEFT(STRTRAN(TIME(),":",""),4) + ".csv"
    Else
        cNomeArq := "ARQ_EXC" + "_"+cUser + "_" + GRAVADATA(DDATABASE, .F., 5)+"_"+LEFT(STRTRAN(TIME(),":",""),4) + ".csv"
    EndIf

    __CopyFile(cFile, cDirServ + cNomeArq)

    cUltObjeto := GetSXENum("ACB","ACB_CODOBJ")		

    ConfirmSX8()

    RecLock("ACB", .T.)
        ACB->ACB_CODOBJ := cUltObjeto
        ACB->ACB_OBJETO := cNomeArq
        ACB->ACB_DESCRI := "IMPORTA ARQ TDE Z09"
    ACB->(MsUnlock())

    DbSelectArea("AC9")

    RecLock("AC9", .T.)
        AC9->AC9_ENTIDA := "Z09"
        AC9->AC9_CODENT := "99999999"+"0000"
        AC9->AC9_CODOBJ := cUltObjeto
    AC9->(MsUnlock())

Return
