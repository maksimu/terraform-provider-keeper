# keeper_secret_driver_license Data Source

Use this data source to read secrets of type `driverLicense` stored in Keeper Vault

## Example Usage

```terraform
data "keeper_secret_driver_license" "driver_license" {
  path = "<record UID>"
}
```

## Argument Reference

* `path` - (Required) The UID of existing record in Keeper Vault.

## Attributes Reference

In addition to all arguments above, the following attributes are exported:

* `type` - The type of the record.
* `title` - Record title.
* `notes` - Record notes.
* `driver_license_number` - Driver's License Number.
* `name` - A list containing name information:
  - `first` - First name
  - `middle` - Middle name
  - `last` - Last name
* `birth_date` - Date of birth.
* `expiration_date` - Date of expiration.
* `address_ref` - A list containing address information:
  - `uid` - The address reference record UID
  - `street1` - Street line 1
  - `street2` - Street line 2
  - `city` - City
  - `state` - State
  - `zip` - Zip
  - `country` - Country
* `file_ref` - A list containing file reference information:
  - `uid` - File UID
  - `title` - File title
  - `name` - File name
  - `type` - File content type
  - `size` - File size
  - `last_modified` - File last modification timestamp
  - `url` - File download URL
  - `content_base64` - File content base64 encoded
