<div class="chat-popup" id="chatPopup" style="display: none;">
    <div class="chat-popup-container">
        <!-- Header with controls -->
        <div class="popup-header">
            <div class="popup-title">Chat</div>
            <div class="popup-controls">
                <button class="btn btn-sm" id="closeChatPopup">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <!-- Main content -->
        <div class="popup-content">
            <div class="popup-sidenav-container">
                <!-- Contacts sidebar -->
                <div class="popup-contacts-sidebar">
                    <div class="search-container">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="searchQuery" placeholder="Search users">
                            <button class="btn btn-outline-primary" type="button" id="searchUsersBtn">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>

                    <div class="contacts-list" id="contactsList">
                        <!-- Contacts will be loaded here -->
                        <div class="loading-spinner text-center py-3">
                            <div class="spinner-border text-primary" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chat content -->
                <div class="popup-chat-content">
                    <div class="no-chat-selected" id="noChatSelected">
                        <i class="fas fa-comments fa-3x mb-3 text-primary"></i>
                        <h3>Select Chat</h3>
                        <p>Select a user to start a chat</p>
                    </div>

                    <div class="chat-container" id="chatContainer" style="display: none;">
                        <!-- Chat header -->
                        <div class="chat-header" id="chatHeader">
                            <!-- User info will be loaded here -->
                        </div>

                        <!-- Messages -->
                        <div class="popup-messages-container" id="messagesContainer">
                            <!-- Messages will be loaded here -->
                        </div>

                        <!-- Message input -->
                        <div class="message-input-container">
                            <form id="messageForm">
                                <div class="input-row">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="messageInput" placeholder="Type a message">
                                        <button type="button" class="btn btn-outline-primary" id="attachFileBtn">
                                            <i class="fas fa-paperclip"></i>
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="sendMessageBtn">
                                            <i class="fas fa-paper-plane"></i>
                                        </button>
                                    </div>
                                </div>
                                <input type="file" id="fileInput" style="display: none;">
                                <div class="attachment-preview" id="attachmentPreview" style="display: none;">
                                    <span id="attachmentName"></span>
                                    <button type="button" class="btn btn-sm" id="removeAttachmentBtn">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chat button -->
<div class="chat-button" id="chatButton">
    <button class="btn btn-primary btn-icon-only rounded-circle">
        <i class="fas fa-comments"></i>
    </button>
</div>
