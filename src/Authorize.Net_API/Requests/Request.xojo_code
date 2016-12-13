#tag Class
Protected Class Request
	#tag Method, Flags = &h0
		Sub constructor(builder as RequestBuilder)
		  self.mGateway = builder.gateway
		  self.mMessage = builder.message
		  self.mRequestType = builder.requestType
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGateway
			  
			End Get
		#tag EndGetter
		gateway As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMessage
			End Get
		#tag EndGetter
		message As JSONItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGateway As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMessage As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequestType As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRequestType
			End Get
		#tag EndGetter
		requestType As string
	#tag EndComputedProperty


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
			Name="mGateway"
			Group="Behavior"
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
