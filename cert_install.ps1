#Clear-Host

$temp = $env:temp
$c1 = $env:temp + "\" + "russian_trusted_root_ca.cer"
$c2 = $env:temp + "\" + "russian_trusted_sub_ca.cer"

#Remove-Item $c1
#Remove-Item $c2

Invoke-WebRequest https://gu-st.ru/content/Other/doc/russian_trusted_root_ca.cer -outfile $c1
Invoke-WebRequest https://gu-st.ru/content/Other/doc/russian_trusted_sub_ca.cer -outfile $c2

Start-Sleep -s 5

$params1 = @{
    FilePath = $c1
    CertStoreLocation = 'Cert:\CurrentUser\Root'
}

$params2 = @{
    FilePath = $c2
    CertStoreLocation = 'Cert:\CurrentUser\Root'
}

if ((Test-Path $c1) -and (Test-Path $c2)) {
    # Import-Certificate -Filepath $c1 -CertStoreLocation = 'Cert:\CurrentUser\Root'
    # Import-Certificate -Filepath $c2 -CertStoreLocation = 'Cert:\CurrentUser\Root'
    Import-Certificate @params1
    Import-Certificate @params2
    # Write-Output 'exists'
}
