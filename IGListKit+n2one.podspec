Pod::Spec.new do |s|
  s.name = 'IGListKit+n2one'
  s.version = '1.0.0.0'
  s.summary = 'A data-driven UICollectionView framework.'
  s.homepage = 'https://github.com/sunbohong/IGListKit/tree/n2one'
  s.description = 'A data-driven UICollectionView framework for building fast and flexible lists.'

  s.license =  { :type => 'BSD' }
  s.authors = '酷酷的哀殿'
  s.social_media_url = 'https://github.com/sunbohong'
  s.source = {
    :git => 'https://github.com/sunbohong/IGListKit.git',
    :tag => s.version.to_s,
    :branch => 'n2one'
  }

  s.source_files = 'Source/**/*.{h,m,mm}'
  s.private_header_files = 'Source/Internal/*.h'

  s.requires_arc = true
  s.platform = :ios, '8.0'

  s.frameworks = 'UIKit'
  s.library = 'c++'
  s.pod_target_xcconfig = {
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
       'CLANG_CXX_LIBRARY' => 'libc++'
  }
end
