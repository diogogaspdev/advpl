#Include 'Totvs.ch'

/*/{Protheus.doc} fRELAT
   @description: Funcao que gera excel de alias passado por parametro
   cAlias - Alias da tabela dos dados a serem extraidos
   cNome - Nome do arquivo final
   cDir - Diretorio para salvar o arquivo
   @type: User Function
   @author: diogogaspdev
   @since: 25/07/2023
/*/
User Function fRELAT(cAlias, cNome, cDir)
    
    Local aCampos := (cAlias)->(DbStruct())
    Local nX      := 0
    Local aRow    := {}
    Local cArq    := ''
    Local lRet    := .F.

    Default cDir := GetTempPath()

    (cAlias)->(DbGoTop())

    oExcel := FWMSEXCEL():New()
    oExcel:AddworkSheet(cNome) 
    oExcel:AddTable(cNome,cNome)

    For nX := 1 To Len(aCampos)
        oExcel:AddColumn( cNome, cNome, aCampos[nX,1] ,1 ,1)
    Next nX

    While (cAlias)->(!EoF())
    
        aRow := {}

        For nX := 1 To Len(aCampos)
            aAdd(aRow, fVerifica((cAlias)->(&(aCampos[nX,1]))))
        Next nX

        oExcel:AddRow( cNome, cNome, aRow )

        (cAlias)->(DbSkip())
        
    EndDo

    cArq := cNome + DToS(dDataBase) + "_" + StrTran(Time(), ':', '-') + ".xml" 

    oExcel:Activate()

    oExcel:GetXMLFile(cArq)

    If __CopyFile(cArq,cDir + cArq)
        oExcelApp := MSExcel():New()
        oExcelApp:WorkBooks:Open(cDir + cArq)
        oExcelApp:SetVisible(.T.)
        oExcelApp:Destroy()
        
        lRet := .T.
    Else
        lRet := .F.
    EndIf

Return lRet

/*/{Protheus.doc} fVerifica
   @description: Verifica o tipo do dado e retorna em caracter
   xVar - Informacao a ser verificada
   @type: Static Function
   @author: diogogaspdev
   @since: 25/07/2023
/*/
Static Function fVerifica(xVar)
    
    Local cRet := ''

    Do Case
    Case ValType(xVar) == 'C'
        cRet := xVar
    Case ValType(xVar) == 'N'
        cRet := cValToChar(xVar)
    Case ValType(xVar) == 'D'
        cRet := DToC(xVar)
    Otherwise
        cRet := ''
    EndCase

Return cRet
