#
#  LoremGenerator.rb
#  LoremGenerator
#
#  Created by Caius Durling on 01/04/2008.
#  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
#
# We only return strings from this to make it easier on ourselves elsewhere


class Array
  # Choose a random element
  def rand
    self[Kernel.rand(length)]
  end

  # Shuffle into a random order
  def shuffle
    self.sort_by{Kernel.rand}
  end
end

# Generates random text
# Most of this ripped straight out of the faker gem
class LoremGenerator
  
  Words = %w( alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat )

  def self.words(num = 3, prepend = false )
    # ignore prepend here
    Words.shuffle[0, num].join(" ")
  end

  def self.sentence(word_count = 4, prepend = false )
    out = []
    out << "lorem ipsum dolor" if prepend
    out << words(word_count + rand(6))
    out.join(" ").capitalize + '.'
  end

  def self.sentences(sentence_count = 3, prepend = false)
    sentences = []
    1.upto(sentence_count) do |i|
      sentences << sentence( rand(5) + 3, prepend ) if i == 1
      sentences << sentence unless i == 1
    end
    sentences.join(" ")
  end

  def self.paragraph(sentence_count = 3, prepend = false)
    sentences(sentence_count + rand(3), prepend )
  end

  def self.paragraphs(paragraph_count = 3, prepend = false)
    paragraphs = []
    1.upto(paragraph_count) do |i|
      paragraphs << paragraph( rand(5) + 3, prepend ) if i == 1
      paragraphs << paragraph unless i == 1
    end
    paragraphs.join("\n\n")
  end

end

puts LoremGenerator.paragraphs(2, true)