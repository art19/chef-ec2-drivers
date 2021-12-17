# frozen_string_literal: true

default['ec2-drivers']['ena'] = {
  'version'   => '2.6.0',
  'install'   => true,
  'checksums' => {
    '2.2.11' => 'e01cf2456d399804593339507ebe89a197d6ed640e0730e0af25efb2681f6c60',
    '2.3.0'  => '0e16f24a438f8329c4982511a459d4e896caaba94384b042b4e0500f2de89990',
    '2.4.0'  => 'e20a9c8c328ac6d11e38bb59982b5556e4530b9fa59994e07cc8b3ed8144f222',
    '2.5.0'  => '0d6eaf972046b54595a4039104f507b35fb649310acb6eafdd64476586a38de3',
    '2.6.0'  => '3c5909e16ef18b7c5fdf26511c4e6eea1787ca59ef936161873de7ef12a20a4c'
  }
}

default['ec2-drivers']['ixgbevf'] = {
  'version'            => '4.13.3',
  'install'            => true,
  'checksums'          => {
    '4.9.3'  => '0a74665ac3e5e41b9bb12ef06617f3019980d2a66b3d1c52c33d3845dd557013',
    '4.10.2' => '699e9a78e474481fcbbfbad0a12d0edd704a19c6de173d3666c919c7e361868f',
    '4.11.1' => '0031d09a54af9ecf1216c185e4641e38527643afa09e78d1bd95752e49fe8985',
    '4.12.4' => 'd81f981dea85165057e92bd0d32c41f990890c57c35e2f0857229c9e490f7a1b',
    '4.13.3' => 'b03010df2c491192dfda489fb6b5a99e83670ac9bc12fc76b1a144ddb2af3f76'
  },
  # See: https://downloadcenter.intel.com/download/18700/Ethernet-Intel-Network-Adapter-Virtual-Function-Driver-for-Intel-10-Gigabit-Ethernet-Network-Connections
  # This is the ID in the downloadmirror.intel.com download URL + /eng if it's there
  'intel_download_ids' => {
    '4.9.3'  => '30241/eng',
    '4.10.2' => '30274/eng',
    '4.11.1' => '18700/eng',
    '4.12.4' => '18700/eng',
    '4.13.3' => '682694'
  }
}

default['ec2-drivers']['localrepo'] = {
  'root' => '/usr/local/share/ec2-drivers-yumrepo'
}
