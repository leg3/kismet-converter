
  $inputPath = "${psscriptroot}\*.netxml"
    [xml]$xml = Get-Content $inputPath # this is the command we will use to parse the kml file which is actually xml
  
    $xml.'detection-run' | ForEach-Object {
  
      # Create the detection-run master object.  We will be making a database of these objects
      $detectionRun = New-Object Object 

      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "kismet-version" -Value $_.'kismet-version'
      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "start-time" -Value $_.'start-time'

      # Create the card-source object

      $cardSouce = New-Object Object 

      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-source" -Value $_.'card-source'.'card-source'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-name" -Value $_.'card-source'.'card-name'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-interface" -Value $_.'card-source'.'card-interace'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-type" -Value $_.'card-source'.'card-type'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-packets" -Value $_.'card-source'.'card-packets'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-hop" -Value $_.'card-source'.'card-hop'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-channels" -Value $_.'card-source'.'card-channels'

      $wirelessNetwork = New-Object Object

      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bssid" -Value $_.'wireless-network'.'BSSID'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "manuf" -Value $_.'wireless-network'.'manuf'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "channel" -Value $_.'wireless-network'.'channel'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "freqmhz" -Value $_.'wireless-network'.'freqmhz'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "maxseenrate" -Value $_.'wireless-network'.'maxseenrate'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "packets" -Value $_.'wireless-network'.'packets'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "datasize" -Value $_.'wireless-network'.'datasize'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "snr-info" -Value $_.'wireless-network'.'snr-info'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "gps-info" -Value $_.'wireless-network'.'gps-info'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bsstimestamp" -Value $_.'wireless-network'.'bsstimestamp'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-device" -Value $_.'wireless-network'.'cdp-device'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-portid" -Value $_.'wireless-network'.'cdp-portid'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "seencard" -Value $_.'wireless-network'.'seencard'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "wireless-client" -Value $_.'wireless-network'.'wireless-client'

      $wirelessNetworkSSID = New-Object Object

      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "type" -Value $_.'wireless-network'.'ssid'.'type'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "max-rate" -Value $_.'wireless-network'.'ssid'.'max-rate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "packets" -Value $_.'wireless-network'.'ssid'.'packets'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "baeconrate" -Value $_.'wireless-network'.'ssid'.'beaconrate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wps" -Value $_.'wireless-network'.'ssid'.'wps'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "encryption" -Value $_.'wireless-network'.'ssid'.'encryption'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wpa_version" -Value $_.'wireless-network'.'ssid'.'wpa-version'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "essid" -Value $_.'wireless-network'.'ssid'.'essid'.InnerText

      $wirelessNetworkPackets = New-Object Object 

      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "llc" -Value $_.'wireless-network'.'packets'.'llc'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "data" -Value $_.'wireless-network'.'packets'.'data'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "crypt" -Value $_.'wireless-network'.'packets'.'crypt'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "total" -Value $_.'wireless-network'.'packets'.'total'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "fragments" -Value $_.'wireless-network'.'packets'.'fragments'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "retries" -Value $_.'wireless-network'.'packets'.'retries'

      $wirelessNetworkSNRInfo = New-Object Object 

      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'wireless-network'.'snr-info'.'last_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'wireless-network'.'snr-info'.'last_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'wireless-network'.'snr-info'.'last_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'wireless-network'.'snr-info'.'last_noise_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'wireless-network'.'snr-info'.'min_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'wireless-network'.'snr-info'.'min_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'wireless-network'.'snr-info'.'min_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'wireless-network'.'snr-info'.'min_noise_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'wireless-network'.'snr-info'.'max_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'wireless-network'.'snr-info'.'max_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'wireless-network'.'snr-info'.'max_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'wireless-network'.'snr-info'.'max_noise_rssi'

      $wirelessNetworkGPSInfo = New-Object Object 

      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'wireless-network'.'gps-info'.'min-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'wireless-network'.'gps-info'.'min-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'wireless-network'.'gps-info'.'min-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'wireless-network'.'gps-info'.'min-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'wireless-network'.'gps-info'.'max-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'wireless-network'.'gps-info'.'max-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'wireless-network'.'gps-info'.'max-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'wireless-network'.'gps-info'.'max-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'wireless-network'.'gps-info'.'peak-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'wireless-network'.'gps-info'.'peak-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'wireless-network'.'gps-info'.'peak-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'wireless-network'.'gps-info'.'avg-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'wireless-network'.'gps-info'.'avg-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'wireless-network'.'gps-info'.'avg-alt'

      $wirelessNetworkSeenCard = New-Object Object 

      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'wireless-network'.'seen-card'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'wireless-network'.'seen-time'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'wireless-network'.'seen-packets'


      $wirelessClient = New-Object Object

      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-mac" -Value $_.'wireless-network'.'wireless-client'.'client-mac'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-manuf" -Value $_.'wireless-network'.'wireless-client'.'client-manuf'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "channel" -Value $_.'wireless-network'.'wireless-client'.'channel'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "freqmhz" -Value $_.'wireless-network'.'wireless-client'.'freqmhz'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "maxseenrate" -Value $_.'wireless-network'.'wireless-client'.'maxseenrate'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "packets" -Value $_.'wireless-network'.'wireless-client'.'packets'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "datasize" -Value $_.'wireless-network'.'wireless-client'.'datasize'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "snr-info" -Value $_.'wireless-network'.'wireless-client'.'snr-info'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "gps-info" -Value $_.'wireless-network'.'wireless-client'.'gps-info'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "seen-card" -Value $_.'wireless-network'.'wireless-client'.'seen-card'

      $wirelessClientPackets = New-Object Object

      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "llc" -Value $_.'wireless-network'.'wireless-client'.'packets'.'llc'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "data" -Value $_.'wireless-network'.'wireless-client'.'packets'.'data'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "crypt" -Value $_.'wireless-network'.'wireless-client'.'packets'.'crypt'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "total" -Value $_.'wireless-network'.'wireless-client'.'packets'.'total'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "fragments" -Value $_.'wireless-network'.'wireless-client'.'packets'.'fragments'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "retries" -Value $_.'wireless-network'.'wireless-client'.'packets'.'retries'

      $wirelessClientSNRInfo = New-Object Object

      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'last_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'last_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'last_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'last_noise_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'min_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'min_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'min_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'min_noise_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'max_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'max_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'max_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'wireless-network'.'wireless-client'.'snr-info'.'max_noise_rssi'

      $wirelessClientGPSInfo = New-Object Object 

      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'min-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'min-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'min-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'min-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'max-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'max-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'max-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'max-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'peak-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'peak-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'peak-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'avg-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'avg-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'wireless-network'.'wireless-client'.'gps-info'.'avg-alt'

      $wirelessClientSeenCard = New-Object Object 

      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'wireless-network'.'wireless-client'.'seen-card'.'seen-uuid'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'wireless-network'.'wireless-client'.'seen-card'.'seen-time'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'wireless-network'.'wireless-client'.'seen-card'.'seen-packets'

    }

    $wirelessNetwork
    $wirelessNetworkSSID
    $wirelessNetworkPackets
    $wirelessNetworkSNRInfo
    $wirelessNetworkGPSInfo
    $wirelessNetworkSeenCard

    $wirelessClient
    $wirelessClientPackets
    $wirelessClientSNRInfo
    $wirelessClientGPSInfo
    $wirelessClientSeenCard

    $detectionRun
    $cardSouce
    

    Read-Host -Prompt "enter"