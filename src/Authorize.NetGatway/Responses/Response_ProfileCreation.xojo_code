#tag Class
Protected Class Response_ProfileCreation
Inherits AuthorizeNetAPI.ANetResponse_
	#tag Method, Flags = &h0
		Sub constructor(dataJson as xojo.Core.Dictionary)
		  //@param json: Object representing JSON string. This method currently accepts JSONItems and Xojo.Core.Dictionaries
		  
		  super.constructor(dataJson)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPaymentIDs() As Text()
		  //@return: An array containing the ID's associated with all payment profiles associated with
		  //    the customer profile that this corresponds to 
		  using Xojo.Core
		  
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
			  return self.data.Lookup("customerProfileId", "")
			End Get
		#tag EndGetter
		ProfileID As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="errorMessage"
			Group="Behavior"
			Type="Text"
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
			Type="text"
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
			Name="ProfileID"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusCode"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="Text"
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
