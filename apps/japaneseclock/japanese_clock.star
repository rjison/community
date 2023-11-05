"""
Applet: Japanese Clock
Summary: Japanese Clock Display
Description: Displays time in Japanese.
Author: Robert Ison
"""

load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("render.star", "render")
load("schema.star", "schema")
load("sunrise.star", "sunrise")
load("time.star", "time")

# Default configuration values
DEFAULT_LOCATION = {
    "lat": 35.652832,
    "lng": 139.839478,
    "locality": "Tokyo, Japan",
}

DEFAULT_TIMEZONE = "Asia/Tokyo"
DEFAULT_IS_24_HOUR_FORMAT = True
DEFAULT_HAS_LEADING_ZERO = False
DEFAULT_HAS_FLASHING_SEPERATOR = True
DEFAULT_COLOR_DAYTIME = "#FFFFFF"
DEFAULT_COLOR_NIGHTTIME = "#FFFFFF"


def main(config):
    # Get the current time in 24 hour format
    location = config.get("location")
    loc = json.decode(location) if location else DEFAULT_LOCATION
    timezone = loc.get("timezone", config.get("$tz", DEFAULT_TIMEZONE))  # Utilize special timezone variable
    now = time.now()

    # Fetch sunrise/sunset times
    lat, lng = float(loc.get("lat")), float(loc.get("lng"))
    rise = sunrise.sunrise(lat, lng, now)
    set = sunrise.sunset(lat, lng, now)

    # Because the times returned by this API do not include the date, we need to
    # strip the date from "now" to get the current time in order to perform
    # acurate comparissons.
    # Local time must be localized with a timezone
    current_time = time.parse_time(now.in_location(timezone).format("3:04:05 PM"), format = "3:04:05 PM", location = timezone)
    day_end = time.parse_time("11:59:59 PM", format = "3:04:05 PM", location = timezone)

    # Get config values
    is_24_hour_format = config.bool("is_24_hour_format", DEFAULT_IS_24_HOUR_FORMAT)
    has_leading_zero = config.bool("has_leading_zero", DEFAULT_HAS_LEADING_ZERO)
    has_flashing_seperator = config.bool("has_flashing_seperator", DEFAULT_HAS_FLASHING_SEPERATOR)

    # Set daytime color
    color_daytime = config.get("color_daytime", DEFAULT_COLOR_DAYTIME)

    # Set nighttime color
    color_nighttime = config.get("color_nighttime", DEFAULT_COLOR_NIGHTTIME)

    print_time = current_time

    print(print_time)
    print(day_end)
    print(timezone)


    return render.Root(
        delay = 500,  # in milliseconds
        max_age = 120,
        child = render.Box(
            child = render.Text("ごぜん", font = "5x8"),
        ),
    )
#5x8
#6x13
#CG-pixel-3x5-mono 
##CG-pixel-4x5-mono 
#Dina_r400-6 
#tb-8 
def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Location(
                id = "location",
                name = "Location",
                desc = "Location defining time to display and daytime/nighttime colors",
                icon = "locationDot",
            ),
            schema.Toggle(
                id = "is_24_hour_format",
                name = "24 hour format",
                icon = "clock",
                desc = "Display the time in 24 hour format.",
                default = DEFAULT_IS_24_HOUR_FORMAT,
            ),
            schema.Toggle(
                id = "has_leading_zero",
                name = "Add leading zero",
                icon = "creativeCommonsZero",
                desc = "Ensure the clock always displays with a leading zero.",
                default = DEFAULT_HAS_LEADING_ZERO,
            ),
            schema.Toggle(
                id = "has_flashing_seperator",
                name = "Enable flashing separator",
                icon = "gear",
                desc = "Ensure the clock always displays with a leading zero.",
                default = DEFAULT_HAS_FLASHING_SEPERATOR,
            ),
            schema.Color(
                id = "color_daytime",
                icon = "sun",
                name = "Daytime color",
                desc = "The color to use during daytime.",
                default = DEFAULT_COLOR_DAYTIME,
                palette = [
                    "#FFFFFF",
                ],
            ),
            schema.Color(
                id = "color_nighttime",
                icon = "moon",
                name = "Nighttime color",
                desc = "The color to use during nighttime.",
                default = DEFAULT_COLOR_NIGHTTIME,
                palette = [
                    "#220000",
                ],
            ),
        ],
    )
