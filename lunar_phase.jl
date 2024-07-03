using Dates

function julian_day(year::Int, month::Int, day::Int)::Float64
    if month <= 2
        year -= 1
        month += 12
    end
    a = div(year, 100)
    b = 2 - a + div(a, 4)
    return floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + day + b - 1524.5
end

function moon_phase(date::Date)
    jd = julian_day(year(date), month(date), day(date))
    days_since_new = jd - 2451550.1
    new_moons = days_since_new / 29.53058867
    phase_index = new_moons - floor(new_moons)
    phase = Int(round(phase_index * 8)) % 8

    phases = ["New Moon", "Waxing Crescent", "First Quarter", "Waxing Gibbous", 
              "Full Moon", "Waning Gibbous", "Last Quarter", "Waning Crescent"]

    return phases[phase + 1]
end

function get_moon_phase(date::Date)::String
    return moon_phase(date)
end

if abspath(PROGRAM_FILE) == @__FILE__
    date_str = ARGS[1]
    date = Date(date_str)
    println(get_moon_phase(date))
end
