#tag Class
Protected Class BillingProfile
Implements Tokenizable
	#tag Method, Flags = &h0
		Sub constructor(first as string, last as string, address as string, city as string, state as string, zip as string, country as string, phone as string, optional company as string)
		  //Creates a customer billing profile
		  //@param first: Customer first name
		  //@param last: customer last name
		  //@param address: customer address
		  //@param city: address city
		  //@param state: address state
		  //@param zip: address zip code
		  //@param country: address country
		  //@param phone: customer phone number 
		  //@param company: [OPTIONAL] customer company name
		  
		  self.firstname = first
		  self.lastName = last
		  self.address = address
		  self.city = city
		  self.state = state
		  self.zipCode = zip
		  self.country = country
		  self.phoneNumber = phone
		  self.companyName = company
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  Using Xojo.Core
		  
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.value("firstName") = self.firstName
		  jsonBody.value("lastName") = self.lastName
		  jsonBody.value("company") = self.companyName
		  jsonBody.value("address") = self.address
		  jsonBody.value("city") = self.city
		  jsonBody.value("state") = self.state
		  jsonBody.value("zip") = self.zipCode
		  jsonBody.value("country") = self.country
		  jsonBody.value("phoneNumber") = self.phoneNumber
		  
		  //FORM TOKEN
		  return jsonBody
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private address As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private city As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private companyName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private country As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private firstName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private phoneNumber As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private state As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zipCode As string
	#tag EndProperty


	#tag Constant, Name = TOKEN_NAME, Type = String, Dynamic = False, Default = \"billTo", Scope = Public
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
