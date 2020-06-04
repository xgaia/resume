# Resume

My resume, build with [Nikola](https://getnikola.com/)

## Installation

### Install dependencies

```bash
# Debian/Ubuntu
sudo apt install -y git make python3 python3-venv
# Fedora
sudo dnf install -y git make python3 python3-virtualenv
```

### Download and install website

```bash
git clone 
cd resume
make install
```

## Deployment

```bash
make build
```

This command generate HTML and PDF files in `output` directory


## Developement

### Serve website locally

```bash
make serve
```
