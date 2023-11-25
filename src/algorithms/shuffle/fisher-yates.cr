module Computer::Science::Shuffle
  class FisherYates
    def self.run
      arr : Array(Int32) = [1, 2, 3, 4, 5, 6, 7, 8]
      puts "Before shuffle"
      pp arr

      last_index : Int32 = arr.size - 1

      while last_index > 0
        random_index : Int32 = Random.new.rand(last_index)
        temp = arr[last_index]
        arr[last_index] = arr[random_index]
        arr[random_index] = temp
        last_index -= 1
      end

      puts "After shuffle"
      pp arr

    end
  end
end
