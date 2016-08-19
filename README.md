# Authorize.Net_XojoGateway
A module for  integrating Xojo applications with Authorize.net's CIM and payment gateways using their JSON API. More information about their APIs [here](http://developer.authorize.net/api/reference/). This was designed for a project with certain limitations, so I have not integrated their full API (Apple Pay, PayPal, etc). Hopefully when I get some time I will get around to doing that, or if you want to help out feel free to fork and add!

## Current Abilities
* Charge a credit card
* Charge a credit card and create a CIM record at the same time
* Refund a transaction
* Create a customer profile in ANet's CIM database
* Void a same day transaction
* Add payment profiles to a CIM record
* Charge a stored CIM profile
* Retrieve a payment profile for a CIM record

## Coming soon
* Have accounts store more than one CC
* Delete payment profiles
* Update payment profiles
* Update customer profiles
* Delete customer profiles
