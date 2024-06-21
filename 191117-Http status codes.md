Http status codes | [Http]


## 1xx Informational

- 100 Continue 
    - The server has received the request headers and the client should proceed to send the request body.
- 101 Switching Protocols
    - The requester has asked the server to switch protocols and the server has agreed to do so.
- 102 Processing
    - The server has received and is processing the request, but no response is available yet.
- 103 Early Hints
    - Used to return some response headers before final HTTP message.

## 2xx Success

- 200 OK
    - The request is successful.

- 201 Created
    - The request has been fulfilled and resulted in a new resource being created.

- 202 Accepted
    - The request has been accepted for processing, but the processing has not been completed.

- 203 Non-Authoritative Information
    - The server is a transforming proxy that received a 200 OK from its origin, but is returning a modified version of the origin's response.

- 204 No Content
    - The server successfully processed the request and is not returning any content.

- 205 Reset Content
    - The server successfully processed the request, but is not returning any content.

- 206 Partial Content
    - The server is delivering only part of the resource due to a range header sent by the client.

- 207 Multi-Status
    - The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.

- 208 Already Reported
    - The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.

- 226 IM Used
    - The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.

## 3xx Redirection

- 300 Multiple Choices
    - Indicates multiple options for the resource from which the client may choose.

- 301 Moved Permanently
    - This and all future requests should be directed to the given URI.

- 302 Found
    - The requested resource resides temporarily under a different URI.

- 303 See Other 
    - The response to the request can be found under another URI using a GET method.

- 304 Not Modified
    - Indicates that the resource has not been modified since the version specified by the request headers.

- 305 Use Proxy 
    - The requested resource is available only through a proxy, the address for which is provided in the response.  

- 306 Switch Proxy
    - No longer used.

- 307 Temporary Redirect    
    - The request should be repeated with another URI, but future requests can still use the original URI.

- 308 Permanent Redirect
    - The request and all future requests should be repeated using another URI.

## 4xx Client Error

- 400 Bad Request
    - The server cannot or will not process the request due to an apparent client error.

- 401 Unauthorized  
    - Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.

- 402 Payment Required
    - Reserved for future use.

- 403 Forbidden
    - The request was valid, but the server is refusing action.

- 404 Not Found
    - The requested resource could not be found but may be available in the future.

- 405 Method Not Allowed
    - A request method is not supported for the requested resource.

- 406 Not Acceptable
    - The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.

- 407 Proxy Authentication Required
    - The client must first authenticate itself with the proxy.

- 408 Request Timeout
    - The server timed out waiting for the request.

- 409 Conflict
    - Indicates that the request could not be processed because of conflict in the request.

- 410 Gone
    - Indicates that the resource requested is no longer available and will not be available again

- 411 Length Required
    - The request did not specify the length of its content, which is required by the requested resource.

- 412 Precondition Failed
    - The server does not meet one of the preconditions that the requester put on the request.

- 413 Payload Too Large
    - The request is larger than the server is willing or able to process.

- 414 URI Too Long
    - The URI provided was too long for the server to process.

- 415 Unsupported Media Type
    - The request entity has a media type which the server or resource does not support.

- 416 Range Not Satisfiable
    - The client has asked for a portion of the file, but the server cannot supply that portion.

- 417 Expectation Failed
    - The server cannot meet the requirements of the Expect request-header field.

- 418 I'm a teapot
    - This code was defined in 1998 as one of the traditional IETF April Fools' jokes, in RFC 2324, Hyper Text Coffee Pot Control Protocol.

- 421 Misdirected Request
    - The request was directed at a server that is not able to produce a response.

- 422 Unprocessable Entity
    - The request was well-formed but was unable to be followed due to semantic errors.

- 423 Locked
    - The resource that is being accessed is locked.

- 424 Failed Dependency
    - The request failed due to failure of a previous request.

- 425 Too Early
    - Indicates that the server is unwilling to risk processing a request that might be replayed.

- 426 Upgrade Required
    - The client should switch to a different protocol such as TLS/1.0.

- 428 Precondition Required
    - The origin server requires the request to be conditional.

- 429 Too Many Requests
    - The user has sent too many requests in a given amount of time.

- 431 Request Header Fields Too Large
    - The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.

- 451 Unavailable For Legal Reasons
    - A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.

## 5xx Server Error


- 500 Internal Server Error
    - A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.

- 501 Not Implemented
    - The server either does not recognize the request method, or it lacks the ability to fulfill the request.

- 502 Bad Gateway
    - The server was acting as a gateway or proxy and received an invalid response from the upstream server.

- 503 Service Unavailable
    - The server is not ready to handle the request.

- 504 Gateway Timeout
    - The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.

- 505 HTTP Version Not Supported
    - The server does not support the HTTP protocol version used in the request.

- 506 Variant Also Negotiates
    - Transparent content negotiation for the request results in a circular reference.

- 507 Insufficient Storage
    - The server is unable to store the representation needed to complete the request.

- 508 Loop Detected 
    - The server detected an infinite loop while processing the request.

- 510 Not Extended
    - Further extensions to the request are required for the server to fulfill it.

- 511 Network Authentication Required
    - The client needs to authenticate to gain network access.

