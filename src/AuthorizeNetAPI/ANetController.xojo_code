#tag Class
Protected Class ANetController
	#tag Method, Flags = &h0
		Sub constructor()
		  self.aNetSocket = new Xojo.Net.HTTPSocket()
		  AddHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handlePageReceived(caller as Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, content As Xojo.Core.MemoryBlock)
		  dim test as integer
		  
		  //PARSE RESPONSE 
		  'dim retValue as AuthorizeNetAPI.ANetResponse
		  'dim err as new JSONItem()
		  'Select case self.aNetSocket.ErrorCode
		  'case 0
		  'try 
		  'dim test as dictionary = Xojo.data.ParseJSON(response)
		  'retValue = new AuthorizeNetAPI.ANetResponse(response)
		  '
		  'Catch e as JSONException
		  'err.Value("errorCode") = "404"
		  'err.value("errorText") = "Error parsing response from gateway"
		  'retValue = new AuthorizeNetAPI.ANetResponse(err.ToString())
		  '
		  'end try 
		  '
		  'case -1
		  'err.Value("errorCode") = "-1"
		  'err.Value("errorText") = "Connection timeout with gateway"
		  'retValue = new AuthorizeNetAPI.ANetResponse(err.ToString())
		  '
		  'else
		  'err.Value("errorCode") = str(Self.aNetSocket.ErrorCode)
		  'err.Value("errorText") = "Error connecting to gateway"
		  'retValue = new AuthorizeNetAPI.ANetResponse(err.ToString())
		  '
		  'end select
		  '
		  'return retValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest(auth as AuthorizeNetAPI.MerchantAuthentication, theRequest as AuthorizeNetAPI.TransactionRequest_, gateway as Text)
		  //Processes a transaction request
		  //@param auth: The merchant authentication profile 
		  //@param theRequest: The TransactionRequest object to be processed through the gateway
		  //@param gateway: The URL for which payment gateway to use 
		  
		  using Xojo.Core
		  using xojo.Data
		  
		  if theRequest isa AuthorizeNetAPI.Request_AuthorizeAndCapture then
		    self.process_AuthCapture(auth, AuthorizeNetAPI.Request_AuthorizeAndCapture(theRequest), gateway)
		    
		  else
		    dim err as new InvalidArgumentException
		    err.ErrorNumber = 1
		    err.Message = "Unknown transaction Request submitted"
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub process_AuthCapture(auth as AuthorizeNetAPI.MerchantAuthentication, theRequest as AuthorizeNetAPI.Request_AuthorizeAndCapture, gateway as Text)
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
		  
		  //CONVERT TO DATA
		  dim j1 as string = DefineEncoding(request.ToString(), Encodings.UTF8)
		  dim json as text = j1.ToText()
		  dim data as MemoryBlock = TextEncoding.UTF8.ConvertTextToData(json)
		  
		  //PROCESS GATEWAY 
		  self.aNetSocket.SetRequestContent(data, "application/x-www-form-urlencoded")
		  self.aNetSocket.send("POST", gateway)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event MessageReceived(response as AuthorizeNetAPI.ANetResponse_)
	#tag EndHook


	#tag Property, Flags = &h21
		Private aNetSocket As xojo.Net.HTTPSocket
	#tag EndProperty


	#tag Constant, Name = MERCHANT_TOKEN, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Public
	#tag EndConstant

	#tag Constant, Name = REQUEST_TOKEN, Type = String, Dynamic = False, Default = \"transactionRequest", Scope = Public
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
