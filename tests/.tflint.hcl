config {
  call_module_type = "local"
  force            = false
}

# tests/*.tftest.hcl files have no `terraform {}` block of their own - `tflint
# --recursive` still walks into this directory (it can contain unit-test mock
# providers/config), so it needs its own copy of the root config to resolve
# `--config .tflint.hcl` relative to this directory. Both version rules are
# meaningless for a directory with no provider requirements to check.
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true
}
