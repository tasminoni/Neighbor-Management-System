// API base URL
const API_BASE_URL = '/api/auth';

// Utility functions
function showError(elementId, message) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = message;
        element.style.display = 'block';
    }
}

function hideError(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = '';
        element.style.display = 'none';
    }
}

function showSuccess(elementId, message) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = message;
        element.style.display = 'block';
    }
}

function clearAllMessages() {
    const errorElements = document.querySelectorAll('.error-message');
    const successElements = document.querySelectorAll('.success-message');
    
    errorElements.forEach(element => {
        element.textContent = '';
        element.style.display = 'none';
    });
    
    successElements.forEach(element => {
        element.textContent = '';
        element.style.display = 'none';
    });
}

function setLoading(buttonId, isLoading) {
    const button = document.getElementById(buttonId);
    const btnText = button.querySelector('.btn-text');
    const btnLoader = button.querySelector('.btn-loader');
    
    if (isLoading) {
        button.disabled = true;
        btnText.style.display = 'none';
        btnLoader.style.display = 'block';
    } else {
        button.disabled = false;
        btnText.style.display = 'block';
        btnLoader.style.display = 'none';
    }
}

function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function validatePassword(password) {
    return password.length >= 6;
}

function validateUsername(username) {
    return username.length >= 3 && username.length <= 50;
}

// Login handler
async function handleLogin(event) {
    event.preventDefault();
    clearAllMessages();
    
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;
    
    // Client-side validation
    let hasErrors = false;
    
    if (!username) {
        showError('usernameError', 'Username is required');
        hasErrors = true;
    } else if (!validateUsername(username)) {
        showError('usernameError', 'Username must be between 3 and 50 characters');
        hasErrors = true;
    }
    
    if (!password) {
        showError('passwordError', 'Password is required');
        hasErrors = true;
    }
    
    if (hasErrors) return;
    
    setLoading('loginBtn', true);
    
    try {
        const response = await fetch(`${API_BASE_URL}/login`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                username: username,
                password: password
            })
        });
        
        const data = await response.json();
        
        if (response.ok) {
            // Store token in localStorage
            localStorage.setItem('authToken', data.token);
            localStorage.setItem('username', data.username);
            localStorage.setItem('email', data.email);
            
            showSuccess('successMessage', 'Login successful! Redirecting...');
            
            // Redirect to dashboard or home page after 1.5 seconds
            setTimeout(() => {
                window.location.href = '/dashboard.html'; // You can create this page later
            }, 1500);
            
        } else {
            showError('generalError', data.message || 'Login failed. Please try again.');
        }
        
    } catch (error) {
        console.error('Login error:', error);
        showError('generalError', 'Network error. Please check your connection and try again.');
    } finally {
        setLoading('loginBtn', false);
    }
}

// Signup handler
async function handleSignup(event) {
    event.preventDefault();
    clearAllMessages();
    
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    // Client-side validation
    let hasErrors = false;
    
    if (!username) {
        showError('usernameError', 'Username is required');
        hasErrors = true;
    } else if (!validateUsername(username)) {
        showError('usernameError', 'Username must be between 3 and 50 characters');
        hasErrors = true;
    }
    
    if (!email) {
        showError('emailError', 'Email is required');
        hasErrors = true;
    } else if (!validateEmail(email)) {
        showError('emailError', 'Please enter a valid email address');
        hasErrors = true;
    }
    
    if (!password) {
        showError('passwordError', 'Password is required');
        hasErrors = true;
    } else if (!validatePassword(password)) {
        showError('passwordError', 'Password must be at least 6 characters long');
        hasErrors = true;
    }
    
    if (!confirmPassword) {
        showError('confirmPasswordError', 'Please confirm your password');
        hasErrors = true;
    } else if (password !== confirmPassword) {
        showError('confirmPasswordError', 'Passwords do not match');
        hasErrors = true;
    }
    
    if (hasErrors) return;
    
    setLoading('signupBtn', true);
    
    try {
        const response = await fetch(`${API_BASE_URL}/signup`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                username: username,
                email: email,
                password: password
            })
        });
        
        const data = await response.json();
        
        if (response.ok) {
            // Store token in localStorage
            localStorage.setItem('authToken', data.token);
            localStorage.setItem('username', data.username);
            localStorage.setItem('email', data.email);
            
            showSuccess('successMessage', 'Account created successfully! Redirecting...');
            
            // Redirect to dashboard or home page after 1.5 seconds
            setTimeout(() => {
                window.location.href = '/dashboard.html'; // You can create this page later
            }, 1500);
            
        } else {
            showError('generalError', data.message || 'Registration failed. Please try again.');
        }
        
    } catch (error) {
        console.error('Signup error:', error);
        showError('generalError', 'Network error. Please check your connection and try again.');
    } finally {
        setLoading('signupBtn', false);
    }
}

// Check if user is already logged in
function checkAuthStatus() {
    const token = localStorage.getItem('authToken');
    if (token) {
        // You can add token validation here
        // For now, just redirect to dashboard if token exists
        const currentPage = window.location.pathname;
        if (currentPage === '/login.html' || currentPage === '/signup.html' || currentPage === '/') {
            window.location.href = '/dashboard.html';
        }
    }
}

// Logout function
function logout() {
    localStorage.removeItem('authToken');
    localStorage.removeItem('username');
    localStorage.removeItem('email');
    window.location.href = '/login.html';
}

// Initialize auth check when page loads
document.addEventListener('DOMContentLoaded', function() {
    checkAuthStatus();
});

// Add input event listeners for real-time validation
document.addEventListener('DOMContentLoaded', function() {
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    
    if (usernameInput) {
        usernameInput.addEventListener('input', function() {
            hideError('usernameError');
        });
    }
    
    if (emailInput) {
        emailInput.addEventListener('input', function() {
            hideError('emailError');
        });
    }
    
    if (passwordInput) {
        passwordInput.addEventListener('input', function() {
            hideError('passwordError');
        });
    }
    
    if (confirmPasswordInput) {
        confirmPasswordInput.addEventListener('input', function() {
            hideError('confirmPasswordError');
        });
    }
}); 