/**
 * Chat Popup JavaScript
 * This script handles the chat popup functionality for the client panel
 */

console.log('Chat popup script loaded');

// Check if jQuery is available
if (typeof jQuery !== 'undefined') {
    console.log('jQuery is available, version:', jQuery.fn.jquery);
} else {
    console.log('jQuery is NOT available');
}

// State
let selectedUser = null;
let contacts = [];
let messages = [];
let currentClientId = null;

// DOM Elements
let chatButton;
let chatPopup;
let closeChatPopup;
let contactsList;
let searchQuery;
let searchUsersBtn;
let noChatSelected;
let chatContainer;
let chatHeader;
let messagesContainer;
let messageForm;
let messageInput;
let attachFileBtn;
let fileInput;
let attachmentPreview;
let attachmentName;
let removeAttachmentBtn;

// Initialize
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOMContentLoaded event fired');

    // Check if chat button exists in the DOM before initialization
    const chatButtonCheck = document.getElementById('chatButton');
    console.log('Chat button exists in DOM:', chatButtonCheck !== null);

    if (chatButtonCheck) {
        console.log('Chat button HTML:', chatButtonCheck.outerHTML);
    }

    // Initialize DOM elements
    chatButton = document.getElementById('chatButton');
    chatPopup = document.getElementById('chatPopup');
    closeChatPopup = document.getElementById('closeChatPopup');
    contactsList = document.getElementById('contactsList');
    searchQuery = document.getElementById('searchQuery');
    searchUsersBtn = document.getElementById('searchUsersBtn');
    noChatSelected = document.getElementById('noChatSelected');
    chatContainer = document.getElementById('chatContainer');
    chatHeader = document.getElementById('chatHeader');
    messagesContainer = document.getElementById('messagesContainer');
    messageForm = document.getElementById('messageForm');
    messageInput = document.getElementById('messageInput');
    attachFileBtn = document.getElementById('attachFileBtn');
    fileInput = document.getElementById('fileInput');
    attachmentPreview = document.getElementById('attachmentPreview');
    attachmentName = document.getElementById('attachmentName');
    removeAttachmentBtn = document.getElementById('removeAttachmentBtn');

    // Log all DOM elements to check if they exist
    console.log('DOM elements initialized:');
    console.log('chatButton:', chatButton !== null);
    console.log('chatPopup:', chatPopup !== null);
    console.log('closeChatPopup:', closeChatPopup !== null);
    console.log('contactsList:', contactsList !== null);
    console.log('searchQuery:', searchQuery !== null);
    console.log('searchUsersBtn:', searchUsersBtn !== null);

    // Get the current client ID from the meta tag
    const clientIdMeta = document.querySelector('meta[name="client-id"]');
    if (clientIdMeta) {
        currentClientId = clientIdMeta.getAttribute('content');
    }

    // Check if chatButton exists
    if (!chatButton) {
        console.error('Chat button not found in the DOM');
        return;
    }

    // Event listeners
    console.log('Adding event listeners');

    // Single event listener for chat button to handle both toggling and loading contacts
    chatButton.addEventListener('click', function(event) {
        console.log('Chat button clicked');

        // Toggle chat popup
        toggleChatPopup();

        // Load contacts if the popup is being shown
        if (chatPopup.style.display === 'flex') {
            console.log('Loading contacts...');
            loadContacts();
        }
    });

    closeChatPopup.addEventListener('click', closeChatPopupHandler);
    searchUsersBtn.addEventListener('click', searchUsers);
    searchQuery.addEventListener('keyup', function(event) {
        if (event.key === 'Enter') {
            searchUsers();
        }
    });
    messageForm.addEventListener('submit', sendMessage);
    attachFileBtn.addEventListener('click', function() {
        fileInput.click();
    });
    fileInput.addEventListener('change', handleFileSelect);
    removeAttachmentBtn.addEventListener('click', removeAttachment);
});

// Toggle chat popup
function toggleChatPopup() {
    console.log('toggleChatPopup function called');
    console.log('Current chatPopup display style:', chatPopup.style.display);
    console.log('Current chatPopup computed style:', window.getComputedStyle(chatPopup).display);

    if (chatPopup.style.display === 'none' || chatPopup.style.display === '') {
        console.log('Showing chat popup');
        chatPopup.style.display = 'flex';
    } else {
        console.log('Hiding chat popup');
        chatPopup.style.display = 'none';
    }

    // Log the new display style after toggling
    setTimeout(() => {
        console.log('New chatPopup display style:', chatPopup.style.display);
        console.log('New chatPopup computed style:', window.getComputedStyle(chatPopup).display);
    }, 0);
}

