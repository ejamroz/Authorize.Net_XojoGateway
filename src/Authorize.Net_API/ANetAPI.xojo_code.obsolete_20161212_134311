#tag Module
Protected Module ANetAPI
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
		    s = s.DefineEncoding(Encodings.UTF8) // Just to make sure
		    
		  End If
		  
		  Return s.ToText
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kTxLive, Type = String, Dynamic = False, Default = \"https://api.authorize.net/xml/v1/request.api", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTxSandbox, Type = String, Dynamic = False, Default = \"https://apitest.authorize.net/xml/v1/request.api", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeAuthAndCapture, Type = String, Dynamic = False, Default = \"authCaptureTransaction", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeCreateCustomerProfile, Type = String, Dynamic = False, Default = \"CreateCustomerProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeCreatePaymentProfile, Type = String, Dynamic = False, Default = \"CreatePaymentProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeCreateProfileFromTx, Type = String, Dynamic = False, Default = \"createCustomerProfileFromTransaction", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeDeleteCustomerProfile, Type = String, Dynamic = False, Default = \"deleteCustomerProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeDeletePaymentProfile, Type = String, Dynamic = False, Default = \"deletePaymentProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeGetCustomerPaymentPRofile, Type = String, Dynamic = False, Default = \"getCustomerPaymentProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeRefund, Type = String, Dynamic = False, Default = \"refundTransaction", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeUpdateCustomerPaymentProfile, Type = String, Dynamic = False, Default = \"UpdateCustomerPaymentProfile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeVoidTransaction, Type = String, Dynamic = False, Default = \"voidTransaction", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kValidationLive, Type = String, Dynamic = False, Default = \"liveMode", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kValidationNone, Type = String, Dynamic = False, Default = \"none", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kValidationTest, Type = String, Dynamic = False, Default = \"testMode", Scope = Public
	#tag EndConstant


	#tag Using, Name = Xojo.Core
	#tag EndUsing

	#tag Using, Name = Xojo.Data
	#tag EndUsing


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
