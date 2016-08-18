#tag Class
Protected Class CreditCard
Inherits ANetAPI.AbstractPaymentType
	#tag Method, Flags = &h0
		Sub constructor(cc as string, expirationDate as string, optional cvv as string)
		  //@param cc: The credit card number
		  //@param expirationDate: The expiration date for the card in form MMYY
		  //@param cvv: [OPTIONAL] 3-digit code on back of card. Needed if wanting to use authorize.net's Card Code Verification (CCV) security feature
		  
		  mTokenName = kPayWithCCToken
		  self.cc = cc
		  self.expirationDate = expirationDate
		  self.cvv = cvv
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  dim jsonToken as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("cardNumber") = self.cc
		  jsonBody.Value("expirationDate") = self.expirationDate
		  if self.cvv <> "" then 
		    jsonBody.Value("cardCode") = self.cvv
		    
		  end if
		  jsonToken.Value(self.PAY_TYPE) = jsonBody
		  
		  //FORM TOKEN
		  return jsonToken
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cc As string = "creditCard"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cvv As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private expirationDate As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private type As string = "creditCard"
	#tag EndProperty


	#tag Constant, Name = kPayWithCCToken, Type = String, Dynamic = False, Default = \"payment", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PAY_TYPE, Type = Text, Dynamic = False, Default = \"creditCard", Scope = Private
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
