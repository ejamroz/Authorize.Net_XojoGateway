#tag Class
Protected Class CreateCustomerPaymentProfileReq
Inherits AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(custSerial as string, paymentInfo as PaymentSource)
		  super.constructor()
		  requestType = kTypeCreatePaymentProfile
		  requestBodyKey = kPaymentProfileToken
		  requestHeaderKey = kCreateCustomerPaymentProfileHeader
		  aNetCustomerID = custSerial
		  self.paymentInfo = paymentInfo
		  validationMode = paymentInfo.getValidationMode()
		  billingInfo = paymentInfo.getBillingInfo()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  if billingInfo <> Nil then
		    jsonBody.Value("billTo") = billingInfo.getJson
		    
		  end if
		  jsonBody.Value("payment") = paymentInfo.getJson
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As PaymentSource
	#tag EndProperty


	#tag Constant, Name = kPaymentProfileToken, Type = String, Dynamic = False, Default = \"paymentProfile", Scope = Private
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
