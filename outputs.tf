output "keyspaces_tables_id" {
  description = "Map of id values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "keyspaces_tables_arn" {
  description = "Map of arn values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "keyspaces_tables_capacity_specification" {
  description = "Map of capacity_specification values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.capacity_specification) if v.capacity_specification != null && length(v.capacity_specification) > 0 }
}
output "keyspaces_tables_client_side_timestamps" {
  description = "Map of client_side_timestamps values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.client_side_timestamps) if v.client_side_timestamps != null && length(v.client_side_timestamps) > 0 }
}
output "keyspaces_tables_comment" {
  description = "Map of comment values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.comment) if v.comment != null && length(v.comment) > 0 }
}
output "keyspaces_tables_default_time_to_live" {
  description = "Map of default_time_to_live values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.default_time_to_live if v.default_time_to_live != null }
}
output "keyspaces_tables_encryption_specification" {
  description = "Map of encryption_specification values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.encryption_specification) if v.encryption_specification != null && length(v.encryption_specification) > 0 }
}
output "keyspaces_tables_keyspace_name" {
  description = "Map of keyspace_name values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.keyspace_name if v.keyspace_name != null && length(v.keyspace_name) > 0 }
}
output "keyspaces_tables_point_in_time_recovery" {
  description = "Map of point_in_time_recovery values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.point_in_time_recovery) if v.point_in_time_recovery != null && length(v.point_in_time_recovery) > 0 }
}
output "keyspaces_tables_region" {
  description = "Map of region values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.region if v.region != null && length(v.region) > 0 }
}
output "keyspaces_tables_schema_definition" {
  description = "Map of schema_definition values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.schema_definition) if v.schema_definition != null && length(v.schema_definition) > 0 }
}
output "keyspaces_tables_table_name" {
  description = "Map of table_name values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.table_name if v.table_name != null && length(v.table_name) > 0 }
}
output "keyspaces_tables_tags" {
  description = "Map of tags values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "keyspaces_tables_tags_all" {
  description = "Map of tags_all values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "keyspaces_tables_ttl" {
  description = "Map of ttl values across all keyspaces_tables, keyed the same as var.keyspaces_tables"
  value       = { for k, v in aws_keyspaces_table.keyspaces_tables : k => one(v.ttl) if v.ttl != null && length(v.ttl) > 0 }
}

