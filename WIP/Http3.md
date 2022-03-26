New http protocol


## Comparison

HTTP/1 and HTTP/2 use TCP while HTTP/3 uses QUIC.

The switch to QUIC aims to fix a major problem of HTTP/2 called "head-of-line blocking": because the parallel nature of HTTP/2's multiplexing is not visible to TCP's loss recovery mechanisms, a lost or reordered packet causes all active transactions to experience a stall regardless of whether that transaction was impacted by the lost packet. Because QUIC provides native multiplexing, lost packets only impact the streams where data has been lost.


## Drafts, not standard

As of February 2022, the HTTP/3 protocol has not yet been finalized. Everything and everyone that speaks HTTP/3 at this point does it with the knowledge and awareness that it might change going forward.

## QUIC

HTTP/3 is the HTTP version that is designed to communicate over QUIC. QUIC can for all particular purposes to be considered as a TCP+TLS replacement.
All requests that do HTTP/3 will therefore not use TCP. They will use QUIC. QUIC is a reliable transport protocol built over UDP. HTTP/3 implies use of QUIC.


## HTTPS only

HTTP/3 is performed over QUIC which is always using TLS, so HTTP/3 is by definition always encrypted and secure. Therefore, curl only uses HTTP/3 for HTTPS:// URLs.