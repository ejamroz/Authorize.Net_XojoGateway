#tag Module
Protected Module AuthorizeNetAPI
	#tag Method, Flags = &h0
		Function JSONtoText(json as JSONItem) As Text
		  //@param json: The JSONItem to convert to text
		  //@return: Text representation of the JSONItem
		  
		  return StringToText(json.ToString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Function StringToText(s As String) As Text
		  // Before a String can be converted to Text, it must have a valid encoding
		  // to avoid an exception. If the encoding is not valid, we will hex-encode the string instead.
		  
		  If s.Encoding Is Nil Or Not s.Encoding.IsValidData(s) Then
		    s = EncodeHex(s, True)
		    s = s.DefineEncoding(Encodings.UTF8) // Just to make sure
		    
		  End If
		  
		  Return s.ToText
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = SUCCESS_CODE, Type = Text, Dynamic = False, Default = \"I00001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TX_LIVE, Type = Text, Dynamic = False, Default = \"https://api.authorize.net/xml/v1/request.api", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TX_SANDBOX, Type = Text, Dynamic = False, Default = \"https://apitest.authorize.net/xml/v1/request.api", Scope = Public
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
End Module
#tag EndModule
