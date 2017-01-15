#tag Class
Protected Class ANetController
	#tag Method, Flags = &h1
		Protected Sub constructor()
		  aNetSocket = new Xojo.Net.HTTPSocket()
		  #IF not DebugBuild then 
		    processLiveRequests = true
		    
		  #ENDIF
		  
		  AddHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived 
		  AddHandler self.aNetSocket.error, AddressOf handleError 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function convertMessageToPostableForm(message as JSONItem) As xojo.Core.MemoryBlock
		  dim json as text = JSONtoText(message)
		  dim data as MemoryBlock = TextEncoding.UTF8.ConvertTextToData(json)
		  
		  return data 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub destructor()
		  //Clean up our mess 
		  self.aNetSocket.Disconnect()
		  RemoveHandler self.aNetSocket.PageReceived, AddressOf handlePageReceived 
		  RemoveHandler self.aNetSocket.error, AddressOf handleError
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function generateCrentialsError() As InvalidControllerStateException
		  dim err as new InvalidControllerStateException()
		  err.Reason = "No ANet authentication credentials have been set"
		  err.ErrorNumber = 1
		  
		  return err 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handleError(sender as xojo.Net.HTTPSocket, err as RuntimeException)
		  //Event handler for the aNetSocket. Stores the error code and message for access
		  
		  const kStatusOk = 200
		  if err.ErrorNumber <> kStatusOk then
		    isWaitingForReply = false 
		    dim netError as new xojo.Net.NetException()
		    netError.ErrorNumber = err.ErrorNumber
		    netError.Reason = err.Reason
		    
		    Error(netError)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handlePageReceived(caller as Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, content As Xojo.Core.MemoryBlock)
		  dim data as Dictionary
		  
		  isWaitingForReply = false 
		  try
		    data = parseResponse(content)
		    
		  Catch err as xojo.Net.NetException
		    Error(err)
		    return
		    
		  end try
		  
		  ResponseParsed(data)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function parseResponse(content as xojo.Core.MemoryBlock) As Dictionary
		  #Pragma BreakOnExceptions false 
		  try 
		    dim json as text = TextEncoding.UTF8.ConvertDataToText(content)
		    return ParseJSON(json)
		    
		  catch e as JSONException
		    dim err as new xojo.Net.NetException()
		    err.ErrorNumber = 128794
		    err.Reason = "Unable to parse ANet response. Please manually check the status of your last request using their online portal"
		    
		    raise err
		    
		  end try
		  
		  #Pragma BreakOnExceptions true 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub send(request as JSONItem)
		  dim postData as MemoryBlock = convertMessageToPostableForm(request)
		  aNetSocket.SetRequestContent(postData, "application/x-www-form-urlencoded")
		  
		  try
		    self.aNetSocket.send("POST", gateway)
		    
		  catch err as UnsupportedOperationException
		    raise err 
		    
		  end try 
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAuthentication(credentials as MerchantAuthentication)
		  self.credentials = credentials
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Error(err as xojo.Net.NetException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResponseParsed(data as xojo.Core.Dictionary)
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

	#tag Property, Flags = &h1
		Protected credentials As MerchantAuthentication
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if isProcessingLiveRequests then 
			    return kTxLive
			    
			  else
			    return kTxSandbox
			    
			  end if
			End Get
		#tag EndGetter
		Private gateway As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		isProcessingLiveRequests As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isWaitingForReply As boolean
	#tag EndProperty


	#tag Constant, Name = kMerchantToken, Type = String, Dynamic = False, Default = \"merchantAuthentication", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTxLive, Type = Text, Dynamic = False, Default = \"https://api.authorize.net/xml/v1/request.api", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTxSandbox, Type = Text, Dynamic = False, Default = \"https://apitest.authorize.net/xml/v1/request.api", Scope = Public
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
