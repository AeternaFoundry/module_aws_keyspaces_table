resource "aws_keyspaces_table" "keyspaces_tables" {
  for_each = var.keyspaces_tables

  keyspace_name        = each.value.keyspace_name
  table_name           = each.value.table_name
  default_time_to_live = each.value.default_time_to_live
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  schema_definition {
    dynamic "clustering_key" {
      for_each = each.value.schema_definition.clustering_key != null ? each.value.schema_definition.clustering_key : []
      content {
        name     = clustering_key.value.name
        order_by = clustering_key.value.order_by
      }
    }
    dynamic "column" {
      for_each = each.value.schema_definition.column
      content {
        name = column.value.name
        type = column.value.type
      }
    }
    dynamic "partition_key" {
      for_each = each.value.schema_definition.partition_key
      content {
        name = partition_key.value.name
      }
    }
    dynamic "static_column" {
      for_each = each.value.schema_definition.static_column != null ? each.value.schema_definition.static_column : []
      content {
        name = static_column.value.name
      }
    }
  }

  dynamic "capacity_specification" {
    for_each = each.value.capacity_specification != null ? [each.value.capacity_specification] : []
    content {
      read_capacity_units  = capacity_specification.value.read_capacity_units
      throughput_mode      = capacity_specification.value.throughput_mode
      write_capacity_units = capacity_specification.value.write_capacity_units
    }
  }

  dynamic "client_side_timestamps" {
    for_each = each.value.client_side_timestamps != null ? [each.value.client_side_timestamps] : []
    content {
      status = client_side_timestamps.value.status
    }
  }

  dynamic "comment" {
    for_each = each.value.comment != null ? [each.value.comment] : []
    content {
      message = comment.value.message
    }
  }

  dynamic "encryption_specification" {
    for_each = each.value.encryption_specification != null ? [each.value.encryption_specification] : []
    content {
      kms_key_identifier = encryption_specification.value.kms_key_identifier
      type               = encryption_specification.value.type
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = each.value.point_in_time_recovery != null ? [each.value.point_in_time_recovery] : []
    content {
      status = point_in_time_recovery.value.status
    }
  }

  dynamic "ttl" {
    for_each = each.value.ttl != null ? [each.value.ttl] : []
    content {
      status = ttl.value.status
    }
  }
}

