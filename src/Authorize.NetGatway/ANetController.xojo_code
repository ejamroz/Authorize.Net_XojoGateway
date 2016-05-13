#tag Class
Protected Class ANetController
	#tag Method, Flags = &h0
		Sub constructor()
		  self.aNetSocket = new Xojo.Net.HTTPSocket()
		  AddHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived //Handle information comming in
		  AddHandler self.aNetSocket.error, AddressOf handleError //Handle incoming errors 
		  
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
		Private Function handleErrorResponse(data as xojo.Core.Dictionary) As Response_Error
		  //Converts a transaction reponse to usable data
		  //@param Data: Dictionary representing parsable data from a transaction response
		  
		  return new Response_Error(data)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handlePageReceived(caller as Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, content As Xojo.Core.MemoryBlock)
		  //Event hander for data comming in
		  
		  using Xojo.Core
		  using Xojo.Data
		  using AuthorizeNetAPI
		  
		  dim err as new Dictionary()
		  dim responseData as Dictionary
		  dim responseType as Text
		  dim response as Pair
		  
		  //MAKE SURE DATA COME IN CORRECTLY 
		  try 
		    dim json as text = TextEncoding.UTF8.ConvertDataToText(content)
		    response = determineResponseType(json)
		    responseType = response.left
		    responseData = response.right
		    
		  Catch e as BadDataException
		    Error(e) //Raise event 
		    return //stop the MessageReceived event from firing 
		    
		  end try
		  
		  //HANDLE RESPONSE TYPES 
		  Select case responseType
		  case kTypeTransaction
		    dim retValue as Response_Transaction = handleTXResponse(responseData)
		    TransactionResponseReceived(retValue)
		    
		  case kTypeProfile
		    break
		    //TODO
		    
		  case kTypeError
		    dim retValue as Response_Error = handleErrorResponse(responseData)
		    ErrorResponseReceived(retValue)
		    
		  else
		    break
		    //TODO: handle other response types 
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function handleTXResponse(data as xojo.Core.Dictionary) As Response_Transaction
		  //Converts a transaction reponse to usable data
		  //@param Data: Dictionary representing parsable data from a transaction response
		  
		  using Xojo.Core
		  
		  dim retValue as Response_Transaction
		  dim txResponse as Dictionary = data.Value("transactionResponse") //tx details
		  
		  retValue = new Response_Transaction(txResponse)
		  retValue.setResponseCodes(data.Value("messages"))
		  
		  return retValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest(auth as MerchantAuthentication, theRequest as AuthorizeNetAPI.TransactionRequest_, gateway as Text, optional refID as string)
		  //Processes a transaction request
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  //@param refID: [OPTIONAL] merchant assigned identifier for the request being acted on 
		  //    ex: the serial of the transaction being voided in a void request 
		  //@throws UnsupportedFormatException: if an unknown tx type is passed 
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  dim jsonHead as string
		  dim theRequestJSON as new JSONItem()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  //DISPATCH REQUEST TYPE 
		  if theRequest isa Request_AuthorizeAndCapture then //charge a cc
		    jsonHead = "createTransactionRequest"
		    theRequestJSON = Request_AuthorizeAndCapture(theRequest).getJson()
		    
		  elseif theRequest isa Request_CreateCustomerProfileFromTransaction then //create a customer profile
		    jsonHead = "createCustomerProfileFromTransactionRequest"
		    theRequestJSON = Request_CreateCustomerProfileFromTransaction(theRequest).getJson()
		    
		  elseif theRequest isa Request_Refund then //refund a tx 
		    jsonHead = "createTransactionRequest"
		    theRequestJSON = Request_Refund(theRequest).getJson()
		    
		  elseif theRequest isa Request_Void then 
		    jsonHead = "createTransactionRequest"
		    theRequestJSON = Request_Void(theRequest).getJson()
		    
		    //TODO: ADD OTHER REQUESTS HERE 
		  else
		    dim err as new UnsupportedFormatException
		    err.ErrorNumber = 1
		    err.Message = "Unknown transaction Request submitted"
		    raise err 
		    
		  end if
		  
		  //FORM BODY OF REQUEST
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  if refID <> "" then
		    sendRequestBody.Value("refId") = refID
		    
		  end if
		  sendRequestBody.Value(kRequestToken) = theRequestJSON
		  
		  //FORM REQUEST
		  sendRequest.Value(jsonHead) = sendRequestBody
		  
		  //POST
		  self.send(sendRequest, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub process_AuthCapture(auth as MerchantAuthentication, theRequest as Request_AuthorizeAndCapture, gateway as Text)
		  //Processes a transaction of type Authenticate and Capure 
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  const JSON_HEAD = "createTransactionRequest"
		  dim requestBody as new JSONItem()
		  dim request as new JSONItem()
		  
		  //FORM BODY OF REQUEST
		  requestBody.Value(self.kMerchantToken) = auth.getJson()
		  requestBody.Value(self.kRequestToken) = theRequest.getJson()
		  
		  //FORM REQUEST
		  request.Value(JSON_HEAD) = requestBody
		  
		  //POST
		  self.send(request, gateway)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub process_CreateCustomerFromTx(auth as MerchantAuthentication, theRequest as Request_CreateCustomerProfileFromTransaction, gateway as Text)
		  //Processes a transaction of type Create Customer Profile from Transaction 
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  const JSON_HEAD = "createCustomerProfileFromTransactionRequest"
		  dim requestBody as new JSONItem()
		  dim request as new JSONItem()
		  
		  //FORM BODY OF REQUEST
		  requestBody.Value(self.kMerchantToken) = auth.getJson()
		  requestBody.Value("transId") = theRequest.getID()
		  
		  //FORM REQUEST
		  request.Value(JSON_HEAD) = requestBody
		  
		  //POST
		  self.send(request, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub process_Refund(auth as MerchantAuthentication, theRequest as Request_Refund, gateway as Text)
		  //Process a transaction type refund
		  //@param auth: The authorization object
		  //@param theRequest: The specific refund request object
		  //@param gateway: The payment gateway to process the request through
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  const JSON_HEAD = "createTransactionRequest"
		  dim requestBody as new JSONItem()
		  dim request as new JSONItem()
		  
		  //FORM BODY OF REQUEST
		  requestBody.Value(self.kMerchantToken) = auth.getJson()
		  requestBody.Value(self.kRequestToken) = theRequest.getJson()
		  
		  //FORM REQUEST
		  request.Value(JSON_HEAD) = requestBody
		  
		  //POST
		  self.send(request, gateway)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub send(request as JSONItem, gateway as text)
		  //POSTS the request to the given gateway
		  //@param data: JSON data to post
		  //@param gateway: The URL of the API to post to 
		  
		  using Xojo.Data
		  Using Xojo.Core 
		  
		  //CONVERT TO DATA
		  dim json as text = AuthorizeNetAPI.JSONtoText(request)
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
		Event ErrorResponseReceived(response as Response_Error)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ProfileResponseReceived(response as Response_ProfileCreation)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TransactionResponseReceived(response as Response_Transaction)
	#tag EndHook


	#tag Property, Flags = &h21
		Private aNetSocket As xojo.Net.HTTPSocket
	#tag EndProperty


	#tag Constant, Name = kMerchantToken, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRequestToken, Type = String, Dynamic = False, Default = \"transactionRequest", Scope = Private
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
