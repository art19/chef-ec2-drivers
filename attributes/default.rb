# frozen_string_literal: true

default['ec2-drivers']['ena'] = {
  'version' => '2.2.11',
  'checksums' => {
    '2.2.11' => 'e01cf2456d399804593339507ebe89a197d6ed640e0730e0af25efb2681f6c60'
  }
}

default['ec2-drivers']['ixgbevf'] = {
  'version' => '4.9.3',
  'checksums' => {
    '4.9.3' => '0a74665ac3e5e41b9bb12ef06617f3019980d2a66b3d1c52c33d3845dd557013'
  }
}

default['ec2-drivers']['localrepo'] = {
  'root' => '/usr/local/share/ec2-drivers-yumrepo'
}
