#tag Class
Protected Class ANetResponse
	#tag Method, Flags = &h0
		Sub constructor(json as string)
		  //@param json: JSON string returned from ANet gateway
		  
		  using xojo.core
		  using xojo.data
		  
		  try 
		    dim data as Dictionary = ParseJSON(json.ToText())
		    self.accountNumber = data.Lookup("accountNumber", "")
		    self.accountType = data.Lookup("accountType", "")
		    self.authCode = data.Lookup("authCode", "")
		    self.avsResultCode = data.Lookup("avsResultCode", "")
		    self.cavvResultCode = data.Lookup("cavvResultCode", "")
		    self.cvvResultCode = data.Lookup("cvvResultCode", "")
		    self.responseCode = data.Lookup("responseCode", "")
		    self.transHash = data.Lookup("transHash", "")
		    self.transId = data.Lookup("transId", "")
		    if data.HasKey("errors") then
		      dim err as new Dictionary
		      err = data.Value("error")
		      self.lastErrorCode = err.Lookup("errorCode", "")
		      self.errorMessage = err.Lookup("errorText", "")
		      
		    end if
		    
		  catch err as JSONException
		    dim e as new InvalidArgumentException
		    e.ErrorNumber = 1
		    e.Message = "Invalid JSON string passed to object constructor"
		    raise e
		    
		  end try 
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isSuccess() As boolean
		  //@return: true if this transaction was a success and false otherwise
		  
		  if self.authCode <> "" then 
		    return true
		    
		  end if 
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toString() As string
		  //@return: A string representation of this object
		  
		  dim retString as string
		  
		  retString = "Response Code: " + self.responseCode + chr(10) +_
		  "Authorization Code: " + self.authCode + chr(10) +_
		  "Account Number: " + self.accountNumber + chr(10) +_
		  "Account Type: " + self.accountType + chr(10) +_
		  "AVS Result Code: " + self.avsResultCode + chr(10) +_
		  "CAVV Result Code: " + self.cavvResultCode + chr(10) +_
		  "CVV Result Code: "+ self.cvvResultCode + chr(10) +_
		  "Transaction Hash: " + self.transHash + chr(10) +_
		  "Transaction ID: " + self.transId + chr(10)
		  
		  if self.lastErrorCode <> "" then
		    retString = retString + "Error Code: " + self.lastErrorCode + chr(10) +_
		    "Error Message: " + self.errorMessage + chr(10) 
		    
		  end if 
		  
		  return retString
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		accountNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		accountType As string
	#tag EndProperty

	#tag Property, Flags = &h0
		authCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		avsResultCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		cavvResultCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		cvvResultCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		errorMessage As string
	#tag EndProperty

	#tag Property, Flags = &h0
		lastErrorCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		responseCode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		transHash As string
	#tag EndProperty

	#tag Property, Flags = &h0
		transId As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="accountNumber"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="accountType"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="authCode"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="avsResultCode"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cavvResultCode"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cvvResultCode"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="errorMessage"
			Group="Behavior"
			Type="string"
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
			Type="string"
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
			Name="responseCode"
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
			Name="transHash"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="transId"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
