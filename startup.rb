`gem uninstall -Ia Nbapi`
`rake install`
`rm -rf /pkg`

require 'Nbapi'


Nbapi.configuration.access_token = "263076d4-1d59-4c71-94fd-7df39ee48560"
Nbapi.configuration.response_format = "json" 