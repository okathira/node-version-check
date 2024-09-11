# #!/usr/bin/env pwsh
# # $basedir を nodejsがインストールされている場所に合わせてデバッグしてみる
# $basedir=Split-Path $MyInvocation.MyCommand.Definition -Parent 
# $basedir=$env:NVM_SYMLINK

# $exe=""
# if ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) {
#   # Fix case when both the Windows and Linux builds of Node
#   # are installed in the same directory
#   $exe=".exe"
# }
# $ret=0
# if (Test-Path "$basedir/node$exe") {
#   # Support pipeline input
#   if ($MyInvocation.ExpectingInput) {
#     $input | & "$basedir/node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
#   } else {
#     & "$basedir/node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
#   }
#   $ret=$LASTEXITCODE
# } else {
#   # Support pipeline input
#   if ($MyInvocation.ExpectingInput) {
#     $input | & "node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
#   } else {
#     & "node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
#   }
#   $ret=$LASTEXITCODE
# }
# exit $ret

$exe=""
# $exe=".exe"

$basedir=(get-command yarn).Path | Split-Path -Parent

Write-Output "start"

if ($MyInvocation.ExpectingInput) {
  $input | & "$basedir/node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
} else {
  & "$basedir/node$exe"  "$basedir/node_modules/yarn/bin/yarn.js" $args
}

Write-Output "end"