Pod::Spec.new do |s|
  s.name             = "ViewHider"
  s.version          = "0.1.0"
  s.summary          = "A simple helper for dynamic layouts"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
"This pod allows to manage constraints based on view hidden state directly in xib, without adding additional code."
                       DESC

  s.homepage         = "https://github.com/iThinker/ViewHider"
  s.license          = 'MIT'
  s.author           = { "Roman Temchenko" => "temchenko.r@gmail.com" }
  s.source           = { :git => "https://github.com/iThinker/ViewHider.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ViewHider' => ['Pod/Assets/*.png']
  }
end
