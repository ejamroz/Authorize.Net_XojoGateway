#tag Class
Protected Class AbstractProfileRequest
Inherits AbstractRequest
	#tag Method, Flags = &h1
		Protected Sub constructor()
		  mJSONBodyToken= kProfileToken
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCustomerId
			  
			End Get
		#tag EndGetter
		customerId As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCustomerId As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPaymentID As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mValidation As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPaymentID
			End Get
		#tag EndGetter
		paymentProfileID As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValidation
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //This is unsettable from the outside
			  
			End Set
		#tag EndSetter
		validationMode As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="customerId"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="paymentProfileID"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="validationMode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass