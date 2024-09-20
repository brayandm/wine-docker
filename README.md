# Wine Docker

Run Windows `.exe` programs through [Wine](https://www.winehq.org/) inside Docker containers, without installing Wine on the host system. Two Ubuntu 22.04-based images are provided, one for 32-bit Wine and one for 64-bit Wine, each with PulseAudio installed for sound support and X11 forwarding for GUI display.

## Structure

- `wine32` / `wine64`, Dockerfiles (based on `ubuntu:22.04`) that install `wine32`/`wine64` and `pulseaudio`.
- `build-wine32.sh` / `build-wine64.sh`, build the respective Docker images (`wine32:latest`, `wine64:latest`).
- `build.sh`, builds both images.
- `wine32.sh` / `wine64.sh`, run a container, mounting the host filesystem at `/host`, forwarding `DISPLAY` and PulseAudio, and executing the given `.exe` under Wine inside a per-directory `wine32files`/`wine64files` Wine prefix.
- `update-alias.sh`, adds/updates `xwine32` and `xwine64` shell aliases in `~/.bashrc` pointing at `wine32.sh`/`wine64.sh` in the repo directory.

## Setup

Build the Docker images:

```bash
bash build.sh
```

(or build them individually with `bash build-wine32.sh` / `bash build-wine64.sh`).

Add the `xwine32`/`xwine64` aliases to your `.bashrc`:

```bash
bash update-alias.sh
```

## Usage

Run a Windows executable with 32-bit Wine:

```bash
xwine32 <path-to-exe>
```

Run a Windows executable with 64-bit Wine:

```bash
xwine64 <path-to-exe>
```

## Notes

- Requires Docker, an X11 display, and a running PulseAudio server on the host.
- The `wine32.sh`/`wine64.sh` scripts mount the entire host root filesystem (`/`) into the container at `/host` so the target executable and its Wine prefix (created next to the current directory) can be accessed.
- These scripts contain a hardcoded `chown` path (`/host/home/brayand/Storage/Games`) reflecting the author's own setup and may need adjustment for other environments.
