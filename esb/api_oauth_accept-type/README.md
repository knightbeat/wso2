1/ Add a service provider in WSO2 IS for WSO2 ESB
2/ Get OAuth credetials and prepare that as encode-base64(clientKey:clientSecret)
3/ Invoke Token API using
	URL - https://{identity-server-host}:{identity-server-admin_port}/oauth2/token
	Query parameters - ?grant_type=password&username=admin&password=admin
	Authorization header - Authorization : Basic {encode-base64(clientKey:clientSecret)}
4/ Use the token for SimpleStockQuoteAPI invocations
	URL - https://{esb-host}:{esb-services_port}/stocks/quote/WSO2
	Authorization header - Authorization : Bearer {access-token}