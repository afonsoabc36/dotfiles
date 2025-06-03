"""Script to send notifications on my google calendar events."""
import os
import datetime
import subprocess
import pytz
from googleapiclient.discovery import build
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from google_auth_oauthlib.flow import InstalledAppFlow

# Allow read only access
SCOPES = ['https://www.googleapis.com/auth/calendar.readonly']

# Paths for credential and token files
TOKEN_FILE = os.path.expanduser('~/.config/google_calendar/token.json')
CREDENTIALS_FILE = os.path.expanduser('~/.config/google_calendar/credentials.json')

PORTUGAL_TZ = pytz.timezone('Europe/Lisbon')

def get_calendar_service():
    """Function to get the token from credential and return the calendar service."""
    creds = None
    # Load saved token if it exists
    if os.path.exists(TOKEN_FILE):
        creds = Credentials.from_authorized_user_file(TOKEN_FILE, SCOPES)
    # If no valid credentials, authenticate user
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(CREDENTIALS_FILE, SCOPES)
            creds = flow.run_local_server(port=0)  # Opens browser for Google login
        # Save the credentials for next run
        with open(TOKEN_FILE, 'w') as token:
            token.write(creds.to_json())
    service = build('calendar', 'v3', credentials=creds)
    return service

def main():
    """Main function of the module."""
    service = get_calendar_service()
    now_local = datetime.datetime.now(PORTUGAL_TZ)
    # Convert now_local to UTC ISO string for Google API
    now_utc_iso = now_local.astimezone(pytz.utc).isoformat()
    events_result = service.events().list(
        calendarId='primary',
        timeMin=now_utc_iso,
        maxResults=10,
        singleEvents=True,
        orderBy='startTime'
    ).execute()
    events = events_result.get('items', [])

    for event in events:
        start_str = event['start'].get('dateTime', event['start'].get('date'))
        summary = event.get('summary', 'No Title')

        if 'dateTime' in event['start']:
            event_time = datetime.datetime.fromisoformat(start_str.replace('Z', '+00:00'))
        else:  # All day event
            event_time = datetime.datetime.fromisoformat(start_str + 'T00:00:00+00:00')

        event_time_local = event_time.astimezone(PORTUGAL_TZ)
        diff_minutes = (event_time_local - now_local).total_seconds() / 60

        # Notify if event starts in next 30 minutes (including now)
        if 0 <= diff_minutes <= 30:
            urgency = 'low'
            duration = 10000
            if diff_minutes <= 5:
                urgency = 'critical'
                duration = 12000
            elif diff_minutes <= 10:
                urgency = 'normal'
                duration = 10000
            else:
                urgency = 'low'
                duration = 8000

            subprocess.run([
                'notify-send',
                f'--urgency={urgency}',
                f'--expire-time={duration}',
                f'Upcoming Event: {summary}',
                f'Starts at: {event_time_local.strftime("%Y-%m-%d %H:%M %Z")}'
            ])

if __name__ == '__main__':
    main()
