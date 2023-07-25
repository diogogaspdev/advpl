#Include 'Totvs.ch'

/*/{Protheus.doc} fTela
   @description: 
   @type: User Function
   @author: diogogaspdev
   @since: 25/07/2023
/*/
User Function fTela()
    
    Private cGet1    := ""
    Private cMultG1  := ""
    Private cCombBx1 := ""
    Private aList1   := {}
    Private lCheck1  := .F.

    Private oOk := LoadBitmap(GetResources(), "br_verde")
    Private oNo := LoadBitmap(GetResources(), "br_vermelho")

    Private oFont1 := TFont():New( 'Arial' /*cName*/,, 15 /*nHeight*/,, .F. /*lBold*/,,,,, .F. /*lUnderline*/, .F. /*lItalic*/ )

    Private oDlg     As Object
    Private oGet1    As Object
    Private oGrp1    As Object
    Private oBrowse1 As Object
    Private oBtn1    As Object
    Private oSay1    As Object
    Private oCheck1  As Object
    Private oMultG1  As Object
    Private oCombBx1 As Object

    aAdd(aList1, {.T., ''})
    aAdd(aList1, {.F., ''})

    oDlg := MsDialog():New( 0 /*nTop*/, 0 /*nLeft*/, 590 /*nBottom*/, 1300 /*nRight*/, /*cTitulo*/,,,,, /*nClrText*/, /*nClrBack*/,, /*oWnd*/, .T. /*lPixel*/,,,, /*lTransparent*/ )

        oGet1 := TGet():New( 10 /*nRow*/, 10 /*nCol*/, {|u| if( Pcount()>0, cGet1 := u, cGet1) } /*bSetGet*/, oDlg /*oWnd*/, 100 /*nWidth*/, 10 /*nHeight*/, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, /*oFont*/,,, .T. /*lPixel*/,,, /*bWhen*/,,, /*bChange*/, /*lReadOnly*/, /*lPassword*/,, /*cReadVar*/,,,, /*lHasButton*/, /*lNoButton*/,, 'cGet1' /*cLabelText*/, /*nLabelPos*/, /*oLabelFont*/, /*nLabelColor*/, 'cGet1' /*cPlaceHold*/, /*lPicturePriority*/, /*lFocSel*/ )

        oGrp1 := TGroup():New( 146 /*nTop*/, 10 /*nLeft*/, 290 /*nBottom*/, 640 /*nRight*/, 'oGrp1' /*cCaption*/, oDlg /*oWnd*/, /*nClrText*/, /*nClrPane*/, .T. /*lPixel*/, )

            oBrowse1 := TCBrowse():New( 152 /*nRow*/, 12 /*nCol*/, 626 /*nWidth*/, 136 /*nHeight*/, /*bLine*/, {'', ''} /*aHeaders*/, /*aColSizes*/, oGrp1 /*oWnd*/, /*cField*/, /*uValue1*/, /*uValue2*/, /*bChange*/, /*bLDblClick*/, /*bRClicked*/, oFont1 /*oFont*/, /*oCursor*/, /*nClrFore*/, /*nClrBack*/, /*cMsg*/,, /*cAlias*/, .T. /*lPixel*/, /*bWhen*/,, /*bValid*/, /*lHScroll*/, /*lVScroll*/ )

            oBrowse1:SetArray(aList1)
                oBrowse1:bLine := {||{;
                If(aList1[oBrowse1:nAt,01], oOK, oNo),;
                aList1[oBrowse1:nAt,02],;
            }}

        oBtn1 := TButton():New( 10 /*nRow*/, 150 /*nCol*/, 'oBtn1' /*cCaption*/, oDlg /*oWnd*/, /*bAction*/, 50 /*nWidth*/, 12 /*nHeight*/,, oFont1 /*oFont*/,, .T. /*lPixel*/,,,, /*bWhen*/,, )

        oSay1 := TSay():New( 10 /*nRow*/, 210 /*nCol*/, {|| 'oSay1'} /*bText*/, oDlg /*oWnd*/, /*cPicture*/, oFont1 /*oFont*/,,,, .T. /*lPixels*/, /*nClrText*/, /*nClrBack*/, 50 /*nWidth*/, 12 /*nHeight*/,,,,,, /*lHTML*/, /*nTxtAlgHor*/, /*nTxtAlgVer*/ )

        oCheck1 := TCheckBox():New( 10 /*nRow*/, 240 /*nCol*/, 'oCheck1' /*cCaption*/, {|u|If(Pcount()>0,lCheck1:=u,lCheck1)} /*bSetGet*/, oDlg /*oWnd*/, 10 /*nWidth*/, 10 /*nHeight*/,, /*bLClicked*/, oFont1 /*oFont*/, /*bValid*/, /*nClrText*/, /*nClrPane*/,, .T. /*lPixel*/, 'oCheck1' /*cMsg*/,, /*bWhen*/ )

        oMultG1 := TMultiGet():New( 10 /*nRow*/, 300 /*nCol*/, {|u| If(Pcount()>0,cMultG1:=u,cMultG1)} /*bSetGet*/, oDlg /*oWnd*/, 100 /*nWidth*/, 100 /*nHeight*/, oFont1 /*oFont*/,,,,, .T. /*lPixel*/,,, /*bWhen*/,,, /*lReadOnly*/, /*bValid*/,,, /*lNoBorder*/, /*lVScroll*/, 'oMultGet1' /*cLabelText*/, /*nLabelPos*/, /*oLabelFont*/, /*nLabelColor*/ )

        oCombBx1 := TComboBox():New( 10 /*nRow*/, 360 /*nCol*/, {|u|if(Pcount()>0,cCombBx1:=u,cCombBx1)} /*bSetGet*/, {'S=Sim', 'N=Nao'} /*nItens*/, 100 /*nWidth*/, 10 /*nHeight*/, oDlg /*oWnd*/,, /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, .T. /*lPixel*/, /*oFont*/,,, /*bWhen*/,,,,, /*cReadVar*/, 'oCombBx1' /*cLabelText*/, /*nLabelPos*/, /*oLabelFont*/, /*nLabelColor*/ )

    oDlg:Activate( ,,, .T. /*lCentered*/, /*bValid*/,, /*bInit*/,, )"

Return
