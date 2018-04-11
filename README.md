# Ci&T challenge - Ramon Medeiros

# Introduction

This repository was created to solve a challenge from Ci&T. I will explain how to run it

# Dependencies

This Automated Test framework uses Selenium and RobotFramework. The dependency is listed in requirements.txt, to install it you can use:

```pip install -r requirements.txt```

Robot Framework here is waiting for a Remote selenium server, that listen on localhost and port 4444. To make it easy to configure, we can use docker to provide the service:

```docker run --shm-size="512m" -e DBUS_SESSION_BUS_ADDRESS='/dev/null' -p 4444:4444 -p 5900:5900 --rm --name selenium selenium/standalone-chrome-debug ```

