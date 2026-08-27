# CRM Mobile Application

A Flutter-based mobile application designed to work with the **existing .NET CRM and SQL Server database**.

> **Important:** This project does not create a new database or duplicate the existing CRM business logic. The Flutter application communicates with the existing CRM through secure REST APIs so that both systems remain synchronized.

## Project Overview

The goal of this project is to provide a mobile interface for the existing CRM while keeping the current .NET CRM and SQL Server database as the single source of business data.

### Architecture

```text
┌──────────────────────┐
│   Flutter Mobile App │
│   Android / iOS      │
└──────────┬───────────┘
           │ HTTPS / REST API
           ▼
┌──────────────────────┐
│     .NET CRM API     │
│ Authentication       │
│ Business Logic       │
│ Authorization        │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│     SQL Server       │
│ Existing CRM DB      │
└──────────────────────┘
           ▲
           │
┌──────────┴───────────┐
│ Existing .NET CRM    │
│ Web Application      │
└──────────────────────┘
```

The existing SQL Server database remains the shared source of data. The Flutter app should **not connect directly to SQL Server**.

## Core Requirements

The API/backend integration must support the required CRM modules, including:

- Authentication
- Dashboard
- Reports
- Client Enquiry
- Search Client
- Quotation
- Email / SMS
- Auto Marketing
- User roles and permissions
- File uploads
- Image URLs
- Secure API communication

The exact API contracts should be provided by the existing CRM/backend team and documented using **Swagger or Postman**.

## Technology Stack

### Mobile Application

- Flutter
- Dart
- Android
- iOS
- REST API integration
- JSON

### Existing Backend

- .NET CRM
- Existing business logic
- Existing SQL Server database
- REST APIs

### Authentication

- JWT preferred
- Role-based authorization
- Secure token handling

### API Documentation

- Swagger and/or Postman
- Request/response JSON examples
- Authentication requirements
- Endpoint documentation

## CRM Modules

### 1. Authentication

The mobile application should authenticate users through the existing CRM API.

Expected functionality:

- Login
- Logout/token invalidation where supported
- JWT access token
- Token refresh where supported
- User profile
- Role/permission information
- Authentication error handling

> Authentication implementation must follow the API contract provided by the existing CRM backend.

### 2. Dashboard

The Flutter dashboard should consume dashboard information from the existing CRM API.

Possible data includes:

- CRM summary
- Enquiry statistics
- Client statistics
- Quotation statistics
- Reports/analytics
- Other existing CRM dashboard information

The Flutter app should display the data returned by the API rather than reimplementing CRM calculations locally.

### 3. Reports

The application should provide access to reports exposed by the existing CRM API.

Required API documentation should specify:

- Report endpoints
- Filters
- Date ranges
- Pagination
- Sorting
- Response formats
- Export/download functionality, if supported

### 4. Client Enquiry

The mobile application should support the existing CRM's client enquiry workflow.

Depending on the existing CRM implementation, APIs may include:

- Create enquiry
- View enquiry
- Update enquiry
- Search/filter enquiry
- Assign enquiry
- Change enquiry status
- Enquiry history

The exact operations must match the existing CRM business logic.

### 5. Search Client

The application should allow authorized users to search existing CRM clients.

Expected API capabilities may include:

- Search by client name
- Search by mobile number
- Search by email
- Search by client ID
- Filters
- Pagination

The API should return the fields required by the mobile UI.

### 6. Quotation

Quotation functionality should use the existing CRM quotation/business logic.

Depending on the existing CRM, this may include:

- Create quotation
- View quotation
- Update quotation
- Search quotation
- Quotation status
- Download quotation
- Share quotation
- Customer information
- Product/service details

The Flutter application should not create an independent quotation calculation system if the existing CRM already contains this business logic.

### 7. Email / SMS

The mobile application should consume existing APIs for CRM communication features where available.

Examples:

- Send email
- Send SMS
- View communication status
- Communication history
- Message templates

Credentials for external email/SMS providers must remain on the backend and must not be embedded in the Flutter application.

### 8. Auto Marketing

Auto Marketing functionality should be exposed through secure APIs from the existing CRM.

The API documentation should define:

- Marketing campaign operations
- Target/client selection
- Templates
- Scheduling
- Campaign status
- Email/SMS integration
- Permission requirements

## API Requirements

The backend/API team should provide REST endpoints for all required modules.

Each endpoint should document:

