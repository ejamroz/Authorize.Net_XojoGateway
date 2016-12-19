#tag Class
Protected Class StoredPaymentProfileBuilder
	#tag Method, Flags = &h0
		Function buildStoredPaymentProfile() As StoredPaymentProfile
		  return new StoredPaymentProfile(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  validationMode = kValidationTest
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setBillingInfo(billingInfo as BillingProfile) As StoredPaymentProfileBuilder
		  self.billingInfo = billingInfo
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCustomerSerial(customerSerial as String) As StoredPaymentProfileBuilder
		  self.customerSerial = customerSerial
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setPaymentProfileSerial(paymentProfileSerial as String) As StoredPaymentProfileBuilder
		  self.paymentProfileSerial = paymentProfileSerial
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setValidationMode(validationMode as String) As StoredPaymentProfileBuilder
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h0
		customerSerial As string
	#tag EndProperty

	#tag Property, Flags = &h0
		paymentProfileSerial As string
	#tag EndProperty

	#tag Property, Flags = &h0
		validationMode As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="customerSerial"
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
