#tag Class
Protected Class CreateCustomerPaymentProfileReq
Inherits ANetAPI.AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(custSerial as text, paymentInfo as ANetAPI.AbstractPaymentType, billingInfo as ANetAPI.Utility.BillingProfile, validationMode as Text)
		  //@param custSerial: The Anet customer profile id
		  //@param billingInfo: The billing information for the payment method provided
		  //@param paymentInfo: Information regarding payment, currently only CC's are accepted
		  //@param validationMode: The level of validation required for the payment provided
		  
		  super.constructor()
		  mType = kTypeCreatePaymentProfile
		  mToken = kPaymentProfileToken
		  mCustomerId = custSerial
		  self.billingInfo = billingInfo
		  self.paymentInfo = paymentInfo
		  self.validationMode = validationMode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("billTo") = billingInfo.getJson
		  jsonBody.Value("payment") = paymentInfo.getJson
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As ANetAPI.Utility.BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As ANetAPI.AbstractPaymentType
	#tag EndProperty


	#tag Constant, Name = kPaymentProfileToken, Type = Text, Dynamic = False, Default = \"paymentProfile", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="billingInfo"
			Group="Behavior"
			Type="Integer"
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