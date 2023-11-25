module Computer::Science::Sort
  class Insertion < AbstractSort
    def self.run
      self.getFile()
      lines = File.read_lines("#{Dir.current}/src/files/sort/#{@@fileName}")

      list = self.getLines(lines)
      sort(list)
    end

    private def self.sort(arr : Array(String))
      pp arr
      length = arr.size
      i = 0
      while i < length
        j = i
        while j > 0 && self.less(arr[j], arr[j-1])
          self.exch(arr, j, j-1)
          j-=1
        end
        i+=1
      end
      puts "sorted"
      pp arr
    end
  end
end
