#tag Class
Protected Class ProfileResponse
Inherits AbstractResponse
	#tag Method, Flags = &h0
		Sub constructor(dataJson as xojo.Core.Dictionary)
		  super.constructor(dataJson)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPaymentIDs() As Text()
		  dim ids() as Text
		  dim values() as auto = self.data.Value("customerPaymentProfileIdList")
		  
		  for each item as auto in values 
		    ids.Append(item)
		    
		  next
		  
		  return ids
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim builder as new BillingProfileBuilder(customerName)
			  return builder._
			  setAddress(data.Lookup("address", ""))._
			  setCity(data.Lookup("city", ""))._
			  setState(data.Lookup("state", ""))._
			  setZipCode(data.Lookup("zip", ""))._
			  setCountry(data.Lookup("country", ""))._
			  setPhoneNumber(data.Lookup("phoneNumber", ""))._
			  setCompany(data.Lookup("company", ""))._
			  createBillingProfile()
			End Get
		#tag EndGetter
		BillingInfo As BillingProfile
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new Name(data.Lookup("firstName", ""), data.Lookup("lastName", "")) 
			End Get
		#tag EndGetter
		customerName As Name
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("customerProfileId", "")
			End Get
		#tag EndGetter
		customerProfileID As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return StringToText(right(data.Lookup("cardNumber", ""), 4))
			End Get
		#tag EndGetter
		lastFour As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return data.Lookup("customerPaymentProfileId", "")
			End Get
		#tag EndGetter
		paymentProfileId As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="customerProfileID"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="errorMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastErrorCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastFour"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="paymentProfileId"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
