# The objective in this script is to start every stopped service.
# L'objectif de ce script est de démarrer chaque service arrêté.

#Name: Luiza Peres - Subir todos os serviços parados
#Date: 04/05/2019

# Show stopped services
# Afficher les services arrêtés


Get-Service | Where-Object{$_.Status -like 'Stopped'}

$stoppedServices = Get-WmiObject win32_service -Filter "startmode = 'manual' AND state != 'running'" | Select-Object -expand name

foreach ($stoppedService in $stoppedServices) {
  Set-Service -Service $stoppedService -Status Running
}

##### End of the Script #####
##### Fin du script #####