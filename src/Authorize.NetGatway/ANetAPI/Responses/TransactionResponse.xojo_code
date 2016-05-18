#tag Class
Protected Class TransactionResponse
Inherits ANetAPI.AbstractResponse
	#tag Method, Flags = &h0
		Sub constructor(dataJson as xojo.Core.Dictionary)
		  //@param dataJson: Object representing JSON string of response data
		  
		  super.constructor(dataJson)
		  statusCode = data.Lookup("responseCode", "404000")
		  if StatusCode = "404000" then //Something has changed about the formatting of responses :(
		    StatusMessage = "Unable to determine status based on results, check Anet portal using transaction ID"
		    
		  end if
		  
		  //LOAD ANY ERRORS
		  if data.HasKey("errors") then
		    dim temp() as Auto = data.Value("errors")
		    dim err as Dictionary = temp(0) 
		    self.lastErrorCode = err.Lookup("errorCode", "")
		    self.errorMessage = err.Lookup("errorText", "")
		    
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isSuccess() As boolean
		  //@override
		  //@return: True is the request was a success and false otherwise
		  
		  if StatusCode = kSuccessCode or StatusCode = "1" then
		    return true
		    
		  end if 
		  
		  return false 
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("authCode", "")
			End Get
		#tag EndGetter
		authCode As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return StringToText(right(data.Value("accountNumber"), 4))
			End Get
		#tag EndGetter
		lastFour As text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("transHash", "")
			End Get
		#tag EndGetter
		transactionHash As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("transId", "")
			  
			End Get
		#tag EndGetter
		transactionID As Text
	#tag EndComputedProperty


	#tag Using, Name = Xojo.Core
	#tag EndUsing

	#tag Using, Name = Xojo.Data
	#tag EndUsing


	#tag ViewBehavior
		#tag ViewProperty
			Name="authCode"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="lastFour"
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
		#tag ViewProperty
			Name="transactionHash"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="transactionID"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
