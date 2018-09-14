module Workshop
  module Main
    class ::String
      def plural(symbol)
        self.end_with?("s") ? self : "#{self}#{symbol}"
      end
    end

    def self.main
      files = Dir.foreach(".").select { |f| !f.start_with?(".") }
              .sort().middle().plural("s").upcase
    end
  end
end
