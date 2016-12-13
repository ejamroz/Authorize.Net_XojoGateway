#tag Class
Protected Class RequestBuilder
	#tag Method, Flags = &h0
		Function createRequest() As Request
		  return new Request(Self) 
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		gateway As string
	#tag EndProperty

	#tag Property, Flags = &h0
		message As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		requestType As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="gateway"
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
