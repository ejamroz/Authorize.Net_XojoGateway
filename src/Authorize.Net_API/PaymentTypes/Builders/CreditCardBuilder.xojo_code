#tag Class
Protected Class CreditCardBuilder
	#tag Method, Flags = &h0
		Function buildCreditCard() As CreditCard
		  return new CreditCard(self) 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCCNumber(ccNumber as String) As CreditCardBuilder
		  self.ccNumber = ccNumber
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCVVCode(cvvCode as String) As CreditCardBuilder
		  self.cvvCode = cvvCode
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setExpirationDate(expirationDate as String) As CreditCardBuilder
		  self.expirationDate = expirationDate
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setTrack2(track2 as string) As CreditCardBuilder
		  self.track2Data = track2
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ccNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		cvvCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		expirationDate As string
	#tag EndProperty

	#tag Property, Flags = &h0
		track2Data As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ccNumber"
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
