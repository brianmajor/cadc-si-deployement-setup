alias curl-auth='curl -v --cacert certs/haproxy-ca-cert.pem --cert certs/cadcproxy.pem'
curl-auth -T test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl -v -T test-file.fits http://localhost:8090/minoc/files/TEST1:JUNK/test-file.fits
curl-auth --head https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits
curl -v -X GET --header 'Accept: text/plain' 'http://localhost:8084/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'

curl-auth -v -X GET --header 'Accept: text/plain' 'https://localhost:443/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'

curl -v -X GET --header 'Accept: text/plain' 'http://localhost:8084/baldur/perms?OP=read&ID=TEST1:JUNK/test-file.fits'


curl -T test-file.fits http://localhost:8083/minoc/files/TEST1:JUNK/test-file.fits

curl-auth -T test-file.fits https://localhost:8443/minoc/files/TEST1:JUNK/test-file.fits

curl-auth -v -T test-file.fits http://localhost:8083/minoc/files/eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJjMzc3MjQ1OC1hZDBlLTQ5NWQtYjdlNi05NTQ1ZjY4NDEzMzciLCJpc3MiOiJodHRwczpcL1wvaXJpcy1pYW0uc3RmYy5hYy51ayIsIm5hbWUiOiJBYmhpc2hlayBHaG9zaCIsImdyb3VwcyI6WyJza2EiLCJza2FcL3NyYy1hYWktZGV2ZWxvcG1lbnQiLCJsb2NhbEFjY291bnRzIl0sInByZWZlcnJlZF91c2VybmFtZSI6ImFiaGlzaGVrZ2hvc2giLCJvcmdhbmlzYXRpb25fbmFtZSI6IklSSVMgSUFNIiwiZXhwIjoxNjc2NjE5Nzk5LCJpYXQiOjE2NzY2MTYxOTksImp0aSI6IjkxYjRlNjQ0LTgzNGItNDU3ZS1iYmRjLTk4ODcxYzk0YmUzYiIsImNsaWVudF9pZCI6IjE1M2Y4YTViLTJlMGEtNGJkYS05NTgzLWU3Njc1Y2IwN2I3YyIsImVtYWlsIjoiYWJoaXNoZWsuZ2hvc2hAdGhvdWdodHdvcmtzLmNvbSJ9.H0x5q_kHSweuk9ryTuRLVhUU9UQ9_wmUaJGiOalH-gpFOQZlE6Wj6WtVzqMjRzU8M1D_KeByjic5vVV3Lj3oqZTKBK41fTmvgX2awP9C_RBvkvXtbFYBVn4JhB6sNrrb2Xb56BkZZpPgFEl0pdNfbl8KFHHyuqmgqkQyu-0eUHq4zKUDJpVUtMOh3dGQmYYZ76dG27YkBIzp4o1LEx0MMjT_eTyRjqlu5HM3zHN06PFesSxPFwzppjMlJOUrdhNDTjRa0oOPCJ7E0v8nah6AF7SGzc7b6Jr9aU-vJ7XVLWa79NN7OvKECSvuDqT5uSXzFvppL96usoJ8PhCJyAnwPQ/TEST1:JUNK/test-file.fits