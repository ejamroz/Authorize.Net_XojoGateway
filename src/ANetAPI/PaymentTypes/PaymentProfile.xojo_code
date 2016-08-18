#tag Class
Protected Class PaymentProfile
Inherits ANetAPI.AbstractPaymentType
	#tag Method, Flags = &h0
		Sub constructor(customerID as string, paymentProfileID as string)
		  //@param customerID: The ANet customer serial
		  //@param paymentProfileID: The ANet payment profile ID
		  
		  mTokenName = kPayWithProfileToken
		  customerProfile = customerID
		  self.paymentProfileID = paymentProfileID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem
		  dim containerJSON as new JSONItem
		  
		  jsonBody.Value("customerProfileId") = customerProfile
		  containerJSON.Value("paymentProfileId") = paymentProfileID
		  jsonBody.Value("paymentProfile") = containerJSON
		  
		  return jsonBody
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private customerProfile As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentProfileID As string
	#tag EndProperty


	#tag Constant, Name = kPayWithProfileToken, Type = String, Dynamic = False, Default = \"profile", Scope = Private
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
