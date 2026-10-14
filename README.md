# Systemd Service

A simple Linux service management project that demonstrates how to create, configure, and manage a custom background service using `systemd`.

This project is part of the [roadmap.sh Systemd Service project](https://roadmap.sh/projects/dummy-systemd-service).

## Features

- Runs a background process continuously.
- Writes a log message every 10 seconds.
- Starts automatically during system boot.
- Restarts automatically if the process fails.
- Supports service management using `systemctl`.
- Provides real-time and historical logs using `journalctl`.

## Requirements

- Linux system with `systemd`.
- Bash shell.
- Administrative privileges (`sudo`).

## Project Structure

```text
systemd-service/
├── dummy.sh
├── dummy.service
└── README.md
```

## Installation

Install the script and service unit file:

```bash
sudo install -m 0755 dummy.sh /usr/local/bin/dummy.sh
sudo install -m 0644 dummy.service /etc/systemd/system/dummy.service
```

Reload the systemd configuration:

```bash
sudo systemctl daemon-reload
```

## Start and Enable the Service

Start the service immediately:

```bash
sudo systemctl start dummy
```

Enable the service to start automatically at boot:

```bash
sudo systemctl enable dummy
```

Alternatively, start and enable the service in one command:

```bash
sudo systemctl enable --now dummy
```

## Check Service Status

Check whether the service is running:

```bash
sudo systemctl status dummy
```

Check whether the service is enabled at boot:

```bash
systemctl is-enabled dummy
```

Check whether the service is currently active:

```bash
systemctl is-active dummy
```

## View Logs

Follow service logs in real time:

```bash
sudo journalctl -u dummy -f
```

Display the latest 20 log entries:

```bash
sudo journalctl -u dummy -n 20 --no-pager
```

View logs from the current boot:

```bash
sudo journalctl -u dummy -b
```

## Stop and Disable the Service

Stop the running service:

```bash
sudo systemctl stop dummy
```

Disable automatic startup at boot:

```bash
sudo systemctl disable dummy
```

Stop the service and disable automatic startup together:

```bash
sudo systemctl disable --now dummy
```

## Test Automatic Restart

The service is configured with `Restart=always` and `RestartSec=5`, allowing systemd to restart it after an unexpected process termination.

First, retrieve the service's main process ID:

```bash
sudo systemctl show dummy -p MainPID --value
```

Terminate the main process to simulate a failure:

```bash
sudo kill -9 "$(systemctl show dummy -p MainPID --value)"
```

Wait a few seconds, then check the service status:

```bash
sudo systemctl status dummy
```

Inspect the logs to verify that systemd detected the failure and restarted the service:

```bash
sudo journalctl -u dummy -n 20 --no-pager
```

The service should return to the `active (running)` state with a new main process ID.

## Learning Outcomes

- Understanding systemd unit files and service configuration.
- Creating and installing custom Linux services.
- Managing service lifecycles using `systemctl`.
- Configuring automatic startup and restart behavior.
- Monitoring and troubleshooting services using `journalctl`.

## Author

Created as part of the [roadmap.sh Systemd Service project](https://roadmap.sh/projects/dummy-systemd-service).
