#tag Class
Protected Class UpdateCustomerPaymentProfileReq
Inherits ANetAPI.AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(custSerial as string, paymentSerial as string, paymentInfo as ANetAPI.AbstractPaymentType, billingInfo as ANetAPI.Utility.BillingProfile, validationMode as string)
		  //@param custSerial: ANet customer ID
		  //@param paymentSerial: ANet payment profile ID
		  //@param billingInfo: The billing information for the payment method provided
		  //@param paymentInfo: Information regarding payment, currently only CC's are accepted
		  //@param validationMode: The level of validation required for the payment provided
		  
		  super.constructor()
		  mType = kTypeUpdateCustomerPaymentProfile
		  mJSONBodyToken= kPaymentProfileToken
		  mCustomerId = custSerial
		  self.billingInfo = billingInfo
		  self.paymentInfo = paymentInfo
		  mValidation = validationMode
		  mCustomerPaymentProfile = paymentSerial
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("billTo") = billingInfo.getJson
		  jsonBody.Value("payment") = paymentInfo.getJson
		  jsonBody.Value("customerPaymentProfileId") = mCustomerPaymentProfile
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As ANetAPI.Utility.BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is a private inaccessable version of mPaymentID
		#tag EndNote
		Private mCustomerPaymentProfile As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As ANetAPI.AbstractPaymentType
	#tag EndProperty


	#tag Constant, Name = kPaymentProfileToken, Type = String, Dynamic = False, Default = \"paymentProfile", Scope = Private
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
