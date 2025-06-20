-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2025 at 03:13 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u277316404_alpha`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `pageId` char(36) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `name`, `order`, `pageId`, `code`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('0478e8b6-7d52-4c26-99e1-657a1c703e8b', 'DELETE_FILE_REQUEST', 4, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_DELETE_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('07ad64e9-9a43-40d0-a205-2adb81e238b1', 'Storage Settings', 2, '8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'SETTINGS_STORAGE_SETTINGS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', 'Edit User', 3, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_EDIT_USER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('165505b2-ad31-42c7-aafe-f66f291cb5a9', 'Manage Comment', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_MANAGE_COMMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', 'Delete Role', 4, '090ea443-01c7-4638-a194-ad3416a5ea7a', 'ROLE_DELETE_ROLE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('18d07817-4b47-4c84-b21f-abe05da5e1ba', 'Archive Document', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_ARCHIVE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('1ae728c8-58df-4e9f-b284-132dc3c8ff89', 'REJECT_FILE_REQUEST', 6, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_REJECT_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', 'View Document Audit Trail', 1, '2396f81c-f8b5-49ac-88d1-94ed57333f49', 'DOCUMENT_AUDIT_TRAIL_VIEW_DOCUMENT_AUDIT_TRAIL', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('1d768490-d67d-40b6-b610-22b17cc7ce2d', 'Add Indexing', 2, '0c8b0806-f33f-48b3-a326-dcc9cc1a65c7', 'DEEP_SEARCH_ADD_INDEXING', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('229150ef-9007-4c62-9276-13dd18294370', 'Restore Version', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_RESTORE_VERSION', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('229ad778-c7d3-4f5f-ab52-24b537c39514', 'Delete Document', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_DELETE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('239035d5-cd44-475f-bbc5-9ef51768d389', 'Create Document', 2, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_CREATE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('260d1089-46c7-4f53-83e6-f80b9b3fb823', 'Archive Document', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_ARCHIVE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('26e383c9-7f7f-4ed0-b78d-a2941f5b4fe7', 'Add Reminder', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_ADD_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('2e71e9d6-2302-44d8-b0f6-747b98d89125', 'UPDATE_FILE_REQUEST', 3, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_UPDATE_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('2ea6ba08-eb36-4e34-92d9-f1984c908b31', 'Share Document', 6, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_SHARE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('31cb6438-7d4a-4385-8a34-b4e8f6096a48', 'View Users', 1, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_VIEW_USERS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('374d74aa-a580-4928-848d-f7553db39914', 'Delete User', 4, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_DELETE_USER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('37db8a21-e552-466d-bcf4-f90f5e4e1008', 'VIEW_DETAIL', 9, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_VIEW_DETAIL', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('391c1739-1045-4dd4-9705-4a960479f0a0', 'Upload New Version', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_UPLOAD_NEW_VERSION', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('3ccaf408-8864-4815-a3e0-50632d90bcb6', 'Edit Reminder', 3, '97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', 'REMINDER_EDIT_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('3da78b4d-d263-4b13-8e81-7aa164a3688c', 'Add Reminder', 5, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_ADD_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('4071ed2e-56fb-4c5a-887d-8a175cac8d71', 'Restore Document', 4, '05edb281-cddb-4281-9ab3-fb90d1833c82', 'ARCHIVE_DOCUMENT_RESTORE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('41f65d07-9023-4cfb-9c7c-0e3247a012e0', 'Manage SMTP Settings', 1, '2e3c07a4-fcac-4303-ae47-0d0f796403c9', 'EMAIL_MANAGE_SMTP_SETTINGS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('44ecbcaf-6d4a-4fc2-911c-e96be65bffb2', 'Manage Comment', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_MANAGE_COMMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('4cce3cb4-5179-4fc7-b59c-7b15afc747f7', 'MANAGE_CLIENTS', 1, '34328287-3a37-4c70-ac61-b291c3ef5ade', 'CLIENTS_MANAGE_CLIENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('4f0e8a83-8a01-415e-88f5-c204369290de', 'Deep Search', 1, '0c8b0806-f33f-48b3-a326-dcc9cc1a65c7', 'DEEP_SEARCH_DEEP_SEARCH', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('57216dcd-1a1c-4f94-a33d-83a5af2d7a46', 'View Roles', 1, '090ea443-01c7-4638-a194-ad3416a5ea7a', 'ROLE_VIEW_ROLES', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('57f0b2ef-eeba-44a6-bd88-458003f013ef', 'Upload New Version', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_UPLOAD_NEW_VERSION', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('595a769d-f7ef-45f3-9f9e-60c58c5e1542', 'Send Email', 8, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_SEND_EMAIL', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', 'Delete Reminder', 4, '97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', 'REMINDER_DELETE_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('61de0ba3-f41f-4ca8-9af6-ec8dc456c16b', 'CREATE_FILE_REQUEST', 2, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_CREATE_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('63355376-2650-4949-9580-fc8c888353f0', 'Manage Open AI API Key', 2, '8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'SETTINGS_MANAGE_OPEN_AI_API_KEY', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('63ed1277-1db5-4cf7-8404-3e3426cb4bc5', 'View Documents', 1, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_VIEW_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('6719a065-8a4a-4350-8582-bfc41ce283fb', 'Download Document', 7, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_DOWNLOAD_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('6bc0458e-22f5-4975-b387-4d6a4fb35201', 'Create Reminder', 2, '97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', 'REMINDER_CREATE_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('6f2717fc-edef-4537-916d-2d527251a5c1', 'View Reminders', 1, '97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', 'REMINDER_VIEW_REMINDERS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('72ca5c91-b415-4997-a234-b4d71ba03253', 'Manage Languages', 1, '8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'SETTING_MANAGE_LANGUAGE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('7562978b-155a-4fb1-bc3f-6153f62ed565', 'VIEW_FILE_REQUEST', 1, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_VIEW_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('7ba630ca-a9d3-42ee-99c8-766e2231fec1', 'View Dashboard', 1, '42e44f15-8e33-423a-ad7f-17edc23d6dd3', 'DASHBOARD_VIEW_DASHBOARD', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('86ce1382-a2b1-48ed-ae81-c9908d00cf3b', 'Create User', 2, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_CREATE_USER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('8d7e1668-ab2d-4aa5-b8d1-0358906d6995', 'VIEW_DETAIL', 9, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_VIEW_DETAIL', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('8e3fbe21-0225-44e2-a537-bb50ddffb95c', 'MANAGE_ALLOW_FILE_EXTENSIONS', 4, '8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'SETTINGS_MANAGE_ALLOW_FILE_EXTENSIONS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('92596605-e49a-4ab6-8a39-60116eba8abe', 'Delete Document', 6, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_DELETE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('9a086704-b7c2-4dff-9088-dde29ad259ef', 'Remove Indexing', 3, '0c8b0806-f33f-48b3-a326-dcc9cc1a65c7', 'DEEP_SEARCH_REMOVE_INDEXING', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('a57b1ad5-8fbc-429b-b776-fbb468e5c6a4', 'Manage Company Profile', 2, '8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'SETTING_MANAGE_PROFILE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('a5b485ac-8c7b-4a4f-a62d-6f839d77e91f', 'View Version History', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_VIEW_VERSION_HISTORY', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('a737284a-e43b-481d-9fdd-07e1680ffe11', 'Edit Document', 2, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_EDIT_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('a8dd972d-e758-4571-8d39-c6fec74b361b', 'Edit Document', 3, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_EDIT_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('ac6d6fbc-6348-4149-9c0c-154ab79d1166', 'Share Document', 3, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_SHARE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('b0f2a1c4-3d8e-4b5c-9f6d-7a0e5f3b8c1d', 'DELETE_AI_GENERATED_DOCUMENTS', 3, '637f010e-3397-41a9-903a-21d54db5e49a', 'DELETE_AI_GENERATED_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('b36cf0a4-ad53-4938-aac5-fb7fbfc2cfcf', 'Restore Version', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_RESTORE_VERSION', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('b4d722d6-755c-4be4-8f0d-2283c9394e18', 'APPROVE_FILE_REQUEST', 5, '55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST_APPROVE_FILE_REQUEST', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('bc515aea-ef66-4d8d-9cdb-47477cb74145', 'MANAGE_AI_PROMPT_TEMPLATES', 4, '637f010e-3397-41a9-903a-21d54db5e49a', 'MANAGE_AI_PROMPT_TEMPLATES', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('c04a1094-f289-4de7-b788-9f21ee3fe32a', 'Send Email', 5, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_SEND_EMAIL', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('c18e4105-e9d7-4c5d-b396-a2854bcb8e21', 'View Version History', 4, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_VIEW_VERSION_HISTORY', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('c288b5d3-419d-4dc0-9e5a-083194016d2c', 'Edit Role', 3, '090ea443-01c7-4638-a194-ad3416a5ea7a', 'ROLE_EDIT_ROLE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('c6e2e9f8-1ee4-4c1d-abd1-721ff604c8b8', 'Add Reminder', 4, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_ADD_REMINDER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('cb988c3a-7487-4366-9521-c0c5adf9b5a6', 'BULK_DOCUMENT_UPLOAD', 1, '8384e302-eaf1-4a0b-b293-a921b1e9e36a', 'BULK_DOCUMENT_UPLOAD', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('cd46a3a4-ede5-4941-a49b-3df7eaa46428', 'Manage Document Category', 1, '5a5f7cf8-21a6-434a-9330-db91b17d867c', 'DOCUMENT_CATEGORY_MANAGE_DOCUMENT_CATEGORY', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('d4d724fc-fd38-49c4-85bc-73937b219e20', 'Reset Password', 5, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_RESET_PASSWORD', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('d9067d75-e3b9-4d2d-8f82-567ad5f2b9ca', 'View Documents', 1, '05edb281-cddb-4281-9ab3-fb90d1833c82', 'ARCHIVE_DOCUMENT_VIEW_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('db8825b1-ee4e-49f6-9a08-b0210ed53fd4', 'Create Role', 2, '090ea443-01c7-4638-a194-ad3416a5ea7a', 'ROLE_CREATE_ROLE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('dba2e7bf-6bac-4620-a9e6-d4eaa2c8480f', 'Manage Page Helper', 1, 'cfa38ae7-b5ba-4881-9199-d2914d7fd58e', 'PAGE_HELPER_MANAGE_PAGE_HELPER', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('e017d419-8080-4b2d-ac89-4e966182a12f', 'MANAGE_DOCUMENT_STATUS', 1, '8740dd7a-7bca-442f-b50f-6cdf0fcaf7bd', 'MANAGE_DOCUMENT_STATUS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('e3fcd910-3f9b-4035-9bbb-312c5b599d52', 'GENERATE_AI_DOCUMENTS', 1, '637f010e-3397-41a9-903a-21d54db5e49a', 'GENERATE_AI_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('e506ec48-b99a-45b4-9ec9-6451bc67477b', 'Assign Permission', 7, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_ASSIGN_PERMISSION', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('e9ff854b-23f7-46c2-9029-efba3d8587b5', 'Manage Sharable Link', 7, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_MANAGE_SHARABLE_LINK', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('f4d8a768-151d-4ec9-a8e3-41216afe0ec0', 'Delete Document', 4, '05edb281-cddb-4281-9ab3-fb90d1833c82', 'ARCHIVE_DOCUMENT_DELETE_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('f9ec1096-b798-4623-bbf8-4f5d4fe775e9', 'Manage Sharable Link', 10, 'eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'ALL_DOCUMENTS_MANAGE_SHARABLE_LINK', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('fa5b07a4-e8c4-40e2-b5cf-f1a562087783', 'VIEW_AI_GENERATED_DOCUMENTS', 2, '637f010e-3397-41a9-903a-21d54db5e49a', 'VIEW_AI_GENERATED_DOCUMENTS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('fa91ffd9-61ee-4bb1-bf86-6a593cdc7be9', 'Create Document', 1, 'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'ASSIGNED_DOCUMENTS_CREATE_DOCUMENT', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('fbe77c07-3058-4dbe-9d56-8c75dc879460', 'Assign User Role', 6, '324bdc51-d71f-4f80-9f28-a30e8aae4009', 'USER_ASSIGN_USER_ROLE', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', 'View Login Audit Logs', 1, 'f042bbee-d15f-40fb-b79a-8368f2c2e287', 'LOGIN_AUDIT_VIEW_LOGIN_AUDIT_LOGS', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aiPromptTemplates`
--

CREATE TABLE `aiPromptTemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `promptInput` varchar(255) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aiPromptTemplates`
--

