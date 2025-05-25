// Dashboard functionality
document.addEventListener('DOMContentLoaded', function() {
    // Check if user is authenticated
    const token = localStorage.getItem('authToken');
    if (!token) {
        window.location.href = '/login.html';
        return;
    }
    
    // Load user data
    loadUserData();
    
    // Set login time
    setLoginTime();
});

function loadUserData() {
    const username = localStorage.getItem('username');
    const email = localStorage.getItem('email');
    
    if (username) {
        document.getElementById('welcomeMessage').textContent = `Welcome, ${username}!`;
        document.getElementById('userUsername').textContent = username;
    }
    
    if (email) {
        document.getElementById('userEmail').textContent = email;
    }
}

function setLoginTime() {
    const now = new Date();
    const loginTime = now.toLocaleString();
    document.getElementById('loginTime').textContent = loginTime;
}

// Add click handlers for action buttons
document.addEventListener('DOMContentLoaded', function() {
    const actionButtons = document.querySelectorAll('.action-btn');
    
    actionButtons.forEach(button => {
        button.addEventListener('click', function() {
            const buttonText = this.textContent.trim();
            
            // For now, just show an alert. You can implement actual functionality later
            switch(buttonText) {
                case 'View Network Status':
                    showComingSoon('Network Status monitoring');
                    break;
                case 'Manage Devices':
                    showComingSoon('Device management');
                    break;
                case 'View Reports':
                    showComingSoon('Reports and analytics');
                    break;
                case 'Settings':
                    showComingSoon('User settings');
                    break;
                default:
                    showComingSoon('This feature');
            }
        });
    });
});

function showComingSoon(feature) {
    alert(`${feature} is coming soon! This is a demo authentication system.`);
}

// Token validation (optional - for enhanced security)
async function validateToken() {
    const token = localStorage.getItem('authToken');
    if (!token) {
        logout();
        return false;
    }
    
    try {
        // You can implement a token validation endpoint in your backend
        // For now, we'll just check if the token exists
        return true;
    } catch (error) {
        console.error('Token validation failed:', error);
        logout();
        return false;
    }
}

// Periodic token validation (every 5 minutes)
setInterval(validateToken, 5 * 60 * 1000); 