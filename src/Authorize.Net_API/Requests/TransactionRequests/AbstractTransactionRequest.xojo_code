#tag Class
Protected Class AbstractTransactionRequest
Inherits AbstractRequest
Implements ANetTransactionRequest
	#tag Method, Flags = &h1
		Protected Sub constructor()
		  mJSONBodyToken= kRequestToken
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

	#tag Method, Flags = &h0
		Function getJSON() As JSONItem
		  // Part of the ANetTransactionRequest interface.
		  
		  return new JSONItem()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRequestHeader() As String
		  // Part of the ANetTransactionRequest interface.
		  
		  return mRequestHeader
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSentinalToken() As String
		  // Part of the ANetTransactionRequest interface.
		  
		  return mJSONBodyToken
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		This is an abstract super class for all transaction types. It can not be instantiated
		
	#tag EndNote


	#tag Constant, Name = kTxRequestHeader, Type = String, Dynamic = False, Default = \"createTransactionRequest", Scope = Protected
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
			Name="requestType"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
