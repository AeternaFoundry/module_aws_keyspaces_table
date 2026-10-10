variable "keyspaces_tables" {
  description = <<EOT
Map of keyspaces_tables, attributes below
Required:
    - keyspace_name
    - table_name
    - schema_definition (block):
        - clustering_key (optional, block):
            - name (required)
            - order_by (required)
        - column (required, block):
            - name (required)
            - type (required)
        - partition_key (required, block):
            - name (required)
        - static_column (optional, block):
            - name (required)
Optional:
    - default_time_to_live
    - region
    - tags
    - tags_all
    - capacity_specification (block):
        - read_capacity_units (optional)
        - throughput_mode (optional)
        - write_capacity_units (optional)
    - client_side_timestamps (block):
        - status (required)
    - comment (block):
        - message (optional)
    - encryption_specification (block):
        - kms_key_identifier (optional)
        - type (optional)
    - point_in_time_recovery (block):
        - status (optional)
    - ttl (block):
        - status (required)
EOT

  type = map(object({
    keyspace_name        = string
    table_name           = string
    default_time_to_live = optional(number)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    schema_definition = object({
      clustering_key = optional(list(object({
        name     = string
        order_by = string
      })))
      column = list(object({
        name = string
        type = string
      }))
      partition_key = list(object({
        name = string
      }))
      static_column = optional(list(object({
        name = string
      })))
    })
    capacity_specification = optional(object({
      read_capacity_units  = optional(number)
      throughput_mode      = optional(string)
      write_capacity_units = optional(number)
    }))
    client_side_timestamps = optional(object({
      status = string
    }))
    comment = optional(object({
      message = optional(string)
    }))
    encryption_specification = optional(object({
      kms_key_identifier = optional(string)
      type               = optional(string)
    }))
    point_in_time_recovery = optional(object({
      status = optional(string)
    }))
    ttl = optional(object({
      status = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        length(v.schema_definition.column) >= 1
      )
    ])
    error_message = "Each column list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        length(v.schema_definition.partition_key) >= 1
      )
    ])
    error_message = "Each partition_key list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        v.capacity_specification == null || (v.capacity_specification.read_capacity_units == null || (v.capacity_specification.read_capacity_units >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        v.capacity_specification == null || (v.capacity_specification.write_capacity_units == null || (v.capacity_specification.write_capacity_units >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        v.default_time_to_live == null || (v.default_time_to_live >= 1 && v.default_time_to_live <= 630720000)
      )
    ])
    error_message = "must be between 1 and 630720000"
  }
  validation {
    condition = alltrue([
      for k, v in var.keyspaces_tables : (
        can(regex("^[0-9A-Za-z][0-9A-Za-z_]{0,47}$", v.keyspace_name))
      )
    ])
    error_message = "The keyspace name can have up to 48 characters. It must begin with an alpha-numeric character and can only contain alpha-numeric characters and underscores."
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

