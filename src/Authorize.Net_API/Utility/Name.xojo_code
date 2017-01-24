#tag Class
Protected Class Name
	#tag Method, Flags = &h0
		Sub constructor()
		  mfirstName = ""
		  mlastName = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(firstName as string, lastName as string)
		  mfirstName = firstName
		  mlastName = lastName
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFirstName
			End Get
		#tag EndGetter
		firstname As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mFirstName <> "" and mLastName <> "" then
			    return mFirstName + " " + mLastName
			    
			  elseif mFirstName <> "" then 
			    return mFirstName
			    
			  elseif mLastName <> "" then
			    return mLastName
			    
			  else
			    return "New Customer"
			    
			  end if
			End Get
		#tag EndGetter
		fullName As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastName
			  
			End Get
		#tag EndGetter
		lastname As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFirstName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastName As String
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
			Name="mFirstName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLastName"
			Group="Behavior"
			Type="String"
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
