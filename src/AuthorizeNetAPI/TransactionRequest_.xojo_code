#tag Class
Protected Class TransactionRequest_
Implements Tokenizable
	#tag Method, Flags = &h21
		Private Sub constructor()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  return new JSONItem()
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		This is an abstract super class for all transaction types. It can not be instantiated
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected type As string
	#tag EndProperty


	#tag Constant, Name = AUTH_AND_CAPTURE, Type = Text, Dynamic = False, Default = \"authCaptureTransaction", Scope = Protected
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
