#tag Class
Protected Class UpdateCustomerPaymentProfileReq
Inherits AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(customerID as string, paymentProfileId as string, paymentInfo as PaymentSource)
		  super.constructor()
		  requestType = kTypeUpdateCustomerPaymentProfile
		  requestBodyKey= kPaymentProfileToken
		  requestHeaderKey = kUpdateCustomerPaymentProfileRequestHeader
		  aNetCustomerID = customerID
		  customerPaymentProfileID = paymentProfileId
		  self.paymentInfo = paymentInfo
		  billingInfo = paymentInfo.getBillingInfo()
		  validationMode = paymentInfo.getValidationMode()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  if billingInfo <> Nil then 
		    jsonBody.Value("billTo") = billingInfo.getJson
		    
		  end if
		  
		  if paymentInfo <> Nil then 
		    jsonBody.Value("payment") = paymentInfo.getJson
		    
		  end if
		  
		  jsonBody.Value("customerPaymentProfileId") = customerPaymentProfileID
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is a private inaccessable version of mPaymentID
		#tag EndNote
		Private customerPaymentProfileID As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As PaymentSource
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
