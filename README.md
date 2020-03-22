# Simple FTP deploy action

Deploy files to an FTP server using GitHub actions

## Inputs

### `ftp_host`

**Required** FTP host.

### `ftp_username`

**Required** FTP username.

### `ftp_password`

**Required** FTP password.

### `local_source_dir`

**Required** The local folder to copy.

### `dist_target_dir`

**Required** The remote folder.

### `delete`

Delete files not present in the local folder on the remote folder. Default `"false"`.

## Example usage

```
uses: kevinpainchaud/simple-ftp-deploy-action@v1
with:
  ftp_host: ${{ secrets.FTP_HOST }}
  ftp_username: ${{ secrets.FTP_USERNAME }}
  ftp_password: ${{ secrets.FTP_PASSWORD }}
  local_source_dir: dist
  dist_target_dir: "www/my-app"
  delete: "true"
```