INSERT INTO `aiPromptTemplates` (`id`, `name`, `description`, `promptInput`, `modifiedDate`, `deleted_at`) VALUES
('0e832c07-8a82-4a5b-b415-cc4b466a9056', 'Generate tags and keywords for youtube video', 'Generate tags and keywords for youtube video', 'Generate tags and keywords about **title** for youtube video.', '2025-04-24 08:06:48', NULL),
('18849032-284e-4ea5-adaf-35ee52e4ddc4', 'Generate testimonial', 'Generate testimonial', 'Generate testimonial for **subject**. Include details about how it helped you and what you like best about it.', '2025-04-24 07:57:12', NULL),
('1a4e4a31-f197-4e6f-a58a-e599f216f6ce', 'Generate blog post conclusion', 'Generate blog post conclusion', 'Write blog post conclusion about title: **title**. And the description is **description**.', '2025-04-24 08:03:29', NULL),
('20804416-cb1b-4016-840d-6f6d625ac210', 'Write Problem Agitate Solution', 'Write Problem Agitate Solution', 'Write Problem-Agitate-Solution copy for the **description**.', '2025-04-24 07:57:56', NULL),
('30d72e36-1ef7-4ba9-8a8d-db119c013157', 'Generate Google ads headline for product.', 'Generate Google ads headline for product.', 'Write Google ads headline product name: **product name**. Description is **description**. Audience is **audience**.', '2025-04-24 08:47:44', NULL),
('3b28ed3a-88e3-4d04-8537-039202c28977', 'Write me blog section', 'Write me blog section', 'Write me blog section about **description**.', '2025-04-24 07:58:20', NULL),
('3bbe9346-2d34-4f43-8510-ab0f2b290459', 'Generate Instagram post caption', 'Generate Instagram post caption', 'Write Instagram post caption about **title**.', '2025-04-24 08:07:26', NULL),
('3bc3216e-f5c2-4e93-ae40-50100b166f65', 'Post Generator', 'Generator Post using Open AI.', 'Write a post about **description**.', '2025-04-23 13:51:27', NULL),
('6e80ce92-ebad-4fbe-a466-d26273695fc7', 'Article Generator', 'Instantly create unique articles on any topic. Boost engagement, improve SEO, and save time.', 'Generate article about **article title**', '2025-04-23 13:36:00', NULL),
('783724b2-f4ed-473b-af76-6952724aa880', 'Generate instagram hastags.', 'Generate instagram hastags.', 'Write instagram hastags for **keywords**.', '2025-04-24 08:07:57', NULL),
('8650d81b-2cf3-4fa3-9123-7426bbbd4d94', 'Write product description for Product name', 'Write product description for Product name', 'Write product description for **product name**.', '2025-04-24 07:55:55', NULL),
('8985b3bb-c69d-4d3b-a8bc-6baecef2c358', 'Generate google ads description for product.', 'Generate google ads description for product.', 'Write google ads description product name: **product name**. Description is **description**. Audience is **audience**.', '2025-04-24 08:49:24', NULL),
('8a361cde-138b-4fcd-950b-8e759983a3ac', 'Grammar Correction', 'Grammar Correction', 'Correct the grammar. Text is **description**.', '2025-04-24 08:55:42', NULL),
('8c288cf3-1ff0-4d40-a98c-2744b954e54f', 'Generate pros & cons', 'Generate pros & cons', 'Generate pros & cons about title:  **title**. Description is **description**.', '2025-04-24 08:50:36', NULL),
('8c94a143-a07e-4c9d-947c-6a1168c68647', 'Email Generator', 'Email Generator', 'Write email about title: **subject**, description: **description**.', '2025-04-24 08:51:56', NULL),
('913a8628-b4f2-41e2-a1aa-f44331afcf00', 'Newsletter Generator', 'Newsletter Generator', 'generate newsletter template about product title: **title**, reason: **subject** description: **description**.', '2025-04-24 08:53:00', NULL),
('98511559-7b1a-42f6-b924-2430a1bdfd5a', 'Generate Facebook ads title', 'Generate Facebook ads title', 'Write Facebook ads title about title: **title**. And description is **description**.', '2025-04-24 08:46:58', NULL),
('a72ce7d0-720f-48ac-b7f7-7ab25d73a72c', 'Summarize Text', 'Summarize Text', 'Summarize the following text: **text**.', '2025-04-23 13:57:10', NULL),
('b9e114c7-a2f1-4777-b43a-e36b1e146dbc', 'FAQ Generator', 'FAQ Generator', 'Answer like faq about subject: **title** Description is **description**.', '2025-04-24 08:51:34', NULL),
('c1804540-d86a-48c6-a321-05f13630f262', 'Generate website meta description', 'Generate website meta description', 'Generate website meta description site name: **title** Description is **description**.', '2025-04-24 08:51:04', NULL),
('ca26c30b-e537-4c9f-a4b9-ec4cc7b95a1b', 'Rewrite content', 'Rewrite content', 'Rewrite content:  **contents**.', '2025-04-24 08:49:45', NULL),
('d35d6c5d-9146-464e-bfa9-196f9db0b251', 'Generate one paragraph', 'Generate one paragraph', 'Generate one paragraph about:  **description**. Keywords are **keywords**.', '2025-04-24 08:50:11', NULL),
('d8d81df2-2859-4c6d-99aa-eb6dabb9cc01', 'Post Title Generator', 'Generator a Post Title from Post Description.', 'Generate Post title about **description**', '2025-04-23 13:55:24', NULL),
('ddf9b4d8-1ffc-4582-92f7-6e4adc667c95', 'Generate  company social media post', 'Generate  company social media post', 'Write in company social media post, company name: **company name**. About: **description**.', '2025-04-24 08:44:33', NULL),
('e884ec96-547c-4f81-99e9-40eed842f8b5', 'Generate youtube video description', 'Generate youtube video description', 'write youtube video description about **title**.', '2025-04-24 08:05:13', NULL),
('ea82c689-ad2a-4b54-b11b-4545af7a236d', 'Generate YouTube video titles', 'Generate YouTube video titles', 'Craft captivating, attention-grabbing video titles about **description** for YouTube rankings.', '2025-04-24 08:06:08', NULL),
('f3431223-1eba-4f47-b1f5-8a990a3022af', 'Email Answer Generator', 'Email Answer Generator', 'answer this email content: **description**.', '2025-04-24 08:52:18', NULL),
('f7057b73-0db5-4fe6-bc5e-44cb9e1b35e4', 'Generate blog post introduction', 'Generate blog post introduction', 'Write blog post intro about title: **title**. And the description is **description**.', '2025-04-24 08:02:27', NULL),
('fd71e2b4-427f-40d9-8ab3-b616fc0cf09b', 'Generate Facebook ads text', 'Generate Facebook ads text', 'Write facebook ads text about title: **title**. And the description is **description**.', '2025-04-24 08:04:16', NULL),
('fe9b5264-64a2-4772-a033-00088cf11d07', 'Generate blog post idea', 'Generate blog post idea', 'Write blog post article ideas about **description**.', '2025-04-24 08:01:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `allowFileExtensions`
--

CREATE TABLE `allowFileExtensions` (
  `id` char(36) NOT NULL,
  `fileType` tinyint(4) NOT NULL,
  `extensions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowFileExtensions`
--

INSERT INTO `allowFileExtensions` (`id`, `fileType`, `extensions`) VALUES
('0c0be0a9-0a4e-4f05-8742-3a5d6d74acf0', 2, 'png,jpg,jpge,gif,bmp,tiff,tif,svg,webp,ico,heif,heic,avif,apng,jfif,pjpeg,pjp,svgz,wmf,emf,djv,djvu,eps,ps,ai,indd,idml,psd,tga,dds'),
('13a28d05-d6be-4e6b-87fe-b784642e2a95', 3, 'txt'),
('3257c50c-a128-4c98-8809-cc2564b7db2a', 1, 'pdf'),
('64dac07d-9072-4661-b537-053a09d42d6e', 0, 'doc,docx,ppt,pptx,xls,xlsx,csv'),
('9eaf6b33-0cef-45a4-bf92-7c525e2ed536', 4, '3gp,aa,aac,aax,act,aiff,alac,amr,ape,au,awb,dss,dvf,flac,gsm,iklx,ivs,m4a,m4b,m4p,mmf,mp3,mpc,msv,nmf,ogg,oga,mogg,opus,org,ra,rm,raw,rf64,sln,tta,voc,vox,wav,wma,wv'),
('ab5db62f-1fc7-49ed-895f-6ac4be6db33a', 6, 'zip'),
('cb1612ef-8e3c-4823-af2b-469f4b0010b8', 5, 'webm,flv,vob,ogv,ogg,drc,avi,mts,m2ts,wmv,yuv,viv,mp4,m4p,3pg,f4v,f4a');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parentId` char(36) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parentId`, `isDeleted`, `createdBy`, `modifiedBy`, `deletedBy`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('bfd78631-3f68-4c32-a165-8321edf945d1', 'one', 'asd', NULL, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, '2025-06-18 12:30:11', '2025-06-18 12:30:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `from_type` varchar(255) NOT NULL DEFAULT 'user',
  `to_id` char(36) NOT NULL,
  `to_type` varchar(255) NOT NULL DEFAULT 'user',
  `body` varchar(5000) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ch_messages`
--

INSERT INTO `ch_messages` (`id`, `from_id`, `from_type`, `to_id`, `to_type`, `body`, `attachment`, `attachment_url`, `seen`, `created_at`, `updated_at`, `read_at`) VALUES
('109880c2-339e-44b0-8b8f-11c118afd84a', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'how are u', NULL, NULL, 0, '2025-06-13 14:00:22', '2025-06-13 18:49:54', '2025-06-13 18:49:54'),
('137de2b9-7ac9-4567-9850-5688638d278b', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'oui', NULL, NULL, 0, '2025-06-18 00:04:53', '2025-06-18 00:09:09', '2025-06-18 00:09:09'),
('21c5981c-b0ca-464d-8b55-c18838b73d8e', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'ok', NULL, NULL, 0, '2025-06-18 06:30:09', '2025-06-18 06:30:21', '2025-06-18 06:30:21'),
('2d2f7867-b390-4ffa-9744-5c637a2a313c', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '08b77b13-e171-450e-ab62-c7fe62b3e213', 'client', 'salut', NULL, NULL, 0, '2025-06-18 12:59:47', '2025-06-18 13:00:18', '2025-06-18 13:00:18'),
('3372f920-0905-4b2b-a56d-91cb5ccb8e07', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'test', '6851fe507bc5d_conservation (1) (2).pdf', 'https://alpha.eshopweb.store/storage/chatify/attachments/6851fe507bc5d_conservation (1) (2).pdf', 0, '2025-06-17 23:46:24', '2025-06-17 23:48:47', '2025-06-17 23:48:47'),
('3cc640cb-c7c8-43fb-a402-fcc33e0d5f5d', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'hello', NULL, NULL, 0, '2025-06-13 14:00:13', '2025-06-13 14:00:16', '2025-06-13 14:00:16'),
('4d8bc5ff-b7ec-4eea-9e57-32a3efbaf08a', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'hi', NULL, NULL, 0, '2025-06-13 13:59:53', '2025-06-13 13:59:59', '2025-06-13 13:59:59'),
('50875e1b-443a-4c08-8954-119c3ed22cf3', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '', '684faea1d21a5_conservation (1) (1).pdf', 'https://alpha.eshopweb.store/storage/chatify/attachments/684faea1d21a5_conservation (1) (1).pdf', 0, '2025-06-16 05:41:53', '2025-06-16 05:42:11', '2025-06-16 05:42:11'),
('5549bdf8-4001-4f76-aed3-5855f768b065', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '', '684cd0cb335da_fposter,small,wall_texture,square_product,600x600.jpg', 'https://alpha.eshopweb.store/storage/chatify/attachments/684cd0cb335da_fposter,small,wall_texture,square_product,600x600.jpg', 0, '2025-06-14 01:30:51', '2025-06-16 04:21:28', '2025-06-16 04:21:28'),
('5b025384-5e1d-4ba6-958a-e136fc963636', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'ok', NULL, NULL, 0, '2025-06-18 06:22:20', '2025-06-18 06:30:21', '2025-06-18 06:30:21'),
('79254831-bea2-443a-8244-306a9c088f74', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'test test', NULL, NULL, 0, '2025-06-17 23:49:30', '2025-06-18 00:04:10', '2025-06-18 00:04:10'),
('7fa10f3d-cb48-4067-81fd-ab6921a2a091', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'hi', NULL, NULL, 0, '2025-06-18 06:21:40', '2025-06-18 06:22:12', '2025-06-18 06:22:12'),
('87a106fa-0e4a-4728-86cd-c3feb0937fe6', '08b77b13-e171-450e-ab62-c7fe62b3e213', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'oui', NULL, NULL, 0, '2025-06-18 13:00:22', '2025-06-18 13:00:22', NULL),
('a45561eb-4009-4a7a-b9a9-b8f6116b3887', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ok', '684c72ed49c6e_metier-avocats.jpg', 'https://alpha.eshopweb.store/storage/chatify/attachments/684c72ed49c6e_metier-avocats.jpg', 0, '2025-06-13 18:50:21', '2025-06-14 01:30:19', '2025-06-14 01:30:19'),
('a6709c3e-9d6b-4ce5-bbec-7b375f9a7b2a', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '', '6851ff13e2009_fposter,small,wall_texture,square_product,600x600.jpg', 'https://alpha.eshopweb.store/storage/chatify/attachments/6851ff13e2009_fposter,small,wall_texture,square_product,600x600.jpg', 0, '2025-06-17 23:49:39', '2025-06-18 00:04:10', '2025-06-18 00:04:10'),
('c8177776-0506-4e8f-965f-532bfee93e37', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'test', NULL, NULL, 0, '2025-06-13 18:50:06', '2025-06-14 01:30:19', '2025-06-14 01:30:19'),
('ce3ed1c8-c0a1-400c-8518-689953aad42e', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'salut', NULL, NULL, 0, '2025-06-18 00:04:16', '2025-06-18 00:04:47', '2025-06-18 00:04:47'),
('ce49d250-ce12-4774-bd33-9ece3517e149', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'ok om', NULL, NULL, 0, '2025-06-17 23:48:58', '2025-06-18 00:04:10', '2025-06-18 00:04:10'),
('dacd3f25-c8f8-4abe-92c9-f5c0f1d0dcd7', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'tes', '6851fe8736314_metier-avocats.jpg', 'https://alpha.eshopweb.store/storage/chatify/attachments/6851fe8736314_metier-avocats.jpg', 0, '2025-06-17 23:47:19', '2025-06-17 23:48:47', '2025-06-17 23:48:47'),
('e06b810b-19a4-4864-ae52-731de2b1f551', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'hi', NULL, NULL, 0, '2025-06-17 23:45:28', '2025-06-17 23:48:47', '2025-06-17 23:48:47'),
('ea38b617-a0c1-48ad-8f88-e515b9df8d75', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'client', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'test', NULL, NULL, 0, '2025-06-14 01:30:33', '2025-06-16 04:21:28', '2025-06-16 04:21:28'),
('fdbeb32b-2027-40d7-989f-d44f9ee4eefe', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'user', 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'client', 'test', '6851fe28ed691_audio.mp3', 'https://alpha.eshopweb.store/storage/chatify/attachments/6851fe28ed691_audio.mp3', 0, '2025-06-17 23:45:44', '2025-06-17 23:48:47', '2025-06-17 23:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` char(36) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `contactPerson` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `companyName`, `contactPerson`, `email`, `password`, `phoneNumber`, `address`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('08b77b13-e171-450e-ab62-c7fe62b3e213', 'Beta', 'omega', 'madiallomad90@gmail.com', '$2y$10$VcfCdj/l/halpBWs3fgX1uqfCy.FaUriMamfr8a32jxkNkGVCURUm', '345678', 'Adress', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:56:50', '2025-06-18 12:56:50', NULL),
('a85255f5-2a19-4129-8985-4657c444a6d3', 'asdasd', 'asdasd', 'infinitie.jay@gmail.com', '$2y$10$wmR/4KVdLQg26tgZz51.Ke3rgjwT4rwhUNc87UVVh0DP7bXN6/7Wu', '9876543210', '12345968', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:31:19', '2025-06-19 06:15:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companyProfile`
--

CREATE TABLE `companyProfile` (
  `id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `bannerUrl` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT 'local',
  `smallLogoUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companyProfile`
--

INSERT INTO `companyProfile` (`id`, `title`, `logoUrl`, `bannerUrl`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`, `location`, `smallLogoUrl`) VALUES
('4bf8ec29-208e-450a-a15d-5417a6a95753', 'alpha01', 'images/74dd11c5-d889-457f-b0e8-d3365a2b7d7c.jpeg', 'images/6799439b-7b13-4a5b-98fc-12fe1015542a.jpeg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-03 04:57:55', '2025-06-18 06:23:09', NULL, 'local', 'images/6f63d8c2-72b5-4406-8a5e-5720e77b5b5b.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `dailyReminders`
--

CREATE TABLE `dailyReminders` (
  `id` char(36) NOT NULL,
  `reminderId` char(36) NOT NULL,
  `dayOfWeek` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentAuditTrails`
--

CREATE TABLE `documentAuditTrails` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `operationName` varchar(255) NOT NULL,
  `assignToUserId` char(36) DEFAULT NULL,
  `assignToRoleId` char(36) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentAuditTrails`
--

INSERT INTO `documentAuditTrails` (`id`, `documentId`, `operationName`, `assignToUserId`, `assignToRoleId`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('044098c5-5e7f-4a9d-826e-43ea519a1d83', '62d703d4-7c22-43b0-b241-fe45392a6cfe', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 06:35:53', '2025-06-09 06:35:53', NULL),
('052b2991-0da6-40b3-bf5b-939c1e0b580f', '50b34fa0-c28b-4779-8ddb-5a686be43716', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 06:37:10', '2025-06-09 06:37:10', NULL),
('06023869-bc63-4f5c-a6cc-92397a800ad9', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:42:32', '2025-06-16 05:42:32', NULL),
('08100bd2-3ced-459c-a4b1-31f3dda40d71', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:08', '2025-06-13 06:34:08', NULL),
('0ae89c9f-fdde-42dc-ae8f-387e4ef037bd', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Download', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:54:28', '2025-06-18 10:54:28', NULL),
('0c5689e3-a135-488e-ad7f-c84cb12079d1', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:50:33', '2025-06-18 10:50:33', NULL),
('0c862d37-e64d-4508-819e-bbce2f76d098', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 00:05:21', '2025-06-18 00:05:21', NULL),
('0e012d6d-380f-4972-9089-345425640044', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:56:04', '2025-06-18 12:56:04', NULL),
('0f8ee9e8-e805-4153-b518-f96f0ed08f6c', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:50:24', '2025-06-18 10:50:24', NULL),
('0ffab06b-b0b4-4f3f-8613-eed44bffe3f9', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:02:52', '2025-06-18 11:02:52', NULL),
('10c0fd79-933b-477f-9608-210f996d532f', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:08', '2025-06-13 06:34:08', NULL),
('14fba408-9191-4d91-a842-eabf57f0cf57', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:40:29', '2025-06-17 23:40:29', NULL),
('174c5e33-b77d-49bc-afde-504296792fa1', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:39:44', '2025-06-16 05:39:44', NULL),
('19ce37e5-5775-489a-9fa8-3ee71a256b6e', '3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', 'Download', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:45:03', '2025-06-14 01:45:03', NULL),
('1a6788b1-4618-48e6-9410-a589a278fe90', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:35:56', '2025-06-13 06:35:56', NULL),
('1a7fd73f-d90a-43bd-99dc-14a132b1af9e', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:32:40', '2025-06-17 23:32:40', NULL),
('1e9a772a-1d5f-4102-af2d-0dd04ef50df9', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:40:07', '2025-06-16 05:40:07', NULL),
('1ea81507-01c0-45d2-9b7f-cdf2529c70cb', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:19:37', '2025-06-18 10:19:37', NULL),
('23a3316e-f893-424e-87fa-312019b3f365', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:55:58', '2025-06-14 01:55:58', NULL),
('24bae542-aaea-41cc-bce1-e0ea6e88d0bd', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:10', '2025-06-18 11:04:10', NULL),
('24c229e5-97b4-4f95-9282-1d8e6fd2db26', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:40:11', '2025-06-16 05:40:11', NULL),
('296eb23c-c244-406e-a13a-390ce55e7ea2', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:43:56', '2025-06-14 01:43:56', NULL),
('2e85f59e-8f1d-4c68-bd3c-6a4408ab4964', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:37:05', '2025-06-16 05:37:05', NULL),
('2f9cc519-e8ce-4b83-937f-a3901b5e12f8', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:07', '2025-06-13 06:34:07', NULL),
('2fb692b0-1d0e-43c2-9260-2910b1be863e', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:32:36', '2025-06-17 23:32:36', NULL),
('36283634-579c-4ea9-b952-885b93b9a3dd', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:03:49', '2025-06-13 07:03:49', NULL),
('36e12c00-48b2-461f-af78-d5b597da34c3', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL),
('376f20d5-34a7-4e61-95f9-8f0f3665f5c6', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Download', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:39:19', '2025-06-17 23:39:19', NULL),
('3967f21a-bdc2-4c60-8c97-38ad30146615', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Archived', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:55:07', '2025-06-14 01:55:07', NULL),
('3d434015-33b2-426e-a725-4d6332eb4ef8', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:36:10', '2025-06-13 06:36:10', NULL),
('3f07bb3f-7c38-4229-969f-eadfefe15173', '62d703d4-7c22-43b0-b241-fe45392a6cfe', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 09:13:24', '2025-06-09 09:13:24', NULL),
('4139ce21-ff2f-41a0-846c-d2c563b872d7', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 00:10:20', '2025-06-18 00:10:20', NULL),
('41e55111-df06-44c2-b795-7e8a6982af5a', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:36:40', '2025-06-16 05:36:40', NULL),
('43b1f14a-e4b4-4bfc-b8b7-5760764f7677', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:36:40', '2025-06-16 05:36:40', NULL),
('4695cecb-8d4f-4f0b-8bdc-2168a528eb60', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL),
('47e186fa-c3d3-4927-b135-12464cc6ff3f', '50b34fa0-c28b-4779-8ddb-5a686be43716', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 06:37:10', '2025-06-09 06:37:10', NULL),
('47ebe804-31f5-4549-9d97-94a1adfb1d6a', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:46:42', '2025-06-13 06:46:42', NULL),
('4918a8d8-9a7d-4ff9-b848-43767f55d945', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:58:32', '2025-06-18 10:58:32', NULL),
('4b4ace04-1d5a-4e86-8825-9385debec5e7', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:36:36', '2025-06-13 06:36:36', NULL),
('4c51b710-1574-4520-bac2-329c40c15034', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:04', '2025-06-18 11:04:04', NULL),
('4f08573a-dbb8-4e21-8fd5-338c5e0b409a', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:30:58', '2025-06-17 23:30:58', NULL),
('4f71b8f6-29c8-4737-b634-3448a80f5aa1', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:07', '2025-06-13 06:34:07', NULL),
('504ccb1c-82a1-44b6-aed1-2d73034ae567', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:36:40', '2025-06-16 05:36:40', NULL),
('529e47de-8b21-4889-9599-6182e3e06736', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:35:55', '2025-06-13 06:35:55', NULL),
('52f70524-2625-48c8-b1bb-78836e3bf0d0', '3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:45:16', '2025-06-14 01:45:16', NULL),
('53cbfbd1-827e-40f0-b0a1-a6dc9ca70990', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:40:07', '2025-06-16 05:40:07', NULL),
('55e0a002-e1d3-4962-bc16-6942a41c5c7d', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:32:35', '2025-06-17 23:32:35', NULL),
('570e9423-8575-4179-b87a-7b11d89d5a87', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:55:57', '2025-06-18 12:55:57', NULL),
('59260ca4-1e0a-4e5d-a917-f5ebdfb4d6f5', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:34:53', '2025-06-14 01:34:53', NULL),
('59d7065f-5297-4396-9cdd-631969dedfcb', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:36:41', '2025-06-16 05:36:41', NULL),
('5a298c3e-65ee-4959-81f5-aa2923881215', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:32', '2025-06-17 23:35:32', NULL),
('64512ed1-cdee-4a80-bf75-f443fd1d4706', '3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:44:50', '2025-06-14 01:44:50', NULL),
('66106f02-0f63-4c7a-8edd-37190416e862', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:04:05', '2025-06-13 07:04:05', NULL),
('6712c922-18d2-4ec3-ba01-6b2e71d2a5d4', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:54:18', '2025-06-18 10:54:18', NULL),
('6b163ddc-d51e-43c3-a908-2bc3b58ebd85', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:35:55', '2025-06-13 06:35:55', NULL),
('6d43facf-73b1-4332-9c0e-65ab34d7b56a', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:21:21', '2025-06-18 10:21:21', NULL),
('7776cb6d-e014-4f85-b60f-45e7cea82997', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:37:37', '2025-06-16 05:37:37', NULL),
('77eb53f0-78d7-4f7e-997c-550a4356f333', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:33:24', '2025-06-14 01:33:24', NULL),
('7e2b1dc2-e127-499d-bfcd-5a59aff6fdfd', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:40:07', '2025-06-16 05:40:07', NULL),
('80508545-f0ee-4398-80cb-d537380d3bbc', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 07:51:13', '2025-06-18 07:51:13', NULL),
('821a773d-43c5-401a-8ea5-110ba3f9bbaa', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:30:58', '2025-06-17 23:30:58', NULL),
('82322327-fdbb-4e5c-88cc-189c373800b7', '62d703d4-7c22-43b0-b241-fe45392a6cfe', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-06 12:13:47', '2025-06-06 12:13:47', NULL),
('86b82578-3b33-4966-8f39-1b45eeb76925', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:03:46', '2025-06-13 07:03:46', NULL),
('8ad58bce-0ce2-4dea-bcbf-c4657cb30b15', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:32', '2025-06-17 23:35:32', NULL),
('8b7ec8c2-9563-4594-b7c8-f7832d8c113f', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:55:57', '2025-06-18 12:55:57', NULL),
('8e613b9a-695a-4d52-a0e9-5c976b7108ae', '50b34fa0-c28b-4779-8ddb-5a686be43716', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 09:13:27', '2025-06-09 09:13:27', NULL),
('918c23e8-a1d4-483a-8627-06335a31e6e5', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:54:18', '2025-06-18 10:54:18', NULL),
('9315058a-685e-487d-9339-d3e9840e6489', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:16', '2025-06-18 11:04:16', NULL),
('939e1f43-89af-4b26-92b4-41cf6c95ef99', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:22:40', '2025-06-17 23:22:40', NULL),
('95ab869a-ad80-42db-856e-0ae8275caf61', '50b34fa0-c28b-4779-8ddb-5a686be43716', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 06:37:10', '2025-06-09 06:37:10', NULL),
('9a6beafb-7486-4bd3-8d22-856688ad87ab', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:51', '2025-06-17 23:35:51', NULL),
('9b97c389-c115-43b3-ac73-613ddb01fe4f', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:55:58', '2025-06-18 12:55:58', NULL),
('9daa8bcc-6a4c-45ae-9b40-640f70980ce9', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:42:49', '2025-06-16 05:42:49', NULL),
('9dc17aaa-08d0-47e3-bf04-cf832ba0f21c', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:37', '2025-06-17 23:35:37', NULL),
('9e6b2f65-40e5-44f7-afb9-d4bebd274f37', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:33:23', '2025-06-14 01:33:23', NULL),
('a3f58830-bd09-4018-a9a8-06734c542819', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:33:23', '2025-06-14 01:33:23', NULL),
('a4ffb5a9-ffa0-454d-8df9-64b039589ee3', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:04', '2025-06-18 11:04:04', NULL),
('aa6bb196-e66c-4977-8103-1e2e80d965f9', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:30:58', '2025-06-17 23:30:58', NULL),
('ab68c288-a86c-4575-ad36-a37f161a578e', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:33:29', '2025-06-14 01:33:29', NULL),
('b4a74b63-3bb9-42e3-9e41-336a834f99dd', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:33:57', '2025-06-14 01:33:57', NULL),
('b581b47d-c862-4507-99c2-221713be0a8d', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:40:07', '2025-06-16 05:40:07', NULL),
('b7b948e8-d30f-4071-8b22-e3f1add52927', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:34:49', '2025-06-16 05:34:49', NULL),
('b8cb42e5-4677-4c57-b014-c716eb8883f1', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:04', '2025-06-18 11:04:04', NULL),
('b9dd5e5f-d40e-4b06-8085-93ad6620f238', '3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:44:25', '2025-06-14 01:44:25', NULL),
('bf079607-9283-411c-abb6-05d15708e119', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:03:45', '2025-06-13 07:03:45', NULL),
('bf1ba8a6-3633-4a37-92e5-a31acf2db524', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:55:12', '2025-06-18 10:55:12', NULL),
('bfc54243-4c21-4919-9d91-814bc724d136', 'd5332241-43f3-47a8-b065-e995e3bae016', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:41:09', '2025-06-16 05:41:09', NULL),
('c40620e6-eb99-4689-bdd9-e8db6ad53a02', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:32:35', '2025-06-17 23:32:35', NULL),
('c7d4e633-ff91-4863-a5a5-9d3d2bd02398', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:40:57', '2025-06-14 01:40:57', NULL),
('c8348ef8-cc79-4f4d-a934-3a82e44c79f9', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:22', '2025-06-18 11:04:22', NULL),
('c9770d64-fd33-4c56-8ad9-7bdd17a8b5f8', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:54:14', '2025-06-18 12:54:14', NULL),
('ca02a3cf-1925-4e93-b8de-da5fc1f20fd1', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:04:19', '2025-06-13 07:04:19', NULL),
('ceb36f6d-4a5a-4563-8787-e3b2cc180591', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'Add_Permission', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:07', '2025-06-13 06:34:07', NULL),
('d35eaf0d-f3c7-4acb-b0e3-d009d9f86a47', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:32', '2025-06-17 23:35:32', NULL),
('d4a13330-d8d0-443d-9739-1e94d16c4d28', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:34', '2025-06-13 06:34:34', NULL),
('d7ffb149-5a4f-4116-a4ca-919b0781dff5', '6aa973b7-fc50-4123-906c-fa24f9689345', 'Add_Permission', NULL, 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:04:04', '2025-06-18 11:04:04', NULL),
('da440d10-225a-4541-9fbc-80264dfca4e7', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'Add_Permission', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:07', '2025-06-13 06:34:07', NULL),
('de2193a3-6e45-4ca8-ae2b-2da418681e03', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:34:40', '2025-06-13 06:34:40', NULL),
('df3a19ea-b90c-4190-918a-40d287e412a1', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:36:39', '2025-06-17 23:36:39', NULL),
('dfbbf50f-bf26-46b4-9456-67bf4264c0da', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:18:24', '2025-06-18 10:18:24', NULL),
('e1bfa761-840f-419e-95ea-146b6b856198', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:50:28', '2025-06-18 10:50:28', NULL),
('e5682717-56c2-46f6-a349-5d5f17b14064', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:38:39', '2025-06-17 23:38:39', NULL),
('e9a721a9-2500-4e98-8fd5-4bf08f9e9b5d', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:41', '2025-06-17 23:35:41', NULL),
('e9aeb0a7-f751-4179-8c1c-e654ff8badfa', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Restored', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:55:41', '2025-06-14 01:55:41', NULL),
('eafe5419-a975-4bf9-9977-ba05b90df1ab', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-16 05:34:37', '2025-06-16 05:34:37', NULL),
('ed6623e1-ba86-4aa8-b65e-6805344ce81c', 'bd551db1-f815-4e27-8a9e-d9ac7a6f548a', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:33:10', '2025-06-17 23:33:10', NULL),
('eddafc65-ce5c-47c5-9464-d1d3618561a8', '3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-14 01:44:28', '2025-06-14 01:44:28', NULL),
('ee088ce1-ac98-4585-b67a-d2cec87098f2', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:02:42', '2025-06-18 11:02:42', NULL),
('f2c50e3e-b6aa-4ac4-a664-b143c4f9c4d2', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'Created', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL),
('f640bdd7-eb77-453c-9c31-f4a25591835e', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:39:10', '2025-06-17 23:39:10', NULL),
('f6db5e93-532b-41c2-8a28-f171d7420bd3', '9e5149ff-6efd-4810-bd88-336ce0430559', 'Modified', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:45:53', '2025-06-13 06:45:53', NULL),
('f7b4ba68-9934-4b4d-90d1-e1f2b664d278', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:35:55', '2025-06-17 23:35:55', NULL),
('fabc0e79-3b6b-4eb9-85c4-eeb9bfb14d11', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-17 23:31:03', '2025-06-17 23:31:03', NULL),
('fb95c479-d8ce-4b9c-a36e-b9e1d358ec0b', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Deleted', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 11:03:04', '2025-06-18 11:03:04', NULL),
('fb983dd6-5110-4526-8a1f-479b92946182', '62d703d4-7c22-43b0-b241-fe45392a6cfe', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-09 06:33:32', '2025-06-09 06:33:32', NULL),
('fe1e2c7e-cfdd-43a2-bb9f-69c4d70b3c15', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'Read', NULL, NULL, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 10:54:25', '2025-06-18 10:54:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentComments`
--

CREATE TABLE `documentComments` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentMetaDatas`
--

CREATE TABLE `documentMetaDatas` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `metatag` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentRolePermissions`
--

CREATE TABLE `documentRolePermissions` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `roleId` char(36) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `isTimeBound` tinyint(1) NOT NULL,
  `isAllowDownload` tinyint(1) NOT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentRolePermissions`
--

INSERT INTO `documentRolePermissions` (`id`, `documentId`, `roleId`, `startDate`, `endDate`, `isTimeBound`, `isAllowDownload`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('cdfc643b-3ef1-464c-bc38-092a84da1476', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `categoryId` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT 'local',
  `isPermanentDelete` tinyint(1) DEFAULT 0,
  `isIndexed` tinyint(1) DEFAULT 0,
  `clientId` char(36) DEFAULT NULL,
  `statusId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `categoryId`, `name`, `description`, `url`, `createdDate`, `createdBy`, `modifiedDate`, `modifiedBy`, `isDeleted`, `deletedBy`, `deleted_at`, `location`, `isPermanentDelete`, `isIndexed`, `clientId`, `statusId`) VALUES
('0fd5f349-85ef-4cb9-95d0-401e6f8137c0', '600a9876-f007-4976-865b-56c480ad1ca9', 'dummy.pdf', 'asdasd', 'documents/7e8d42d2-829f-4723-9446-f80d8febfe1a.pdf', '2025-06-18 10:54:18', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 11:03:04', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 11:03:04', 'local', 1, 1, 'e84b54be-9449-497f-a268-ac4926ee0b25', 'aedfaf9c-0c68-498e-b5b0-4e260998f134'),
('3bc73ec6-9b4f-453e-86c1-ee5b994d2d7e', '6ed5eec5-6255-43cc-bc50-e037b03a00b3', 'conservation (1) (1).pdf', 'test', 'documents/8da9d898-bbb2-47a8-86ff-f91ac9384838.pdf', '2025-06-14 01:44:24', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-14 01:45:15', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-14 01:45:15', 'local', 1, 1, NULL, 'c2b99043-68fe-4f46-989e-f57c14a68d64'),
('5dc73f06-35d7-4d20-b733-cae13c59f5cd', '600a9876-f007-4976-865b-56c480ad1ca9', 'conservation (1).pdf', 'test', 'documents/9962bbcc-84fc-49d8-a0c4-324cb01a6f9e.pdf', '2025-06-17 23:36:36', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:32', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:32', 'local', 1, 1, 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'c2b99043-68fe-4f46-989e-f57c14a68d64'),
('6aa973b7-fc50-4123-906c-fa24f9689345', '600a9876-f007-4976-865b-56c480ad1ca9', 'dummy.pdf', 'asdasd', 'documents/c6d6bcd0-1b2b-4f62-bd10-d85246a22741.pdf', '2025-06-18 11:04:04', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 11:04:21', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 11:04:21', 'local', 1, 1, 'e84b54be-9449-497f-a268-ac4926ee0b25', 'aedfaf9c-0c68-498e-b5b0-4e260998f134'),
('75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'bfd78631-3f68-4c32-a165-8321edf945d1', 'conservation (1) (1).pdf', 'desc', 'documents/9faf45de-38a4-402b-924b-c34089087a8e.pdf', '2025-06-18 12:55:56', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 12:55:56', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 0, NULL, NULL, 'local', 0, 1, 'a85255f5-2a19-4129-8985-4657c444a6d3', '621b191e-12f6-4ec0-ae4d-1f8fe399d2c8'),
('8f07e356-298e-4dcc-abff-6ef5ba720ff6', '6ed5eec5-6255-43cc-bc50-e037b03a00b3', 'conservation.pdf', 'test', 'documents/3440b4f3-f0ad-4493-86b6-f098c87375c5.pdf', '2025-06-14 01:33:23', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-16 05:34:48', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-16 05:34:48', 'local', 1, 1, '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'aedfaf9c-0c68-498e-b5b0-4e260998f134'),
('ae2a1002-1a62-436f-8c17-94bba6bac875', 'bfd78631-3f68-4c32-a165-8321edf945d1', 'dummy.pdf', NULL, 'documents/bcf2230b-b92b-414e-bd35-da512a9d0afa.pdf', '2025-06-18 12:30:47', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 12:30:47', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 0, NULL, NULL, 'local', 0, 1, 'a0355fc5-d8f5-4b57-8a32-0a008b73a18a', '621b191e-12f6-4ec0-ae4d-1f8fe399d2c8'),
('b20c40d3-e34f-496d-9ad0-41b8f962e204', '6ed5eec5-6255-43cc-bc50-e037b03a00b3', 'dummy.pdf', 'asdsad', 'documents/be26e3af-e922-43ae-88ce-f5bcb3760481.pdf', '2025-06-16 05:36:40', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-16 05:39:43', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-16 05:39:43', 'local', 1, 1, '9c84ec8c-5392-4a41-89b4-a1658d775e6d', NULL),
('bd551db1-f815-4e27-8a9e-d9ac7a6f548a', '600a9876-f007-4976-865b-56c480ad1ca9', 'conservation.pdf', 'test', 'documents/2342f86b-9b81-439e-9c0b-c75feb35ca6d.pdf', '2025-06-17 23:32:35', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:23', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:23', 'local', 1, 1, 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'c2b99043-68fe-4f46-989e-f57c14a68d64'),
('d5332241-43f3-47a8-b065-e995e3bae016', '6ed5eec5-6255-43cc-bc50-e037b03a00b3', 'bhuj-ahmedabad.pdf', 'asd', 'documents/c5678135-6dde-4c27-a1bc-19953c4cab18.pdf', '2025-06-16 05:40:06', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-17 23:22:39', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-17 23:22:39', 'local', 1, 1, '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 'aedfaf9c-0c68-498e-b5b0-4e260998f134'),
('fa2c5e73-6afa-4ff0-8495-de0490035f14', '600a9876-f007-4976-865b-56c480ad1ca9', 'metier-avocats.jpg', 'test', 'documents/e7674799-c742-4a10-8622-bfd8fd0d3d35.jpg', '2025-06-17 23:35:32', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:28', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 10:50:28', 'local', 1, 1, 'a41c2ee0-6b5a-4c08-8412-36c44c792b52', 'c2b99043-68fe-4f46-989e-f57c14a68d64');

-- --------------------------------------------------------

--
-- Table structure for table `documentShareableLink`
--

CREATE TABLE `documentShareableLink` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `linkExpiryTime` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `linkCode` varchar(255) DEFAULT NULL,
  `isAllowDownload` tinyint(1) NOT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentStatus`
--

CREATE TABLE `documentStatus` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `colorCode` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentStatus`
--

INSERT INTO `documentStatus` (`id`, `name`, `description`, `colorCode`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('621b191e-12f6-4ec0-ae4d-1f8fe399d2c8', 'asd', 'dsa', '#be3e3e', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:28', '2025-06-18 12:30:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentTokens`
--

CREATE TABLE `documentTokens` (
  `id` char(36) NOT NULL,
  `createdDate` datetime NOT NULL,
  `documentId` char(36) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentUserPermissions`
--

CREATE TABLE `documentUserPermissions` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `isTimeBound` tinyint(1) NOT NULL,
  `isAllowDownload` tinyint(1) NOT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentUserPermissions`
--

INSERT INTO `documentUserPermissions` (`id`, `documentId`, `userId`, `startDate`, `endDate`, `isTimeBound`, `isAllowDownload`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('04a31446-72bb-4440-94a3-a77d218e6a05', '9e5149ff-6efd-4810-bd88-336ce0430559', '19766db7-2911-4373-aed6-80580d4aebb8', '2025-06-13 00:00:00', '2025-06-27 23:59:59', 1, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:35:55', '2025-06-13 06:35:55', NULL),
('51aa6efd-64a0-4fb1-9843-6da8735e349e', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:03:45', '2025-06-13 07:03:45', NULL),
('65b71105-c110-48a3-a3f4-8190668a2464', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-18 00:00:00', '2025-06-27 23:59:59', 1, 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:55:57', '2025-06-18 12:55:57', NULL),
('8b6512e3-436b-439a-a87d-26f19e4e30ef', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', '19766db7-2911-4373-aed6-80580d4aebb8', '2025-06-18 00:00:00', '2025-06-27 23:59:59', 1, 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:55:57', '2025-06-18 12:55:57', NULL),
('ae10dfe3-0d4c-4f46-b644-91abf1bf61b8', 'ae2a1002-1a62-436f-8c17-94bba6bac875', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL),
('bd62ca70-1e84-4d77-be98-4a59c51b1c5a', 'ae2a1002-1a62-436f-8c17-94bba6bac875', '19766db7-2911-4373-aed6-80580d4aebb8', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-18 12:30:47', '2025-06-18 12:30:47', NULL),
('db4cf9be-d137-4d04-9c0e-4f1dc0ec3b2c', '9e5149ff-6efd-4810-bd88-336ce0430559', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '2025-06-13 00:00:00', '2025-06-27 23:59:59', 1, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 06:35:55', '2025-06-13 06:35:55', NULL),
('f17db30d-74fa-4751-8b6b-001004374d6c', '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', '19766db7-2911-4373-aed6-80580d4aebb8', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 0, '2025-06-13 07:03:45', '2025-06-13 07:03:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentVersions`
--

CREATE TABLE `documentVersions` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_attachments`
--

CREATE TABLE `document_attachments` (
  `id` char(36) NOT NULL,
  `documentId` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` char(36) NOT NULL,
  `location` varchar(255) NOT NULL DEFAULT 'local',
  `createdDate` timestamp NOT NULL,
  `modifiedDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_attachments`
--

INSERT INTO `document_attachments` (`id`, `documentId`, `name`, `url`, `extension`, `createdBy`, `modifiedBy`, `location`, `createdDate`, `modifiedDate`) VALUES
('03480571-2fba-444e-ae58-99c3146bcd36', 'b20c40d3-e34f-496d-9ad0-41b8f962e204', 'asd.png', 'document-attachments/5205167e-2718-47d8-ab25-d7c2e656b890.png', 'png', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-16 05:36:40', '2025-06-16 05:36:40'),
('1d0e759e-e5aa-456e-9490-4337a2e7fa15', '9e5149ff-6efd-4810-bd88-336ce0430559', 'audio.mp3', 'document-attachments/9a9a0456-98ce-4f6e-a9d6-27e7183af9a5.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:35:55', '2025-06-13 06:35:55'),
('2a1eb8dd-85a7-4161-8353-dd2fcf00e8e6', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'conservation (1).pdf', 'document-attachments/54d1289b-b37b-4315-ab5c-b65791ede046.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:30:57', '2025-06-17 23:30:57'),
('2ab1fc9f-0d4f-4569-a17f-7d29ad782ee9', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'ALPHA_Logo.jpg', 'document-attachments/47404e2b-2601-4646-ac4b-1436f64142a4.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('3128e440-8307-43c8-a960-f8536bec0670', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'audio.mp3', 'document-attachments/fcd2ce75-f77b-4785-9b17-8d81cf0d1512.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('335eda86-d996-4eaf-bac0-bef9a3906ac1', '8f07e356-298e-4dcc-abff-6ef5ba720ff6', 'metier-avocats.jpg', 'document-attachments/51b0913e-ae01-40f0-936e-19ceab1b5c50.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-14 01:54:49', '2025-06-14 01:54:49'),
('48a01a88-0e1d-438a-9ee7-4054238f024a', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'fposter,small,wall_texture,square_product,600x600.jpg', 'document-attachments/f4e2e766-437f-41bf-89db-2ccb897eba33.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:35:32', '2025-06-17 23:35:32'),
('6a2be4f2-b7e3-4ab1-880c-12619bdce09a', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'fposter,small,wall_texture,square_product,600x600.jpg', 'document-attachments/cf9343db-183a-4121-a3b0-12e2c57aafbf.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:30:57', '2025-06-17 23:30:57'),
('6f77bda0-6650-44d9-af47-d63489a4d58f', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'conservation (1) (2).pdf', 'document-attachments/1b96edb1-2e12-49db-b736-3f9219221f7a.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-18 12:55:56', '2025-06-18 12:55:56'),
('76ca9ea7-20e7-4c02-85f1-eaad7ec16890', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'audio.mp3', 'document-attachments/12396e8b-63bc-42f8-8a4c-14cffe6e6eba.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:30:57', '2025-06-17 23:30:57'),
('8119e89b-12ed-4c10-a30c-92a51520ac7a', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'conservation (1) (1).pdf', 'document-attachments/33d21b62-bbf4-492d-8803-be22a329c8dd.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('85755bac-0634-4e11-96cf-88d3fe4b5a2c', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'conservation (1).pdf', 'document-attachments/ef1a0d09-a0cc-4498-8ec8-9c0cd0a51ec5.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:35:32', '2025-06-17 23:35:32'),
('9689169e-84ec-4e56-9571-6663037169aa', '9e5149ff-6efd-4810-bd88-336ce0430559', 'conservation (1) (1).pdf', 'document-attachments/a5a91381-5618-4cd3-a141-e971ca089ca1.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:35:55', '2025-06-13 06:35:55'),
('99113d1c-3cce-4dc4-b541-6a21ed7a7a67', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'conservation (1) (1).pdf', 'document-attachments/d59af422-41b4-4661-99e2-7ad550d43554.pdf', 'pdf', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('a305decb-3f4f-4140-b7ad-53ead0303e87', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'ALPHA_Logo.jpg', 'document-attachments/2afde764-80db-49a1-a6b6-dab797b8f372.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-18 12:55:56', '2025-06-18 12:55:56'),
('a522a70c-4852-43b0-82f5-770458e6c42e', 'fa2c5e73-6afa-4ff0-8495-de0490035f14', 'audio.mp3', 'document-attachments/d292414f-edbf-41e2-9388-85a588b945bc.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:35:32', '2025-06-17 23:35:32'),
('aa71070e-566f-40b7-a2c0-5c66e496b9fe', '50b34fa0-c28b-4779-8ddb-5a686be43716', 'asd.png', 'document-attachments/4ae1d87c-c4b6-4ce9-816c-67bdc6ab12ba.png', 'png', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-09 02:57:17', '2025-06-09 02:57:17'),
('c2b2e047-b405-4b24-a7be-7dc8e3f1fb77', '10dbd0aa-8386-41e8-b6c7-59547de5e918', 'audio.mp3', 'document-attachments/76b3ea4d-0bf6-4ea1-a471-acc418296a16.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('cd5f9a15-53de-45da-8b97-c42bdd14a0c4', '5dc73f06-35d7-4d20-b733-cae13c59f5cd', 'metier-avocats.jpg', 'document-attachments/ed0c000d-63ad-45dc-962f-840c5ee90591.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-17 23:30:57', '2025-06-17 23:30:57'),
('d77a1b94-181d-4295-b217-ee049006a124', '6aa973b7-fc50-4123-906c-fa24f9689345', 'asd.png', 'document-attachments/00f48159-8ebd-435d-b2ef-e86d2884b085.png', 'png', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-18 11:04:04', '2025-06-18 11:04:04'),
('d787c907-0647-41ba-a0af-ce79fecb3d60', '0fd5f349-85ef-4cb9-95d0-401e6f8137c0', 'asd.png', 'document-attachments/81700e2c-e5df-4e72-9b45-01fc6d737714.png', 'png', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-18 10:54:18', '2025-06-18 10:54:18'),
('e08983fb-e750-42b5-873c-734565a42553', '78f1804b-eb4f-488d-bb38-66dcc0dbf926', 'ALPHA_Logo.jpg', 'document-attachments/9e994217-5440-424e-bbc2-2d54f91a7bcb.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:34:07', '2025-06-13 06:34:07'),
('fe1a0c88-ca5d-4b73-bb17-6394e492ed9b', '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', 'audio.mp3', 'document-attachments/1b560674-0965-4358-951e-df29d337c3fd.mp3', 'mp3', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-18 12:55:56', '2025-06-18 12:55:56'),
('fe7b8592-a17b-4937-95ef-42893dbe37c7', '9e5149ff-6efd-4810-bd88-336ce0430559', 'metier-avocats.jpg', 'document-attachments/87c28cc3-e1f0-447c-86db-451b498365d4.jpg', 'jpg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'local', '2025-06-13 06:35:55', '2025-06-13 06:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `emailSMTPSettings`
--

CREATE TABLE `emailSMTPSettings` (
  `id` char(36) NOT NULL,
  `host` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `isDefault` tinyint(1) NOT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fromEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emailSMTPSettings`
--

INSERT INTO `emailSMTPSettings` (`id`, `host`, `userName`, `password`, `port`, `isDefault`, `fromName`, `encryption`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`, `fromEmail`) VALUES
('73c4a62a-18de-48ca-86c2-827c8a350598', 'smtp.gmail.com', 'alphavisio2@gmail.com', 'vqpchqnknrgztqym', 587, 1, 'Alpha', 'tls', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-11 04:49:21', '2025-06-11 04:49:29', NULL, 'alphavisio2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `fileRequestDocuments`
--

CREATE TABLE `fileRequestDocuments` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `fileRequestId` char(36) NOT NULL,
  `fileRequestDocumentStatus` tinyint(4) NOT NULL DEFAULT 0,
  `approvedRejectedDate` datetime DEFAULT NULL,
  `approvalOrRejectedById` char(36) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `createdDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fileRequests`
--

CREATE TABLE `fileRequests` (
  `id` char(36) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `maxDocument` int(11) DEFAULT NULL,
  `sizeInMb` int(11) DEFAULT NULL,
  `allowExtension` varchar(255) NOT NULL,
  `fileRequestStatus` tinyint(4) NOT NULL DEFAULT 0,
  `linkExpiryTime` datetime DEFAULT NULL,
  `isLinkExpired` tinyint(1) NOT NULL DEFAULT 0,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `halfYearlyReminders`
--

CREATE TABLE `halfYearlyReminders` (
  `id` char(36) NOT NULL,
  `reminderId` char(36) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `quarter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `isRTL` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `imageUrl`, `createdBy`, `modifiedBy`, `order`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`, `isRTL`) VALUES
('04906ab8-15b0-11ee-83f2-d85ed3312c1f', 'ru', 'Russian', 'images/flags/russia.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 5, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('10ac83d1-15b0-11ee-83f2-d85ed3312c1f', 'ja', 'Japanese', 'images/flags/japan.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 6, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('1d9a6233-15b0-11ee-83f2-d85ed3312c1f', 'fr', 'French', 'images/flags/france.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 7, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('9ed7278c-c7e7-4c91-9a83-83833603eb47', 'ko', 'Korean ', 'images/flags/south-korea.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 8, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('df8a9fe2-15af-11ee-83f2-d85ed3312c1f', 'en', 'English', 'images/flags/united-states.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('ef46fe64-15af-11ee-83f2-d85ed3312c1f', 'cn', 'Chinese', 'images/flags/china.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 2, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('f8041d27-15af-11ee-83f2-d85ed3312c1f', 'es', 'Spanish', 'images/flags/france.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 3, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
('fe78a067-15af-11ee-83f2-d85ed3312c1f', 'ar', 'Arabic', 'images/flags/saudi-arabia.svg', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', '', 4, '', 0, '0000-00-00 00:00:00', '2025-06-03 04:25:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loginAudits`
--

CREATE TABLE `loginAudits` (
  `id` char(36) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `loginTime` varchar(255) NOT NULL,
  `remoteIP` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loginAudits`
--

INSERT INTO `loginAudits` (`id`, `userName`, `loginTime`, `remoteIP`, `status`, `provider`, `latitude`, `longitude`) VALUES
('00bd54c3-2144-4fb4-91b6-505022ec02c1', 'admin@gmail.com', '2025-06-18 12:54:04', '197.149.245.241', 'Success', NULL, NULL, NULL),
('04afbbcd-7137-48bb-a33a-f7d2e693b79c', 'admin@gmail.com', '2025-06-09 09:13:03', '127.0.0.1', 'Success', NULL, NULL, NULL),
('059f2aac-f7db-46a8-84ec-19567b668643', 'admin@gmail.com', '2025-06-12 07:32:45', '197.149.242.3', 'Error', NULL, NULL, NULL),
('09dc740d-fad2-4d3d-9ed2-919228e3ccac', 'admin@gmail.com', '2025-06-03 11:55:21', '127.0.0.1', 'Success', NULL, NULL, NULL),
('0eee8379-8081-4aaa-be5c-2d2149bcfab6', 'admin@gmail.com', '2025-06-03 05:01:38', '127.0.0.1', 'Success', NULL, NULL, NULL),
('1162eb8a-7f09-400a-8fd6-9c917c09d8f5', 'admin@gmail.com', '2025-06-16 07:03:47', '103.48.146.70', 'Success', NULL, NULL, NULL),
('1ae63b2e-aaf8-4b77-8c42-3def58c8e135', 'admin@gmail.com', '2025-06-06 13:10:49', '127.0.0.1', 'Success', NULL, NULL, NULL),
('1b35cc5f-7c8d-40d4-9f6f-22628a8a3c18', 'admin@gmail.com', '2025-06-07 05:15:31', '127.0.0.1', 'Success', NULL, NULL, NULL),
('228c40b2-1fbd-482d-a0c5-6c2a338afe54', 'admin@gmail.com', '2025-06-18 10:49:10', '103.48.146.70', 'Success', NULL, NULL, NULL),
('22c0b519-75d7-4a09-a9b7-5d9f2ccfbee0', 'admin@gmail.com', '2025-06-10 10:04:34', '197.149.243.247', 'Success', NULL, NULL, NULL),
('22f946ac-ab83-47d2-8b6f-45568fecb7da', 'admin@gmail.com', '2025-06-09 09:12:59', '127.0.0.1', 'Error', NULL, NULL, NULL),
('23b5d0bd-a7eb-4773-8067-1140a1e632e8', 'admin@gmail.com', '2025-06-04 06:36:23', '127.0.0.1', 'Success', NULL, NULL, NULL),
('26ad4336-4209-4c17-86f6-b025b33cc697', 'admin@gmail.com', '2025-06-06 04:40:13', '127.0.0.1', 'Success', NULL, NULL, NULL),
('27d70513-7bdb-4d3b-a284-e8b03c3e4023', 'admin@gmail.com', '2025-06-10 14:14:23', '197.149.243.247', 'Success', NULL, NULL, NULL),
('2a508b71-e314-4b85-8ccc-8f780e32d4f0', 'test@gmail.com', '2025-06-06 05:04:35', '127.0.0.1', 'Success', NULL, NULL, NULL),
('2b2bfacf-b6db-4ad0-9b61-12cf933b5653', 'admin@gmail.com', '2025-06-17 09:37:24', '103.48.146.70', 'Success', NULL, NULL, NULL),
('2da4d0cf-6758-4817-a25a-dbeef5cd6872', 'admin@gmail.com', '2025-06-19 06:15:02', '103.48.146.70', 'Success', NULL, NULL, NULL),
('2fbcf0a5-5c50-43f1-8f49-707b0b69cd2e', 'admin@gmail.com', '2025-06-10 10:11:55', '197.149.243.247', 'Success', NULL, NULL, NULL),
('319fc9d9-d518-480c-a926-ea5c26c35f9b', 'admin@gmail.com', '2025-06-07 11:00:30', '127.0.0.1', 'Success', NULL, NULL, NULL),
('352bb426-baa1-47e0-93e1-520f1991267b', 'admin@gmail.com', '2025-06-16 05:37:11', '197.149.243.228', 'Success', NULL, NULL, NULL),
('364be52a-28f6-4e06-9627-719be9318bef', 'admin@gmail.com', '2025-06-17 23:38:17', '197.149.242.51', 'Error', NULL, NULL, NULL),
('3cc40004-c24b-4525-8661-276b047bf9de', 'admin@gmail.com', '2025-06-09 07:25:50', '127.0.0.1', 'Success', NULL, NULL, NULL),
('3f8a8bed-fbb9-4714-9c0a-86235ed37661', 'admin@gmail.com', '2025-06-13 06:28:48', '197.149.242.3', 'Success', NULL, NULL, NULL),
('4673dd70-71e4-4a49-9550-294d451e86c1', 'admin@gmail.com', '2025-06-10 13:42:02', '197.149.243.247', 'Success', NULL, NULL, NULL),
('49735c34-c11d-4198-a870-4c66839515d0', 'admin@gmail.com', '2025-06-18 06:21:58', '197.149.242.51', 'Success', NULL, NULL, NULL),
('49911dff-1071-41cd-9bf6-f5651c12735a', 'admin@gmail.com', '2025-06-04 09:36:44', '127.0.0.1', 'Success', NULL, NULL, NULL),
('4de8ef18-b5b3-4dd5-be3f-a0bc289eb922', 'admin@gmail.com', '2025-06-12 07:32:53', '197.149.242.3', 'Success', NULL, NULL, NULL),
('53d79603-e79b-4e5a-bde3-86acbf80211d', 'admin@gmail.com', '2025-06-03 04:58:24', '127.0.0.1', 'Success', NULL, NULL, NULL),
('61e5bd96-506c-45e4-836d-6c9d42a51e85', 'admin@gmail.com', '2025-06-06 05:28:03', '127.0.0.1', 'Success', NULL, NULL, NULL),
('62a1538e-a89f-44cf-9ec8-2a314fd898cb', 'admin@gmail.com', '2025-06-06 09:22:01', '127.0.0.1', 'Success', NULL, NULL, NULL),
('6b54066b-ce9c-4097-bfab-34aaac21c611', 'admin@gmail.com', '2025-06-10 13:15:31', '197.149.243.247', 'Success', NULL, NULL, NULL),
('6d41f67f-1159-4f78-9c4f-312b31f77557', 'admin@gmail.com', '2025-06-12 12:37:49', '103.48.146.70', 'Success', NULL, NULL, NULL),
('7075aa58-d8f1-4a4a-9923-04ae5a8fe3a6', 'admin@gmail.com', '2025-06-10 09:58:35', '103.48.146.70', 'Success', NULL, NULL, NULL),
('749437e4-d529-4d6e-85b8-07ea39ef4034', 'admin@gmail.com', '2025-06-07 11:31:04', '127.0.0.1', 'Success', NULL, NULL, NULL),
('74b9e9fb-7fd2-49ac-9a95-b3ce6a76d28b', 'test@gmail.com', '2025-06-03 07:04:11', '127.0.0.1', 'Success', NULL, NULL, NULL),
('798af309-417b-475a-9f77-b5c29d59cd77', 'admin@gmail.com', '2025-06-16 04:20:55', '197.149.243.228', 'Success', NULL, NULL, NULL),
('7ffb79ec-1797-4be5-bd2d-b8de978c1ea3', 'admin@gmail.com', '2025-06-18 05:56:25', '103.48.146.70', 'Success', NULL, NULL, NULL),
('839a403d-ca16-4da2-b597-4f06d77e3054', 'admin@gmail.com', '2025-06-17 08:09:27', '103.48.146.70', 'Success', NULL, NULL, NULL),
('8e1b60c1-f914-4a10-9557-14837adb781e', 'admin@gmail.com', '2025-06-17 23:38:20', '197.149.242.51', 'Success', NULL, NULL, NULL),
('941869c0-3ce5-4007-9933-09dba5404cf4', 'admin@gmail.com', '2025-06-16 04:19:47', '197.149.243.228', 'Success', NULL, NULL, NULL),
('9d34878d-3012-4f0e-b0d9-8888915976cb', 'admin@gmail.com', '2025-06-12 07:34:27', '197.149.242.3', 'Success', NULL, NULL, NULL),
('a64f3e32-c2b4-44ee-b03d-3ffe75662468', 'admin@gmail.com', '2025-06-03 04:25:38', '127.0.0.1', 'Success', NULL, NULL, NULL),
('a8846e84-a366-4c73-8af1-3088b7bcf093', 'admin@gmail.com', '2025-06-04 09:21:38', '127.0.0.1', 'Success', NULL, NULL, NULL),
('ab7c582b-80ae-4449-85dc-85c0488948c2', 'admin@gmail.com', '2025-06-09 07:26:06', '127.0.0.1', 'Success', NULL, NULL, NULL),
('ad1588bc-f916-4d19-9831-5ea2157643fb', 'admin@gmail.com', '2025-06-11 06:40:38', '103.230.179.65', 'Success', NULL, NULL, NULL),
('b2a7079b-fb2e-46f0-b3ac-09e571b55b53', 'admin@gmail.com', '2025-06-10 10:17:10', '103.230.179.65', 'Success', NULL, NULL, NULL),
('b39e332d-8df8-47a7-8729-a8be261f8048', 'admin@gmail.com', '2025-06-16 05:37:09', '197.149.243.228', 'Success', NULL, NULL, NULL),
('b5cb59a8-6f24-462e-8063-8a2f1e90286c', 'admin@gmail.com', '2025-06-18 10:15:51', '197.149.242.51', 'Success', NULL, NULL, NULL),
('b8fec111-77f8-4720-a77c-094c67fc636e', 'admin@gmail.com', '2025-06-07 10:28:30', '127.0.0.1', 'Success', NULL, NULL, NULL),
('bbbd9716-4e37-43ce-9a85-2e4a459c4cc6', 'admin@gmail.com', '2025-06-18 10:19:25', '197.149.242.51', 'Success', NULL, NULL, NULL),
('bc41bcbf-5de6-4e9e-81c1-2fdb783f4515', 'admin@gmail.com', '2025-06-10 13:08:03', '103.48.146.70', 'Success', NULL, NULL, NULL),
('bf61e8fd-8708-4fd4-9969-97bdee903d1d', 'admin@gmail.com', '2025-06-17 11:32:37', '103.48.146.70', 'Success', NULL, NULL, NULL),
('c4a23333-3404-48e9-b344-30567056cb39', 'admin@gmail.com', '2025-06-06 10:59:05', '127.0.0.1', 'Success', NULL, NULL, NULL),
('ca4272c6-905f-4224-8e29-f2098a95bbaa', 'admin@gmail.com', '2025-06-09 09:13:16', '127.0.0.1', 'Success', NULL, NULL, NULL),
('cc31999a-6ead-48b6-b582-ac19c2477378', 'admin@gmail.com', '2025-06-13 05:09:12', '103.48.146.70', 'Success', NULL, NULL, NULL),
('cc6195a5-cd9a-45d3-8581-05c00d16174e', 'admin@gmail.com', '2025-06-12 12:39:01', '103.48.146.70', 'Success', NULL, NULL, NULL),
('ce7df958-c8ad-4d4c-b6b8-57b7c2e2ad1d', 'admin@gmail.com', '2025-06-16 05:37:04', '197.149.243.228', 'Error', NULL, NULL, NULL),
('d1318848-1df3-4627-a9d2-199a6a03947d', 'admin@gmail.com', '2025-06-04 12:05:01', '127.0.0.1', 'Success', NULL, NULL, NULL),
('d3f05e3f-19e4-4fde-9a33-326462e19993', 'admin@gmail.com', '2025-06-11 04:15:48', '103.48.146.70', 'Success', NULL, NULL, NULL),
('d7ddd018-625b-453b-a719-2f07a16d64ee', 'admin@gmail.com', '2025-06-10 03:57:52', '127.0.0.1', 'Success', NULL, NULL, NULL),
('d9e3609d-b46e-4b92-bfc4-26a67c3995a1', 'test@gmail.com', '2025-06-06 05:49:12', '127.0.0.1', 'Success', NULL, NULL, NULL),
('dca50322-141a-4f5c-ad4e-4bf27c20db09', 'admin@gmail.com', '2025-06-14 01:29:31', '197.149.242.3', 'Success', NULL, NULL, NULL),
('e12f3978-542d-48fd-9167-58ec98741c48', 'admin@gmail.com', '2025-06-06 05:28:33', '127.0.0.1', 'Success', NULL, NULL, NULL),
('e665d162-76c8-4b24-ac78-d008613f29cf', 'admin@gmail.com', '2025-06-09 04:48:12', '127.0.0.1', 'Success', NULL, NULL, NULL),
('ea6388cc-5a86-4ffc-8413-ec95a8df05bc', 'admin@gmail.com', '2025-06-16 04:19:19', '103.48.146.70', 'Success', NULL, NULL, NULL),
('ed520f56-d827-472a-a6bb-40c04d220f3c', 'admin@gmail.com', '2025-06-09 03:57:56', '127.0.0.1', 'Success', NULL, NULL, NULL),
('ed8bb85b-6257-4a0d-98d6-00f3c24de7aa', 'admin@gmail.com', '2025-06-18 10:18:14', '197.149.242.51', 'Success', NULL, NULL, NULL),
('ee23e505-8bc6-4676-9007-92c7a63c0bdd', 'admin@gmail.com', '2025-06-13 18:49:08', '197.149.242.3', 'Success', NULL, NULL, NULL),
('ef3bd8c0-fd26-43d5-8a88-230eca5d48d2', 'admin@gmail.com', '2025-06-18 07:50:36', '197.149.242.51', 'Success', NULL, NULL, NULL),
('f558a15b-67b4-4662-8639-3eb1fe0be68e', 'admin@gmail.com', '2025-06-18 12:15:37', '103.48.146.70', 'Success', NULL, NULL, NULL),
('fbc7c2e9-7ed6-4624-8562-d4ec5fbc00e2', 'admin@gmail.com', '2025-06-12 10:56:25', '103.48.146.70', 'Success', NULL, NULL, NULL),
('fd9786d5-8f49-4f6c-985d-87ca30d0616a', 'admin@gmail.com', '2025-06-17 23:22:23', '197.149.242.51', 'Success', NULL, NULL, NULL),
('ff72eb91-1664-4a2a-85d0-b220cd64152a', 'admin@gmail.com', '2025-06-13 13:57:17', '103.48.146.70', 'Success', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `jitsi_meeting_id` varchar(255) NOT NULL,
  `created_by` char(36) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `title`, `description`, `start_time`, `end_time`, `jitsi_meeting_id`, `created_by`, `isDeleted`, `created_at`, `updated_at`) VALUES
('0532bdfb-c20e-4e02-82a5-da562a9a4242', 'asdads', 'sadasd', '2025-06-12 17:45:00', '2025-06-17 17:45:00', 'f973efef-0de9-4c7d-b64c-b001d3de5a36', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-06 06:45:34', '2025-06-09 00:19:53'),
('2059776e-6e6e-471b-98bc-98b52af111f9', 'asd', 'asd', '2025-06-10 12:14:00', '2025-06-11 12:14:00', 'bd6109e7-abf8-4534-93ee-9bebdbe0dcad', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-10 01:14:52', '2025-06-10 04:19:49'),
('2fa79cd2-e7ce-45eb-bf35-b29a6a0ee5b2', 'asda', 'asdasd', '2025-06-09 11:30:00', '2025-06-24 11:30:00', 'ce36c031-2a07-4d67-81d5-f40056e126c8', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-09 00:31:05', '2025-06-09 00:35:02'),
('5e737db8-2d61-4561-8288-774221149fae', 'a', 'asdad', '2025-06-06 18:14:00', '2025-06-23 18:14:00', '8ff6ca8b-b719-4c47-a739-bff588db1593', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-06 07:14:15', '2025-06-09 00:19:52'),
('7a2484d8-4acb-4ca8-ac90-09da554a6fe1', 'asdasd', 'asdasd', '2025-06-06 18:33:00', '2025-06-26 18:33:00', '546f06eb-d6cf-4ce8-ae23-9d800ce1dad5', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-06 07:33:55', '2025-06-09 00:19:49'),
('dbe940b8-cc25-4d6b-9e21-c9e671fe8185', 'test', 'test', '2025-06-14 01:36:00', '2025-06-15 01:36:00', '4eb937ee-b47e-47f8-a6ab-9bfd9b986442', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 0, '2025-06-14 01:36:16', '2025-06-14 01:36:16'),
('eaab7212-7be4-43e3-99de-574d568b4575', 'new', 'desc', '2025-06-09 11:41:00', '2025-06-26 11:42:00', '457e613c-3bdf-4232-b873-a7ad6b71673f', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-09 00:42:14', '2025-06-10 01:14:09'),
('f85eecc4-86e1-429f-8d1d-6a0ecaafaecf', 'sagar', 'asdasd', '2025-06-06 18:34:00', '2025-06-18 18:34:00', '548c14b4-768b-4771-8421-517c3bead13d', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-06 07:34:15', '2025-06-09 00:19:47'),
('f8cd8ea7-9805-4fb3-8e44-8f98e29d7e8b', 'test1', 'est', '2025-06-12 10:21:00', '2025-06-14 13:21:00', '69b97424-ac06-4c90-92cd-138945c5636b', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 1, '2025-06-10 10:22:22', '2025-06-14 01:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_clients`
--

CREATE TABLE `meeting_clients` (
  `id` char(36) NOT NULL,
  `meeting_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meeting_clients`
--

INSERT INTO `meeting_clients` (`id`, `meeting_id`, `client_id`, `is_accepted`, `created_at`, `updated_at`) VALUES
('5f32bfbb-e24e-4de1-91cb-22a9bb9c3467', 'dbe940b8-cc25-4d6b-9e21-c9e671fe8185', '9c84ec8c-5392-4a41-89b4-a1658d775e6d', 1, '2025-06-14 01:36:16', '2025-06-14 01:36:16'),
('f57cdfb5-5aad-4764-b8ce-6c836b704581', 'f8cd8ea7-9805-4fb3-8e44-8f98e29d7e8b', '9b481e16-c5df-422b-acce-31e7b1920592', 1, '2025-06-10 10:22:22', '2025-06-10 10:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_user`
--

CREATE TABLE `meeting_user` (
  `id` char(36) NOT NULL,
  `meeting_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meeting_user`
--

INSERT INTO `meeting_user` (`id`, `meeting_id`, `user_id`, `is_accepted`, `created_at`, `updated_at`) VALUES
('21181456-b0da-436c-a75c-e910f73185b3', 'dbe940b8-cc25-4d6b-9e21-c9e671fe8185', '19766db7-2911-4373-aed6-80580d4aebb8', 1, '2025-06-14 01:36:16', '2025-06-14 01:36:16'),
('3ec9ea3c-91ff-4504-bd0f-49b076af602f', '2fa79cd2-e7ce-45eb-bf35-b29a6a0ee5b2', '19766db7-2911-4373-aed6-80580d4aebb8', 0, '2025-06-09 00:31:05', '2025-06-09 00:31:05'),
('68699d06-28ab-4692-99f2-92599c6114a4', 'f8cd8ea7-9805-4fb3-8e44-8f98e29d7e8b', '19766db7-2911-4373-aed6-80580d4aebb8', 1, '2025-06-10 10:22:22', '2025-06-10 10:22:22'),
('asd', '0532bdfb-c20e-4e02-82a5-da562a9a4242', '19766db7-2911-4373-aed6-80580d4aebb8', 0, '2025-06-09 00:05:27', '2025-06-09 00:05:27'),
('e9d4d4ed-c0ec-41e1-8062-b019d2734e5b', 'eaab7212-7be4-43e3-99de-574d568b4575', '19766db7-2911-4373-aed6-80580d4aebb8', 0, '2025-06-09 00:42:14', '2025-06-09 00:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_12_07_080139_create_users_table', 1),
(2, '2022_12_07_101203_create_roles_table', 1),
(3, '2022_12_08_055649_create_user_roles_table', 1),
(4, '2022_12_08_064517_create_categories_table', 1),
(5, '2023_01_06_103543_create_pages_table', 1),
(6, '2023_01_06_103807_create_actions_table', 1),
(7, '2023_01_07_084251_create_role_claims_table', 1),
(8, '2023_01_07_102537_create_user_claims_table', 1),
(9, '2023_01_23_062456_create_email_s_m_t_p_settings_table', 1),
(10, '2023_01_23_082532_create_documents_table', 1),
(11, '2023_01_25_091840_create_document_meta_datas_table', 1),
(12, '2023_01_26_105856_create_document_versions_table', 1),
(13, '2023_01_26_112250_create_document_role_permissions_table', 1),
(14, '2023_01_26_112318_create_document_user_permissions_table', 1),
(15, '2023_01_28_075359_create_document_comments_table', 1),
(16, '2023_01_31_063051_create_document_audit_trails_table', 1),
(17, '2023_02_07_112502_create_login_audits_table', 1),
(18, '2023_02_08_080324_create_reminders_table', 1),
(19, '2023_02_13_063925_create_reminder_users_table', 1),
(20, '2023_02_13_064215_create_half_yearly_reminders_table', 1),
(21, '2023_02_13_064719_create_quarterly_reminders_table', 1),
(22, '2023_02_13_064914_create_daily_reminders_table', 1),
(23, '2023_02_18_071307_create_reminder_notifications_table', 1),
(24, '2023_02_18_073159_create_user_notifications_table', 1),
(25, '2023_02_18_092637_create_send_emails_table', 1),
(26, '2023_02_18_101836_create_reminder_schedulers_table', 1),
(27, '2023_03_04_073617_create_document_tokens_table', 1),
(28, '2023_07_18_175356_add_encryption_to_email_s_m_t_p_settings_table', 1),
(29, '2023_07_19_084757_create_languages_table', 1),
(30, '2023_07_19_162944_create_company_profile_table', 1),
(31, '2023_12_16_103345_add_location_to_documents_table', 1),
(32, '2023_12_16_103702_add_location_to_document_versions_table', 1),
(33, '2023_12_27_110008_add_location_to_companyprofile_table', 1),
(34, '2024_03_28_044727_add__is_permanent_delete_to__document_table', 1),
(35, '2024_04_05_121019_add__is_r_t_l_to__language_table', 1),
(36, '2024_05_08_113442_add_reset_password_code_users_table', 1),
(37, '2024_07_30_060655_create_document_shareable_link', 1),
(38, '2024_10_19_095904_add_is_indexed_to_documents_table', 1),
(39, '2024_10_22_115740_create_page_helper_table', 1),
(40, '2025_02_28_071020_create_file_requests_table', 1),
(41, '2025_02_28_071225_create_file_request_documents_table', 1),
(42, '2025_02_28_095855_create_allow_file_extensions_table', 1),
(43, '2025_03_11_115518_create_clients_table', 1),
(44, '2025_03_25_084930_add_client_column_to_document_table', 1),
(45, '2025_03_25_090623_add_from_email_column_to_emailsmtp_table', 1),
(46, '2025_04_22_081450_create_ai_prompt_template_table', 1),
(47, '2025_04_22_131011_create_openai_documents_table', 1),
(48, '2025_04_28_061655_create_document_status_table', 1),
(49, '2025_04_28_062430_create__add_document_status_column_to_document_table', 1),
(50, '2025_05_13_092603_add_small_logo_image_to_company_profile_table', 1),
(51, '2025_06_03_999999_add_active_status_to_users', 2),
(52, '2025_06_03_999999_add_avatar_to_users', 2),
(53, '2025_06_03_999999_add_dark_mode_to_users', 2),
(54, '2025_06_03_999999_add_messenger_color_to_users', 2),
(55, '2025_06_03_999999_create_chatify_favorites_table', 2),
(56, '2025_06_03_999999_create_chatify_messages_table', 2),
(57, '2025_06_03_000001_create_meetings_table', 3),
(58, '2025_06_03_000002_create_meeting_user_table', 3),
(59, '2025_07_01_000001_create_document_attachments_table', 4),
(60, '2024_06_01_000000_add_password_to_clients_table', 5),
(61, '2025_06_06_053751_alter_ch_messages_from_to_uuid_columns', 6),
(62, '2025_06_07_add_attachment_url_to_ch_messages_table', 7),
(63, '2023_06_10_000000_add_id_to_meeting_user_table', 8),
(64, '2023_10_20_000000_add_type_fields_to_ch_messages_table', 9),
(65, '2023_10_25_000000_add_read_at_to_ch_messages_table', 10),
(66, '2023_10_20_000000_create_meeting_clients_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `openaiDocuments`
--

CREATE TABLE `openaiDocuments` (
  `id` char(36) NOT NULL,
  `prompt` text NOT NULL,
  `model` text NOT NULL,
  `language` text DEFAULT NULL,
  `maximumLength` int(11) DEFAULT NULL,
  `creativity` decimal(18,2) DEFAULT NULL,
  `toneOfVoice` text DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `openaiDocuments`
--

INSERT INTO `openaiDocuments` (`id`, `prompt`, `model`, `language`, `maximumLength`, `creativity`, `toneOfVoice`, `response`, `created_at`, `updated_at`) VALUES
('72ab3163-ce6f-4959-8a78-aa631424a7cb', 'answer this email content: Thanks. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Subject: Re: Thank You\n\nDear [Recipient\'s Name],\n\nThank you for your message. I appreciate your communication and your engagement.\n\nIf there is anything specific you would like to discuss or if you have any questions, please feel free to reach out.\n\nBest regards,\n\n[Your Name]  \n[Your Position]  \n[Your Contact Information]  \n[Your Company]  ', '2025-06-17 23:41:44', '2025-06-17 23:41:44'),
('977726cd-7b2f-43b2-8a5a-3702e40b1329', 'Write email about title: jobs, description: apply  job for nurse. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Subject: Application for Nursing Position\n\nDear [Hiring Manager\'s Name],\n\nI hope this email finds you well. I am writing to express my interest in the nursing position listed on [where you found the job posting, e.g., your hospital\'s career page, LinkedIn, etc.]. With my background in nursing and my commitment to providing high-quality patient care, I believe I would be a valuable addition to your team.\n\nI hold a [degree, e.g., Bachelor of Science in Nursing] from [University Name] and am a licensed registered nurse with [number] years of experience in [specific areas of nursing, e.g., acute care, pediatrics, etc.]. My clinical skills include [mention relevant skills, e.g., patient assessment, care planning, administering medications], and I have developed a strong ability to work effectively in fast-paced environments while maintaining a focus on patient safety and empathy.\n\nAdditionally, my experience at [previous employer or relevant positions] has equipped me with the skills necessary to thrive in this role. I have actively engaged in [describe relevant duties or experiences, such as collaborating with multidisciplinary teams, implementing patient care plans, or participating in quality improvement initiatives]. I take pride in being a compassionate caregiver and am dedicated to advocating for patients and their families.\n\nI am particularly drawn to [mention specific aspects about the organization or department that appeal to you], as I admire your commitment to [insert relevant attribute or mission of the organization]. I am eager to contribute my expertise and work collaboratively to enhance patient outcomes and support the goals of your team.\n\nI have attached my resume for your review. I would greatly appreciate the opportunity to discuss my application further. Thank you for considering my application. I look forward to the potential of joining [Company/Organization Name] and contributing to your team.\n\nWarm regards,\n\n[Your Name]  \n[Your Phone Number]  \n[Your Email Address]  \n[LinkedIn Profile (if applicable)]  \n[Attachment: Resume]  ', '2025-06-16 04:22:44', '2025-06-16 04:22:44'),
('b9465e9c-babd-4647-9d96-098736dec39a', 'Generate one paragraph about:  trump and elon musk. Keywords are trump elon. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Former President Donald Trump and billionaire entrepreneur Elon Musk have shared a complex relationship over the years. While Trump has praised Musk for his contributions to the tech and space industries, their differing views on certain political issues have also caused tension between the two. Despite their differences, Musk has engaged with Trump and his administration on multiple occasions, particularly on topics related to innovation and technology. Overall, their interactions reflect the diverse perspectives and relationships that exist within the business and political worlds.', '2025-06-11 04:16:43', '2025-06-11 04:16:43'),
('e15056f7-1601-49c6-b9a6-73083826ff27', 'Write email about title: Apply, description: jobs. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Subject: Job Application \n\nDear [Hiring Manager\'s Name], \n\nI hope this message finds you well. \n\nI am writing to formally express my interest in the job opening at [Company Name] as advertised on [Where You Found the Job Posting]. With my background in [Your Field/Industry] and relevant experience, I am eager to contribute to your team.\n\nI have attached my resume for your review. I believe my skills in [mention any specific skills relevant to the job] and my experience with [mention any relevant experience] align well with the requirements of the position. I am particularly excited about [mention any specific aspects of the company or job that interests you].\n\nThank you for considering my application. I look forward to the opportunity to discuss how my background, skills, and enthusiasms align with the goals of [Company Name]. Please let me know if you need any further information.\n\nBest regards,\n\n[Your Name]  \n[Your Phone Number]  \n[Your Email Address]  \n[LinkedIn Profile or Website, if applicable]  ', '2025-06-10 14:15:27', '2025-06-10 14:15:27'),
('e727cf5f-f10b-408f-969a-13a618ae13be', 'answer this email content: Thnaks. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Dear [Sender],\n\nThank you for your email. I appreciate your feedback regarding the language and creativity level of the content. I understand that you have indicated that the language used is in US English and the creativity level is rated at 0.25 out of a possible 1. \n\nI will take your comments into consideration as I continue to work on improving the content. It is my goal to ensure that the language used is appropriate for the target audience and that the level of creativity meets the standards set for the project.\n\nIf you have any further feedback or suggestions, please do not hesitate to let me know. Your input is valuable in helping me to create the best possible content. Thank you for taking the time to provide your feedback.\n\nSincerely,\n\n[Your Name]', '2025-06-17 23:42:53', '2025-06-17 23:42:53'),
('fdf3769b-dbf4-4eec-833e-0d5607556729', 'Write email about title: job, description: apply nurse job. Language is en-US Creativity level is 0.25 between 0 and 1 Maximum 1000 words Tone of voice must be Professional', 'gpt-4', 'en-US', 1000, 0.25, 'Professional', 'Subject: Application for Nurse Position\n\nDear [Hiring Manager\'s Name],\n\nI hope this message finds you well. I am writing to express my interest in the nursing position advertised on [where you found the job listing]. With my background in nursing and dedication to providing high-quality patient care, I am excited about the opportunity to contribute to your esteemed healthcare team.\n\nI hold a [your degree, e.g., Bachelor of Science in Nursing] from [Your University] and am licensed to practice in [State]. My experience includes [number] years of working in various healthcare settings, including [mention relevant specialties or departments, e.g., medical-surgical, pediatrics, or critical care]. In my previous role at [Your Previous Employer], I was responsible for [briefly describe your key responsibilities and achievements, such as administering medications, developing care plans, or collaborating with interdisciplinary teams].\n\nI am particularly drawn to this position at [Company/Facility Name] because of [mention any specific reason related to the company, such as its reputation, values, or a specific program]. I believe that my skills in [specific skills relevant to the job, e.g., patient assessment, communication, and crisis management] align well with the needs of your team.\n\nThroughout my career, I have demonstrated a commitment to professional development and continuous learning. I am adept at utilizing technology in patient care, including electronic health records, which enhances communication and efficiency in a busy healthcare environment. My strong work ethic and ability to adapt to changing circumstances allow me to provide the best care possible for my patients.\n\nI am excited about the prospect of joining [Company/Facility Name] and contributing to the exceptional care you provide to your patients. I am eager to bring my skills and experience in nursing to your team and am looking forward to the possibility of discussing how I can support your mission.\n\nThank you for considering my application. I have attached my resume for your review and would welcome the opportunity to speak with you further about how I can be an asset to your team. Please feel free to reach out to me at [your phone number] or [your email address] to arrange a convenient time for a discussion.\n\nWarm regards,\n\n[Your Name]  \n[Your Address]  \n[City, State, Zip]  \n[Your Phone Number]  \n[Your Email Address]  \n[Attachment: Resume]  ', '2025-06-16 05:38:44', '2025-06-16 05:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `pageHelper`
--

CREATE TABLE `pageHelper` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pageHelper`
--

INSERT INTO `pageHelper` (`id`, `code`, `name`, `description`) VALUES
('0cc83192-f05b-4c97-ab20-f7f3b5ba16d0', 'REMINDERS', 'Reminders', '<p>The <strong>\"Reminders\"</strong> page is the central hub for managing reminders within CMR DMS, where users can create, view, and manage reminders or notifications related to documents or other activities. Reminders can be set to repeat at regular intervals and can be associated with a specific document for efficient tracking of tasks and activities.</p><h3>Main components:</h3><ol><li><strong>\"Add Reminder\" Button</strong>:<ul><li>Allows users to create a new reminder.</li><li>Upon clicking, it opens a form where details such as subject, message, frequency, associated document, and reminder date can be entered.</li></ul></li><li><strong>Reminders Table</strong>:<ul><li>Displays all created reminders in a tabular format.</li><li>Each entry includes:<ul><li>Start date</li><li>End date</li><li>Reminder subject</li><li>Associated message</li><li>Recurrence frequency</li><li>Associated document (if applicable)</li></ul></li></ul></li></ol><h3>\"Add Reminder\" Form:</h3><p>When users click on the <strong>\"Add Reminder\"</strong> button, a form opens with the following fields:</p><ul><li><strong>Subject</strong>: The title or topic of the reminder (e.g., \"Document Review\").</li><li><strong>Message</strong>: Additional details about the reminder (e.g., \"Review the document by X date\").</li><li><strong>Repeat Reminder</strong>: Sets the recurrence frequency, with options such as:<ul><li>Daily</li><li>Weekly</li><li>Monthly</li><li>Semi-annually</li></ul></li><li><strong>Send Email</strong>: An option to send an email notification when the reminder is activated.</li><li><strong>Select Users</strong>: Allows selecting users to whom the reminder will be sent. It can be customized for specific teams or individuals.</li><li><strong>Reminder Date</strong>: The date and time when the reminder will be activated and sent.</li></ul><h3>How to add a new reminder:</h3><ol><li>Navigate to the <strong>\"Reminders\"</strong> page.</li><li>Click the <strong>\"Add Reminder\"</strong> button.</li><li>Fill in the form fields with the necessary information.</li><li>After entering all the details, click <strong>\"Save\"</strong> or <strong>\"Add\"</strong> to save the reminder in the system.</li></ol><h3>\"Add Reminder\" Functionality in the \"Manage Reminders\" section:</h3><p>This is the dedicated place for creating and managing notifications related to events or tasks. The <strong>\"Add Reminder\"</strong> functionality offers full customization, and reminders can be sent to selected users.</p><ul><li><strong>Subject</strong>: Enter a descriptive title for the reminder.</li><li><strong>Message</strong>: Add a clear and concise message to detail the purpose of the reminder.</li><li><strong>Repeat Reminder</strong>: Set whether the reminder will be repeated periodically (daily, weekly, etc.).</li><li><strong>Send Email</strong>: If this option is checked, the reminder will also be sent as an email.</li><li><strong>Select Users</strong>: Select users from the system\'s list to whom the reminder will be sent.</li><li><strong>Reminder Date</strong>: Set the date and time for the reminder to be triggered.</li></ul>'),
('0d3afaea-1984-41f9-a826-fa5b0a9ccad3', 'BULK_DOCUMENT_UPLOADS', 'Document Bulk Upload', '<h3><strong>Bulk Document Uploads</strong></h3><p>Easily upload multiple documents to your system with the following steps:</p><p><strong>1.Category</strong></p><ul><li><strong>Select Category</strong>: Choose a category where your documents will be stored. This helps organize your uploads.</li></ul><p><strong>2.Document Status</strong></p><ul><li>Define the status of each document (e.g., Draft, Final, Archived). This ensures clarity and organization.</li></ul><p><strong>3.Storage</strong></p><ul><li>Select the storage location for your documents:<ul><li><strong>Local</strong>: Save documents to the local storage system.</li></ul></li></ul><p><strong>4.Assign By Roles</strong></p><ul><li><strong>5.Roles</strong>: Assign specific roles to the documents. For example: Manager, Editor, or Viewer.</li><li>This determines which roles have access to the uploaded documents.</li></ul><p><strong>6.Assign By Users</strong></p><ul><li><strong>7.Users</strong>: Assign individual users who can access these documents.</li><li>Select from a list of users in your system.</li></ul><p><strong>8.Document Upload</strong></p><ul><li>Select multiple files to upload from your device.</li><li>Ensure the file extensions are in the allowed list.</li><li>Optionally, rename files before uploading to keep them organized.</li></ul><p><strong>9.Finalize Upload</strong></p><ul><li>After filling out all the required fields, upload the documents.</li><li>The system will automatically assign the selected roles and users to each uploaded file.</li></ul>'),
('0fae65e2-091d-469b-8a2a-9bb363ba8290', 'DOCUMENTS_AUDIT_TRAIL', 'Document audit history', '<p><strong>General Description:</strong></p><p>The \"Document Audit History\" page provides a detailed view of all actions performed on documents within the DMS. It allows administrators and users with appropriate permissions to monitor and review document-related activities, ensuring transparency and information security.</p><p><strong>Main Components:</strong></p><p><strong>Search Boxes:</strong></p><ul><li><strong>By Document Name:</strong> Allows users to search for a specific document by entering its name or other details.</li><li><strong>By Meta Tag:</strong> Users can enter meta tags to filter and search for specific document-related activities.</li><li><strong>By User:</strong> Enables filtering activities based on the user who performed the operation.</li></ul><p><strong>List of Audited Documents:</strong></p><p>Displays all actions taken on documents in a tabular format.</p><p>Each entry includes details of the action, such as the date, document name, Category, operation performed, who performed the operation, to which user, and to which role the operation was directed.</p><p>Users can click on an entry to view additional details or access the associated document.</p><p><strong>List Sorting:</strong></p><p>Users can sort the list by any of the available columns, such as \"Date,\" \"Name,\" \"Category Name,\" \"Operation,\" \"Performed by,\" \"Directed to User,\" and \"Directed to Role.\"</p><p>This feature makes it easier to organize and analyze information based on specific criteria.</p><p><strong>How to Search the Audit History:</strong></p><ul><li>Enter your search criteria in the corresponding search box (document name, meta tag, or user).</li><li>The search results will be displayed in the audited documents list.</li></ul><p><strong>How to Sort the List:</strong></p><ul><li>Click on the column title by which you want to sort the list (e.g., \"Date\" or \"Name\").</li><li>The list will automatically reorder based on the selected criterion.</li></ul>'),
('25ccccd4-bd60-4f8b-8bc1-c49eca98fb49', 'EMAIL_SMTP_SETTINGS', 'SMTP Email Settings', '<p>The <strong>\"Email SMTP Settings\"</strong> page within CMR DMS allows administrators to configure and manage the SMTP settings for sending emails. This ensures that emails sent from the system are correctly and efficiently delivered to recipients.</p><p><strong>Key Components:</strong></p><ul><li><p><strong>SMTP Settings Table:</strong> Displays all configured SMTP settings in a tabular format.</p><p>Each entry in the table includes details such as the username, host, port, and whether that configuration is set as the default.</p></li><li><p><strong>\"Add Settings\" Button:</strong> Allows administrators to add a new SMTP configuration.</p><p>Clicking the button opens a form where details like username, host, port, and the option to set it as the default configuration can be entered.</p></li></ul><p><strong>\"Add Settings\" Form:</strong></p><p>This form opens when administrators click the \"Add Settings\" button and includes the following fields:</p><ul><li><strong>Username:</strong> The username required for authentication on the SMTP server.</li><li><strong>Host:</strong> The SMTP server address.</li><li><strong>Port:</strong> The port on which the SMTP server listens.</li><li><strong>Is Default:</strong> A checkbox that allows setting this configuration as the default for sending emails.</li></ul><p><strong>How to Add a New SMTP Configuration:</strong></p><ol><li>Click the \"Add Settings\" button.</li><li>The \"Add Settings\" form will open, where you can enter the SMTP configuration details.</li><li>Fill in the necessary fields and select the desired options.</li><li>After completing the details, click \"Save\" or \"Add\" to add the configuration to the system.</li></ol>'),
('2b728c10-c0b3-451e-8d08-2be1e3f6d5b3', 'USERS', 'Users', '<p><strong>The \"Users\" page is the central hub for managing all registered users in CMR DMS. Here, administrators can add, edit, or delete users, as well as manage permissions and reset passwords. Each user has associated details such as first name, last name, mobile phone number, and email address.</strong></p><p><strong>Main Components:</strong></p><ul><li><p><strong>\"Add User\" Button:</strong> Allows administrators to create a new user in the system.</p><p>Opens a form where details such as first name, last name, mobile phone number, email address, password, and password confirmation can be entered.</p></li><li><p><strong>List of Existing Users:</strong> Displays all registered users in the system in a tabular format.</p><p>Each entry includes the user’s email address, first name, last name, and mobile phone number.</p><p>Next to each user, there is an action menu represented by three vertical dots.</p></li><li><p><strong>Action Menu for Each User:</strong> This menu opens by clicking on the three vertical dots next to each user.</p><p>Includes the options:</p><ul><li><strong>Edit:</strong> Allows modification of the user’s details.</li><li><strong>Delete:</strong> Removes the user from the system. This action may require confirmation to prevent accidental deletions.</li><li><strong>Permissions:</strong> Opens a window or form where administrators can set or modify the user’s permissions.</li><li><strong>Reset Password:</strong> Allows administrators to initiate a password reset process for the selected user.</li></ul></li></ul><p><strong>How to Add a New User:</strong></p><ol><li>Click on the \"Add User\" button.</li><li>A form will open where you can enter the user’s details: first name, last name, mobile phone number, email address, password, and password confirmation.</li><li>After completing the details, click \"Save\" or \"Add\" to add the user to the system.</li></ol>'),
('2dd28c72-3ed4-4f75-b23b-63cadcaa3982', 'ALL_DOCUMENTS', 'All Documents', '<p>The <strong>\"All Documents\"</strong> page provides a complete overview of all documents uploaded in the DMS. It is the ideal place to search, view, manage, and distribute all available documents in the system.</p><p><strong>Main Components:</strong></p><ul><li><strong>\"Add Document\" Button:</strong> Allows any user with appropriate permissions to upload a new document into the system.<ul><li>Opens a form or a pop-up window where files can be selected and uploaded.</li></ul></li><li><strong>Search Box (by name):</strong> Allows users to search for a specific document by entering its name or other details.</li><li><strong>Search Box (by meta tags):</strong> Users can enter Meta tags to filter and search for specific documents.</li><li><strong>Category Dropdown:</strong> A dropdown menu that allows users to filter documents by Category.</li><li><strong>Storage Dropdown: </strong>The application lets users store documents in various storage options, such as AWS S3 and local storage. Users can easily search for documents by selecting the desired storage option from a dropdown menu.</li><li><strong>Search Box (by creation date):</strong> Allows users to search for documents based on their creation date.</li><li><strong>List of All Uploaded Files:</strong> Displays all documents available in the system.<ul><li>Each entry includes document details such as name, creation date, Category, status and storage.</li></ul></li><li><strong>Document Actions Menu:</strong> Alongside each document in the list, users will find an actions menu allowing them to perform various operations on the document:<ul><li><strong>Edit:</strong> Modify the document details, such as its name or description.</li><li><strong>Share:</strong> Share the document with other users or roles within the system.</li><li><strong>Get Shareable Link:</strong> Users can generate a shareable link to allow anonymous users to access documents. They can also protect the link with a password and set an expiration period, ensuring the link remains active only for the selected duration. Additionally, the link includes an option for recipients to download the shared document.</li><li><strong>View:</strong> Open the document for viewing.</li><li><strong>Upload a New Version:</strong> Add a new version of the document.</li><li><strong>Version History:</strong> Users can view all previous versions of a document, with the ability to restore any earlier version as needed. Each version can also be downloaded for offline access or review.</li><li><strong>Comment:</strong> Add or view comments on the document.</li><li><strong>Add Reminder:</strong> Set a reminder for the document.</li><li><strong>Send as Email:</strong> Send the document as an attachment via email.</li><li><strong>Delete:</strong> Remove the document from the system.</li></ul></li></ul><p><strong>Document Sharing:</strong></p><p>Users can select one, multiple, or all documents from the list and use the sharing option to distribute the selected documents to other users. This feature facilitates the mass distribution of documents to specific users or groups.</p>'),
('350137e8-91d3-4e53-a621-1fae3fb680eb', 'FILE_REQUEST_UPLOADED_DOCUMENTS', 'File Request Documents', '<h2>File Request Uploaded Documents</h2><p>The <strong>File Request Uploaded Documents</strong> feature allows you to manage the documents submitted through your file request link. You can review, approve, or reject uploaded files and provide feedback or reasons for rejection.</p><h2>Key Features:</h2><p><strong>1.View Uploaded Documents</strong>:</p><ul><li>Access all documents submitted via the file request link.</li><li>See details such as:<ul><li>File Name</li><li>Upload Date</li><li>Document Status</li><li>Reason</li></ul></li></ul><p><strong>2.Approve Documents</strong>:</p><ul><li>Mark documents as <strong>Approved</strong> if they meet your requirements.</li><li>Approved documents will be saved and marked as finalized.</li></ul><p><strong>3.Reject Documents</strong>:</p><ul><li>Reject documents that do not meet the criteria or need corrections.</li><li>When rejecting a document:<ul><li>Add a <strong>Comment</strong> to explain the reason for rejection.</li><li>This ensures users understand what needs to be corrected or resubmitted.</li></ul></li></ul><p><strong>4.Document Preview</strong>:</p><ul><li>View uploaded documents directly before approving or rejecting them.</li><li>Supports previewing common file types such as PDF, DOCX, JPG, and PNG.</li></ul><p><strong>5.Status Tracking</strong>:</p><ul><li>Each document will have a status indicator:<ul><li><strong>Pending</strong>: Awaiting review.</li><li><strong>Approved</strong>: Accepted and finalized.</li><li><strong>Rejected</strong>: Requires resubmission with a reason provided.</li></ul></li></ul><h2>How It Works:</h2><h3>1. Viewing Uploaded Documents:</h3><ul><li>Go to the <strong>File Request Uploaded Documents</strong> page.</li><li>Select the relevant file request from the list.</li><li>All submitted documents for that request will be displayed.</li></ul><h3>2. Approving Documents:</h3><ul><li>Click on the document you want to approve.</li><li>Review the document using the preview feature.</li><li>If the document meets your requirements, click <strong>Approve</strong>.</li><li>The status will change to <strong>Approved</strong>.</li></ul><h3>3. Rejecting Documents:</h3><ul><li>Click on the document you want to reject.</li><li>Use the preview feature to review the document.</li><li>If the document does not meet the requirements:<ul><li>Click <strong>Reject</strong>.</li><li>Enter a <strong>Reason for Rejection</strong> in the comment box (e.g., Incorrect file format or Incomplete information).</li><li>Save the rejection and notify the user to resubmit.</li></ul></li></ul><h3>4. Adding Comments for Rejected Documents:</h3><ul><li>When rejecting a document, always provide a clear and actionable comment.</li><li>Examples of comments:<ul><li>Please upload a file in PDF format.</li><li>The document is missing required signatures.</li><li>File size exceeds the maximum limit; please compress and reupload.</li></ul></li></ul><h2>Benefits:</h2><ul><li><strong>Efficient Review</strong>: Quickly review and take action on uploaded documents.</li><li><strong>Clear Communication</strong>: Provide feedback for rejected documents, ensuring users know what to fix.</li><li><strong>Organized Workflow</strong>: Keep track of document statuses with easy-to-use status indicators.</li></ul><p>This feature ensures a smooth and transparent document review process for both you and the users.</p>'),
('3e0fe36d-cde5-4bd9-b65d-cfaeadcffce3', 'COMPANY_PROFILE', 'Company Profile', '<p>Here’s a detailed description of the functionality for managing the company profile, focusing on the company name, logo, and banner logo on the login screen.</p><h3> </h3><h4>Overview</h4><p>The Company Profile feature allows users to customize the branding of the application by entering the company name and uploading logos. This customization will reflect on the login screen, enhancing the professional appearance and brand identity of the application.</p><h4>Features</h4><ol><li><h4><strong>Company Name</strong></h4><ul><li><strong>Input Field:</strong><ul><li>Users can enter the name of the company in a text input field.</li><li><strong>Validation:</strong><ul><li>The field will have validation to ensure the name is not empty and meets any specified length requirements (e.g., minimum 2 characters, maximum 50 characters).</li><li><strong>Browser Title Setting:</strong></li><li>Upon saving the company name, the application will dynamically set the browser title to match the company name, improving brand visibility in browser tabs.</li></ul></li></ul></li></ul></li><li><h4><strong>logo Upload</strong></h4><ul><li><strong>Upload Button:</strong><ul><li>Users can upload a company logo that will be displayed in the header of the login page.</li><li><strong>File Requirements:</strong><ul><li>Supported file formats: PNG, JPG, JPEG (with size limits, e.g., up to 2 MB).</li><li>Recommended dimensions for optimal display (e.g., width: 200px, height: 100px).</li></ul></li></ul></li><li><strong>Preview:</strong><ul><li>After uploading, a preview of the logo will be displayed to confirm the upload.</li></ul></li></ul></li><li><h4><strong>Banner logo Upload</strong></h4><ul><li><strong>Upload Button:</strong><ul><li>Users can upload a banner logo that will appear prominently on the login screen.</li><li><strong>File Requirements:</strong><ul><li>Supported file formats: PNG, JPG, JPEG (with size limits, e.g., up to 3 MB).</li><li>Recommended dimensions for optimal display (e.g., width: 1200px, height: 300px).</li></ul></li></ul></li><li><strong>Preview:</strong><ul><li>A preview of the banner logo will be displayed after the upload for confirmation.</li></ul></li></ul></li><li><h4><strong>User Interaction Flow</strong></h4><ul><li><h4><strong>Navigating to the Company Profile:</strong></h4><ul><li>Users can access the company profile settings from the application’s settings menu or administration panel.</li></ul></li><li><strong>Editing Company Profile:</strong><ul><li>Users enter the company name, upload the logo, and the banner logo.</li><li>A \"Save Changes\" button will be available to apply the modifications.</li></ul></li><li><strong>Saving Changes:</strong><ul><li>Upon clicking \"Save Changes,\" the uploaded logos and company name will be saved and reflected on the login screen.</li><li>Confirmation messages will be displayed to indicate successful updates.</li></ul></li></ul></li><li><strong>Display on Login Screen</strong><ul><li><strong>Header Display:</strong><ul><li>The company logo will be displayed in the header at the top of the login page, maintaining a consistent branding experience.</li></ul></li><li><strong>Banner Display:</strong><ul><li>The banner logo will be displayed prominently below the header, enhancing the visual appeal of the login interface.</li></ul></li></ul></li></ol><h3>Summary</h3><p>The Company Profile functionality allows for a customizable branding experience, enabling users to set their company name and logos that will be visible on the login screen. This feature enhances user engagement and presents a professional image right from the login phase of the application.</p>'),
('45c53b1a-a865-4c22-b56a-9f5e6cf83528', 'CLIENTS', 'Clients', '<p>The <strong>Clients</strong> section helps you manage and view all your clients in one place. Here’s what you can do:</p><p><strong>1.Clients List</strong></p><ul><li>A list of all your clients is displayed with the following details:</li></ul><p><strong>Action</strong>: Options to edit or delete client information.</p><p><strong>Company/Person Name</strong>: The name of the company or individual client.</p><p><strong>Contact Person</strong>: The primary contact person for the client.</p><p><strong>Email</strong>: The email address of the client for communication.</p><p><strong>Mobile Number</strong>: The mobile number of the client for easy contact.</p><p><strong>2.Add Client</strong></p><ul><li>Click the <strong>Add Client</strong> button to create a new client.</li><li>Fill in details like the company or person name, contact person, email, and mobile number.</li><li>Save the new client, and it will be added to the clients list.</li></ul>'),
('4792e9a6-10f0-4a5a-9294-1eb4d663d72f', 'ARCHIVED_DOCUMENTS', 'Archived Documents', 'The Archived Documents feature allows users to securely store and organize documents that are no longer actively used but need to be retained for future reference or compliance purposes. Archiving helps declutter the active workspace by moving older documents to a dedicated archive, while still keeping them easily accessible when needed.'),
('49612137-bc17-4b60-b905-3c48734500bd', 'AI_DOCUMENT_GENERATOR', 'AI Document Generator', '<h2>? Using the AI Document Generator</h2><h3>Step-by-Step Instructions</h3><h4>?️ 1. <strong>Enter a Prompt</strong></h4><p>Navigate to the section where document creation is available. You will see a prompt input field labeled <strong>\"Generate with AI\"</strong> or similar.</p><blockquote><p>Example Prompt:<br>“Write a GDPR privacy policy for a small e-commerce company.”</p></blockquote><h4>▶️ 2. <strong>Click ‘Generate’</strong></h4><p>Click the <strong>\"Generate\"</strong> or <strong>\"Submit\"</strong> button next to the prompt box. This sends your request to the backend, which calls OpenAI.</p><h4>? 3. <strong>Real-Time Streaming</strong></h4><p>You’ll begin to see content populate inside the rich text editor <strong>(CKEditor)</strong> live — no need to refresh or wait for a full response. The AI streams back sentences as it composes.</p><blockquote><p>? This process typically starts in 1–2 seconds and streams text smoothly in real-time.</p></blockquote><h4>✍️ 4. <strong>Edit the Content</strong></h4><p>Once the document is generated, you can:</p><ul><li>Edit directly inside the CKEditor</li><li>Apply formatting (headings, lists, links, etc.)</li><li>Save the document into the system or export as needed</li></ul><h2>? Advanced Features</h2><ul><li>✅ <strong>Real-Time Streaming</strong>: Watch content appear as it’s generated.</li><li>? <strong>Secure Access</strong>: Only authenticated users can access the API using Bearer tokens.</li><li>? <strong>Auto Save</strong>: Generated content is automatically stored along with the original prompt.</li><li>? <strong>Markdown to HTML</strong>: The system parses markdown and renders it as rich text in the editor.</li></ul><h2>❗ Common Issues &amp; Troubleshooting</h2><figure class=\"table\"><table><thead><tr><th>Issue</th><th>Cause</th><th>Solution</th></tr></thead><tbody><tr><td>⚠️ Nothing is generated</td><td>Blank prompt or network error</td><td>Make sure you entered a valid prompt and are connected to the internet</td></tr><tr><td>? 419 Error</td><td>Missing CSRF token or unauthorized call</td><td>Ensure you\'re logged in and the request includes a valid Bearer token</td></tr><tr><td>❌ API Failed</td><td>OpenAI error or rate limit</td><td>Try again in a few minutes or check logs for API key issues</td></tr></tbody></table></figure><h2>? Best Practices</h2><ul><li>Use clear and specific prompts to get better results.</li><li>Include document type or target audience in your prompt.<ul><li>✅ “Create an employee NDA agreement for a startup in plain language.”</li></ul></li><li>Edit the AI-generated content before final submission for accuracy.</li></ul><h2>?️ Security Notes</h2><ul><li>Your prompt and result are stored securely in the system.</li><li>OpenAI credentials are never exposed to the client.</li><li>Only authenticated users can trigger the AI generation feature.</li></ul><h2>? Need Help?</h2><p>If you encounter issues:</p><ul><li>Contact Support via the Help Center</li><li>Check your browser console (F12) for error messages</li><li>Ensure your token is active and valid</li></ul><p>Would you like this delivered as a downloadable <strong>PDF</strong> or <strong>Markdown</strong> file for sharing? I can generate one for you right away.</p>'),
('509dfdb8-8e5c-4370-8427-f6a9c2c78007', 'ROLE_USER', 'Role users', '<p><strong>The \"User with Role\" page is dedicated to assigning specific roles to users within the DMS. It allows administrators to associate users with particular roles using an intuitive \"drag and drop\" system. Users can be moved from the general user list to the \"Users with Role\" list, thereby assigning them the selected role.</strong></p><h3><strong>Main Components:</strong></h3><ul><li><strong>Title \"User with Role\":</strong> Indicates the purpose and functionality of the page.</li><li><strong>Department:</strong> Displays the currently selected department, in this case, \"Approvals.\"<ul><li>There may be an option to change the department if needed.</li></ul></li><li><strong>Select Role:</strong> A dropdown menu or selection box where administrators can choose the role they wish to assign to users.<ul><li>Once a role is selected, users can be moved into the \"Users with Role\" list to assign them that role.</li></ul></li><li><strong>Note:</strong> A short instruction explaining how to use the page, indicating that users can be moved from the \"All Users\" list to the \"Users with Role\" list to assign them a role.</li><li><strong>\"All Users\" and \"Users with Role\" Lists:</strong><ul><li><strong>\"All Users\":</strong> Displays a complete list of all registered users in the CMR DMS.</li><li><strong>\"Users with Role\":</strong> Displays the users who have been assigned the selected role.</li><li>Users can be moved between these lists using the \"drag and drop\" functionality.</li></ul></li></ul><h3><strong>How to Assign a Role to a User:</strong></h3><ol><li>Select the desired role from the \"Select Role\" box.</li><li>Locate the desired user in the \"All Users\" list.</li><li>Using the mouse or a touch device, drag the user from the \"All Users\" list and drop them into the \"Users with Role\" list.</li><li>The selected user will now be associated with the chosen role and will appear in the \"Users with Role\" list.</li></ol>'),
('5475c0fb-5a9e-44e1-b628-6757d6865d2a', 'MANAGE_ALLOW_FILE_EXTENSION', 'Manage File Extensions', '<p><strong>Manage Allowed File Extensions</strong></p><p>This functionality allows users to control which file types are permitted for upload in the application. Users can easily configure allowed file extensions by selecting the desired file types and specifying their extensions in a provided configuration interface. Here\'s how it works:</p><ol><li><strong>Select File Types</strong>: Users can choose from a predefined list of file types (e.g., images, documents, videos) or manually add custom types.</li><li><strong>Add Extensions</strong>: For each file type, users can specify the associated file extensions (e.g., .jpg, .pdf, .mp4).</li><li><strong>Apply Changes</strong>: Once configured, the application will enforce these rules, ensuring only the specified file types can be uploaded.</li><li><strong>Easy Management</strong>: Users can modify, add, or remove allowed extensions anytime, making the system flexible and easy to update.</li></ol><p>This functionality simplifies file type management and ensures compliance with application requirements or security policies.</p>'),
('5c66b992-8ec0-4d61-ab1e-1f5d40186403', 'DEEP_SEARCH', 'Deep Search', '<p>The <strong>Deep Search</strong> feature in the document management system enables users to perform powerful searches within the content of various file formats such as PDFs, Word documents, text files, and Excel spreadsheets.</p><p>Key functionalities include:</p><p>- <strong>Content-Based Search</strong>: The system scans the actual content within supported file formats (PDF, Word, Text, Excel), allowing users to search for keywords, phrases, or data inside the documents, not just file names or metadata.<br>&nbsp;<br>- <strong>Multi-Format Support</strong>: Deep search works seamlessly across different file formats, ensuring users can locate relevant information regardless of the document type.<br>&nbsp;<br>- <strong>Top 10 Search Results</strong>: The search returns the most relevant top 10 results based on the query, helping users quickly access the most pertinent documents or information.<br>&nbsp;<br>- <strong>Fast and Efficient</strong>: Optimized for speed, the deep search functionality delivers results promptly, even when searching across large document libraries.</p><p>This feature enhances productivity by allowing users to find specific content within documents, saving time and improving access to critical information.</p><p><strong>Note:</strong></p><p>You will receive up to 10 results for each search. The search is not case-sensitive, so searching for \"Report\" and \"report\" will return the same results. Common words like \"and,\"\"the,\" and \"is\" are ignored to improve search efficiency. The search also matches variations of words, so searching for \"run\" will include results for \"running\" and \"runs.\" Supported file types include Word documents, PDFs, Notepad files, and Excel spreadsheets.</p>'),
('5d15d912-674b-47af-ade8-35013e4c95c4', 'DOCUMENT_COMMENTS', 'Comments', '<ul><li><strong>Allows users to add comments to the document.</strong></li><li>Other users can view and respond to comments, facilitating discussion and collaboration on the document.</li></ul>'),
('5d7ba1b1-a380-4e4d-8cb0-56159a6ee0d3', 'ASSIGNED_DOCUMENTS', 'Assigned documents', '<p>The <strong>\"Assigned Documents\"</strong> page is the central hub for managing documents allocated to a specific user. Here, users can view all the documents assigned to them, search for specific documents, and perform various actions on each document.</p><h3>Main Components:</h3><ul><li><strong>\"Add Document\" Button</strong>: Allows users to upload a new document to the system.<ul><li>Opens a form or pop-up window where files can be selected and uploaded.</li></ul></li><li><strong>My Reminders</strong>: Displays a list of all the reminders set by the user.<ul><li>Users can view, edit, or delete reminders.</li></ul></li><li><strong>Search Box (by name or document)</strong>: Allows users to search for a specific document by entering its name or other document details.</li><li><strong>Search Box (by meta tags)</strong>: Users can enter meta tags to filter and search for specific documents.</li><li><strong>Category Selection Dropdown</strong>: A dropdown menu that allows users to filter documents based on their Category.</li><li><strong>Status Selection Dropdown</strong>: A dropdown menu that allows users to filter documents based on their status.</li><li><strong>List of files allocated to the user</strong>: Displays the documents assigned to the user in allocation order.<ul><li>Each entry includes columns for \"Action,\" \"Name,\" \"Status,\" \"Category Name,\" \"Creation Date,\" \"Expiration Date,\" and \"Created By.\"</li></ul></li><li>Next to each document, there is a menu with options such as \"edit,\" \"share,\" \"view,\" \"upload a version,\" \"version history,\" \"comment,\" and \"add reminder.\"</li></ul><h3>How to Add a New Document:</h3><ol><li>Click the <strong>\"Add Document\"</strong> button.</li><li>A form or pop-up window will open.</li><li>Select and upload the desired file, then fill in the necessary details.</li><li>Click <strong>\"Save\"</strong> or <strong>\"Add\"</strong> to upload the document to the system.</li></ol><h3>How to Search for a Document:</h3><ol><li>Enter the document\'s name or details in the appropriate search box.</li><li>The search results will be displayed in the document list.</li></ol><h3>How to Perform Actions on a Document:</h3><p><strong>Document Action Menu Overview</strong>:<br>The action menu offers users various options for managing and interacting with the assigned documents. Each action is designed to provide specific functionalities, allowing users to work efficiently with their documents.</p><h4>Available Options:</h4><ul><li><strong>Edit</strong>: Allows users to modify the document\'s details, such as its name, description, or meta tags.<ul><li>After making changes, users can save the updates.</li></ul></li><li><strong>Share</strong>: Provides the option to share the document with other users or roles in the system.<ul><li>Users can set specific permissions, such as view or edit, for those with whom the document is shared.</li></ul></li><li><strong>View</strong>: Opens the document in a new window or an embedded viewer, allowing users to view the document\'s content without downloading it.</li><li><strong>Upload a Version</strong>: Allows users to upload an updated version of the document.<ul><li>The original document remains in the system, and the new version is added as an update.</li></ul></li><li><strong>Version History</strong>: Displays all previous versions of the document.<ul><li>Users can view, or download any of the previous versions if the administrator allows the user to download document permission.</li></ul></li><li><strong>Comment</strong>: Allows users to add comments to the document.<ul><li>Other users can view and respond to comments, facilitating discussion and collaboration on the document.</li></ul></li><li><strong>Add Reminder</strong>: Sets a reminder for an event or action related to the document.<ul><li>Users can receive notifications or emails when the reminder date approaches.</li></ul></li></ul>'),
('5d858491-f9db-4aef-959f-5af9d7f3b7bd', 'MANAGE_ROLE', 'Manage Role', '<ul><li>Allows administrators or users with appropriate permissions to create a new role in the system.</li><li>Opens a form or a pop-up window where permissions and role details can be defined.</li><li>Enter the role name and select the appropriate permissions from the available list.</li><li>Click <strong>\"Save\"</strong> or <strong>\"Add\"</strong> to add the role to the system with the specified permissions.</li></ul><p> </p><p><br> </p>'),
('647244ec-b5b2-4fbf-9c93-6133cb252a40', 'MANAGE_CLIENT', 'Manage Client', '<p>The <strong>Manage Client</strong> feature makes it easy to add new clients or edit existing client details. Here’s how you can use it:</p><h4><strong>Add New Client</strong></h4><p>1.Click the <strong>Add Client</strong> button.</p><p>2.A form will appear where you can enter the following details:</p><p><strong>Company/Person Name</strong>: Enter the name of the company or individual client.</p><p><strong>Contact Person</strong>: Provide the name of the main contact person.</p><p><strong>Email</strong>: Enter the client’s email address.</p><p><strong>Mobile Number</strong>: Add the client’s mobile number for quick contact.</p><p>3.Once all the details are filled in, click the <strong>Save</strong> button to add the new client to the list.</p><p>4.The newly added client will now appear in the <strong>Clients List</strong>.</p><h4><strong>Edit Existing Client</strong></h4><p>1.In the <strong>Clients List</strong>, locate the client whose details you want to edit.</p><p>2.Click the <strong>Edit</strong> button in the <strong>Action</strong> column.</p><p>3.A form will open, pre-filled with the client’s existing details.</p><p>4.Update any necessary fields, such as:</p><p>Correcting the email address or phone number.</p><p>Changing the contact person or company name.</p><p>5.After making the changes, click the <strong>Save</strong> button to update the client’s information.</p><p>6.The changes will reflect immediately in the <strong>Clients List</strong>.</p>'),
('647f1663-df23-45b0-872e-f6da5b609abb', 'LANGUAGES', 'Languages', '<p>The <strong>Multiple Language Support</strong> feature in the document management system enables users to interact with the platform and manage documents in various languages, providing flexibility for global teams or multilingual users.</p><p>Key functionalities include:</p><p>- <strong>Multi-Language Interface</strong>: The system’s interface can be viewed and navigated in multiple languages, ensuring ease of use for users across different regions.<br>&nbsp;<br>- <strong>Add New Languages</strong> Administrators have the ability to easily add support for additional languages, expanding the system\'s accessibility to more users worldwide.<br>&nbsp;<br>- <strong>Update Existing Languages</strong>: Existing language options can be updated to reflect changes in translations, regional language standards, or preferences, ensuring that the system stays relevant and user-friendly in all supported languages.<br>&nbsp;<br>- <strong>Delete Unused Languages</strong>: Administrators can remove language options that are no longer needed, streamlining the user interface and preventing unnecessary clutter.</p><p>This feature ensures the document management system can cater to a diverse, global audience while providing the flexibility to manage language options as needed.</p>'),
('762a5894-0c49-48d8-9e0c-e5062a4c3322', 'SEND_EMAIL', 'Send mail', '<ul><li><strong>How to Send a Document as an Email Attachment:</strong></li><li><strong>Select the email field</strong>: Navigate to the section where you can compose an email and select the field for entering the recipient\'s email address.</li><li><strong>Enter the email address</strong>: Type the recipient\'s email address in the provided field.</li><li><strong>Subject field</strong>: Enter a relevant subject for your email.</li><li><strong>Email content</strong>: Write the body of your email, providing any necessary context or information.</li><li><strong>Attach the document</strong>: Find the option to \"Attach\" or \"Upload\" a document, then select the file you wish to send.</li><li><strong>Send the email</strong>: After attaching the document and ensuring the recipient, subject, and content are correct, click the \"Send\" button to deliver the email with the attached document.</li></ul>'),
('8c1e5b05-0d7e-45cc-973d-423b2e10c5fd', 'SHARE_DOCUMENT', 'Share Document', '<h4>Overview</h4><p>The <strong>Share Document</strong> feature allows users to assign access permissions to specific documents for individual users or user roles, with the ability to manage these permissions effectively. Users can also remove existing permissions, enhancing collaboration and control over document access.</p><h4>Features</h4><ol><li><strong>Assign By Users and Assign By Roles</strong><ul><li><strong>Buttons:</strong><ul><li>Two separate buttons are available at the Top of the share document section:<ul><li><strong>Assign By Users:</strong> Opens a dialog for selecting individual users to share the document with.</li><li><strong>Assign By Roles:</strong> Opens a dialog for selecting user roles to share the document with.</li></ul></li></ul></li><li><strong>User/Roles List:</strong><ul><li>Below the buttons, a list displays users or roles who currently have document permissions, including details such as:</li><li>Delete Button( Allow to delete existing permission to user or role)<ul><li>User/Role Name</li><li>Type (User/Role)</li><li>Allow Download(if applicable)</li><li>Email(if applicable)</li><li>Start Date (if applicable)</li><li>End Date (if applicable)</li><li> </li><li><strong>Delete Button:</strong> A delete button next to each user/role in the list, allowing for easy removal of permissions.</li></ul></li></ul></li></ul></li><li><strong>Dialog for Selection</strong><ul><li><strong>Dialog Features:</strong><ul><li>Upon clicking either <strong>Assign By Users</strong> or <strong>Assign By Roles</strong>, a dialog opens with the following features:<ul><li><strong>User/Role Selection:</strong><ul><li>A multi-select dropdown list allows users to select multiple users or roles for sharing the document.</li></ul></li><li><strong>Additional Options:</strong><ul><li><strong>Share Duration:</strong> Users can specify a time period for which the document will be accessible (e.g., start date and end date). </li><li><strong>Allow Download:</strong> A checkbox option that allows users to enable or disable downloading of the document.</li><li><strong>Allow Email Notification:</strong>A checkbox option that, when checked, sends an email notification to the selected users/roles.<ul><li>If this option is selected, SMTP configuration must be set up in the application. If SMTP is not configured, an error message will display informing the user of the missing configuration.</li></ul></li></ul></li></ul></li></ul></li></ul></li><li><strong>Saving Shared Document Permissions</strong><ul><li><strong>Save Button:</strong><ul><li>A <strong>Save</strong> button within the dialog allows users to save the selected permissions.</li></ul></li><li><strong>Reflection of Changes:</strong><ul><li>Upon saving, the data is updated, and the list at the bottom of the main interface reflects the newly shared document permissions, showing:<ul><li>User/Role Name</li><li>Type (User/Role)</li><li>Allow Download(if applicable)</li><li>Email(if applicable)</li><li>Start Date (if applicable)</li><li>End Date (if applicable)</li><li>Whether download and email notification options are enabled</li></ul></li></ul></li></ul></li><li><strong>Removing Shared Permissions</strong><ul><li><strong>Delete Button Functionality:</strong><ul><li>Users can click the <strong>Delete</strong> button next to any user or role in the existing shared permissions list.</li><li><strong>Confirmation Dialog:</strong> A confirmation prompt appears to ensure that users intend to remove the selected permission. Users must confirm the action to proceed.</li></ul></li><li><strong>Updating the List:</strong><ul><li>Once confirmed, the shared permission for the selected user or role is removed from the list, and the list updates immediately to reflect this change.</li></ul></li></ul></li><li><strong>User Interaction Flow</strong><ul><li><strong>Navigating to Share Document:</strong><ul><li>Users access the <strong>Share Document</strong> section within the application.</li></ul></li><li><strong>Assigning Permissions:</strong><ul><li>Users click on <strong>Assign By Users</strong> or <strong>Assign By Roles</strong> to open the respective dialog.</li><li>They select the appropriate users or roles, configure additional options, and click <strong>Save</strong>.</li></ul></li><li><strong>Removing Permissions:</strong><ul><li>Users can remove permissions by clicking the <strong>Delete</strong> button next to an entry in the shared permissions list and confirming the action.</li></ul></li><li><strong>Reviewing Shared Permissions:</strong><ul><li>The updated list displays the current permissions, allowing users to verify and manage document sharing effectively.</li></ul></li></ul></li></ol><h3>Summary</h3><p>The <strong>Share Document</strong> functionality provides a structured interface for assigning and managing document permissions to individual users or roles, with added flexibility to remove existing permissions. This feature enhances document collaboration and control while ensuring users can efficiently manage access. The inclusion of SMTP configuration checks for email notifications adds robustness to the communication aspect of the document-sharing process.</p>'),
('a1c28412-9590-4cdb-b7a0-1687e890ad5d', 'ADD_REMINDER', 'Add reminder', '<p><strong>The \"Add Reminder\" functionality in the \"Manage Reminders\" section allows users to create reminders or notifications related to specific events or tasks. These reminders can be customized according to the user \'s needs and can be sent to specific other users.</strong></p><p><strong>Components and Features:</strong></p><ul><li><strong>Subject:</strong> This field allows the user to enter a title or theme for the reminder. This will be the main subject of the notification.</li><li><strong>Message:</strong> Here, users can add additional details or information related to the reminder. This can be a descriptive message or specific instructions.</li><li><strong>Repeat Reminder:</strong> This option allows setting the frequency with which the reminder will be repeated, such as daily, weekly, or monthly.</li><li><strong>Send Email:</strong> If this option is enabled, the reminder will also be sent as an email to the selected users.</li><li><strong>Select Users:</strong> This field allows the selection of users to whom the reminder will be sent. Users can be selected individually or in groups.</li><li><strong>Reminder Date:</strong> This is the time at which the reminder will be activated and sent to the selected users.</li></ul><p><strong>How to Add a New Reminder:</strong></p><ul><li>; to the \"Manage Reminders\" section.</li><li>Click the \"Add Reminder\" button.</li><li>Fill in all required fields with the desired information.</li><li>After entering all the details, click \"Save\" or \"Confirm\" to add the reminder to the system.</li></ul>'),
('a3664127-34f1-494c-84c5-fc3f307a9d11', 'USER_PAGE_PERMISSION_TO', 'User Page Permission To', '<ul><li>Enable the ability to assign specific permissions to users that are not tied to their assigned roles. This gives admins the flexibility to grant access to particular features for individual users.</li><li>Click <strong>\"Save\"</strong> or <strong>\"Add\"</strong> to assign the user to the system with the specified permissions.</li></ul>'),
('ab28cf5c-0d89-4a52-a87b-359106897cba', 'MANAGE_EMAIL_SMTP_SETTING', 'Manage Email SMTP Setting', '<p>The <strong>\"Email SMTP Settings\"</strong> page within CMR DMS allows administrators to configure and manage the SMTP settings for sending emails. This ensures that emails sent from the system are correctly and efficiently delivered to recipients.</p><p><strong>Key Components:</strong></p><ul><li><p><strong>SMTP Settings Table:</strong> Displays all configured SMTP settings in a tabular format.</p><p>Each entry in the table includes details such as the username, host, port, and whether that configuration is set as the default.</p></li><li><p><strong>\"Add Settings\" Button:</strong> Allows administrators to add a new SMTP configuration.</p><p>Clicking the button opens a form where details like username, host, port, and the option to set it as the default configuration can be entered.</p></li></ul><p><strong>\"Add Settings\" Form:</strong></p><p>This form opens when administrators click the \"Add Settings\" button and includes the following fields:</p><ul><li><strong>Username:</strong> The username required for authentication on the SMTP server.</li><li><strong>Host:</strong> The SMTP server address.</li><li><strong>Port:</strong> The port on which the SMTP server listens.</li><li><strong>Is Default:</strong> A checkbox that allows setting this configuration as the default for sending emails.</li></ul><p><strong>How to Add a New SMTP Configuration:</strong></p><ol><li>Click the \"Add Settings\" button.</li><li>The \"Add Settings\" form will open, where you can enter the SMTP configuration details.</li><li>Fill in the necessary fields and select the desired options.</li><li>After completing the details, click \"Save\" or \"Add\" to add the configuration to the system.</li></ol>');
INSERT INTO `pageHelper` (`id`, `code`, `name`, `description`) VALUES
('b1c70caf-ce26-4dff-8f8a-aed4c8eab097', 'PAGE_HELPERS', 'Page Helpers', '<p>Users can manage the pages within the application using a user-friendly interface that displays a list of available pages. Each entry in the list includes options to <strong>Edit</strong> or <strong>View</strong> the corresponding page\'s details.</p><h4>Features</h4><ol><li><h4><strong>List of Pages</strong></h4><ul><li>Users can see a comprehensive list of all pages in the application, each with the following details:<ul><li><strong>Unique Code:</strong> A non-editable code for each page.</li><li><strong>Editable Name:</strong> An editable field that allows users to change the page name.</li><li><strong>Page Info Content:</strong> A section that displays the functionality description of each page.</li><li> </li></ul></li></ul></li><li><h4><strong>Edit Feature</strong></h4><ul><li><strong>Edit Button:</strong><ul><li>When a user clicks the <strong>Edit</strong> button next to a page, they are directed to an editable form.</li><li>Users can modify the page name and update the page info content to reflect any changes or improvements.</li><li><strong>Validation:</strong><ul><li>The form includes validation checks to ensure that the new name is unique and meets any defined requirements (e.g., length, special characters).</li></ul></li><li><strong>Save Changes:</strong><ul><li>Users can save the changes, which are then reflected in the list of pages and will persist across sessions.</li><li> </li></ul></li></ul></li></ul></li><li><h4><strong>View Feature</strong></h4><ul><li><strong>View Button:</strong><ul><li>Clicking the <strong>View</strong> button opens a dialog box displaying a preview of the page info content.</li><li>This preview includes  current page name, and detailed functionality description.</li><li><strong>Modal Dialog:</strong><ul><li>The dialog box is modal, meaning users cannot interact with the rest of the application until they close the dialog.</li><li>Users can close the dialog by clicking an \"X\" button or a \"Close\" button.</li></ul></li></ul></li></ul></li><li> <ul><li><h4><strong>Navigating to the Page List:</strong></h4><ul><li>Users can easily navigate to the page list through the main navigation menu.</li></ul></li><li><strong>Editing a Page:</strong><ul><li>Users select the <strong>Edit</strong> button next to the desired page, modify the name and content, and click <strong>Save</strong> to apply the changes.</li></ul></li><li><strong>Viewing a Page:</strong><ul><li>Users can click the <strong>View</strong> button to open the dialog box, review the details, and close the dialog when finished.</li></ul></li></ul></li></ol><h3>Summary</h3><p>This functionality empowers users to effectively manage page names and content within the application, ensuring that information is accurate and up-to-date. The combination of edit and view features enhances the user experience by allowing for quick modifications and easy access to page details.</p>'),
('b99e45c1-9d9f-4b0e-80f0-906c7c830394', 'STORAGE_SETTINGS', 'Storage Settings', '<p><strong>Document Storage Settings</strong>:<br>Users can configure various storage options, including AWS S3 with specific fields required for each storage type. Additionally, there is a default option available for storing files on a local server. This local server setting cannot be deleted, ensuring a reliable and consistent storage option for users.</p><ol><li><strong>Enable Encryption</strong>: When selected, this option ensures that files are stored in encrypted form within the chosen storage.</li><li><strong>Set as Default</strong>: If this option is set to \"true,\" the storage becomes the default selection in the dropdown on the document add page.</li></ol><p>Upon saving the storage settings, the system attempts to upload a dummy file to verify the configuration. If the upload is successful, the settings are saved; otherwise, an error message prompts the user to adjust the field values.</p><ul><li><h4><strong>Add a new Storage Setting to the system.</strong></h4></li><li><strong>It includes the following fields:</strong></li><li><strong>Storage Type: </strong>AWS</li><li><strong>Access Key:</strong></li><li><strong>Secret Key:</strong></li><li><strong>Bucket Name:</strong></li><li><strong>Enable Encryption: </strong>When selected, this option ensures that files are stored in encrypted form within the chosen storage.</li><li><strong>Is Default:</strong> &nbsp;If this option is set to \"true,\" the storage becomes the default selection in the dropdown on the document add page.</li><li>&nbsp;</li><li><h4><strong>Edit Storage Setting to the system.</strong></h4></li><li>Users can edit existing storage settings from the storage settings list, which includes an edit button on the left side of each row. When the edit button is clicked, the row opens in edit mode, allowing users to modify the following fields: name, \"Is Default,\" and \"Enable Encryption.\" This provides users with the flexibility to update their storage configurations as needed.</li></ul><h4>CREATE AWS S3 ACCOUNT:</h4><p><a href=\"https://aws.amazon.com/free/?gclid=CjwKCAjwx4O4BhAnEiwA42SbVPBXf7hpN07vHx4ObiZX3xFHpgCLP9mHQ4P1CaykaQkJKT53F2EQFhoCWRkQAvD_BwE&amp;trk=b8b87cd7-09b8-4229-a529-91943319b8f5&amp;sc_channel=ps&amp;ef_id=CjwKCAjwx4O4BhAnEiwA42SbVPBXf7hpN07vHx4ObiZX3xFHpgCLP9mHQ4P1CaykaQkJKT53F2EQFhoCWRkQAvD_BwE:G:s&amp;s_kwcid=AL!4422!3!536324516040!e!!g!!aws%20s3%20account!11539706604!115473954714&amp;all-free-tier.sort-by=item.additionalFields.SortRank&amp;all-free-tier.sort-order=asc&amp;awsf.Free%20Tier%20Types=*all&amp;awsf.Free%20Tier%20Categories=*all\">https://aws.amazon.com/free/?gclid=CjwKCAjwx4O4BhAnEiwA42SbVPBXf7hpN07vHx4ObiZX3xFHpgCLP9mHQ4P1CaykaQkJKT53F2EQFhoCWRkQAvD_BwE&amp;trk=b8b87cd7-09b8-4229-a529-91943319b8f5&amp;sc_channel=ps&amp;ef_id=CjwKCAjwx4O4BhAnEiwA42SbVPBXf7hpN07vHx4ObiZX3xFHpgCLP9mHQ4P1CaykaQkJKT53F2EQFhoCWRkQAvD_BwE:G:s&amp;s_kwcid=AL!4422!3!536324516040!e!!g!!aws%20s3%20account!11539706604!115473954714&amp;all-free-tier.sort-by=item.additionalFields.SortRank&amp;all-free-tier.sort-order=asc&amp;awsf.Free%20Tier%20Types=*all&amp;awsf.Free%20Tier%20Categories=*all</a></p>'),
('d0e88580-71d2-4d74-b1ac-b9f34aec6818', 'DOCUMENT_CATEGORIES', 'Document Categories', '<p><strong>The \"Document Categories\" page serves as a centralized hub for managing and organizing Categories, which essentially represent the departments that work with the files. It offers a hierarchical structure, allowing the creation of main Categories and subCategories.</strong></p><h4><strong>Main Components:</strong></h4><p><strong>\"Add New Document Category\" Button:</strong></p><ul><li>Allows administrators or users with appropriate permissions to create a new Category or department.</li><li>Opens a form or a pop-up window where details like the Category name and description can be entered.</li></ul><p><strong>List of Existing Categories:</strong></p><ul><li>Displays all the Categories or departments created within the system.</li><li>Each entry includes the Category name and associated action options.</li></ul><p><strong>Action Menu for Each Category:</strong></p><ul><li>Next to each Category, users will find action options that allow them to manage the Category:<ul><li><strong>Edit:</strong> Enables modification of the Category\'s details, such as the name or description.</li><li><strong>Delete:</strong> Removes the Category from the system. This action may require confirmation to prevent accidental deletions.</li></ul></li></ul><p><strong>Double Arrow Button \">>\":</strong></p><ul><li>Located next to each main Category.</li><li>When clicked, it reveals the subCategories associated with the main Category.</li><li>Allows users to view and manage subCategories in a hierarchical manner.</li></ul><h4><strong>How to Add a New Category:</strong></h4><ol><li>Click on the \"Add New Document Category\" button.</li><li>A form or pop-up window will open.</li><li>Enter the Category name and description.</li><li>Click \"Save\" or \"Add\" to add the Category to the system.</li></ol><h4><strong>How to View SubCategories:</strong></h4><ol><li>Locate the main Category in the list.</li><li>Click on the double arrow button \">>\" next to the Category name.</li><li>The associated subCategories will be displayed beneath the main Category.</li></ol>'),
('d1ee0a7e-7962-46f5-a784-8be66fb58b51', 'AI_DOCUMENTS', 'AI Document Lists', '<h3>Overview</h3><p>This section allows you to view documents generated using OpenAI\'s AI. For each document, you can explore the original prompt that was used to generate the content, along with the full AI-generated output. This helps you understand how prompts shape responses and lets you track your creative or work process.</p><h3>? How to Use</h3><h4>1. <strong>Accessing the Document List</strong></h4><ul><li>Navigate to the <strong>Generated Documents</strong> section from the main menu.</li><li>You’ll see a list of all documents generated by AI, including titles and creation dates.</li></ul><h4>2. <strong>Viewing a Document</strong></h4><ul><li>Click on any document in the list to open it.</li><li>You’ll see:<ul><li><strong>Prompt</strong> – The exact input (question or instruction) used to generate the document.</li><li><strong>Output</strong> – The AI-generated text based on the prompt.</li></ul></li></ul><h4>3. <strong>Understanding the Prompt-Output Pair</strong></h4><ul><li>Use this feature to:<ul><li>Learn how different prompts lead to different styles or content.</li><li>Refine your own prompt-writing skills.</li><li>Review previous outputs for reuse or inspiration.</li></ul></li></ul>'),
('d2abfc80-7dfb-49b6-bccf-44d75844f098', 'MANAGE_FILE_REQUEST', 'Manage File Request', '<h2>File Request Functionality</h2><p>The <strong>File Request</strong> feature simplifies document collection by allowing you to generate unique links, share them with users, and review uploaded documents. Here\'s how it works:</p><h2>Key Features:</h2><p><strong>1.Generate Link</strong>:</p><ul><li>Create a unique link for a file request.</li><li>Share this link with users to allow them to upload the required documents.</li></ul><p><strong>2.Upload Documents</strong>:</p><p>Users can upload documents directly via the link you provide.</p><p>You can set the following parameters when creating a request:</p><p><strong>Maximum File Size Upload</strong>: Specify the largest file size allowed per upload.</p><p><strong>Maximum Document Upload</strong>: Limit the number of documents a user can upload.</p><ul><li><strong>Allowed File Extensions</strong>: Restrict uploads to specific file types (e.g., PDF, DOCX, JPG).</li></ul><p><strong>3.Review and Manage Requests</strong>:</p><ul><li>View all submissions on the <strong>File Request List</strong> page.</li><li>Approve or reject uploaded documents as necessary.</li></ul><p><strong>4.Request Data List</strong>:<br>Each file request includes the following details:</p><ul><li><strong>Subject</strong>: The purpose or title of the request.</li><li><strong>Email</strong>: The email address associated with the request.</li><li><strong>Maximum File Size Upload</strong>: The size limit for uploaded files.</li><li><strong>Maximum Document Upload</strong>: The number of documents users can upload.</li><li><strong>Allowed File Extensions</strong>: The types of files users can upload.</li><li><strong>Status</strong>: The current status of the request (e.g., Pending, Approved, Rejected).</li><li><strong>Created By</strong>: The user who created the request.</li><li><strong>Created Date</strong>: The date the request was created.</li><li><strong>Link Expiration</strong>: The date the link will no longer be valid.</li></ul><p><strong>5.Manage Requests</strong>:<br>For each file request, you can:</p><ul><li><strong>Edit</strong>: Update the details of the request, such as file size, document limits, or expiration date.</li><li><strong>Delete</strong>: Remove the request entirely.</li><li><strong>Copy Link</strong>: Copy the link to share it with others.</li></ul><h2>How It Works:</h2><h3>1. Creating a File Request:</h3><ul><li>Navigate to the <strong>File Request</strong> page and click Create New Request. </li><li>Enter details like the subject, allowed file extensions, and upload limits.</li><li>Generate the link and share it with the intended user.</li></ul><h3>2. Uploading Documents:</h3><ul><li>The user clicks the link and uploads their documents according to the criteria you set.</li></ul><h3>3. Reviewing Submissions:</h3><ul><li>Go to the <strong>File Request List</strong> page to view submitted documents.</li><li>Approve or reject submissions as required.</li></ul><h3>4. Managing Links:</h3><ul><li>Use the <strong>Edit</strong> or <strong>Delete</strong> options to modify or remove requests.</li><li>Copy the link anytime for reuse or sharing.</li></ul>'),
('d6e392a9-b180-4c68-8566-6f289150a226', 'ADD_DOCUMENT', 'Manage document', '<ul><li><strong>Allows users to upload and add a new document to the system.</strong></li><li>It includes the following fields:</li><li><strong>Upload Document:</strong> An option to upload the document file.</li><li><strong>Category:</strong> The Category under which the document is classified.</li><li><strong>Name:</strong> The name of the document.</li><li><strong>Status:</strong> The status of the document (e.g., confidential or public).</li><li><strong>Description:</strong> A detailed description or additional notes related to the document.</li><li><strong>Meta Tags:</strong> Tags or keywords associated with the document for easier searching.</li></ul>'),
('d8506639-f4ec-42d8-9939-bae893abef57', 'ROLES', 'Roles', '<p><strong>The \"User Roles\" page is essential for managing and defining permissions within the CMR DMS. Roles represent predefined sets of permissions that can be assigned to users, ensuring that each user has access only to the functionalities and documents appropriate to their position and responsibilities within the organization.</strong></p><h3><strong>Main Components:</strong></h3><p><strong>\"Add Roles\" Button:</strong></p><ul><li>Allows administrators or users with appropriate permissions to create a new role in the system.</li><li>Opens a form or pop-up window where the role’s permissions and details can be defined.</li></ul><p><strong>List of Existing Roles:</strong></p><ul><li>Displays all roles created within the system in a tabular format.</li><li>Each entry includes the role name and associated action options.</li></ul><p><strong>Action Menu for Each Role:</strong></p><ul><li>Includes options for \"Edit\" and \"Delete.\"<ul><li><strong>Edit:</strong> Allows modification of the role\'s details and permissions.</li><li><strong>Delete:</strong> Removes the role from the system. This action may require confirmation to prevent accidental deletions.</li></ul></li></ul><p><strong>Role Creation Page:</strong></p><ul><li>Here, administrators can define specific permissions for each role.</li><li>Permissions can include rights such as viewing, editing, deleting, or sharing documents, managing users, defining Categories, and more.</li><li>Once permissions are set, they can be saved to create a new role or update an existing one.</li></ul><h3><strong>How to Add a New Role:</strong></h3><ol><li>Click on the \"Add Roles\" button.</li><li>A form or pop-up window will open.</li><li>Enter the role name and select the appropriate permissions from the available list.</li><li>Click \"Save\" or \"Add\" to add the role to the system with the specified permissions.</li></ol>'),
('d96ee5aa-4253-4a28-ba61-94b15b6cbfae', 'VERSION_HISTORY', 'Document versions', '<p><strong>Uploading a New Version of the Document:</strong></p><p>Allows users to upload an updated or modified version of an existing document.</p><p>It includes the following fields:</p><ul><li><strong>Upload a New Version:</strong> A dedicated section for uploading a new version of the document.</li><li><strong>Restore previous version document to current version : </strong>When a user restores a previous version as the current document, the existing current document is automatically added to the document history. The restored document then becomes the active current document, ensuring effective version control and easy tracking of changes</li><li><strong>Upload Document:</strong> An option to upload the document file. Users can select the file they want to upload, and the text \"No file chosen\" will appear until a file is selected.</li><li><strong>View Document</strong>:<br>This feature provides users with the ability to preview previous versions of a document. Users can easily access and review any earlier version, allowing for better assessment and comparison before deciding to restore or make further edits.</li></ul><p><strong>How to Upload a New Version of the Document:</strong></p><ol><li>Navigate to the \"All Documents\" page.</li><li>Select the document for which you want to upload a new version.</li><li>Click on the \"Upload a New Version\" option or a similar button.</li><li>A dedicated form will open where you can select and upload the appropriate file.</li><li>After uploading the file, click \"Save\" or \"Add\" to update the document in the system with the new version.</li></ol>'),
('dd0c9840-b7c6-4a51-b78a-e674918ff7e5', 'NOTIFICATIONS', 'Notifications', '<ul><li><strong>Document Shared Notification</strong>:<ul><li>Sends real-time notifications to users when a document is shared with them.</li><li>Notifications are sent via email and in-app, with details about the shared document, including name, category, and shared user.</li><li>For documents shared with external users, the recipient is notified with a secure link to access the document.</li></ul></li><li><strong>Reminder Notifications</strong>:<ul><li>Sends reminders to users for upcoming deadlines or actions related to documents (e.g., review deadlines or document expiration).</li><li>Users can configure reminder frequency and set specific reminders for important documents.</li><li>Reminders are delivered via both email and in-app notifications.</li></ul></li></ul><p>&nbsp;</p>'),
('dd217b6b-b332-44ef-bc09-2fb68d9b0d79', 'DOCUMENT_STATUS', 'Document Status', '<h3>Document Status</h3><p>Document status is a feature that allows you to manage the lifecycle of your documents. You can set different statuses for your documents, such as:</p><ul><li>Draft</li><li>Final</li><li>Archived</li></ul><p>This helps you keep track of the current state of each document and ensures that only the right people have access to them.</p>'),
('ec6b2368-b8fd-4101-addf-5dec7c1d1c63', 'SHAREABLE_LINK', 'Shareable Link', '<ul><li><strong>Shareable Link</strong>:<br>This feature allows users to share documents with anonymous users through a customizable link. Users have the flexibility to configure various options when creating a shareable link, including:<ul><li><strong>Start and Expiry Dates</strong>: Specify the validity period for the link, defining when it becomes active and when it expires.</li><li><strong>Password Protection</strong>: Optionally set a password to restrict access to the shared document.</li><li><strong>Download Permission</strong>: Choose whether recipients are allowed to download the document.</li></ul></li></ul><p>All options are optional, allowing users to customize the shareable link according to their preferences and requirements.</p>'),
('eccba93d-48bb-48f6-9784-14968d8843c8', 'MANAGE_USER', 'Manage User', '<p>The User Information page is designed to collect and manage your personal details. This page is essential for setting up your user profile and ensuring you have a seamless experience using our application. Below is a brief overview of the fields you willl encounter:</p><h4><strong>Fields on the User Information Page</strong></h4><ol><li><strong>First Name</strong>:<ul><li><strong>What it is</strong>: Your given name.</li><li><strong>Importance</strong>: Helps us address you properly within the application.</li></ul></li><li><strong>Last Name</strong>:<ul><li><strong>What it is</strong>: Your family name or surname.</li><li><strong>Importance</strong>: Completes your identity and is often required for official documents.</li></ul></li><li><strong>Mobile Number</strong>:<ul><li><strong>What it is</strong>: Your phone number.</li><li><strong>Importance</strong>: Used for account recovery, notifications, and two-factor authentication. It’s optional but recommended for security purposes.</li></ul></li><li><strong>Email Address</strong>:<ul><li><strong>What it is</strong>: Your electronic mail address.</li><li><strong>Importance</strong>: Serves as your primary communication channel with us. It’s required for account verification, notifications, and password recovery.</li></ul></li><li><strong>Password</strong>:<ul><li><strong>What it is</strong>: A secret word or phrase you create to secure your account.</li><li><strong>Importance</strong>: Protects your account from unauthorized access. It must be at least 6 characters long.</li></ul></li><li><strong>Confirm Password</strong>:<ul><li><strong>What it is</strong>: A second entry of your chosen password.</li><li><strong>Importance</strong>: Ensures you’ve entered your password correctly.</li></ul></li><li><strong>Role</strong>:<ul><li><strong>What it is</strong>: Your assigned position or function within the application (e.g., Admin, User, Editor).</li><li><strong>Importance</strong>: Determines your access level and permissions within the application. This field is required to define your responsibilities and capabilities.</li></ul></li></ol><h4><strong>How to Use the Page</strong></h4><ul><li><strong>Filling Out the Form</strong>:<ul><li>Enter your information in the required fields.</li><li>Ensure that your password and confirm password entries match to avoid any errors.</li></ul></li><li><strong>Submitting Your Information</strong>:<ul><li>Once you have filled in all required fields, click the \\\'submit\' button.</li><li>If any required fields are left blank or contain errors, you willl see helpful messages prompting you to correct them.</li></ul></li><li><strong>Visual Feedback</strong>:<ul><li>Fields that require your attention will be highlighted, and error messages will guide you in making the necessary corrections.</li></ul></li></ul>'),
('ee4f69f1-1ed7-4447-87d4-c43a0b0f92e0', 'UPLOAD_NEW_VERSION', 'Upload version file', '<p><strong>How to Upload a New Version of a Document:</strong></p><ol><li>Navigate to the \"All Documents\" page.</li><li>Select the document for which you want to upload a new version.</li><li>Click on the option \"Upload a New Version\" or a similar button.</li><li>A dedicated form will open, allowing you to select and upload the appropriate file.</li><li>After uploading the file, click \"Save\" or \"Add\" to update the document in the system with the new version.</li></ol>'),
('f5cecacd-f0e6-45b3-8de2-348d8ec29556', 'LOGIN_AUDIT_LOGS', 'Audit logs', '<p><strong>The \"Login Audit Logs\" page serves as a centralized record for all authentication activities within CMR DMS. Here, administrators can monitor and review all login attempts, successful or failed, made by users. This provides a clear perspective on system security and user activities.</strong></p><p><strong>Main Components:</strong></p><ul><li><p><strong>Authentication Logs Table:</strong> Displays all login entries in a tabular format.</p><p>Each entry includes details such as the username, login date and time, the IP address from which the login was made, and the result (success/failure).</p></li></ul><p><strong>How to View Log Entries:</strong></p><ol><li>Navigate to the \"Login Audit Logs\" page.</li><li>Browse through the table to view all login entries.</li><li>Use the search or filter function, if available, to find specific entries.</li></ol>'),
('f6a1faa6-7245-4f9f-ad17-5478677bedfb', 'DOCUMENTS_BY_CATEGORY', 'Documents by Category', '<p>The <strong>Homepage</strong> provides an overview of the documents within the system, showcasing statistics related to the number of documents organized by Category. It is the ideal place to quickly obtain a clear view of the volume and distribution of documents in the DMS.</p><h3>Main Components:</h3><ol><li><strong>Document Statistics</strong>:<ul><li>Displays a numerical summary of all the documents in the system, organized by Category.</li><li>Each Category is accompanied by a number indicating how many documents are in that Category.</li></ul></li><li><strong>\"Document Categories\" List</strong>:<ul><li>Shows the different document Categories available in the system, such as:<ul><li>\"Professional-Scientific_and_Education\"</li><li>\"HR Policies 2021\"</li><li>\"Professional1\"</li><li>\"Initial Complaint\"</li><li>\"HR Policies 2020\"</li><li>\"Studies_and_Strategies\"</li><li>\"Administrative_and_Financial\"</li><li>\"Approvals\"</li><li>\"Jurisdiction Commission\"</li></ul></li><li>Next to each Category, the number of documents is displayed, providing a clear view of the document distribution across Categories.</li></ul></li></ol><h3>How to interpret the statistics:</h3><ol><li>Navigate to the <strong>Statistics</strong> section on the <strong>Homepage</strong>.</li><li>View the total number of documents for each Category.<ul><li>These numbers give you an idea of the volume of documents in each Category and help identify which Categories have the most or fewest documents.</li></ul></li></ol>'),
('fa5c186a-ed5d-40b0-858e-34cf03a1866f', 'PROMPT_TEMPLATE', 'AI Prompt Template', '<h2>? How Prompt Templates Work</h2><p>Prompt templates make it easy to create AI-generated content quickly and consistently.</p><h3>? What is a Prompt Template?</h3><p>A prompt template is a ready-to-use sentence with placeholders (like **description**) that you can fill in with your own content. The AI then uses your completed prompt to generate a response.</p><h3>✨ How to Use:</h3><ol><li><p><strong>Choose a Template</strong><br>Select from a list of available prompt templates, such as:</p><blockquote><p>Answer this email content: **description**.</p></blockquote></li><li><p><strong>Fill in the Blank</strong><br>After selecting a template, the system will ask you to enter a value for each placeholder (e.g., description).<br>Example:</p><blockquote><p><i>I’m unable to attend the meeting due to a personal emergency.</i></p></blockquote></li><li><p><strong>Generate the Final Prompt</strong><br>The system will automatically replace the placeholder with your input:</p><blockquote><p>Answer this email content: I’m unable to attend the meeting due to a personal emergency.</p></blockquote></li><li><strong>Get Your Result</strong><br>The AI will process the completed prompt and generate the content for you.</li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `order`, `createdBy`, `modifiedBy`, `deletedBy`, `isDeleted`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('05edb281-cddb-4281-9ab3-fb90d1833c82', 'Archived Documents', 4, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('090ea443-01c7-4638-a194-ad3416a5ea7a', 'Role', 7, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('0c8b0806-f33f-48b3-a326-dcc9cc1a65c7', 'Deep Search', 4, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('2396f81c-f8b5-49ac-88d1-94ed57333f49', 'Document Audit Trail', 5, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('2e3c07a4-fcac-4303-ae47-0d0f796403c9', 'Email', 8, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('324bdc51-d71f-4f80-9f28-a30e8aae4009', 'User', 6, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('34328287-3a37-4c70-ac61-b291c3ef5ade', 'CLIENT', 10, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('42e44f15-8e33-423a-ad7f-17edc23d6dd3', 'Dashboard', 1, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('55e8aeb6-8a97-40f7-acf2-9a028f615ddb', 'FILE_REQUEST', 8, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('5a5f7cf8-21a6-434a-9330-db91b17d867c', 'Document Category', 4, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('637f010e-3397-41a9-903a-21d54db5e49a', 'AI_DOCUMENTS', 3, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('8384e302-eaf1-4a0b-b293-a921b1e9e36a', 'BULK_DOCUMENT_UPLOADS', 4, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('8740dd7a-7bca-442f-b50f-6cdf0fcaf7bd', 'DOCUMENT_STATUS', 10, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('8fbb83d6-9fde-4970-ac80-8e235cab1ff2', 'Settings', 9, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', 'Reminder', 9, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('cfa38ae7-b5ba-4881-9199-d2914d7fd58e', 'Page Helper', 14, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('eddf9e8e-0c70-4cde-b5f9-117a879747d6', 'All Documents', 2, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('f042bbee-d15f-40fb-b79a-8368f2c2e287', 'Login Audit', 10, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('fc97dc8f-b4da-46b1-a179-ab206d8b7efd', 'Assigned Documents', 3, 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quarterlyReminders`
--

CREATE TABLE `quarterlyReminders` (
  `id` char(36) NOT NULL,
  `reminderId` char(36) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `quarter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminderNotifications`
--

CREATE TABLE `reminderNotifications` (
  `id` char(36) NOT NULL,
  `reminderId` char(36) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fetchDateTime` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isEmailNotification` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `dayOfWeek` int(11) DEFAULT NULL,
  `isRepeated` tinyint(1) NOT NULL,
  `isEmailNotification` tinyint(1) NOT NULL,
  `documentId` char(36) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminderSchedulers`
--

CREATE TABLE `reminderSchedulers` (
  `id` char(36) NOT NULL,
  `duration` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `documentId` char(36) DEFAULT NULL,
  `userId` char(36) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  `isEmailNotification` tinyint(1) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminderUsers`
--

CREATE TABLE `reminderUsers` (
  `id` char(36) NOT NULL,
  `reminderId` char(36) NOT NULL,
  `userId` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roleClaims`
--

CREATE TABLE `roleClaims` (
  `id` char(36) NOT NULL,
  `actionId` char(36) NOT NULL,
  `roleId` char(36) NOT NULL,
  `claimType` varchar(255) DEFAULT NULL,
  `claimValue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roleClaims`
--

INSERT INTO `roleClaims` (`id`, `actionId`, `roleId`, `claimType`, `claimValue`) VALUES
('05223189-22c8-4aff-9b33-a7a39f8e7018', 'a8dd972d-e758-4571-8d39-c6fec74b361b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_EDIT_DOCUMENT', NULL),
('11ff9932-9827-46a0-96ad-f59384f12571', 'ac6d6fbc-6348-4149-9c0c-154ab79d1166', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_SHARE_DOCUMENT', NULL),
('121f4871-c19a-4e59-aff4-eb0aa8ce3502', 'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'LOGIN_AUDIT_VIEW_LOGIN_AUDIT_LOGS', NULL),
('13b32650-707e-483b-bac4-e51f76fb6cf9', '8d7e1668-ab2d-4aa5-b8d1-0358906d6995', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_VIEW_DETAIL', NULL),
('156a79de-5420-4cbe-bad7-692b09706095', 'e9ff854b-23f7-46c2-9029-efba3d8587b5', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_MANAGE_SHARABLE_LINK', NULL),
('1d18d4c8-9b43-4b06-a1b4-78e9188f7835', '0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_EDIT_USER', NULL),
('1faf1a62-7872-42ca-8fd3-7d4b7bc34f8e', '374d74aa-a580-4928-848d-f7553db39914', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_DELETE_USER', NULL),
('23ce0787-470f-4b1b-821d-77dac3915210', '4071ed2e-56fb-4c5a-887d-8a175cac8d71', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ARCHIVE_DOCUMENT_RESTORE_DOCUMENT', NULL),
('24409833-2135-4b3b-9fc2-19d71f700b93', 'c18e4105-e9d7-4c5d-b396-a2854bcb8e21', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_VIEW_VERSION_HISTORY', NULL),
('2e01a378-44f6-44f2-b7b0-3f8b3c9aed43', '92596605-e49a-4ab6-8a39-60116eba8abe', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_DELETE_DOCUMENT', NULL),
('2e307109-31f6-40ff-ae8c-ebcfe1d19aa1', '229ad778-c7d3-4f5f-ab52-24b537c39514', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_DELETE_DOCUMENT', NULL),
('2fea8e4f-47d9-4a1b-a368-4c475754204d', 'c04a1094-f289-4de7-b788-9f21ee3fe32a', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_SEND_EMAIL', NULL),
('31a80488-800f-4ebd-8ef2-8cc875657b91', 'e3fcd910-3f9b-4035-9bbb-312c5b599d52', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'GENERATE_AI_DOCUMENTS', NULL),
('33b51314-05b0-458e-87e4-dcf478027114', 'a737284a-e43b-481d-9fdd-07e1680ffe11', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_EDIT_DOCUMENT', NULL),
('393949c7-3dce-492d-9f2e-120e97a5e305', '44ecbcaf-6d4a-4fc2-911c-e96be65bffb2', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_MANAGE_COMMENT', NULL),
('3a944c98-c747-4254-8d97-22cf7d6cf19b', '1d768490-d67d-40b6-b610-22b17cc7ce2d', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DEEP_SEARCH_ADD_INDEXING', NULL),
('3bf04296-c404-401c-bd17-580a52a57a8b', '63355376-2650-4949-9580-fc8c888353f0', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'SETTINGS_MANAGE_OPEN_AI_API_KEY', NULL),
('3d573f52-30eb-47a2-9eab-e5d6524562d9', '7ba630ca-a9d3-42ee-99c8-766e2231fec1', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DASHBOARD_VIEW_DASHBOARD', NULL),
('3f98a389-3d7b-4ab2-b103-8c06f969425b', 'b4d722d6-755c-4be4-8f0d-2283c9394e18', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_APPROVE_FILE_REQUEST', NULL),
('42884365-17ff-403e-ab89-0b0262300cfa', 'e506ec48-b99a-45b4-9ec9-6451bc67477b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_ASSIGN_PERMISSION', NULL),
('448ee05b-545e-4d00-98ba-f7b8f6797591', '5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'REMINDER_DELETE_REMINDER', NULL),
('483d4f91-bcf1-4c93-b54e-f2143af76b6f', '239035d5-cd44-475f-bbc5-9ef51768d389', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_CREATE_DOCUMENT', NULL),
('49dce991-0209-459e-811f-90d437cdc3c8', '31cb6438-7d4a-4385-8a34-b4e8f6096a48', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_VIEW_USERS', NULL),
('4de4ad88-a21c-44cd-81c0-5ebfdb52c87f', '3ccaf408-8864-4815-a3e0-50632d90bcb6', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'REMINDER_EDIT_REMINDER', NULL),
('55cc0dc8-5d91-4b12-a249-a77537039e36', 'cd46a3a4-ede5-4941-a49b-3df7eaa46428', 'ff635a8f-4bb3-4d70-a3ed-c7749030696c', 'DOCUMENT_CATEGORY_MANAGE_DOCUMENT_CATEGORY', NULL),
('55de9eef-cb67-4f95-abe4-f31530ed8a3d', '4f0e8a83-8a01-415e-88f5-c204369290de', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DEEP_SEARCH_DEEP_SEARCH', NULL),
('57d7b28e-7278-4a92-bf52-19d0505f8b09', '2ea6ba08-eb36-4e34-92d9-f1984c908b31', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_SHARE_DOCUMENT', NULL),
('5c2d3372-e965-4d1f-92af-880d084109cf', '260d1089-46c7-4f53-83e6-f80b9b3fb823', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_ARCHIVE_DOCUMENT', NULL),
('5c2f309d-9686-46b9-b40e-92a4642d9273', 'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ROLE_CREATE_ROLE', NULL),
('5df819c3-afe7-4de9-8dd7-3f36d98e8a0f', 'fa91ffd9-61ee-4bb1-bf86-6a593cdc7be9', 'ff635a8f-4bb3-4d70-a3ed-c7749030696c', 'ASSIGNED_DOCUMENTS_CREATE_DOCUMENT', NULL),
('5ff9e74c-3f4a-4c40-a281-1b6451e6f395', 'fa5b07a4-e8c4-40e2-b5cf-f1a562087783', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'VIEW_AI_GENERATED_DOCUMENTS', NULL),
('5ffa2a35-91bc-4cc7-8612-e44aaa3acc4d', 'cd46a3a4-ede5-4941-a49b-3df7eaa46428', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DOCUMENT_CATEGORY_MANAGE_DOCUMENT_CATEGORY', NULL),
('607a9fc9-c521-41ea-b2cd-8cdad35e4145', 'bc515aea-ef66-4d8d-9cdb-47477cb74145', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'MANAGE_AI_PROMPT_TEMPLATES', NULL),
('624cd968-0d0f-421c-852e-5dd31faa890e', '1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DOCUMENT_AUDIT_TRAIL_VIEW_DOCUMENT_AUDIT_TRAIL', NULL),
('638707fd-6d91-4c6b-85cb-01a2cd60f6ca', 'e017d419-8080-4b2d-ac89-4e966182a12f', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'MANAGE_DOCUMENT_STATUS', NULL),
('6bcd3d5f-25e7-42fe-9c1e-f2a1fdae990c', 'cb988c3a-7487-4366-9521-c0c5adf9b5a6', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'BULK_DOCUMENT_UPLOAD', NULL),
('6dac1d39-8ca9-4236-83c1-ff5c69cfc8c7', '7ba630ca-a9d3-42ee-99c8-766e2231fec1', 'ff635a8f-4bb3-4d70-a3ed-c7749030696c', 'DASHBOARD_VIEW_DASHBOARD', NULL),
('71d964bf-cf90-4ddc-b423-67e913df788d', '165505b2-ad31-42c7-aafe-f66f291cb5a9', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_MANAGE_COMMENT', NULL),
('7fd0c033-30dd-4663-a602-252be1e81979', 'f9ec1096-b798-4623-bbf8-4f5d4fe775e9', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_MANAGE_SHARABLE_LINK', NULL),
('826a1230-7464-4e10-8429-7152ab35db6d', 'c6e2e9f8-1ee4-4c1d-abd1-721ff604c8b8', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_ADD_REMINDER', NULL),
('85bddeab-ed68-48de-99ae-a4e7082f54f7', 'c288b5d3-419d-4dc0-9e5a-083194016d2c', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ROLE_EDIT_ROLE', NULL),
('8db53e38-d21b-4524-bd63-b881cee798d1', 'd9067d75-e3b9-4d2d-8f82-567ad5f2b9ca', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ARCHIVE_DOCUMENT_VIEW_DOCUMENTS', NULL),
('918b9ab7-a454-4362-ad9d-0ade4f71bd79', '18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ROLE_DELETE_ROLE', NULL),
('97dd34b3-8230-463c-9fc6-14cb8e49a354', '4cce3cb4-5179-4fc7-b59c-7b15afc747f7', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'CLIENTS_MANAGE_CLIENTS', NULL),
('9c4ee577-eb0e-42e6-bfd7-a58f8daed254', '86ce1382-a2b1-48ed-ae81-c9908d00cf3b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_CREATE_USER', NULL),
('9cc1f903-b8da-4e29-b0ca-aa9e20c20893', 'f4d8a768-151d-4ec9-a8e3-41216afe0ec0', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ARCHIVE_DOCUMENT_DELETE_DOCUMENTS', NULL),
('9cea09dd-ab25-4f5b-b252-334dce71d919', '26e383c9-7f7f-4ed0-b78d-a2941f5b4fe7', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_ADD_REMINDER', NULL),
('9d3883dd-7da6-4f7d-bc18-42aa9590b0be', '6719a065-8a4a-4350-8582-bfc41ce283fb', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_DOWNLOAD_DOCUMENT', NULL),
('9d9e0251-8420-4074-9dbe-1a463ec9cd15', '61de0ba3-f41f-4ca8-9af6-ec8dc456c16b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_CREATE_FILE_REQUEST', NULL),
('a0ed8b25-4c6d-42b4-a52f-e22e7d10f5a2', 'a57b1ad5-8fbc-429b-b776-fbb468e5c6a4', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'SETTING_MANAGE_PROFILE', NULL),
('a680d6f5-e0fd-4f09-8e67-0227b0cc5240', '07ad64e9-9a43-40d0-a205-2adb81e238b1', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'SETTINGS_STORAGE_SETTINGS', NULL),
('aca701f6-3d6b-4cd5-bf2d-3df890f09894', '229150ef-9007-4c62-9276-13dd18294370', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_RESTORE_VERSION', NULL),
('aef591e7-4923-46ad-9fb2-4a2a2b44cbbe', 'b36cf0a4-ad53-4938-aac5-fb7fbfc2cfcf', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_RESTORE_VERSION', NULL),
('b23d5678-3514-4bc7-8766-42bf7d290114', '18d07817-4b47-4c84-b21f-abe05da5e1ba', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_ARCHIVE_DOCUMENT', NULL),
('baf0f25a-becd-4e0c-b6d3-22b0603657eb', '595a769d-f7ef-45f3-9f9e-60c58c5e1542', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_SEND_EMAIL', NULL),
('bbaa466c-ef95-448b-a601-08413f0bb388', '6bc0458e-22f5-4975-b387-4d6a4fb35201', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'REMINDER_CREATE_REMINDER', NULL),
('c2edbb06-19a6-4280-aba7-f679d13e370c', '37db8a21-e552-466d-bcf4-f90f5e4e1008', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_VIEW_DETAIL', NULL),
('c63b7c06-3923-4654-812a-8f417ef44fa6', 'fa91ffd9-61ee-4bb1-bf86-6a593cdc7be9', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_CREATE_DOCUMENT', NULL),
('cc174428-2561-4240-8b37-d1816fc3562c', '1ae728c8-58df-4e9f-b284-132dc3c8ff89', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_REJECT_FILE_REQUEST', NULL),
('d4b05df5-d651-4a14-b29d-959104d6233e', '57216dcd-1a1c-4f94-a33d-83a5af2d7a46', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ROLE_VIEW_ROLES', NULL),
('d745413b-656f-4d5c-9f31-d1ee4fbfcdc3', '6f2717fc-edef-4537-916d-2d527251a5c1', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'REMINDER_VIEW_REMINDERS', NULL),
('d92ceb70-046e-40d7-a90c-94c1aacdf8f1', '2e71e9d6-2302-44d8-b0f6-747b98d89125', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_UPDATE_FILE_REQUEST', NULL),
('da70726e-4f16-43f5-ba25-47b4a40cfd72', 'b0f2a1c4-3d8e-4b5c-9f6d-7a0e5f3b8c1d', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DELETE_AI_GENERATED_DOCUMENTS', NULL),
('de20ecf0-cb44-41f5-a8e1-2659f9f6d8f6', 'd4d724fc-fd38-49c4-85bc-73937b219e20', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_RESET_PASSWORD', NULL),
('debe4098-071c-40a5-98ce-b5ad9052c0f9', 'a5b485ac-8c7b-4a4f-a62d-6f839d77e91f', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_VIEW_VERSION_HISTORY', NULL),
('e4c642a4-3299-47bd-bdb0-049ed38ad02a', '391c1739-1045-4dd4-9705-4a960479f0a0', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ASSIGNED_DOCUMENTS_UPLOAD_NEW_VERSION', NULL),
('e69a882d-9a29-44fd-95bd-61c49c70db59', 'dba2e7bf-6bac-4620-a9e6-d4eaa2c8480f', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'PAGE_HELPER_MANAGE_PAGE_HELPER', NULL),
('eb3d1451-71ec-441a-99a0-37c7ee4ed26c', 'fbe77c07-3058-4dbe-9d56-8c75dc879460', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'USER_ASSIGN_USER_ROLE', NULL),
('eb3ed849-7f1e-4f9f-85c1-78a59063d708', '8e3fbe21-0225-44e2-a537-bb50ddffb95c', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'SETTINGS_MANAGE_ALLOW_FILE_EXTENSIONS', NULL),
('f0458367-e0a6-4f87-86dc-be6e84686608', '0478e8b6-7d52-4c26-99e1-657a1c703e8b', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_DELETE_FILE_REQUEST', NULL),
('f0bb5ee6-94f5-4e91-b529-6e8177a49e7f', '7562978b-155a-4fb1-bc3f-6153f62ed565', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'FILE_REQUEST_VIEW_FILE_REQUEST', NULL),
('f2b9aa0d-c457-4c2a-8775-5963fca78c6b', '72ca5c91-b415-4997-a234-b4d71ba03253', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'SETTING_MANAGE_LANGUAGE', NULL),
('f58b0553-57c4-4e74-9ea8-8be83aeae38d', '3da78b4d-d263-4b13-8e81-7aa164a3688c', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_ADD_REMINDER', NULL),
('f610f976-7a3c-4746-b6e7-b5da88b5bc1b', '63ed1277-1db5-4cf7-8404-3e3426cb4bc5', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_VIEW_DOCUMENTS', NULL),
('fa37f480-b50a-4925-995c-0215f9b32245', '57f0b2ef-eeba-44a6-bd88-458003f013ef', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'ALL_DOCUMENTS_UPLOAD_NEW_VERSION', NULL),
('fbe3a50e-61c6-4480-9fe2-006900a2d55a', '41f65d07-9023-4cfb-9c7c-0e3247a012e0', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'EMAIL_MANAGE_SMTP_SETTINGS', NULL),
('fd6af932-6b6f-4446-b18e-e41acb2c92d5', '9a086704-b7c2-4dff-9088-dde29ad259ef', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 'DEEP_SEARCH_REMOVE_INDEXING', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `isDeleted`, `name`, `createdBy`, `modifiedBy`, `deletedBy`, `createdDate`, `modifiedDate`, `deleted_at`) VALUES
('f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 0, 'Super Admin', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL),
('ff635a8f-4bb3-4d70-a3ed-c7749030696c', 0, 'Employee', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, '2025-06-03 04:25:16', '2025-06-03 04:25:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sendEmails`
--

CREATE TABLE `sendEmails` (
  `id` char(36) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `fromEmail` varchar(255) DEFAULT NULL,
  `documentId` char(36) DEFAULT NULL,
  `isSend` tinyint(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdBy` char(36) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userClaims`
--

CREATE TABLE `userClaims` (
  `id` char(36) NOT NULL,
  `actionId` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `claimType` varchar(255) DEFAULT NULL,
  `claimValue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userNotifications`
--

CREATE TABLE `userNotifications` (
  `id` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `isRead` tinyint(1) NOT NULL,
  `documentId` char(36) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userNotifications`
--

INSERT INTO `userNotifications` (`id`, `userId`, `message`, `isRead`, `documentId`, `createdDate`, `modifiedDate`) VALUES
('38be39ce-3ab5-4a56-9bb3-593dcd7e209b', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 0, 'ae2a1002-1a62-436f-8c17-94bba6bac875', '2025-06-18 12:30:47', '2025-06-18 12:30:47'),
('41a3af5a-8269-456c-a2ae-934b8a7f1738', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 0, '9e5149ff-6efd-4810-bd88-336ce0430559', '2025-06-13 06:35:55', '2025-06-13 06:35:55'),
('85f30ca4-e36c-45e8-8c7f-31885ef44b21', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 0, '4e2a7d9c-e5d6-4fa5-9825-a906663c4317', '2025-06-13 07:03:45', '2025-06-13 07:03:45'),
('ca4be5fd-6c95-4140-bb92-3e3233c4b985', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', '2025-06-18 12:55:57', '2025-06-18 12:55:57'),
('d10cc48c-7434-4e99-8fe8-5a816689f974', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 1, '9e5149ff-6efd-4810-bd88-336ce0430559', '2025-06-13 06:35:55', '2025-06-16 05:46:32'),
('ebf242c8-20d7-49cc-b0d3-eadb60994be4', '19766db7-2911-4373-aed6-80580d4aebb8', NULL, 0, '75d6dda4-efa2-467d-bb2d-75bcc2ba6c44', '2025-06-18 12:55:57', '2025-06-18 12:55:57'),
('f28943c6-5429-485a-a01c-6accc13be137', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', NULL, 0, 'ae2a1002-1a62-436f-8c17-94bba6bac875', '2025-06-18 12:30:47', '2025-06-18 12:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `userRoles`
--

CREATE TABLE `userRoles` (
  `id` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `roleId` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userRoles`
--

INSERT INTO `userRoles` (`id`, `userId`, `roleId`) VALUES
('01abf379-a8f2-49d8-8dc5-a6210d9a7d6f', '19766db7-2911-4373-aed6-80580d4aebb8', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4'),
('3aefb27d-a251-4634-bf55-09bf222e5210', 'ac9b1328-10a1-4df2-9504-c52cdd23c994', 'f8b6ace9-a625-4397-bdf8-f34060dbd8e4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `normalizedUserName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `normalizedEmail` varchar(255) DEFAULT NULL,
  `emailConfirmed` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `securityStamp` varchar(255) DEFAULT NULL,
  `concurrencyStamp` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `phoneNumberConfirmed` tinyint(1) NOT NULL,
  `twoFactorEnabled` tinyint(1) NOT NULL,
  `lockoutEnd` timestamp NULL DEFAULT NULL,
  `lockoutEnabled` tinyint(1) NOT NULL,
  `accessFailedCount` int(11) NOT NULL,
  `resetPasswordCode` char(36) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar.png',
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `isDeleted`, `userName`, `normalizedUserName`, `email`, `normalizedEmail`, `emailConfirmed`, `password`, `securityStamp`, `concurrencyStamp`, `phoneNumber`, `phoneNumberConfirmed`, `twoFactorEnabled`, `lockoutEnd`, `lockoutEnabled`, `accessFailedCount`, `resetPasswordCode`, `active_status`, `avatar`, `dark_mode`, `messenger_color`) VALUES
('19766db7-2911-4373-aed6-80580d4aebb8', 'Jays', 'Parmar', 0, 'test@gmail.com', NULL, 'test@gmail.com', NULL, 0, '$2y$10$azKXuRWjSximnq6uvR5H.uCjiyoBoM5.ycJIsCkpDc6BWAbGHgce2', NULL, NULL, '09016379374', 0, 0, NULL, 0, 0, NULL, 0, 'avatar.png', 0, NULL),
('ac9b1328-10a1-4df2-9504-c52cdd23c994', 'Jay', 'Parmar', 0, 'admin@gmail.com', NULL, 'admin@gmail.com', NULL, 0, '$2y$10$bDn7JvnBO6k.5lQ6Vs0kN.v/j1eBUCMKfenJeu6cBB9x0U2XtclkK', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 'avatar.png', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actions_pageid_foreign` (`pageId`);

--
-- Indexes for table `aiPromptTemplates`
--
ALTER TABLE `aiPromptTemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowFileExtensions`
--
ALTER TABLE `allowFileExtensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parentid_foreign` (`parentId`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD KEY `clients_createdby_foreign` (`createdBy`);

--
-- Indexes for table `companyProfile`
--
ALTER TABLE `companyProfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyprofile_createdby_foreign` (`createdBy`);

--
-- Indexes for table `dailyReminders`
--
ALTER TABLE `dailyReminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dailyreminders_reminderid_foreign` (`reminderId`);

--
-- Indexes for table `documentAuditTrails`
--
ALTER TABLE `documentAuditTrails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentaudittrails_documentid_foreign` (`documentId`),
  ADD KEY `documentaudittrails_assigntouserid_foreign` (`assignToUserId`),
  ADD KEY `documentaudittrails_assigntoroleid_foreign` (`assignToRoleId`),
  ADD KEY `documentaudittrails_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documentComments`
--
ALTER TABLE `documentComments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentcomments_documentid_foreign` (`documentId`),
  ADD KEY `documentcomments_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documentMetaDatas`
--
ALTER TABLE `documentMetaDatas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentmetadatas_documentid_foreign` (`documentId`);

--
-- Indexes for table `documentRolePermissions`
--
ALTER TABLE `documentRolePermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentrolepermissions_documentid_foreign` (`documentId`),
  ADD KEY `documentrolepermissions_roleid_foreign` (`roleId`),
  ADD KEY `documentrolepermissions_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_categoryid_foreign` (`categoryId`),
  ADD KEY `documents_createdby_foreign` (`createdBy`),
  ADD KEY `documents_clientid_foreign` (`clientId`),
  ADD KEY `documents_statusid_foreign` (`statusId`);

--
-- Indexes for table `documentShareableLink`
--
ALTER TABLE `documentShareableLink`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentshareablelink_documentid_foreign` (`documentId`),
  ADD KEY `documentshareablelink_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documentStatus`
--
ALTER TABLE `documentStatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentstatus_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documentTokens`
--
ALTER TABLE `documentTokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentUserPermissions`
--
ALTER TABLE `documentUserPermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentuserpermissions_documentid_foreign` (`documentId`),
  ADD KEY `documentuserpermissions_userid_foreign` (`userId`),
  ADD KEY `documentuserpermissions_createdby_foreign` (`createdBy`);

--
-- Indexes for table `documentVersions`
--
ALTER TABLE `documentVersions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentversions_documentid_foreign` (`documentId`),
  ADD KEY `documentversions_createdby_foreign` (`createdBy`);

--
-- Indexes for table `document_attachments`
--
ALTER TABLE `document_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_attachments_documentid_foreign` (`documentId`);

--
-- Indexes for table `emailSMTPSettings`
--
ALTER TABLE `emailSMTPSettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileRequestDocuments`
--
ALTER TABLE `fileRequestDocuments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filerequestdocuments_filerequestid_foreign` (`fileRequestId`),
  ADD KEY `filerequestdocuments_approvalorrejectedbyid_foreign` (`approvalOrRejectedById`);

--
-- Indexes for table `fileRequests`
--
ALTER TABLE `fileRequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filerequests_createdby_foreign` (`createdBy`);

--
-- Indexes for table `halfYearlyReminders`
--
ALTER TABLE `halfYearlyReminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `halfyearlyreminders_reminderid_foreign` (`reminderId`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `languages_createdby_foreign` (`createdBy`);

--
-- Indexes for table `loginAudits`
--
ALTER TABLE `loginAudits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meetings_jitsi_meeting_id_unique` (`jitsi_meeting_id`),
  ADD KEY `meetings_created_by_foreign` (`created_by`);

--
-- Indexes for table `meeting_clients`
--
ALTER TABLE `meeting_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_clients_meeting_id_client_id_unique` (`meeting_id`,`client_id`),
  ADD KEY `meeting_clients_client_id_foreign` (`client_id`);

--
-- Indexes for table `meeting_user`
--
ALTER TABLE `meeting_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_user_meeting_id_user_id_unique` (`meeting_id`,`user_id`),
  ADD KEY `meeting_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `openaiDocuments`
--
ALTER TABLE `openaiDocuments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pageHelper`
--
ALTER TABLE `pageHelper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarterlyReminders`
--
ALTER TABLE `quarterlyReminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quarterlyreminders_reminderid_foreign` (`reminderId`);

--
-- Indexes for table `reminderNotifications`
--
ALTER TABLE `reminderNotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remindernotifications_reminderid_foreign` (`reminderId`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_documentid_foreign` (`documentId`),
  ADD KEY `reminders_createdby_foreign` (`createdBy`);

--
-- Indexes for table `reminderSchedulers`
--
ALTER TABLE `reminderSchedulers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminderschedulers_documentid_foreign` (`documentId`),
  ADD KEY `reminderschedulers_userid_foreign` (`userId`);

--
-- Indexes for table `reminderUsers`
--
ALTER TABLE `reminderUsers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminderusers_reminderid_foreign` (`reminderId`),
  ADD KEY `reminderusers_userid_foreign` (`userId`);

--
-- Indexes for table `roleClaims`
--
ALTER TABLE `roleClaims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleclaims_actionid_foreign` (`actionId`),
  ADD KEY `roleclaims_roleid_foreign` (`roleId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sendEmails`
--
ALTER TABLE `sendEmails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendemails_documentid_foreign` (`documentId`),
  ADD KEY `sendemails_createdby_foreign` (`createdBy`);

--
-- Indexes for table `userClaims`
--
ALTER TABLE `userClaims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userclaims_actionid_foreign` (`actionId`),
  ADD KEY `userclaims_userid_foreign` (`userId`);

--
-- Indexes for table `userNotifications`
--
ALTER TABLE `userNotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usernotifications_userid_foreign` (`userId`),
  ADD KEY `usernotifications_documentid_foreign` (`documentId`);

--
-- Indexes for table `userRoles`
--
ALTER TABLE `userRoles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userroles_userid_foreign` (`userId`),
  ADD KEY `userroles_roleid_foreign` (`roleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_pageid_foreign` FOREIGN KEY (`pageId`) REFERENCES `pages` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parentid_foreign` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `companyProfile`
--
ALTER TABLE `companyProfile`
  ADD CONSTRAINT `companyprofile_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `dailyReminders`
--
ALTER TABLE `dailyReminders`
  ADD CONSTRAINT `dailyreminders_reminderid_foreign` FOREIGN KEY (`reminderId`) REFERENCES `reminders` (`id`);

--
-- Constraints for table `documentAuditTrails`
--
ALTER TABLE `documentAuditTrails`
  ADD CONSTRAINT `documentaudittrails_assigntoroleid_foreign` FOREIGN KEY (`assignToRoleId`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `documentaudittrails_assigntouserid_foreign` FOREIGN KEY (`assignToUserId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentaudittrails_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentaudittrails_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `documentComments`
--
ALTER TABLE `documentComments`
  ADD CONSTRAINT `documentcomments_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentcomments_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `documentMetaDatas`
--
ALTER TABLE `documentMetaDatas`
  ADD CONSTRAINT `documentmetadatas_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `documentRolePermissions`
--
ALTER TABLE `documentRolePermissions`
  ADD CONSTRAINT `documentrolepermissions_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentrolepermissions_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `documentrolepermissions_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `documents_clientid_foreign` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `documents_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documents_statusid_foreign` FOREIGN KEY (`statusId`) REFERENCES `documentStatus` (`id`);

--
-- Constraints for table `documentShareableLink`
--
ALTER TABLE `documentShareableLink`
  ADD CONSTRAINT `documentshareablelink_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentshareablelink_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `documentStatus`
--
ALTER TABLE `documentStatus`
  ADD CONSTRAINT `documentstatus_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `documentUserPermissions`
--
ALTER TABLE `documentUserPermissions`
  ADD CONSTRAINT `documentuserpermissions_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentuserpermissions_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `documentuserpermissions_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `documentVersions`
--
ALTER TABLE `documentVersions`
  ADD CONSTRAINT `documentversions_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `documentversions_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `document_attachments`
--
ALTER TABLE `document_attachments`
  ADD CONSTRAINT `document_attachments_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fileRequestDocuments`
--
ALTER TABLE `fileRequestDocuments`
  ADD CONSTRAINT `filerequestdocuments_approvalorrejectedbyid_foreign` FOREIGN KEY (`approvalOrRejectedById`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `filerequestdocuments_filerequestid_foreign` FOREIGN KEY (`fileRequestId`) REFERENCES `fileRequests` (`id`);

--
-- Constraints for table `fileRequests`
--
ALTER TABLE `fileRequests`
  ADD CONSTRAINT `filerequests_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `halfYearlyReminders`
--
ALTER TABLE `halfYearlyReminders`
  ADD CONSTRAINT `halfyearlyreminders_reminderid_foreign` FOREIGN KEY (`reminderId`) REFERENCES `reminders` (`id`);

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `meeting_clients`
--
ALTER TABLE `meeting_clients`
  ADD CONSTRAINT `meeting_clients_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `meeting_clients_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`);

--
-- Constraints for table `meeting_user`
--
ALTER TABLE `meeting_user`
  ADD CONSTRAINT `meeting_user_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  ADD CONSTRAINT `meeting_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quarterlyReminders`
--
ALTER TABLE `quarterlyReminders`
  ADD CONSTRAINT `quarterlyreminders_reminderid_foreign` FOREIGN KEY (`reminderId`) REFERENCES `reminders` (`id`);

--
-- Constraints for table `reminderNotifications`
--
ALTER TABLE `reminderNotifications`
  ADD CONSTRAINT `remindernotifications_reminderid_foreign` FOREIGN KEY (`reminderId`) REFERENCES `reminders` (`id`);

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reminders_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `reminderSchedulers`
--
ALTER TABLE `reminderSchedulers`
  ADD CONSTRAINT `reminderschedulers_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `reminderschedulers_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `reminderUsers`
--
ALTER TABLE `reminderUsers`
  ADD CONSTRAINT `reminderusers_reminderid_foreign` FOREIGN KEY (`reminderId`) REFERENCES `reminders` (`id`),
  ADD CONSTRAINT `reminderusers_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `roleClaims`
--
ALTER TABLE `roleClaims`
  ADD CONSTRAINT `roleclaims_actionid_foreign` FOREIGN KEY (`actionId`) REFERENCES `actions` (`id`),
  ADD CONSTRAINT `roleclaims_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);

--
-- Constraints for table `sendEmails`
--
ALTER TABLE `sendEmails`
  ADD CONSTRAINT `sendemails_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sendemails_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`);

--
-- Constraints for table `userClaims`
--
ALTER TABLE `userClaims`
  ADD CONSTRAINT `userclaims_actionid_foreign` FOREIGN KEY (`actionId`) REFERENCES `actions` (`id`),
  ADD CONSTRAINT `userclaims_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `userNotifications`
--
ALTER TABLE `userNotifications`
  ADD CONSTRAINT `usernotifications_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `usernotifications_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `userRoles`
--
ALTER TABLE `userRoles`
  ADD CONSTRAINT `userroles_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `userroles_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