```text
HTTP Method
Endpoint URL
Authentication
Required Role/Permission
Request Headers
Path Parameters
Query Parameters
Request JSON
Response JSON
HTTP Status Codes
Error Response
Pagination
File Upload Requirements
```

### Example API Structure

> The following is only a project documentation example. Actual endpoint names and JSON fields must be taken from the existing CRM API.

```text
POST   /api/auth/login
POST   /api/auth/refresh
GET    /api/auth/profile

GET    /api/dashboard

GET    /api/reports
GET    /api/reports/{id}

GET    /api/clients
GET    /api/clients/{id}

GET    /api/enquiries
POST   /api/enquiries
GET    /api/enquiries/{id}
PUT    /api/enquiries/{id}

GET    /api/quotations
POST   /api/quotations
GET    /api/quotations/{id}
PUT    /api/quotations/{id}

POST   /api/email/send
POST   /api/sms/send

GET    /api/marketing
POST   /api/marketing
```

These routes are placeholders until the actual .NET API specification is provided.

## Authentication Flow

Recommended flow:

```text
Flutter App
    │
    │ Login credentials
    ▼
.NET CRM API
    │
    │ Validate existing CRM user
    ▼
SQL Server
    │
    │ User + roles + permissions
    ▼
.NET CRM API
    │
    │ JWT Access Token
    ▼
Flutter App
    │
    │ Authorization: Bearer <token>
    ▼
Protected API Endpoints
```

The Flutter application should never store:

- SQL Server credentials
- Database connection strings
- Backend service secrets
- Email provider passwords
- SMS provider secrets
- Other server-side credentials

## Roles and Permissions

The backend should provide the available roles and permissions.

Example:

```text
User
 ├── Dashboard
 ├── Client Search
 └── Client Enquiry

Sales
 ├── Dashboard
 ├── Client Search
 ├── Client Enquiry
 └── Quotation

Admin
 ├── Dashboard
 ├── Reports
 ├── Client Enquiry
 ├── Client Search
 ├── Quotation
 ├── Email/SMS
 └── Auto Marketing
```

The actual roles and permissions must be taken from the existing CRM.

## File Uploads and Images

The API should provide documented endpoints for file/image uploads where required.

Documentation should include:

- Upload endpoint
- Supported file types
- Maximum file size
- Multipart/form-data requirements
- Authentication
- Response JSON
- Stored file/image URL
- Error responses

Example response:

```json
{
  "success": true,
  "fileUrl": "https://example.com/uploads/file.jpg"
}
```

The URL above is an example only. The production API must return the actual URL supplied by the backend.

## Project Structure

Recommended Flutter structure:

```text
lib/
├── main.dart
│
├── core/
│   ├── constants/
│   ├── theme/
│   ├── routes/
│   ├── utils/
│   └── network/
│
├── models/
│
├── services/
│   ├── api_service.dart
│   ├── auth_service.dart
│   └── storage_service.dart
│
├── repositories/
│
├── screens/
│   ├── auth/
│   ├── dashboard/
│   ├── clients/
│   ├── enquiries/
│   ├── quotations/
│   ├── reports/
│   ├── marketing/
│   └── communication/
│
├── widgets/
│
└── providers/
```

The structure can be adjusted as the Flutter project grows.

## API Integration

The Flutter application should have a centralized API layer.

Recommended responsibilities:

- Base API URL management
- HTTP requests
- JWT authorization headers
- Token refresh
- Request timeout
- Error handling
- JSON parsing
- File upload
- Logging during development
- Secure local token storage

Example request header:

```http
Authorization: Bearer <JWT_ACCESS_TOKEN>
Content-Type: application/json
```

## Environment Configuration

Do not hard-code production API URLs or secrets throughout the application.

Recommended environments:

```text
Development
Testing / Staging
Production
```

Example:

```text
API_BASE_URL=https://api.example.com
```

Actual URLs must be supplied by the backend/API team.

## Synchronization Strategy

The Flutter app and existing CRM must remain synchronized through the API layer.

```text
Existing CRM ───────┐
                    │
                    ▼
               SQL Server
                    ▲
                    │
               .NET APIs
                    ▲
                    │
              Flutter App
```

### Important Rules

1. Flutter must not connect directly to SQL Server.
2. Business rules should remain in the existing backend.
3. Flutter should consume API responses.
4. Both systems should use the same CRM data.
5. API authorization must be enforced server-side.
6. Database credentials must never be included in the Flutter app.
7. Changes made through the Flutter app should use the same backend business logic as the existing CRM.

## API Documentation Deliverables

The backend team should provide:

