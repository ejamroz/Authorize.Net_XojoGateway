#tag Class
Protected Class MerchantAuthentication
	#tag Method, Flags = &h0
		Sub constructor(name as string, transactionkey as string)
		  self.name = name
		  Self.transactionId = transactionKey
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJson() As JSONItem
		  //@return: The name of this token : the information stored by it
		  
		  using Xojo.Core
		  
		  dim jsonBody as new JSONItem()
		  
		  //FORM TOKEN DATA
		  jsonBody.Value("name") = self.name
		  jsonBody.Value("transactionKey") = self.transactionID
		  
		  //FORM TOKEN
		  return jsonBody
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		#tag Note
			Key value pairs for merchant key and transaction key
		#tag EndNote
		Private name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private transactionID As String
	#tag EndProperty


End Class
#tag EndClass
