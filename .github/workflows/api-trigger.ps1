
# Define your API endpoint URL
$apiUrl = "https://mocktarget.apigee.net/json"

# Define the request headers (if needed)
$headers = @{
    "Content-Type" = "application/json"
    # Add any other headers here if required
}

# Send a POST request to the API endpoint
Invoke-WebRequest -Uri $apiUrl -OutFile "test.json"

$response = Invoke-RestMethod -Uri $apiUrl -Method:Get -ContentType "application/json" -ErrorAction:Stop -TimeoutSec 60

# Print the response (optional)
Write-Host "API Response:"
Write-Host $response
