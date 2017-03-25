#tag Class
Protected Class TransactionResponse
Inherits AbstractResponse
	#tag Method, Flags = &h0
		Sub constructor(dataJson as xojo.Core.Dictionary)
		  super.constructor(dataJson)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isSuccess() As boolean
		  //@Override
		  //@return: True if the request was a success and false otherwise
		  
		  const kNoError = "1"
		  if data.HasKey("responseCode") then
		    if data.Value("responseCode") = kNoError then
		      return true
		      
		    else
		      return false
		      
		    end if
		    
		  end if
		  
		  return super.isSuccess()
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("authCode", "")
			End Get
		#tag EndGetter
		authCode As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return data.Lookup("accountType", "")
			  
			End Get
		#tag EndGetter
		cardType As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return StringToText(right(data.Value("accountNumber"), 4))
			End Get
		#tag EndGetter
		lastFour As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return data.Lookup("refId", "")
			End Get
		#tag EndGetter
		merchantTransactionId As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return data.Lookup("responseCode", "")
			  
			End Get
		#tag EndGetter
		responseCode As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return data.Lookup("text", "")
			End Get
		#tag EndGetter
		responseMessage As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("transHash", "")
			End Get
		#tag EndGetter
		transactionHash As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.data.Lookup("transId", "")
			  
			End Get
		#tag EndGetter
		transactionID As string
	#tag EndComputedProperty


	#tag Using, Name = Xojo.Core
	#tag EndUsing

	#tag Using, Name = Xojo.Data
	#tag EndUsing


	#tag ViewBehavior
		#tag ViewProperty
			Name="authCode"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardType"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="errorMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastFour"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="merchantTransactionId"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="responseMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
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
			Name="transactionHash"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="transactionID"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
