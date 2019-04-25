function parseNetXML ($file) { 

  $inputPath = $file

  [xml]$xml = Get-Content $inputPath # load the .netxml file to be processed

    $xml.'detection-run' | ForEach-Object {
  
      # Create the detection-run object.  We will be making a database of these objects
      $detectionRun = New-Object Object 

      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "start-time" -Value $_.'start-time'
      Add-Member -InputObject $detectionRun -MemberType NoteProperty -Name "kismet-version" -Value $_.'kismet-version'
    
      $detectionRun | Export-Csv -Path "${psscriptroot}\detectionRun.csv" -Append -NoTypeInformation

    }

    $xml.'detection-run'.'card-source' | ForEach-Object {
      
    # Create the card-source object.

      $UUID = $xml.'detection-run'.'start-time'
      $cardSouce = New-Object Object 

      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-source" -Value $_.'card-source'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-name" -Value $_.'card-name'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-interface" -Value $_.'card-interace'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-type" -Value $_.'card-type'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-packets" -Value $_.'card-packets'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-hop" -Value $_.'card-hop'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "card-channels" -Value $_.'card-channels'
      Add-Member -InputObject $cardSouce -MemberType NoteProperty -Name "start-time" -Value $UUID

      $cardSouce | Export-Csv -Path "${psscriptroot}\cardSource.csv" -Append -NoTypeInformation

    }
    
    $xml.'detection-run'.'wireless-network' | ForEach-Object {

    # Create the wirelessNetworkObject

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetwork = New-Object Object

      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bssid" -Value $_.'BSSID'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "manuf" -Value $_.'manuf'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "channel" -Value $_.'channel'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "freqmhz-count" -Value $_.'freqmhz'.count
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "bsstimestamp" -Value $_.'bsstimestamp'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-device" -Value $_.'cdp-device'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "cdp-portid" -Value $_.'cdp-portid'
      Add-Member -InputObject $wirelessNetwork -MemberType NoteProperty -Name "start-time" -Value $UUID

      $wirelessNetwork | Export-Csv -Path "${psscriptroot}\wirelessNetwork.csv" -Append -NoTypeInformation

      }

      $xml.'detection-run'.'wireless-network'.'ssid' | ForEach-Object {

    # Create the wirelessNetworkSSID object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetworkSSID = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'ssid'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "type" -Value $_.'type'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "max-rate" -Value $_.'max-rate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "packets" -Value $_.'packets'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "beaconrate" -Value $_.'beaconrate'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wps" -Value $_.'wps'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "encryption-count" -Value $_.'encryption'.count
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "wpa_version" -Value $_.'wpa-version'
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "essid" -Value $_.'essid'.InnerText
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessNetworkSSID -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessNetworkSSID | Export-Csv -Path "${psscriptroot}\wirelessNetworkSSID.csv" -Append -NoTypeInformation

      }
    
    $xml.'detection-run'.'wireless-network'.'packets' | ForEach-Object {

    # Create the wirelessNetworkPackets object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetworkPackets = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'packets'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "llc" -Value $_.'llc'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "data" -Value $_.'data'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "crypt" -Value $_.'crypt'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "total" -Value $_.'total'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "fragments" -Value $_.'fragments'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "retries" -Value $_.'retries'
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessNetworkPackets -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessNetworkPackets | Export-Csv -Path "${psscriptroot}\wirelessNetworkPackets.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'snr-info' | ForEach-Object {

    # Create the wirelessNetworksInfo Object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetworkSNRInfo = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'snr-info'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index] 

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
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessNetworkSNRInfo -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessNetworkSNRInfo | Export-Csv -Path "${psscriptroot}\wirelessNetworkSNRInfo.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'gps-info' | ForEach-Object {

    # Create the wirelessNetworkGPSInfo object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetworkGPSInfo = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'gps-info'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

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
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessNetworkGPSInfo -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessNetworkGPSInfo | Export-Csv -Path "${psscriptroot}\wirelessNetworkGPSInfo.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'seen-card' | ForEach-Object {

    # Create the wirelessNetworkSeenCard Object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessNetworkSeenCard = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'seen-card'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'seen-card'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'seen-time'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'seen-packets'
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessNetworkSeenCard -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessNetworkSeenCard | Export-Csv -Path "${psscriptroot}\wirelessNetworkSeenCard.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'wireless-client' | ForEach-Object {

    # create the wirelessClient object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessClient = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.indexOf($_);
      $BSSID = $xml.'detection-run'.'wireless-network'.'BSSID'[$index]

      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-mac" -Value $_.'client-mac'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "client-manuf" -Value $_.'client-manuf'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "channel" -Value $_.'channel'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "freqmhz-count" -Value $_.'freqmhz'.count
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "maxseenrate" -Value $_.'maxseenrate'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "datasize" -Value $_.'datasize'
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessClient -MemberType NoteProperty -Name "BSSID" -Value $BSSID

      $wirelessClient | Export-Csv -Path "${psscriptroot}\wirelessClient.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'wireless-client'.'packets' | ForEach-Object {

    # Create the wirelessClientPackets object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessClientPackets = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'packets'.indexOf($_);
      $clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index]

      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "llc" -Value $_.'llc'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "data" -Value $_.'data'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "crypt" -Value $_.'crypt'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "total" -Value $_.'total'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "fragments" -Value $_.'fragments'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "retries" -Value $_.'retries'
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessClientPackets -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

      $wirelessClientPackets | Export-Csv -Path "${psscriptroot}\wirelessClientPackets.csv" -Append -NoTypeInformation

    }

    $xml.'detection-run'.'wireless-network'.'wireless-client'.'snr-info' | ForEach-Object {

    # create the wirelessClientSNRinfo object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessClientSNRInfo = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'snr-info'.indexOf($_);
      $clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index]

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
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessClientSNRInfo -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

      $wirelessClientSNRInfo | Export-Csv -Path "${psscriptroot}\wirelessClientSNRInfo.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'wireless-client'.'gps-info' | ForEach-Object {

    # Create the wirelessClientGPSInfo object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessClientGPSInfo = New-Object Object
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'gps-info'.indexOf($_);
      $clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index] 

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
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessClientGPSInfo -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

      $wirelessClientGPSInfo | Export-Csv -Path "${psscriptroot}\wirelessClientGPSInfo.csv" -Append -NoTypeInformation

      }

    $xml.'detection-run'.'wireless-network'.'wireless-client'.'seen-card' | ForEach-Object {

      # Create wirelessClientSeenCard object

      $UUID = $xml.'detection-run'.'start-time'
      $wirelessClientSeenCard = New-Object Object 
      $index = $xml.'detection-run'.'wireless-network'.'wireless-client'.'seen-card'.indexOf($_);
      $clientMAC = $xml.'detection-run'.'wireless-network'.'wireless-client'.'client-mac'[$index] 

      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-uuid" -Value $_.'seen-uuid'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-time" -Value $_.'seen-time'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "seen-packets" -Value $_.'seen-packets'
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "start-time" -Value $UUID
      Add-Member -InputObject $wirelessClientSeenCard -MemberType NoteProperty -Name "client-mac" -Value $clientMAC

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

# Concatenate the "cardSource" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "cardSource.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_cardSource.csv" $linesToWrite
}

