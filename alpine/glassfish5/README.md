**Overview**
This is an `alpine` image with `java 8` and `glassfish 5` installed.
In total the size of this image is `228MB` run `docker history [image]` to see how this space is used once you've built it

**Build**
*docker build -t alpine-openjdk8-glassfish5 .*

**Run**
*docker run -it -p 8080:8080 4848:4848 --restart=always alpine-openjdk8-glassfish5*

---
**Usage**
Application
http://localhost:8080 / http://192.168.99.100:8080 (docker machine)

Admin
http://localhost:4848 / http://192.168.99.100:4848 (docker machine)
*credentials:
username: admin
password: password*