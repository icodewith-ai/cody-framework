## Frontend Security

| | Security Measure | Description |
|---|-----------------|-------------|
| ☐ | Use HTTPS everywhere | Prevents basic eavesdropping and man-in-the-middle attacks |
| ☐ | Input validation and sanitization | Prevents XSS attacks by validating all user inputs |
| ☐ | Don't store sensitive data in the browser | No secrets in localStorage or client-side code |
| ☐ | CSRF protection | Implement anti-CSRF tokens for forms and state-changing requests |
| ☐ | Never expose API keys in frontend | API credentials should always remain server-side |

## Backend Security

| | Security Measure | Description |
|---|-----------------|-------------|
| ☐ | Authentication fundamentals | Use established libraries, proper password storage (hashing+salting) |
| ☐ | Authorization checks | Always verify permissions before performing actions |
| ☐ | API endpoint protection | Implement proper authentication for every API endpoint |
| ☐ | SQL injection prevention | Use parameterized queries or ORMs, never raw SQL with user input |
| ☐ | Basic security headers | Implement X-Frame-Options, X-Content-Type-Options, and HSTS |
| ☐ | DDoS protection | Use a CDN or cloud service with built-in DDoS mitigation capabilities |

## Practical Security Habits

| | Security Measure | Description |
|---|-----------------|-------------|
| ☐ | Keep dependencies updated | Most vulnerabilities come from outdated libraries |
| ☐ | Proper error handling | Don't expose sensitive details in error messages |
| ☐ | Secure cookies | Set HttpOnly, Secure and SameSite attributes |
| ☐ | File upload security | Validate file types, sizes, and scan for malicious content |
| ☐ | Rate limiting | Implement on all API endpoints, especially authentication-related ones |