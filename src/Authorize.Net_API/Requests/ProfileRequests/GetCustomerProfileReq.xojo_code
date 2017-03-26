#tag Class
Protected Class GetCustomerProfileReq
Inherits AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(customerID as string)
		  Super.Constructor()
		  validationMode = ""
		  requestType = kTypeGetCustomerProfile
		  requestHeaderKey = kGetCustomerProfileHeader
		  requestBodyKey= "" 
		  aNetCustomerID = customerID
		  paymentProfileSerial = ""
		End Sub
	#tag EndMethod


End Class
#tag EndClass
