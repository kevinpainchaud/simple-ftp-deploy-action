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

### `only_newer`

Download only newer files. Using time as default, see `ignore_time` option. Default `"false"`.

### `ignore_time`

Ignore time when deciding whether to download. Default `"false"`.

If you set to `"true"` the filesize will be used for deciding, this mean if you only change a typo in your document - without a change to the filesize - the file will be ignored.

### `exclude`

Ignore file(s) and/or directorie(s).

Fill an array of regex. E.g. `"'^logs/' '^README.md'"`

### `disable_ssl_certificate_verification`

Disable SSL certificate verification. Default `"true"`.

### `other_flags`

Optional, can be used to set raw string of flag(s) or option(s) for lftp eg. `"--no-empty-dirs --ascii"`, you can refer to the official docs for the full list of available flags and options. <https://lftp.yar.ru/lftp-man.html>

## Example usage

```bash
uses: kevinpainchaud/simple-ftp-deploy-action@v1.1.0
with:
  ftp_host: ${{ secrets.FTP_HOST }}
  ftp_username: ${{ secrets.FTP_USERNAME }}
  ftp_password: ${{ secrets.FTP_PASSWORD }}
  local_source_dir: "dist"
  dist_target_dir: "www/my-app"
  delete: "true"
  exclude: "'^logs/' '^README.md'"
```