// Close chat popup
function closeChatPopupHandler() {
    console.log('closeChatPopupHandler function called');
    chatPopup.style.display = 'none';
}

// Load contacts
function loadContacts() {
    console.log('loadContacts function called');

    // Show loading spinner
    contactsList.innerHTML = `
        <div class="loading-spinner text-center py-3">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    `;

    console.log('Making API call to /client-portal/chat/contacts');

    // Fetch contacts from the API
    fetch('/client-portal/chat/contacts', {
        method: 'GET',
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        credentials: 'same-origin'
    })
        .then(response => {
            console.log('API response received:', response);
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('API data received:', data);
            contacts = data;
            renderContacts(contacts);
        })
        .catch(error => {
            console.error('Error loading contacts:', error);
            contactsList.innerHTML = `
                <div class="alert alert-danger" role="alert">
                    Failed to load contacts
                </div>
            `;
        });
}

// Render contacts
function renderContacts(contacts) {
    if (contacts.length === 0) {
        contactsList.innerHTML = `
            <div class="no-contacts text-center py-3">
                No contacts found
            </div>
        `;
        return;
    }

    let html = '';
    contacts.forEach(contact => {
        html += `
            <div class="contact-item ${selectedUser && selectedUser.id === contact.id ? 'selected' : ''}"
                 data-id="${contact.id}"
                 data-type="${contact.type || 'user'}"
                 onclick="selectUserHandler(this)">
                <div class="contact-avatar">
                    <img src="${contact.avatar || '/assets/angular/browser/assets/images/user.jpg'}" alt="${contact.name}">
                </div>
                <div class="contact-info">
                    <div class="contact-name">
                        ${contact.name}
                        ${contact.type === 'client' ? '<span class="badge bg-info">Client</span>' : ''}
                    </div>
                </div>
            </div>
        `;
    });

    contactsList.innerHTML = html;
}

// Select user handler (global function to be called from onclick)
window.selectUserHandler = function(element) {
    const userId = element.getAttribute('data-id');
    const userType = element.getAttribute('data-type') || 'user';

    // Find the user in contacts
    const user = contacts.find(contact => contact.id === userId);
    if (!user) return;

    // Update selected user
    selectedUser = user;

    // Update UI
    document.querySelectorAll('.contact-item').forEach(item => {
        item.classList.remove('selected');
    });
    element.classList.add('selected');

    // Show chat container and hide no chat selected message
    noChatSelected.style.display = 'none';
    chatContainer.style.display = 'flex';

    // Update chat header
    chatHeader.innerHTML = `
        <div class="user-info">
            <img src="${user.avatar || '/assets/angular/browser/assets/images/user.jpg'}" alt="${user.name}">
            <div class="user-details">
                <h3>
                    ${user.name}
                    ${user.type === 'client' ? '<span class="badge bg-info">Client</span>' : ''}
                </h3>
            </div>
        </div>
    `;

    // Load messages
    loadMessages(userId, userType);
};

// Load messages
function loadMessages(userId, userType = 'user') {
    console.log('loadMessages function called with userId:', userId, 'userType:', userType);

    // Show loading spinner
    messagesContainer.innerHTML = `
        <div class="loading-spinner text-center py-3">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    `;

    // Fetch messages from the API
    const formData = new FormData();
    formData.append('id', userId);
    formData.append('type', userType);

    console.log('Making API call to /client-portal/chat/messages');

    fetch('/client-portal/chat/messages', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        credentials: 'same-origin'
    })
        .then(response => response.json())
        .then(data => {
            messages = data.messages;
            renderMessages(messages);
        })
        .catch(error => {
            console.error('Error loading messages:', error);
            messagesContainer.innerHTML = `
                <div class="alert alert-danger" role="alert">
                    Failed to load messages
                </div>
            `;
        });
}