# Concatenate the "cardSource" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "detectionRun.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_detection.csv" $linesToWrite
}

# Concatenate the "wirelessClient" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessClient.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessClient.csv" $linesToWrite
}

# Concatenate the "wirelessClientGPSInfo" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessClientGPSInfo.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessClientGPSInfo.csv" $linesToWrite
}

# Concatenate the "wirelessClientPackets" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessClientPackets.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessClientPackets.csv" $linesToWrite
}
# Concatenate the "wirelessClientSeenCard" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessClientSeenCard.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessClientSeenCard.csv" $linesToWrite
}

# Concatenate the "wirelessClientSNRInfo" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessClientSNRInfo.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessClientSNRInfo.csv" $linesToWrite
}

# Concatenate the "wirelessNetwork" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetwork.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetwork.csv" $linesToWrite
}

# Concatenate the "wirelessNetworkGPSInfo" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetworkGPSInfo.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetworkGPSInfo.csv" $linesToWrite
}

# Concatenate the "wirelessNetworkPackets" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetworkPackets.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetworkPackets.csv" $linesToWrite
}

# Concatenate the "wirelessNetworkSeenCard" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetworkSeenCard.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetworkSeenCard.csv" $linesToWrite
}

# Concatenate the "wirelessNetworkSNRInfo" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetworkSNRInfo.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetworkSNRInfo.csv" $linesToWrite
}

# Concatenate the "wirelessNetworkSSID" .csv files 
$getFirstLine = $true
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "wirelessNetworkSSID.csv" | ForEach-Object {
  $filePath = $_
  $lines = Get-Content $filePath
  $linesToWrite = switch ($getFirstLine) {
    $true { $lines }
    $false { $lines | Select-Object -Skip 1 }
  }
  $getFirstLine = $false
  Add-Content "${psscriptroot}\composite_wirelessNetworkSSID.csv" $linesToWrite
}

# Move the composite output generated files into an output folder

$currentDate = get-date -Format FileDateTimeUniversal
$name = "KISMET-COMPOSITE-$currentDate"
mkdir $name
$destination = Get-ChildItem -Path ./ -Directory $name

Get-ChildItem -Path ${psscriptroot} -Name -Filter "composite*.csv" | ForEach-Object {

  Move-Item -Path .\*.csv -Destination $destination

}

# Log the count from our .csv files for reference
Get-ChildItem -Path ${psscriptroot} -Recurse -Name -Filter "*.csv" | ForEach-Object {

  $_ | Out-File log.txt -Append
  Import-Csv $_ | Measure-Object | Out-File log.txt -Append
  
}
# Move the logfile to the output folder

Move-Item -Path .\log.txt -Destination $destination


    Read-Host -Prompt "enter"