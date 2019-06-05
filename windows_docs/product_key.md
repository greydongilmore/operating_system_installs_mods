# Obtain Windows Product Key

1. Open `Powershell` and run the following code

```console
(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
```