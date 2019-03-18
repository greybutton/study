module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length >= 2 && film['rating_kinopoisk'].to_f.positive?
        end
        sum_rating = films.inject(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        middle_rating = sum_rating / films.length
        middle_rating
      end

      def chars_count(films, threshold)
        selected = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        count = selected.inject(0) { |sum, film| sum + film['name'].scan(/и/).count }
        count
      end
    end
  end
end
