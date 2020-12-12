# frozen_string_literal: true

default['ec2-drivers']['ena'] = {
  'version' => '2.2.11',
  'checksums' => {
    '2.2.11' => 'e01cf2456d399804593339507ebe89a197d6ed640e0730e0af25efb2681f6c60',
    '2.3.0'  => '0e16f24a438f8329c4982511a459d4e896caaba94384b042b4e0500f2de89990',
    '2.4.0'  => 'e20a9c8c328ac6d11e38bb59982b5556e4530b9fa59994e07cc8b3ed8144f222'
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
