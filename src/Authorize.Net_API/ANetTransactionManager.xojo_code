#tag Class
Protected Class ANetTransactionManager
Inherits ANetController
	#tag Event
		Sub ResponseParsed(data as xojo.Core.Dictionary)
		  ResponseRecieved(new TransactionResponse(data)) 
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub constructor()
		  Super.Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest(auth as MerchantAuthentication, theRequest as ANetTransactionRequest, optional refID as string)
		  dim jsonHead as string
		  dim theRequestJSON as new JSONItem()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  jsonHead = theRequest.getRequestHeader()
		  theRequestJSON = theRequest.getJSON()
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  if refID <> "" then //WHY IS THIS HERE?
		    sendRequestBody.Value("refId") = refID
		    
		  end if
		  sendRequestBody.Value(theRequest.getSentinalToken()) = theRequestJSON
		  
		  sendRequest.Value(theRequest.getRequestHeader()) = sendRequestBody
		  
		  try 
		    self.send(sendRequest)
		    
		  catch err as UnsupportedOperationException
		    raise err
		    
		  end try
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ResponseRecieved(response as TransactionResponse)
	#tag EndHook


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
