#tag Class
Protected Class CustomerProfile
	#tag Method, Flags = &h0
		Sub constructor(merchSerial as string, custInfo as string, email as string)
		  //@param merchSerial: The merchand assigned ID of this customer
		  //@param custInfo: FirstName LastName|PhoneNumber 
		  //@param email: The customer contact email, where their reciept will be sent
		  //@param payInfo: [OPTIONAL] Payment profile for this customer 
		  //@param billTo: [OPTIONAL] Billing information, this must be provided if payInfo is supplied 
		  
		  merchantSerial = merchSerial
		  description = custInfo
		  self.email = email
		  'paymentInfo = payInfo
		  'self.billTo = billTo
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  // Part of the Tokenizable interface.
		  
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("merchantCustomerId") = merchantSerial
		  jsonBody.Value("description") = description
		  jsonBody.Value("email") = email
		  
		  if billTo <> Nil then
		    jsonBody.Value(billTo.kTokenName) = billTo.getJson()
		    
		  end if
		  
		  'if paymentInfo <> Nil then 
		  'jsonBody.Value(paymentInfo.kTokenNameNonCapAndAuth) = paymentInfo.getJson()
		  '
		  'end if
		  
		  //FORM TOKEN
		  return jsonBody
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private billTo As BillingProfile
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
		Private paymentInfo As PaymentProfile
	#tag EndProperty


	#tag Constant, Name = kTokenName, Type = String, Dynamic = False, Default = \"customer", Scope = Public
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
