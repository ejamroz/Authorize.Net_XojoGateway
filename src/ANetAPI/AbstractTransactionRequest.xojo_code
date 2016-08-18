#tag Class
Protected Class AbstractTransactionRequest
Inherits ANetAPI.AbstractRequest
	#tag Method, Flags = &h1
		Protected Sub constructor()
		  mToken = kRequestToken
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function generateProfile() As JSONItem
		  //Creates the necessary json for saving a profile during a tx
		  
		  dim json as new JSONItem()
		  
		  json.Value("createProfile") = "true"
		  
		  return json
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		This is an abstract super class for all transaction types. It can not be instantiated
		
	#tag EndNote


	#tag Constant, Name = kPayToken, Type = Text, Dynamic = False, Default = \"payment", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sentinalToken"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
