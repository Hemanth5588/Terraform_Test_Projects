# Get the users from AAD
data "azuread_user" "my_users" {
  for_each = var.users
  	user_principal_name = each.value.email
}

resource "azuread_group" "my_group" {
  display_name     = "mygroup"
  security_enabled = true
}

# Only add users who are members to the group
resource "azuread_group_member" "my_group_members" {
  for_each = { for key, val in var.users :
  	key => val if val.user_type == "Member" }

  group_object_id     = azuread_group.my_group.id
  member_object_id = data.azuread_user.my_users[each.key].id
}