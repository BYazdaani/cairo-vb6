Attribute VB_Name = "mConfigReg"
Option Explicit

'///////////////////////////////////////
' ' CONFIGURACION REGIONAL ...
'
'///////////////////////////////////////
' Proposito: Administrar la Configuraci�n

'///////////////////////////////////////
' Autor: Javier Alvarez y YO 8-)
' Fecha de creacion: 14-06-1999
' Fecha de modificacion:

'////////////////////////////////////////////////////////
' OBJETOS PRIVADOS

Public Const csNoDate          As Date = #1/1/1900#

Public Enum csErrores
    csErrorUsuarioInvalido = vbObjectError + 1
    csErrorSepDecimal = vbObjectError + 2
    csErrorSepDecimalConfig = vbObjectError + 3
    csErrorCampoTipoInvalido = vbObjectError + 4
End Enum

Private mSepDecimal As String

Public Sub SetSepDecimal()
    If CInt("1.000") = 1 Then
        mSepDecimal = "."
    ElseIf CInt("1,000") = 1 Then
        mSepDecimal = ","
    End If
    If mSepDecimal = "" Then _
        Err.Raise csErrorSepDecimalConfig, "Configuraci�n", "No se puede determinar cual es el separador decimal. Confirme en el 'panel de control/configuraci�n regional' que los valores de la ficha n�mero coincidan con los valores de la ficha moneda en los campos 'simbolo decimal' y 'simbolo de separaci�n de miles'. "
End Sub

Public Function GetSepDecimal() As String
    SetSepDecimal
    GetSepDecimal = mSepDecimal
End Function


