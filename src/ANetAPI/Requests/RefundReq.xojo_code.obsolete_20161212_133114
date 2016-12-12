#tag Class
Protected Class RefundReq
Inherits ANetAPI.AbstractTransactionRequest
	#tag Method, Flags = &h0
		Sub constructor(amount as double, payType as ANetAPI.AbstractPaymentType, refTransId as string)
		  // Calling the overridden superclass constructor.
		  //@param amount: The amount to refund, this number must <= original transaction amount
		  //@param payType: The payment to refund, if credit, it must be the same card that was used
		  //    in the original settled transaction. Only the last 4 digits are required for the card 
		  //@param refTransID: The ANet identifier of the original settled transaction 
		  
		  super.constructor()
		  self.mType = kTypeRefund 
		  self.amount = amount
		  self.payType = payType
		  self.refTransId = refTransId
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("transactionType") = self.mType
		  jsonBody.Value("amount") = self.amount
		  jsonBody.Value(super.kPayToken) = self.payType.getJson()
		  jsonBody.Value("refTransId") = self.refTransId
		  
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private amount As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private payType As ANetAPI.AbstractPaymentType
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
			Name="requestType"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
