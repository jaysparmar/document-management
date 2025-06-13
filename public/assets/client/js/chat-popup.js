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
let lastMessageTimestamp = null;
let pollingInterval = null;
let unreadCount = 0;
let isAtBottom = true; // Track if the user is at the bottom of the chat

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
let chatBadge;

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

    // Create badge element for unread messages
    chatBadge = document.createElement('span');
    chatBadge.className = 'chat-badge';
    chatBadge.style.display = 'none';
    chatBadge.textContent = '0';

    // Add badge to chat button
    if (chatButton) {
        chatButton.querySelector('button').appendChild(chatBadge);
    }

    // Log all DOM elements to check if they exist
    console.log('DOM elements initialized:');
    console.log('chatButton:', chatButton !== null);
    console.log('chatPopup:', chatPopup !== null);
    console.log('closeChatPopup:', closeChatPopup !== null);
    console.log('contactsList:', contactsList !== null);
    console.log('searchQuery:', searchQuery !== null);
    console.log('searchUsersBtn:', searchUsersBtn !== null);
    console.log('chatBadge:', chatBadge !== null);

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

            // Reset unread count when opening the chat
            updateUnreadCount(0);
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

    // Stop polling when the page is unloaded
    window.addEventListener('beforeunload', function() {
        console.log('Page unloading, stopping polling');
        stopPollingForUnreadMessages();
    });

    // Add scroll event listener to track if user is at bottom of chat
    if (messagesContainer) {
        messagesContainer.addEventListener('scroll', function() {
            isAtBottom = isUserAtBottom();
        });
    }

    // Start polling for unread messages
    startPollingForUnreadMessages();
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

// Start polling for unread messages
function startPollingForUnreadMessages() {
    console.log('Starting polling for unread messages');

    // Check for unread messages immediately
    checkUnreadCount();

    // Set up polling interval (every 2 seconds)
    pollingInterval = setInterval(function() {
        // Check for unread messages
        checkUnreadCount();

        // If a user is selected and the chat is open, check for new messages
        if (selectedUser && chatPopup.style.display === 'flex') {
            checkForNewMessages();
        }
    }, 2000); // 2000 ms = 2 seconds
}

// Stop polling for unread messages
function stopPollingForUnreadMessages() {
    console.log('Stopping polling for unread messages');

    if (pollingInterval) {
        clearInterval(pollingInterval);
        pollingInterval = null;
    }
}

// Check for unread messages count
function checkUnreadCount() {
    console.log('Checking unread count');

    fetch('/client-portal/chat/unread-count')
        .then(response => response.json())
        .then(data => {
            console.log('Unread count:', data.unreadCount);
            // Only update if the count has changed
            if (data.unreadCount !== unreadCount) {
                updateUnreadCount(data.unreadCount);
            }
        })
        .catch(error => {
            console.error('Error checking unread count:', error);
        });
}

// Update unread count badge
function updateUnreadCount(count) {
    unreadCount = count;

    if (count > 0) {
        chatBadge.textContent = count > 99 ? '99+' : count.toString();
        chatBadge.style.display = 'flex';
    } else {
        chatBadge.style.display = 'none';
    }
}

// Check for new messages
function checkForNewMessages() {
    if (!selectedUser) return;

    console.log('Checking for new messages with user:', selectedUser.id, unreadCount);
    if (unreadCount === 0) return;

    const formData = new FormData();
    formData.append('id', selectedUser.id);
    formData.append('type', selectedUser.type || 'user');

    // If we have a last message timestamp, include it
    if (lastMessageTimestamp) {
        formData.append('since', lastMessageTimestamp);
    }

    fetch('/client-portal/chat/new-messages', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
    })
        .then(response => response.json())
        .then(data => {
            console.log('New messages:', data.messages);

            // If there are new messages, append them to the chat
            if (data.messages && data.messages.length > 0) {
                appendNewMessages(data.messages);

                // Update the last message timestamp
                const lastMessage = data.messages[data.messages.length - 1];
                lastMessageTimestamp = lastMessage.createdAt;
            }

            // Only update unread count if there are new unread messages
            if (data.unreadCount !== unreadCount) {
                updateUnreadCount(data.unreadCount);
            }
        })
        .catch(error => {
            console.error('Error checking for new messages:', error);
        });
}

