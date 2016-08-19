#tag Class
Protected Class AbstractRequest
	#tag Method, Flags = &h21
		Private Sub constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  return new JSONItem() //return an empty item 
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mToken As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mType
			  
			End Get
		#tag EndGetter
		requestType As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mToken
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //This property can not be set from the outside
			End Set
		#tag EndSetter
		sentinalToken As string
	#tag EndComputedProperty


	#tag Constant, Name = kBillToken, Type = String, Dynamic = False, Default = \"billTo", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPayToken, Type = String, Dynamic = False, Default = \"payment", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kProfileToken, Type = String, Dynamic = False, Default = \"profile", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRequestToken, Type = String, Dynamic = False, Default = \"transactionRequest", Scope = Protected
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
