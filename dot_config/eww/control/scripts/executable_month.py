#!/usr/bin/env python3
"""Calendar data for the control menu.

Usage: month.py            print the month at the current offset (used by status.sh)
       month.py reset      jump back to the current month
       month.py <+1|-1>    move by that many months
"""
import calendar
import datetime
import json
import os
import subprocess
import sys

FIRST_WEEKDAY = calendar.SUNDAY
STATUS = os.path.join(os.path.dirname(os.path.abspath(__file__)), "status.sh")


def eww(*args):
    return subprocess.run(["eww", *args], capture_output=True, text=True).stdout.strip()


def month_data(offset):
    today = datetime.date.today()
    year, month = divmod(today.year * 12 + today.month - 1 + offset, 12)
    month += 1

    weeks = [[{
        "day": d.day,
        "class": "today" if d == today else ("other" if d.month != month else ""),
    } for d in week] for week in calendar.Calendar(FIRST_WEEKDAY).monthdatescalendar(year, month)]
    while len(weeks) < 6:  # constant height across months
        weeks.append([{"day": "", "class": "other"} for _ in range(7)])

    return {
        "title": datetime.date(year, month, 1).strftime("%B %Y"),
        "weekdays": [calendar.day_abbr[(FIRST_WEEKDAY + i) % 7] for i in range(7)],
        "weeks": weeks,
    }


def main():
    offset = int(eww("get", "calendar-offset") or 0)
    if len(sys.argv) < 2:
        print(json.dumps(month_data(offset)))
        return
    offset = 0 if sys.argv[1] == "reset" else offset + int(sys.argv[1])
    eww("update", f"calendar-offset={offset}")
    status = subprocess.run([STATUS], capture_output=True, text=True).stdout
    eww("update", f"control={status}")


if __name__ == "__main__":
    main()
