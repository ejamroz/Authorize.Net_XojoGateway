# Authorize.Net_XojoGateway
A module for integrating Xojo applications with Authorize.net's CIM and payment gateways using their JSON API. More information about their APIs [here](http://developer.authorize.net/api/reference/). This was designed for a project with certain limitations, so I have not integrated their full API (Apple Pay, PayPal, etc). Hopefully when I get some time I will get around to doing that, or if you want to help out feel free to fork and add!

## Support
* The current version has only been tested on an OSX system 
* Version 1.0.5 and later do not have reverse compatability with earlier versions

## Usage
To use ANet's API you must either have a merchant account or a [sandbox account](https://developer.authorize.net/hello_world/sandbox/) with them. Once you have a merchant login and transaction key you will be able to test their API. See the code in the aNetModuleTest window for examples. Each button demostrates a different capability. There is dummy data already hard coded in, so feel to change it to see what happens. 

All relavent source code is contained within the ANetAPI folder. I have included a test window that allows you to go through all current abilities and see how they work and what responses look like. 

## Current Abilities
* Charge a credit card
* Charge a credit card and create a CIM record at the same time
* Refund a transaction
* Create a customer profile in ANet's CIM database
* Void a same day transaction
* Add payment profiles to a CIM record
* Charge a stored CIM profile
* Retrieve a payment profile for a CIM record
* Delete payment profiles
* Update payment profiles
* Update customer profiles
* Delete customer profiles
* Get a customer profile and associated payment profiles (A limitation here is that the current system is designed to only store on payment profile, thus getting a profile that has more than one payment profile could produce unexpected results)

## Coming soon
* Have accounts store more than one CC


