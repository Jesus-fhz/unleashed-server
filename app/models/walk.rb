class Walk < ApplicationRecord
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode

    
    belongs_to :pet, optional: true
    belongs_to :user, optional: true

    enum status: [:pending, :accepted, :ongoing, :finished] # maybe cancelled 
    STATUSES = [:pending, :accepted, :ongoing, :finished] # 0, 1, 2, 3
    validates :status, presence: true
    
    # 1. Converts all origin & destination addresses to the API query form
    # 2. Performs HTTP API request
    # 3. Writes the results to their respective TravelTime table rows. 
    # 4. updates the total_travel_time
    def self.find_travel_duration origin, destination #NOTE: this function can be used for one origin and one destination or an array of each
        #1. 
        destination = ''
        origin = ''

        origins.each do |o|
            origin += "#{o.street_address} #{o.suburb.name} NSW Australia".gsub(/\s/,'%20') + '%2CMA%7C'
        end

        destinations.each do |d|
            destination += "#{d.street_address} #{d.suburb.name} NSW Australia".gsub(/\s/,'%20') + '%2CMA%7C'
        end
            
        url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&mode=transit&key=AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko")

        #2.
        api_obj = HTTParty.get(url)
        
        #3.
        api_obj['rows'].each.with_index do |row, i|
            row['elements'].each.with_index do |el, j|
                #TODO: I think I need to check if the item exists

                
                ### TODO: need to check if the status returns ZERO RESULTS.
                
                current_travel_time = TravelTime.find_by(rental_id: origins[i].id, destination_id: destinations[j].id)
                
                if current_travel_time.present?
                    current_travel_time.update!(
                        rental_id: origins[i].id, # TODO: I think I can remove these id values because they don't change
                        destination_id: destinations[j].id,
                        duration: el['duration']['value']
                    )
                else
                    TravelTime.create!(
                        rental_id: origins[i].id,
                        destination_id: destinations[j].id,
                        duration: el['duration']['value']
                    )
                end
            end
        end
        
        #4.
        self.update_travel_duration origins
    end

    def self.update_travel_duration rentals
        rentals.each do |rental|
            rental.total_travel_time = rental.travel_times.sum(&:duration) 
            rental.save
        end
    end
end