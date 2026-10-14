# Systemd Service

A simple Linux service management project that demonstrates how to create, configure, and manage a custom background service using systemd.

This project is part of the [roadmap.sh Systemd Service project](https://roadmap.sh/projects).

## Features

- Run a background process continuously.
- Write a log message every 10 seconds.
- Start automatically during system boot.
- Restart automatically if the process fails.
- Manage service status using `systemctl`.
- Inspect service logs using `journalctl`.

## Requirements

- Linux system with systemd.
- Bash.
- Administrative privileges (`sudo`).

## Project Structure

```text
systemd-service/
├── dummy.sh
├── dummy.service
└── README.md
```

## Installation

Copy the script and service unit to their system locations:

```bash
sudo install -m 0755 dummy.sh /usr/local/bin/dummy.sh
sudo install -m 0644 dummy.service /etc/systemd/system/dummy.service
```

Reload systemd to recognize the new service:

```bash
sudo systemctl daemon-reload
```

## Start and Enable

Start the service immediately:

```bash
sudo systemctl start dummy
```

Enable automatic startup at boot:

```bash
sudo systemctl enable dummy
```

You can combine both commands:

```bash
sudo systemctl enable --now dummy
```

## Check Service Status

```bash
sudo systemctl status dummy
```

## View Logs

Follow logs in real time:

```bash
sudo journalctl -u dummy -f
```

View recent logs:

```bash
sudo journalctl -u dummy -n 20
```

View logs from the current boot:

```bash
sudo journalctl -u dummy -b
```

## Stop and Disable

Stop the currently running service:

```bash
sudo systemctl stop dummy
```

Disable automatic startup at boot:

```bash
sudo systemctl disable dummy
```

Stop and disable it together:

```bash
sudo systemctl disable --now dummy
```

## Test Automatic Restart

Find the process ID:

```bash
systemctl show -p MainPID --value dummy
```

Terminate the service process using its PID:

```bash
sudo kill -9 "$(systemctl show -p MainPID --value dummy)"
```

Check whether systemd restarts the service:

```bash
sudo systemctl status dummy
```

The service is configured with `Restart=always` and `RestartSec=5`, so systemd should restart it after an unexpected process termination.

## Learning Outcomes

- Understanding systemd unit files.
- Creating and installing custom services.
- Managing service lifecycle with `systemctl`.
- Configuring automatic startup and restart.
- Inspecting and troubleshooting service logs with `journalctl`.
