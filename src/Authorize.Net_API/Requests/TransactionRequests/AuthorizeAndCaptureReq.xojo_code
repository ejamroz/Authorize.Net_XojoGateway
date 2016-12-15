#tag Class
Protected Class AuthorizeAndCaptureReq
Inherits AbstractTransactionRequest
	#tag Method, Flags = &h0
		Sub constructor(builder as AuthorizeAndCaptureBuilder)
		  super.constructor()
		  self.requestType = kTypeAuthAndCapture
		  self.requestHeaderKey = kTxRequestHeader
		  self.amount = builder.amountToCharge
		  self.paymentInfo = builder.paymentInfo
		  self.billing = paymentInfo.getBillingInfo()
		  self.toSave = builder.isSavingProfile
		  self.invoiceNumber = builder.invoiceSerial
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function generateInvoiceToken() As JSONItem
		  //@return: Formatted json for handling invoice numbers
		  
		  dim jsonObj as new JSONItem()
		  jsonObj.value("invoiceNumber") = self.invoiceNumber
		  
		  return jsonObj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("transactionType") = requestType
		  jsonBody.Value("amount") = self.amount
		  jsonBody.Value(paymentInfo.JSONTokenName) = self.paymentInfo.getJson()
		  if self.toSave then 
		    jsonBody.value("profile") = super.generateProfile()
		    
		  end if
		  
		  if self.invoiceNumber <> "" then //we were given an ivoice number to track this by
		    jsonBody.Value("order") = self.generateInvoiceToken()
		    
		  end if
		  
		  if self.billing <> Nil then 
		    jsonBody.Value(super.kBillToken) = self.billing.getJson()
		    
		  end if
		  
		  if self.paymentInfo isa CreditCard and _
		    CreditCard(self.paymentInfo).isUsingTrack2 then
		    dim jsonMerchant as new JSONItem()
		    jsonMerchant.Value("marketType") = "2" //In person store front
		    jsonMerchant.Value("deviceType") = "5" //Personal computer terminal 
		    jsonBody.Value("retail") = jsonMerchant
		    
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
		Private paymentInfo As AbstractPaymentType
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
