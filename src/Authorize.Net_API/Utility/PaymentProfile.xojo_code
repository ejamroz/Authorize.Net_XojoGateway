#tag Class
Protected Class PaymentProfile
	#tag Method, Flags = &h0
		Sub constructor(paymentInfo as AbstractPaymentType)
		  paymentInfo = paymentInfo
		  billingInfo = paymentInfo.getBillingInfo()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  // Part of the Tokenizable interface.
		  
		  dim jsonBody as new JSONItem()
		  
		  jsonBody.Value("billTo") = billingInfo.getJson()
		  jsonBody.Value("payment") = paymentInfo.getJson()
		  
		  return jsonBody
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As AbstractPaymentType
	#tag EndProperty


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
