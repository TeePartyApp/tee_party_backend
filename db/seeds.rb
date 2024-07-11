require 'faker'
require 'http'
require 'uri'

# Use Cities API to pull random cities in America


cities = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", "Phoenix, AZ", "Philadelphia, PA", "San Antonio, TX", "San Diego, CA", "Dallas TX", "Jacksonville, FL" "Fort Worth, TX","Austin, TX", "San Jose, CA", "Charlotte, NC", "Columbus, OH", "Indianapolis, IA", "San Francisco, CA", "Seattle, WA", "Denver, CO", "Oklahoma City, OK", "Nashville, TN", "Washington, DC", "El Paso, TX", "Las Vegas, NV", "Boston, MA", "Detroit, MI", "Portland, OR", "Louisville, KY", "Memphis, TN", "Baltimore, MD", "Albuquerque, NM", "Milwaukee, WI", "Tucson, AZ", "Fresno, CA", "Sacramento, CA", "Atlanta, GA", "Mesa, AZ", "Kansas City, MO", "Colorado Springs, CO", "Raleigh, NC", "Omaha, TX", "Miami, FL", "Virginia Beach, VA", "Long Beach, CA", "Oakland, CA", "Minneapolis, MN", "Bakersfield, CA", "Tulsa, OK", "Tampa, FL", "Arlington, TX", "Aurora, CO", "Wichita, KS", "Cleveland, OH", "New Orleans, LA", "Henderson, NV", "Honolulu, HI", "Anaheim, CA", "Orlando, FL", "Riverside, CA", "Lexington, KY", "Stockton, CA", "Irvine, CA", "Corpus Christi, TX", "Cincinnati, OH", "Santa Ana, CA", "Greensboro, NC", "Pittsburgh, PA", "Newark, NJ", "St. Paul, MN", "Durham, NC", "Lincoln, NE", "Jersey City, NJ", "Plano, TX", "Anchorage, AK", "Madison, WI", "Chandler, AZ", "Reno, NV", "Gilbert, AZ", "St. Louis, MO", "Chula Vista, CA", "Buffalo, NY", "Fort Wayne, IN", "Lubbock, TX", "St. Petersburg, FL", "Toledo, OH", "Laredo, TX", "Port St. Lucie, FL", "Glendale, AZ", "Chesapeake, VA", "Winston-Salem, NC", "Irving, TX", "Scottsdale, AZ", "Garland, TX", "Enterprise, NV", "Arlington, VA", "Boise, ID", "Cape Coral, FL", "Frisco, TX", "Richmond, VA", "Spokane, WA", "Norfolk, VA", "Huntsville, AL", "Fremont, CA", "San Bernardino, CA", "Tacoma, WA",
"Spring Valley, NV", "Santa Clarita, CA", "Hialeah, FL", "Modesto, CA", "McKinney, TX", "Fontana, CA", "Baton Rouge, LA", "Moreno Valley, CA", "Salt Lake City, UT", "Sioux Falls, SD", "Fayetteville, NC", "Des Moines, IA", "Worcester, MA", "Yonkers, NY", "Rochester, NY", "Little Rock, AK", "Grand Prairie, TX", "Tallahassee, FL", "Amarillo, TX", "Peoria, AZ", "Augusta, GA" "Knoxville, TN", "Columbus, GA", "Sunrise Manor, NV", "Vancouver, WA", "Oxnard, CA", "Overland Park, KS", "Grand Rapids, MI", "Birmingham, Al", "Montgomery, AL", "Tempe, AZ", "Brownsville, TX", "Providence, RI", "Huntington Beach, CA", "Paradise, NV", "Chattanooga, TN", "Akron, OH", "Clarksville,TN", "Fort Lauderdale, Fl", "Ontario, CA", "Glendale, CA", "Newport News, VA", "Cary
Mobile, AL", "Elk Grove, CA", "Eugene, OR", "Salem, OR", "Aurora, IL", "Santa Rosa, CA", "Shreveport, LA", "Rancho Cucamonga, CA", "Pembroke Pines, FL", "Springfield, MO", "Fort Collins, TX", "Murfreesboro, TN", "Oceanside, CA", "Garden Grove, CA", "Denton, TX", "Lancaster, CA", "Surprise, AZ", "Roseville, CA", "Killeen, TX", "Corona, CA", "Palmdale, CA", "Salinas, CA", "Charleston, SC",
"Macon, GA", "Lakewood, CO", "Paterson, NJ", "Hollywood, FL", "Alexandria, VA", "Hayward, CA", "Springfield, MA", "Kansas City, KS", "Bellevue, WA", "Sunnyvale, CA", "Joliet, IL", "Naperville, IL", "Olathe, KS", "Bridgeport, CT", "McAllen, TX", "Savannah, GA", "Escondido, CA", "Gainesville, FL", "Mesquite, TX", "Waco,TX", "Visalia, CA", "Thornton, CO", "Rockford, IL", "Syracuse, NY", "Pasadena, CA", "Columbia, SC", "Pomona, CA", "Palm Bay, FL", "Jackson, MS", "Victorville, CA", "Midland, TX", "Meridian, ID", "Miramar, FL", "Metairie, LA", "Orange, CA", "Fullerton, CA", "New Haven, CT", "Hampton, VA", "Torrance, CA", "Stamford, CT", "Lewisville, TX", "Warren, MI", "Fargo, ND", "Elizabeth, NJ", "Cedar Rapids, IA", "Coral Springs, FL", "Dayton, OH", "Round Rock, TX", "Sterling Heights, MI", "Carrollton, TX", "West Valley City, UT", "Kent, WA", "Pasadena, TX", "Santa Clara, CA", "Norman, OK", "Columbia, MO", "Abilene, TX", "Athens, GA", "Pearland, TX", "Clovis, CA", "College Station, TX", "West Palm Beach, FL", "Topeka, KS", "Lakeland, FL", "Wilmington, NC", "Simi Valley, CA", "Allentown, PA", "Lehigh Acres, FL", "Rochester, NY", "Thousand Oaks, CA", "The Woodlands, TX", "Billings, MT", "Vallejo, CA", "Lafayette, LA", "Concord, CA", "Fairfield, CA", "Broken Arrow, OK", "Arvada, CO", "Independence, MO", "Spring Hill, FL", "Hartford, CT", "Nampa, ID",
"Cambridge, MA", "Ann Arbor, MI", "Antioch, CA", "High Point, NC", "New Braunfels, TX", "Berkeley, CA", "League City, TX", "Menifee, CA", "Richardson, TX", "Clearwater, FL", "Goodyear, AZ", "Odessa, TX", "Las Cruces, NM", "Manchester, NH", "Waterbury, CT", "Evansville, IN", "Westminster, CO", "West Jordan, UT", "Pompano Beach, FL", "Brandon, FL", "Buckeye, AZ", "Conroe, TX", "Lowell, MA", "Greeley, CO", "Tuscaloosa, AL", "Allen, TX", "Richmond, CA", "Carlsbad, CA", "Elgin, IL", "Provo, UT", "Rio Rancho, NM", "Murrieta, CA", "Lansing, MI", "Springfield, IL", "Concord, NC", "South Fulton, GA", "Tyler, TX", "Beaumont, TX", "Everett, WA", "Temecula, CA", "Pueblo, CO", "Sparks, NV", "Miami Gardens, FL", "Santa Maria, CA"]


# Create user database

1000.times do
  random_city = cities.sample
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    location: random_city,
    handicap: rand(0..36),
    gir: rand(0..18),
    fairways_hit: rand(0..14),
    putts_per_round: rand(18..50),
    password_digest: "password",
  )
end