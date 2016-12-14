#tag Interface
Protected Interface ANetProfileRequest
	#tag Method, Flags = &h0
		Function getCustomerID() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJSON() As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPaymentProfileID() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRequestHeader() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSentinalToken() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getValidationMode() As String
		  
		End Function
	#tag EndMethod


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
End Interface
#tag EndInterface
