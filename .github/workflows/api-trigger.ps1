# Define your API endpoint URL
$apiUrl = "https://mocktarget.apigee.net/json"

# Define the request headers (if needed)
$headers = @{
    "Content-Type" = "application/json"
    # Add any other headers here if required
}
# Specify the path to the existing file in your repository
$filePath = "sample.txt"

# Sample data to add to the file
$sampleData = "This is some sample data to add to the file."

# Read the existing content of the file
$fileContent = Get-Content -Path $filePath -Raw

# Append the sample data to the file content
$newContent = $fileContent + "`n" + $sampleData

# Write the updated content back to the file
$newContent | Set-Content -Path $filePath

# Commit the changes to the repository
git add $filePath
git commit -m "Add sample data to sample.txt"
git push
# Send a POST request to the API endpoint
Invoke-RestMethod -Uri $apiUrl -Method:Get -ContentType "application/json" -ErrorAction:Stop -TimeoutSec 60 -OutFile 'sample.txt'

$response = Invoke-RestMethod -Uri $apiUrl -Method GET -ContentType "application/json" -ErrorAction Stop -TimeoutSec 60


# Print the response (optional)
Write-Host "API Response:"
Write-Host $response

