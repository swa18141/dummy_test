# Specify the API URL
$apiUrl = "https://mocktarget.apigee.net/json"

try {
    # Make the API request using Invoke-RestMethod
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ContentType "application/json" -ErrorAction Stop -TimeoutSec 60

    # Handle the API response here
    Write-Host "HTTP Status Code: $($response.StatusCode)"
    Write-Host "Response Content: $($response.Content)"

    # Save the response to a file
    $response.Content | Out-File "test.json" -Encoding UTF8
} catch {
    # Handle any errors that occur during the API request
    Write-Host "Error occurred: $_"
}

