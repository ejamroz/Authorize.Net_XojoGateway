#tag Class
Protected Class RefundReq
Inherits AbstractTransactionRequest
	#tag Method, Flags = &h0
		Sub constructor(refTransId as string, amount as double, payType as PaymentSource)
		  // Calling the overridden superclass constructor.
		  //@param amount: The amount to refund, this number must <= original transaction amount
		  //@param payType: The payment to refund, if credit, it must be the same card that was used
		  //    in the original settled transaction. Only the last 4 digits are required for the card 
		  //@param refTransID: The ANet identifier of the original settled transaction 
		  
		  super.constructor()
		  requestType = kTypeRefund 
		  requestHeaderKey = kTxRequestHeader
		  self.refTransId = refTransId
		  self.amount = amount
		  self.payType = payType
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("transactionType") = self.requestType
		  jsonBody.Value("amount") = self.amount
		  jsonBody.Value(super.kPayToken) = self.payType.getJson()
		  jsonBody.Value("refTransId") = self.refTransId
		  if self.payType isa CreditCard then 
		    dim jsonMerchant as new JSONItem()
		    const kInPersonTransaction = "2"
		    const kPersonalComputerTerminal = "5"
		    jsonMerchant.Value("marketType") = kInPersonTransaction
		    jsonMerchant.Value("deviceType") = kPersonalComputerTerminal
		    jsonBody.Value("retail") = jsonMerchant
		    
		  end if
		  
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private amount As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private payType As PaymentSource
	#tag EndProperty

	#tag Property, Flags = &h21
		Private refTransId As string
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sentinalToken"
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
	#tag EndViewBehavior
End Class
#tag EndClass
