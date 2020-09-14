########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# 1. 4 different drivers
# 2. each driver has multiple trips
# 3. each trip has date, cost, rider, and rating

# Which layers are nested in each other?
# array of rides would be nested in the hash of drivers
# and hash of specific details would be nested inside the array

# Which layers of data "have" within it a different layer?
# the outside hash has an array inside
# the middle array has a hash inside

# Which layers are "next" to each other?
# the hashes of driver details would be next to each other inside the array of the driver's rides
########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# 1. a hash with the key as each driver
# 2. the values would be an array of each trip that driver did
# 3. within that array would be a hash to specify date, cost, rider_id, and rating

########################################################
# Step 3: Make the data structure!
# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

ride_share =
  {
    DR0001:
        [
          {
            Date: '3rd Feb 2016',
            Cost: 10,
            Rider_ID: 'RD0003',
            Rating: 3
          },
          {
            Date: '3rd Feb 2016',
            Cost: 30,
            Rider_ID: 'RD0015',
            Rating: 4
          },
          {
            Date: '5th Feb 2016',
            Cost: 45,
            Rider_ID: 'RD0003',
            Rating: 2
          }
        ],
    DR0002:
          [
            {
              Date: '3rd Feb 2016',
              Cost: 25,
              Rider_ID: 'RD0073',
              Rating: 5
            },
            {
              Date: '4th Feb 2016',
              Cost: 15,
              Rider_ID: 'RD0013',
              Rating: 1
            },
            {
              Date: '5th Feb 2016',
              Cost: 35,
              Rider_ID: 'RD0066',
              Rating: 3
            }
          ],
    DR0003:
          [
            {
              Date: '4th Feb 2016',
              Cost: 5,
              Rider_ID: 'RD0066',
              Rating: 5
            },
            {
              Date: '5th Feb 2016',
              Cost: 50,
              Rider_ID: 'RD0003',
              Rating: 2
            }
          ],
    DR0004:
          [
            {
              Date: '3rd Feb 2016',
              Cost: 5,
              Rider_ID: 'RD0022',
              Rating: 5
            },
            {
              Date: '4th Feb 2016',
              Cost: 10,
              Rider_ID: 'RD0022',
              Rating: 4
            },
            {
              Date: '5th Feb 2016',
              Cost: 20,
              Rider_ID: 'RD0073',
              Rating: 5
            }
          ]
  }

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

# use each_pair loop to print out the array length for each driver

ride_share.each_pair do |driver, rides|
  puts "Driver #{driver} has given #{rides.length} rides."
end

# - the total amount of money each driver has made

# define method to grab the cost value from each ride,
# put it in an array and add that array to a hash with the driver ID as the key

def revenue_hash(ride_data)
  driver_revenue = {}
  ride_data.each_pair do |driver, rides|
    total_cost = 0
    rides.each do |ride|
      total_cost += ride[:Cost]
    end
    driver_revenue[driver] = total_cost
    puts "Driver #{driver} made $#{total_cost}.00."
  end
  return driver_revenue
end

revenue_data = revenue_hash(ride_share)

# - the average rating for each driver

# define method to grab the rating value from each ride
# put it in an array and add that array to a hash with the driver ID as the key
# divide total rating by total rides for average
# doesn't take into account if a ride has no rating

def ratings_hash(ride_data)
  driver_rating = {}
  ride_data.each_pair do |driver, rides|
    total_rating = 0
    rides.each do |ride|
      total_rating += ride[:Rating].to_f
    end
    driver_rating[driver] = total_rating / rides.length
    puts "Driver #{driver} has an average rating of #{total_rating / rides.length}."
  end
  return driver_rating
end

ratings_data = ratings_hash(ride_share)

# - Which driver made the most money?

# Grab max value and corresponding key from the hash created in question 2

puts "#{revenue_data.key(revenue_data.values.max)} made the most money."

# - Which driver has the highest average rating?
# Grab max value and corresponding key from the hash created in question 3
# does not take into account if there are 2 drivers with the same highest average rating

puts "#{ratings_data.key(ratings_data.values.max)} had the highest average rating."

# For each driver, on which day did they make the most money?

# create an array to store each drivers revenue in their own array
# find max value and use that index to locate the date of max value

ride_share.each_pair do |driver, rides|
  cost_array = rides.map { |ride| ride[:Cost] }
  max_index = cost_array.index(cost_array.max)
  puts "Driver #{driver} made the most money on #{rides[max_index][:Date]}."
end
