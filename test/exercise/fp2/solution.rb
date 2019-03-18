module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        array = self
        i = 0
        while i < array.length
          element = self[i]
          yield(element)
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |element| result << yield(element) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |element| result << element unless element.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(total = nil)
        array = self
        i = 1
        acc = self[0]
        while i < array.length
          element = self[i]
          acc = yield(acc, element)
          i += 1
        end
        total ? yield(total, acc) : acc
      end
    end
  end
end
