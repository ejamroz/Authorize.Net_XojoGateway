#tag Class
Protected Class CreateCustomerProfileReq
Inherits ANetAPI.AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(custInfo as ANetAPI.Utility.CustomerProfile,validation as string)
		  super.constructor()
		  self.mType = kTypeCreateCustomerProfile
		  customerInfo = custInfo
		  mValidation = validationMode
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  return customerInfo.getJson()
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private customerInfo As ANetAPI.Utility.CustomerProfile
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
			Name="sentinalToken"
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
		#tag ViewProperty
			Name="validationMode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
