#
#  rb_main.rb
#  LoremGenerator
#
#  Created by Caius Durling on 01/04/2008.
#  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
#

# So the app works
require 'osx/cocoa'
include OSX

# So my stuff works
require "LoremGenerator"

def rb_main_init
  path = OSX::NSBundle.mainBundle.resourcePath.fileSystemRepresentation
  rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
  rbfiles -= [ File.basename(__FILE__) ]
  rbfiles.each do |path|
    require( File.basename(path) )
  end
end

if $0 == __FILE__ then
  rb_main_init
  OSX.NSApplicationMain(0, nil)
end
