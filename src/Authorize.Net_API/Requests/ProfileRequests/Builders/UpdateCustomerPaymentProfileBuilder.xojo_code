#tag Class
Protected Class UpdateCustomerPaymentProfileBuilder
	#tag Method, Flags = &h0
		Function buildRequest() As UpdateCustomerPaymentProfileReq
		  return new UpdateCustomerPaymentProfileReq(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(customerID as string, paymentProfileID as string)
		  self.customerID = customerID
		  self.paymentProfileId = paymentProfileID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setBillingInfo(billingInfo as BillingProfile) As UpdateCustomerPaymentProfileBuilder
		  self.paymentInfo = paymentInfo
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setPaymentInfo(paymentInfo as AbstractPaymentType) As UpdateCustomerPaymentProfileBuilder
		  self.paymentInfo = paymentInfo
		  return self 
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		billingInfo As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h0
		customerID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		paymentInfo As AbstractPaymentType
	#tag EndProperty

	#tag Property, Flags = &h0
		paymentProfileId As string
	#tag EndProperty


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
