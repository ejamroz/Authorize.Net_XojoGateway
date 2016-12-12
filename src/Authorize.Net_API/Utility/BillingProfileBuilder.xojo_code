#tag Class
Protected Class BillingProfileBuilder
	#tag Method, Flags = &h0
		Sub constructor(theName as Name)
		  self.firstName = theName.firstName
		  self.lastName = theName.lastName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function createBillingProfile() As BillingProfile
		  return new BillingProfile(self) 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setAddress(address as String) As BillingProfileBuilder
		  self.address = address
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCity(city as String) As BillingProfileBuilder
		  self.city = city
		  return self
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCompany(companyName as String) As BillingProfileBuilder
		  self.companyName = companyName
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setCountry(country as String) As BillingProfileBuilder
		  self.country = country
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setPhoneNumber(phoneNumber as String) As BillingProfileBuilder
		  self.phoneNumber = phoneNumber
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setState(state as String) As BillingProfileBuilder
		  self.state = state
		  return self 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setZipCode(zipCode as String) As BillingProfileBuilder
		  self.zipCode = zipCode
		  return self 
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		address As String
	#tag EndProperty

	#tag Property, Flags = &h0
		city As string
	#tag EndProperty

	#tag Property, Flags = &h0
		companyName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		country As string
	#tag EndProperty

	#tag Property, Flags = &h0
		firstName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		lastName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		phoneNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		state As string
	#tag EndProperty

	#tag Property, Flags = &h0
		zipCode As string
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
