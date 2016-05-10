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
		  
		  self.lastErrorCode = err.ErrorNumber
		  self.errormessage = err.Reason
		  Error(err) //Trigger object event 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handlePageReceived(caller as Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, content As Xojo.Core.MemoryBlock)
		  using Xojo.Core
		  using Xojo.Data
		  
		  dim json as text = Xojo.core.TextEncoding.UTF8.ConvertDataToText(content)
		  
		  //PARSE RESPONSE 
		  dim retValue as AuthorizeNetAPI.ANetResponse_
		  dim err as new JSONItem()
		  Select case self.lastErrorCode
		  case 0
		    try 
		      dim data as Dictionary = Xojo.data.ParseJSON(json) 
		      //PARSE transactionResponse 
		      if data.HasKey("transactionResponse") then
		        dim txResponse as Dictionary = data.Value("transactionResponse")
		        retValue = new Response_Transaction(txResponse)
		        
		      else
		        //XXX: WHAT TO DO HERE? DIFFERENT TYPE OF RESPONSE?
		        
		      end if
		      
		    Catch e as JSONException
		      err.Value("errorCode") = "404"
		      err.value("errorText") = "Error parsing response from gateway"
		      retValue = new Response_Transaction(err)
		      
		    end try 
		    
		  case -1
		    err.Value("errorCode") = str(self.lastErrorCode)
		    err.Value("errorText") = "Connection timeout with gateway"
		    retValue = new Response_Transaction(err)
		    
		  else
		    err.Value("errorCode") = str(self.lastErrorCode)
		    err.Value("errorText") = "Error connecting to gateway"
		    retValue = new Response_Transaction(err)
		    
		  end select
		  
		  MessageReceived(retValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest(auth as MerchantAuthentication, theRequest as AuthorizeNetAPI.TransactionRequest_, gateway as Text)
		  //Processes a transaction request
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  //@throws UnsupportedFormatException: if an unknown tx type is passed 
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  //DISPATCH REQUEST TYPE 
		  if theRequest isa Request_AuthorizeAndCapture then
		    self.process_AuthCapture(auth, Request_AuthorizeAndCapture(theRequest), gateway)
		    
		  elseif theRequest isa Request_CreateCustomerProfileFromTransaction then 
		    self.process_CreateCustomerFromTx(auth, Request_CreateCustomerProfileFromTransaction(theRequest), gateway)
		    
		    //TODO: ADD OTHER REQUESTS HERE 
		  else
		    dim err as new UnsupportedFormatException
		    err.ErrorNumber = 1
		    err.Message = "Unknown transaction Request submitted"
		    
		  end if
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
		  requestBody.Value(self.MERCHANT_TOKEN) = auth.getJson()
		  requestBody.Value(self.REQUEST_TOKEN) = theRequest.getJson()
		  
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
		  requestBody.Value(self.MERCHANT_TOKEN) = auth.getJson()
		  requestBody.Value("transId") = theRequest.getID()
		  
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
		Event MessageReceived(response as AuthorizeNetAPI.ANetResponse_)
	#tag EndHook


	#tag Property, Flags = &h21
		Private aNetSocket As xojo.Net.HTTPSocket
	#tag EndProperty

	#tag Property, Flags = &h21
		Private errorMessage As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastErrorCode As integer
	#tag EndProperty


	#tag Constant, Name = MERCHANT_TOKEN, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Private
	#tag EndConstant

	#tag Constant, Name = REQUEST_TOKEN, Type = String, Dynamic = False, Default = \"transactionRequest", Scope = Private
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
