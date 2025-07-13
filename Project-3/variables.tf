variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "users" {
  description = "List of users"
  type = map(object({
    email = string
    user_type = string
  }))
  default = {
    "member1" = {
      email = "member1@abc.com"
      user_type = "Member"
    },
    "member2" ={
      email = "member2@abc.com"
      user_type = "Member"
    },
    "guest1" = {
      email = "guest1@abc.com"
      user_type = "Guest"
    }
  }
}