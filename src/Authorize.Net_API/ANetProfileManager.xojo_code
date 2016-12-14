#tag Class
Protected Class ANetProfileManager
Inherits ANetController
	#tag Event
		Sub ResponseParsed(data as xojo.Core.Dictionary)
		  ResponseRecieved(new ProfileResponse(data)) 
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub constructor()
		  Super.Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processRequest(auth as MerchantAuthentication, theRequest as ANetProfileRequest)
		  dim jsonHead as string = theRequest.getRequestHeader()
		  dim theRequestJSON as JSONItem = theRequest.getJSON()
		  dim sendRequestBody as new JSONItem()
		  dim sendRequest as new JSONItem()
		  
		  sendRequestBody.Value(kMerchantToken) = auth.getJson()
		  If theRequest.getCustomerID() <> "" then
		    sendRequestBody.Value("customerProfileId") = theRequest.getCustomerID()
		    
		  End If
		  
		  If theRequest.getSentinalToken() <> "" then
		    sendRequestBody.Value(theRequest.getSentinalToken()) = theRequestJSON
		    
		  End If
		  
		  if theRequest.getPaymentProfileID() <> "" then 
		    sendRequestBody.Value("customerPaymentProfileId") = theRequest.getPaymentProfileID()
		    
		  end if
		  
		  if theRequest.getValidationMode() <> "" then 
		    sendRequestBody.Value("validationMode") = theRequest.getValidationMode()
		    
		  end if
		  
		  sendRequest.Value(jsonHead) = sendRequestBody
		  try 
		    self.send(sendRequest)
		    
		  Catch err as UnsupportedOperationException
		    raise err
		    
		  end try
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ResponseRecieved(response as ProfileResponse)
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
