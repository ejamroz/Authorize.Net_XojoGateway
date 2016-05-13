#tag Class
Protected Class Request_AuthorizeAndCapture
Inherits AuthorizeNetAPI.TransactionRequest_
	#tag Method, Flags = &h0
		Sub constructor(amount as double, payType as AuthorizeNetAPI.PaymentType_, optional billing as BillingProfile, toSave as boolean, optional invoiceNum as string)
		  //Creates a transactionRequest object which is needed when trying to 
		  //    authenticate,capture,refund, or void a transaction
		  //@param amount: The amount to act on e.g. to charge. This is a total and must include tax, shipping, etc
		  //@param payType: The type of payment used in this transation
		  //@param billing: [OPTIONAL] Billing profile for the payment 
		  //@param toSave: if true, will create a customerProfile inside ANet's CIM system 
		  
		  self.type = super.kAuthAndCapture
		  self.amount = str(amount)
		  self.paymentType = payType
		  self.billing = billing
		  self.toSave = toSave
		  self.invoiceNumber = invoiceNum
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function generateInvoiceToken() As JSONItem
		  //@return: Formatted json for handling invoice numbers
		  
		  Using xojo.Core
		  
		  dim jsonObj as new JSONItem()
		  jsonObj.value("invoiceNumber") = self.invoiceNumber
		  
		  return jsonObj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  using Xojo.Core
		  
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("transactionType") = self.type
		  jsonBody.Value("amount") = self.amount
		  jsonBody.Value(super.kPayToken) = self.paymentType.getJson()
		  if self.toSave then 
		    jsonBody.value("profile") = super.generateProfile()
		    
		  end if
		  
		  if self.invoiceNumber <> "" then //we were given an ivoice number to track this by
		    jsonBody.Value("order") = self.generateInvoiceToken()
		    
		  end if
		  
		  if self.billing <> Nil then 
		    jsonBody.Value(super.kBillToken) = self.billing.getJson()
		    
		  end if
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private amount As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private billing As BillingProfile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private invoiceNumber As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private paymentType As AuthorizeNetAPI.PaymentType_
	#tag EndProperty

	#tag Property, Flags = &h21
		Private toSave As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private type As string
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
