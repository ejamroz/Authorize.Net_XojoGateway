#tag Class
Protected Class Response_Error
Inherits AuthorizeNetAPI.ANetResponse_
	#tag Method, Flags = &h0
		Sub constructor(data as xojo.Core.Dictionary)
		  //@param data: The response data 
		  
		  super.constructor(data)
		  super.setResponseCodes(data.Value("messages")) //we can do this because we know the structure of what we are getting as it is an error
		  
		  
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
