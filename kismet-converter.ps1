<#
  $inputPath = "${psscriptroot}\*.netxml"
    [xml]$xml = Get-Content $inputPath # load the .netxml file to be processed
#>

function parseNetXML ($file) { 

  $inputPath = $file
  $outputPath = $file

  [xml]$xml = Get-Content $inputPath # load the .netxml file to be processed

    $xml.'detection-run' | ForEach-Object {
  
      # Create the detection-run object.  We will be making a database of these objects
      $detectionRun = New-Object Object 

      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "kismet-version" -Value $_.'kismet-version'
      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "start-time" -Value $_.'start-time'

      $detectionRun | Export-Csv -Path "${psscriptroot}\detectionRun.csv" -Append -NoTypeInformation

    }

    $xml.'detection-run'.'card-source' | ForEach-Object {
      
    # Create the card-source object

      $cardSouce = New-Object Object 

      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-source" -Value $_.'card-source'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-name" -Value $_.'card-name'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-interface" -Value $_.'card-interace'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-type" -Value $_.'card-type'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-packets" -Value $_.'card-packets'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-hop" -Value $_.'card-hop'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-channels" -Value $_.'card-channels'

      

      
      $cardSouce | Export-Csv -Path "${psscriptroot}\cardSource.csv" -Append -NoTypeInformation

    }
      

      $xml.'detection-run'.'wireless-network' | ForEach-Object {

      $wirelessNetwork = New-Object Object

      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bssid" -Value $_.'BSSID'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "manuf" -Value $_.'manuf'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "channel" -Value $_.'channel'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "freqmhz" -Value $_.'freqmhz'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "snr-info" -Value $_.'snr-info'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "gps-info" -Value $_.'gps-info'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bsstimestamp" -Value $_.'bsstimestamp'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-device" -Value $_.'cdp-device'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-portid" -Value $_.'cdp-portid'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "seencard" -Value $_.'seencard'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "wireless-client" -Value $_.'wireless-client'

      

      
      $wirelessNetwork | Export-Csv -Path "${psscriptroot}\wirelessNetwork.csv" -Append -NoTypeInformation

      }


      $xml.'detection-run'.'wireless-network'.'ssid' | ForEach-Object {

      $wirelessNetworkSSID = New-Object Object

      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "type" -Value $_.'type'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "max-rate" -Value $_.'max-rate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "baeconrate" -Value $_.'beaconrate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wps" -Value $_.'wps'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "encryption" -Value $_.'encryption'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wpa_version" -Value $_.'wpa-version'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "essid" -Value $_.'essid'.InnerText

      

      
      $wirelessNetworkSSID | Export-Csv -Path "${psscriptroot}\wirelessNetworkSSID.csv" -Append -NoTypeInformation

      }
    
     

      $xml.'detection-run'.'wireless-network'.'packets' | ForEach-Object {

      $wirelessNetworkPackets = New-Object Object 

      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "llc" -Value $_.'llc'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "data" -Value $_.'data'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "crypt" -Value $_.'crypt'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "total" -Value $_.'total'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "fragments" -Value $_.'fragments'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "retries" -Value $_.'retries'

      

      
      $wirelessNetworkPackets | Export-Csv -Path "${psscriptroot}\wirelessNetworkPackets.csv" -Append -NoTypeInformation

      }

    

      $xml.'detection-run'.'wireless-network'.'snr-info' | ForEach-Object {

      $wirelessNetworkSNRInfo = New-Object Object 

      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'last_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'last_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'last_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'last_noise_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'min_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'min_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'min_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'min_noise_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'max_signal_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'max_noise_dbm'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'max_signal_rssi'
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'max_noise_rssi'

      

      
      $wirelessNetworkSNRInfo | Export-Csv -Path "${psscriptroot}\wirelessNetworkSNRInfo.csv" -Append -NoTypeInformation

      }

      

      $xml.'detection-run'.'wireless-network'.'gps-info' | ForEach-Object {


      $wirelessNetworkGPSInfo = New-Object Object 

      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'min-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'min-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'min-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'min-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'max-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'max-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'max-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'max-spd'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'peak-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'peak-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'peak-alt'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'avg-lat'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'avg-lon'
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'avg-alt'

      

      
      $wirelessNetworkGPSInfo | Export-Csv -Path "${psscriptroot}\wirelessNetworkGPSInfo.csv" -Append -NoTypeInformation

      }

      

      $xml.'detection-run'.'wireless-network'.'seen-card' | ForEach-Object {

      $wirelessNetworkSeenCard = New-Object Object 

      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'seen-card'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'seen-time'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'seen-packets'

      

      
      $wirelessNetworkSeenCard | Export-Csv -Path "${psscriptroot}\wirelessNetworkSeenCard.csv" -Append -NoTypeInformation

      }


      $xml.'detection-run'.'wireless-network'.'wireless-client' | ForEach-Object {

      $wirelessClient = New-Object Object

      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-mac" -Value $_.'client-mac'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-manuf" -Value $_.'client-manuf'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "channel" -Value $_.'channel'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "freqmhz" -Value $_.'freqmhz'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "snr-info" -Value $_.'snr-info'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "gps-info" -Value $_.'gps-info'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "seen-card" -Value $_.'seen-card'

      

      
      $wirelessClient | Export-Csv -Path "${psscriptroot}\wirelessClient.csv" -Append -NoTypeInformation


      }


    $xml.'detection-run'.'wireless-network'.'wireless-client'.'packets' | ForEach-Object {


      $wirelessClientPackets = New-Object Object

      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "llc" -Value $_.'llc'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "data" -Value $_.'data'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "crypt" -Value $_.'crypt'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "total" -Value $_.'total'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "fragments" -Value $_.'fragments'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "retries" -Value $_.'retries'

      

      
      $wirelessClientPackets | Export-Csv -Path "${psscriptroot}\wirelessClientPackets.csv" -Append -NoTypeInformation

    }



      $xml.'detection-run'.'wireless-network'.'wireless-client'.'snr-info' | ForEach-Object {

      $wirelessClientSNRInfo = New-Object Object

      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_dbm" -Value $_.'last_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_dbm" -Value $_.'last_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_signal_rssi" -Value $_.'last_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "last_noise_rssi" -Value $_.'last_noise_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_dbm" -Value $_.'min_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_dbm" -Value $_.'min_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_signal_rssi" -Value $_.'min_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "min_noise_rssi" -Value $_.'min_noise_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_dbm" -Value $_.'max_signal_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_dbm" -Value $_.'max_noise_dbm'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_signal_rssi" -Value $_.'max_signal_rssi'
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "max_noise_rssi" -Value $_.'max_noise_rssi'

      

      
      $wirelessClientSNRInfo | Export-Csv -Path "${psscriptroot}\wirelessClientSNRInfo.csv" -Append -NoTypeInformation

      }



      $xml.'detection-run'.'wireless-network'.'wireless-client'.'gps-info' | ForEach-Object {

      $wirelessClientGPSInfo = New-Object Object 

      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lat" -Value $_.'min-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-lon" -Value $_.'min-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-alt" -Value $_.'min-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "min-spd" -Value $_.'min-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lat" -Value $_.'max-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-lon" -Value $_.'max-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-alt" -Value $_.'max-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "max-spd" -Value $_.'max-spd'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lat" -Value $_.'peak-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-lon" -Value $_.'peak-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "peak-alt" -Value $_.'peak-alt'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lat" -Value $_.'avg-lat'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-lon" -Value $_.'avg-lon'
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "avg-alt" -Value $_.'avg-alt'

      

      
      $wirelessClientGPSInfo | Export-Csv -Path "${psscriptroot}\wirelessClientGPSInfo.csv" -Append -NoTypeInformation

      }


      $xml.'detection-run'.'wireless-network'.'wireless-client'.'seen-card' | ForEach-Object {

      $wirelessClientSeenCard = New-Object Object 

      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'seen-uuid'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'seen-time'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'seen-packets'

      

      
      $wirelessClientSeenCard | Export-Csv -Path "${psscriptroot}\wirelessClientSeenCard.csv" -Append -NoTypeInformation

    }

  }

  Get-ChildItem -Path ${psscriptroot} -Name -Filter "*.netxml" | ForEach-Object {

    $name = $_.Replace(".netxml","")
    mkdir $name
    $destination = Get-ChildItem -Path ./ -Directory $name
    Write-Host ("Processing " + $_ + "`n")
    parseNetXML ($_);
    Write-Host ($_ + " Processed...`n")
  
    Get-ChildItem -Path ${psscriptroot} -Name -Filter "*.csv" | ForEach-Object {
  
      Move-Item -Path .\*.csv -Destination $destination
  
    }
  }

    Read-Host -Prompt "enter"