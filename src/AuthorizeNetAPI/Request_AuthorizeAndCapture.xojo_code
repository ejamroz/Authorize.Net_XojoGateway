#tag Class
Protected Class Request_AuthorizeAndCapture
Inherits AuthorizeNetAPI.TransactionRequest_
Implements Tokenizable
	#tag Method, Flags = &h0
		Sub constructor(amount as double, payType as AuthorizeNetAPI.PaymentType_, optional billing as AuthorizeNetAPI.BillingProfile)
		  //Creates a transactionRequest object which is needed when trying to 
		  //    authenticate,capture,refund, or void a transaction
		  //@param type: The type of transation request that this is
		  //@param amount: The amount to act on e.g. to charge. This is a total and must include tax, shipping, etc
		  //@param payType: The type of payment used in this transation
		  //@param billing: [OPTIONAL] Billing profile for the payment 
		  
		  self.type = super.AUTH_AND_CAPTURE
		  self.amount = str(amount)
		  self.paymentType = payType
		  self.billing = billing
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  using Xojo.Core
		  
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("transactionType") = self.type
		  jsonBody.Value("amount") = self.amount
		  jsonBody.Value(self.PAY_TOKEN) = self.paymentType.getJson()
		  if self.billing <> Nil then 
		    jsonBody.Value(self.BILL_TOKEN) = self.billing.getJson()
		    
		  end if
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private amount As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private billing As AuthorizeNetAPI.BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentType As AuthorizeNetAPI.PaymentType_
	#tag EndProperty

	#tag Property, Flags = &h21
		Private type As string
	#tag EndProperty


	#tag Constant, Name = BILL_TOKEN, Type = String, Dynamic = False, Default = \"billTo", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PAY_TOKEN, Type = String, Dynamic = False, Default = \"payment", Scope = Private
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
End Class
#tag EndClass
