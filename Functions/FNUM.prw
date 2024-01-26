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

    Default cAlias := ''
    Default cCampo := ''
    
    If Select(cAlias) == 0
        DbSelectArea(cAlias)
    EndIf

    cNum := GetSxeNum(cAlias, cCampo)

    (cAlias)->(DbSetOrder(1))

    While (cAlias)->(DbSeek(xFilial(cAlias) + cNum))
        ConfirmSX8()
        cNum := GetSxeNum(cAlias, cCampo)
    EndDo

    RollbackSX8()

Return
