#
#  Lorem.rb
#  LoremGenerator
#
#  Created by Caius Durling on 01/04/2008.
#  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
#

class Lorem < NSObject
    
  def generate( what, amount, prepend )
    LoremGenerator.send(what.downcase.to_s, amount, prepend)
  end
  
end