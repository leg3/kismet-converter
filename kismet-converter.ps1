
  $inputPath = "${psscriptroot}\*.netxml"
    [xml]$xml = Get-Content $inputPath # this is the command we will use to parse the kml file which is actually xml
  
    $xml.'detection-run'.'wireless-network' | ForEach-Object {
  
      $compositeWirelessNetwork = New-Object Object

      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "bssid" -Value $_.'BSSID'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "manuf" -Value $_.'manuf'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "channel" -Value $_.'channel'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "freqmhz" -Value $_.'freqmhz'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "snr-info" -Value $_.'snr-info'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "gps-info" -Value $_.'gps-info'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "bsstimestamp" -Value $_.'bsstimestamp'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "cdp-device" -Value $_.'cdp-device'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "cdp-portid" -Value $_.'cdp-portid'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "seencard" -Value $_.'seencard'
      Add-Member -InputObject $compositeWirelessNetwork -MemberType NoteProperty -Name "wireless-client" -Value $_.'wireless-client'

      $compositeWirelessNetworkSSID = New-Object Object

      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "type" -Value $_.'ssid'.'type'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "max-rate" -Value $_.'ssid'.'max-rate'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "packets" -Value $_.'ssid'.'packets'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "baeconrate" -Value $_.'ssid'.'beaconrate'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "wps" -Value $_.'ssid'.'wps'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "encryption" -Value $_.'ssid'.'encryption'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "wpa_version" -Value $_.'ssid'.'wpa-version'
      Add-Member -InputObject $compositeWirelessNetworkSSID -MemberType NoteProperty -Name "essid" -Value $_.'ssid'.'essid'.InnerText

      $compositeWirelessNetworkPackets = New-Object Object 

      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "llc" -Value $_.'packets'.'llc'
      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "data" -Value $_.'packets'.'data'
      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "crypt" -Value $_.'packets'.'crypt'
      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "total" -Value $_.'packets'.'total'
      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "fragments" -Value $_.'packets'.'fragments'
      Add-Member -InputObject $compositeWirelessNetworkPackets -MemberType NoteProperty -Name "retries" -Value $_.'packets'.'retries'

      $compositeWirelessNetworkSNRInfo = New-Object Object 

      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'snr-info'.'last_signal_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'snr-info'.'last_noise_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'snr-info'.'last_signal_rssi'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'snr-info'.'last_noise_rssi'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'snr-info'.'min_signal_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'snr-info'.'min_noise_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'snr-info'.'min_signal_rssi'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'snr-info'.'min_noise_rssi'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'snr-info'.'max_signal_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'snr-info'.'max_noise_dbm'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'snr-info'.'max_signal_rssi'
      Add-Member -InputObject $compositeWirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'snr-info'.'max_noise_rssi'


      $compositeWirelessClient = New-Object Object

      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "client-mac" -Value $_.'wireless-client'.'client-mac'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "client-manuf" -Value $_.'wireless-client'.'client-manuf'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "channel" -Value $_.'wireless-client'.'channel'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "freqmhz" -Value $_.'wireless-client'.'freqmhz'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "maxseenrate" -Value $_.'wireless-client'.'maxseenrate'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "packets" -Value $_.'wireless-client'.'packets'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "datasize" -Value $_.'wireless-client'.'datasize'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "snr-info" -Value $_.'wireless-client'.'snr-info'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "gps-info" -Value $_.'wireless-client'.'gps-info'
      Add-Member -InputObject $compositeWirelessClient -MemberType NoteProperty -Name "seen-card" -Value $_.'wireless-client'.'seen-card'

      $compositeWirelessClientPackets = New-Object Object

      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "llc" -Value $_.'wireless-client'.'packets'.'llc'
      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "data" -Value $_.'wireless-client'.'packets'.'data'
      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "crypt" -Value $_.'wireless-client'.'packets'.'crypt'
      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "total" -Value $_.'wireless-client'.'packets'.'total'
      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "fragments" -Value $_.'wireless-client'.'packets'.'fragments'
      Add-Member -InputObject $compositeWirelessClientPackets -MemberType NoteProperty -Name "retries" -Value $_.'wireless-client'.'packets'.'retries'

      $compositeWirelessClientSNRInfo = New-Object Object

      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'wireless-client'.'snr-info'.'last_signal_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'wireless-client'.'snr-info'.'last_noise_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'wireless-client'.'snr-info'.'last_signal_rssi'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'wireless-client'.'snr-info'.'last_noise_rssi'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'wireless-client'.'snr-info'.'min_signal_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'wireless-client'.'snr-info'.'min_noise_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'wireless-client'.'snr-info'.'min_signal_rssi'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'wireless-client'.'snr-info'.'min_noise_rssi'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'wireless-client'.'snr-info'.'max_signal_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'wireless-client'.'snr-info'.'max_noise_dbm'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'wireless-client'.'snr-info'.'max_signal_rssi'
      Add-Member -InputObject $compositeWirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'wireless-client'.'snr-info'.'max_noise_rssi'

      $compositeWirelessClientGPSInfo = New-Object Object 

      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'wireless-client'.'gps-info'.'min-lat'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'wireless-client'.'gps-info'.'min-lon'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'wireless-client'.'gps-info'.'min-alt'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'wireless-client'.'gps-info'.'min-spd'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'wireless-client'.'gps-info'.'max-lat'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'wireless-client'.'gps-info'.'max-lon'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'wireless-client'.'gps-info'.'max-alt'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'wireless-client'.'gps-info'.'max-spd'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'wireless-client'.'gps-info'.'peak-lat'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'wireless-client'.'gps-info'.'peak-lon'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'wireless-client'.'gps-info'.'peak-alt'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'wireless-client'.'gps-info'.'avg-lat'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'wireless-client'.'gps-info'.'avg-lon'
      Add-Member -InputObject $compositeWirelessClientGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'wireless-client'.'gps-info'.'avg-alt'

      $compositeWirelessClientSeenCard = New-Object Object 

      Add-Member -InputObject $compositeWirelessClientSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'wireless-client'.'seen-card'.'seen-uuid'
      Add-Member -InputObject $compositeWirelessClientSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'wireless-client'.'seen-card'.'seen-time'
      Add-Member -InputObject $compositeWirelessClientSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'wireless-client'.'seen-card'.'seen-packets'

    }

    $compositeWirelessNetwork
    $compositeWirelessNetworkSSID
    $compositeWirelessNetworkPackets
    $compositeWirelessNetworkSNRInfo

    $compositeWirelessClient
    $compositeWirelessClientPackets
    $compositeWirelessClientSNRInfo
    $compositeWirelessClientGPSInfo
    $compositeWirelessClientSeenCard
    

    Read-Host -Prompt "enter"