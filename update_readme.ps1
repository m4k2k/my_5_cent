
# add foldertree to readme.md

# variables
$readmePath = './readme.md'
$NL = [Environment]::NewLine
$start = '## Table of Content'

# prepare old readme
$content = Get-Content -Path $readmePath
$iof = $content.IndexOf($start)
# remove averything beyond $start
$content = $content[0..$iof]

# get foldertree
$t = $(tree /a /f ./)
# get second last item (index instead of count and remove last whitespace line)
$cnt = $t.Length -2
# remove first 3 rows (folderpath, volume-serial, etc)
$t = $t[3..$cnt]
$codeOpen = '```apache'
$codeClose = '```'

# convert string arrays to flat strings
$tString = [system.String]::Join("$NL", $t)
$cString = [system.String]::Join("$NL", $content)

# put everything together
$finalContent = $start + $NL + $NL + $codeOpen + $NL + $tString + $NL + $codeClose
$output = $cString -Replace $start, $finalContent

Write-Output $output
Set-Content -Path $readmePath -Value $output
