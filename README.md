# Resume

## Prerequiste

```bash
# Debian/Ubuntu
sudo apt install pandoc wkhtmltopdf
# Fedora
sudo dnf install pandoc wkhtmltopdf
```

## Build

Use `build.sh` script with `-d dev` or `-d prod`

- `dev`: build html, rebuild when `index.md` is modified
- `prod`: build html and pdf once

```bash
./build.sh -d dev
./build.sh -d prod
```
