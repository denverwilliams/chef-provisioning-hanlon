require 'chef/provisioning'

class Chef::Resource::HanlonIpmi < Chef::Resource::LWRPBase
  self.resource_name = 'hanlon_ipmi'

  actions :power_on, :power_off, :nothing #, :delete # forthcoming
  default_action :power_on

  attribute :host, kind_of: String, name_attribute: true, required: true
  attribute :username, kind_of: String, default: 'admin', required: true
  attribute :password, kind_of: String, default: 'P@ssw0rd', required: true

end
