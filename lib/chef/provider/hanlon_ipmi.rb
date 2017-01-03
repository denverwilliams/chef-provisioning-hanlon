require 'chef/provider/lwrp_base'
require 'pry'

class Chef::Provider::HanlonIpmi < Chef::Provider::LWRPBase
 # use_inline_resources

  provides :hanlon_ipmi
  def whyrun_supported?
    # I think we need a working @current_resource
    false #true
  end

  def nr
    new_resource
  end

  action :power_on do
    execute "Power On #{nr.host}" do
      command "ipmitool -I lanplus -U \"${USERNAME}\" -P \"${PASSWORD}\" -H '#{nr.host}' power on || true"
      environment({
                    'PASSWORD' => nr.password,
                    'USERNAME' => nr.username
                  })
    end
  end

  action :power_off do
    execute "Power On #{nr.host}" do
      command "ipmitool -I lanplus -U '#{nr.username}' -P '#{nr.password}' -H '#{nr.host}' power off || true"
    end
  end

  # def load_current_resource
  #   #FIXME maybe look at current power status and see if the node is aready on
  #   # power status
  #   # Chassis Power is off
  #   # Chassis Power is on
  #   @current_resource = Chef::Resource::HanlonIpmi.new(nr.name)
  # end
end
