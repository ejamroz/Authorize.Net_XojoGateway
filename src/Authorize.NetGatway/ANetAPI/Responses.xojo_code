#tag Module
Protected Module Responses
	#tag Method, Flags = &h1
		Protected Function determineResponseType(json as text) As Pair
		  //Determines what type of reponse the passed json represents
		  //@return responseType : Xojo.Core.Dictionary representing repsonse
		  //@throws BadDataException if the json is not parsable
		  
		  dim data as Dictionary
		  
		  try 
		    data = ParseJSON(json)
		    
		  catch err as JSONException
		    dim e as new BadDataException()
		    e.ErrorNumber = 2
		    e.Message = "Improper JSON string passed: " + err.Reason
		    raise e
		    
		  end try 
		  
		  //DETERMINE REPONSE TYPE 
		  if data.HasKey("transactionResponse") then
		    return kTypeTransaction : data
		    
		  elseif data.HasKey("customerProfileId") then 
		    return kTypeProfile : data 
		    
		  elseif data.HasKey("messages") then
		    return kTypeError : data
		    
		  else
		    dim e as new BadDataException()
		    e.ErrorNumber = 404000
		    e.Reason = "Unknow response type"
		    raise e 
		    
		  end if
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
