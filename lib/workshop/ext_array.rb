module ExtArray
  class ::Array
    def middle
      middle_index = self.size / 2
      self.at middle_index - 1
    end
  end
end
