#tag Class
Protected Class ANetResponse_
	#tag Method, Flags = &h1
		Protected Sub constructor(dataJson as xojo.Core.Dictionary)
		  data = dataJson
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isSuccess() As boolean
		  //@return: True is the request was a success and false otherwise
		  
		  if StatusCode = kSuccessCode then
		    return true
		    
		  end if 
		  
		  return false 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setResponseCodes(data as xojo.Core.Dictionary)
		  //Extracts result code information from the passed object. The intent is to get 
		  //    more specific knowlege about what happened based on what type of response
		  //    was issued 
		  //@param data: Dictionary representing the messages Token of an ANet response 
		  //@return true if data was extracted false otherwise
		  
		  Using Xojo.Core
		  
		  if data.HasKey("message") then 
		    dim temp() as Auto = data.Value("message")
		    dim err as Dictionary = temp(0) 
		    self.StatusCode = err.Lookup("code", "")
		    self.StatusMessage = err.Lookup("text", "")
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toString() As string
		  using Xojo.Core
		  
		  dim retString as string = "[Status: " + self.StatusCode + chr(10) +_
		  "Message: " + self.StatusMessage + chr(10)
		  if self.data <> Nil then 
		    #Pragma BreakOnExceptions false 
		    for each item as DictionaryEntry in self.data
		      try
		        retString = retString + item.Key + ": " + item.Value + chr(10) 
		        
		      catch err as TypeMismatchException //TODO: dont be lazy here and actually recursively search all of the data 
		        retString = retString + item.Key + ": [DATA]" + chr(10) 
		        
		      end try 
		      
		    next 
		    #Pragma BreakOnExceptions true
		    
		  end if
		  
		  if self.lastErrorCode <> "" then
		    retString = retString + "Error Code: " + self.lastErrorCode + chr(10) +_
		    "Error Message: " + self.errorMessage
		    
		  end if 
		  
		  retString = retString + "]" 
		  
		  return retString 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function validateInput(json as variant) As xojo.Core.Dictionary
		  //Checks to see if pass json is in a supportd type, if so, converts it to a dictionary. Currently supports:
		  //    - JSONItem
		  //    - Xojo.Core.Dictionary
		  //@param json: The json object to parse
		  //@return: A dictionary based on the pased json object
		  //@throws BadDataException for improperly formatted JSON
		  //@throws UnsupportedFormatException for objects passed that are passed that can not be parsed 
		  
		  using xojo.core
		  using xojo.data
		  
		  dim data as Dictionary
		  
		  if json isa JSONItem then
		    dim myjson as JSONItem = JSONItem(json) 
		    try 
		      dim jString as string = DefineEncoding(myjson.toString(), Encodings.UTF8)
		      data = ParseJSON(jString.toText())
		      
		    catch err as JSONException
		      dim e as new BadDataException()
		      e.ErrorNumber = 2
		      e.Message = "Improper JSON string passed to constructor: " + err.Reason
		      raise e
		      
		    end try 
		    
		  elseif json isa Dictionary then
		    data = json
		    
		  else
		    dim e as new UnsupportedFormatException()
		    e.ErrorNumber = 1
		    e.Message = "Non-parsable object passed to constructor"
		    raise e
		    
		  end if
		  
		  return data
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		This is an abstract super class for all response types. It can not be instantiated
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected data As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		errorMessage As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		lastErrorCode As text
	#tag EndProperty

	#tag Property, Flags = &h0
		StatusCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		StatusMessage As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="errorMessage"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastErrorCode"
			Group="Behavior"
			Type="text"
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
			Name="StatusCode"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="Text"
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
