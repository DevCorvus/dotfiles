from datetime import datetime
from time import sleep

sites = ["www.youtube.com", "www.twitch.tv"]

start_hour = 10
start_minute = 0

end_hour = 20
end_minute = 0

### LOGIC

script_start = "# siteblocker_script_start\n"
script_end = "# siteblocker_script_end\n"


def siteblocker(active: bool):

    new_file_content = None

    if active:
        with open("/etc/hosts", "r") as file:
            file_content = file.readlines()

            try:
                # This will trigger an error if it doesn't find the script_start line (No active script at all)
                file_content.index(script_start)

            except ValueError:

                last_line_index = len(file_content) - 1
                last_line = file_content[last_line_index]

                # Ensure that there's a line break at the end
                if last_line != "\n" or not last_line.endswith("\n"):
                    file_content.insert(last_line_index, "\n")

                next_to_last_line = last_line_index + 1

                file_content.insert(next_to_last_line, script_start)

                next_to_script_start_line = next_to_last_line + 1

                for site in sites:
                    file_content.insert(
                        next_to_script_start_line, f"127.0.0.1 {site}\n"
                    )

                file_content.insert(next_to_script_start_line + len(sites), script_end)

                new_file_content = "".join(file_content)

    else:
        with open("/etc/hosts", "r") as file:
            file_content = file.readlines()

            try:
                # Try to remove the script based on script_start and script_end lines
                # they will trigger an error if none of these are found
                script_start_index = file_content.index(script_start)
                script_end_index = file_content.index(script_end)

                items_to_delete = (script_end_index - script_start_index) + 1

                for _ in range(items_to_delete):
                    file_content.pop(script_start_index)

                new_file_content = "".join(file_content)

            except ValueError:
                pass

    if new_file_content:
        with open("/etc/hosts", "w") as file:
            file.write(new_file_content)


while True:
    now = datetime.today()

    sunday = 6  # This number represents Sunday considering that Monday starts at 0
    if datetime.weekday(now) == sunday:
        siteblocker(active=False)

        remaining_hours = 23 - now.hour
        remaining_minutes = 59 - now.minute
        seconds_in_minute = 60

        countdown = remaining_hours * remaining_minutes * seconds_in_minute

        sleep(countdown + 1)
        continue

    start_time = datetime(
        year=now.year,
        month=now.month,
        day=now.day,
        hour=start_hour,
        minute=start_minute,
        second=0,
    )

    end_time = datetime(
        year=now.year,
        month=now.month,
        day=now.day,
        hour=end_hour,
        minute=end_minute,
        second=0,
    )

    in_time_range = start_time <= now <= end_time

    siteblocker(active=in_time_range)

    if in_time_range:
        countdown = (end_time - now).seconds
    else:
        countdown = (start_time - now).seconds

    sleep(countdown + 1)
