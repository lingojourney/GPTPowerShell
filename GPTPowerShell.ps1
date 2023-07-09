function PrintAllFileContents($directoryPath, $fileExtensions) {
    # Check if the directory exists
    if (Test-Path -Path $directoryPath -PathType Container) {
        Write-Host "Files in Directory: $directoryPath"
        try {
            # Get all files in the directory
            $files = Get-ChildItem -Path $directoryPath -File -Recurse
            foreach ($file in $files) {
                # Check if the file has an included extension
                if ($fileExtensions -contains $file.Extension.ToLower()) {
                    Write-Host "File Name: $($file.Name)"
                    Write-Host "File Contents:"
                    try {
                        # Read the file contents
                        $fileContents = Get-Content -Path $file.FullName -Raw
                        Write-Host $fileContents
                    }
                    catch {
                        Write-Host "Failed to read the file: $_"
                    }
                    Write-Host
                }
            }
        }
        catch {
            Write-Host "Failed to get files in the directory: $_"
        }
    }
    else {
        Write-Host "Directory not found: $directoryPath"
    }
}
