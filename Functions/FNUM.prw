#Include "Protheus.ch"
#Include "Totvs.ch"

#Include 'Totvs.ch'

/*/{Protheus.doc} fNum
   @description: corrige numeracao da tabela
   @type: User Function
   @author: Diogo Gasparini
   @OS: 
   @since: 01/08/2023
/*/
User Function FNUM(cAlias, cCampo)
    
    Local cNum := ''
    
    If Select(cAlias) == 0
        DbSelectArea(cAlias)
    EndIf

    cNum := GetSxeNum(cAlias, cCampo)

    DA4->(DbSetOrder(1))

    While DA4->(DbSeek(xFilial("DA4") + cNum))
        ConfirmSX8()
        cNum := GetSxeNum(cAlias, cCampo)
    EndDo

    RollbackSX8()

Return
