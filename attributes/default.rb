# frozen_string_literal: true

default['ec2-drivers']['ena'] = {
  'version' => '2.5.0',
  'checksums' => {
    '2.2.11' => 'e01cf2456d399804593339507ebe89a197d6ed640e0730e0af25efb2681f6c60',
    '2.3.0'  => '0e16f24a438f8329c4982511a459d4e896caaba94384b042b4e0500f2de89990',
    '2.4.0'  => 'e20a9c8c328ac6d11e38bb59982b5556e4530b9fa59994e07cc8b3ed8144f222',
    '2.5.0'  => '0d6eaf972046b54595a4039104f507b35fb649310acb6eafdd64476586a38de3'
  }
}

default['ec2-drivers']['ixgbevf'] = {
  'version' => '4.11.1',
  'checksums' => {
    '4.9.3'  => '0a74665ac3e5e41b9bb12ef06617f3019980d2a66b3d1c52c33d3845dd557013',
    '4.10.2' => '699e9a78e474481fcbbfbad0a12d0edd704a19c6de173d3666c919c7e361868f',
    '4.11.1' => '0031d09a54af9ecf1216c185e4641e38527643afa09e78d1bd95752e49fe8985'
  },
  # See: https://downloadcenter.intel.com/download/18700/Ethernet-Intel-Network-Adapter-Virtual-Function-Driver-for-Intel-10-Gigabit-Ethernet-Network-Connections
  'intel_download_ids' => {
    '4.9.3'  => '30241',
    '4.10.2' => '30274',
    '4.11.1' => '18700'
  }
}

default['ec2-drivers']['localrepo'] = {
  'root' => '/usr/local/share/ec2-drivers-yumrepo'
}
