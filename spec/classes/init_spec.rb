require 'spec_helper'

describe "openstack_lb" do 
  let :params do 
    { :controller_virtual_ip => '10.0.0.1',
      :controller_state => 'MASTER',
      :controller_names => [
        'controller-001', 'controller-002', 'controller-003',
      ],
      :controller_ipaddresses => [ '10.0.0.2', '10.0.0.3', '10.0.0.4' ],
    }
  end

  let :facts do
    { :osfamily => 'Debian',
      :concat_basedir => '/tmp',
    }
  end

  context "Without swift" do
    it { should contain_sysctl__value('net.ipv4.ip_nonlocal_bind') }
    it { should contain_keepalived__instance('50') }
    it { should_not contain_keepalived__instance('51') }
  end
end
