Neighbor Management System (NMS)
Overview
NMS is a web-based platform designed for social interaction and emergency alerts. It provides a user-friendly dashboard for managing profiles, interacting with posts, real-time chatting, and sending/receiving emergency alerts with location-sharing capabilities.
Core Features
I. User Management & Authentication

Registration & Login: Secure user sign-up and login.
Profile Management:
View full name, email, username, and profile picture.
Edit full name, email, and password (requires current password).
Upload/remove profile picture with validation and preview.


Sidebar Information: Displays logged-in user’s name and username.
Logout: Secure logout functionality.

II. News Feed & Post Interactions

News Feed: Displays chronological posts with author’s name, profile picture, content, optional image, like count, comments, and timestamp.
Post Creation: Create text posts with optional image uploads.
Post Deletion: Users can delete their own posts.
Likes: Toggle likes with a single click.
Comments:
View expandable comment sections.
Add comments to posts.
Delete own comments or, for post authors, any comment.
Dynamic comment count updates.



III. Real-Time Messaging

Contacts List: Shows users with avatars, names, usernames, last message preview, timestamp, and unread message count, sorted by recent activity.
Chat Interface: Displays chat history with sender/receiver differentiation, avatars, message content, and timestamps.
Send Messages: Real-time message sending.
Message Polling: Periodic checks for new messages.
New Message Popups: Notifications with sender details, reply, and dismiss options.
Unread Badges: Sidebar “Messages” shows unread count.

IV. Notifications System

Notification Feed: Lists all notifications with type (icon), message, and time, distinguishing read/unread statuses.
Notification Types: Emergency alerts (🚨), likes (❤️), comments (💬), new posts (📝), and messages (💬).
Notification Handling: Clicking marks as read and navigates to relevant content.
Real-Time Polling: Periodic checks for new notifications.
Popups: Styled by type with actions (e.g., “View Post,” “View Location,” “Dismiss”); emergency popups persist longer.
Unread Badges: Sidebar “Notifications” shows unread count.
Sound: Brief sound for new notifications/messages.

V. Emergency Alert System

Send Alert:
“EMERGENCY HELP” button with confirmation.
Uses geolocation and Google Geocoding API for address; sends alert with name, location (if available), and timestamp.
Alerts without location if access is denied.


Receive Alerts: High-priority notifications and popups for all users.
View Emergency Location:
Modal with Google Map, marker, person’s name, alert time, address, “Get Directions” link, and “Call 911” button.



