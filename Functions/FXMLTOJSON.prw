
/*/{Protheus.doc} fXmlToJson
   @description: 
   @type: Static Function
   @author: Diogo Gasparini
   @OS: 
   @since: 26/01/2024
/*/
Static Function fXmlToJson(oXml, oJson)
    
    Local cLast := ""
    Local oTemp as Object

    If ValType(oJson) == "A"
        aAdd(oJson, JsonObject():New())
    EndIf

    While .T.
        
        If oXml:DOMHasChildNode()
            cLast := oXml:cName
            
            If ValType(oJson[cLast]) == "U"
                oJson[cLast] := JsonObject():New()
            ElseIf ValType(oJson[cLast]) == "J"
                oTemp := oJson[cLast]

                oJson[cLast] := {}

                aAdd(oJson[cLast], oTemp)
            EndIf
            
            oXml:DOMChildNode()

            fXmlToJson(@oXml, @oJson[cLast])

            oXml:DOMPrevNode()

            If cLast != oXml:cName
                oXml:DOMNextNode()
                Exit
            EndIf

            oXml:DOMNextNode()
        Else
            If ValType(oJson) == "A"
                oJson[Len(oJson)][oXml:cName] := oXml:cText
            Else
                oJson[oXml:cName] := oXml:cText
            EndIf

            If oXml:DOMHasNextNode()
                oXml:DOMNextNode()
            Else
                oXml:DOMParentNode()
                If !oXml:DOMNextNode()
                    oXml:DOMParentNode()
                    If !oXml:DOMNextNode()
                        oXml:DOMParentNode()
                    EndIf
                EndIf

                Exit
            EndIf
        EndIf

    EndDo

Return
