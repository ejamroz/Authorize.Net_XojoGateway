#tag Class
Protected Class CustomerProfile
	#tag Method, Flags = &h0
		Sub constructor(builder as CustomerProfileBuilder)
		  merchantSerial = builder.merchantSerial
		  description = builder.description
		  email = builder.email
		  billingInfo = builder.billingInfo
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  jsonBody.Value("merchantCustomerId") = merchantSerial
		  jsonBody.Value("description") = description
		  jsonBody.Value("email") = email
		  
		  if billingInfo <> Nil then
		    jsonBody.Value("billTo") = billingInfo.getJson()
		    
		  end if
		  
		  //TODO: ADD PAYMENT PROFILE 
		  
		  return jsonBody
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private description As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private email As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private merchantSerial As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentInfo As PaymentSource
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
