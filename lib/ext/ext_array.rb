module ExtArray
  def self.middle(list)
    middle_index = list.size / 2
    list.at middle_index - 1
  end
end
