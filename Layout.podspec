Pod::Spec.new do |spec|
    spec.name = 'Layout'
    spec.version = '0.1.0'
    spec.license =  { :type => 'MIT', :file => "LICENSE" }
    spec.homepage = 'https://github.com/AugustRush/Layout'
    # spec.documentation_url = 'https://yogalayout.com/docs'
  
    spec.summary = "Layout is decleration UI layout library base on facebook's Yoga."
    spec.description = "Layout is decleration UI layout library base on facebook's Yoga."
  
    spec.authors = 'August'
    spec.source = {
      :git => 'https://github.com/AugustRush/Layout.git',
      :tag => spec.version.to_s,
    }
    spec.platforms = { :ios => "8.0", :osx => "10.7", :tvos => "10.0", :watchos => "2.0" }
    spec.module_name = 'Layout'
    spec.requires_arc = false
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES'
    }
    spec.source_files = 'Layout/Sources/*.{c,h,m,mm}'
    spec.public_header_files = 'Sources/{LayoutKit}.h'
    spec.dependency 'Yoga'
    
  
  end
