##Org Policy Updates##

resource "google_project_organization_policy" "orgPolicyUpdate_disableSerialPortLogging" {
  project     = local.generated_project_id
  constraint = "compute.disableSerialPortLogging"
  boolean_policy {
    enforced = false
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_organization_policy" "orgPolicyUpdate_requireOsLogin" {
  project     = local.generated_project_id
  constraint = "compute.requireOsLogin"
  boolean_policy {
    enforced = false
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_organization_policy" "orgPolicyUpdate_requireShieldedVm" {
  project     = local.generated_project_id
  constraint = "compute.requireShieldedVm"
  boolean_policy {
    enforced = false
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_organization_policy" "orgPolicyUpdate_vmCanIpForward" {
  project     = local.generated_project_id
  constraint = "compute.vmCanIpForward"
  list_policy {
    allow {
      all = true
    }
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_organization_policy" "orgPolicyUpdate_vmExternalIpAccess" {
  project     = local.generated_project_id
  constraint = "compute.vmExternalIpAccess"
  list_policy {
    allow {
      all = true
    }
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_organization_policy" "orgPolicyUpdate_restrictVpcPeering" {
  project     = local.generated_project_id
  constraint = "compute.restrictVpcPeering"
  list_policy {
    allow {
      all = true
    }
  }
  depends_on = [
    google_project.vertex_ai_project
  ]
}

/*******************************************
Introducing sleep to minimize errors from
dependencies having not completed
********************************************/
resource "time_sleep" "sleep_after_org_policy_updates" {
  create_duration = "120s"
  depends_on = [
    google_project_organization_policy.orgPolicyUpdate_disableSerialPortLogging,
    google_project_organization_policy.orgPolicyUpdate_requireOsLogin,
    google_project_organization_policy.orgPolicyUpdate_requireShieldedVm,
    google_project_organization_policy.orgPolicyUpdate_vmCanIpForward,
    google_project_organization_policy.orgPolicyUpdate_vmExternalIpAccess,
    google_project_organization_policy.orgPolicyUpdate_restrictVpcPeering
  ]
}