- Swagger/OpenAPI documentation or Postman collection
- Base API URL
- Authentication endpoint
- JWT details
- Token expiry
- Refresh-token behavior, if supported
- All module endpoints
- Request JSON examples
- Response JSON examples
- Error response formats
- HTTP status codes
- Roles
- Permissions
- File upload API
- Image/file URL behavior
- Sample test credentials

## Testing

### API Testing

Use:

- Swagger UI
- Postman

Test:

- Successful requests
- Invalid authentication
- Expired JWT
- Unauthorized roles
- Validation errors
- Missing fields
- Invalid IDs
- File upload errors
- Server errors
- Pagination and filters

### Flutter Testing

Test:

- Login/logout
- Token handling
- Dashboard loading
- Client search
- Client enquiry
- Quotation
- Reports
- Email/SMS
- Auto Marketing
- File/image upload
- Network failure
- API timeout
- Permission restrictions

## Security

Security requirements:

- HTTPS for API communication
- JWT authentication
- Server-side authorization
- Secure token storage
- No database credentials in the app
- No third-party service secrets in the app
- Input validation
- Proper API error handling
- File upload validation
- Production logging must not expose sensitive information

## Development Workflow

### Phase 1 — Analyze Existing CRM

- Understand existing .NET CRM architecture.
- Identify existing modules.
- Identify database entities.
- Identify business logic.
- Identify authentication implementation.
- Identify roles and permissions.

### Phase 2 — API Development

- Expose required REST APIs.
- Reuse existing business logic.
- Connect APIs to the existing SQL Server database.
- Implement JWT authentication.
- Implement authorization.

### Phase 3 — API Testing

- Configure Swagger/Postman.
- Test authentication.
- Test every required endpoint.
- Validate request/response formats.
- Test roles and permissions.

### Phase 4 — Flutter Development

- Build application UI.
- Implement authentication.
- Implement API service layer.
- Build dashboard.
- Build CRM modules.
- Implement file/image handling.

### Phase 5 — Integration

- Connect Flutter to staging APIs.
- Test complete workflows.
- Verify that Flutter and web CRM show synchronized data.
- Fix API/UI integration issues.

### Phase 6 — Production

- Configure production API.
- Configure release builds.
- Test production authentication.
- Perform security checks.
- Publish Android/iOS applications.

## Current Status

| Component | Status |
|---|---|
| Flutter project | In Development |
| Existing .NET CRM | Existing |
| SQL Server database | Existing |
| REST API integration | Required |
| JWT authentication | Required / Preferred |
| Swagger/Postman documentation | Required |
| Dashboard | Planned |
| Client Enquiry | Planned |
| Search Client | Planned |
| Quotation | Planned |
| Email/SMS | Planned |
| Auto Marketing | Planned |
| File Upload API | Required |
| Image URLs | Required |
| Role & Permission API | Required |
| End-to-End Testing | Pending |

## Backend Team Checklist

- [ ] Provide existing CRM architecture details
- [ ] Provide SQL Server/database information required for API development
- [ ] Identify existing authentication mechanism
- [ ] Provide user roles and permissions
- [ ] Develop/expose required REST APIs
- [ ] Implement JWT authentication
- [ ] Document token/refresh behavior
- [ ] Provide Swagger or Postman collection
- [ ] Provide request/response JSON
- [ ] Provide file upload endpoints
- [ ] Provide image/file URL behavior
- [ ] Provide sample test credentials
- [ ] Test APIs
- [ ] Provide staging API URL

## Flutter Team Checklist

- [ ] Set up Flutter project
- [ ] Configure environments
- [ ] Implement API service
- [ ] Implement secure authentication
- [ ] Implement JWT/token handling
- [ ] Implement dashboard
- [ ] Implement client search
- [ ] Implement client enquiry
- [ ] Implement quotation
- [ ] Implement reports
- [ ] Implement email/SMS screens
- [ ] Implement auto marketing screens
- [ ] Implement file/image upload
- [ ] Implement role-based UI access
- [ ] Perform integration testing
- [ ] Perform release testing

## Important Notes

This project is an **extension of the existing CRM**, not a replacement database/application.

The primary objective is:

> **Existing .NET CRM + Existing SQL Server Database + Secure REST APIs + Flutter Mobile Application**

The Flutter application should consume the existing CRM APIs and should not independently reproduce business rules that already exist in the .NET CRM.

---

## License

Add the project's license information here when it is finalized.

## Contact

Add the project owner/company contact information here when it is finalized.
