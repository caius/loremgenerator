#
#  LoremController.rb
#  LoremGenerator
#
#  Created by Caius Durling on 01/04/2008.
#  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
#

class LoremController < NSObject
  
  ib_outlet :text_out, :lorem, :what_to_generate, :how_many_to_generate, :start_with_lorem
  
  def generate
    
    what = @what_to_generate.cell.titleOfSelectedItem
    amount = @how_many_to_generate.intValue
    
    lorem = @start_with_lorem.state == 1
    puts lorem
    output = @lorem.generate( what, amount, lorem )
    
    @text_out.setString( output )
  end
  
end