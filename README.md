ubi-nzbget
=========
[![NZBGet CI/CD](https://github.com/CastawayEGR/ubi-nzbget/actions/workflows/build.yml/badge.svg)](https://github.com/CastawayEGR/ubi-nzbget/actions/workflows/build.yml)
[![Docker Repository on Quay](https://quay.io/repository/castawayegr/nzbget/status "Docker Repository on Quay")](https://quay.io/repository/castawayegr/nzbget)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/CastawayEGR/ubi-nzbget.svg?logoColor=brightgreen)](https://github.com/CastawayEGR/ubi-nzbget)
[![GitHub last commit](https://img.shields.io/github/last-commit/CastawayEGR/ubi-nzbget.svg?logoColor=brightgreen)](https://github.com/CastawayEGR/ubi-nzbget)

A RHEL UBI based image for NZBGET built to run rootless on OpenShift.

## Usage

```bash
podman run -d --name nzbget \
    -e TZ=America/New_York \
    -p 6789:6789 \
    -v $(pwd)/downloads:/downloads:Z \
    -v $(pwd)/config:/config:Z \
    quay.io/castawayegr/nzbget:latest 
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
