#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1108742143
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Run Tx"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   410
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Inconsolata-dz for Powerline"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   307
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Xojo.Net.Httpsocket aNetSocket
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin TextArea TextArea1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   275
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Inconsolata-dz for Powerline"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   244
   End
   Begin TextArea TextArea2
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   275
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   336
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Inconsolata-dz for Powerline"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   244
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Convert To Dict"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   77
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Inconsolata-dz for Powerline"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   307
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "getContents"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   260
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   360
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Using Xojo.Core
		  Using Xojo.Data
		  using xojo.Net
		  using Xojo.IO
		  
		  dim s as string
		  dim content as text
		  dim f as folderitem = Xojo.IO.SpecialFolder.Documents.Child("output.txt")
		  
		  if f <> nil and f.Exists then 
		    's = "<createTransactionRequest xmlns=" + chr(34) + "AnetApi/xml/v1/schema/AnetApiSchema.xsd" + chr(34) + "><merchantAuthentication><name>5g7W2Waks</name><transactionKey>3g43A42jEa3J5Dw9</transactionKey></merchantAuthentication><refId>123456</refId><transactionRequest><transactionType>authCaptureTransaction</transactionType><amount>5</amount><payment><creditCard><cardNumber>5424000000000015</cardNumber><expirationDate>1220</expirationDate><cardCode>999</cardCode></creditCard></payment><order><invoiceNumber>INV-12345</invoiceNumber><description>Product Description</description></order><lineItems><lineItem><itemId>1</itemId><name>vase</name><description>Cannes logo </description><quantity>18</quantity><unitPrice>45.00</unitPrice></lineItem></lineItems><tax><amount>4.26</amount><name>level2 tax name</name><description>level2 tax</description></tax><duty><amount>8.55</amount><name>duty name</name><description>duty description</description></duty><shipping><amount>4.26</amount><name>level2 tax name</name><description>level2 tax</description></shipping><poNumber>456654</poNumber><customer><id>99999456654</id></customer><billTo><firstName>Ellen</firstName><lastName>Johnson</lastName><company>Souveniropolis</company><address>14 Main Street</address><city>Pecan Springs</city><state>TX</state><zip>44628</zip><country>USA</country></billTo><shipTo><firstName>China</firstName><lastName>Bayles</lastName><company>Thyme for Tea</company><address>12 Main Street</address><city>Pecan Springs</city><state>TX</state><zip>44628</zip><country>USA</country></shipTo><customerIP>192.168.1.1</customerIP><!-- Uncomment this section for Card Present Sandbox Accounts --><!-- <retail><marketType>2</marketType><deviceType>1</deviceType></retail> --><transactionSettings><setting><settingName>testRequest</settingName><settingValue>false</settingValue></setting></transactionSettings><userFields><userField><name>MerchantDefinedFieldName1</name><value>MerchantDefinedFieldValue1</value></userField><userField><name>favorite_color</name><value>blue</value></userField></userFields></transactionRequest></createTransactionRequest>"
		    's = DefineEncoding(s, Encodings.UTF8)
		    
		    Dim data As Dictionary = ParseJSON(self.TextArea1.Text.ToText)
		    
		    ' Convert to JSON text
		    Dim json As Text
		    json = GenerateJSON(data)
		    Dim data1 As MemoryBlock = TextEncoding.UTF8.ConvertTextToData(json)
		    
		    self.aNetSocket.SetRequestContent(data1, "application/x-www-form-urlencoded")
		    self.aNetSocket.Send("POST", "https://apitest.authorize.net/xml/v1/request.api", f)
		    
		  end if 
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events aNetSocket
	#tag Event
		Sub Error(err as RuntimeException)
		  MsgBox "SHIT"
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  Using Xojo.Core
		  Using Xojo.IO
		  
		  Dim errorText As Text
		  Try
		    dim temp as new FolderItem(file.Path)
		    Dim input as TextInputStream
		    input = TextInputStream.Open(temp, Xojo.Core.TextEncoding.UTF8)
		    dim contents as text = input.ReadAll()
		    
		    Self.TextArea2.Text = contents
		    input.Close()
		  Catch e As IOException
		    errorText = "File IO Error: " + e.Reason
		    MsgBox errorText
		  End Try
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SendProgress(BytesSent as Int64, BytesLeft as Int64)
		  dim x as integer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Using Xojo.Data
		  Using Xojo.Core
		  
		  Dim data As Dictionary = ParseJSON(self.TextArea1.Text.ToText)
		  
		  for each key as DictionaryEntry in data
		    self.TextArea2.Text = self.TextArea2.Text + key.Key + chr(10)
		    
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Using Xojo.Core
		  Using Xojo.IO
		  
		  Dim errorText As Text
		  Try
		    dim temp as FolderItem = SpecialFolder.Documents.Child("output.txt")
		    
		    Dim input as TextInputStream
		    input = TextInputStream.Open(temp, Xojo.Core.TextEncoding.UTF8)
		    dim contents as text = input.ReadAll()
		    Self.TextArea2.Text = contents
		    input.Close()
		  Catch e As IOException
		    errorText = "File IO Error: " + e.Reason
		    MsgBox errorText
		  End Try
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
