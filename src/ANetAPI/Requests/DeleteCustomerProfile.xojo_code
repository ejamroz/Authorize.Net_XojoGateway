#tag Class
Protected Class DeleteCustomerProfile
Inherits ANetAPI.AbstractProfileRequest
	#tag Method, Flags = &h0
		Sub constructor(customerID as string)
		  //@param customerID: ANet customer serial
		  
		  Super.Constructor()
		  mType = kTypeDeleteCustomerProfile
		  mToken = ""
		  mCustomerId = customerID
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