// Append new messages to the chat
function appendNewMessages(newMessages) {
    if (!newMessages || newMessages.length === 0) return;

    console.log('Appending new messages:', newMessages);

    // Add new messages to the messages array
    messages = messages.concat(newMessages);

    // Instead of rendering all messages, only render the new ones
    // by appending them to the existing message container
    if (newMessages.length > 0) {
        appendMessagesToContainer(newMessages);
    }
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

    // Set isAtBottom to true for initial load
    isAtBottom = true;

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

            // Update the last message timestamp if there are messages
            if (messages && messages.length > 0) {
                const lastMessage = messages[messages.length - 1];
                lastMessageTimestamp = lastMessage.createdAt;
                console.log('Last message timestamp set to:', lastMessageTimestamp);
            }
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

        // Fix date parsing by handling the microseconds format
        let time;
        try {
            // Replace microseconds with milliseconds (3 digits instead of 6)
            const fixedDateStr = message.createdAt.replace(/\.\d{6}Z/, (match) => {
                return '.' + match.substring(1, 4) + 'Z';
            });
            time = new Date(fixedDateStr).toLocaleString();
        } catch (e) {
            console.error('Error parsing date:', message.createdAt, e);
            time = 'Unknown date';
        }


        html += `
            <div class="message ${messageClass}">
                <div class="message-content">
                    <div class="message-text">${message.body}</div>
                    <div class="message-time">${time}</div>
                </div>
                ${message.attachment ? `
                    <div class="message-attachment">
                        <a href="${message.attachmentUrl || '#'}" target="_blank" class="attachment-link">
                            <i class="fas fa-paperclip"></i>
                            ${message.attachment}
                        </a>
                        ${isImage(message.attachment) && message.attachmentUrl ? `
                            <div class="image-preview">
                                <img src="${message.attachmentUrl}" alt="Image attachment" class="attachment-image" onerror="handleImageError(this)">
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

    // Only scroll to bottom if user was already at the bottom
    if (isAtBottom) {
        scrollToBottom();
    }
}

// Append only new messages to the container
function appendMessagesToContainer(newMessages) {
    if (!newMessages || newMessages.length === 0) return;

    // Create a document fragment to hold the new message elements
    const fragment = document.createDocumentFragment();

    newMessages.forEach(message => {
        const isOwnMessage = message.isMine !== undefined ? message.isMine : message.from_id === currentClientId && message.from_type === 'client';
        const messageClass = isOwnMessage ? 'own-message' : 'other-message';

        // Fix date parsing by handling the microseconds format
        let time;
        try {
            // Replace microseconds with milliseconds (3 digits instead of 6)
            const fixedDateStr = message.createdAt.replace(/\.\d{6}Z/, (match) => {
                return '.' + match.substring(1, 4) + 'Z';
            });
            time = new Date(fixedDateStr).toLocaleString();
        } catch (e) {
            console.error('Error parsing date:', message.createdAt, e);
            time = 'Unknown date';
        }

        // Create message element
        const messageElement = document.createElement('div');
        messageElement.className = `message ${messageClass}`;

        // Set message HTML
        messageElement.innerHTML = `
            <div class="message-content">
                <div class="message-text">${message.body}</div>
                <div class="message-time">${time}</div>
            </div>
            ${message.attachment ? `
                <div class="message-attachment">
                    <a href="${message.attachmentUrl || '#'}" target="_blank" class="attachment-link">
                        <i class="fas fa-paperclip"></i>
                        ${message.attachment}
                    </a>
                    ${isImage(message.attachment) && message.attachmentUrl ? `
                        <div class="image-preview">
                            <img src="${message.attachmentUrl}" alt="Image attachment" class="attachment-image" onerror="handleImageError(this)">
                        </div>
                    ` : isImage(message.attachment) ? `
                        <div class="image-error">Image URL not available</div>
                    ` : ''}
                </div>
            ` : ''}
        `;

        // Add to fragment
        fragment.appendChild(messageElement);
    });

    // Remove "no messages" div if it exists
    const noMessagesDiv = messagesContainer.querySelector('.no-messages');
    if (noMessagesDiv) {
        messagesContainer.removeChild(noMessagesDiv);
    }

    // Append all new messages at once
    messagesContainer.appendChild(fragment);

    // Only scroll to bottom if user was already at the bottom
    if (isAtBottom) {
        scrollToBottom();
    }
}

// Send message
function sendMessage(event) {
    console.log('sendMessage function called');
    event.preventDefault();

    if (!selectedUser || !messageInput.value.trim() && !fileInput.files[0]) {
        console.log('No message or file to send, or no selected user');
        return;
    }

    // Always scroll to bottom after sending a message
    isAtBottom = true;

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

// Check if user is at the bottom of the chat
function isUserAtBottom() {
    if (!messagesContainer) return true;

    // Calculate how far from the bottom (with a small threshold for rounding errors)
    const threshold = 30; // pixels
    const scrollBottom = messagesContainer.scrollTop + messagesContainer.clientHeight;
    const scrollHeight = messagesContainer.scrollHeight;

    return scrollBottom >= scrollHeight - threshold;
}

// Scroll to the bottom of the messages container
function scrollToBottom() {
    if (messagesContainer) {
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
}