// Render messages
function renderMessages(messages) {
    if (messages.length === 0) {
        messagesContainer.innerHTML = `
            <div class="no-messages text-center py-3">
                No messages yet
            </div>
        `;
        return;
    }

    let html = '';
    messages.forEach(message => {
        const isOwnMessage = message.isMine !== undefined ? message.isMine : message.from_id === currentClientId && message.from_type === 'client';
        const messageClass = isOwnMessage ? 'own-message' : 'other-message';
        const time = new Date(message.created_at).toLocaleString();

        html += `
            <div class="message ${messageClass}">
                <div class="message-content">
                    <div class="message-text">${message.body}</div>
                    <div class="message-time">${time}</div>
                </div>
                ${message.attachment ? `
                    <div class="message-attachment">
                        <a href="${message.attachment_url || '#'}" target="_blank" class="attachment-link">
                            <i class="fas fa-paperclip"></i>
                            ${message.attachment}
                        </a>
                        ${isImage(message.attachment) && message.attachment_url ? `
                            <div class="image-preview">
                                <img src="${message.attachment_url}" alt="Image attachment" class="attachment-image" onerror="handleImageError(this)">
                            </div>
                        ` : isImage(message.attachment) ? `
                            <div class="image-error">Image URL not available</div>
                        ` : ''}
                    </div>
                ` : ''}
            </div>
        `;
    });

    messagesContainer.innerHTML = html;

    // Scroll to bottom
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

// Send message
function sendMessage(event) {
    console.log('sendMessage function called');
    event.preventDefault();

    if (!selectedUser || !messageInput.value.trim() && !fileInput.files[0]) {
        console.log('No message or file to send, or no selected user');
        return;
    }

    console.log('Sending message to user:', selectedUser);

    const formData = new FormData();
    formData.append('message', messageInput.value);
    formData.append('id', selectedUser.id);
    formData.append('type', selectedUser.type || 'user');

    if (fileInput.files[0]) {
        console.log('Attaching file:', fileInput.files[0].name);
        formData.append('file', fileInput.files[0]);
    }

    // Disable form
    messageInput.disabled = true;
    attachFileBtn.disabled = true;

    console.log('Making API call to /client-portal/chat/send');

    fetch('/client-portal/chat/send', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        credentials: 'same-origin'
    })
        .then(response => response.json())
        .then(data => {
            // Add message to messages array
            messages.push(data.message);

            // Render messages
            renderMessages(messages);

            // Reset form
            messageForm.reset();
            removeAttachment();

            // Enable form
            messageInput.disabled = false;
            attachFileBtn.disabled = false;

            // Focus input
            messageInput.focus();
        })
        .catch(error => {
            console.error('Error sending message:', error);

            // Enable form
            messageInput.disabled = false;
            attachFileBtn.disabled = false;

            // Show error
            alert('Failed to send message');
        });
}

// Search users
function searchUsers() {
    console.log('searchUsers function called');
    const query = searchQuery.value.trim();

    if (!query) {
        console.log('No search query, loading all contacts');
        loadContacts();
        return;
    }

    console.log('Searching for users with query:', query);

    // Show loading spinner
    contactsList.innerHTML = `
        <div class="loading-spinner text-center py-3">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    `;

    // Fetch users from the API
    const formData = new FormData();
    formData.append('input', query);

    console.log('Making API call to /client-portal/chat/search');

    fetch('/client-portal/chat/search', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        credentials: 'same-origin'
    })
        .then(response => response.json())
        .then(data => {
            contacts = data;
            renderContacts(contacts);
        })
        .catch(error => {
            console.error('Error searching users:', error);
            contactsList.innerHTML = `
                <div class="alert alert-danger" role="alert">
                    Failed to search users
                </div>
            `;
        });
}

// Handle file select
function handleFileSelect(event) {
    if (event.target.files.length > 0) {
        const file = event.target.files[0];
        attachmentName.textContent = file.name;
        attachmentPreview.style.display = 'flex';
    }
}

// Remove attachment
function removeAttachment() {
    fileInput.value = '';
    attachmentPreview.style.display = 'none';
}

// Check if file is an image
function isImage(filename) {
    if (!filename) return false;
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    const extension = filename.split('.').pop()?.toLowerCase();
    return extension ? imageExtensions.includes(extension) : false;
}

// Handle image error
window.handleImageError = function(img) {
    // Hide the image if it fails to load
    img.style.display = 'none';

    // Log error for debugging
    console.error('Failed to load image:', img.src);

    // Show a user-friendly error message
    const errorDiv = document.createElement('div');
    errorDiv.className = 'image-error';
    errorDiv.textContent = 'Image could not be loaded';
    img.parentNode.appendChild(errorDiv);
};
