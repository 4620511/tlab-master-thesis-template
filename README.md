# Master's Thesis Template for Taniguchi Lab, Tokyo University of Science

## NOTE

This is an unofficial template.

## Requires

- Docker (on x86_64)
- Docker Compose
- Visual Studio Code (w/ `ms-vscode-remote.remote-containers`)

## Usage

1. Clone this repository to your workspace.
2. Launch Visual Studio Code.
3. Open command palette and select `Remote-Containers: Open Folder in Container...`.
4. Write your thesis eternally...

## Build manually

You can build LaTeX files manually with GNU Make.

```bash
# build abstract.pdf and thesis.pdf
make

# build abstract.pdf only
make abstract.pdf

# build thesis.pdf only
make thesis.pdf
```

## Tips

### Upload your PDF file to GitHub Releases via command line

1. Install [ghr](https://github.com/tcnksm/ghr).
2. Get your GitHub personal access token via <https://github.com/settings/tokens>.
   - If your repository is private, you have to allow the `repo` scope.
3. Set the token as an environment variable `GITHUB_TOKEN`.
4. Run `ghr [version] thesis.pdf`.

### Use JIS standard characters

For example, "鮏" is JIS 3rd level Kanji, so LaTeX cannot display it.

```tex
\usepackage{otf}

\UTF{9B8F}川 矩義 助教
```
