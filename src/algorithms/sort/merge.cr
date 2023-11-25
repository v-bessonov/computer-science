module Computer::Science::Sort
  class Merge < AbstractSort
    def self.run
      self.getFile
      lines = File.read_lines("#{Dir.current}/src/files/sort/#{@@fileName}")

      list = self.getLines(lines)
      sort(list)
    end

    private def self.sort(arr : Array(String))
      pp arr
      aux = Array(String).new(arr.size, "")
      sort(arr, aux, 0, arr.size - 1)
      puts "sorted"
      pp arr
    end

    private def self.sort(arr : Array(String), aux : Array(String), lo : Int32, hi : Int32)
      return if hi <= lo
      mid = lo + (hi - lo) // 2
      sort(arr, aux, lo, mid)
      sort(arr, aux, mid + 1, hi)
      merge_lists(arr, aux, lo, mid, hi)
    end

    private def self.merge_lists(arr : Array(String), aux : Array(String), lo : Int32, mid : Int32, hi : Int32)
      # precondition: a[lo .. mid] and a[mid+1 .. hi] are sorted subarrays
      # copy to aux[]
      k = lo
      while k <= hi
        aux[k] = arr[k]
        k += 1
      end
      # merge back to a[]
      i = lo
      j = mid + 1
      k = lo

      while k <= hi
        if i > mid
          # this copying is unnecessary
          arr[k] = aux[j]
          j += 1
        elsif j > hi
          arr[k] = aux[i]
          i += 1
        elsif less(aux[j], aux[i])
          arr[k] = aux[j]
          j += 1
        else
          arr[k] = aux[i]
          i += 1
        end
        k += 1
      end
      # postcondition: a[lo .. hi] is sorted
    end
  end
end
