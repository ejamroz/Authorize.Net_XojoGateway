#tag Class
Protected Class BillingProfile
	#tag Method, Flags = &h0
		Sub constructor(builder as BillingProfileBuilder)
		  mfirstname = builder.firstName
		  mLastName = builder.lastName
		  mAddress = builder.address
		  mCity = builder.city
		  mState = builder.state
		  mZipCode = builder.zipCode
		  mCountry = builder.country
		  mPhoneNumber = builder.phoneNumber
		  mCompanyName = builder.companyName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  if mfirstName <> "" then 
		    jsonBody.value("firstName") = mFirstName
		    
		  end if
		  
		  if mlastName <> "" then 
		    jsonBody.value("lastName") = mLastName
		    
		  end if
		  
		  if mCompanyName <> "" then 
		    jsonBody.value("company") = mCompanyName
		    
		  end if
		  
		  if mAddress <> "" then 
		    jsonBody.value("address") = mAddress
		    
		  end if
		  
		  if mCity <> "" then 
		    jsonBody.value("city") = mCity
		    
		  end if
		  
		  if mState <> "" then 
		    jsonBody.value("state") = mState
		    
		  end if
		  
		  if mZipCode <> "" then 
		    jsonBody.value("zip") = mZipCode
		    
		  end if
		  
		  if mCountry <> "" then 
		    jsonBody.value("country") = mCountry
		    
		  end if
		  
		  if mPhoneNumber <> "" then 
		    jsonBody.value("phoneNumber") = mPhoneNumber
		    
		  end if
		  
		  return jsonBody
		  
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAddress
			  
			End Get
		#tag EndGetter
		address As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCity
			End Get
		#tag EndGetter
		city As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCompanyName
			  
			End Get
		#tag EndGetter
		company As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCountry
			  
			End Get
		#tag EndGetter
		country As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFirstName
			End Get
		#tag EndGetter
		firstName As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastName
			  
			End Get
		#tag EndGetter
		lastName As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAddress As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCity As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCompanyName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCountry As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFirstName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPhoneNumber As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mState As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mZipCode As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPhoneNumber
			  
			End Get
		#tag EndGetter
		pjoneNumber As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mState
			End Get
		#tag EndGetter
		state As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mZipCode
			  
			End Get
		#tag EndGetter
		zip As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="address"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="city"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="company"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="country"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="firstName"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastName"
			Group="Behavior"
			Type="string"
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
			Name="pjoneNumber"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="state"
			Group="Behavior"
			Type="string"
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
		#tag ViewProperty
			Name="zip"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
