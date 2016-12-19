#tag Class
Protected Class AbstractProfileRequest
Inherits AbstractRequest
Implements ANetProfileRequest
	#tag Method, Flags = &h1
		Protected Sub constructor()
		  requestBodyKey= kProfileToken
		  validationMode = kValidationNone
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getCustomerID() As String
		  // Part of the ANetProfileRequest interface.
		  
		  return aNetCustomerID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJSON() As JSONItem
		  // Part of the ANetProfileRequest interface.
		  
		  return new JSONItem()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getpaymentProfileID() As String
		  return paymentProfileSerial
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRequestHeader() As String
		  // Part of the ANetProfileRequest interface.
		  
		  return requestHeaderKey
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSentinalToken() As String
		  // Part of the ANetProfileRequest interface.
		  
		  return requestBodyKey
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getValidationMode() As String
		  // Part of the ANetProfileRequest interface.
		  
		  return validationMode
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected aNetCustomerID As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected paymentProfileSerial As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected validationMode As string
	#tag EndProperty


	#tag Constant, Name = kCreateCustomerPaymentProfileHeader, Type = String, Dynamic = False, Default = \"createCustomerPaymentProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCreateCustomerProfileHeader, Type = String, Dynamic = False, Default = \"createCustomerProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCreateCustProfileFromTxHeader, Type = String, Dynamic = False, Default = \"createCustomerProfileFromTransactionRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeleteCustomerRequestHeader, Type = String, Dynamic = False, Default = \"deleteCustomerProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeletePaymentProfileRequestHeader, Type = String, Dynamic = False, Default = \"deleteCustomerPaymentProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kGetCustomerPaymentProfileHeader, Type = String, Dynamic = False, Default = \"getCustomerPaymentProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUpdateCustomerPaymentProfileRequestHeader, Type = String, Dynamic = False, Default = \"updateCustomerPaymentProfileRequest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUpdateCustomerProfileHeader, Type = String, Dynamic = False, Default = \"updateCustomerPaymentProfileRequest", Scope = Protected
	#tag EndConstant


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
