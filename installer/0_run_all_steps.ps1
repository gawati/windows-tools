Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

$ScriptRoot = $PSScriptRoot + '\'

$Tasks = "1_install_requirements.ps1"
$Tasks | ForEach {
  $Script = $ScriptRoot + $_
  Start-Process "$psHome\powershell.exe" -wait -verb runas -ArgumentList "-noprofile -file ""$Script"""
  }

$Tasks = "2_deploy_minimal_VM.ps1", "3_cloneVM_installGAWATI.ps1"
$Tasks | ForEach {
  $Script = $ScriptRoot + $_
  Start-Process "$psHome\powershell.exe" -wait -ArgumentList "-noprofile -file ""$Script"""
  }

pause
