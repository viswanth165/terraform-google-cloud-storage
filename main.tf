resource "google_storage_bucket" "storage_bucket" {

  name          = var.name
  force_destroy = var.force_destroy
  location      = var.location
  project       = var.project
  storage_class = var.storage_class
  lifecycle_rule {
    action {
      type          = var.lifecycle_rule_action_type
      storage_class = var.lifecycle_rule_action_storage_class
    }
    condition {
      age                    = var.lifecycle_rule_condition_age
      created_before         = var.lifecycle_rule_condition_created_before
      with_state             = var.lifecycle_rule_condition_with_state
      matches_storage_class  = var.lifecycle_rule_condition_matches_storage_class
      num_newer_versions     = var.lifecycle_rule_condition_num_newer_versions
      custom_time_before     = var.lifecycle_rule_condition_custom_time_before
      days_since_custom_time = var.lifecycle_rule_condition_days_since_custom_time
      noncurrent_time_before = var.lifecycle_rule_condition_noncurrent_time_before

    }

  }
  versioning {
    enabled = var.versioning_enabled
  }
  website {
    main_page_suffix = var.website_main_page_suffix
    not_found_page   = var.website_not_found_page

  }
  cors {
    origin          = var.cors_origin
    method          = var.cors_method
    response_header = var.cors_response_header
    max_age_seconds = var.cors_max_age_seconds
  }
  retention_policy {
    is_locked        = var.retention_policy_is_locked
    retention_period = var.retention_policy_retention_period
  }
  labels = var.labels
  logging {
    log_bucket        = var.logging_log_bucket
    log_object_prefix = var.logging_log_object_prefix

  }
  encryption {
    default_kms_key_name = var.encryption_default_kms_key_name
  }
  requester_pays              = var.requester_pays
  uniform_bucket_level_access = var.uniform_bucket_level_access


}