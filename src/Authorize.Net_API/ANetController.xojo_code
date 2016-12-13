#tag Class
Protected Class ANetController
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
		  
		  //MAKE SURE DATA CAME IN CORRECTLY 
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
		Sub processProfileRequest(auth as MerchantAuthentication, theRequest as ANetProfileRequest, gateway as string)
		  //Processes and sends a request to the ANet portal 
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The ProfileRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  //@throws UnsupportedFormatException: if an unknown request type is passed 
		  
		  dim jsonHead as string = theRequest.getRequestHeader()
		  dim theRequestJSON as JSONItem = theRequest.getJSON()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  //FORM BODY OF REQUEST
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  If theRequest.getCustomerID() <> "" then
		    sendRequestBody.Value("customerProfileId") = theRequest.getCustomerID()
		    
		  End If
		  
		  If theRequest.getSentinalToken() <> "" then
		    sendRequestBody.Value(theRequest.getSentinalToken()) = theRequestJSON
		    
		  End If
		  
		  if theRequest.getCustomerID() <> "" then 
		    sendRequestBody.Value("customerPaymentProfileId") = theRequest.getCustomerID()
		    
		  end if
		  
		  if theRequest.getValidationMode() <> "" then 
		    sendRequestBody.Value("validationMode") = theRequest.getValidationMode()
		    
		  end if
		  
		  //FORM REQUEST
		  sendRequest.Value(jsonHead) = sendRequestBody
		  
		  //POST
		  lastRequestMade = StringToText(theRequest.getRequestType())
		  self.send(sendRequest, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest_1(theRequest as Request)
		  lastRequestMade = StringToText(theRequest.requestType)
		  send(theRequest.message, theRequest.gateway)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processTxRequest(auth as MerchantAuthentication, theRequest as ANetTransactionRequest, gateway as string, optional refID as string)
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
		  
		  jsonHead = theRequest.getRequestHeader()
		  theRequestJSON = theRequest.getJSON()
		  
		  //FORM BODY OF REQUEST
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  if refID <> "" then
		    sendRequestBody.Value("refId") = refID
		    
		  end if
		  sendRequestBody.Value(theRequest.getSentinalToken()) = theRequestJSON
		  
		  //FORM REQUEST
		  sendRequest.Value(theRequest.getRequestHeader()) = sendRequestBody
		  
		  //POST
		  lastRequestMade = StringToText(theRequest.getRequestType)
		  self.send(sendRequest, gateway)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub send(request as JSONItem, gateway as string)
		  //POSTS the request to the given gateway
		  //@param data: JSON data to post
		  //@param gateway: The URL of the API to post to 
		  
		  //CONVERT TO DATA
		  dim json as text = JSONtoText(request)
		  dim data as MemoryBlock = TextEncoding.UTF8.ConvertTextToData(json)
		  
		  //PROCESS GATEWAY 
		  self.aNetSocket.SetRequestContent(data, "application/x-www-form-urlencoded")
		  self.aNetSocket.send("POST", StringToText(gateway))
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Error(err as RuntimeException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResponseReceived(response as AbstractResponse)
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
		lastRequest As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private lastRequestMade As string
	#tag EndProperty


	#tag Constant, Name = kMerchantToken, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Private
	#tag EndConstant


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
