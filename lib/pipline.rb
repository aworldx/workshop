module Pipline
  autoload 'ExtArray', 'ext/ext_array'

  def self.plural(str, symbol)
    str.end_with?("s") ? str : "#{str}#{symbol}"
  end

  def self.main
    files = Dir.foreach(".").select { |f| !f.start_with?(".") }.sort()
    middle_file_name = ExtArray.middle(files)
    plur_name = plural(middle_file_name, "s").upcase
  end
end
