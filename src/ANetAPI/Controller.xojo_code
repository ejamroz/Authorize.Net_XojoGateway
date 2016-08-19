#tag Class
Protected Class Controller
	#tag Method, Flags = &h0
		Sub constructor()
		  self.aNetSocket = new Xojo.Net.HTTPSocket()
		  AddHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived //Handle information comming in
		  AddHandler self.aNetSocket.error, AddressOf handleError //Handle incoming errors 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub destructor()
		  //Clean up our mess 
		  self.aNetSocket.Disconnect()
		  RemoveHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived 
		  RemoveHandler self.aNetSocket.error, AddressOf handleError
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handleError(sender as xojo.Net.HTTPSocket, err as RuntimeException)
		  //Event handler for the aNetSocket. Stores the error code and message for access
		  
		  if err.ErrorNumber <> 200 then //200 indicates a successful command 
		    Error(err) //Trigger object event 
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handlePageReceived(caller as Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, content As Xojo.Core.MemoryBlock)
		  //Event hander for data comming in
		  
		  dim data as Dictionary
		  dim responseType as Text
		  dim response as Pair
		  
		  //MAKE SURE DATA COME IN CORRECTLY 
		  #Pragma BreakOnExceptions false 
		  try 
		    dim json as text = TextEncoding.UTF8.ConvertDataToText(content)
		    data = ParseJSON(json)
		    
		  catch err as JSONException
		    dim e as new RuntimeException()
		    e.ErrorNumber = 128794
		    e.Reason = "Unable to parse ANet response. Please manually check the status of your last request using their online portal"
		    Error(e) //Raise event 
		    
		    return //stop the MessageReceived event from firing 
		    
		  end try
		  
		  #Pragma BreakOnExceptions true 
		  
		  //HANDLE RESPONSE TYPES 
		  Select case lastRequestMade
		  case kTypeAuthAndCapture, kTypeRefund, kTypeVoidTransaction
		    ResponseReceived(new TransactionResponse(data, lastRequestMade))
		    
		  case kTypeCreateCustomerProfile, kTypeCreatePaymentProfile, kTypeCreateProfileFromTx, _
		    kTypeGetCustomerPaymentPRofile, kTypeDeleteCustomerProfile, _
		    kTypeUpdateCustomerPaymentProfile, kTypeDeletePaymentProfile
		    ResponseReceived(new ProfileResponse(data, lastRequestMade))
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processProfileRequest(auth as ANetAPI.Utility.MerchantAuthentication, theRequest as ANetAPI.AbstractProfileRequest, gateway as Text)
		  //Processes and sends a request to the ANet portal 
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The ProfileRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  //@throws UnsupportedFormatException: if an unknown request type is passed 
		  
		  dim jsonHead as string
		  dim theRequestJSON as new JSONItem()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  //SET HEADERS
		  if theRequest isa CreateCustomerProfileFromTransactionReq then //create a customer profile from tx
		    jsonHead = kCreateCustProfileFromTxHeader
		    theRequestJSON = CreateCustomerProfileFromTransactionReq(theRequest).getJson()
		    
		  elseif theRequest isa CreateCustomerProfileReq then //Creating a customer profile
		    jsonHead = kCreateCustomerProfileHeader
		    theRequestJSON = CreateCustomerProfileReq(theRequest).getJson()
		    
		  ElseIf theRequest isa UpdateCustomerPaymentProfileReq then 
		    jsonHead = kUpdateCustomerPaymentProfileRequestHeader
		    theRequestJSON = UpdateCustomerPaymentProfileReq(theRequest).getJson()
		    
		  ElseIf theRequest isa CreateCustomerPaymentProfileReq then 
		    jsonHead = kCreateCustomerPaymentProfileHeader
		    theRequestJSON = CreateCustomerPaymentProfileReq(theRequest).getJson()
		    
		  elseif theRequest isa GetCustomerPaymentProfileReq then
		    jsonHead = kGetCustomerPaymentProfileHeader
		    //there is no request JSON for this type of request 
		    
		  elseif theRequest isa DeleteCustomerProfileReq then
		    jsonHead = kDeleteCustomerRequestHeader
		    //there is no request JSON for this type of request
		    
		  elseif theRequest isa DeleteCustomerPaymentProfileReq then
		    jsonHead = kDeletePaymentProfileRequestHeader
		    //there is no request JSON for this type of request
		    
		    //XXX: ADD OTHER REQUESTS HERE 
		  else
		    #Pragma BreakOnExceptions false
		    dim err as new UnsupportedFormatException()
		    err.ErrorNumber = 1
		    err.Message = "Unknown transaction Request submitted"
		    
		    raise err 
		    #Pragma BreakOnExceptions true 
		    
		  end if
		  
		  //FORM BODY OF REQUEST
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  If theRequest.customerId <> "" then
		    sendRequestBody.Value("customerProfileId") = theRequest.customerId
		    
		  End If
		  
		  If theRequest.sentinalToken <> "" then
		    sendRequestBody.Value(theRequest.sentinalToken) = theRequestJSON
		    
		  End If
		  
		  if theRequest.paymentProfileID <> "" then 
		    sendRequestBody.Value("customerPaymentProfileId") = theRequest.paymentProfileID
		    
		  end if
		  
		  if theRequest.validationMode <> "" then 
		    sendRequestBody.Value("validationMode") = theRequest.validationMode
		    
		  end if
		  
		  //FORM REQUEST
		  sendRequest.Value(jsonHead) = sendRequestBody
		  
		  //POST
		  lastRequestMade = StringToText(theRequest.requestType)
		  self.send(sendRequest, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processTxRequest(auth as ANetAPI.Utility.MerchantAuthentication, theRequest as ANetAPI.AbstractTransactionRequest, gateway as Text, optional refID as string)
		  //Processes and sends a request to the ANet portal 
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  //@param refID: [OPTIONAL] merchant assigned identifier for the request being acted on 
		  //    ex: the serial of the transaction being voided in a void request 
		  //@throws UnsupportedFormatException: if an unknown request type is passed 
		  
		  dim jsonHead as string
		  dim theRequestJSON as new JSONItem()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  //DISPATCH REQUEST TYPE 
		  if theRequest isa AuthorizeAndCaptureReq then //charge a cc
		    jsonHead = kTxRequestHeader
		    theRequestJSON = AuthorizeAndCaptureReq(theRequest).getJson()
		    
		  elseif theRequest isa RefundReq then //refund a tx 
		    jsonHead = kTxRequestHeader
		    theRequestJSON = RefundReq(theRequest).getJson()
		    
		  elseif theRequest isa VoidReq then //Void a tx
		    jsonHead = kTxRequestHeader
		    theRequestJSON = VoidReq(theRequest).getJson()
		    
		    //TODO: ADD OTHER REQUESTS HERE 
		  else
		    #Pragma BreakOnExceptions false
		    dim err as new UnsupportedFormatException()
		    err.ErrorNumber = 1
		    err.Message = "Unknown transaction Request submitted"
		    
		    raise err 
		    #Pragma BreakOnExceptions true 
		    
		  end if
		  
		  //FORM BODY OF REQUEST
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  if refID <> "" then
		    sendRequestBody.Value("refId") = refID
		    
		  end if
		  sendRequestBody.Value(theRequest.sentinalToken) = theRequestJSON
		  
		  //FORM REQUEST
		  sendRequest.Value(jsonHead) = sendRequestBody
		  
		  //POST
		  lastRequestMade = StringToText(theRequest.requestType)
		  self.send(sendRequest, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub send(request as JSONItem, gateway as text)
		  //POSTS the request to the given gateway
		  //@param data: JSON data to post
		  //@param gateway: The URL of the API to post to 
		  
		  //CONVERT TO DATA
		  dim json as text = ANetAPI.JSONtoText(request)
		  dim data as MemoryBlock = TextEncoding.UTF8.ConvertTextToData(json)
		  
		  //PROCESS GATEWAY 
		  self.aNetSocket.SetRequestContent(data, "application/x-www-form-urlencoded")
		  self.aNetSocket.send("POST", gateway)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Error(err as RuntimeException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResponseReceived(response as ANetAPI.AbstractResponse)
	#tag EndHook


	#tag Note, Name = Usage
		Use this class to send requests through the ANet portal and recieve responses
		
		SENDING:
		
		RECIEVING:
		    - Messages are recieved through events, thus they are asynchronous
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private aNetSocket As xojo.Net.HTTPSocket
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return lastRequestMade
			  
			End Get
		#tag EndGetter
		lastRequest As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private lastRequestMade As Text
	#tag EndProperty


	#tag Constant, Name = kCreateCustomerPaymentProfileHeader, Type = String, Dynamic = False, Default = \"createCustomerPaymentProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCreateCustomerProfileHeader, Type = String, Dynamic = False, Default = \"createCustomerProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCreateCustProfileFromTxHeader, Type = String, Dynamic = False, Default = \"createCustomerProfileFromTransactionRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDeleteCustomerRequestHeader, Type = String, Dynamic = False, Default = \"deleteCustomerProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDeletePaymentProfileRequestHeader, Type = String, Dynamic = False, Default = \"deleteCustomerPaymentProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kGetCustomerPaymentProfileHeader, Type = String, Dynamic = False, Default = \"getCustomerPaymentProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMerchantToken, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTxRequestHeader, Type = String, Dynamic = False, Default = \"createTransactionRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpdateCustomerPaymentProfileRequestHeader, Type = String, Dynamic = False, Default = \"updateCustomerPaymentProfileRequest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpdateCustomerProfileHeader, Type = String, Dynamic = False, Default = \"updateCustomerPaymentProfileRequest", Scope = Private
	#tag EndConstant


	#tag Using, Name = Requests
	#tag EndUsing

	#tag Using, Name = Responses
	#tag EndUsing

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
			Name="lastRequest"
			Group="Behavior"
			Type="Text"
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
