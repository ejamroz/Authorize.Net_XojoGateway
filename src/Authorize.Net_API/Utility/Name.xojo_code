#tag Class
Protected Class Name
	#tag Method, Flags = &h0
		Sub constructor(firstName as string, lastName as string)
		  self.firstName = firstName
		  self.lastName = lastName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toString() As String
		  return firstName + " " + lastName
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		firstName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		lastName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="firstName"
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
