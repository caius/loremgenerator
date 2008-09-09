#
#  LoremController.rb
#  LoremGenerator
#
#  Created by Caius Durling on 01/04/2008.
#  Copyright (c) 2008 Hentan Software. All rights reserved.
#

class LoremController < NSObject
  
  ib_outlet :text_out, :lorem, :what_to_generate, :how_many_to_generate, :start_with_lorem, :wrap_in_html
  
  def generate
    
    what = @what_to_generate.cell.titleOfSelectedItem
    amount = @how_many_to_generate.intValue
    
    lorem = @start_with_lorem.state == 1
		tags = @wrap_in_html.state == 1

    output = @lorem.generate( what, amount, lorem, tags )
    
    @text_out.setString( output )
  end
  
end